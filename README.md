# IdeaMarket

A decentralized platform for sharing and endorsing innovative ideas built on Clarity smart contracts.

## Overview

IdeaMarket enables communities to collaboratively identify and promote the most promising innovative concepts. Users can register new ideas and endorse existing ones, with each user limited to one endorsement to ensure fair voting distribution.

## Key Features

- **Concept Registration**: Any user can register a new innovative concept
- **Endorsement System**: Users can endorse concepts they find valuable
- **One-Endorsement Policy**: Each user is allowed one endorsement to prevent manipulation
- **Endorsement Tracking**: View the popularity of any registered concept
- **Transparent Governance**: All endorsements are publicly verifiable on-chain

## Technical Implementation

The platform is built on Clarity smart contracts with the following core functions:

- `register-concept`: Register a new concept in the marketplace
- `endorse`: Endorse a specific concept (limited to one per user)
- `get-endorsements`: View the total endorsements for any concept
- `has-endorsed`: Check if a specific user has already endorsed
- `get-concept-count`: Get the total number of registered concepts
- `compare-max`: Utility function for comparing values

## Getting Started

1. Clone this repository
2. Deploy the contract using Clarinet or other Stacks deployment tools
3. Interact with the contract using the provided functions
