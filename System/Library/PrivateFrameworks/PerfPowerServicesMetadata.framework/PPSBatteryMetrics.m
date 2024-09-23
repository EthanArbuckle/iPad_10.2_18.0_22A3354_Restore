@implementation PPSBatteryMetrics

+ (id)subsystem
{
  return CFSTR("BatteryMetrics");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "batteryMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "batteryConfigMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend((id)objc_opt_class(), "smartChargingMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  objc_msgSend((id)objc_opt_class(), "batteryShutdownMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  return v2;
}

+ (id)batteryMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  void *v7;
  PPSMetric *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PPSMetric *v13;
  void *v14;
  void *v15;
  PPSMetric *v16;
  void *v17;
  PPSMetric *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  PPSMetric *v23;
  void *v24;
  void *v25;
  PPSMetric *v26;
  PPSMetric *v27;
  void *v28;
  PPSMetric *v29;
  void *v30;
  PPSMetric *v31;
  void *v32;
  PPSMetric *v33;
  PPSMetric *v34;
  void *v35;
  PPSMetric *v36;
  PPSMetric *v37;
  void *v38;
  PPSMetric *v39;
  id v41;
  PPSMetric *v42;
  PPSMetric *v43;
  PPSMetric *v44;
  PPSMetric *v45;
  PPSMetric *v46;
  PPSMetric *v47;
  _QWORD v48[14];

  v48[12] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSBatteryMetrics subsystem](PPSBatteryMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSBatteryMetrics batteryLoggingCadence](PPSBatteryMetrics, "batteryLoggingCadence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("ExternalConnected"), v3, CFSTR("Battery"), 5, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000006, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v6, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("IsCharging"), 5, v7, v47, 0, 1.0);

  v8 = [PPSMetric alloc];
  +[PPSBatteryMetrics subsystem](PPSBatteryMetrics, "subsystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit milliAmpereHours](PPSUnit, "milliAmpereHours");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSBatteryMetrics batteryLoggingCadence](PPSBatteryMetrics, "batteryLoggingCadence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v8, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("AbsoluteCapacity"), v9, CFSTR("Battery"), 7, v10, v11, 1.0, 0x200000002, 0x100000001, 0x300000006, 0x100000001, 0);

  v13 = [PPSMetric alloc];
  +[PPSUnit milliVolts](PPSUnit, "milliVolts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)v12;
  v45 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Voltage"), 7, v14, v12, 0, 1.0);

  v16 = [PPSMetric alloc];
  +[PPSUnit milliAmpereHours](PPSUnit, "milliAmpereHours");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v16, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("ChargeAccum"), 7, v17, v12, 0, 1.0);

  v18 = [PPSMetric alloc];
  +[PPSBatteryMetrics subsystem](PPSBatteryMetrics, "subsystem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSBatteryMetrics batteryLoggingCadence](PPSBatteryMetrics, "batteryLoggingCadence");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v18, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Level"), v19, CFSTR("Battery"), 7, v20, v21, 1.0, 0x200000004, 0x100000001, 0x300000006, 0x100000001, 0);

  v23 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v22;
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v23, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("AbsoluteLevel"), 8, v24, v22, 0, 1.0);

  v27 = [PPSMetric alloc];
  +[PPSUnit milliAmperes](PPSUnit, "milliAmperes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v27, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Amperage"), 7, v28, v15, 0, 1.0);

  v29 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v29, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("NotChargingReason"), 7, v30, v47, 0, 1.0);

  v31 = [PPSMetric alloc];
  +[PPSUnit milliAmpereHours](PPSUnit, "milliAmpereHours");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v31, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("PassedCharge"), 7, v32, v42, 0, 1.0);

  v34 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v34, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("DOD0"), 7, v35, v33, 0, 1.0);

  v37 = [PPSMetric alloc];
  +[PPSUnit milliAmpereHours](PPSUnit, "milliAmpereHours");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v37, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("AppleRawMaxCapacity"), 7, v38, v36, 0, 1.0);

  v48[0] = v47;
  v48[1] = v46;
  v48[2] = v15;
  v48[3] = v45;
  v48[4] = v44;
  v48[5] = v25;
  v48[6] = v26;
  v48[7] = v43;
  v48[8] = v42;
  v48[9] = v33;
  v48[10] = v36;
  v48[11] = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 12);
  v41 = (id)objc_claimAutoreleasedReturnValue();

  return v41;
}

+ (id)batteryConfigMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  PPSMetric *v7;
  void *v8;
  void *v9;
  void *v10;
  PPSMetric *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSBatteryMetrics subsystem](PPSBatteryMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("DOFU"), v3, CFSTR("BatteryConfig"), 7, v4, v5, 2.0, 0x100000001, 0x100000001, 0x300000006, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSBatteryMetrics subsystem](PPSBatteryMetrics, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("GasGaugeFirmwareVersion"), v8, CFSTR("BatteryConfig"), 7, v9, v10, 1.0, 0x200000001, 0x100000001, 0x300000006, 0x100000001, 0);

  v14[0] = v6;
  v14[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)smartChargingMetrics
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
  PPSMetric *v11;
  void *v12;
  void *v13;
  void *v14;
  PPSMetric *v15;
  PPSMetric *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PPSMetric *v24;
  void *v25;
  PPSMetric *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PPSMetric *v32;
  void *v33;
  PPSMetric *v34;
  void *v35;
  void *v37;
  void *v38;
  PPSMetric *v39;
  void *v40;
  _QWORD v41[4];
  _QWORD v42[3];
  _QWORD v43[3];
  const __CFString *v44;
  void *v45;
  _QWORD v46[4];
  _QWORD v47[4];
  const __CFString *v48;
  void *v49;
  _QWORD v50[10];
  _QWORD v51[10];
  const __CFString *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v52 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v38;
  v51[0] = CFSTR("None");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v37;
  v51[1] = CFSTR("Detected");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v2;
  v51[2] = CFSTR("IdlePeriodStart");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v3;
  v51[3] = CFSTR("IdlePeriodSocFloor");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v4;
  v51[4] = CFSTR("IdlePeriodSocCeiling");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v5;
  v51[5] = CFSTR("TopOff");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v6;
  v51[6] = CFSTR("TopOffWithoutIdle");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v7;
  v51[7] = CFSTR("FullyCharged");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v8;
  v51[8] = CFSTR("Interrupted");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = v9;
  v51[9] = CFSTR("UserOverride");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PPSMetric alloc];
  +[PPSBatteryMetrics subsystem](PPSBatteryMetrics, "subsystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v11, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("checkpoint"), v12, CFSTR("SmartCharging"), 7, v13, v14, 1.0, 0x300000003, 0x100000007, 0x300000006, 0x100000001, v40);

  v16 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v16, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("isEngaged"), 5, v17, v15, 0, 1.0);

  v48 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v18;
  v47[0] = CFSTR("Disabled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v19;
  v47[1] = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v20;
  v47[2] = CFSTR("Override");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v21;
  v47[3] = CFSTR("TemporarilyDisabled");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v24, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("state"), 7, v25, v15, v23, 1.0);

  v44 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v27;
  v43[0] = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v28;
  v43[1] = CFSTR("Disabled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v29;
  v43[2] = CFSTR("TemporarilyDisabled");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v32, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("status"), 7, v33, v15, v31, 1.0);

  v41[0] = v15;
  v41[1] = v39;
  v41[2] = v26;
  v41[3] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

+ (id)batteryShutdownMetrics
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
  +[PPSBatteryMetrics subsystem](PPSBatteryMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("BatteryShutdownTimestamp"), v3, CFSTR("BatteryShutdown"), 4, v4, v5, 1.0, 0x200000002, 0x10000000ELL, 0x300000006, 0x100000001, 0);

  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)batteryLoggingCadence
{
  PPSCadenceTuple *v2;
  PPSCadenceTuple *v3;
  PPSCadenceTuple *v4;
  BOOL v5;
  PPSCadence *v6;
  void *v7;
  PPSCadence *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 2, 20);
  v3 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 3, 8);
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v8 = 0;
  }
  else
  {
    v6 = [PPSCadence alloc];
    v10[0] = v2;
    v10[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PPSCadence initWithCadenceTuples:](v6, "initWithCadenceTuples:", v7);

  }
  return v8;
}

@end
