@implementation APDeliveryObservability

- (int64_t)successCount
{
  return self->_successCount;
}

- (void)setSuccessCount:(int64_t)a3
{
  self->_successCount = a3;
}

- (void)setBackoffIndex:(int64_t)a3
{
  self->_backoffIndex = a3;
}

- (void)recordSuccess
{
  -[APDeliveryObservability setSuccessCount:](self, "setSuccessCount:", (char *)-[APDeliveryObservability successCount](self, "successCount") + 1);
  -[APDeliveryObservability setBackoffIndex:](self, "setBackoffIndex:", 0);
}

- (APDeliveryObservability)initWithTransmitter:(id)a3
{
  id v5;
  APDeliveryObservability *v6;
  APDeliveryObservability *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APDeliveryObservability;
  v6 = -[APDeliveryObservability init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transmitter, a3);
    v7->_successCount = 0;
    v7->_backoffIndex = 0;
  }

  return v7;
}

- (void)recordFailure:(int64_t)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDeliveryObservability transmitter](self, "transmitter"));
  objc_msgSend(v5, "sendDeliveryEventWithError:successCount:backoffIndex:", a3, -[APDeliveryObservability successCount](self, "successCount"), -[APDeliveryObservability backoffIndex](self, "backoffIndex"));

  -[APDeliveryObservability setSuccessCount:](self, "setSuccessCount:", 0);
  -[APDeliveryObservability setBackoffIndex:](self, "setBackoffIndex:", (char *)-[APDeliveryObservability backoffIndex](self, "backoffIndex") + 1);
}

- (APDeliveryObservabilityTransmitter)transmitter
{
  return self->_transmitter;
}

- (void)setTransmitter:(id)a3
{
  objc_storeStrong((id *)&self->_transmitter, a3);
}

- (int64_t)backoffIndex
{
  return self->_backoffIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transmitter, 0);
}

@end
