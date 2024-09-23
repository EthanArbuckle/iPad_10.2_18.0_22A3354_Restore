@implementation ArcPowerCC

- (ArcPowerCC)initWithParams:(__CFDictionary *)a3 product:(id)a4
{
  char *v6;
  ArcPowerCC *v7;
  int v8;
  int *p_latestModuleTemperature;
  int v10;
  int v11;
  NSObject *v12;
  int product_high;
  int v14;
  int maxArcPower;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;

  v25.receiver = self;
  v25.super_class = (Class)ArcPowerCC;
  v6 = -[ComponentControl initWithCC::](&v25, "initWithCC::", 11, 0);
  v7 = (ArcPowerCC *)v6;
  if (v6)
  {
    *(_QWORD *)(v6 + 140) = a4;
    *((_DWORD *)v6 + 18) = 100;
    *((_DWORD *)v6 + 42) = -1;
    *((_QWORD *)v6 + 6) = CFStringCreateWithFormat(0, 0, CFSTR("%d Arc "), 11);
    v7->super.previousValue = v7->super.currentLoadingIndex;
    v8 = sub_1000048B0(a3, CFSTR("thresholdModule"), kCFNumberIntType, (char *)&v7->_product + 4);
    p_latestModuleTemperature = &v7->_latestModuleTemperature;
    v10 = sub_1000048B0(a3, CFSTR("maxArcPower"), kCFNumberIntType, &v7->_latestModuleTemperature);
    v11 = sub_1000048B0(a3, CFSTR("minArcPower"), kCFNumberIntType, &v7->_maxArcPower);
    if (v8 && v10 && v11)
    {
      if (byte_1000A2480)
      {
        v12 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          product_high = HIDWORD(v7->_product);
          v14 = *p_latestModuleTemperature;
          maxArcPower = v7->_maxArcPower;
          *(_DWORD *)buf = 67109632;
          v27 = product_high;
          v28 = 1024;
          v29 = v14;
          v30 = 1024;
          v31 = maxArcPower;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> ArcPowerCC ModuleThreshold: %d, MaxPower: %d, MinPower: %d", buf, 0x14u);
        }
      }
      v7->_minArcPower = *p_latestModuleTemperature;
    }
    else
    {
      v16 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100050B50(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    -[ComponentControl updatePowerParameters:](v7, "updatePowerParameters:", a3);
    if (sub_100034168(a3, CFSTR("expectsCPMSSupport"), 0))
      -[ComponentControl setCPMSMitigationState:](v7, "setCPMSMitigationState:", 1);
  }
  return v7;
}

- (void)defaultAction
{
  self->_thresholdModuleTemperature = objc_msgSend(*(id *)(&self->super.currentPower + 1), "arcModuleTemperature");
  -[ArcPowerCC updatePowerTarget](self, "updatePowerTarget");
}

- (void)updatePowerTarget
{
  unsigned int *p_minArcPower;
  unsigned int currentLoadingIndex;
  int latestModuleTemperature;
  int v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD v26[2];

  p_minArcPower = (unsigned int *)&self->_minArcPower;
  currentLoadingIndex = self->super.currentLoadingIndex;
  if (self->super.maxLoadingIndex == currentLoadingIndex)
  {
    latestModuleTemperature = *p_minArcPower;
  }
  else
  {
    self->super.maxLoadingIndex = currentLoadingIndex;
    if (self->_thresholdModuleTemperature <= SHIDWORD(self->_product))
    {
      latestModuleTemperature = self->_latestModuleTemperature;
    }
    else
    {
      v5 = self->_latestModuleTemperature;
      latestModuleTemperature = v5 * self->super.currentLoadingIndex / 0x64;
      if (latestModuleTemperature >= v5)
        latestModuleTemperature = self->_latestModuleTemperature;
      if (latestModuleTemperature <= self->_maxArcPower)
        latestModuleTemperature = self->_maxArcPower;
    }
  }
  if (latestModuleTemperature != *p_minArcPower)
  {
    *p_minArcPower = latestModuleTemperature;
    v6 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", *p_minArcPower);
    if (v6)
    {
      v7 = v6;
      v8 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("HapticTargetPower"));
      v9 = +[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController");
      if (objc_msgSend(v9, "setAttribute:forKey:error:", v8, AVSystemController_ThermalControlInfoAttribute, 0))
      {
        if (byte_1000A2480)
        {
          v10 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            v11 = *p_minArcPower;
            v26[0] = 67109120;
            v26[1] = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> ArcPowerCC: Set the target power to %d", (uint8_t *)v26, 8u);
          }
        }
      }
      else
      {
        v19 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100050BE8((uint64_t)p_minArcPower, v19, v20, v21, v22, v23, v24, v25);
      }

      if (v8)
    }
    else
    {
      v12 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100050B80((uint64_t)p_minArcPower, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (void)refreshTGraphTelemetry
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  int v22;

  v3 = +[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController");
  v4 = objc_msgSend(v3, "attributeForKey:", AVSystemController_ThermalControlInfoAttribute);
  if (!v4)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100050C80(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (!objc_msgSend(v4, "count"))
  {
    v13 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100050C50(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  v21 = objc_msgSend(v4, "objectForKey:", CFSTR("HapticTargetPower"));
  if (v21)
    v22 = objc_msgSend(v21, "intValue");
  else
    v22 = -1;
  self->_arcPowerTarget = v22;
}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ArcPowerCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3;
  unsigned int v6;
  __CFString *v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)ArcPowerCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)ArcPowerCC;
    v6 = -[ComponentControl numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1)
      v7 = CFSTR("ArcCC current power");
    else
      v7 = 0;
    if ((_DWORD)v3 == v6)
      return CFSTR("ArcCC target power");
    else
      return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ArcPowerCC;
    return -[ComponentControl copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3;
  int v6;
  const __CFAllocator *v7;
  uint64_t v8;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  v3 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)ArcPowerCC;
  if (-[ComponentControl numberOfFields](&v11, "numberOfFields") > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)ArcPowerCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v10, "copyFieldCurrentValueForIndex:", v3);
  }
  v9.receiver = self;
  v9.super_class = (Class)ArcPowerCC;
  v6 = v3 - -[ComponentControl numberOfFields](&v9, "numberOfFields");
  if (v6 == 1)
  {
    v7 = kCFAllocatorDefault;
    v8 = 168;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("%d"), *(unsigned int *)((char *)&self->super.super.super.isa + v8));
  }
  if (!v6)
  {
    v7 = kCFAllocatorDefault;
    v8 = 164;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("%d"), *(unsigned int *)((char *)&self->super.super.super.isa + v8));
  }
  return 0;
}

@end
