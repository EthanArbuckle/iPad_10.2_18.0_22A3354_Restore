@implementation FMDSecureLocationConfig

- (FMDSecureLocationConfig)init
{
  FMDSecureLocationConfig *v2;
  FMDSecureLocationConfig *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDSecureLocationConfig;
  v2 = -[FMDSecureLocationConfig init](&v5, "init");
  v3 = v2;
  if (v2)
    -[FMDSecureLocationConfig _initWithDefaults](v2, "_initWithDefaults");
  return v3;
}

- (void)_initWithDefaults
{
  objc_storeStrong((id *)&self->_policyName, kFMDSecureLocationModeProactive);
  *(_OWORD *)&self->_minTimeBetweenPublish = xmmword_1002538D0;
  *(_OWORD *)&self->_accuracyThreshold = xmmword_1002538C0;
  self->_heartbeatPublish = 1080.0;
  *(_OWORD *)&self->_onDemandPublishThreshold = xmmword_1002538E0;
  self->_priority = 2;
  self->_stalenessThreshold = 120.0;
  self->_shouldWakeDevice = 1;
}

- (FMDSecureLocationConfig)initWithName:(id)a3 values:(id)a4
{
  id v7;
  id v8;
  FMDSecureLocationConfig *v9;
  FMDSecureLocationConfig *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDSecureLocationConfig;
  v9 = -[FMDSecureLocationConfig init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    -[FMDSecureLocationConfig _initWithDefaults](v9, "_initWithDefaults");
    objc_storeStrong((id *)&v10->_policyName, a3);
    -[FMDSecureLocationConfig _readValuesFromDictionary:](v10, "_readValuesFromDictionary:", v8);
  }

  return v10;
}

- (void)_readValuesFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSString *policyName;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  id v24;
  NSObject *v25;
  NSString *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  id v33;
  NSObject *v34;
  NSString *v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  id v48;
  NSObject *v49;
  NSString *v50;
  double expirationInterval;
  void *v52;
  void *v53;
  id v54;
  NSComparisonResult v55;
  int64_t v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  unsigned __int8 v62;
  void *v63;
  void *v64;
  uint8_t buf[4];
  NSString *v66;
  __int16 v67;
  void *v68;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("desiredAccuracy")));
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = CFSTR("slc");
  objc_storeStrong((id *)&self->_desiredAccuracy, v7);

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minTimeBetweenPublish")));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), self->_policyName, CFSTR("minTimeBetweenPublish")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfig _readInternalPreference:](self, "_readInternalPreference:", v9));
    if (v10)
    {
      v11 = sub_10005318C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        policyName = self->_policyName;
        *(_DWORD *)buf = 138412546;
        v66 = policyName;
        v67 = 2112;
        v68 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SecureLocationConfig: Overriding minTimeBetweenPublish for %@ to %@", buf, 0x16u);
      }

      v14 = v10;
    }
    else
    {
      v14 = (void *)v8;
    }
    objc_msgSend(v14, "doubleValue");
    if (v15 < 0.5)
      v15 = 0.5;
    self->_minTimeBetweenPublish = v15;

  }
  v64 = (void *)v8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minTimeBetweenVisitPublish")));
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "doubleValue");
    self->_minTimeBetweenVisitPublish = v18;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("heartbeatPublish")));
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), self->_policyName, CFSTR("heartbeatInterval")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfig _readInternalPreference:](self, "_readInternalPreference:", v20));
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "doubleValue");
      self->_heartbeatPublish = v23;
      v24 = sub_10005318C();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_policyName;
        *(_DWORD *)buf = 138412546;
        v66 = v26;
        v67 = 2112;
        v68 = v22;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "SecureLocationConfig: Overriding heartbeatPublishInterval for %@ to %@", buf, 0x16u);
      }

    }
    else
    {
      objc_msgSend(v19, "doubleValue");
      self->_heartbeatPublish = v27;
    }

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minDistanceBetweenPublish")));
  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), self->_policyName, CFSTR("minDistanceBetweenPublish")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfig _readInternalPreference:](self, "_readInternalPreference:", v29));
    v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "doubleValue");
      self->_minDistanceBetweenPublish = v32;
      v33 = sub_10005318C();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = self->_policyName;
        *(_DWORD *)buf = 138412546;
        v66 = v35;
        v67 = 2112;
        v68 = v31;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "SecureLocationConfig: Overriding minDistanceBetweenPublish for %@ to %@", buf, 0x16u);
      }

    }
    else
    {
      objc_msgSend(v28, "doubleValue");
      self->_minDistanceBetweenPublish = v36;
    }

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accuracyThreshold")));
  v38 = v37;
  if (v37)
  {
    objc_msgSend(v37, "doubleValue");
    self->_accuracyThreshold = v39;
  }
  v63 = v19;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onDemandThreshold")));
  v41 = v40;
  if (v40)
  {
    objc_msgSend(v40, "doubleValue");
    self->_onDemandPublishThreshold = v42;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expirationInterval")));
  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), self->_policyName, CFSTR("expirationInterval")));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationConfig _readInternalPreference:](self, "_readInternalPreference:", v44));
    v46 = v45;
    if (v45)
    {
      objc_msgSend(v45, "doubleValue");
      self->_expirationInterval = v47;
      v48 = sub_10005318C();
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = self->_policyName;
        *(_DWORD *)buf = 138412546;
        v66 = v50;
        v67 = 2112;
        v68 = v46;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "SecureLocationConfig: Overriding expirationInterval for %@ to %@", buf, 0x16u);
      }

      expirationInterval = self->_expirationInterval;
    }
    else
    {
      objc_msgSend(v43, "doubleValue");
      self->_expirationInterval = expirationInterval;
    }
    if (expirationInterval < 0.9)
      self->_expirationInterval = 0.9;

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("priority")));
  v53 = v52;
  if (v52)
  {
    v54 = objc_msgSend(v52, "integerValue");
    self->_priority = (int64_t)v54;
    if ((uint64_t)v54 <= 0)
    {
      if (-[NSString caseInsensitiveCompare:](self->_policyName, "caseInsensitiveCompare:", kFMDSecureLocationModeProactive))
      {
        if (-[NSString caseInsensitiveCompare:](self->_policyName, "caseInsensitiveCompare:", kFMDSecureLocationModeProactiveShallow))
        {
          v55 = -[NSString caseInsensitiveCompare:](self->_policyName, "caseInsensitiveCompare:", kFMDSecureLocationModeLive);
          v56 = 2;
          if (v55 == NSOrderedSame)
            v56 = 4;
        }
        else
        {
          v56 = 3;
        }
      }
      else
      {
        v56 = 2;
      }
      self->_priority = v56;
    }
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stalenessThreshold")));
  v58 = v57;
  if (v57)
  {
    objc_msgSend(v57, "doubleValue");
    self->_stalenessThreshold = v59;
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldWakeDevice")));
  v61 = v60;
  if (v60)
    v62 = objc_msgSend(v60, "BOOLValue");
  else
    v62 = 1;
  self->_shouldWakeDevice = v62;

}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<SecureLocationConfig name %@, desiredAccuracy %@, minTimeBetweenPublish %f, minTimeBetweenVisitPublish %f, heartbeatPublish %f, minDistanceBetweenPublish %f, accuracyThreshold %f, expirationInterval %f, priority %ld, stalenessThreshold %f>"), self->_policyName, self->_desiredAccuracy, *(_QWORD *)&self->_minTimeBetweenPublish, *(_QWORD *)&self->_minTimeBetweenVisitPublish, *(_QWORD *)&self->_heartbeatPublish, *(_QWORD *)&self->_minDistanceBetweenPublish, *(_QWORD *)&self->_accuracyThreshold, *(_QWORD *)&self->_expirationInterval, self->_priority, *(_QWORD *)&self->_stalenessThreshold);
}

- (id)_readInternalPreference:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  BOOL v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil objectForKey:inDomain:](FMPreferencesUtil, "objectForKey:inDomain:", a3, kFMDNotBackedUpPrefDomain));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v5 = objc_msgSend(v4, "isInternalBuild");

  if (v5)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (v6)
    v7 = 0;
  else
    v7 = v3;

  return v7;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (void)setDesiredAccuracy:(id)a3
{
  objc_storeStrong((id *)&self->_desiredAccuracy, a3);
}

- (double)minTimeBetweenPublish
{
  return self->_minTimeBetweenPublish;
}

- (void)setMinTimeBetweenPublish:(double)a3
{
  self->_minTimeBetweenPublish = a3;
}

- (double)minDistanceBetweenPublish
{
  return self->_minDistanceBetweenPublish;
}

- (void)setMinDistanceBetweenPublish:(double)a3
{
  self->_minDistanceBetweenPublish = a3;
}

- (double)accuracyThreshold
{
  return self->_accuracyThreshold;
}

- (void)setAccuracyThreshold:(double)a3
{
  self->_accuracyThreshold = a3;
}

- (double)minTimeBetweenVisitPublish
{
  return self->_minTimeBetweenVisitPublish;
}

- (void)setMinTimeBetweenVisitPublish:(double)a3
{
  self->_minTimeBetweenVisitPublish = a3;
}

- (double)heartbeatPublish
{
  return self->_heartbeatPublish;
}

- (void)setHeartbeatPublish:(double)a3
{
  self->_heartbeatPublish = a3;
}

- (double)continuesPublishThreshold
{
  return self->_continuesPublishThreshold;
}

- (void)setContinuesPublishThreshold:(double)a3
{
  self->_continuesPublishThreshold = a3;
}

- (double)onDemandPublishThreshold
{
  return self->_onDemandPublishThreshold;
}

- (void)setOnDemandPublishThreshold:(double)a3
{
  self->_onDemandPublishThreshold = a3;
}

- (double)expirationInterval
{
  return self->_expirationInterval;
}

- (void)setExpirationInterval:(double)a3
{
  self->_expirationInterval = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (double)stalenessThreshold
{
  return self->_stalenessThreshold;
}

- (void)setStalenessThreshold:(double)a3
{
  self->_stalenessThreshold = a3;
}

- (BOOL)shouldWakeDevice
{
  return self->_shouldWakeDevice;
}

- (void)setShouldWakeDevice:(BOOL)a3
{
  self->_shouldWakeDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredAccuracy, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
