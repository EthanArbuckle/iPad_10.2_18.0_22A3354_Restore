@implementation PPSBGProcessingCommonMetrics

+ (id)subsystem
{
  return CFSTR("BackgroundProcessing");
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

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "localeMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "timeOffsetMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend((id)objc_opt_class(), "configMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  objc_msgSend((id)objc_opt_class(), "FeatureFlagMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  objc_msgSend((id)objc_opt_class(), "AppResumeInferredCarryMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v7);

  objc_msgSend((id)objc_opt_class(), "BuddyDataMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v8);

  objc_msgSend((id)objc_opt_class(), "optInMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v9);

  return v2;
}

+ (id)optInMetrics
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
  v16[0] = CFSTR("Disabled/Unavailable");
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
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Enabled"), v8, CFSTR("GenerativeFunctionMetricsOptIn"), 5, v9, v10, 1.0, 0x500000003, 0x100000003, 0x300000015, 0x100000001, v6);

  v14 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)BuddyDataMetrics
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
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v8, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("TransferMethod"), v9, CFSTR("BuddyData"), 7, v10, v11, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, v7);

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

+ (id)AppResumeInferredCarryMetrics
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
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("CarryType"), v3, CFSTR("AppResumeInferredCarry"), 7, v4, v5, 1.0, 0x500000003, 0x100000018, 0x100000001, 0x100000001, 0);

  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)FeatureFlagMetrics
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
  PPSMetric *v15;
  void *v16;
  void *v17;
  void *v18;
  PPSMetric *v19;
  void *v20;
  PPSMetric *v22;
  PPSMetric *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Domain"), v3, CFSTR("FeatureFlag"), 3, v4, v5, 1.0, 0x500000003, 0x100000018, 0x100000001, 0x100000001, &unk_251428530);

  v6 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("FeatureName"), v7, CFSTR("FeatureFlag"), 3, v8, v9, 1.0, 0x500000003, 0x100000018, 0x100000001, 0x100000001, &unk_251428530);

  v10 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v10, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("State"), v11, CFSTR("FeatureFlag"), 7, v12, v13, 1.0, 0x500000003, 0x100000018, 0x100000001, 0x100000001, &unk_251428530);

  v15 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v15, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("TargetRelease"), v16, CFSTR("FeatureFlag"), 3, v17, v18, 1.0, 0x500000003, 0x100000018, 0x100000001, 0x100000001, &unk_251428530);

  v24[0] = v23;
  v24[1] = v22;
  v24[2] = v14;
  v24[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)localeMetrics
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
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSBGProcessingCommonMetrics timezoneLoggingCadence](PPSBGProcessingCommonMetrics, "timezoneLoggingCadence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("TimeZoneName"), v3, CFSTR("Locale"), 3, v4, v5, 1.0, 0x500000003, 0x100000018, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("SecondsFromGMT"), 7, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("TimeZoneIsInDST"), 5, v11, v6, 0, 1.0);

  v15[0] = v6;
  v15[1] = v9;
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)timeOffsetMetrics
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
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit seconds](PPSUnit, "seconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "timeOffsetCadence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("system"), v3, CFSTR("TimeOffset"), 8, v4, v5, 1.0, 0x500000003, 0x100000018, 0x300000001, 0x100000001, &unk_251428558);

  v7 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("kernel"), 8, v8, v6, &unk_251428558, 1.0);

  v12[0] = v6;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)configMetrics
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
  void *v16;
  void *v17;
  void *v18;
  PPSMetric *v19;
  void *v20;
  void *v21;
  void *v22;
  PPSMetric *v23;
  void *v24;
  void *v25;
  void *v26;
  PPSMetric *v27;
  void *v28;
  void *v29;
  void *v30;
  PPSMetric *v31;
  void *v32;
  void *v33;
  void *v34;
  PPSMetric *v35;
  void *v36;
  void *v37;
  void *v38;
  PPSMetric *v39;
  void *v40;
  void *v41;
  void *v42;
  PPSMetric *v43;
  void *v44;
  void *v45;
  void *v46;
  PPSMetric *v47;
  void *v48;
  void *v49;
  void *v50;
  PPSMetric *v51;
  void *v52;
  void *v53;
  void *v54;
  PPSMetric *v55;
  void *v56;
  void *v57;
  void *v58;
  PPSMetric *v59;
  void *v60;
  void *v61;
  void *v62;
  PPSMetric *v63;
  void *v64;
  void *v65;
  void *v66;
  PPSMetric *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  PPSMetric *v75;
  void *v76;
  void *v77;
  void *v78;
  PPSMetric *v79;
  void *v80;
  void *v81;
  void *v82;
  PPSMetric *v83;
  PPSMetric *v85;
  void *v86;
  id v87;
  PPSMetric *v88;
  PPSMetric *v89;
  PPSMetric *v90;
  PPSMetric *v91;
  PPSMetric *v92;
  PPSMetric *v93;
  PPSMetric *v94;
  PPSMetric *v95;
  PPSMetric *v96;
  PPSMetric *v97;
  PPSMetric *v98;
  PPSMetric *v99;
  PPSMetric *v100;
  PPSMetric *v101;
  void *v102;
  PPSMetric *v103;
  void *v104;
  _QWORD v105[17];
  _QWORD v106[3];
  _QWORD v107[3];
  const __CFString *v108;
  void *v109;
  _QWORD v110[9];
  _QWORD v111[9];
  const __CFString *v112;
  _QWORD v113[3];

  v113[1] = *MEMORY[0x24BDAC8D0];
  v112 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v102;
  v111[0] = CFSTR("iPhone");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v2;
  v111[1] = CFSTR("iPad");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v110[2] = v3;
  v111[2] = CFSTR("iPod");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v110[3] = v4;
  v111[3] = CFSTR("Watch");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v110[4] = v5;
  v111[4] = CFSTR("Mac");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v110[5] = v6;
  v111[5] = CFSTR("HomePod");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v110[6] = v7;
  v111[6] = CFSTR("AppleTV");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 86);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v110[7] = v8;
  v111[7] = CFSTR("VisionPro");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v110[8] = v9;
  v111[8] = CFSTR("Other");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v111, v110, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v113, &v112, 1);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v11, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("BootArgs"), v12, CFSTR("Config"), 3, v13, v14, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v15 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v15, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Build"), v16, CFSTR("Config"), 3, v17, v18, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v19 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v19, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Device"), v20, CFSTR("Config"), 3, v21, v22, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v23 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v23, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("DeviceType"), v24, CFSTR("Config"), 7, v25, v26, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, v104);

  v27 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v27, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("DeviceBootTime"), v28, CFSTR("Config"), 4, v29, v30, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v31 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v31, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("SupplementalBuild"), v32, CFSTR("Config"), 3, v33, v34, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v35 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v35, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("CustomerOS"), v36, CFSTR("Config"), 3, v37, v38, 2.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v39 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v39, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("LastBuild"), v40, CFSTR("Config"), 3, v41, v42, 2.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v43 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v43, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("LastUpgradeTimestamp"), v44, CFSTR("Config"), 8, v45, v46, 2.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v47 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v47, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("LastUpgradeSystemTimestamp"), v48, CFSTR("Config"), 8, v49, v50, 2.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v51 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit megabytes](PPSUnit, "megabytes");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v51, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("DeviceDiskSize"), v52, CFSTR("Config"), 7, v53, v54, 2.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v55 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v55, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("OSVariant"), v56, CFSTR("Config"), 7, v57, v58, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v59 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v59, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("DeviceSerialNumber"), v60, CFSTR("Config"), 3, v61, v62, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v63 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v63, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Device_SoC"), v64, CFSTR("Config"), 3, v65, v66, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v67 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v67, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("RootInstalled"), v68, CFSTR("Config"), 7, v69, v70, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v108 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v71;
  v107[0] = CFSTR("Erase install");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v72;
  v107[1] = CFSTR("Minor upgrade install");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v106[2] = v73;
  v107[2] = CFSTR("Major upgrade install");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v107, v106, 3);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v74;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v75, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("InstallType"), v76, CFSTR("Config"), 7, v77, v78, 2.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, v86);

  v79 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v79, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("AutomatedDeviceGroup"), v80, CFSTR("Config"), 3, v81, v82, 1.0, 0x500000001, 0x100000018, 0x300000001, 0x100000001, 0);

  v105[0] = v103;
  v105[1] = v101;
  v105[2] = v100;
  v105[3] = v99;
  v105[4] = v98;
  v105[5] = v97;
  v105[6] = v96;
  v105[7] = v95;
  v105[8] = v94;
  v105[9] = v93;
  v105[10] = v91;
  v105[11] = v92;
  v105[12] = v90;
  v105[13] = v89;
  v105[14] = v88;
  v105[15] = v83;
  v105[16] = v85;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v105, 17);
  v87 = (id)objc_claimAutoreleasedReturnValue();

  return v87;
}

+ (id)timezoneLoggingCadence
{
  PPSCadenceTuple *v2;
  PPSCadenceTuple *v3;
  PPSCadenceTuple *v4;
  PPSCadence *v5;
  BOOL v6;
  PPSCadence *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 4, 0);
  v3 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 3, 10);
  v4 = v3;
  v5 = 0;
  if (v2)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = [PPSCadence alloc];
    v10[0] = v2;
    v10[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPSCadence initWithCadenceTuples:](v7, "initWithCadenceTuples:", v8);

  }
  return v5;
}

+ (id)timeOffsetCadence
{
  PPSCadenceTuple *v2;
  PPSCadenceTuple *v3;
  PPSCadenceTuple *v4;
  PPSCadenceTuple *v5;
  PPSCadence *v6;
  BOOL v7;
  PPSCadence *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 4, 0);
  v3 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 3, 5);
  v4 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 3, 6);
  v5 = v4;
  v6 = 0;
  if (v2)
    v7 = v3 == 0;
  else
    v7 = 1;
  if (!v7 && v4 != 0)
  {
    v9 = [PPSCadence alloc];
    v12[0] = v2;
    v12[1] = v3;
    v12[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PPSCadence initWithCadenceTuples:](v9, "initWithCadenceTuples:", v10);

  }
  return v6;
}

@end
