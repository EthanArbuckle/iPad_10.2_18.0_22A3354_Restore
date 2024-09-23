@implementation PPSXPCMetrics

+ (id)subsystem
{
  return CFSTR("XPCMetrics");
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

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "groupActivitiesMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "mailCategorizationMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend((id)objc_opt_class(), "mailCategorizationEnabledMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  objc_msgSend((id)objc_opt_class(), "mailSyncMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  objc_msgSend((id)objc_opt_class(), "ihaConsentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v7);

  objc_msgSend((id)objc_opt_class(), "intelligencePlatformViewUpdateMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v8);

  objc_msgSend((id)objc_opt_class(), "cpuViolationsMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v9);

  objc_msgSend((id)objc_opt_class(), "idleTimerStateMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v10);

  objc_msgSend((id)objc_opt_class(), "vkDataScannerMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v11);

  objc_msgSend((id)objc_opt_class(), "mailIMAPMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v12);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend((id)objc_opt_class(), "ongoingRestoreMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v13);

  }
  return v2;
}

+ (id)groupActivitiesMetrics
{
  void *v2;
  void *v3;
  PPSMetric *v4;
  void *v5;
  void *v6;
  PPSMetric *v7;
  PPSMetric *v8;
  void *v9;
  PPSMetric *v10;
  void *v11;
  _QWORD v13[2];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("bundleID"), CFSTR("XPCMetrics"), CFSTR("GroupActivities"), 3, v5, v6, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, v3);

  v8 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v9, v7, 0, 2.0);

  v13[0] = v7;
  v13[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)mailCategorizationMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PPSMetric *v7;
  void *v8;
  void *v9;
  PPSMetric *v10;
  PPSMetric *v11;
  void *v12;
  PPSMetric *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PPSMetric *v20;
  void *v21;
  PPSMetric *v22;
  void *v23;
  _QWORD v25[3];
  _QWORD v26[4];
  _QWORD v27[4];
  const __CFString *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v32[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v2;
  v31[0] = CFSTR("Begin");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v3;
  v31[1] = CFSTR("End");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = CFSTR("MetricType");
  v33[0] = v4;
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("eventType"), CFSTR("XPCMetrics"), CFSTR("MailCategorizationEvent"), 7, v8, v9, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v6);

  v11 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v11, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("count"), 7, v12, v10, 0, 1.0);

  v28 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v27[0] = CFSTR("New-Message");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  v27[1] = CFSTR("Backlog");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v16;
  v27[2] = CFSTR("Fast-Pass");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v17;
  v27[3] = CFSTR("User-Initiated");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v20, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("reason"), 7, v21, v10, v19, 1.0);

  v25[0] = v10;
  v25[1] = v13;
  v25[2] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)mailCategorizationEnabledMetrics
{
  void *v2;
  void *v3;
  PPSMetric *v4;
  void *v5;
  void *v6;
  PPSMetric *v7;
  void *v8;
  PPSMetric *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = CFSTR("MetricType");
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("MailCategorization"), CFSTR("XPCMetrics"), CFSTR("MailCategorizationEnabled"), 5, v5, v6, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v3);

  v10 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)mailSyncMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  PPSMetric *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PPSMetric *v10;
  void *v11;
  PPSMetric *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PPSMetric *v20;
  void *v21;
  PPSMetric *v22;
  PPSMetric *v23;
  void *v24;
  PPSMetric *v25;
  void *v26;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("account"), CFSTR("XPCMetrics"), CFSTR("MailSyncIMAP"), 3, v3, v4, 1.0, 0x200000003, 0x600000001, 0x100000001, 0x100000001, 0);

  v36[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v6;
  v35[0] = CFSTR("Begin");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v7;
  v35[1] = CFSTR("End");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = CFSTR("MetricType");
  v37[0] = v8;
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("event"), 7, v11, v5, v28, 1.0);

  v32[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v13;
  v31[0] = CFSTR("User-Initiated");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v14;
  v31[1] = CFSTR("Periodic");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v15;
  v31[2] = CFSTR("Push");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v16;
  v31[3] = CFSTR("Backfill");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = CFSTR("MetricType");
  v33[0] = v17;
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v20, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("kind"), 7, v21, v5, v19, 1.0);

  v23 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v23, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sync"), 7, v24, v5, 0, 1.0);

  v29[0] = v5;
  v29[1] = v12;
  v29[2] = v22;
  v29[3] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)intelligencePlatformViewUpdateMetrics
{
  void *v2;
  PPSMetric *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  void *v7;
  PPSMetric *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PPSMetric *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PPSMetric *v27;
  void *v28;
  PPSMetric *v29;
  void *v30;
  void *v31;
  PPSMetric *v32;
  void *v33;
  PPSMetric *v34;
  void *v35;
  PPSMetric *v37;
  void *v38;
  PPSMetric *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  const __CFString *v43;
  void *v44;
  _QWORD v45[6];
  _QWORD v46[6];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[2];
  _QWORD v52[2];
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v55 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("name"), CFSTR("XPCMetrics"), CFSTR("viewUpdate"), 3, v4, v5, 1.0, 0x200000004, 0x100000001, 0x100000001, 0x100000001, v41);

  v53 = CFSTR("MetricType");
  +[PPSMetricType absoluteMeasure](PPSMetricType, "absoluteMeasure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PPSMetric alloc];
  +[PPSUnit milliseconds](PPSUnit, "milliseconds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("durationMillis"), 7, v9, v6, v40, 1.0);

  v51[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v10;
  v50[0] = CFSTR("No-Update");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v11;
  v50[1] = CFSTR("Updated");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v12;
  v50[2] = CFSTR("Deferred");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v13;
  v50[3] = CFSTR("Error");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = CFSTR("MetricType");
  v52[0] = v14;
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v16, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("result"), 7, v17, v6, v38, 1.0);

  v47[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v18;
  v46[0] = CFSTR("Has-Changes");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v19;
  v46[1] = CFSTR("Full-Rebuild");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v20;
  v46[2] = CFSTR("Clear");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v21;
  v46[3] = CFSTR("Truncate-Artifact");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v22;
  v46[4] = CFSTR("No-Changes");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0xFFFFFFFFLL);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v23;
  v46[5] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v24;
  v47[1] = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v27, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("action"), 7, v28, v6, v26, 1.0);

  v43 = CFSTR("MetricType");
  +[PPSMetricType deltaMeasure](PPSMetricType, "deltaMeasure");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v32, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sources"), 3, v33, v6, v31, 1.0);

  v42[0] = v6;
  v42[1] = v39;
  v42[2] = v37;
  v42[3] = v29;
  v42[4] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

+ (id)vkDataScannerMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  PPSMetric *v5;
  PPSMetric *v6;
  void *v7;
  PPSMetric *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("SessionMinFrameDuration"), CFSTR("XPCMetrics"), CFSTR("VKDataScanner"), 8, v3, v4, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v6, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("SessionStopTime"), 4, v7, v5, 0, 1.0);

  v11[0] = v5;
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)mailIMAPMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  PPSMetric *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("IMAPv4"), CFSTR("XPCMetrics"), CFSTR("MailIMAP"), 5, v3, v4, 1.0, 0x200000003, 0x100000001, 0x100000001, 0x100000001, 0);

  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cpuViolationsMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  PPSMetric *v5;
  PPSMetric *v6;
  void *v7;
  PPSMetric *v8;
  void *v9;
  PPSMetric *v10;
  void *v11;
  PPSMetric *v12;
  void *v13;
  PPSMetric *v14;
  void *v15;
  PPSMetric *v16;
  PPSMetric *v17;
  void *v18;
  PPSMetric *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PPSMetric *v27;
  void *v28;
  PPSMetric *v29;
  void *v30;
  PPSMetric *v32;
  PPSMetric *v33;
  PPSMetric *v34;
  PPSMetric *v35;
  _QWORD v36[8];
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[2];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("ProcessName"), CFSTR("XPCMetrics"), CFSTR("CPUViolations"), 3, v3, v4, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v6, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("ScenarioIdentifier"), 3, v7, v5, 0, 1.0);

  v8 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v9, v5, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("ThresholdCPUUsage"), 7, v11, v5, 0, 1.0);

  v12 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v12, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("TimeWndowSize"), 7, v13, v5, 0, 1.0);

  v14 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v14, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("ObservedCPUUsage"), 8, v15, v5, 0, 1.0);

  v17 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("ObservedCPUUsageDuration"), 8, v18, v5, 0, 1.0);

  v39[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v20;
  v38[0] = CFSTR("None");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v21;
  v38[1] = CFSTR("Kill");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v22;
  v38[2] = CFSTR("SFI");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v23;
  v38[3] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = CFSTR("MetricType");
  v40[0] = v24;
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v27, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Mitigation"), 7, v28, v5, v26, 1.0);

  v36[0] = v5;
  v36[1] = v35;
  v36[2] = v34;
  v36[3] = v33;
  v36[4] = v32;
  v36[5] = v16;
  v36[6] = v19;
  v36[7] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (id)ongoingRestoreMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  PPSMetric *v5;
  void *v6;
  void *v7;
  PPSMetric *v8;
  void *v9;
  PPSMetric *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PPSMetric *v18;
  void *v19;
  PPSMetric *v20;
  void *v21;
  _QWORD v23[3];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("fastPassName"), CFSTR("XPCMetrics"), CFSTR("OngoingRestore"), 3, v3, v4, 1.0, 0x200000003, 0x10000000ELL, 0x300000006, 0x100000001, 0);

  v28[0] = CFSTR("AuxiliaryType");
  v28[1] = CFSTR("MetricType");
  v29[0] = &unk_251428320;
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("processName"), 3, v9, v5, v7, 2.0);

  v26[0] = CFSTR("MetricType");
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = CFSTR("EnumMapping");
  v27[0] = v11;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v12;
  v25[0] = CFSTR("Scheduled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v13;
  v25[1] = CFSTR("Started");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v14;
  v25[2] = CFSTR("Stopped");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 60);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v15;
  v25[3] = CFSTR("Completed");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v18, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("state"), 7, v19, v5, v17, 1.0);

  v23[0] = v5;
  v23[1] = v10;
  v23[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)ihaConsentMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PPSMetric *v7;
  void *v8;
  void *v9;
  PPSMetric *v10;
  void *v11;
  PPSMetric *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  v15[0] = CFSTR("Disabled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v3;
  v15[1] = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v16[1] = CFSTR("MetricType");
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Enabled"), CFSTR("XPCMetrics"), CFSTR("IHAConsent"), 5, v8, v9, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v6);

  v13 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)idleTimerStateMetrics
{
  void *v2;
  void *v3;
  PPSMetric *v4;
  void *v5;
  void *v6;
  PPSMetric *v7;
  PPSMetric *v8;
  void *v9;
  PPSMetric *v10;
  PPSMetric *v11;
  void *v12;
  PPSMetric *v13;
  void *v14;
  _QWORD v16[3];
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v17 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("bundleID"), CFSTR("XPCMetrics"), CFSTR("IdleTimerState"), 3, v5, v6, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v3);

  v8 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("idleTimerDisabled"), 5, v9, v7, 0, 1.0);

  v11 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v11, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("autoLockTimeoutDuration"), 7, v12, v7, 0, 1.0);

  v16[0] = v7;
  v16[1] = v10;
  v16[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
