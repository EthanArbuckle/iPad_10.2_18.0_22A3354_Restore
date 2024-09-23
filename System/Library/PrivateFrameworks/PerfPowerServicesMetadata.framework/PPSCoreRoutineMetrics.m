@implementation PPSCoreRoutineMetrics

+ (id)subsystem
{
  return CFSTR("CoreRoutine");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "checkInSessionMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (id)checkInSessionMetrics
{
  void *v2;
  PPSMetric *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PPSMetric *v12;
  void *v13;
  PPSMetric *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PPSMetric *v20;
  void *v21;
  PPSMetric *v22;
  void *v23;
  void *v24;
  PPSMetric *v25;
  void *v26;
  PPSMetric *v27;
  void *v28;
  void *v30;
  void *v31;
  _QWORD v32[4];
  const __CFString *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[2];
  _QWORD v42[2];
  const __CFString *v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v43 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("sessionid"), CFSTR("CoreRoutine"), CFSTR("CheckInSession"), 3, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v31);

  v41[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v7;
  v40[0] = CFSTR("Start");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v8;
  v40[1] = CFSTR("Stop");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v9;
  v40[2] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = CFSTR("MetricType");
  v42[0] = v10;
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v12, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("event"), 7, v13, v6, v30, 1.0);

  v37[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v15;
  v36[0] = CFSTR("TimeBased");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v16;
  v36[1] = CFSTR("DestinationBased");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = CFSTR("MetricType");
  v38[0] = v17;
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v20, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sessionType"), 7, v21, v6, v19, 1.0);

  v33 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v25, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("numCacheUploads"), 7, v26, v6, v24, 1.0);

  v32[0] = v6;
  v32[1] = v27;
  v32[2] = v22;
  v32[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

@end
