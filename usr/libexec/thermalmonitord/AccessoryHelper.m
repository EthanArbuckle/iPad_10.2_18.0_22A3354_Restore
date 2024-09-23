@implementation AccessoryHelper

- (int)numberOfFields
{
  return 2;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  const __CFAllocator *v3;
  uint64_t filteredAttachValue;

  if (a3 == 1)
  {
    v3 = kCFAllocatorDefault;
    filteredAttachValue = self->_filteredAttachValue;
    return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), filteredAttachValue);
  }
  if (!a3)
  {
    v3 = kCFAllocatorDefault;
    filteredAttachValue = 100;
    if (!self->_accessoryAttached)
      filteredAttachValue = 0;
    return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), filteredAttachValue);
  }
  return 0;
}

- (void)updateFilter:(BOOL)a3
{
  uint64_t filteredAttachValue;
  _BOOL4 accessoryAttached;
  int filterCount;
  uint64_t v7;

  filteredAttachValue = self->_filteredAttachValue;
  if (a3)
    -[AccessoryHelper initializeFilteredAttachedState:](self, "initializeFilteredAttachedState:", self->_accessoryAttached);
  accessoryAttached = self->_accessoryAttached;
  if (accessoryAttached == self->_previousAttachedState)
  {
    filterCount = self->_filterCount;
    if (filterCount >= 6)
    {
      if (self->_accessoryAttached)
        filteredAttachValue = 100;
      else
        filteredAttachValue = 0;
    }
    else
    {
      self->_filterCount = filterCount + 1;
      if (accessoryAttached)
        v7 = 100;
      else
        v7 = 0;
      if (filterCount == 5)
        filteredAttachValue = v7;
    }
  }
  else
  {
    self->_filterCount = 0;
    self->_previousAttachedState = accessoryAttached;
  }
  -[AccessoryHelper applyUpdatedAccessoryState:](self, "applyUpdatedAccessoryState:", filteredAttachValue);
}

- (void)applyUpdatedAccessoryState:(int)a3
{
  NSObject *v5;
  _DWORD v6[2];

  if (self->_filteredAttachValue != a3)
  {
    if (byte_1000A2480)
    {
      v5 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 67109120;
        v6[1] = a3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Applying alternate HS targets for attached state: %d", (uint8_t *)v6, 8u);
      }
    }
    -[CommonProduct applyAlternateHotSpotTargets:](self->_product, "applyAlternateHotSpotTargets:", a3 != 0);
  }
  self->_filteredAttachValue = a3;
  *(float *)&dword_1000A2ADC = (float)(a3 / 100);
}

- (AccessoryHelper)initWithProduct:(id)a3
{
  AccessoryHelper *v4;
  AccessoryHelper *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL8 accessoryAttached;
  float v32;
  uint8_t v34[16];
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)AccessoryHelper;
  v4 = -[AccessoryHelper init](&v35, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_product = (CommonProduct *)a3;
    }
    else
    {
      v6 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_1000539E0(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    -[AccessoryHelper setConnectedEndpoints:](v5, "setConnectedEndpoints:", objc_alloc_init((Class)NSMutableDictionary));
    if (!-[AccessoryHelper connectedEndpoints](v5, "connectedEndpoints"))
    {
      v14 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_1000539B0(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    *(_WORD *)&v5->_accessoryAttached = 0;
    v5->_filteredAttachValue = 0;
    v5->_filterCount = 0;
    -[AccessoryHelper setAccConnectionInfo:](v5, "setAccConnectionInfo:", +[ACCConnectionInfo sharedInstance](ACCConnectionInfo, "sharedInstance"));
    if (!-[AccessoryHelper accConnectionInfo](v5, "accConnectionInfo"))
    {
      v22 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100053980(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    -[ACCConnectionInfo registerDelegate:](-[AccessoryHelper accConnectionInfo](v5, "accConnectionInfo"), "registerDelegate:", v5);
    if (v5->_accessoryAttached)
    {
      if (byte_1000A2480
        && (v30 = qword_1000A28A0, os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT)))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "<Notice> Accessory attached at boot: skipping initial filtering requirements", v34, 2u);
        accessoryAttached = v5->_accessoryAttached;
      }
      else
      {
        accessoryAttached = 1;
      }
      -[AccessoryHelper initializeFilteredAttachedState:](v5, "initializeFilteredAttachedState:", accessoryAttached);
    }
    if (byte_1000A2DC0)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 6, CFSTR("zETM"), 6);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 7, CFSTR("zETM"), 7);
      v32 = 0.0;
      if (v5->_accessoryAttached)
        v32 = 1.0;
      dword_1000A2AD8 = LODWORD(v32);
      *(float *)&dword_1000A2ADC = (float)v5->_filteredAttachValue;
    }
    -[TGraphSampler addtGraphDataSource:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "addtGraphDataSource:", v5);
  }
  return v5;
}

- (void)initializeFilteredAttachedState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;

  v3 = a3;
  self->_filterCount = 6;
  self->_previousAttachedState = a3;
  if (byte_1000A2480)
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "false";
      if (v3)
        v6 = "true";
      v8 = 136315138;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Initializing Attached state to %s", (uint8_t *)&v8, 0xCu);
    }
  }
  if (v3)
    v7 = 100;
  else
    v7 = 0;
  -[AccessoryHelper applyUpdatedAccessoryState:](self, "applyUpdatedAccessoryState:", v7);
}

- (BOOL)isAccessoryAttached
{
  return self->_accessoryAttached;
}

- (void)handleAccessoryEventForEndpointUUID:(id)a3 andAttachedState:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  unsigned __int8 v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  float v15;
  NSObject *v16;
  uint64_t v17;
  _DWORD v18[2];
  __int16 v19;
  _BOOL4 v20;

  v4 = a4;
  v7 = -[NSMutableDictionary objectForKeyedSubscript:](-[AccessoryHelper connectedEndpoints](self, "connectedEndpoints"), "objectForKeyedSubscript:", a3);
  if (v7)
  {
    v8 = objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AccessoryType")), "charValue");
    v9 = v8;
    v10 = v8 - 67 > 0x3E || ((1 << (v8 - 67)) & 0x6000800000070E07) == 0;
    if (v10 && (v8 - 133 > 0x10 || ((1 << (v8 + 123)) & 0x11801) == 0))
    {
      v17 = qword_1000A28A0;
      if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      LOWORD(v18[0]) = 0;
      v12 = "<Notice> Not in approved type list";
      v13 = v17;
      v14 = 2;
    }
    else
    {
      self->_accessoryAttached = v4;
      v11 = qword_1000A28A0;
      if (!os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:
        v15 = 0.0;
        if (self->_accessoryAttached)
          v15 = 1.0;
        dword_1000A2AD8 = LODWORD(v15);
        return;
      }
      v18[0] = 67109376;
      v18[1] = v9;
      v19 = 1024;
      v20 = v4;
      v12 = "<Notice> Got accessory event with type: %d and attached state: %d";
      v13 = v11;
      v14 = 14;
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)v18, v14);
    goto LABEL_12;
  }
  v16 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100053A10((uint64_t)a3, v16);
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v9;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v9 = *(_QWORD *)&a4;
  v12 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412802;
    v15 = a7;
    v16 = 2112;
    v17 = a3;
    v18 = 2112;
    v19 = a6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> Accessory attached: %@, %@, %@", (uint8_t *)&v14, 0x20u);
  }
  if ((v9 - 14) >= 0xFFFFFFFE)
  {
    v13 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9), CFSTR("EndpointType"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(a6, "objectForKeyedSubscript:", kACCProperties_Endpoint_NFC_Type), CFSTR("AccessoryType"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[AccessoryHelper connectedEndpoints](self, "connectedEndpoints"), "setObject:forKeyedSubscript:", v13, a3);
    -[AccessoryHelper handleAccessoryEventForEndpointUUID:andAttachedState:](self, "handleAccessoryEventForEndpointUUID:andAttachedState:", a3, 1);
  }
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v7 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = a4;
    v12 = 2112;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Accessory detached: %@, %@", (uint8_t *)&v10, 0x16u);
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](-[AccessoryHelper connectedEndpoints](self, "connectedEndpoints"), "objectForKeyedSubscript:", a3))
  {
    -[AccessoryHelper handleAccessoryEventForEndpointUUID:andAttachedState:](self, "handleAccessoryEventForEndpointUUID:andAttachedState:", a3, 0);
    if (byte_1000A2480)
    {
      v8 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412546;
        v11 = a4;
        v12 = 2112;
        v13 = a3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Removing connected endpoints dict entry: %@, %@", (uint8_t *)&v10, 0x16u);
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[AccessoryHelper connectedEndpoints](self, "connectedEndpoints"), "setObject:forKeyedSubscript:", 0, a3);
  }
  else
  {
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> Accessory properties do not exist: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("Accessory Attached Filtered");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return v3;
  else
    return CFSTR("Accessory Attached Current");
}

- (ACCConnectionInfo)accConnectionInfo
{
  return self->_accConnectionInfo;
}

- (void)setAccConnectionInfo:(id)a3
{
  self->_accConnectionInfo = (ACCConnectionInfo *)a3;
}

- (NSMutableDictionary)connectedEndpoints
{
  return self->_connectedEndpoints;
}

- (void)setConnectedEndpoints:(id)a3
{
  self->_connectedEndpoints = (NSMutableDictionary *)a3;
}

@end
