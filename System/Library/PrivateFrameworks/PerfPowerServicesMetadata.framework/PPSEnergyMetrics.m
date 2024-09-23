@implementation PPSEnergyMetrics

+ (id)subsystem
{
  return CFSTR("EnergyMetrics");
}

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "energyAccountingMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "cleanEnergyChargingMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  return v2;
}

+ (id)energyAccountingMetrics
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
  PPSUnit *v14;
  PPSMetric *v15;
  PPSMetric *v16;
  PPSMetric *v17;
  void *v18;
  PPSMetric *v19;
  void *v20;
  PPSMetric *v22;
  void *v23;
  PPSMetric *v24;
  PPSMetric *v25;
  PPSMetric *v26;
  _QWORD v27[10];

  v27[8] = *MEMORY[0x24BDAC8D0];
  v2 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v2, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("slot_id"), CFSTR("EnergyMetrics"), CFSTR("EnergyAccounting"), 7, v3, v4, 2.0, 0x300000004, 0x100000007, 0x300000001, 0x100000001, 0);

  v6 = [PPSMetric alloc];
  +[PPSUnit microWattHours](PPSUnit, "microWattHours");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v6, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("wall_energy_consumed"), 8, v7, v5, 0, 2.0);

  v8 = [PPSMetric alloc];
  +[PPSUnit microWattHours](PPSUnit, "microWattHours");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("system_energy_consumed"), 8, v9, v5, 0, 2.0);

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v10, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("adapter_family"), 7, v11, v5, 0, 2.0);

  v12 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v12, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("balancing_authority_id"), 3, v13, v5, 0, 2.0);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18A0]), "initWithSymbol:", CFSTR("g/kWh"));
  v14 = -[PPSUnit initWithUnit:]([PPSUnit alloc], "initWithUnit:", v23);
  v15 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]([PPSMetric alloc], "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("avg_intensity"), 8, v14, v5, 0, 2.0);
  v16 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]([PPSMetric alloc], "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("marginal_intensity"), 8, v14, v5, 0, 2.0);
  v17 = [PPSMetric alloc];
  +[PPSUnit grams](PPSUnit, "grams");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v17, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("carbon_footprint"), 8, v18, v5, 0, 2.0);

  v27[0] = v5;
  v27[1] = v26;
  v27[2] = v25;
  v27[3] = v24;
  v27[4] = v22;
  v27[5] = v15;
  v27[6] = v16;
  v27[7] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)cleanEnergyChargingMetrics
{
  PPSCadence *v2;
  void *v3;
  PPSCadence *v4;
  PPSMetric *v5;
  void *v6;
  PPSMetric *v7;
  PPSMetric *v8;
  void *v9;
  PPSMetric *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PPSMetric *v18;
  void *v19;
  PPSMetric *v20;
  void *v21;
  PPSCadenceTuple *v23;
  _QWORD v24[3];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v23 = -[PPSCadenceTuple initWithCadenceType:value:]([PPSCadenceTuple alloc], "initWithCadenceType:value:", 3, 11);
  v2 = [PPSCadence alloc];
  v29[0] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PPSCadence initWithCadenceTuples:](v2, "initWithCadenceTuples:", v3);

  v5 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v5, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("status"), CFSTR("EnergyMetrics"), CFSTR("CleanEnergyCharging"), 7, v6, v4, 1.0, 0x300000003, 0x100000007, 0x300000001, 0x100000001, 0);

  v8 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v8, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("isPaused"), 5, v9, v7, 0, 1.0);

  v27[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v26[0] = CFSTR("Disabled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v12;
  v26[1] = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v13;
  v26[2] = CFSTR("EnabledChargingOverride");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v14;
  v26[3] = CFSTR("TemporarilyDisabled");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v27[1] = CFSTR("MetricType");
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v18, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("cecState"), 7, v19, v7, v17, 1.0);

  v24[0] = v7;
  v24[1] = v10;
  v24[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
