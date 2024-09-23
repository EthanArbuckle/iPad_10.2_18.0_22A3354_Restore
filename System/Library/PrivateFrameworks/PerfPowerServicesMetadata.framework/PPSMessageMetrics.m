@implementation PPSMessageMetrics

+ (id)subsystem
{
  return CFSTR("Message");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "rcsSessionManagementMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "rcsRegisterKeepAliveMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  return v2;
}

+ (id)rcsSessionManagementMetrics
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
  void *v14;
  PPSMetric *v15;
  void *v16;
  PPSMetric *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PPSMetric *v25;
  void *v26;
  PPSMetric *v27;
  PPSMetric *v28;
  void *v29;
  PPSMetric *v30;
  void *v31;
  void *v33;
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x24BDAC8D0];
  v45[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v2;
  v44[0] = CFSTR("Received");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v3;
  v44[1] = CFSTR("Sent");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = CFSTR("MetricType");
  v46[0] = v4;
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Action"), CFSTR("Message"), CFSTR("RCSSessionManagement"), 7, v7, v8, 1.0, 0x200000002, 0x100000001, 0x300000001, 0x100000001, v33);

  v41[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v10;
  v40[0] = CFSTR("Cellular");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v11;
  v40[1] = CFSTR("Wifi");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = CFSTR("MetricType");
  v42[0] = v12;
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v15, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Interface"), 7, v16, v9, v14, 1.0);

  v37[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v18;
  v36[0] = CFSTR("SIP Invite");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v19;
  v36[1] = CFSTR("BYE");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v20;
  v36[2] = CFSTR("SIP Refer");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v21;
  v36[3] = CFSTR("SIP Registration");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = CFSTR("MetricType");
  v38[0] = v22;
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v25, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("TransactionType"), 7, v26, v9, v24, 1.1);

  v28 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v28, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Value"), 7, v29, v9, 0, 1.0);

  v34[0] = v9;
  v34[1] = v17;
  v34[2] = v27;
  v34[3] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)rcsRegisterKeepAliveMetrics
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
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v19[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v18[0] = CFSTR("Cellular");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  v18[1] = CFSTR("Wifi");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v19[1] = CFSTR("MetricType");
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Interface"), CFSTR("Message"), CFSTR("SIPRegisterKeepAlive"), 7, v8, v9, 1.0, 0x200000002, 0x100000001, 0x300000001, 0x100000001, v6);

  v11 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v11, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Value"), 7, v12, v10, &unk_251428710, 1.0);

  v16[0] = v10;
  v16[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
