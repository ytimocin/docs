import radius as radius

@description('The ID of your Radius environment. Automatically injected by the rad CLI.')
param environment string

resource app 'Applications.Core/applications@2023-10-01-preview' = {
  name: 'azure-resources-dapr-pubsub-generic'
  properties: {
    environment: environment
  }
}

resource publisher 'Applications.Core/containers@2023-10-01-preview' = {
  name: 'publisher'
  properties: {
    application: app.id
    connections: {
      daprpubsub: {
        source: pubsub.id
      }
    }
    container: {
      image: 'radius.azurecr.io/magpie:latest'
    }
  }
}

resource kafkaRoute 'Applications.Core/httpRoutes@2023-10-01-preview' existing = {
  name: 'kafka-route'
}

//SAMPLE
resource pubsub 'Applications.Dapr/pubSubBrokers@2023-10-01-preview' = {
  name: 'pubsub'
  properties: {
    environment: environment
    application: app.id
    resourceProvisioning: 'manual'
    resources: [
      { id: kafkaRoute.id }
    ]
    type: 'pubsub.kafka'
    metadata: {
      brokers: kafkaRoute.properties.url
      authRequired: false
      consumeRetryInternal: 1024
    }
    version: 'v1'
  }
}
//SAMPLE