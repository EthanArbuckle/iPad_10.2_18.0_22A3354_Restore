@implementation PPSDisplayMetrics

+ (id)subsystem
{
  return CFSTR("DisplayMetrics");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "displayMetricsWithStorage:timeToLive:category:", 2, 1, CFSTR("DisplayState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);
  objc_msgSend((id)objc_opt_class(), "displayMetricsWithStorage:timeToLive:category:", 3, 7, CFSTR("DisplayStateExtended"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  return v2;
}

+ (id)displayMetricsWithStorage:(int)a3 timeToLive:(unsigned int)a4 category:(id)a5
{
  id v7;
  void *v8;
  PPSMetric *v9;
  void *v10;
  void *v11;
  void *v12;
  PPSMetric *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PPSMetric *v20;
  void *v21;
  void *v22;
  void *v23;
  PPSMetric *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[24];
  _BYTE v30[24];
  void *v32;
  _QWORD v33[2];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  const __CFString *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v38 = CFSTR("MetricType");
  v7 = a5;
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [PPSMetric alloc];
  +[PPSDisplayMetrics subsystem](PPSDisplayMetrics, "subsystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSDisplayMetrics displayLoggingCadence](PPSDisplayMetrics, "displayLoggingCadence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v29[20] = 1;
  *(_QWORD *)&v29[12] = 0x100000003;
  *(_QWORD *)&v29[4] = 0x800000001;
  HIDWORD(v27) = a3;
  *(_DWORD *)v29 = a4;
  LODWORD(v27) = 3;
  v13 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v9, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Block"), v10, v7, 3, v11, v12, 2.0, v27, *(_QWORD *)v29, *(_QWORD *)&v29[8], *(_QWORD *)&v29[16], v32);

  v36[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v14;
  v35[0] = CFSTR("Inactive");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v15;
  v35[1] = CFSTR("Active");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v16;
  v35[2] = CFSTR("AOD");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v17;
  v37[1] = &unk_251428500;
  v36[1] = CFSTR("GroupingDimensions");
  v36[2] = CFSTR("MetricType");
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [PPSMetric alloc];
  +[PPSDisplayMetrics subsystem](PPSDisplayMetrics, "subsystem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSDisplayMetrics displayLoggingCadence](PPSDisplayMetrics, "displayLoggingCadence");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v30[20] = 1;
  *(_QWORD *)&v30[12] = 0x100000003;
  *(_QWORD *)&v30[4] = 0x800000001;
  HIDWORD(v28) = a3;
  *(_DWORD *)v30 = a4;
  LODWORD(v28) = 3;
  v24 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v20, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Active"), v21, v7, 7, v22, v23, 3.0, v28, *(_QWORD *)v30, *(_QWORD *)&v30[8], *(_QWORD *)&v30[16], v19);

  v33[0] = v13;
  v33[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)displayLoggingCadence
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
  v2 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 3, 1);
  v3 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 4, 0);
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
