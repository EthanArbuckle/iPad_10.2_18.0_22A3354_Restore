@implementation PPSNetworkRelayMetrics

+ (id)subsystem
{
  return CFSTR("NetworkRelay");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "linkAdvisoryMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (id)linkAdvisoryMetrics
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
  PPSMetric *v25;
  void *v26;
  void *v27;
  PPSMetric *v28;
  void *v29;
  PPSMetric *v30;
  void *v31;
  void *v32;
  PPSMetric *v33;
  void *v34;
  PPSMetric *v35;
  void *v36;
  void *v37;
  PPSMetric *v38;
  void *v39;
  PPSMetric *v40;
  void *v41;
  void *v43;
  PPSMetric *v44;
  void *v45;
  PPSMetric *v46;
  void *v47;
  PPSMetric *v48;
  void *v49;
  void *v50;
  _QWORD v51[7];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[4];
  _QWORD v63[4];
  _QWORD v64[3];
  _QWORD v65[3];
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x24BDAC8D0];
  v68 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("bundleID"), CFSTR("NetworkRelay"), CFSTR("LinkAdvisory"), 3, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v50);

  v66 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("reason"), 7, v9, v6, v49, 1.0);

  v64[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v10;
  v63[0] = CFSTR("Invalid");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v11;
  v63[1] = CFSTR("Start-Advice");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v12;
  v63[2] = CFSTR("Advice-Activated");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v13;
  v63[3] = CFSTR("End-Advice");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v14;
  v65[1] = &unk_251428488;
  v64[1] = CFSTR("GroupingDimensions");
  v64[2] = CFSTR("MetricType");
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v16, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("activity"), 7, v17, v6, v47, 2.0);

  v60[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v18;
  v59[0] = CFSTR("None");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v19;
  v59[1] = CFSTR("BT Default");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v20;
  v59[2] = CFSTR("BT Classic");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v21;
  v59[3] = CFSTR("WiFi");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v22;
  v59[4] = CFSTR("No Upgrade");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v23;
  v60[1] = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v25, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("advice"), 7, v26, v6, v45, 1.0);

  v56[0] = CFSTR("GroupingDimensions");
  v56[1] = CFSTR("MetricType");
  v57[0] = &unk_2514284A0;
  +[PPSMetricType absoluteMeasure](PPSMetricType, "absoluteMeasure");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = [PPSMetric alloc];
  +[PPSUnit megabytes](PPSUnit, "megabytes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v28, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("estimatedMB"), 7, v29, v6, v43, 1.0);

  v54[1] = CFSTR("MetricType");
  v55[0] = &unk_2514284B8;
  v54[0] = CFSTR("GroupingDimensions");
  +[PPSMetricType absoluteMeasure](PPSMetricType, "absoluteMeasure");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = [PPSMetric alloc];
  +[PPSUnit megabytes](PPSUnit, "megabytes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v33, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("actualMBOverWiFi"), 7, v34, v6, v32, 1.0);

  v52[0] = CFSTR("GroupingDimensions");
  v52[1] = CFSTR("MetricType");
  v53[0] = &unk_2514284D0;
  +[PPSMetricType absoluteMeasure](PPSMetricType, "absoluteMeasure");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v36;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = [PPSMetric alloc];
  +[PPSUnit megabytes](PPSUnit, "megabytes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v38, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("actualMBOverCompanionLink"), 7, v39, v6, v37, 1.0);

  v51[0] = v6;
  v51[1] = v48;
  v51[2] = v46;
  v51[3] = v44;
  v51[4] = v30;
  v51[5] = v35;
  v51[6] = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 7);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

@end
