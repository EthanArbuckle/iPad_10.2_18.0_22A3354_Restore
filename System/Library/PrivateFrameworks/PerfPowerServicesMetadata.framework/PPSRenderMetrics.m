@implementation PPSRenderMetrics

+ (id)subsystem
{
  return CFSTR("RenderData");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "albumAnimationMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "albumMotionMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend((id)objc_opt_class(), "renderPassCountMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  objc_msgSend((id)objc_opt_class(), "layerCountMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  objc_msgSend((id)objc_opt_class(), "offscreenReasonMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v7);

  objc_msgSend((id)objc_opt_class(), "secureIndicatorTypeMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v8);

  objc_msgSend((id)objc_opt_class(), "secureIndicatorActiveIntervalTypeMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v9);

  return v2;
}

+ (id)secureIndicatorActiveIntervalTypeMetrics
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
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("indicator_start_time"), CFSTR("RenderData"), CFSTR("SecureIndicatorActiveInterval"), 7, v3, v4, 1.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v6, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("indicator_end_time"), 7, v7, v5, 0, 1.0);

  v9 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v9, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("indicator_frame_count"), 7, v10, v5, 0, 1.0);

  v14[0] = v5;
  v14[1] = v8;
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)secureIndicatorTypeMetrics
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
  PPSMetric *v12;
  void *v13;
  PPSMetric *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Camera"), CFSTR("RenderData"), CFSTR("SecureIndicatorTypes"), 7, v3, v4, 1.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v6, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("FaceID"), 7, v7, v5, 0, 1.0);

  v9 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v9, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Microphone"), 7, v10, v5, 0, 1.0);

  v12 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v12, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("MicrophoneAccessibility"), 7, v13, v5, 0, 1.0);

  v17[0] = v5;
  v17[1] = v8;
  v17[2] = v11;
  v17[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)albumAnimationMetrics
{
  void *v2;
  void *v3;
  PPSMetric *v4;
  void *v5;
  void *v6;
  PPSMetric *v7;
  void *v8;
  PPSMetric *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("AlbumAnimationDuration"), CFSTR("RenderData"), CFSTR("AlbumAnimationDuration"), 7, v5, v6, 1.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, v3);

  v10 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)albumMotionMetrics
{
  void *v2;
  void *v3;
  PPSMetric *v4;
  void *v5;
  void *v6;
  PPSMetric *v7;
  void *v8;
  PPSMetric *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("AlbumMotionDownload"), CFSTR("RenderData"), CFSTR("AlbumMotionDownload"), 8, v5, v6, 1.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, v3);

  v10 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)renderPassCountMetrics
{
  void *v2;
  PPSMetric *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  PPSMetric *v7;
  void *v8;
  PPSMetric *v9;
  uint64_t v10;
  PPSMetric *v11;
  void *v12;
  void *v13;
  PPSMetric *v14;

  v2 = (void *)objc_opt_new();
  v3 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("bucket_count"), CFSTR("RenderData"), CFSTR("RenderPassCount"), 7, v4, v5, 2.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, 0);

  objc_msgSend(v2, "addObject:", v6);
  v7 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("bucket_size"), 7, v8, v6, 0, 2.0);

  objc_msgSend(v2, "addObject:", v9);
  v10 = 0;
  do
  {
    v11 = [PPSMetric alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bucket%d"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSUnit dimensionless](PPSUnit, "dimensionless");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v11, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", v12, 7, v13, v6, 0, 2.0);

    objc_msgSend(v2, "addObject:", v14);
    v10 = (v10 + 1);
  }
  while ((_DWORD)v10 != 10);

  return v2;
}

+ (id)layerCountMetrics
{
  void *v2;
  PPSMetric *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  PPSMetric *v7;
  void *v8;
  PPSMetric *v9;
  uint64_t v10;
  PPSMetric *v11;
  void *v12;
  void *v13;
  PPSMetric *v14;

  v2 = (void *)objc_opt_new();
  v3 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("bucket_count"), CFSTR("RenderData"), CFSTR("LayerCount"), 7, v4, v5, 2.0, 0x200000004, 0x100000001, 0x300000001, 0x100000001, 0);

  objc_msgSend(v2, "addObject:", v6);
  v7 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("bucket_size"), 7, v8, v6, 0, 2.0);

  objc_msgSend(v2, "addObject:", v9);
  v10 = 0;
  do
  {
    v11 = [PPSMetric alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bucket%d"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSUnit dimensionless](PPSUnit, "dimensionless");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v11, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", v12, 7, v13, v6, 0, 2.0);

    objc_msgSend(v2, "addObject:", v14);
    v10 = (v10 + 1);
  }
  while ((_DWORD)v10 != 10);

  return v2;
}

+ (id)offscreenReasonMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  PPSMetric *v5;
  PPSMetric *v6;
  void *v7;
  PPSMetric *v8;
  void *v9;
  PPSMetric *v10;
  void *v11;
  PPSMetric *v12;
  void *v13;
  PPSMetric *v14;
  PPSMetric *v15;
  void *v16;
  PPSMetric *v17;
  void *v18;
  PPSMetric *v19;
  void *v20;
  PPSMetric *v21;
  void *v22;
  PPSMetric *v23;
  PPSMetric *v24;
  void *v25;
  PPSMetric *v26;
  id v28;
  PPSMetric *v29;
  PPSMetric *v30;
  PPSMetric *v31;
  PPSMetric *v32;
  PPSMetric *v33;
  PPSMetric *v34;
  _QWORD v35[12];

  v35[10] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Shadow"), CFSTR("RenderData"), CFSTR("OffscreenReasons"), 7, v3, v4, 3.0, 0x200000004, 0x100000001, 0x100000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v6, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Patten_and_TiledImage"), 7, v7, v5, 0, 2.0);

  v8 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("BackdropCopy"), 7, v9, v5, 0, 2.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Blending_and_Transition"), 7, v11, v5, 0, 2.0);

  v12 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v12, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Filter"), 7, v13, v5, 0, 2.0);

  v15 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v15, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Transform_and_Scaling"), 7, v16, v5, 0, 2.0);

  v17 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Mask"), 7, v18, v5, 0, 2.0);

  v19 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v19, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Group"), 7, v20, v5, 0, 2.0);

  v21 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v21, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Plugin_and_Cache"), 7, v22, v5, 0, 2.0);

  v24 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v24, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("DestinationCopy"), 7, v25, v5, 0, 2.0);

  v35[0] = v5;
  v35[1] = v34;
  v35[2] = v33;
  v35[3] = v14;
  v35[4] = v32;
  v35[5] = v31;
  v35[6] = v30;
  v35[7] = v29;
  v35[8] = v23;
  v35[9] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 10);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  return v28;
}

@end
