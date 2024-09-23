@implementation APJourneyBatchSettings

- (unint64_t)batchSizeUInteger
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APJourneyBatchSettings batchSize](self, "batchSize"));
  v3 = objc_msgSend(v2, "integerValue");

  return (unint64_t)v3;
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (APJourneyBatchSettings)init
{
  APJourneyBatchSettings *v2;
  id v3;
  void *v4;
  NSNumber *batchSize;
  NSNumber *periodicDelay;
  void *v7;
  uint64_t v8;
  NSNumber *v9;
  void *v10;
  uint64_t v11;
  NSNumber *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)APJourneyBatchSettings;
  v2 = -[APJourneyBatchSettings init](&v14, "init");
  if (v2)
  {
    v3 = +[APConfigurationMediator configurationForClass:](APConfigurationMediator, "configurationForClass:", objc_opt_class(APECSettingsConfig));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    batchSize = v2->_batchSize;
    v2->_batchSize = (NSNumber *)&off_100229AF8;

    periodicDelay = v2->_periodicDelay;
    v2->_periodicDelay = (NSNumber *)&off_100229B10;

    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "periodicDelay"));

      if (v7)
      {
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "periodicDelay"));
        v9 = v2->_periodicDelay;
        v2->_periodicDelay = (NSNumber *)v8;

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "periodicDelay"));

      if (v10)
      {
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "batchSize"));
        v12 = v2->_batchSize;
        v2->_batchSize = (NSNumber *)v11;

      }
    }

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicDelay, 0);
  objc_storeStrong((id *)&self->_batchSize, 0);
}

- (double)periodicDelayTimeInterval
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APJourneyBatchSettings periodicDelay](self, "periodicDelay"));
  objc_msgSend(v2, "doubleValue");
  v4 = (double)(unint64_t)v3;

  return v4;
}

- (void)setBatchSize:(id)a3
{
  objc_storeStrong((id *)&self->_batchSize, a3);
}

- (NSNumber)periodicDelay
{
  return self->_periodicDelay;
}

- (void)setPeriodicDelay:(id)a3
{
  objc_storeStrong((id *)&self->_periodicDelay, a3);
}

@end
