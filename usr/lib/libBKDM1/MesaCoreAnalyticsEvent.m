@implementation MesaCoreAnalyticsEvent

- (MesaCoreAnalyticsEvent)initWithName:(id)a3
{
  MesaCoreAnalyticsEvent *v3;
  MesaCoreAnalyticsEvent *v4;
  uint64_t v5;
  void *v6;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)MesaCoreAnalyticsEvent;
  v3 = -[BiometricKitCoreAnalyticsEvent initWithName:](&v9, sel_initWithName_, a3);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong((id *)((char *)&v3->super.super.isa + (int)*MEMORY[0x24BE0CF40]), &unk_251CB3CF8);
    v5 = (int)*MEMORY[0x24BE0CF50];
    v6 = *(Class *)((char *)&v4->super.super.isa + v5);
    *(Class *)((char *)&v4->super.super.isa + v5) = (Class)&unk_251CB3B80;

  }
  else
  {
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v11 = "self = [super initWithName:eventName]";
      v12 = 2048;
      v13 = 0;
      v14 = 2080;
      v15 = "";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v18 = 1024;
      v19 = 28;
      _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v4;
}

- (BOOL)postEvent
{
  NSObject *v3;
  uint64_t v4;
  NSNumber *previousDeviceType;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE0CF48]);
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsEvent(%@) postEvent\n", buf, 0xCu);
  }
  if (!self->_deviceType)
  {
    previousDeviceType = self->_previousDeviceType;
    if (previousDeviceType)
    {
LABEL_10:
      -[MesaCoreAnalyticsEvent setDeviceType:](self, "setDeviceType:", previousDeviceType);
      goto LABEL_11;
    }
    if (-[NSNumber unsignedIntValue](self->_builtinSensorType, "unsignedIntValue"))
    {
      previousDeviceType = (NSNumber *)&unk_251CB3410;
      goto LABEL_10;
    }
  }
LABEL_11:
  v7.receiver = self;
  v7.super_class = (Class)MesaCoreAnalyticsEvent;
  return -[BiometricKitCoreAnalyticsEvent postEvent](&v7, sel_postEvent);
}

- (void)logAnalyticsDictionary:(id)a3
{
  void *v3;
  uint64_t v4;
  BioLogLegacy *bioLog;
  id v6;
  id v7;

  v3 = (void *)MEMORY[0x24BE0CE80];
  v4 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE0CF48]);
  bioLog = self->_bioLog;
  v6 = a3;
  -[BioLogBase getLogPath](bioLog, "getLogPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "analyticsOSLogNSDictionary:forEvent:toLogPath:withPrefix:", v6, v4, v7, CFSTR("MesaCA"));

}

- (void)reset
{
  NSObject *v3;
  uint64_t v4;
  NSNumber *v5;
  NSNumber *fingerDetected;
  NSNumber *activeTemplatesCount;
  NSNumber *enrolledTemplatesCount;
  NSNumber *totalTemplateMatchCount;
  NSNumber *builtinSensorType;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE0CF48]);
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsEvent(%@) reset event\n", buf, 0xCu);
  }
  v5 = self->_builtinSensorType;
  objc_storeStrong((id *)&self->_previousDeviceType, self->_deviceType);
  v11.receiver = self;
  v11.super_class = (Class)MesaCoreAnalyticsEvent;
  -[BiometricKitCoreAnalyticsEvent reset](&v11, sel_reset);
  self->_fingerOn = 0;
  fingerDetected = self->_fingerDetected;
  self->_fingerDetected = (NSNumber *)MEMORY[0x24BDBD1C0];

  self->_lastBioDevice.type = 0;
  uuid_clear(self->_lastBioDevice.uuid);
  activeTemplatesCount = self->_activeTemplatesCount;
  self->_activeTemplatesCount = (NSNumber *)&unk_251CB3428;

  enrolledTemplatesCount = self->_enrolledTemplatesCount;
  self->_enrolledTemplatesCount = (NSNumber *)&unk_251CB3428;

  totalTemplateMatchCount = self->_totalTemplateMatchCount;
  self->_totalTemplateMatchCount = (NSNumber *)&unk_251CB3428;

  builtinSensorType = self->_builtinSensorType;
  self->_builtinSensorType = v5;

}

- (void)setFingerDetected:(id)a3
{
  int v5;
  NSNumber **p_fingerDetected;
  id v7;

  v7 = a3;
  v5 = objc_msgSend(v7, "BOOLValue");
  self->_fingerOn = v5;
  if (v5)
  {
    p_fingerDetected = &self->_fingerDetected;
    if (!-[NSNumber BOOLValue](*p_fingerDetected, "BOOLValue"))
      objc_storeStrong((id *)p_fingerDetected, a3);
  }

}

- (void)setDeviceType:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_deviceType, a3);
  -[NSNumber unsignedIntegerValue](self->_deviceType, "unsignedIntegerValue");
  objc_storeStrong((id *)&self->_sensorType, self->_builtinSensorType);

}

- (void)handleStatusMessage:(unsigned int)a3 withData:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a4;
  if (a3 == 63)
  {
    v8 = v6;
    v7 = MEMORY[0x24BDBD1C8];
    goto LABEL_5;
  }
  if (a3 == 64)
  {
    v8 = v6;
    v7 = MEMORY[0x24BDBD1C0];
LABEL_5:
    -[MesaCoreAnalyticsEvent setFingerDetected:](self, "setFingerDetected:", v7);
    v6 = v8;
  }

}

- (void)updateBioLog:(id)a3
{
  BioLogLegacy *v5;
  BioLogLegacy *v6;

  v5 = (BioLogLegacy *)a3;
  if (self->_bioLog != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bioLog, a3);
    v5 = v6;
  }

}

- (void)setMatchCounts:(id)a3 totalMatchCount:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSNumber *v13;
  NSNumber *activeTemplatesCount;
  unint64_t v15;
  NSNumber *v16;
  NSNumber *enrolledTemplatesCount;
  NSNumber *v18;
  NSNumber *totalTemplateMatchCount;
  id v20;

  v20 = a3;
  v6 = objc_msgSend(v20, "count");
  v7 = v20;
  if (v6)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("template%luMatchCount"), ++v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsEvent setValue:forKey:](self, "setValue:forKey:", v9, v10);

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 100 * objc_msgSend(v9, "unsignedIntValue") / a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("template%luUsage"), v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MesaCoreAnalyticsEvent setValue:forKey:](self, "setValue:forKey:", v11, v12);

      }
      if (objc_msgSend(v9, "unsignedIntValue"))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_activeTemplatesCount, "unsignedIntValue") + 1);
        v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        activeTemplatesCount = self->_activeTemplatesCount;
        self->_activeTemplatesCount = v13;

      }
      v15 = objc_msgSend(v20, "count");
      v7 = v20;
    }
    while (v8 < v15);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  enrolledTemplatesCount = self->_enrolledTemplatesCount;
  self->_enrolledTemplatesCount = v16;

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    totalTemplateMatchCount = self->_totalTemplateMatchCount;
    self->_totalTemplateMatchCount = v18;

  }
}

- (void)setMatchCountsContinuous:(id)a3 totalMatchCount:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSNumber *v14;
  NSNumber *totalTemplateMatchCountContinuous;
  id v16;

  v16 = a3;
  v6 = objc_msgSend(v16, "count");
  v7 = v16;
  if (v6)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("template%luMatchCountContinuous"), ++v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsEvent setValue:forKey:](self, "setValue:forKey:", v9, v10);

      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 100 * objc_msgSend(v9, "unsignedIntValue") / a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("template%luUsageContinuous"), v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MesaCoreAnalyticsEvent setValue:forKey:](self, "setValue:forKey:", v11, v12);

      }
      v13 = objc_msgSend(v16, "count");
      v7 = v16;
    }
    while (v8 < v13);
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    totalTemplateMatchCountContinuous = self->_totalTemplateMatchCountContinuous;
    self->_totalTemplateMatchCountContinuous = v14;

  }
}

- (void)setMatchCountsFromIdentityList:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  MesaCoreAnalyticsEvent *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v15 = self;
  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v9 += objc_msgSend(v12, "matchCount", v15);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "matchCount"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

        v8 += objc_msgSend(v12, "matchCountContinuous");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "matchCountContinuous"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  -[MesaCoreAnalyticsEvent setMatchCounts:totalMatchCount:](v15, "setMatchCounts:totalMatchCount:", v4, v9);
  -[MesaCoreAnalyticsEvent setMatchCountsContinuous:totalMatchCount:](v15, "setMatchCountsContinuous:totalMatchCount:", v5, v8);

}

- (void)setBiometricABC:(id)a3
{
  BiometricAutoBugCapture *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  BiometricAutoBugCapture *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (BiometricAutoBugCapture *)a3;
  if (__osLog)
    v6 = __osLog;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE0CF48]);
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsEvent: %@ setBiometricABC: %@\n", (uint8_t *)&v8, 0x16u);
  }
  if (self->_biometricABC != v5)
    objc_storeStrong((id *)&self->_biometricABC, a3);

}

- (NSNumber)fingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (NSNumber)builtinSensorType
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setBuiltinSensorType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSNumber)sensorType
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSensorType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSNumber)deviceType
{
  return self->_deviceType;
}

- (NSNumber)deviceGroupType
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDeviceGroupType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSNumber)deviceOrientation
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDeviceOrientation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSNumber)template1MatchCount
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setTemplate1MatchCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSNumber)template2MatchCount
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setTemplate2MatchCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSNumber)template3MatchCount
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setTemplate3MatchCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSNumber)template4MatchCount
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setTemplate4MatchCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSNumber)template5MatchCount
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (void)setTemplate5MatchCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSNumber)template1Usage
{
  return (NSNumber *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTemplate1Usage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSNumber)template2Usage
{
  return (NSNumber *)objc_getProperty(self, a2, 248, 1);
}

- (void)setTemplate2Usage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSNumber)template3Usage
{
  return (NSNumber *)objc_getProperty(self, a2, 256, 1);
}

- (void)setTemplate3Usage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSNumber)template4Usage
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setTemplate4Usage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSNumber)template5Usage
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setTemplate5Usage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSNumber)activeTemplatesCount
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setActiveTemplatesCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSNumber)enrolledTemplatesCount
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setEnrolledTemplatesCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSNumber)totalTemplateMatchCount
{
  return (NSNumber *)objc_getProperty(self, a2, 296, 1);
}

- (void)setTotalTemplateMatchCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSNumber)template1MatchCountContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 304, 1);
}

- (void)setTemplate1MatchCountContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSNumber)template2MatchCountContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setTemplate2MatchCountContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSNumber)template3MatchCountContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 320, 1);
}

- (void)setTemplate3MatchCountContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSNumber)template4MatchCountContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setTemplate4MatchCountContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSNumber)template5MatchCountContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 336, 1);
}

- (void)setTemplate5MatchCountContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSNumber)template1UsageContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 344, 1);
}

- (void)setTemplate1UsageContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSNumber)template2UsageContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setTemplate2UsageContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSNumber)template3UsageContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setTemplate3UsageContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSNumber)template4UsageContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setTemplate4UsageContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSNumber)template5UsageContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setTemplate5UsageContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSNumber)totalTemplateMatchCountContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setTotalTemplateMatchCountContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalTemplateMatchCountContinuous, 0);
  objc_storeStrong((id *)&self->_template5UsageContinuous, 0);
  objc_storeStrong((id *)&self->_template4UsageContinuous, 0);
  objc_storeStrong((id *)&self->_template3UsageContinuous, 0);
  objc_storeStrong((id *)&self->_template2UsageContinuous, 0);
  objc_storeStrong((id *)&self->_template1UsageContinuous, 0);
  objc_storeStrong((id *)&self->_template5MatchCountContinuous, 0);
  objc_storeStrong((id *)&self->_template4MatchCountContinuous, 0);
  objc_storeStrong((id *)&self->_template3MatchCountContinuous, 0);
  objc_storeStrong((id *)&self->_template2MatchCountContinuous, 0);
  objc_storeStrong((id *)&self->_template1MatchCountContinuous, 0);
  objc_storeStrong((id *)&self->_totalTemplateMatchCount, 0);
  objc_storeStrong((id *)&self->_enrolledTemplatesCount, 0);
  objc_storeStrong((id *)&self->_activeTemplatesCount, 0);
  objc_storeStrong((id *)&self->_template5Usage, 0);
  objc_storeStrong((id *)&self->_template4Usage, 0);
  objc_storeStrong((id *)&self->_template3Usage, 0);
  objc_storeStrong((id *)&self->_template2Usage, 0);
  objc_storeStrong((id *)&self->_template1Usage, 0);
  objc_storeStrong((id *)&self->_template5MatchCount, 0);
  objc_storeStrong((id *)&self->_template4MatchCount, 0);
  objc_storeStrong((id *)&self->_template3MatchCount, 0);
  objc_storeStrong((id *)&self->_template2MatchCount, 0);
  objc_storeStrong((id *)&self->_template1MatchCount, 0);
  objc_storeStrong((id *)&self->_deviceOrientation, 0);
  objc_storeStrong((id *)&self->_deviceGroupType, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_sensorType, 0);
  objc_storeStrong((id *)&self->_builtinSensorType, 0);
  objc_storeStrong((id *)&self->_fingerDetected, 0);
  objc_storeStrong((id *)&self->_biometricABC, 0);
  objc_storeStrong((id *)&self->_previousDeviceType, 0);
  objc_storeStrong((id *)&self->_bioLog, 0);
}

@end
