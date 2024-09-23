@implementation PETGoalConversionEventTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionEvent, 0);
  objc_storeStrong((id *)&self->_opportunityEvent, 0);
}

- (void)trackGoalOpportunityEventWithConversion:(BOOL)a3 propertyValues:(id)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  -[PETGoalConversionEventTracker trackGoalOpportunityEventWithPropertyValues:](self, "trackGoalOpportunityEventWithPropertyValues:");
  if (v4)
    -[PETGoalConversionEventTracker trackGoalConversionEventWithPropertyValues:](self, "trackGoalConversionEventWithPropertyValues:", v6);

}

- (id)_keyMetadataForEvent:(id)a3
{
  id v4;
  PETStringPairs *v5;
  void *v6;
  void *v7;
  PETStringPairs *v8;
  NSString *opportunityEvent;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", self->_opportunityEvent))
  {
    v5 = [PETStringPairs alloc];
    v11[0] = self->_conversionEvent;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = &unk_1E2A49D00;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", self->_conversionEvent))
    {
      v8 = 0;
      goto LABEL_7;
    }
    v5 = [PETStringPairs alloc];
    opportunityEvent = self->_opportunityEvent;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &opportunityEvent, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = &unk_1E2A49D18;
  }
  v8 = -[PETStringPairs initWithKeys:values:](v5, "initWithKeys:values:", v7, v6);

LABEL_7:
  return v8;
}

- (void)_logValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PETEventTracker loggingOutlet](self, "loggingOutlet");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  -[PETEventTracker featureId](self, "featureId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logUnsignedIntegerValue:forEvent:featureId:stringifiedProperties:metaData:", v14, v12, v15, v11, v10);

}

- (void)trackGoalConversionEventWithPropertyValues:(id)a3
{
  -[PETEventTracker _trackEvent:withPropertyValues:value:](self, "_trackEvent:withPropertyValues:value:", self->_conversionEvent, a3, &unk_1E2A49B28);
}

- (void)trackGoalOpportunityEventWithPropertyValues:(id)a3
{
  -[PETEventTracker _trackEvent:withPropertyValues:value:](self, "_trackEvent:withPropertyValues:value:", self->_opportunityEvent, a3, &unk_1E2A49B28);
}

- (PETGoalConversionEventTracker)initWithFeatureId:(id)a3 opportunityEvent:(id)a4 conversionEvent:(id)a5 registerProperties:(id)a6
{
  return -[PETGoalConversionEventTracker initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:propertySubsets:](self, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:propertySubsets:", a3, a4, a5, a6, MEMORY[0x1E0C9AA60]);
}

- (PETGoalConversionEventTracker)initWithFeatureId:(id)a3 opportunityEvent:(id)a4 conversionEvent:(id)a5 registerProperties:(id)a6 propertySubsets:(id)a7
{
  id v12;
  id v13;
  PETGoalConversionEventTracker *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *opportunityEvent;
  uint64_t v20;
  NSString *conversionEvent;
  NSString *v22;
  void *v23;
  objc_super v25;

  v12 = a4;
  v13 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PETGoalConversionEventTracker;
  v14 = -[PETEventTracker initWithFeatureId:registerProperties:propertySubsets:](&v25, sel_initWithFeatureId_registerProperties_propertySubsets_, a3, a6, a7);
  if (v14)
  {
    if (!+[PETEventStringValidator stringIsValid:](PETEventStringValidator, "stringIsValid:", v12)
      || !+[PETEventStringValidator stringIsValid:](PETEventStringValidator, "stringIsValid:", v13))
    {
      v15 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("opportunityEvent, and conversionEvent may only contain [a-zA-Z0-9_] and may not be prefixed with _: %@, %@"), v12, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "exceptionWithName:reason:userInfo:", CFSTR("EventTrackerException"), v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "raise");
    }
    v18 = objc_msgSend(v12, "copy");
    opportunityEvent = v14->_opportunityEvent;
    v14->_opportunityEvent = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    conversionEvent = v14->_conversionEvent;
    v14->_conversionEvent = (NSString *)v20;

    -[PETEventTracker _checkCardinalityForEvent:](v14, "_checkCardinalityForEvent:", v14->_opportunityEvent);
    v22 = v14->_conversionEvent;
    -[PETGoalConversionEventTracker _keyMetadataForEvent:](v14, "_keyMetadataForEvent:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PETEventTracker _checkKeyLengthForEvent:metaData:](v14, "_checkKeyLengthForEvent:metaData:", v22, v23);

  }
  return v14;
}

- (NSString)opportunityEvent
{
  return self->_opportunityEvent;
}

- (NSString)conversionEvent
{
  return self->_conversionEvent;
}

@end
