@implementation AXPhoenixAnalyticsEvent

- (AXPhoenixAnalyticsEvent)init
{
  id location;

  location = self;
  objc_storeStrong(&location, 0);
  return 0;
}

- (AXPhoenixAnalyticsEvent)initWithEventType:(int64_t)a3 eventInfo:(id)a4
{
  AXPhoenixAnalyticsEvent *v4;
  AXPhoenixAnalyticsEvent *v6;
  objc_super v7;
  id location;
  int64_t v9;
  SEL v10;
  AXPhoenixAnalyticsEvent *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v11;
  v11 = 0;
  v7.receiver = v4;
  v7.super_class = (Class)AXPhoenixAnalyticsEvent;
  v11 = -[AXPhoenixAnalyticsEvent init](&v7, sel_init);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    v11->_eventType = v9;
    objc_storeStrong((id *)&v11->_eventInfo, location);
  }
  v6 = v11;
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (id)description
{
  id v3;
  id v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = -[AXPhoenixAnalyticsEvent _jsonData](self, "_jsonData");
  v5 = (id)objc_msgSend(v3, "initWithData:encoding:");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id location[2];
  AXPhoenixAnalyticsEvent *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "encodeInteger:forKey:", v4->_eventType, CFSTR("_eventType"));
  objc_msgSend(location[0], "encodeObject:forKey:", v4->_eventInfo, CFSTR("_eventInfo"));
  objc_storeStrong(location, 0);
}

- (AXPhoenixAnalyticsEvent)initWithCoder:(id)a3
{
  AXPhoenixAnalyticsEvent *v3;
  int64_t eventType;
  NSDictionary *eventInfo;
  uint64_t v6;
  NSDictionary *v7;
  NSDictionary *v8;
  AXPhoenixAnalyticsEvent *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  AXPhoenixAnalyticsEvent *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v16;
  eventType = v16->_eventType;
  eventInfo = v16->_eventInfo;
  v16 = 0;
  v16 = -[AXPhoenixAnalyticsEvent initWithEventType:eventInfo:](v3, "initWithEventType:eventInfo:", eventType, eventInfo);
  objc_storeStrong((id *)&v16, v16);
  if (v16)
  {
    v6 = objc_msgSend(location[0], "decodeIntegerForKey:", CFSTR("_eventType"));
    v16->_eventType = v6;
    v12 = location[0];
    v11 = (void *)MEMORY[0x24BDBCF20];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v14 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
    v13 = (id)objc_msgSend(v11, "setWithArray:");
    v7 = (NSDictionary *)(id)objc_msgSend(v12, "decodeObjectOfClasses:forKey:");
    v8 = v16->_eventInfo;
    v16->_eventInfo = v7;

  }
  v10 = v16;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v16, 0);
  return v10;
}

- (id)_jsonData
{
  NSDictionary *eventInfo;
  id v3;
  id v5;
  os_log_t oslog;
  id v7;
  id v8;
  id v9;
  os_log_type_t v10;
  id location[2];
  AXPhoenixAnalyticsEvent *v12;
  id v13;
  uint8_t v14[32];
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  location[1] = (id)a2;
  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", self->_eventInfo) & 1) != 0)
  {
    v9 = 0;
    v8 = 0;
    eventInfo = v12->_eventInfo;
    v7 = 0;
    v5 = (id)objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", eventInfo, 0, &v7);
    objc_storeStrong(&v9, v7);
    v3 = v8;
    v8 = v5;

    if (v9)
    {
      oslog = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v14, (uint64_t)"-[AXPhoenixAnalyticsEvent _jsonData]", (uint64_t)v12->_eventInfo, (uint64_t)v9);
        _os_log_error_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Failed to serialize context %@ to JSON due to error %@.", v14, 0x20u);
      }
      objc_storeStrong((id *)&oslog, 0);
      objc_storeStrong(&v8, 0);
    }
    v13 = v8;
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  else
  {
    location[0] = (id)AXLogBackTap();
    v10 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v15, (uint64_t)"-[AXPhoenixAnalyticsEvent _jsonData]", (uint64_t)v12->_eventInfo);
      _os_log_error_impl(&dword_228CDB000, (os_log_t)location[0], v10, "[PHOENIX] %s EventInfo is not valid json: %@", v15, 0x16u);
    }
    objc_storeStrong(location, 0);
    v13 = 0;
  }
  return v13;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (NSDictionary)eventInfo
{
  return self->_eventInfo;
}

- (void)setEventInfo:(id)a3
{
  objc_storeStrong((id *)&self->_eventInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventInfo, 0);
}

@end
