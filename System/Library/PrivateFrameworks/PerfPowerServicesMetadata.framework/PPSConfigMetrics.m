@implementation PPSConfigMetrics

+ (id)subsystem
{
  return CFSTR("ConfigMetrics");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "configMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "deviceCapabilityMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend((id)objc_opt_class(), "consoleModeEnabledMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  objc_msgSend((id)objc_opt_class(), "sysdiagnoseEventMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  objc_msgSend((id)objc_opt_class(), "cpuCoreConfigMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v7);

  objc_msgSend((id)objc_opt_class(), "buddyDataMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v8);

  return v2;
}

+ (id)configMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  void *v7;
  void *v8;
  void *v9;
  PPSMetric *v10;
  void *v11;
  void *v12;
  void *v13;
  PPSMetric *v14;
  void *v15;
  void *v16;
  void *v17;
  PPSMetric *v18;
  void *v19;
  void *v20;
  void *v21;
  PPSMetric *v22;
  void *v23;
  void *v24;
  void *v25;
  PPSMetric *v26;
  PPSMetric *v27;
  void *v28;
  void *v29;
  void *v30;
  PPSMetric *v31;
  void *v32;
  PPSMetric *v34;
  PPSMetric *v35;
  void *v37;
  PPSMetric *v38;
  PPSMetric *v39;
  PPSMetric *v40;
  _QWORD v41[10];

  v41[8] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("BootArgs"), v3, CFSTR("DeviceConfig"), 3, v4, v5, 1.02, 0x200000001, 0x10000000ELL, 0x100000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Build"), v7, CFSTR("DeviceConfig"), 3, v8, v9, 1.02, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, 0);

  v10 = [PPSMetric alloc];
  +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v10, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Device"), v11, CFSTR("DeviceConfig"), 3, v12, v13, 1.02, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, 0);

  v14 = [PPSMetric alloc];
  +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v14, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("DeviceCoverGlassCoating"), v15, CFSTR("DeviceConfig"), 7, v16, v17, 2.01, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, 0);

  objc_msgSend(a1, "constructDeviceTypeMetric");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [PPSMetric alloc];
  +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v18, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("DeviceBootTime"), v19, CFSTR("DeviceConfig"), 4, v20, v21, 1.01, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, 0);

  v22 = [PPSMetric alloc];
  +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v22, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("ShutdownReason"), v23, CFSTR("DeviceConfig"), 3, v24, v25, 1.01, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, 0);

  v27 = [PPSMetric alloc];
  +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v27, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("BootReason"), v28, CFSTR("DeviceConfig"), 3, v29, v30, 1.01, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, 0);

  v41[0] = v40;
  v41[1] = v39;
  v41[2] = v38;
  v41[3] = v37;
  v41[4] = v34;
  v41[5] = v35;
  v41[6] = v26;
  v41[7] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)constructDeviceTypeMetric
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PPSMetric *v12;
  void *v13;
  void *v14;
  void *v15;
  PPSMetric *v16;
  void *v18;
  _QWORD v19[9];
  _QWORD v20[9];
  const __CFString *v21;
  _QWORD v22[3];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v21 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v18;
  v20[0] = CFSTR("iPhone");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v2;
  v20[1] = CFSTR("iPad");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v3;
  v20[2] = CFSTR("iPod");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v4;
  v20[3] = CFSTR("Watch");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v5;
  v20[4] = CFSTR("Mac");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v6;
  v20[5] = CFSTR("HomePod");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v7;
  v20[6] = CFSTR("AppleTV");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 86);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v8;
  v20[7] = CFSTR("VisionPro");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v9;
  v20[8] = CFSTR("Other");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [PPSMetric alloc];
  +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v12, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("DeviceType"), v13, CFSTR("DeviceConfig"), 7, v14, v15, 3.01, 0x200000001, 0x10000000ELL, 0x300000001, 0x100000001, v11);

  return v16;
}

+ (id)deviceCapabilityMetrics
{
  void *v2;
  uint64_t v3;
  PPSMetric *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PPSMetric *v9;

  v2 = (void *)objc_opt_new();
  v3 = 0;
  do
  {
    v4 = [PPSMetric alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Capability%d"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSUnit dimensionless](PPSUnit, "dimensionless");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", v5, v6, CFSTR("DeviceCapability"), 5, v7, v8, 2.0, 0x200000001, 0x100000001, 0x300000001, 0x100000001, 0);

    objc_msgSend(v2, "addObject:", v9);
    v3 = (v3 + 1);
  }
  while ((_DWORD)v3 != 22);
  return v2;
}

+ (id)consoleModeEnabledMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PPSMetric *v7;
  void *v8;
  void *v9;
  void *v10;
  PPSMetric *v11;
  void *v12;
  PPSMetric *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v17[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v16[0] = CFSTR("Disabled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  v16[1] = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v17[1] = CFSTR("MetricType");
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [PPSMetric alloc];
  +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Enabled"), v8, CFSTR("ConsoleModeEnabled"), 5, v9, v10, 2.01, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v6);

  v14 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)sysdiagnoseEventMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Start"), v3, CFSTR("SysdiagnoseEvent"), 5, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, 0);

  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)cpuCoreConfigMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  PPSMetric *v7;
  void *v8;
  PPSMetric *v9;
  PPSMetric *v10;
  void *v11;
  PPSMetric *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("numCoreTypes"), v3, CFSTR("CPUCoreConfig"), 7, v4, v5, 1.0, 0x200000001, 0x100000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("numEcpuCores"), 7, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("numPcpuCores"), 7, v11, v9, 0, 1.0);

  v15[0] = v6;
  v15[1] = v9;
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)buddyDataMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PPSMetric *v8;
  void *v9;
  void *v10;
  void *v11;
  PPSMetric *v12;
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[4];
  _QWORD v20[4];
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v21 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  v20[0] = CFSTR("None");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  v20[1] = CFSTR("Cloud Restore");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v4;
  v20[2] = CFSTR("Migrate");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v20[3] = CFSTR("From Android");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PPSMetric alloc];
  +[PPSConfigMetrics subsystem](PPSConfigMetrics, "subsystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v8, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("TransferMethod"), v9, CFSTR("BuddyData"), 7, v10, v11, 1.0, 0x200000001, 0x100000001, 0x300000001, 0x100000001, v7);

  v13 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("SetupDate"), 8, v14, v12, 0, 1.0);

  v18[0] = v12;
  v18[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
