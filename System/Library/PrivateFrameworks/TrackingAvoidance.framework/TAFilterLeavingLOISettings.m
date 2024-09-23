@implementation TAFilterLeavingLOISettings

+ (id)defaultLeavingLOIEnabledLoiTypes
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

- (TAFilterLeavingLOISettings)initWithThresholdOfSignificantDuration:(double)a3 thresholdOfSignificantDistance:(double)a4 filterVisitsSettings:(id)a5 enabledLoiTypes:(id)a6 leavingHomeImmediacyType:(unint64_t)a7 leavingWorkImmediacyType:(unint64_t)a8
{
  id v15;
  id v16;
  TAFilterLeavingLOISettings *v17;
  TAFilterLeavingLOISettings *v18;
  uint64_t v19;
  NSSet *enabledLoiTypes;
  void *v21;
  NSObject *v22;
  void *v23;
  TAFilterLeavingLOISettings *v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v15 = a5;
  v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)TAFilterLeavingLOISettings;
  v17 = -[TAFilterLeavingLOISettings init](&v26, sel_init);
  v18 = v17;
  if (v17)
  {
    if (!v15)
    {
      v24 = 0;
      goto LABEL_7;
    }
    v17->_thresholdOfSignificantDuration = a3;
    v17->_thresholdOfSignificantDistance = a4;
    objc_storeStrong((id *)&v17->_visitsSettings, a5);
    v19 = objc_msgSend(v16, "copy");
    enabledLoiTypes = v18->_enabledLoiTypes;
    v18->_enabledLoiTypes = (NSSet *)v19;

    v18->_leavingHomeImmediacyType = a7;
    v18->_leavingWorkImmediacyType = a8;
    v21 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      -[TAFilterLeavingLOISettings enabledLoiTypesToString](v18, "enabledLoiTypesToString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v28 = v23;
      _os_log_impl(&dword_217877000, v22, OS_LOG_TYPE_DEFAULT, "#TAFilterLeavingLOI enabled LOI types: %{private}@", buf, 0xCu);

    }
  }
  v24 = v18;
LABEL_7:

  return v24;
}

- (TAFilterLeavingLOISettings)initWithThresholdOfSignificantDurationOrDefault:(id)a3 thresholdOfSignificantDistanceOrDefault:(id)a4 filterVisitsSettingsOrDefault:(id)a5 enabledLoiTypesOrDefault:(id)a6 leavingHomeImmediacyTypeOrDefault:(id)a7 leavingWorkImmediacyTypeOrDefault:(id)a8
{
  id v14;
  id v15;
  TAFilterVisitsSettings *v16;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  TAFilterVisitsSettings *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  TAFilterLeavingLOISettings *v28;

  v14 = a3;
  v15 = a4;
  v16 = (TAFilterVisitsSettings *)a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v21 = v20;
    if (v15)
    {
LABEL_3:
      objc_msgSend(v15, "doubleValue");
      v23 = v22;
      goto LABEL_6;
    }
  }
  else
  {
    v21 = 300.0;
    if (v15)
      goto LABEL_3;
  }
  v23 = 420.0;
LABEL_6:
  v24 = v16;
  if (!v16)
    v24 = -[TAFilterVisitsSettings initWithDefaults]([TAFilterVisitsSettings alloc], "initWithDefaults");
  v25 = v17;
  if (v17)
  {
    if (v18)
      goto LABEL_10;
LABEL_13:
    v26 = 3;
    if (v19)
      goto LABEL_11;
    goto LABEL_14;
  }
  +[TAFilterLeavingLOISettings defaultLeavingLOIEnabledLoiTypes](TAFilterLeavingLOISettings, "defaultLeavingLOIEnabledLoiTypes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_13;
LABEL_10:
  v26 = objc_msgSend(v18, "unsignedIntValue");
  if (v19)
  {
LABEL_11:
    v27 = objc_msgSend(v19, "unsignedIntValue");
    goto LABEL_15;
  }
LABEL_14:
  v27 = 3;
LABEL_15:
  v28 = -[TAFilterLeavingLOISettings initWithThresholdOfSignificantDuration:thresholdOfSignificantDistance:filterVisitsSettings:enabledLoiTypes:leavingHomeImmediacyType:leavingWorkImmediacyType:](self, "initWithThresholdOfSignificantDuration:thresholdOfSignificantDistance:filterVisitsSettings:enabledLoiTypes:leavingHomeImmediacyType:leavingWorkImmediacyType:", v24, v25, v26, v27, v21, v23);
  if (!v17)
  {

    if (v16)
      goto LABEL_17;
LABEL_19:

    goto LABEL_17;
  }
  if (!v16)
    goto LABEL_19;
LABEL_17:

  return v28;
}

- (TAFilterLeavingLOISettings)initWithDefaults
{
  TAFilterVisitsSettings *v3;
  void *v4;
  TAFilterLeavingLOISettings *v5;

  v3 = -[TAFilterVisitsSettings initWithDefaults]([TAFilterVisitsSettings alloc], "initWithDefaults");
  +[TAFilterLeavingLOISettings defaultLeavingLOIEnabledLoiTypes](TAFilterLeavingLOISettings, "defaultLeavingLOIEnabledLoiTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TAFilterLeavingLOISettings initWithThresholdOfSignificantDuration:thresholdOfSignificantDistance:filterVisitsSettings:enabledLoiTypes:leavingHomeImmediacyType:leavingWorkImmediacyType:](self, "initWithThresholdOfSignificantDuration:thresholdOfSignificantDistance:filterVisitsSettings:enabledLoiTypes:leavingHomeImmediacyType:leavingWorkImmediacyType:", v3, v4, 3, 3, 300.0, 420.0);

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
  v8[2] = __53__TAFilterLeavingLOISettings_enabledLoiTypesToString__block_invoke;
  v8[3] = &unk_24D814FA0;
  v9 = v3;
  v5 = v3;
  -[NSSet enumerateObjectsUsingBlock:](enabledLoiTypes, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __53__TAFilterLeavingLOISettings_enabledLoiTypesToString__block_invoke(uint64_t a1, void *a2)
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

- (NSSet)enabledLoiTypes
{
  return self->_enabledLoiTypes;
}

- (unint64_t)leavingHomeImmediacyType
{
  return self->_leavingHomeImmediacyType;
}

- (unint64_t)leavingWorkImmediacyType
{
  return self->_leavingWorkImmediacyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledLoiTypes, 0);
  objc_storeStrong((id *)&self->_visitsSettings, 0);
}

@end
