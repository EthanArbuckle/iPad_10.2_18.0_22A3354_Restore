@implementation TAFilterVisitsSettings

+ (id)defaultVisitsSensitiveLOITypes
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDBCF20]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", 1);
  v4 = (void *)objc_msgSend(v2, "initWithObjects:", v3, 0);

  return v4;
}

- (TAFilterVisitsSettings)initWithMaxSuspiciousDuration:(double)a3 minInterVisitDistance:(double)a4 minNSigmaBetweenVisits:(unint64_t)a5 entryDisplayOnBudget:(double)a6 exitDisplayOnBudget:(double)a7 sensitiveLOITypes:(id)a8 minObservationInterval:(double)a9 threeVisitImmediacyType:(unint64_t)a10
{
  id v18;
  TAFilterVisitsSettings *v19;
  TAFilterVisitsSettings *v20;
  uint64_t v21;
  NSSet *sensitiveLOITypes;
  objc_super v24;

  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)TAFilterVisitsSettings;
  v19 = -[TAFilterVisitsSettings init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_maxSuspiciousDuration = a3;
    v19->_minInterVisitDistance = a4;
    v19->_minNSigmaBetweenVisits = a5;
    v19->_entryDisplayOnBudget = a6;
    v19->_exitDisplayOnBudget = a7;
    v21 = objc_msgSend(v18, "copy");
    sensitiveLOITypes = v20->_sensitiveLOITypes;
    v20->_sensitiveLOITypes = (NSSet *)v21;

    v20->_minObservationInterval = a9;
    v20->_threeVisitImmediacyType = a10;
  }

  return v20;
}

- (TAFilterVisitsSettings)initWithDefaults
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  TAFilterVisitsSettings *v8;

  +[TAFilterVisitsSettings _determinDefaultEntryDisplayOnBudget](TAFilterVisitsSettings, "_determinDefaultEntryDisplayOnBudget");
  v4 = v3;
  +[TAFilterVisitsSettings _determinDefaultExitDisplayOnBudget](TAFilterVisitsSettings, "_determinDefaultExitDisplayOnBudget");
  v6 = v5;
  +[TAFilterVisitsSettings defaultVisitsSensitiveLOITypes](TAFilterVisitsSettings, "defaultVisitsSensitiveLOITypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TAFilterVisitsSettings initWithMaxSuspiciousDuration:minInterVisitDistance:minNSigmaBetweenVisits:entryDisplayOnBudget:exitDisplayOnBudget:sensitiveLOITypes:minObservationInterval:threeVisitImmediacyType:](self, "initWithMaxSuspiciousDuration:minInterVisitDistance:minNSigmaBetweenVisits:entryDisplayOnBudget:exitDisplayOnBudget:sensitiveLOITypes:minObservationInterval:threeVisitImmediacyType:", 2, v7, 3, 300.0, 100.0, v4, v6, 300.0);

  return v8;
}

- (TAFilterVisitsSettings)initWithMaxSuspiciousDurationOrDefault:(id)a3 minInterVisitDistanceOrDefault:(id)a4 minNSigmaBetweenVisitsOrDefault:(id)a5 entryDisplayOnBudgetOrDefault:(id)a6 exitDisplayOnBudgetOrDefault:(id)a7 sensitiveLOITypesOrDefault:(id)a8 minObservationIntervalOrDefault:(id)a9 threeVisitImmediacyTypeOrDefault:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  TAFilterVisitsSettings *v36;
  uint64_t v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (v15)
  {
    objc_msgSend(v15, "doubleValue");
    v24 = v23;
    if (v16)
      goto LABEL_3;
LABEL_6:
    v26 = 100.0;
    if (v17)
      goto LABEL_4;
    goto LABEL_7;
  }
  v24 = 300.0;
  if (!v16)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v16, "doubleValue");
  v26 = v25;
  if (v17)
  {
LABEL_4:
    v27 = objc_msgSend(v17, "unsignedIntValue");
    goto LABEL_8;
  }
LABEL_7:
  v27 = 2;
LABEL_8:
  v38 = v27;
  if (v18)
    objc_msgSend(v18, "doubleValue");
  else
    +[TAFilterVisitsSettings _determinDefaultEntryDisplayOnBudget](TAFilterVisitsSettings, "_determinDefaultEntryDisplayOnBudget");
  v29 = v28;
  if (v19)
    objc_msgSend(v19, "doubleValue");
  else
    +[TAFilterVisitsSettings _determinDefaultExitDisplayOnBudget](TAFilterVisitsSettings, "_determinDefaultExitDisplayOnBudget");
  v31 = v30;
  v32 = v20;
  if (v20)
  {
    if (v21)
      goto LABEL_16;
LABEL_19:
    v34 = 300.0;
    if (v22)
      goto LABEL_17;
    goto LABEL_20;
  }
  +[TAFilterVisitsSettings defaultVisitsSensitiveLOITypes](TAFilterVisitsSettings, "defaultVisitsSensitiveLOITypes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_19;
LABEL_16:
  objc_msgSend(v21, "doubleValue", v38);
  v34 = v33;
  if (v22)
  {
LABEL_17:
    v35 = objc_msgSend(v22, "unsignedIntValue", v38);
    goto LABEL_21;
  }
LABEL_20:
  v35 = 3;
LABEL_21:
  v36 = -[TAFilterVisitsSettings initWithMaxSuspiciousDuration:minInterVisitDistance:minNSigmaBetweenVisits:entryDisplayOnBudget:exitDisplayOnBudget:sensitiveLOITypes:minObservationInterval:threeVisitImmediacyType:](self, "initWithMaxSuspiciousDuration:minInterVisitDistance:minNSigmaBetweenVisits:entryDisplayOnBudget:exitDisplayOnBudget:sensitiveLOITypes:minObservationInterval:threeVisitImmediacyType:", v38, v32, v35, v24, v26, v29, v31, v34, v38);
  if (!v20)

  return v36;
}

+ (BOOL)_isLegacyHardware
{
  if ((MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0
    || (MGIsDeviceOfType() & 1) != 0)
  {
    return 1;
  }
  else
  {
    return MGIsDeviceOfType();
  }
}

+ (double)_determinDefaultEntryDisplayOnBudget
{
  NSObject *v2;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!+[TAFilterVisitsSettings _isLegacyHardware](TAFilterVisitsSettings, "_isLegacyHardware"))
    return 120.0;
  v2 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl(&dword_217877000, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAFilterVisits using special parameters for entry display-on budget for legacy hardware\"}", (uint8_t *)v5, 0x12u);
  }
  return 240.0;
}

+ (double)_determinDefaultExitDisplayOnBudget
{
  NSObject *v2;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!+[TAFilterVisitsSettings _isLegacyHardware](TAFilterVisitsSettings, "_isLegacyHardware"))
    return 120.0;
  v2 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl(&dword_217877000, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAFilterVisits using special parameters for exit display-on budget for legacy hardware\"}", (uint8_t *)v5, 0x12u);
  }
  return 240.0;
}

- (id)sensitiveLOITypesToString
{
  void *v3;
  NSSet *sensitiveLOITypes;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sensitiveLOITypes = self->_sensitiveLOITypes;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__TAFilterVisitsSettings_sensitiveLOITypesToString__block_invoke;
  v8[3] = &unk_24D814FA0;
  v9 = v3;
  v5 = v3;
  -[NSSet enumerateObjectsUsingBlock:](sensitiveLOITypes, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __51__TAFilterVisitsSettings_sensitiveLOITypesToString__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  TALocationOfInterestTypeToString(objc_msgSend(a2, "unsignedIntegerValue"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (double)maxSuspiciousDuration
{
  return self->_maxSuspiciousDuration;
}

- (double)minInterVisitDistance
{
  return self->_minInterVisitDistance;
}

- (unint64_t)minNSigmaBetweenVisits
{
  return self->_minNSigmaBetweenVisits;
}

- (double)entryDisplayOnBudget
{
  return self->_entryDisplayOnBudget;
}

- (double)exitDisplayOnBudget
{
  return self->_exitDisplayOnBudget;
}

- (NSSet)sensitiveLOITypes
{
  return self->_sensitiveLOITypes;
}

- (double)minObservationInterval
{
  return self->_minObservationInterval;
}

- (unint64_t)threeVisitImmediacyType
{
  return self->_threeVisitImmediacyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveLOITypes, 0);
}

@end
