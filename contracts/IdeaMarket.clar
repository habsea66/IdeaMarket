;; IdeaMarket: A decentralized voting platform for innovative ideas
;; Core Data Structures
(define-map endorsements principal uint)  ;; Tracks users and their endorsed ideas
(define-map concepts uint uint)           ;; Tracks ideas and their endorsement counts
(define-data-var concept-counter uint u0) ;; Keeps count of total registered ideas

;; Public function to register a new innovative idea
(define-public (register-concept)
  (let ((concept-id (+ (var-get concept-counter) u1)))
    (map-set concepts concept-id u0)      ;; Initialize endorsements for the new idea to 0
    (var-set concept-counter concept-id)  ;; Increment concept-counter
    (ok concept-id)
  )
)

;; Public function to endorse an idea
(define-public (endorse (concept-id uint))
  (let ((supporter tx-sender))
    (if (is-some (map-get? endorsements supporter))
        (err u1000)  ;; Error: User has already endorsed an idea
        (if (is-none (map-get? concepts concept-id))
            (err u1001)  ;; Error: Concept does not exist
            (begin
              ;; Register the user's endorsement
              (map-set endorsements supporter concept-id)
              ;; Increment the concept's endorsement count
              (map-set concepts concept-id (+ (default-to u0 (map-get? concepts concept-id)) u1))
              (ok concept-id)
            )
        )
    )
  )
)

;; Read-only function to get total endorsements for a concept
(define-read-only (get-endorsements (concept-id uint))
  (default-to u0 (map-get? concepts concept-id))
)

;; Read-only function to check if a user has endorsed
(define-read-only (has-endorsed (supporter principal))
  (is-some (map-get? endorsements supporter))
)

;; Read-only function to get the total number of concepts
(define-read-only (get-concept-count)
  (var-get concept-counter)
)

;; Read-only function to compare two values
(define-read-only (compare-max (a uint) (b uint))
  (if (>= a b)
      a
      b
  )
)