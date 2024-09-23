@implementation PPSBackupMetrics

+ (id)subsystem
{
  return CFSTR("BackupMetrics");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "backupRestoreMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (id)backupRestoreMetrics
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
  PPSMetric *v12;
  void *v13;
  void *v14;
  PPSMetric *v15;
  void *v16;
  PPSMetric *v18;
  _QWORD v19[7];
  _QWORD v20[7];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v21[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  v20[0] = CFSTR("Idle");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  v20[1] = CFSTR("Starting");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v4;
  v20[2] = CFSTR("Running");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v20[3] = CFSTR("Ending");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v6;
  v20[4] = CFSTR("Ended");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v7;
  v20[5] = CFSTR("Cancelled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v8;
  v20[6] = CFSTR("Failed");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = CFSTR("MetricType");
  v22[0] = v9;
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v12, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("State"), CFSTR("BackupMetrics"), CFSTR("RestoreState"), 7, v13, v14, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v11);

  v18 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
