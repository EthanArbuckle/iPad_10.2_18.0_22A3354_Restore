@implementation PPSIOReportMetrics

+ (id)subsystem
{
  return CFSTR("IOReportMetrics");
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "amcStatsPerfCountersMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "socStatsEventsMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend((id)objc_opt_class(), "socStatsPmgrCountersMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  objc_msgSend((id)objc_opt_class(), "socStatsOprtpMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  objc_msgSend((id)objc_opt_class(), "socStatsIdsFuseMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v7);

  objc_msgSend((id)objc_opt_class(), "socStatsDeviceStatesMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v8);

  objc_msgSend((id)objc_opt_class(), "pmpDcsFloorMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v9);

  objc_msgSend((id)objc_opt_class(), "pmpSocFloorMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v10);

  objc_msgSend((id)objc_opt_class(), "pmpPmcAveFloorMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v11);

  objc_msgSend((id)objc_opt_class(), "pmpPmcDispFloorMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v12);

  objc_msgSend((id)objc_opt_class(), "aop2PowerMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v13);

  objc_msgSend((id)objc_opt_class(), "aopExclavePowerMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v14);

  return v2;
}

+ (id)amcStatsPerfCountersMetrics
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
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSIOReportMetrics subsystem](PPSIOReportMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit seconds](PPSUnit, "seconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventSBC_EventScreenStateChange](PPSCadence, "cadenceEventSBC_EventScreenStateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("timestampEnd"), v3, CFSTR("AMCStatsPerfCounters"), 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("APWakeTime"), 8, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Channel"), 3, v11, v9, &unk_251428580, 1.0);

  v13 = [PPSMetric alloc];
  +[PPSUnit bytes](PPSUnit, "bytes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Value"), 7, v14, v12, &unk_251428580, 1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)socStatsEventsMetrics
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
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSIOReportMetrics subsystem](PPSIOReportMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit seconds](PPSUnit, "seconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventSBC_EventScreenStateChange](PPSCadence, "cadenceEventSBC_EventScreenStateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("timestampEnd"), v3, CFSTR("SoCStatsEvents"), 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("APWakeTime"), 8, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Channel"), 3, v11, v9, &unk_2514285A8, 1.0);

  v13 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("DutyCycle"), 8, v14, v12, &unk_2514285A8, 1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)socStatsPmgrCountersMetrics
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
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSIOReportMetrics subsystem](PPSIOReportMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit seconds](PPSUnit, "seconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventSBC_EventScreenStateChange](PPSCadence, "cadenceEventSBC_EventScreenStateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("timestampEnd"), v3, CFSTR("SoCStatsPMGRCounters"), 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("APWakeTime"), 8, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Channel"), 3, v11, v9, &unk_2514285D0, 1.0);

  v13 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Value"), 7, v14, v12, &unk_2514285D0, 1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)socStatsOprtpMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  PPSMetric *v7;
  void *v8;
  PPSMetric *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSIOReportMetrics subsystem](PPSIOReportMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Channel"), v3, CFSTR("SoCStatsoprtp"), 7, v4, v5, 1.0, 0x200000001, 0x700000001, 0x300000001, 0x100000001, &unk_2514285F8);

  v7 = [PPSMetric alloc];
  +[PPSUnit milliVolts](PPSUnit, "milliVolts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Value"), 7, v8, v6, &unk_2514285F8, 1.0);

  v12[0] = v6;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)socStatsIdsFuseMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  PPSMetric *v7;
  void *v8;
  PPSMetric *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSIOReportMetrics subsystem](PPSIOReportMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Channel"), v3, CFSTR("SoCStatsAONFuse"), 3, v4, v5, 1.0, 0x200000001, 0x700000001, 0x300000001, 0x100000001, &unk_251428620);

  v7 = [PPSMetric alloc];
  +[PPSUnit milliAmperes](PPSUnit, "milliAmperes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Value"), 7, v8, v6, &unk_251428620, 1.0);

  v12[0] = v6;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)socStatsDeviceStatesMetrics
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
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSIOReportMetrics subsystem](PPSIOReportMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit seconds](PPSUnit, "seconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventSBC_EventScreenStateChange](PPSCadence, "cadenceEventSBC_EventScreenStateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("timestampEnd"), v3, CFSTR("SoCStatsDeviceStates"), 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("APWakeTime"), 8, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Channel"), 3, v11, v9, &unk_251428648, 1.0);

  v13 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("DutyCycle"), 8, v14, v12, &unk_251428648, 1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)pmpDcsFloorMetrics
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
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSIOReportMetrics subsystem](PPSIOReportMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit seconds](PPSUnit, "seconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventSBC_EventScreenStateChange](PPSCadence, "cadenceEventSBC_EventScreenStateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("timestampEnd"), v3, CFSTR("PMPDCSFloor"), 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("APWakeTime"), 8, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Channel"), 3, v11, v9, &unk_251428670, 1.0);

  v13 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("DutyCycle"), 8, v14, v12, &unk_251428670, 1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)pmpSocFloorMetrics
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
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSIOReportMetrics subsystem](PPSIOReportMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit seconds](PPSUnit, "seconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventSBC_EventScreenStateChange](PPSCadence, "cadenceEventSBC_EventScreenStateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("timestampEnd"), v3, CFSTR("PMPSOCFloor"), 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("APWakeTime"), 8, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Channel"), 3, v11, v9, &unk_251428698, 1.0);

  v13 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("DutyCycle"), 8, v14, v12, &unk_251428698, 1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)pmpPmcAveFloorMetrics
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
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSIOReportMetrics subsystem](PPSIOReportMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit seconds](PPSUnit, "seconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventSBC_EventScreenStateChange](PPSCadence, "cadenceEventSBC_EventScreenStateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("timestampEnd"), v3, CFSTR("PMPPMCAVEFloor"), 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("APWakeTime"), 8, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Channel"), 3, v11, v9, &unk_2514286C0, 1.0);

  v13 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("DutyCycle"), 8, v14, v12, &unk_2514286C0, 1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)pmpPmcDispFloorMetrics
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
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSIOReportMetrics subsystem](PPSIOReportMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit seconds](PPSUnit, "seconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventSBC_EventScreenStateChange](PPSCadence, "cadenceEventSBC_EventScreenStateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("timestampEnd"), v3, CFSTR("PMPPMCDISPFloor"), 4, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("APWakeTime"), 8, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Channel"), 3, v11, v9, &unk_2514286E8, 1.0);

  v13 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("DutyCycle"), 8, v14, v12, &unk_2514286E8, 1.0);

  v18[0] = v6;
  v18[1] = v9;
  v18[2] = v12;
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)aop2PowerMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  PPSMetric *v7;
  void *v8;
  PPSMetric *v9;
  void *v10;
  PPSMetric *v11;
  void *v12;
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  void *v16;
  PPSMetric *v17;
  void *v18;
  PPSMetric *v19;
  void *v20;
  PPSMetric *v21;
  void *v22;
  PPSMetric *v23;
  PPSMetric *v24;
  void *v25;
  PPSMetric *v26;
  id v28;
  PPSMetric *v29;
  PPSMetric *v30;
  PPSMetric *v31;
  PPSMetric *v32;
  PPSMetric *v33;
  PPSMetric *v34;
  PPSMetric *v35;
  _QWORD v36[12];

  v36[10] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSIOReportMetrics subsystem](PPSIOReportMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventSBC_EventScreenStateChange](PPSCadence, "cadenceEventSBC_EventScreenStateChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Duty cycle"), v3, CFSTR("AOP2Power"), 7, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Sleep count"), 7, v8, v6, 0, 1.0);

  v9 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v9, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Wake count"), 7, v10, v6, 0, 1.0);

  v11 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v11, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Power state_ON"), 8, v12, v6, 0, 1.0);

  v13 = [PPSMetric alloc];
  +[PPSUnit bytes](PPSUnit, "bytes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Free heap"), 7, v14, v6, 0, 1.0);

  v15 = [PPSMetric alloc];
  +[PPSUnit bytes](PPSUnit, "bytes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v15, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Total heap"), 7, v16, v6, 0, 1.0);

  v17 = [PPSMetric alloc];
  +[PPSUnit bytes](PPSUnit, "bytes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Peak heap alloc"), 7, v18, v6, 0, 1.0);

  v19 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v19, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("CPU count"), 7, v20, v6, 0, 1.0);

  v21 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v21, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v22, v6, 0, 1.0);

  v24 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v24, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("APWakeTime"), 8, v25, v6, 0, 1.0);

  v36[0] = v6;
  v36[1] = v35;
  v36[2] = v34;
  v36[3] = v33;
  v36[4] = v32;
  v36[5] = v31;
  v36[6] = v30;
  v36[7] = v29;
  v36[8] = v23;
  v36[9] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 10);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)aopExclavePowerMetrics
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
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  PPSMetric *v16;
  void *v17;
  PPSMetric *v18;
  PPSMetric *v19;
  void *v20;
  PPSMetric *v21;
  PPSMetric *v22;
  void *v23;
  PPSMetric *v24;
  PPSMetric *v25;
  void *v26;
  PPSMetric *v27;
  void *v28;
  _QWORD v30[9];

  v30[8] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSIOReportMetrics subsystem](PPSIOReportMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit_EventSBC](PPSCadence, "cadenceInit_EventSBC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Power state_ON"), v3, CFSTR("AOP-EXCLAVEPower"), 8, v4, v5, 1.0, 0x200000005, 0x700000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Sleep count"), 7, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Wake Count"), 7, v11, v6, 0, 1.0);

  v13 = [PPSMetric alloc];
  +[PPSUnit bytes](PPSUnit, "bytes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Free heap"), 7, v14, v6, 0, 1.0);

  v16 = [PPSMetric alloc];
  +[PPSUnit bytes](PPSUnit, "bytes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v16, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Total heap"), 7, v17, v6, 0, 1.0);

  v19 = [PPSMetric alloc];
  +[PPSUnit bytes](PPSUnit, "bytes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v19, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Peak heap alloc"), 7, v20, v6, 0, 1.0);

  v22 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v22, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v23, v6, 0, 1.0);

  v25 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v25, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("APWakeTime"), 8, v26, v6, 0, 1.0);

  v30[0] = v6;
  v30[1] = v9;
  v30[2] = v12;
  v30[3] = v15;
  v30[4] = v18;
  v30[5] = v21;
  v30[6] = v24;
  v30[7] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

@end
