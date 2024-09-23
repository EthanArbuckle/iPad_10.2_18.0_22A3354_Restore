@implementation PPSWifiMetrics

+ (id)subsystem
{
  return CFSTR("WifiMetrics");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "awdlStateMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (id)awdlStateMetrics
{
  PPSMetric *v2;
  void *v3;
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
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[3];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSWifiMetrics subsystem](PPSWifiMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSWifiMetrics awdlStateLoggingCadence](PPSWifiMetrics, "awdlStateLoggingCadence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("AWDLDown"), v3, CFSTR("AWDLState"), 5, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000010, 0x100000001, 0);

  v20 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v19[0] = CFSTR("None");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  v19[1] = CFSTR("AssistedDiscoveryMode");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v9;
  v19[2] = CFSTR("FollowMode");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v12, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("AWDLRanging"), 7, v13, v6, v11, 2.0);

  v17[0] = v6;
  v17[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)awdlStateLoggingCadence
{
  PPSCadenceTuple *v2;
  PPSCadence *v3;
  void *v4;
  PPSCadence *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 3, 9);
  if (v2)
  {
    v3 = [PPSCadence alloc];
    v7[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPSCadence initWithCadenceTuples:](v3, "initWithCadenceTuples:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
