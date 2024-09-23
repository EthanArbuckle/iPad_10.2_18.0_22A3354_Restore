@implementation PPSWidgetMetrics

+ (id)subsystem
{
  return CFSTR("Widget");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "relevanceContextUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (id)relevanceContextUpdate
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
  PPSMetric *v14;
  void *v15;
  PPSMetric *v16;
  void *v17;
  _QWORD v19[4];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v20 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("bundleID"), CFSTR("Widget"), CFSTR("RelevanceContextUpdate"), 3, v5, v6, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v3);

  v8 = [PPSMetric alloc];
  +[PPSUnit milliseconds](PPSUnit, "milliseconds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("executionTime"), 7, v9, v7, 0, 1.0);

  v11 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v11, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("kind"), 3, v12, v7, v3, 1.0);

  v14 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v14, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("relevanceCount"), 7, v15, v7, 0, 1.0);

  v19[0] = v7;
  v19[1] = v10;
  v19[2] = v13;
  v19[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
