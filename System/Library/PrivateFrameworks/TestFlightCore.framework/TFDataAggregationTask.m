@implementation TFDataAggregationTask

+ (id)deviceType
{
  return (id)objc_msgSend(MEMORY[0x24BE08118], "productType");
}

+ (CGSize)screenDimensions
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (double)batteryLevel
{
  void *v2;
  float v3;
  float v4;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBatteryMonitoringEnabled:", 1);
  objc_msgSend(v2, "batteryLevel");
  v4 = v3;
  objc_msgSend(v2, "setBatteryMonitoringEnabled:", 0);

  return v4;
}

+ (id)deviceInfoTask
{
  TFDataAggregationTask *v2;
  void *v3;
  TFDataAggregationTask *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v2 = [TFDataAggregationTask alloc];
  v6[0] = CFSTR("l");
  v6[1] = CFSTR("m");
  v6[2] = CFSTR("n");
  v6[3] = CFSTR("o");
  v6[4] = CFSTR("p");
  v6[5] = CFSTR("q");
  v6[6] = CFSTR("r");
  v6[7] = CFSTR("s");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TFDataAggregationTask initWithName:providedEntryIdentifiers:](v2, "initWithName:providedEntryIdentifiers:", CFSTR("DeviceInfo"), v3);

  -[TFDataAggregationTask setLoadDataBlock:](v4, "setLoadDataBlock:", &__block_literal_global);
  -[TFDataAggregationTask setExtractValuesBlock:](v4, "setExtractValuesBlock:", &__block_literal_global_9);
  return v4;
}

void __51__TFDataAggregationTask_DeviceInfo__deviceInfoTask__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  void (**v3)(id, id, _QWORD);
  id v4;
  const NXArchInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v2 = (objc_class *)MEMORY[0x24BDBCED8];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  v5 = NXGetLocalArchInfo();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5->name);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("l"));
  }
  +[TFDataAggregationTask deviceType](TFDataAggregationTask, "deviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("m"));

  objc_msgSend(MEMORY[0x24BE08118], "productVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("n"));
  +[TFDataAggregationTask screenDimensions](TFDataAggregationTask, "screenDimensions");
  v11 = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("o"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("p"));

  +[TFDataAggregationTask batteryLevel](TFDataAggregationTask, "batteryLevel");
  if (v15 >= 0.0)
  {
    LODWORD(v14) = llround(v15 * 100.0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("q"));

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSHomeDirectory();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v17, "attributesOfFileSystemForPath:error:", v18, &v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D28]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D18]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("r"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("s"));
  v3[2](v3, v4, 0);

}

void __51__TFDataAggregationTask_DeviceInfo__deviceInfoTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__TFDataAggregationTask_DeviceInfo__deviceInfoTask__block_invoke_3;
  v6[3] = &unk_24D794648;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a3, "performBatchUpdates:", v6);

}

void __51__TFDataAggregationTask_DeviceInfo__deviceInfoTask__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("l"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStringForIdentifier:toValue:", CFSTR("l"), v5);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("m"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStringForIdentifier:toValue:", CFSTR("m"), v6);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStringForIdentifier:toValue:", CFSTR("n"), v7);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("o"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberForIdentifier:toValue:", CFSTR("o"), v8);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("p"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberForIdentifier:toValue:", CFSTR("p"), v9);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("q"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberForIdentifier:toValue:", CFSTR("q"), v10);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("r"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberForIdentifier:toValue:", CFSTR("r"), v11);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("s"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberForIdentifier:toValue:", CFSTR("s"), v12);

}

+ (id)networkInfoTask
{
  TFDataAggregationTask *v3;
  void *v4;
  TFDataAggregationTask *v5;
  _QWORD v7[5];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v3 = [TFDataAggregationTask alloc];
  v8[0] = CFSTR("t");
  v8[1] = CFSTR("u");
  v8[2] = CFSTR("v");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TFDataAggregationTask initWithName:providedEntryIdentifiers:](v3, "initWithName:providedEntryIdentifiers:", CFSTR("NetworkInfo"), v4);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__TFDataAggregationTask_NetworkInfo__networkInfoTask__block_invoke;
  v7[3] = &__block_descriptor_40_e25_v16__0___v_____NSError__8l;
  v7[4] = a1;
  -[TFDataAggregationTask setLoadDataBlock:](v5, "setLoadDataBlock:", v7);
  -[TFDataAggregationTask setExtractValuesBlock:](v5, "setExtractValuesBlock:", &__block_literal_global_1);
  return v5;
}

void __53__TFDataAggregationTask_NetworkInfo__networkInfoTask__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  void (**v4)(id, id, _QWORD);
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a2;
  v7 = objc_alloc_init(v3);
  objc_msgSend(*(id *)(a1 + 32), "cellularServiceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v7, "addEntriesFromDictionary:", v5);
  objc_msgSend(*(id *)(a1 + 32), "networkType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("v"));

  v4[2](v4, v7, 0);
}

void __53__TFDataAggregationTask_NetworkInfo__networkInfoTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__TFDataAggregationTask_NetworkInfo__networkInfoTask__block_invoke_3;
  v6[3] = &unk_24D794648;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a3, "performBatchUpdates:", v6);

}

void __53__TFDataAggregationTask_NetworkInfo__networkInfoTask__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStringForIdentifier:toValue:", CFSTR("t"), v5);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("u"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStringForIdentifier:toValue:", CFSTR("u"), v6);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("v"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStringForIdentifier:toValue:", CFSTR("v"), v7);

}

+ (id)cellularServiceInfo
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[11];
  _QWORD v21[12];

  v21[11] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDC25F8];
  v20[0] = *MEMORY[0x24BDC2600];
  v20[1] = v2;
  v21[0] = CFSTR("GPRS");
  v21[1] = CFSTR("Edge");
  v3 = *MEMORY[0x24BDC2608];
  v20[2] = *MEMORY[0x24BDC2630];
  v20[3] = v3;
  v21[2] = CFSTR("WCDMA");
  v21[3] = CFSTR("HSDPA");
  v4 = *MEMORY[0x24BDC25D8];
  v20[4] = *MEMORY[0x24BDC2610];
  v20[5] = v4;
  v21[4] = CFSTR("HSUPA");
  v21[5] = CFSTR("CDMA 1x");
  v5 = *MEMORY[0x24BDC25E8];
  v20[6] = *MEMORY[0x24BDC25E0];
  v20[7] = v5;
  v21[6] = CFSTR("CDMA EV-DO Rev 0");
  v21[7] = CFSTR("CDMA EV-DO Rev A");
  v6 = *MEMORY[0x24BDC2638];
  v20[8] = *MEMORY[0x24BDC25F0];
  v20[9] = v6;
  v21[8] = CFSTR("CDMA EV-DO Rev B");
  v21[9] = CFSTR("HRPD");
  v20[10] = *MEMORY[0x24BDC2618];
  v21[10] = CFSTR("LTE");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDC27F8]);
  objc_msgSend(v8, "serviceSubscriberCellularProviders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "carrierName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("t"));
    objc_msgSend(v8, "serviceCurrentRadioAccessTechnology");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("u"));

    v18 = (void *)objc_msgSend(v12, "copy");
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)networkType
{
  void *v2;
  void *v3;
  const __CFString *v4;

  objc_msgSend(MEMORY[0x24BDE07E8], "sharedDefaultEvaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "usesInterfaceType:", 1) & 1) != 0)
  {
    v4 = CFSTR("WI_FI");
  }
  else if ((objc_msgSend(v3, "usesInterfaceType:", 2) & 1) != 0)
  {
    v4 = CFSTR("MOBILE_DATA");
  }
  else if (objc_msgSend(v3, "usesInterfaceType:", 3))
  {
    v4 = CFSTR("WIRE");
  }
  else
  {
    v4 = CFSTR("NONE");
  }

  return (id)v4;
}

+ (id)sessionInfoTaskForIdentifier:(id)a3
{
  id v3;
  TFDataAggregationTask *v4;
  void *v5;
  TFDataAggregationTask *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [TFDataAggregationTask alloc];
  v11[0] = CFSTR("i");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TFDataAggregationTask initWithName:providedEntryIdentifiers:](v4, "initWithName:providedEntryIdentifiers:", CFSTR("SessionInfo"), v5);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__TFDataAggregationTask_SessionInfo__sessionInfoTaskForIdentifier___block_invoke;
  v9[3] = &unk_24D794858;
  v10 = v3;
  v7 = v3;
  -[TFDataAggregationTask setLoadDataBlock:](v6, "setLoadDataBlock:", v9);
  -[TFDataAggregationTask setExtractValuesBlock:](v6, "setExtractValuesBlock:", &__block_literal_global_2);

  return v6;
}

void __67__TFDataAggregationTask_SessionInfo__sessionInfoTaskForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  void (**v4)(id, void *, _QWORD);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  size_t v19;
  _OWORD v20[41];
  int v21[2];
  int v22;
  int v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BE08A08];
  v4 = a2;
  v5 = [v3 alloc];
  v26[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithBundleIDs:states:", v6, *MEMORY[0x24BE089E0]);

  objc_msgSend(v7, "applicationInfoForApplication:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE08A00]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    *(_QWORD *)v21 = 0xE00000001;
    v22 = 1;
    v23 = objc_msgSend(v9, "intValue");
    memset(v20, 0, 512);
    v19 = 648;
    sysctl(v21, 4u, v20, &v19, 0, 0);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)*(uint64_t *)&v20[0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v11);
    v14 = v13;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v15, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to find pid for %@. This process may be missing an entitlement or specified process may not be running"), *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0BA0];
    v25 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("TFErrorDomain"), 201, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v18);

  }
}

void __67__TFDataAggregationTask_SessionInfo__sessionInfoTaskForIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__TFDataAggregationTask_SessionInfo__sessionInfoTaskForIdentifier___block_invoke_3;
  v6[3] = &unk_24D794648;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a3, "performBatchUpdates:", v6);

}

uint64_t __67__TFDataAggregationTask_SessionInfo__sessionInfoTaskForIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNumberForIdentifier:toValue:", CFSTR("i"), *(_QWORD *)(a1 + 32));
}

- (TFDataAggregationTask)initWithName:(id)a3 providedEntryIdentifiers:(id)a4
{
  id v6;
  id v7;
  TFDataAggregationTask *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSArray *providedEntryIdentifiers;
  uint64_t v13;
  NSString *logKey;
  id loadDataBlock;
  id extractValuesBlock;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TFDataAggregationTask;
  v8 = -[TFDataAggregationTask init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    providedEntryIdentifiers = v8->_providedEntryIdentifiers;
    v8->_providedEntryIdentifiers = (NSArray *)v11;

    AMSGenerateLogCorrelationKey();
    v13 = objc_claimAutoreleasedReturnValue();
    logKey = v8->_logKey;
    v8->_logKey = (NSString *)v13;

    loadDataBlock = v8->_loadDataBlock;
    v8->_loadDataBlock = 0;

    extractValuesBlock = v8->_extractValuesBlock;
    v8->_extractValuesBlock = 0;

  }
  return v8;
}

- (void)loadDataOnQueue:(id)a3 withCompletionHandler:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generatedLogger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    -[TFDataAggregationTask name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFDataAggregationTask logKey](self, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_2174E1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] loadDataOnQueue:withCompletionHandler:", buf, 0x20u);

  }
  -[TFDataAggregationTask loadDataBlock](self, "loadDataBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __63__TFDataAggregationTask_loadDataOnQueue_withCompletionHandler___block_invoke;
  v16[3] = &unk_24D794970;
  v16[4] = self;
  v17 = v7;
  v14 = v7;
  dispatch_async(v6, v16);

}

void __63__TFDataAggregationTask_loadDataOnQueue_withCompletionHandler___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "loadDataBlock");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)extractDataPropertiesFromData:(id)a3 intoDataContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generatedLogger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    -[TFDataAggregationTask name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFDataAggregationTask logKey](self, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_2174E1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] extractDataPropertiesFromData:intoDataContainer:", (uint8_t *)&v16, 0x20u);

  }
  -[TFDataAggregationTask extractValuesBlock](self, "extractValuesBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  -[TFDataAggregationTask extractValuesBlock](self, "extractValuesBlock");
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))v14)[2](v14, v6, v7);

}

- (id)loadDataBlock
{
  return self->_loadDataBlock;
}

- (void)setLoadDataBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)extractValuesBlock
{
  return self->_extractValuesBlock;
}

- (void)setExtractValuesBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (NSArray)providedEntryIdentifiers
{
  return self->_providedEntryIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providedEntryIdentifiers, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_extractValuesBlock, 0);
  objc_storeStrong(&self->_loadDataBlock, 0);
}

+ (id)snapshotTasksForSession:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TFDataAggregationTask sessionInfoTaskForIdentifier:](TFDataAggregationTask, "sessionInfoTaskForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  +[TFDataAggregationTask networkInfoTask](TFDataAggregationTask, "networkInfoTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)anytimeTasksForSession:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  +[TFDataAggregationTask watchInfoTask](TFDataAggregationTask, "watchInfoTask", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TFDataAggregationTask deviceInfoTask](TFDataAggregationTask, "deviceInfoTask", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  +[TFDataAggregationTask regionInfoTask](TFDataAggregationTask, "regionInfoTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)regionInfoTask
{
  TFDataAggregationTask *v2;
  void *v3;
  TFDataAggregationTask *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = [TFDataAggregationTask alloc];
  v6[0] = CFSTR("w");
  v6[1] = CFSTR("x");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TFDataAggregationTask initWithName:providedEntryIdentifiers:](v2, "initWithName:providedEntryIdentifiers:", CFSTR("RegionInfo"), v3);

  -[TFDataAggregationTask setLoadDataBlock:](v4, "setLoadDataBlock:", &__block_literal_global_7);
  -[TFDataAggregationTask setExtractValuesBlock:](v4, "setExtractValuesBlock:", &__block_literal_global_7);
  return v4;
}

void __51__TFDataAggregationTask_RegionInfo__regionInfoTask__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  void (**v3)(id, id, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (objc_class *)MEMORY[0x24BDBCED8];
  v3 = a2;
  v8 = objc_alloc_init(v2);
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("w"));
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("x"));
  v3[2](v3, v8, 0);

}

void __51__TFDataAggregationTask_RegionInfo__regionInfoTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__TFDataAggregationTask_RegionInfo__regionInfoTask__block_invoke_3;
  v6[3] = &unk_24D794648;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a3, "performBatchUpdates:", v6);

}

void __51__TFDataAggregationTask_RegionInfo__regionInfoTask__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("w"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStringForIdentifier:toValue:", CFSTR("w"), v5);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("x"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStringForIdentifier:toValue:", CFSTR("x"), v6);

}

+ (id)watchInfoTask
{
  TFDataAggregationTask *v2;
  void *v3;
  TFDataAggregationTask *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = [TFDataAggregationTask alloc];
  v6[0] = CFSTR("j");
  v6[1] = CFSTR("k");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TFDataAggregationTask initWithName:providedEntryIdentifiers:](v2, "initWithName:providedEntryIdentifiers:", CFSTR("WatchInfo"), v3);

  -[TFDataAggregationTask setLoadDataBlock:](v4, "setLoadDataBlock:", &__block_literal_global_8);
  -[TFDataAggregationTask setExtractValuesBlock:](v4, "setExtractValuesBlock:", &__block_literal_global_5_0);
  return v4;
}

void __49__TFDataAggregationTask_WatchInfo__watchInfoTask__block_invoke(uint64_t a1, void *a2)
{
  void (**v2)(id, id, _QWORD);
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  id v18;
  void (**v19)(id, id, _QWORD);
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAllDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v19 = v2;
    v8 = *(_QWORD *)v21;
    v9 = *MEMORY[0x24BE6B358];
    v10 = *MEMORY[0x24BE6B338];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v12)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "valueForProperty:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "BOOLValue");

          objc_msgSend(v12, "valueForProperty:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "BOOLValue");

          if (v14 && v16 != 0)
          {
            v18 = v12;
            goto LABEL_15;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
    v18 = 0;
LABEL_15:
    v2 = v19;
  }
  else
  {
    v18 = 0;
  }

  v2[2](v2, v18, 0);
}

void __49__TFDataAggregationTask_WatchInfo__watchInfoTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a2;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__TFDataAggregationTask_WatchInfo__watchInfoTask__block_invoke_3;
    v6[3] = &unk_24D794648;
    v7 = v4;
    objc_msgSend(a3, "performBatchUpdates:", v6);

  }
}

void __49__TFDataAggregationTask_WatchInfo__watchInfoTask__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x24BE6B328];
  v5 = a2;
  objc_msgSend(v3, "valueForProperty:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStringForIdentifier:toValue:", CFSTR("j"), v6);

  objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", *MEMORY[0x24BE6B3F0]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStringForIdentifier:toValue:", CFSTR("k"), v7);

}

@end
