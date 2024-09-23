@implementation AXPhoenixAnalytics

- (AXPhoenixAnalytics)init
{
  id location;

  location = self;
  objc_storeStrong(&location, 0);
  return 0;
}

- (AXPhoenixAnalytics)initWithConfiguration:(id)a3 modelVersion:(id)a4 assetVersion:(unint64_t)a5
{
  AXPhoenixAnalytics *v5;
  NSDateFormatter *v6;
  NSDateFormatter *dateFormatter;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  AXPhoenixAnalytics *v11;
  NSObject *v14;
  objc_super v15;
  unint64_t v16;
  id v17;
  id location[2];
  AXPhoenixAnalytics *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = a5;
  v5 = v19;
  v19 = 0;
  v15.receiver = v5;
  v15.super_class = (Class)AXPhoenixAnalytics;
  v19 = -[AXPhoenixAnalytics init](&v15, sel_init);
  objc_storeStrong((id *)&v19, v19);
  if (v19)
  {
    if (v17)
      objc_storeStrong((id *)&v19->_modelVersion, v17);
    else
      objc_storeStrong((id *)&v19->_modelVersion, &stru_24F18FC50);
    v19->_assetVersion = v16;
    v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateFormatter = v19->_dateFormatter;
    v19->_dateFormatter = v6;

    -[NSDateFormatter setDateFormat:](v19->_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'_'HH:mm:ss:SSS"));
    objc_storeStrong((id *)&v19->_configuration, location[0]);
    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v8 = dispatch_queue_create("com.apple.accessibility.analyticswriter", v14);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v14, 0);
  }
  v11 = v19;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v11;
}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5 completion:(id)a6
{
  AXPhoenixAnalyticsEvent *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  __CFString *v19;
  const __CFString *v20;
  id v21;
  __CFString *v22;
  void *v23;
  void (**v24)(id, _QWORD);
  id v25;
  id v26;
  AXPhoenixAnalyticsEvent *v28;
  _QWORD __b[8];
  uint64_t v30;
  id v31;
  int v32;
  os_log_type_t type;
  os_log_t oslog;
  id v35;
  id location[2];
  int64_t v37;
  SEL v38;
  AXPhoenixAnalytics *v39;
  _BYTE v40[128];
  _QWORD v41[4];
  _QWORD v42[4];
  uint64_t v43;
  const __CFString *v44;
  uint8_t v45[24];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v39 = self;
  v38 = a2;
  v37 = a3;
  location[1] = (id)a4;
  location[0] = 0;
  objc_storeStrong(location, a5);
  v35 = 0;
  objc_storeStrong(&v35, a6);
  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", location[0]) & 1) != 0)
  {
    v21 = objc_alloc(MEMORY[0x24BDBCED8]);
    v41[0] = CFSTR("configFileMajorVersion");
    v22 = -[AXPhoenixConfiguration majorVersion](v39->_configuration, "majorVersion");
    if (v22)
      v20 = v22;
    else
      v20 = &stru_24F18FC50;
    v42[0] = v20;
    v41[1] = CFSTR("configFileMinorVersion");
    v19 = -[AXPhoenixConfiguration minorVersion](v39->_configuration, "minorVersion");
    if (v19)
      v18 = v19;
    else
      v18 = &stru_24F18FC50;
    v42[1] = v18;
    v41[2] = CFSTR("assetVersion");
    v15 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v39->_assetVersion);
    v42[2] = v15;
    v41[3] = CFSTR("eventType");
    v14 = -[AXPhoenixAnalytics _descriptionForEventType:](v39, "_descriptionForEventType:", v37);
    v42[3] = v14;
    v13 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
    v31 = (id)objc_msgSend(v21, "initWithDictionary:");

    memset(__b, 0, sizeof(__b));
    v16 = (id)objc_msgSend(location[0], "allKeys");
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
    if (v17)
    {
      v10 = *(_QWORD *)__b[2];
      v11 = 0;
      v12 = v17;
      while (1)
      {
        v9 = v11;
        if (*(_QWORD *)__b[2] != v10)
          objc_enumerationMutation(v16);
        v30 = *(_QWORD *)(__b[1] + 8 * v11);
        v7 = v31;
        v8 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", v30);
        objc_msgSend(v7, "setValue:forKey:");

        ++v11;
        if (v9 + 1 >= v12)
        {
          v11 = 0;
          v12 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
          if (!v12)
            break;
        }
      }
    }

    v6 = [AXPhoenixAnalyticsEvent alloc];
    v28 = -[AXPhoenixAnalyticsEvent initWithEventType:eventInfo:](v6, "initWithEventType:eventInfo:", v37, v31);
    -[AXPhoenixAnalytics _sendEvent:completion:](v39, "_sendEvent:completion:", v28, v35);
    objc_storeStrong((id *)&v28, 0);
    objc_storeStrong(&v31, 0);
    v32 = 0;
  }
  else
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v45, (uint64_t)"-[AXPhoenixAnalytics logEventWithType:machAbsoluteTime:context:completion:]", (uint64_t)location[0]);
      _os_log_error_impl(&dword_228CDB000, oslog, type, "[PHOENIX] %s Dictionary is not valid json: %@", v45, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v35)
    {
      v24 = (void (**)(id, _QWORD))v35;
      v23 = (void *)MEMORY[0x24BDD1540];
      v43 = *MEMORY[0x24BDD0FC8];
      v44 = CFSTR("Dictionary is not valid json");
      v26 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v25 = (id)objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("AXPhoenixErrorDomain"), 1003);
      v24[2](v24, 0);

    }
    v32 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

- (void)_sendEvent:(id)a3 completion:(id)a4
{
  id v5;
  os_log_type_t v6;
  id v7;
  id v8;
  id v9;
  id location[3];
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = (id)objc_msgSend(location[0], "description");
  v7 = (id)AXLogBackTap();
  v6 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v11, (uint64_t)"-[AXPhoenixAnalytics _sendEvent:completion:]", (uint64_t)v8);
    _os_log_impl(&dword_228CDB000, (os_log_t)v7, v6, "[PHOENIX] %s Back Tap Event: %{public}@", v11, 0x16u);
  }
  objc_storeStrong(&v7, 0);
  v5 = location[0];
  AnalyticsSendEventLazy();
  if (v9)
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __44__AXPhoenixAnalytics__sendEvent_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventInfo", a1, a1);
}

- (id)_descriptionForEventType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 3)
    __asm { BR              X8 }
  return CFSTR("AXPhoenixAnalyticsEventTypeUnspecified");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
