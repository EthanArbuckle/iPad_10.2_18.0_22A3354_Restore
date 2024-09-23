@implementation TGraphSampler

- (void)setTGraphDataString:(__CFString *)a3
{
  __CFString *tGraphDataString;
  __CFString *v6;

  tGraphDataString = self->tGraphDataString;
  if (tGraphDataString)
    CFRelease(tGraphDataString);
  if (a3)
    v6 = (__CFString *)CFRetain(a3);
  else
    v6 = 0;
  self->tGraphDataString = v6;
}

- (void)logToPowerlog
{
  __uint64_t v3;
  __uint64_t v4;
  OS_dispatch_queue *powerlogQueue;
  OS_dispatch_queue *v6;
  _BOOL4 v7;
  int v8;
  int v9;
  int v10;
  OS_dispatch_queue *v11;
  _QWORD v12[5];
  _QWORD v13[7];
  _QWORD block[5];

  v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v4 = v3 - self->lastLogTimestamp;
  powerlogQueue = self->_powerlogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000098B8;
  block[3] = &unk_10007D248;
  block[4] = self;
  dispatch_async((dispatch_queue_t)powerlogQueue, block);
  v6 = self->_powerlogQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100020250;
  v13[3] = &unk_10007DA90;
  v13[4] = self;
  v13[5] = v4;
  v13[6] = v3;
  dispatch_async((dispatch_queue_t)v6, v13);
  -[TGraphSampler updateLiteModePowerLogDictionaryForSensors](self, "updateLiteModePowerLogDictionaryForSensors");
  v7 = qword_1000A2478
    || -[CommonProduct maxControlEffort](self->productObj, "maxControlEffort") > 0
    || self->gotDataToLogToLiteMode;
  v8 = ++dword_1000A1D48;
  if (byte_1000A1D4C)
    v9 = 1;
  else
    v9 = v7;
  if (v9)
    v10 = 3;
  else
    v10 = 63;
  if ((v10 & v8) == 0)
  {
    byte_1000A1D4C = v7;
    v11 = self->_powerlogQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000202A4;
    v12[3] = &unk_10007D248;
    v12[4] = self;
    dispatch_async((dispatch_queue_t)v11, v12);
  }
}

- (void)updateLiteModePowerLogDictionaryForSensors
{
  int v3;
  CFIndex v4;
  uint64_t v5;
  const void *ValueAtIndex;
  int v7;
  char *v8;
  int v9;
  __int16 v10;

  if (!self->gotDataToLogToLiteMode && self->_powerlogSubkeyController_Sensors_Components)
  {
    v3 = -[CommonProduct totalSensors](self->productObj, "totalSensors");
    if (v3 >= 1)
    {
      v4 = 0;
      v5 = v3;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(-[HidSensors sensorFourCharCode](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "sensorFourCharCode"), v4);
        if (!ValueAtIndex
          || !-[TGraphSampler shouldLogSensorForLiteMode:](self, "shouldLogSensorForLiteMode:", ValueAtIndex))
        {
          goto LABEL_16;
        }
        v7 = *((_DWORD *)&qword_1000A29AC + v4);
        v8 = (char *)self + 4 * v4;
        v9 = *((_DWORD *)v8 + 16);
        v10 = v7 - v9;
        if (v7 - v9 < 0)
          v10 = v9 - v7;
        if (v9 < dword_10009A1F4)
          break;
        if ((v10 & 0xFFFCu) >= 0x64)
          goto LABEL_15;
LABEL_16:
        if (v5 == ++v4)
          goto LABEL_17;
      }
      if (v7 < dword_10009A1F4 || (v10 & 0xFFFCu) <= 0x63)
        goto LABEL_16;
LABEL_15:
      self->gotDataToLogToLiteMode = 1;
      -[PowerlogSubkeyController setIntValue:forKey:](self->_powerlogSubkeyController_Sensors_Components, "setIntValue:forKey:");
      *((_DWORD *)v8 + 16) = *((_DWORD *)&qword_1000A29AC + v4);
      goto LABEL_16;
    }
LABEL_17:
    if (self->gotDataToLogToLiteMode)
    {
      -[PowerlogSubkeyController setIntValue:forKey:](self->_powerlogSubkeyController_Sensors_Components, "setIntValue:forKey:", sub_100008F14(), CFSTR("PG0B"));
      -[PowerlogSubkeyController printPowerLogDictionary](self->_powerlogSubkeyController_Sensors_Components, "printPowerLogDictionary");
    }
  }
}

- (BOOL)shouldLogSensorForLiteMode:(__CFString *)a3
{
  unint64_t v4;
  unint64_t v5;
  CFComparisonResult v6;

  if (CFStringCompare(a3, CFSTR("TG0B"), 0) == kCFCompareEqualTo)
    return 1;
  v4 = 0;
  do
  {
    v5 = v4;
    if (v4 == 12)
      break;
    v6 = CFStringCompare(a3, *(&off_10007D9D8 + v4 + 1), 0);
    v4 = v5 + 1;
  }
  while (v6);
  return v5 < 0xC;
}

- (void)genTGraphData
{
  __CFArray *Mutable;
  __CFArray *v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *listOfSupervisorControl;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  id v14;
  NSMutableArray *listofComponentControl;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  uint64_t v21;
  id v22;
  __CFArray *extratGraphDataSources;
  CFIndex v24;
  void *ValueAtIndex;
  uint64_t v26;
  id v27;
  CFStringRef v28;
  CFStringRef v29;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    v4 = Mutable;
    sub_100006580(Mutable, CFSTR("%d"), 50 * -[CommonProduct thermalState](self->productObj, "thermalState"));
    if (-[CommonProduct totalSensors](self->productObj, "totalSensors") >= 1)
    {
      v5 = 0;
      do
      {
        sub_100006580(v4, CFSTR("%d"), *((unsigned int *)&qword_1000A29AC + v5));
        if (byte_1000A28A8
          && -[HidSensors getFilterTimeConstantForSensor:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getFilterTimeConstantForSensor:", v5))
        {
          sub_100006580(v4, CFSTR("%d"), dword_1000A28AC[v5]);
        }
        ++v5;
      }
      while (v5 < -[CommonProduct totalSensors](self->productObj, "totalSensors"));
    }
    if (-[CommonProduct powerSensors](self->productObj, "powerSensors") >= 1)
    {
      v6 = 0;
      do
        sub_10001FCEC(v4, CFSTR("%f"), dbl_1000A2DC8[v6++]);
      while (v6 < -[CommonProduct powerSensors](self->productObj, "powerSensors"));
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    listOfSupervisorControl = self->listOfSupervisorControl;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(listOfSupervisorControl);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          if ((int)objc_msgSend(v12, "numberOfFields") >= 1)
          {
            v13 = 0;
            do
            {
              v14 = objc_msgSend(v12, "copyFieldCurrentValueForIndex:", v13);
              CFArrayAppendValue(v4, v14);
              if (v14)
                CFRelease(v14);
              v13 = (v13 + 1);
            }
            while ((int)v13 < (int)objc_msgSend(v12, "numberOfFields"));
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v9);
    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    listofComponentControl = self->listofComponentControl;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(listofComponentControl);
          v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j);
          if ((int)objc_msgSend(v20, "numberOfFields") >= 1)
          {
            v21 = 0;
            do
            {
              v22 = objc_msgSend(v20, "copyFieldCurrentValueForIndex:", v21);
              CFArrayAppendValue(v4, v22);
              if (v22)
                CFRelease(v22);
              v21 = (v21 + 1);
            }
            while ((int)v21 < (int)objc_msgSend(v20, "numberOfFields"));
          }
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v17);
    }
    extratGraphDataSources = self->extratGraphDataSources;
    if (extratGraphDataSources && CFArrayGetCount(extratGraphDataSources) >= 1)
    {
      v24 = 0;
      do
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->extratGraphDataSources, v24);
        if ((int)objc_msgSend(ValueAtIndex, "numberOfFields") >= 1)
        {
          v26 = 0;
          do
          {
            v27 = objc_msgSend(ValueAtIndex, "copyFieldCurrentValueForIndex:", v26);
            CFArrayAppendValue(v4, v27);
            if (v27)
              CFRelease(v27);
            v26 = (v26 + 1);
          }
          while ((int)v26 < (int)objc_msgSend(ValueAtIndex, "numberOfFields"));
        }
        ++v24;
      }
      while (CFArrayGetCount(self->extratGraphDataSources) > v24);
    }
    v28 = CFStringCreateByCombiningStrings(kCFAllocatorDefault, v4, CFSTR(", "));
    v29 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR(", %@"), v28);
    -[TGraphSampler setTGraphDataString:](self, "setTGraphDataString:", v29);
    if (v28)
      CFRelease(v28);
    if (v29)
      CFRelease(v29);
    CFRelease(v4);
  }
  else
  {
    v30 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004FF94(v30);
  }
}

- (__CFString)getTGraphData:(int)a3
{
  NSObject *v4;

  if (a3 == 2)
  {
    -[TGraphSampler genTGraphData](self, "genTGraphData");
  }
  else if (a3 == 1)
  {
    -[TGraphSampler genTGraphHeader](self, "genTGraphHeader");
  }
  else
  {
    -[TGraphSampler setTGraphDataString:](self, "setTGraphDataString:", CFSTR("Invalid Key"));
    v4 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004FF54(v4);
  }
  return self->tGraphDataString;
}

+ (id)sharedInstance
{
  if (qword_1000A1D38 != -1)
    dispatch_once(&qword_1000A1D38, &stru_10007DA40);
  return (id)qword_1000A1D40;
}

- (TGraphSampler)init
{
  TGraphSampler *v2;
  TGraphSampler *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TGraphSampler;
  v2 = -[TGraphSampler init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->productObj = 0;
    v2->listofComponentControl = 0;
    v2->listOfSupervisorControl = 0;
    v2->extratGraphDataSources = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v3->tGraphDataString = 0;
    v3->isInternal = 0;
    v3->lastLogTimestamp = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v3->_powerlogSubkeyController_Hotspots = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]([PowerlogSubkeyController alloc], "initForSubkey:", CFSTR("TGraph_HS"));
    v3->_powerlogSubkeyController_Components = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]([PowerlogSubkeyController alloc], "initForSubkey:", CFSTR("TGraph_CP"));
    v3->_powerlogSubkeyController_Sensors = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]([PowerlogSubkeyController alloc], "initForSubkey:", CFSTR("TGraph_S1"));
    v3->_powerlogSubkeyController_MiscInternalState = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]([PowerlogSubkeyController alloc], "initForSubkey:", CFSTR("TGraph_EX"));
    v3->_powerlogSubkeyController_MiscExternalState = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]([PowerlogSubkeyController alloc], "initForSubkey:", CFSTR("TGraph_S2"));
    v3->_powerlogSubkeyController_LiteMode = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]([PowerlogSubkeyController alloc], "initForSubkey:", CFSTR("TGraph_Lite"));
    v3->_powerlogSubkeyController_HiP = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]([PowerlogSubkeyController alloc], "initForSubkey:", CFSTR("TGraph_HiP"));
    v3->_powerlogSubkeyController_Sensors_Components = (PowerlogSubkeyController *)-[PowerlogSubkeyController initForSubkey:]([PowerlogSubkeyController alloc], "initForSubkey:", CFSTR("TGraph_SC"));
    v3->_powerlogQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.powerlog", 0);
    v4 = 0;
    v3->_appleCareState = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 5);
    do
      -[NSMutableArray setObject:atIndexedSubscript:](v3->_appleCareState, "setObject:atIndexedSubscript:", &off_100085090, v4++);
    while (v4 != 5);
    v3->_appleCareStateLastLogged = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v3->_appleCareState);
  }
  return v3;
}

- (void)setProduct:(id)a3 withComponents:(id)a4 andHotspotSupervisors:(id)a5
{
  CommonProduct *productObj;
  NSMutableArray *listofComponentControl;
  NSMutableArray *listOfSupervisorControl;

  productObj = self->productObj;
  if (productObj)
    CFRelease(productObj);
  listofComponentControl = self->listofComponentControl;
  if (listofComponentControl)
    CFRelease(listofComponentControl);
  listOfSupervisorControl = self->listOfSupervisorControl;
  if (listOfSupervisorControl)
    CFRelease(listOfSupervisorControl);
  self->productObj = (CommonProduct *)a3;
  self->listofComponentControl = (NSMutableArray *)a4;
  self->listOfSupervisorControl = (NSMutableArray *)a5;
  self->isInternal = sub_1000038C4();
}

- (void)dealloc
{
  objc_super v3;

  -[TGraphSampler setTGraphDataString:](self, "setTGraphDataString:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TGraphSampler;
  -[TGraphSampler dealloc](&v3, "dealloc");
}

- (void)addtGraphDataSource:(id)a3
{
  __CFArray *extratGraphDataSources;

  extratGraphDataSources = self->extratGraphDataSources;
  if (extratGraphDataSources)
    CFArrayAppendValue(extratGraphDataSources, a3);
}

- (void)updateSubkeyController:(id)a3 forControlList:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (a3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(a4);
          objc_msgSend(a3, "setIntValue:forKey:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "getPowerlogFieldCurrentValue"), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "getPowerlogKey"));
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }
}

- (BOOL)shouldLogSensor:(__CFString *)a3
{
  CFComparisonResult v4;
  unint64_t v5;
  unint64_t v6;
  CFComparisonResult v7;

  LODWORD(v4) = -[HidSensors shouldRetrieveSensor:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "shouldRetrieveSensor:", a3);
  if ((_DWORD)v4)
  {
    v4 = CFStringCompare(a3, CFSTR("Th0x"), 0);
    if (v4)
    {
      v5 = 0;
      do
      {
        v6 = v5;
        if (v5 == 10)
          break;
        v7 = CFStringCompare(a3, *(&off_10007D980 + v5 + 1), 0);
        v5 = v6 + 1;
      }
      while (v7);
      LOBYTE(v4) = v6 > 9;
    }
  }
  return v4;
}

- (void)updatePowerLogDictionaryForSensors
{
  int v3;
  CFIndex v4;
  uint64_t v5;
  const void *ValueAtIndex;
  const void *v7;

  if (self->_powerlogSubkeyController_Sensors)
  {
    v3 = -[CommonProduct totalSensors](self->productObj, "totalSensors");
    if (v3 >= 1)
    {
      v4 = 0;
      v5 = v3;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(-[HidSensors sensorFourCharCode](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "sensorFourCharCode"), v4);
        if (ValueAtIndex)
        {
          v7 = ValueAtIndex;
          if (-[TGraphSampler shouldLogSensor:](self, "shouldLogSensor:", ValueAtIndex))
            -[PowerlogSubkeyController setIntValue:forKey:](self->_powerlogSubkeyController_Sensors, "setIntValue:forKey:", *((unsigned int *)&qword_1000A29AC + v4), v7);
        }
        ++v4;
      }
      while (v5 != v4);
    }
    -[PowerlogSubkeyController setIntValue:forKey:](self->_powerlogSubkeyController_Sensors, "setIntValue:forKey:", sub_100008F14(), CFSTR("PG0B"));
  }
}

- (void)genTGraphHeader
{
  __CFArray *Mutable;
  CFIndex Count;
  CFIndex v5;
  signed int v6;
  CFIndex v7;
  CFIndex v8;
  const __CFString *v9;
  char *v10;
  CFMutableStringRef MutableCopy;
  const __CFString *ValueAtIndex;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  const __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  CFIndex v20;
  uint64_t v21;
  CFIndex v22;
  CFIndex v23;
  __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  CFIndex v27;
  __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  NSMutableArray *listOfSupervisorControl;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  uint64_t v37;
  id v38;
  NSMutableArray *listofComponentControl;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  void *v44;
  uint64_t v45;
  id v46;
  const __CFArray *extratGraphDataSources;
  CFIndex v48;
  void *v49;
  uint64_t v50;
  id v51;
  const void *v52;
  CFStringRef v53;
  uint64_t v54;
  signed int v55;
  CFIndex v56;
  TGraphSampler *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];

  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  CFArrayAppendValue(Mutable, CFSTR("Thermal State"));
  Count = CFArrayGetCount(-[HidSensors hidSensorKeys](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "hidSensorKeys"));
  v5 = CFArrayGetCount(-[HidSensors synthSensorKeys](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "synthSensorKeys"));
  v57 = self;
  v6 = -[CommonProduct powerSensors](self->productObj, "powerSensors");
  v7 = Count - v6;
  if (v7 < 1)
  {
    v20 = 0;
  }
  else
  {
    v55 = v6;
    v8 = 0;
    v9 = CFSTR("(");
    v10 = &byte_1000A28A8;
    do
    {
      MutableCopy = CFStringCreateMutableCopy(0, 0, v9);
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(-[HidSensors sensorFourCharCode](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "sensorFourCharCode"), v8);
      CFStringAppend(MutableCopy, ValueAtIndex);
      CFStringAppend(MutableCopy, CFSTR(")"));
      v13 = (const __CFString *)CFArrayGetValueAtIndex(-[HidSensors hidSensorKeys](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "hidSensorKeys"), v8);
      CFStringAppend(MutableCopy, v13);
      CFArrayAppendValue(Mutable, MutableCopy);
      if (*v10)
      {
        v14 = -[HidSensors getFilterTimeConstantForSensor:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getFilterTimeConstantForSensor:", v8);
        if ((_DWORD)v14)
        {
          v15 = v14;
          v16 = v10;
          v17 = v9;
          v18 = CFStringCreateMutableCopy(0, 0, MutableCopy);
          CFStringAppendFormat(v18, 0, CFSTR("_f%u"), v15);
          CFArrayAppendValue(Mutable, v18);
          v19 = v18;
          v9 = v17;
          v10 = v16;
          CFRelease(v19);
        }
      }
      CFRelease(MutableCopy);
      ++v8;
    }
    while (v7 != v8);
    v20 = v7;
    v6 = v55;
  }
  v21 = v6;
  v22 = v7 + v5;
  if (v5 >= 1)
  {
    v54 = v6;
    v56 = v20;
    v23 = 0;
    do
    {
      v24 = CFStringCreateMutableCopy(0, 0, CFSTR("("));
      v25 = (const __CFString *)CFArrayGetValueAtIndex(-[HidSensors sensorFourCharCode](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "sensorFourCharCode"), v7 + v23);
      CFStringAppend(v24, v25);
      CFStringAppend(v24, CFSTR(")"));
      v26 = (const __CFString *)CFArrayGetValueAtIndex(-[HidSensors synthSensorKeys](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "synthSensorKeys"), v23);
      CFStringAppend(v24, v26);
      CFArrayAppendValue(Mutable, v24);
      CFRelease(v24);
      ++v23;
    }
    while (v7 + v23 < v22);
    v21 = v54;
    v20 = v56 + v23;
  }
  v27 = v20 + v21;
  if (v22 < v20 + v21)
  {
    do
    {
      v28 = CFStringCreateMutableCopy(0, 0, CFSTR("("));
      v29 = (const __CFString *)CFArrayGetValueAtIndex(-[HidSensors sensorFourCharCode](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "sensorFourCharCode"), v5 + v7);
      CFStringAppend(v28, v29);
      CFStringAppend(v28, CFSTR(")"));
      v30 = (const __CFString *)CFArrayGetValueAtIndex(-[HidSensors hidSensorKeys](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "hidSensorKeys"), v7);
      CFStringAppend(v28, v30);
      CFArrayAppendValue(Mutable, v28);
      CFRelease(v28);
      ++v7;
    }
    while (v5 + v7 < v27);
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  listOfSupervisorControl = v57->listOfSupervisorControl;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v63 != v34)
          objc_enumerationMutation(listOfSupervisorControl);
        v36 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
        if ((int)objc_msgSend(v36, "numberOfFields") >= 1)
        {
          v37 = 0;
          do
          {
            v38 = objc_msgSend(v36, "copyHeaderForIndex:", v37);
            CFArrayAppendValue(Mutable, v38);
            if (v38)
              CFRelease(v38);
            v37 = (v37 + 1);
          }
          while ((int)v37 < (int)objc_msgSend(v36, "numberOfFields"));
        }
      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listOfSupervisorControl, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v33);
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  listofComponentControl = v57->listofComponentControl;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(_QWORD *)v59 != v42)
          objc_enumerationMutation(listofComponentControl);
        v44 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
        if ((int)objc_msgSend(v44, "numberOfFields") >= 1)
        {
          v45 = 0;
          do
          {
            v46 = objc_msgSend(v44, "copyHeaderForIndex:", v45);
            CFArrayAppendValue(Mutable, v46);
            if (v46)
              CFRelease(v46);
            v45 = (v45 + 1);
          }
          while ((int)v45 < (int)objc_msgSend(v44, "numberOfFields"));
        }
      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](listofComponentControl, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v41);
  }
  extratGraphDataSources = v57->extratGraphDataSources;
  if (extratGraphDataSources && CFArrayGetCount(extratGraphDataSources) >= 1)
  {
    v48 = 0;
    do
    {
      v49 = (void *)CFArrayGetValueAtIndex(v57->extratGraphDataSources, v48);
      if ((int)objc_msgSend(v49, "numberOfFields") >= 1)
      {
        v50 = 0;
        do
        {
          v51 = objc_msgSend(v49, "copyHeaderForIndex:", v50);
          if (v51)
          {
            v52 = v51;
            CFArrayAppendValue(Mutable, v51);
            CFRelease(v52);
          }
          v50 = (v50 + 1);
        }
        while ((int)v50 < (int)objc_msgSend(v49, "numberOfFields"));
      }
      ++v48;
    }
    while (CFArrayGetCount(v57->extratGraphDataSources) > v48);
  }
  v53 = CFStringCreateByCombiningStrings(kCFAllocatorDefault, Mutable, CFSTR(", "));
  -[TGraphSampler setTGraphDataString:](v57, "setTGraphDataString:", v53);
  if (Mutable)
    CFRelease(Mutable);
  if (v53)
    CFRelease(v53);
}

- (void)updatePowerlogMiscState:(int)a3 value:(int)a4
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  OS_dispatch_queue *powerlogQueue;
  _QWORD block[6];
  int v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;

  if (a3 <= 6)
  {
    v7 = (uint64_t)*(&off_10007D948 + a3);
    if (byte_1000A2480)
    {
      v8 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v15 = "-[TGraphSampler updatePowerlogMiscState:value:]";
        v16 = 2112;
        v17 = v7;
        v18 = 1024;
        v19 = a4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> %s: key %@, value %d", buf, 0x1Cu);
      }
    }
    v9 = 360;
    if (a3 != 2 && a3 != 4)
    {
      if (!self->isInternal)
        return;
      v9 = 352;
    }
    v10 = *(uint64_t *)((char *)&self->super.isa + v9);
    if (v10)
    {
      powerlogQueue = self->_powerlogQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001FEB8;
      block[3] = &unk_10007D200;
      v13 = a4;
      block[4] = v10;
      block[5] = v7;
      dispatch_async((dispatch_queue_t)powerlogQueue, block);
    }
  }
}

- (void)updatePowerlogLiteMode:(int64_t)a3 pressureLevel:(int64_t)a4
{
  NSArray *v7;
  OS_dispatch_queue *powerlogQueue;
  _QWORD block[6];
  timeval v10;

  v10.tv_sec = 0;
  *(_QWORD *)&v10.tv_usec = 0;
  if (!gettimeofday(&v10, 0))
  {
    v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v10.tv_usec / 1000000.0 + (double)v10.tv_sec), +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3), +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4), 0);
    powerlogQueue = self->_powerlogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001FFC0;
    block[3] = &unk_10007DA68;
    block[4] = self;
    block[5] = v7;
    dispatch_async((dispatch_queue_t)powerlogQueue, block);
  }
}

- (void)updatePowerLogLiteHiP:(char)a3 client:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSArray *v7;
  OS_dispatch_queue *powerlogQueue;
  _QWORD block[6];
  timeval v10;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v10.tv_sec = 0;
  *(_QWORD *)&v10.tv_usec = 0;
  if (!gettimeofday(&v10, 0))
  {
    v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v10.tv_usec / 1000000.0 + (double)v10.tv_sec), +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", v5), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4), 0);
    powerlogQueue = self->_powerlogQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000200E4;
    block[3] = &unk_10007DA68;
    block[4] = self;
    block[5] = v7;
    dispatch_async((dispatch_queue_t)powerlogQueue, block);
  }
}

- (void)updateAppleCareState:(int)a3 value:(int)a4
{
  NSObject *v7;
  OS_dispatch_queue *powerlogQueue;
  _QWORD v9[5];
  int v10;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;

  if (a3 <= 4)
  {
    if (byte_1000A2480)
    {
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = "-[TGraphSampler updateAppleCareState:value:]";
        v14 = 1024;
        v15 = a3;
        v16 = 1024;
        v17 = a4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> %s: stateType %d, value %d", buf, 0x18u);
      }
    }
    powerlogQueue = self->_powerlogQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100020214;
    v9[3] = &unk_10007D188;
    v9[4] = self;
    v10 = a3;
    v11 = a4;
    dispatch_async((dispatch_queue_t)powerlogQueue, v9);
  }
}

@end
