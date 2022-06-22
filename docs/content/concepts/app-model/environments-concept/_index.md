---
type: docs
title: "Environments concept"
linkTitle: "Environments"
description: "Learn about Radius Environments"
weight: 300
---
<!-- TODO retire this page. move this topic's fresh content to either Concepts.Overview or Concepts.Architecture. -->

Environments are the combination of two things:

- A **control-plane** which communicates with the rad CLI
- A **runtime** to which applications are deployed

## Control plane

The Radius control plane accepts application specs and deploys them into the data plane. Each platform has a different implementation, but the end result is that the rad CLI can deploy applications into the environment using the [`rad deploy`]({{< ref rad_deploy >}}) command. This ensures that Radius applications are portable across environments.

For example, in [Microsoft Azure]({{< ref azure-environments >}}) the Radius control plane is the combination of an Azure Resource Manager (ARM) custom provider and an Azure App Service that orchestrates the deployment of Radius applications and components.

## Runtime

The Radius runtime is where Radius applications are deployed. It contains the container runtimes, database accounts, and other infrastructure into which Radius components and managed resources are deployed.

For example, in [Microsoft Azure]({{< ref azure-environments>}}) the Radius runtime is a Resource Group containing an Azure Kubernetes Service (AKS) cluster for running container components and other resources deployed as part of a Radius application.