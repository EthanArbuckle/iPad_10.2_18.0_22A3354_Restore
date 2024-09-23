@implementation PPSSensorsMetrics

+ (id)subsystem
{
  return CFSTR("Sensors");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sensorUsageMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (id)sensorUsageMetrics
{
  void *v2;
  PPSMetric *v3;
  void *v4;
  void *v5;
  void *v6;
  PPSMetric *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PPSMetric *v17;
  void *v18;
  void *v19;
  PPSMetric *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PPSMetric *v27;
  void *v28;
  PPSMetric *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PPSMetric *v40;
  PPSMetric *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[13];
  _QWORD v50[13];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  const __CFString *v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v55 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v3, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("ProcessName"), CFSTR("Sensors"), CFSTR("SensorUsage"), 3, v4, v5, 1.0, 0x200000003, 0x100000001, 0x300000001, 0x100000001, v43);

  v53[1] = CFSTR("MetricType");
  v54[0] = &unk_2514284E8;
  v53[0] = CFSTR("GroupingDimensions");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [PPSMetric alloc];
  +[PPSUnit microseconds](PPSUnit, "microseconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v7, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("ReportInterval"), 7, v8, v40, v42, 1.0);

  v51[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v39;
  v50[0] = CFSTR("Motion");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v38;
  v50[1] = CFSTR("Accelerometer");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v37;
  v50[2] = CFSTR("Gyro");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v36;
  v50[3] = CFSTR("Compass");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 27);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v35;
  v50[4] = CFSTR("Rose");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v34;
  v50[5] = CFSTR("Accelerometer2");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 86);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v33;
  v50[6] = CFSTR("IMU");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 90);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v32;
  v50[7] = CFSTR("Magnetometer_mT");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v9;
  v50[8] = CFSTR("DeviceMotion");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v10;
  v50[9] = CFSTR("DeviceMotion6");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v11;
  v50[10] = CFSTR("DeviceMotion3");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v12;
  v50[11] = CFSTR("DeviceMotion10");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 49);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49[12] = v13;
  v50[12] = CFSTR("AtmosphericPressure");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = CFSTR("MetricType");
  v52[0] = v14;
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)v16;
  v20 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("Usage"), 7, v18, v40, v16, 1.0);

  v47[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 65280);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v21;
  v46[0] = CFSTR("AppleVendor");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 65292);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v22;
  v46[1] = CFSTR("AppleVendorMotion");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v23;
  v46[2] = CFSTR("Sensor");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = CFSTR("MetricType");
  v48[0] = v24;
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v27, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("UsagePage"), 7, v28, v40, v26, 1.0);

  v44[0] = v40;
  v44[1] = v41;
  v44[2] = v20;
  v44[3] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

@end
