@implementation PPSGenerativeFunctionMetrics

+ (id)subsystem
{
  return CFSTR("GenerativeFunctionMetrics");
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
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "appleDiffusionMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "assetLoadMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend((id)objc_opt_class(), "fileResidentRatioMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  objc_msgSend((id)objc_opt_class(), "handwritingModelInferenceMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  objc_msgSend((id)objc_opt_class(), "handwritingModelLoadMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v7);

  objc_msgSend((id)objc_opt_class(), "mmExecuteRequestMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v8);

  objc_msgSend((id)objc_opt_class(), "optInMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v9);

  objc_msgSend((id)objc_opt_class(), "smartReplySessionMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v10);

  objc_msgSend((id)objc_opt_class(), "summarizationMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v11);

  objc_msgSend((id)objc_opt_class(), "tgiExecuteRequestMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v12);

  return v2;
}

+ (id)appleDiffusionMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PPSMetric *v9;
  void *v10;
  void *v11;
  void *v12;
  PPSMetric *v13;
  PPSMetric *v14;
  void *v15;
  PPSMetric *v16;
  PPSMetric *v17;
  void *v18;
  PPSMetric *v19;
  PPSMetric *v20;
  void *v21;
  PPSMetric *v22;
  PPSMetric *v23;
  void *v24;
  PPSMetric *v25;
  PPSMetric *v26;
  void *v27;
  PPSMetric *v28;
  void *v29;
  _QWORD v31[6];
  _QWORD v32[5];
  _QWORD v33[5];
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v34 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v2;
  v33[0] = CFSTR("100k - 200k pixels");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v3;
  v33[1] = CFSTR("200,001 - 500k pixels");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v4;
  v33[2] = CFSTR("500,001 - 1.1m pixels");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v5;
  v33[3] = CFSTR("> 1.1m pixels");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v6;
  v33[4] = CFSTR("< 100k pixels or nil");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [PPSMetric alloc];
  +[PPSGenerativeFunctionMetrics subsystem](PPSGenerativeFunctionMetrics, "subsystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v9, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("adapters"), v10, CFSTR("appleDiffusion"), 3, v11, v12, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v14 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v14, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("inputPixels"), 7, v15, v13, v8, 1.0);

  v17 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("outputPixels"), 7, v18, v13, v8, 1.0);

  v20 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v20, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("requestIdentifier"), 3, v21, v13, 0, 1.0);

  v23 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v23, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v24, v13, 0, 1.0);

  v26 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v26, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("unetIterations"), 7, v27, v13, 0, 1.0);

  v31[0] = v13;
  v31[1] = v16;
  v31[2] = v19;
  v31[3] = v22;
  v31[4] = v25;
  v31[5] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)assetLoadMetrics
{
  void *v2;
  uint64_t v3;
  PPSMetric *v4;
  void *v5;
  void *v6;
  void *v7;
  PPSMetric *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PPSMetric *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PPSMetric *v26;
  void *v27;
  PPSMetric *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PPSMetric *v34;
  void *v35;
  PPSMetric *v36;
  PPSMetric *v37;
  void *v38;
  PPSMetric *v39;
  PPSMetric *v40;
  void *v41;
  PPSMetric *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  PPSMetric *v51;
  void *v52;
  PPSMetric *v53;
  void *v54;
  PPSMetric *v55;
  _QWORD v56[7];
  _QWORD v57[3];
  _QWORD v58[3];
  const __CFString *v59;
  void *v60;
  _QWORD v61[11];
  _QWORD v62[11];
  const __CFString *v63;
  void *v64;
  _QWORD v65[6];
  _QWORD v66[6];
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x24BDAC8D0];
  v69 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = [PPSMetric alloc];
  +[PPSGenerativeFunctionMetrics subsystem](PPSGenerativeFunctionMetrics, "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)v3;
  v55 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v4, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("catalogResourceIdentifier"), v5, CFSTR("assetLoad"), 3, v6, v7, 1.1, 0x200000005, 0x100000001, 0x300000001, 0x100000001, v3);

  v8 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("inferenceProviderIdentifier"), 3, v9, v55, v3, 1.0);

  v67 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v10;
  v66[0] = CFSTR("Acquire");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v11;
  v66[1] = CFSTR("Release");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v12;
  v66[2] = CFSTR("Unloaded-To-Dynamic-Mode");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v65[3] = v13;
  v66[3] = CFSTR("Loaded-To-Dynamic-Mode");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v65[4] = v14;
  v66[4] = CFSTR("Dynamic-Mode-To-Loaded");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v65[5] = v15;
  v66[5] = CFSTR("Dynamic-Mode-To-Unloaded");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("loadType"), 7, v18, v55, v52, 1.1);

  v63 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v49;
  v62[0] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v48;
  v62[1] = CFSTR("User-Initiated");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v47;
  v62[2] = CFSTR("Policy-Change");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v46;
  v62[3] = CFSTR("Memory-Budget-Pressure");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v61[4] = v45;
  v62[4] = CFSTR("Aquisition-Error");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v61[5] = v19;
  v62[5] = CFSTR("Prewarm");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v61[6] = v20;
  v62[6] = CFSTR("Inactivity-Timer");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v61[7] = v21;
  v62[7] = CFSTR("Asset-Version-Change");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61[8] = v22;
  v62[8] = CFSTR("Background-Session");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61[9] = v23;
  v62[9] = CFSTR("Connection-Termination");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v61[10] = v24;
  v62[10] = CFSTR("Critical-Memory");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v26, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("reason"), 7, v27, v55, v50, 1.3);

  v59 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v29;
  v58[0] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v30;
  v58[1] = CFSTR("Success");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v31;
  v58[2] = CFSTR("Failure");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v32;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v34, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("result"), 7, v35, v55, v33, 2.0);

  v37 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v37, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sessionIdentifier"), 3, v38, v55, 0, 1.0);

  v40 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v40, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v41, v55, 0, 1.0);

  v56[0] = v55;
  v56[1] = v53;
  v56[2] = v51;
  v56[3] = v28;
  v56[4] = v36;
  v56[5] = v39;
  v56[6] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 7);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

+ (id)fileResidentRatioMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  PPSMetric *v7;
  void *v8;
  PPSMetric *v9;
  PPSMetric *v10;
  void *v11;
  PPSMetric *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSGenerativeFunctionMetrics subsystem](PPSGenerativeFunctionMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("catalogResourceIdentifier"), v3, CFSTR("fileResidentInfo"), 3, v4, v5, 1.0, 0x200000002, 0x100000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("fileResidentRatio"), 7, v8, v6, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit kilobytes](PPSUnit, "kilobytes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("memoryCostKB"), 7, v11, v6, 0, 1.0);

  v15[0] = v6;
  v15[1] = v9;
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)handwritingModelInferenceMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PPSMetric *v8;
  void *v9;
  void *v10;
  void *v11;
  PPSMetric *v12;
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  PPSMetric *v16;
  void *v17;
  PPSMetric *v18;
  PPSMetric *v19;
  void *v20;
  PPSMetric *v21;
  PPSMetric *v22;
  void *v23;
  PPSMetric *v24;
  PPSMetric *v25;
  void *v26;
  PPSMetric *v27;
  void *v28;
  _QWORD v30[6];
  _QWORD v31[4];
  _QWORD v32[4];
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v33 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v2;
  v32[0] = CFSTR("Stroke-Classifier");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v3;
  v32[1] = CFSTR("Stroke-Grouping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v4;
  v32[2] = CFSTR("Math-Recognizer");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v5;
  v32[3] = CFSTR("Synthesizer");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PPSMetric alloc];
  +[PPSGenerativeFunctionMetrics subsystem](PPSGenerativeFunctionMetrics, "subsystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v8, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("model"), v9, CFSTR("HandwritingInference"), 7, v10, v11, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, v7);

  v13 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("inputStringLength"), 7, v14, v12, 0, 1.0);

  v16 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v16, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("inputStrokeCount"), 7, v17, v12, 0, 1.0);

  v19 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v19, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("outputStringLength"), 7, v20, v12, 0, 1.0);

  v22 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v22, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("outputStrokeCount"), 7, v23, v12, 0, 1.0);

  v25 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v25, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v26, v12, 0, 1.0);

  v30[0] = v12;
  v30[1] = v15;
  v30[2] = v18;
  v30[3] = v21;
  v30[4] = v24;
  v30[5] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)handwritingModelLoadMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PPSMetric *v8;
  void *v9;
  void *v10;
  void *v11;
  PPSMetric *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PPSMetric *v17;
  void *v18;
  PPSMetric *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  const __CFString *v25;
  void *v26;
  _QWORD v27[4];
  _QWORD v28[4];
  const __CFString *v29;
  _QWORD v30[3];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v29 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v2;
  v28[0] = CFSTR("Stroke-Classifier");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v3;
  v28[1] = CFSTR("Stroke-Grouping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v4;
  v28[2] = CFSTR("Math-Recognizer");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v5;
  v28[3] = CFSTR("Synthesizer");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PPSMetric alloc];
  +[PPSGenerativeFunctionMetrics subsystem](PPSGenerativeFunctionMetrics, "subsystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v8, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("model"), v9, CFSTR("HandwritingModelLoad"), 7, v10, v11, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v7);

  v25 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v24[0] = CFSTR("Acquire");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  v24[1] = CFSTR("Release");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("loadType"), 7, v18, v12, v16, 1.0);

  v22[0] = v12;
  v22[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)mmExecuteRequestMetrics
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
  void *v11;
  PPSMetric *v12;
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
  void *v23;
  PPSMetric *v24;
  void *v25;
  PPSMetric *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PPSMetric *v31;
  void *v32;
  PPSMetric *v33;
  void *v34;
  PPSMetric *v35;
  PPSMetric *v36;
  void *v37;
  PPSMetric *v38;
  PPSMetric *v39;
  void *v40;
  PPSMetric *v41;
  id v43;
  PPSMetric *v44;
  void *v45;
  PPSMetric *v46;
  PPSMetric *v47;
  void *v48;
  PPSMetric *v49;
  PPSMetric *v50;
  PPSMetric *v51;
  void *v52;
  PPSMetric *v53;
  _QWORD v54[11];
  _QWORD v55[2];
  _QWORD v56[2];
  const __CFString *v57;
  void *v58;
  _QWORD v59[5];
  _QWORD v60[5];
  const __CFString *v61;
  void *v62;
  _QWORD v63[2];
  _QWORD v64[2];
  const __CFString *v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSGenerativeFunctionMetrics subsystem](PPSGenerativeFunctionMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("catalogResourceIdentifier"), v3, CFSTR("mmExecuteRequest"), 3, v4, v5, 1.1, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v7 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("createdByBundleIdentifier"), 3, v8, v6, 0, 1.0);

  v65 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v9;
  v64[0] = CFSTR("No-Error");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v10;
  v64[1] = CFSTR("Error");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v12, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("error"), 5, v13, v6, v52, 1.0);

  v14 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v14, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("inferenceProviderIdentifier"), 3, v15, v6, 0, 1.0);

  v16 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v16, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("onBehalfOfBundleIdentifier"), 3, v17, v6, 0, 1.1);

  v61 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0xFFFFFFFFLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v18;
  v60[0] = CFSTR("Default");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v19;
  v60[1] = CFSTR("User-Interactive");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v20;
  v60[2] = CFSTR("User-Initiated");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v21;
  v60[3] = CFSTR("Utility");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v22;
  v60[4] = CFSTR("Background");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v24, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("qos"), 7, v25, v6, v48, 1.0);

  v26 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v26, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("requestIdentifier"), 3, v27, v6, 0, 1.0);

  v57 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v28;
  v56[0] = CFSTR("One-Shot");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v29;
  v56[1] = CFSTR("Streaming");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v31, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("requestType"), 7, v32, v6, v45, 1.0);

  v33 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v33, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sessionIdentifier"), 3, v34, v6, 0, 1.0);

  v36 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v36, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("useCaseIdentifier"), 3, v37, v6, 0, 1.0);

  v39 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v39, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v40, v6, 0, 1.0);

  v54[0] = v6;
  v54[1] = v53;
  v54[2] = v51;
  v54[3] = v50;
  v54[4] = v49;
  v54[5] = v47;
  v54[6] = v46;
  v54[7] = v44;
  v54[8] = v35;
  v54[9] = v38;
  v54[10] = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 11);
  v43 = (id)objc_claimAutoreleasedReturnValue();

  return v43;
}

+ (id)optInMetrics
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
  v16[0] = CFSTR("Disabled/Unavailable");
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
  +[PPSGenerativeFunctionMetrics subsystem](PPSGenerativeFunctionMetrics, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("Enabled"), v8, CFSTR("OptIn"), 5, v9, v10, 2.01, 0x200000003, 0x100000001, 0x300000015, 0x100000001, v6);

  v14 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)summarizationMetrics
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PPSMetric *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PPSMetric *v24;
  void *v25;
  PPSMetric *v26;
  PPSMetric *v27;
  void *v28;
  PPSMetric *v29;
  PPSMetric *v30;
  void *v31;
  PPSMetric *v32;
  PPSMetric *v33;
  void *v34;
  PPSMetric *v35;
  PPSMetric *v36;
  void *v37;
  PPSMetric *v38;
  PPSMetric *v39;
  void *v40;
  PPSMetric *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  PPSMetric *v55;
  void *v56;
  PPSMetric *v57;
  PPSMetric *v58;
  _QWORD v59[9];
  _QWORD v60[4];
  _QWORD v61[4];
  const __CFString *v62;
  void *v63;
  _QWORD v64[16];
  _QWORD v65[16];
  const __CFString *v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSGenerativeFunctionMetrics subsystem](PPSGenerativeFunctionMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("bundleID"), v3, CFSTR("Summarization"), 3, v4, v5, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSGenerativeFunctionMetrics subsystem](PPSGenerativeFunctionMetrics, "subsystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v6, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("characterLength"), v7, CFSTR("Summarization"), 7, v8, v9, 1.0, 0x200000005, 0x100000001, 0x100000001, 0x100000001, 0);

  v66 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v54;
  v65[0] = CFSTR("Missing-ID");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v52;
  v65[1] = CFSTR("MissingSender");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v51;
  v65[2] = CFSTR("Domain-ID");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v50;
  v65[3] = CFSTR("Already-Handled-By-Mail-Pipeline");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v49;
  v65[4] = CFSTR("Already-Handled-By-Messages-Pipeline");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v48;
  v65[5] = CFSTR("Already-Processed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v47;
  v65[6] = CFSTR("Not-Eligible-For-Summarization");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 7);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v46;
  v65[7] = CFSTR("Stack-Not-Eligible-For-Summarization");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v45;
  v65[8] = CFSTR("Notification-Not-Eligible-For-Summarization");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v44;
  v65[9] = CFSTR("Task-Cancelled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v64[10] = v10;
  v65[10] = CFSTR("Task-Cancelled2");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v64[11] = v11;
  v65[11] = CFSTR("Throttled-By-Power-Budget");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64[12] = v12;
  v65[12] = CFSTR("Successful");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 13);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v64[13] = v13;
  v65[13] = CFSTR("Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 14);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v64[14] = v14;
  v65[14] = CFSTR("Input-Too-Short");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 15);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64[15] = v15;
  v65[15] = CFSTR("Use-Case-Disabled");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 16);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("exitReason"), 7, v18, v57, v56, 1.1);

  v62 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v19;
  v61[0] = CFSTR("Mail");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v20;
  v61[1] = CFSTR("Message");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v21;
  v61[2] = CFSTR("Notification");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v22;
  v61[3] = CFSTR("Notification-Stack");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v24, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("kind"), 7, v25, v57, v53, 1.0);

  v27 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v27, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("isUrgent"), 5, v28, v57, 0, 1.0);

  v30 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v30, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("requestIdentifier"), 3, v31, v57, 0, 1.0);

  v33 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v33, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("stackDepth"), 7, v34, v57, 0, 1.0);

  v36 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v36, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v37, v57, 0, 1.0);

  v39 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v39, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("urgencyPipelineUsed"), 5, v40, v57, 0, 1.0);

  v59[0] = v57;
  v59[1] = v58;
  v59[2] = v26;
  v59[3] = v29;
  v59[4] = v55;
  v59[5] = v32;
  v59[6] = v35;
  v59[7] = v38;
  v59[8] = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

+ (id)tgiExecuteRequestMetrics
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
  void *v12;
  void *v13;
  void *v14;
  PPSMetric *v15;
  void *v16;
  PPSMetric *v17;
  void *v18;
  PPSMetric *v19;
  void *v20;
  PPSMetric *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PPSMetric *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PPSMetric *v34;
  void *v35;
  PPSMetric *v36;
  void *v37;
  PPSMetric *v38;
  PPSMetric *v39;
  void *v40;
  PPSMetric *v41;
  PPSMetric *v42;
  void *v43;
  PPSMetric *v44;
  void *v45;
  PPSMetric *v46;
  void *v47;
  PPSMetric *v48;
  PPSMetric *v49;
  void *v50;
  PPSMetric *v51;
  void *v52;
  PPSMetric *v53;
  PPSMetric *v54;
  void *v55;
  PPSMetric *v56;
  PPSMetric *v57;
  void *v58;
  PPSMetric *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  PPSMetric *v74;
  void *v75;
  PPSMetric *v76;
  void *v77;
  PPSMetric *v78;
  void *v79;
  PPSMetric *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  PPSMetric *v87;
  void *v88;
  PPSMetric *v89;
  void *v90;
  PPSMetric *v91;
  void *v92;
  PPSMetric *v93;
  void *v94;
  PPSMetric *v95;
  PPSMetric *v96;
  PPSMetric *v97;
  _QWORD v98[17];
  _QWORD v99[5];
  _QWORD v100[5];
  const __CFString *v101;
  void *v102;
  _QWORD v103[2];
  _QWORD v104[2];
  const __CFString *v105;
  void *v106;
  _QWORD v107[28];
  _QWORD v108[28];
  const __CFString *v109;
  _QWORD v110[3];

  v110[1] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSGenerativeFunctionMetrics subsystem](PPSGenerativeFunctionMetrics, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("inputTokensCount"), v3, CFSTR("tgiExecuteRequest"), 7, v4, v5, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v6, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("outputTokensCount"), 7, v7, v96, 0, 1.0);

  v109 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v94;
  v108[0] = CFSTR("No-Error");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v92;
  v108[1] = CFSTR("General-Request-Failure");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v90;
  v108[2] = CFSTR("Create-Inference-ContextFailure");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v107[3] = v88;
  v108[3] = CFSTR("General-Failure");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v107[4] = v86;
  v108[4] = CFSTR("Unknown-Special-Token");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v107[5] = v83;
  v108[5] = CFSTR("Tokenization-Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v107[6] = v81;
  v108[6] = CFSTR("Max-Output-Tokens-Value");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 7);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v107[7] = v79;
  v108[7] = CFSTR("Extend-Inference-Failure");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 8);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v107[8] = v77;
  v108[8] = CFSTR("Encode-Response-Failure");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v107[9] = v75;
  v108[9] = CFSTR("Stream-Cancelled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v107[10] = v73;
  v108[10] = CFSTR("Stream-Not-Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 11);
  v71 = (id)objc_claimAutoreleasedReturnValue();
  v107[11] = v71;
  v108[11] = CFSTR("Output-Token-Resolution-Failure");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 12);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v107[12] = v70;
  v108[12] = CFSTR("No-Catalog");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 13);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v107[13] = v69;
  v108[13] = CFSTR("Unknown-Request-Payload-Case");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 14);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v107[14] = v68;
  v108[14] = CFSTR("Words-To-String-Conversation-Failure");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 15);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v107[15] = v67;
  v108[15] = CFSTR("Async-Stream-Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 16);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v107[16] = v66;
  v108[16] = CFSTR("Prompt-Render-Error");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 17);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v107[17] = v65;
  v108[17] = CFSTR("Response-Type");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 18);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v107[18] = v64;
  v108[18] = CFSTR("One-Shot-Server-Response-Missing-Completion");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 19);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v107[19] = v63;
  v108[19] = CFSTR("Stream-Server-Response-Missing-Completion");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 20);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v107[20] = v62;
  v108[20] = CFSTR("Visual-Generation-Unknown-Generator");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 21);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v107[21] = v61;
  v108[21] = CFSTR("Visual-Generation-Unspecified-Goals");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v107[22] = v8;
  v108[22] = CFSTR("Visual-Generation-Unexpected-Condition");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v107[23] = v9;
  v108[23] = CFSTR("Visual-Generation-Missing-Resource");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v107[24] = v10;
  v108[24] = CFSTR("Visual-Generation-Analysis-Error");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v107[25] = v11;
  v108[25] = CFSTR("Visual-Generation-Initialization-Error");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v107[26] = v12;
  v108[26] = CFSTR("Visual-Generation-Image-Rejected");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v107[27] = v13;
  v108[27] = CFSTR("Visual-Generation-Image-Type-Not-Supported");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v108, v107, 28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v110, &v109, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v15, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("errorType"), 7, v16, v96, v85, 1.0);

  v17 = [PPSMetric alloc];
  +[PPSUnit milliseconds](PPSUnit, "milliseconds");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("extendTokenInferenceLatency"), 7, v18, v96, 0, 1.0);

  v19 = [PPSMetric alloc];
  +[PPSUnit milliseconds](PPSUnit, "milliseconds");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v19, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("firstTokenInferenceLatency"), 7, v20, v96, 0, 1.0);

  v21 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v21, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("requestIdentifier"), 3, v22, v96, 0, 1.0);

  v105 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v23;
  v104[0] = CFSTR("One-Shot");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v24;
  v104[1] = CFSTR("Streaming");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v26, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("requestType"), 7, v27, v96, v84, 1.0);

  v101 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0xFFFFFFFFLL);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v28;
  v100[0] = CFSTR("Default");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v29;
  v100[1] = CFSTR("User-Interactive");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v30;
  v100[2] = CFSTR("User-Initiated");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 17);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v31;
  v100[3] = CFSTR("Utility");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v99[4] = v32;
  v100[4] = CFSTR("Background");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v100, v99, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v34, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("qos"), 7, v35, v96, v82, 1.1);

  v36 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v36, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sd_draftModelInferenceCallCount"), 7, v37, v96, 0, 1.0);

  v39 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v39, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sd_targetModelInferenceCallCount"), 7, v40, v96, 0, 1.0);

  v42 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v42, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sd_draftTokenAcceptanceRate"), 7, v43, v96, 0, 1.0);

  v44 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v44, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sd_speculationSuccessRate"), 7, v45, v96, 0, 1.0);

  v46 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v46, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sd_draftOutputTokensCount"), 7, v47, v96, 0, 1.0);

  v49 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v49, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sd_totalOutputTokensCount"), 7, v50, v96, 0, 1.0);

  v51 = [PPSMetric alloc];
  +[PPSUnit milliseconds](PPSUnit, "milliseconds");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v51, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sd_draftModelTotalLatency"), 7, v52, v96, 0, 1.0);

  v54 = [PPSMetric alloc];
  +[PPSUnit milliseconds](PPSUnit, "milliseconds");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v54, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("sd_targetModelTotalLatency"), 7, v55, v96, 0, 1.0);

  v57 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v57, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v58, v96, 0, 1.0);

  v98[0] = v96;
  v98[1] = v97;
  v98[2] = v93;
  v98[3] = v95;
  v98[4] = v91;
  v98[5] = v89;
  v98[6] = v87;
  v98[7] = v80;
  v98[8] = v38;
  v98[9] = v41;
  v98[10] = v78;
  v98[11] = v76;
  v98[12] = v48;
  v98[13] = v74;
  v98[14] = v53;
  v98[15] = v56;
  v98[16] = v59;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 17);
  v72 = (id)objc_claimAutoreleasedReturnValue();

  return v72;
}

+ (id)smartReplySessionMetrics
{
  void *v2;
  void *v3;
  void *v4;
  PPSMetric *v5;
  void *v6;
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
  PPSMetric *v17;
  void *v18;
  PPSMetric *v19;
  PPSMetric *v20;
  void *v21;
  PPSMetric *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PPSMetric *v27;
  void *v28;
  PPSMetric *v29;
  PPSMetric *v30;
  void *v31;
  PPSMetric *v32;
  void *v33;
  void *v35;
  void *v36;
  _QWORD v37[6];
  _QWORD v38[2];
  _QWORD v39[2];
  const __CFString *v40;
  void *v41;
  _QWORD v42[3];
  _QWORD v43[3];
  const __CFString *v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  const __CFString *v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v48 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v2;
  v47[0] = CFSTR("Messages");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v3;
  v47[1] = CFSTR("Mail");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [PPSMetric alloc];
  +[PPSGenerativeFunctionMetrics subsystem](PPSGenerativeFunctionMetrics, "subsystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v5, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("App"), v6, CFSTR("SmartReplySession"), 7, v7, v8, 1.0, 0x200000005, 0x100000001, 0x300000001, 0x100000001, v36);

  v44 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v10;
  v43[0] = CFSTR("Start");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v11;
  v43[1] = CFSTR("Complete");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v12;
  v43[2] = CFSTR("Exception");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v14, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("EventType"), 7, v15, v9, v35, 1.0);

  v17 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("InputTokenCount"), 7, v18, v16, 0, 1.0);

  v20 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v20, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("OutputTokenCount"), 7, v21, v16, 0, 1.0);

  v40 = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v23;
  v39[0] = CFSTR("Online");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v24;
  v39[1] = CFSTR("Offline");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v27, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("QueryType"), 7, v28, v16, v26, 1.0);

  v30 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v30, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("timestampEnd"), 4, v31, v19, 0, 1.0);

  v37[0] = v9;
  v37[1] = v16;
  v37[2] = v19;
  v37[3] = v22;
  v37[4] = v29;
  v37[5] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

@end
