@implementation PPSANEMetrics

+ (id)subsystem
{
  return CFSTR("ANE");
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
  objc_msgSend((id)objc_opt_class(), "compileMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "inferenceMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend((id)objc_opt_class(), "modelLoadMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  objc_msgSend((id)objc_opt_class(), "modelUnLoadMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend((id)objc_opt_class(), "newInstanceModelUnLoadMetrics");
  objc_msgSend(v2, "addObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend((id)objc_opt_class(), "newInstanceModelLoadMetrics");
  objc_msgSend(v2, "addObjectsFromArray:", v8);

  objc_msgSend((id)objc_opt_class(), "ANEStatusMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v9);

  return v2;
}

+ (id)compileMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PPSMetric *v10;
  void *v11;
  void *v12;
  PPSMetric *v13;
  PPSMetric *v14;
  void *v15;
  PPSMetric *v16;
  void *v17;
  PPSMetric *v18;
  void *v19;
  PPSMetric *v20;
  void *v21;
  void *v22;
  PPSMetric *v23;
  void *v24;
  PPSMetric *v25;
  PPSMetric *v26;
  void *v27;
  void *v28;
  PPSMetric *v29;
  PPSMetric *v30;
  void *v31;
  PPSMetric *v32;
  void *v33;
  PPSMetric *v35;
  PPSMetric *v36;
  void *v37;
  _QWORD v38[7];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[6];
  _QWORD v42[6];
  _QWORD v43[2];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v43[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v2;
  v42[0] = CFSTR("ANECIR");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v3;
  v42[1] = CFSTR("CoreML");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v4;
  v42[2] = CFSTR("MIL");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v5;
  v42[3] = CFSTR("JIT+ANECIR");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v6;
  v42[4] = CFSTR("JIT+CoreML");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[5] = v7;
  v42[5] = CFSTR("JIT+MIL");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = CFSTR("MetricType");
  v44[0] = v8;
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v10, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("modelType"), CFSTR("ANE"), CFSTR("modelCompilation"), 7, v11, v12, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, v37);

  v14 = [PPSMetric alloc];
  +[PPSUnit milliseconds](PPSUnit, "milliseconds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v14, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("modelCompileTime"), 7, v15, v13, 0, 1.0);

  v16 = [PPSMetric alloc];
  +[PPSUnit milliseconds](PPSUnit, "milliseconds");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v16, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("modelIRTranslationTime"), 7, v17, v13, 0, 1.0);

  v18 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v18, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("modelCompiled"), 5, v19, v13, 0, 1.0);

  v39[0] = CFSTR("DMACompliant");
  v39[1] = CFSTR("MetricType");
  v40[0] = MEMORY[0x24BDBD1C8];
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v23, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("csIdentity"), 3, v24, v13, v22, 1.0);

  v26 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v26, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("modelURL"), CFSTR("ANE"), CFSTR("modelCompilation"), 3, v27, v28, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x300000001, 0);

  v30 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v30, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("compilationArgs"), 3, v31, v13, 0, 1.0);

  v38[0] = v13;
  v38[1] = v36;
  v38[2] = v35;
  v38[3] = v20;
  v38[4] = v25;
  v38[5] = v29;
  v38[6] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (id)inferenceMetrics
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
  PPSMetric *v11;
  void *v12;
  void *v13;
  PPSMetric *v14;
  void *v15;
  void *v16;
  PPSMetric *v17;
  void *v18;
  PPSMetric *v19;
  PPSMetric *v20;
  void *v21;
  void *v22;
  PPSMetric *v23;
  PPSMetric *v24;
  void *v25;
  PPSMetric *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[30];
  _QWORD v57[30];
  _QWORD v58[2];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x24BDAC8D0];
  v58[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v52;
  v57[0] = CFSTR("Success");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v51;
  v57[1] = CFSTR("No Memory");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v50;
  v57[2] = CFSTR("Bad Argument");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v49;
  v57[3] = CFSTR("Not Supported");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v48;
  v57[4] = CFSTR("Not Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v47;
  v57[5] = CFSTR("No Resources");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v46;
  v57[6] = CFSTR("Device Controller Creation Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 7);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v45;
  v57[7] = CFSTR("Device Controller Not Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v56[8] = v44;
  v57[8] = CFSTR("Device Not Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v56[9] = v43;
  v57[9] = CFSTR("Device Open Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v56[10] = v42;
  v57[10] = CFSTR("Device PowerOn Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v56[11] = v41;
  v57[11] = CFSTR("Program Not Prepared");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 12);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v56[12] = v40;
  v57[12] = CFSTR("Dylib Not Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 13);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v56[13] = v39;
  v57[13] = CFSTR("Function Not Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 14);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v56[14] = v38;
  v57[14] = CFSTR("Program Not Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 15);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v56[15] = v37;
  v57[15] = CFSTR("Timeout");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 16);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56[16] = v36;
  v57[16] = CFSTR("Hardware Failure");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 17);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v56[17] = v35;
  v57[17] = CFSTR("Firmware Failure");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 18);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v56[18] = v34;
  v57[18] = CFSTR("Error");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 19);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v56[19] = v33;
  v57[19] = CFSTR("Bad Program");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 20);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[20] = v32;
  v57[20] = CFSTR("Not Privileged");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v56[21] = v30;
  v57[21] = CFSTR("Request Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v56[22] = v29;
  v57[22] = CFSTR("Not Ready");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 23);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v56[23] = v2;
  v57[23] = CFSTR("Not Permitted");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v56[24] = v3;
  v57[24] = CFSTR("Unsupported");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v56[25] = v4;
  v57[25] = CFSTR("Higher Priority Request Present");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56[26] = v5;
  v57[26] = CFSTR("Failed To Allocate Shared Intermediate Buffer");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v56[27] = v6;
  v57[27] = CFSTR("Failed To Lock Shared Intermediate Buffer");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v56[28] = v7;
  v57[28] = CFSTR("Iso Too Old");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56[29] = v8;
  v57[29] = CFSTR("Smaller IOBuffers Than Expected");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = CFSTR("MetricType");
  v59[0] = v9;
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v11, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("failureReason"), CFSTR("ANE"), CFSTR("modelInference"), 7, v12, v13, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, v31);

  v54[0] = CFSTR("DMACompliant");
  v54[1] = CFSTR("MetricType");
  v55[0] = MEMORY[0x24BDBD1C8];
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("csIdentity"), 3, v18, v14, v16, 1.0);

  v20 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v20, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("modelURL"), CFSTR("ANE"), CFSTR("modelInference"), 3, v21, v22, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x300000001, 0);

  v24 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v24, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("programHandle"), 7, v25, v14, 0, 1.0);

  v53[0] = v14;
  v53[1] = v19;
  v53[2] = v23;
  v53[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)modelLoadMetrics
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
  void *v12;
  PPSMetric *v13;
  void *v14;
  PPSMetric *v15;
  PPSMetric *v16;
  void *v17;
  void *v18;
  PPSMetric *v19;
  PPSMetric *v20;
  void *v21;
  PPSMetric *v22;
  void *v23;
  void *v24;
  PPSMetric *v25;
  void *v26;
  PPSMetric *v27;
  void *v28;
  void *v30;
  PPSMetric *v31;
  PPSMetric *v32;
  PPSMetric *v33;
  _QWORD v34[8];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("isPrecompiled"), CFSTR("ANE"), CFSTR("modelLoad"), 5, v3, v4, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v6, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("cacheHit"), 5, v7, v5, 0, 1.0);

  v8 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("modelLoaded"), 5, v9, v5, 0, 1.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit milliseconds](PPSUnit, "milliseconds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("modelLoadingTime"), 8, v11, v5, 0, 1.0);

  v37[0] = CFSTR("DMACompliant");
  v37[1] = CFSTR("MetricType");
  v38[0] = MEMORY[0x24BDBD1C8];
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v13, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("csIdentity"), 3, v14, v5, v30, 1.0);

  v16 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v16, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("modelURL"), CFSTR("ANE"), CFSTR("modelLoad"), 3, v17, v18, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x300000001, 0);

  v20 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v20, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("programHandle"), 7, v21, v5, 0, 1.0);

  v36[0] = &unk_251428518;
  v35[0] = CFSTR("GroupingDimensions");
  v35[1] = CFSTR("MetricType");
  +[PPSMetricType absoluteMeasure](PPSMetricType, "absoluteMeasure");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [PPSMetric alloc];
  +[PPSUnit bytes](PPSUnit, "bytes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v25, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("modelSize"), 7, v26, v5, v24, 1.0);

  v34[0] = v5;
  v34[1] = v33;
  v34[2] = v32;
  v34[3] = v31;
  v34[4] = v15;
  v34[5] = v19;
  v34[6] = v22;
  v34[7] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)modelUnLoadMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  PPSMetric *v5;
  void *v6;
  void *v7;
  PPSMetric *v8;
  void *v9;
  PPSMetric *v10;
  PPSMetric *v11;
  void *v12;
  void *v13;
  PPSMetric *v14;
  PPSMetric *v15;
  void *v16;
  PPSMetric *v17;
  void *v18;
  _QWORD v20[4];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("modelUnloaded"), CFSTR("ANE"), CFSTR("modelUnload"), 5, v3, v4, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, 0);

  v21[0] = CFSTR("DMACompliant");
  v21[1] = CFSTR("MetricType");
  v22[0] = MEMORY[0x24BDBD1C8];
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("csIdentity"), 3, v9, v5, v7, 1.0);

  v11 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v11, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("modelURL"), CFSTR("ANE"), CFSTR("modelUnload"), 3, v12, v13, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x300000001, 0);

  v15 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v15, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("programHandle"), 7, v16, v5, 0, 1.0);

  v20[0] = v5;
  v20[1] = v10;
  v20[2] = v14;
  v20[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)newInstanceModelUnLoadMetrics
{
  PPSMetric *v2;
  void *v3;
  void *v4;
  PPSMetric *v5;
  void *v6;
  void *v7;
  PPSMetric *v8;
  void *v9;
  PPSMetric *v10;
  PPSMetric *v11;
  void *v12;
  void *v13;
  PPSMetric *v14;
  PPSMetric *v15;
  void *v16;
  PPSMetric *v17;
  void *v18;
  _QWORD v20[4];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("newInstanceUnloaded"), CFSTR("ANE"), CFSTR("newInstanceModelUnload"), 5, v3, v4, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, 0);

  v21[0] = CFSTR("DMACompliant");
  v21[1] = CFSTR("MetricType");
  v22[0] = MEMORY[0x24BDBD1C8];
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("csIdentity"), 3, v9, v5, v7, 1.0);

  v11 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v11, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("modelURL"), CFSTR("ANE"), CFSTR("newInstanceModelUnload"), 3, v12, v13, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x300000001, 0);

  v15 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v15, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("programHandle"), 7, v16, v5, 0, 1.0);

  v20[0] = v5;
  v20[1] = v10;
  v20[2] = v14;
  v20[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)newInstanceModelLoadMetrics
{
  void *v2;
  PPSMetric *v3;
  void *v4;
  void *v5;
  PPSMetric *v6;
  PPSMetric *v7;
  void *v8;
  void *v9;
  PPSMetric *v10;
  PPSMetric *v11;
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
  void *v23;
  void *v25;
  _QWORD v26[6];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v28[0] = MEMORY[0x24BDBD1C8];
  v27[0] = CFSTR("DMACompliant");
  v27[1] = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("csIdentity"), CFSTR("ANE"), CFSTR("newInstanceModelLoad"), 3, v4, v5, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, v25);

  v7 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v7, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("modelURL"), CFSTR("ANE"), CFSTR("newInstanceModelLoad"), 3, v8, v9, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x300000001, 0);

  v11 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v11, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("programHandle"), 7, v12, v6, 0, 1.0);

  v14 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v14, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("newInstanceLoaded"), 5, v15, v6, 0, 1.0);

  v17 = [PPSMetric alloc];
  +[PPSUnit milliseconds](PPSUnit, "milliseconds");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("modelLoadingTime"), 8, v18, v6, 0, 1.0);

  v20 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v20, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("numWeightFiles"), 7, v21, v6, 0, 1.0);

  v26[0] = v6;
  v26[1] = v10;
  v26[2] = v13;
  v26[3] = v16;
  v26[4] = v19;
  v26[5] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)ANEStatusMetrics
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PPSMetric *v22;
  void *v23;
  PPSMetric *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  PPSMetric *v63;
  void *v64;
  _QWORD v65[2];
  _QWORD v66[30];
  _QWORD v67[30];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[18];
  _QWORD v71[18];
  _QWORD v72[2];
  _QWORD v73[4];

  v73[2] = *MEMORY[0x24BDAC8D0];
  v72[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v62;
  v71[0] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v60;
  v71[1] = CFSTR("Device Creation");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v58;
  v71[2] = CFSTR("Program Creation");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v56;
  v71[3] = CFSTR("Device Destruction");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v70[4] = v54;
  v71[4] = CFSTR("Program Destruction");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v70[5] = v52;
  v71[5] = CFSTR("Program Prepare");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v70[6] = v50;
  v71[6] = CFSTR("Program Stop");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 7);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v70[7] = v48;
  v71[7] = CFSTR("Request Begin");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v70[8] = v46;
  v71[8] = CFSTR("Request Completed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v70[9] = v44;
  v71[9] = CFSTR("Request Cancelled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v70[10] = v42;
  v71[10] = CFSTR("Request Event");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 11);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v70[11] = v40;
  v71[11] = CFSTR("Request Timeout");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 12);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v70[12] = v38;
  v71[12] = CFSTR("Timeout");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v70[13] = v2;
  v71[13] = CFSTR("Event");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v70[14] = v3;
  v71[14] = CFSTR("Resource Availability");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v70[15] = v4;
  v71[15] = CFSTR("Crashed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v70[16] = v5;
  v71[16] = CFSTR("Device Sleep");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v70[17] = v6;
  v71[17] = CFSTR("Device Wakeup");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = CFSTR("MetricType");
  v73[0] = v7;
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v9, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("statusType"), CFSTR("ANE"), CFSTR("ANEStatus"), 7, v10, v11, 1.0, 0x200000002, 0x100000001, 0x300000002, 0x100000001, v64);

  v68[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v61;
  v67[0] = CFSTR("Success");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v59;
  v67[1] = CFSTR("No Memory");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v57;
  v67[2] = CFSTR("Bad Argument");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v55;
  v67[3] = CFSTR("Not Supported");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v53;
  v67[4] = CFSTR("Not Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v66[5] = v51;
  v67[5] = CFSTR("No Resources");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v66[6] = v49;
  v67[6] = CFSTR("Device Controller Creation Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 7);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v66[7] = v47;
  v67[7] = CFSTR("Device Controller Not Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66[8] = v45;
  v67[8] = CFSTR("Device Not Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v66[9] = v43;
  v67[9] = CFSTR("Device Open Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v66[10] = v41;
  v67[10] = CFSTR("Device PowerOn Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v66[11] = v39;
  v67[11] = CFSTR("Program Not Prepared");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v66[12] = v37;
  v67[12] = CFSTR("Dylib Not Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 13);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v66[13] = v36;
  v67[13] = CFSTR("Function Not Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 14);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v66[14] = v35;
  v67[14] = CFSTR("Program Not Found");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 15);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v66[15] = v34;
  v67[15] = CFSTR("Timeout");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 16);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v66[16] = v33;
  v67[16] = CFSTR("Hardware Failure");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 17);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v66[17] = v32;
  v67[17] = CFSTR("Firmware Failure");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 18);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v66[18] = v31;
  v67[18] = CFSTR("Error");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v66[19] = v30;
  v67[19] = CFSTR("Bad Program");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v66[20] = v29;
  v67[20] = CFSTR("Not Privileged");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v66[21] = v28;
  v67[21] = CFSTR("Request Failed");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v66[22] = v27;
  v67[22] = CFSTR("Not Ready");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v66[23] = v12;
  v67[23] = CFSTR("Not Permitted");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v66[24] = v13;
  v67[24] = CFSTR("Unsupported");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v66[25] = v14;
  v67[25] = CFSTR("Higher Priority Request Present");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v66[26] = v15;
  v67[26] = CFSTR("Failed To Allocate Shared Intermediate Buffer");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v66[27] = v16;
  v67[27] = CFSTR("Failed To Lock Shared Intermediate Buffer");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v66[28] = v17;
  v67[28] = CFSTR("Iso Too Old");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v66[29] = v18;
  v67[29] = CFSTR("Smaller IOBuffers Than Expected");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v19;
  v68[1] = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v22, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("returnType"), 7, v23, v63, v21, 1.0);

  v65[0] = v63;
  v65[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

@end
