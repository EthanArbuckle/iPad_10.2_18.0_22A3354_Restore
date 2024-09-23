@implementation TAFilterSingleVisitSettings

- (NSSet)enabledLoiTypes
{
  return self->_enabledLoiTypes;
}

+ (id)defaultSingleVisitEnabledLoiTypes
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDBCF20]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", 2);
  v5 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, 0);

  return v5;
}

- (TAFilterSingleVisitSettings)initWithThresholdOfSignificantDuration:(double)a3 thresholdOfSignificantDistance:(double)a4 filterVisitsSettings:(id)a5 enabledLoiTypes:(id)a6 arrivingWorkImmediacyType:(unint64_t)a7
{
  id v13;
  id v14;
  TAFilterSingleVisitSettings *v15;
  TAFilterSingleVisitSettings *v16;
  uint64_t v17;
  NSSet *enabledLoiTypes;
  void *v19;
  NSObject *v20;
  void *v21;
  TAFilterSingleVisitSettings *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TAFilterSingleVisitSettings;
  v15 = -[TAFilterSingleVisitSettings init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    if (!v13)
    {
      v22 = 0;
      goto LABEL_7;
    }
    v15->_thresholdOfSignificantDuration = a3;
    v15->_thresholdOfSignificantDistance = a4;
    objc_storeStrong((id *)&v15->_visitsSettings, a5);
    v17 = objc_msgSend(v14, "copy");
    enabledLoiTypes = v16->_enabledLoiTypes;
    v16->_enabledLoiTypes = (NSSet *)v17;

    v16->_arrivingWorkImmediacyType = a7;
    v19 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      -[TAFilterSingleVisitSettings enabledLoiTypesToString](v16, "enabledLoiTypesToString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v26 = v21;
      _os_log_impl(&dword_217877000, v20, OS_LOG_TYPE_DEFAULT, "#TAFilterSingleVisit enabled LOI types: %{private}@", buf, 0xCu);

    }
  }
  v22 = v16;
LABEL_7:

  return v22;
}

- (TAFilterSingleVisitSettings)initWithThresholdOfSignificantDurationOrDefault:(id)a3 thresholdOfSignificantDistanceOrDefault:(id)a4 filterVisitsSettingsOrDefault:(id)a5 enabledLoiTypesOrDefault:(id)a6 arrivingWorkImmediacyTypeOrDefault:(id)a7
{
  id v12;
  id v13;
  TAFilterVisitsSettings *v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  TAFilterVisitsSettings *v21;
  void *v22;
  uint64_t v23;
  TAFilterSingleVisitSettings *v24;

  v12 = a3;
  v13 = a4;
  v14 = (TAFilterVisitsSettings *)a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    objc_msgSend(v12, "doubleValue");
    v18 = v17;
    if (v13)
    {
LABEL_3:
      objc_msgSend(v13, "doubleValue");
      v20 = v19;
      goto LABEL_6;
    }
  }
  else
  {
    v18 = 300.0;
    if (v13)
      goto LABEL_3;
  }
  v20 = 420.0;
LABEL_6:
  v21 = v14;
  if (!v14)
    v21 = -[TAFilterVisitsSettings initWithDefaults]([TAFilterVisitsSettings alloc], "initWithDefaults");
  v22 = v15;
  if (v15)
  {
    if (v16)
    {
LABEL_10:
      v23 = objc_msgSend(v16, "unsignedIntValue");
      goto LABEL_13;
    }
  }
  else
  {
    +[TAFilterSingleVisitSettings defaultSingleVisitEnabledLoiTypes](TAFilterSingleVisitSettings, "defaultSingleVisitEnabledLoiTypes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      goto LABEL_10;
  }
  v23 = 3;
LABEL_13:
  v24 = -[TAFilterSingleVisitSettings initWithThresholdOfSignificantDuration:thresholdOfSignificantDistance:filterVisitsSettings:enabledLoiTypes:arrivingWorkImmediacyType:](self, "initWithThresholdOfSignificantDuration:thresholdOfSignificantDistance:filterVisitsSettings:enabledLoiTypes:arrivingWorkImmediacyType:", v21, v22, v23, v18, v20);
  if (!v15)
  {

    if (v14)
      goto LABEL_15;
LABEL_17:

    goto LABEL_15;
  }
  if (!v14)
    goto LABEL_17;
LABEL_15:

  return v24;
}

- (TAFilterSingleVisitSettings)initWithDefaults
{
  TAFilterVisitsSettings *v3;
  void *v4;
  TAFilterSingleVisitSettings *v5;

  v3 = -[TAFilterVisitsSettings initWithDefaults]([TAFilterVisitsSettings alloc], "initWithDefaults");
  +[TAFilterSingleVisitSettings defaultSingleVisitEnabledLoiTypes](TAFilterSingleVisitSettings, "defaultSingleVisitEnabledLoiTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TAFilterSingleVisitSettings initWithThresholdOfSignificantDuration:thresholdOfSignificantDistance:filterVisitsSettings:enabledLoiTypes:arrivingWorkImmediacyType:](self, "initWithThresholdOfSignificantDuration:thresholdOfSignificantDistance:filterVisitsSettings:enabledLoiTypes:arrivingWorkImmediacyType:", v3, v4, 3, 300.0, 420.0);

  return v5;
}

- (id)enabledLoiTypesToString
{
  void *v3;
  NSSet *enabledLoiTypes;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  enabledLoiTypes = self->_enabledLoiTypes;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__TAFilterSingleVisitSettings_enabledLoiTypesToString__block_invoke;
  v8[3] = &unk_24D814FA0;
  v9 = v3;
  v5 = v3;
  -[NSSet enumerateObjectsUsingBlock:](enabledLoiTypes, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __54__TAFilterSingleVisitSettings_enabledLoiTypesToString__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  TALocationOfInterestTypeToString(objc_msgSend(a2, "unsignedIntegerValue"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (double)thresholdOfSignificantDuration
{
  return self->_thresholdOfSignificantDuration;
}

- (double)thresholdOfSignificantDistance
{
  return self->_thresholdOfSignificantDistance;
}

- (TAFilterVisitsSettings)visitsSettings
{
  return self->_visitsSettings;
}

- (unint64_t)arrivingWorkImmediacyType
{
  return self->_arrivingWorkImmediacyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledLoiTypes, 0);
  objc_storeStrong((id *)&self->_visitsSettings, 0);
}

@end
