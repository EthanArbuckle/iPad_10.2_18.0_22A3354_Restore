@implementation PPSApplicationMetrics

+ (id)subsystem
{
  return CFSTR("ApplicationMetrics");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "remoteControlSessionMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (id)remoteControlSessionMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PPSMetric *v19;
  void *v20;
  PPSMetric *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  PPSMetric *v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[10];
  _QWORD v31[10];
  const __CFString *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v36[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v2;
  v35[0] = CFSTR("Start");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v3;
  v35[1] = CFSTR("End");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = CFSTR("MetricType");
  v37[0] = v4;
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [PPSMetric alloc];
  +[PPSApplicationMetrics subsystem](PPSApplicationMetrics, "subsystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("event"), v7, CFSTR("RemoteControlSession"), 7, v8, v9, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v28);

  v32 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v31[0] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v25;
  v31[1] = CFSTR("User-Initiated");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v24;
  v31[2] = CFSTR("Remote-Initiated");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v10;
  v31[3] = CFSTR("Closed-By-Viewer");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v11;
  v31[4] = CFSTR("Closed-By-Server");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v12;
  v31[5] = CFSTR("Connection-Interrupted");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v13;
  v31[6] = CFSTR("New-Session-Created");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v14;
  v31[7] = CFSTR("Session-Error");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v15;
  v31[8] = CFSTR("Transport-Interrupted");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v16;
  v31[9] = CFSTR("Timeout");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v19, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("reason"), 7, v20, v27, v18, 1.0);

  v29[0] = v27;
  v29[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
