@implementation WFLocationParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFLocationParameter)initWithDefinition:(id)a3
{
  id v4;
  WFLocationParameter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  WFLocationParameter *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFLocationParameter;
  v5 = -[WFParameter initWithDefinition:](&v24, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AllowTextOnly"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsTextOnlyLocations = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("SkipProcessingCurrentLocation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    WFEnforceClass(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_skipsProcessingCurrentLocation = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("DefaultToCurrentLocation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    WFEnforceClass(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_defaultToCurrentLocation = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("AllowCurrentLocation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    WFEnforceClass(v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = (void *)MEMORY[0x1E0C9AAB0];
    if (v17)
      v19 = (void *)v17;
    v20 = v19;

    v21 = objc_msgSend(v20, "BOOLValue");
    v5->_allowsCurrentLocation = v21;
    v22 = v5;
  }

  return v5;
}

- (double)currentLocationAccuracy
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  -[WFParameter definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CurrentLocationAccuracy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    WFCLLocationAccuracyFromWFLocationAccuracy(v5);
  else
    getkCLLocationAccuracyNearestTenMeters();
  v7 = v6;

  return v7;
}

- (id)defaultSerializedRepresentation
{
  WFLocationValue *v2;
  void *v3;

  if (self->_defaultToCurrentLocation)
  {
    v2 = -[WFLocationValue initWithCurrentLocation]([WFLocationValue alloc], "initWithCurrentLocation");
    -[WFLocationValue serializedRepresentation](v2, "serializedRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)allowsTextOnlyLocations
{
  return self->_allowsTextOnlyLocations;
}

- (BOOL)allowsCurrentLocation
{
  return self->_allowsCurrentLocation;
}

- (BOOL)skipsProcessingCurrentLocation
{
  return self->_skipsProcessingCurrentLocation;
}

- (BOOL)defaultToCurrentLocation
{
  return self->_defaultToCurrentLocation;
}

@end
