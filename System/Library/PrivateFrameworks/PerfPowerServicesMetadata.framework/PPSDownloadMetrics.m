@implementation PPSDownloadMetrics

+ (id)subsystem
{
  return CFSTR("DownloadMetrics");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "autoAssetDownloadMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "v2AssetDownloadMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  return v2;
}

+ (id)autoAssetDownloadMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  PPSMetric *v5;
  PPSMetric *v6;
  void *v7;
  PPSMetric *v8;
  PPSMetric *v9;
  void *v10;
  PPSMetric *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PPSMetric *v16;
  void *v17;
  PPSMetric *v18;
  PPSMetric *v19;
  void *v20;
  PPSMetric *v21;
  PPSMetric *v22;
  void *v23;
  PPSMetric *v24;
  void *v25;
  _QWORD v27[6];
  _QWORD v28[2];
  _QWORD v29[2];
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("assetType"), CFSTR("DownloadMetrics"), CFSTR("AutoAssetDownloads"), 3, v3, v4, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSUnit megabytes](PPSUnit, "megabytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v6, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("bytesDownloaded"), 7, v7, v5, 0, 1.0);

  v9 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v9, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("clientName"), 3, v10, v5, 0, 1.0);

  v30 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  v29[0] = CFSTR("Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v13;
  v29[1] = CFSTR("Successful");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v16, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Result"), 5, v17, v5, v15, 1.0);

  v19 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v19, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v20, v5, 0, 1.0);

  v22 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v22, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("assetVersion"), 3, v23, v5, 0, 1.0);

  v27[0] = v5;
  v27[1] = v8;
  v27[2] = v11;
  v27[3] = v18;
  v27[4] = v21;
  v27[5] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)v2AssetDownloadMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  PPSMetric *v5;
  PPSMetric *v6;
  void *v7;
  PPSMetric *v8;
  PPSMetric *v9;
  void *v10;
  PPSMetric *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PPSMetric *v16;
  void *v17;
  PPSMetric *v18;
  PPSMetric *v19;
  void *v20;
  PPSMetric *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[2];
  _QWORD v26[2];
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("assetType"), CFSTR("DownloadMetrics"), CFSTR("v2AssetDownloads"), 3, v3, v4, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSUnit megabytes](PPSUnit, "megabytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v6, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("bytesDownloaded"), 7, v7, v5, 0, 1.0);

  v9 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v9, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("clientName"), 3, v10, v5, 0, 1.0);

  v27 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  v26[0] = CFSTR("Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  v26[1] = CFSTR("Successful");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v16, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Result"), 5, v17, v5, v15, 1.0);

  v19 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v19, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v20, v5, 0, 1.0);

  v24[0] = v5;
  v24[1] = v8;
  v24[2] = v11;
  v24[3] = v18;
  v24[4] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
