@implementation PGEventLabelingConfigurationWrapper

- (PGEventLabelingConfigurationWrapper)init
{
  PGEventLabelingConfigurationWrapper *v2;
  PGEventLabelingConfiguration *v3;
  PGEventLabelingConfiguration *configuration;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGEventLabelingConfigurationWrapper;
  v2 = -[PGEventLabelingConfigurationWrapper init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PGEventLabelingConfiguration);
    configuration = v2->_configuration;
    v2->_configuration = v3;

  }
  return v2;
}

- (id)meaningLabelsForEventLabeling
{
  return -[PGEventLabelingConfiguration meaningLabels](self->_configuration, "meaningLabels");
}

- (double)highPrecisionThresholdForMeaningLabel:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[PGEventLabelingConfiguration thresholdsBy:](self->_configuration, "thresholdsBy:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highPrecisionThreshold");
  v5 = v4;

  return v5;
}

- (double)highRecallThresholdForMeaningLabel:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[PGEventLabelingConfiguration thresholdsBy:](self->_configuration, "thresholdsBy:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highRecallThreshold");
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (BOOL)isEventLabelingEnabled
{
  return +[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled");
}

+ (BOOL)usePrimaryMeaningDomainForEventLabelingMeanings
{
  return +[PGEventLabelingConfiguration usePrimaryMeaningDomainForEventLabelingMeanings](PGEventLabelingConfiguration, "usePrimaryMeaningDomainForEventLabelingMeanings");
}

@end
