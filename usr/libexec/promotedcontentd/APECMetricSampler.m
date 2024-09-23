@implementation APECMetricSampler

- (BOOL)sampleEvent:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APECMetricSampler samplingSettings](self, "samplingSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Sample")));
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (NSDictionary)samplingSettings
{
  return self->_samplingSettings;
}

- (APECMetricSampler)init
{
  APECMetricSampler *v2;
  APECMetricSampler *v3;
  uint64_t v4;
  NSDictionary *samplingSettings;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)APECMetricSampler;
  v2 = -[APECMetricSampler init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[APECMetricSampler _loadAllSampleRates](v2, "_loadAllSampleRates"));
    samplingSettings = v3->_samplingSettings;
    v3->_samplingSettings = (NSDictionary *)v4;

  }
  return v3;
}

- (id)_loadSampleSessionsfromStorage
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)APSettingsStorageKeychain), "initWithDefaultValues:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.ap.APECSampleSettings")));

  return v3;
}

- (void)_updateSampleSessionStorage:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)APSettingsStorageKeychain), "initWithDefaultValues:", 0);
  objc_msgSend(v4, "setValue:forKey:", v3, CFSTR("com.apple.ap.APECSampleSettings"));

}

- (id)_sampleRateFromConfig:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (!a3)
  {
    v4 = 0;
    goto LABEL_6;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APECPurposeConfig purposeConfig:](APECPurposeConfig, "purposeConfig:"));
  v4 = v3;
  if (!v3)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "samplePercentage"));

  if (v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "samplePercentage"));
LABEL_7:

  return v5;
}

- (id)_samplePeriodFromConfig:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (!a3)
  {
    v4 = 0;
    goto LABEL_6;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APECPurposeConfig purposeConfig:](APECPurposeConfig, "purposeConfig:"));
  v4 = v3;
  if (!v3)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "samplePeriod"));

  if (v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "samplePeriod"));
LABEL_7:

  return v5;
}

- (id)_loadAllSampleRates
{
  void *v3;
  id v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APECMetricSampler _loadSampleSessionsfromStorage](self, "_loadSampleSessionsfromStorage"));
  v4 = objc_msgSend(v3, "mutableCopy");

  if (!v4)
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  for (i = 0; i != 4; ++i)
  {
    v6 = qword_1001B8658[i];
    if (-[APECMetricSampler _hasSession:purpose:](self, "_hasSession:purpose:", v4, v6))
    {
      if (!-[APECMetricSampler isSampleRateExpired:purpose:](self, "isSampleRateExpired:purpose:", v4, v6))
        continue;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APECMetricSampler _sampleRateFromConfig:](self, "_sampleRateFromConfig:", v6));
LABEL_8:
      -[APECMetricSampler _updateRateAndTime:rate:purpose:](self, "_updateRateAndTime:rate:purpose:", v4, v7, v6);
      goto LABEL_9;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APECMetricSampler _sampleRateFromConfig:](self, "_sampleRateFromConfig:", v6));
    if (v7)
      goto LABEL_8;
LABEL_9:

  }
  -[APECMetricSampler _updateSampleSessionStorage:](self, "_updateSampleSessionStorage:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v4));

  return v8;
}

- (BOOL)_hasSession:(id)a3 purpose:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  return v7 != 0;
}

- (void)_updateRateAndTime:(id)a3 rate:(id)a4 purpose:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  _BOOL8 v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  const __CFString *v27;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;

  v12 = +[APECMetricSampler _shouldSample:](APECMetricSampler, "_shouldSample:", v8);
  v13 = APLogForCategory(29);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = CFSTR("NO");
    if (v12)
      v15 = CFSTR("YES");
    v26 = 138412290;
    v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Device should sample metrics (%@)", (uint8_t *)&v26, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v16));

  if (!v17)
  {
    v18 = objc_msgSend(&__NSDictionary0__struct, "mutableCopy");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
    objc_msgSend(v7, "setObject:forKey:", v18, v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v21));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, CFSTR("Sample"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v24));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, CFSTR("TimeInterval"));

}

- (double)sampleSessionStartTimeFromPurpose:(id)a3 purpose:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TimeInterval")));
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  return v10;
}

- (BOOL)isSampleRateExpired:(id)a3 purpose:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  BOOL v15;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;

  -[APECMetricSampler sampleSessionStartTimeFromPurpose:purpose:](self, "sampleSessionStartTimeFromPurpose:purpose:", v6, a4);
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APECMetricSampler _samplePeriodFromConfig:](self, "_samplePeriodFromConfig:", a4));
  v13 = v12;
  if (v12)
    v14 = (double)(int)objc_msgSend(v12, "intValue");
  else
    v14 = 604800.0;
  v15 = v9 - v11 > v14;

  return v15;
}

+ (BOOL)_shouldSample:(id)a3
{
  id v3;
  uint32_t v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  _DWORD v9[2];

  v3 = a3;
  v4 = arc4random_uniform(0x186A0u);
  v5 = APLogForCategory(29);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "sample random number (%u)", (uint8_t *)v9, 8u);
  }

  v7 = objc_msgSend(v3, "unsignedIntValue");
  return v4 <= v7;
}

- (void)setSamplingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_samplingSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingSettings, 0);
}

@end
