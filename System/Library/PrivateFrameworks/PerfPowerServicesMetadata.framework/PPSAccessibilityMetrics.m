@implementation PPSAccessibilityMetrics

+ (id)subsystem
{
  return CFSTR("AccessibilityMetrics");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "eyeTrackingMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "motionCuesEnabledMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend((id)objc_opt_class(), "zoomEnabledMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  return v2;
}

+ (id)eyeTrackingMetrics
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
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
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
  v17[2] = CFSTR("FilterEntryLogging");
  v18[1] = v5;
  v18[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [PPSMetric alloc];
  +[PPSAccessibilityMetrics subsystem](PPSAccessibilityMetrics, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Enabled"), v8, CFSTR("EyeTracking"), 5, v9, v10, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v6);

  v14 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)motionCuesEnabledMetrics
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
  +[PPSAccessibilityMetrics subsystem](PPSAccessibilityMetrics, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Enabled"), v8, CFSTR("MotionCuesEnabled"), 5, v9, v10, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v6);

  v14 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)zoomEnabledMetrics
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
  +[PPSAccessibilityMetrics subsystem](PPSAccessibilityMetrics, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceInit](PPSCadence, "cadenceInit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Enabled"), v8, CFSTR("ZoomEnabled"), 5, v9, v10, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v6);

  v14 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
