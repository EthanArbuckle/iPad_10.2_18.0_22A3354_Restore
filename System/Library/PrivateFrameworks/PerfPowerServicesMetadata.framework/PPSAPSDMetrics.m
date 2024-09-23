@implementation PPSAPSDMetrics

+ (id)subsystem
{
  return CFSTR("APSD");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "pubSubMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (id)pubSubMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  void *v7;
  void *v8;
  PPSMetric *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PPSMetric *v14;
  void *v15;
  PPSMetric *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PPSMetric *v23;
  void *v24;
  PPSMetric *v25;
  void *v26;
  void *v27;
  PPSMetric *v28;
  void *v29;
  PPSMetric *v30;
  void *v31;
  void *v33;
  _QWORD v34[4];
  const __CFString *v35;
  void *v36;
  _QWORD v37[4];
  _QWORD v38[4];
  const __CFString *v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  const __CFString *v43;
  void *v44;
  _QWORD v45[3];
  _QWORD v46[3];
  const __CFString *v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v47 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v2;
  v46[0] = CFSTR("WWAN");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v3;
  v46[1] = CFSTR("NonCellular");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v4;
  v46[2] = CFSTR("Proxy");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("ConnectionType"), CFSTR("APSD"), CFSTR("PubSub"), 7, v7, v8, 1.0, 0x200000002, 0x100000001, 0x300000001, 0x100000001, v33);

  v43 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v10;
  v42[0] = CFSTR("Production");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v11;
  v42[1] = CFSTR("Development");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v14, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Environment"), 7, v15, v9, v13, 1.0);

  v39 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v17;
  v38[0] = CFSTR("Unsubscribe");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v18;
  v38[1] = CFSTR("Subscribe");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v19;
  v38[2] = CFSTR("FullSubscription");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v20;
  v38[3] = CFSTR("ServerRequestResubscribe");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v23, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("MessageType"), 7, v24, v9, v22, 1.0);

  v35 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v28, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Topic"), 3, v29, v9, v27, 1.0);

  v34[0] = v9;
  v34[1] = v16;
  v34[2] = v25;
  v34[3] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

@end
