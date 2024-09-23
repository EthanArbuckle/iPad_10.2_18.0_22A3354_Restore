@implementation PETDistributionEventTracker

- (PETDistributionEventTracker)initWithFeatureId:(id)a3 event:(id)a4 registerProperties:(id)a5
{
  return -[PETDistributionEventTracker initWithFeatureId:event:registerProperties:propertySubsets:](self, "initWithFeatureId:event:registerProperties:propertySubsets:", a3, a4, a5, MEMORY[0x1E0C9AA60]);
}

- (PETDistributionEventTracker)initWithFeatureId:(id)a3 event:(id)a4 registerProperties:(id)a5 propertySubsets:(id)a6
{
  id v10;
  PETDistributionEventTracker *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *event;
  objc_super v18;

  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PETDistributionEventTracker;
  v11 = -[PETEventTracker initWithFeatureId:registerProperties:propertySubsets:](&v18, sel_initWithFeatureId_registerProperties_propertySubsets_, a3, a5, a6);
  if (v11)
  {
    if (!+[PETEventStringValidator stringIsValid:](PETEventStringValidator, "stringIsValid:", v10))
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("event may only contain [a-zA-Z0-9_] and may not be prefixed with _: %@"), v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "raise");
    }
    v15 = objc_msgSend(v10, "copy");
    event = v11->_event;
    v11->_event = (NSString *)v15;

    -[PETEventTracker _checkCardinalityForEvent:](v11, "_checkCardinalityForEvent:", v10);
    -[PETEventTracker _checkKeyLengthForEvent:metaData:](v11, "_checkKeyLengthForEvent:metaData:", v10, 0);
  }

  return v11;
}

- (void)trackEventWithPropertyValues:(id)a3 value:(double)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[PETDistributionEventTracker event](self, "event");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETEventTracker _trackEvent:withPropertyValues:value:](self, "_trackEvent:withPropertyValues:value:", v8, v6, v7);

}

- (void)_logValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PETEventTracker loggingOutlet](self, "loggingOutlet");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  -[PETEventTracker featureId](self, "featureId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logDoubleValue:forEvent:featureId:stringifiedProperties:metaData:", v12, v16, v11, v10, v15);

}

- (NSString)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
