@implementation PPSStorageMetrics

+ (id)subsystem
{
  return CFSTR("PPTStorageOperator");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "timeOffsetMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "configMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend((id)objc_opt_class(), "configurationMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  objc_msgSend((id)objc_opt_class(), "timezoneMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  return v2;
}

+ (id)timeOffsetMetrics
{
  PPSCadenceTuple *v2;
  PPSCadenceTuple *v3;
  PPSCadenceTuple *v4;
  PPSCadenceTuple *v5;
  PPSCadence *v6;
  BOOL v7;
  PPSCadence *v9;
  void *v10;
  PPSMetric *v11;
  void *v12;
  void *v13;
  PPSMetric *v14;
  PPSMetric *v15;
  void *v16;
  PPSMetric *v17;
  PPSMetric *v18;
  void *v19;
  PPSMetric *v20;
  void *v21;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
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
    v24[0] = v2;
    v24[1] = v3;
    v24[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PPSCadence initWithCadenceTuples:](v9, "initWithCadenceTuples:", v10);

  }
  v11 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit seconds](PPSUnit, "seconds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v11, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("system"), v12, CFSTR("TimeOffset"), 8, v13, v6, 2.0, 0x100000003, 0x100000447, 0x300000001, 0x100000001, 0);

  v15 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v15, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("kernel"), 8, v16, v14, 0, 2.0);

  v18 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v18, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("baseband"), 8, v19, v14, 0, 2.0);

  v23[0] = v14;
  v23[1] = v17;
  v23[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)configMetrics
{
  PPSCadenceTuple *v2;
  PPSCadence *v3;
  void *v4;
  PPSCadence *v5;
  PPSMetric *v6;
  void *v7;
  void *v8;
  PPSMetric *v9;
  void *v10;
  PPSMetric *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 3, 7);
  if (v2)
  {
    v3 = [PPSCadence alloc];
    v13[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPSCadence initWithCadenceTuples:](v3, "initWithCadenceTuples:", v4);

  }
  else
  {
    v5 = 0;
  }
  v6 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("build"), v7, CFSTR("Config"), 3, v8, v5, 1.0, 0x100000001, 0x100000447, 0x300000001, 0x100000001, 0);

  v12 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)configurationMetrics
{
  PPSCadenceTuple *v2;
  PPSCadence *v3;
  void *v4;
  PPSCadence *v5;
  PPSMetric *v6;
  void *v7;
  void *v8;
  PPSMetric *v9;
  void *v10;
  PPSMetric *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 4, 0);
  if (v2)
  {
    v3 = [PPSCadence alloc];
    v13[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PPSCadence initWithCadenceTuples:](v3, "initWithCadenceTuples:", v4);

  }
  else
  {
    v5 = 0;
  }
  v6 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("preUnlock"), v7, CFSTR("Configuration"), 5, v8, v5, 1.0, 0x100000002, 0x100000447, 0x300000001, 0x100000001, 0);

  v12 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)timezoneMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  PPSMetric *v7;
  void *v8;
  void *v9;
  void *v10;
  PPSMetric *v11;
  PPSMetric *v12;
  void *v13;
  PPSMetric *v14;
  PPSMetric *v15;
  void *v16;
  PPSMetric *v17;
  void *v18;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSStorageMetrics timezoneLoggingCadence](PPSStorageMetrics, "timezoneLoggingCadence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("CountryCode"), v3, CFSTR("Locale"), 3, v4, v5, 2.0, 0x100000003, 0x10000001ELL, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  objc_msgSend((id)objc_opt_class(), "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit seconds](PPSUnit, "seconds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSStorageMetrics timezoneLoggingCadence](PPSStorageMetrics, "timezoneLoggingCadence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("SecondsFromGMT"), v8, CFSTR("Locale"), 7, v9, v10, 2.0, 0x100000003, 0x100000447, 0x300000001, 0x100000001, 0);

  v12 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v12, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("TimeZoneIsInDST"), 5, v13, v11, 0, 2.0);

  v15 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v15, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Trigger"), 3, v16, v6, 0, 2.0);

  v20[0] = v6;
  v20[1] = v11;
  v20[2] = v14;
  v20[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
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

@end
