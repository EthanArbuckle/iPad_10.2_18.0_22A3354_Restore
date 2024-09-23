@implementation HomeEnergyMetrics

+ (id)allDeclMetrics
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "homeAppUIInteractionsMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend((id)objc_opt_class(), "cleanEnergyForecastMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  return v2;
}

+ (id)cleanEnergyForecastMetrics
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
  uint64_t v11;
  PPSMetric *v12;
  void *v13;
  void *v14;
  void *v15;
  PPSMetric *v16;
  void *v17;
  void *v18;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  const __CFString *v36;
  void *v37;
  _QWORD v38[12];
  _QWORD v39[12];
  _QWORD v40[3];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x24BDAC8D0];
  v40[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v34;
  v39[0] = CFSTR("Idle");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v33;
  v39[1] = CFSTR("GettingLocation");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v32;
  v39[2] = CFSTR("GettingGridID");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v31;
  v39[3] = CFSTR("GettingEnergyWindows");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v30;
  v39[4] = CFSTR("NoLocation");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v2;
  v39[5] = CFSTR("NoGridID");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v3;
  v39[6] = CFSTR("FailedGridID");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v4;
  v39[7] = CFSTR("NoEnergyWindows");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v5;
  v39[8] = CFSTR("FailedEnergyWindows");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[9] = v6;
  v39[9] = CFSTR("HomeNotFound");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[10] = v7;
  v39[10] = CFSTR("NoHomePermission");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[11] = v8;
  v39[11] = CFSTR("OtherError");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v9;
  v41[1] = &unk_251428470;
  v40[1] = CFSTR("GroupingDimensions");
  v40[2] = CFSTR("MetricType");
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)v11;
  v16 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v12, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("state"), CFSTR("HomeEnergy"), CFSTR("CleanEnergyForecast"), 7, v13, v14, 1.0, 0x300000003, 0x100000001, 0x300000001, 0x100000001, v11);

  v36 = CFSTR("MetricType");
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v19, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("gridID"), 3, v20, v16, v18, 1.0);

  v22 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v22, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("windowStart"), 7, v23, v16, 0, 1.0);

  v25 = [PPSMetric alloc];
  +[PPSUnit seconds](PPSUnit, "seconds");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v25, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("windowEnd"), 7, v26, v16, 0, 1.0);

  v35[0] = v16;
  v35[1] = v21;
  v35[2] = v24;
  v35[3] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)homeAppUIInteractionsMetrics
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PPSMetric *v21;
  void *v22;
  PPSMetric *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[15];
  _QWORD v42[15];
  _QWORD v43[2];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v43[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v35;
  v42[0] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v34;
  v42[1] = CFSTR("EnergyDashboardVisit");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v33;
  v42[2] = CFSTR("GridForecastOnboardingVisit");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v32;
  v42[3] = CFSTR("EnergyCategoryStatusItemTapped");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v31;
  v42[4] = CFSTR("EnergyCategoryViewDuration");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[5] = v30;
  v42[5] = CFSTR("EnergyEducationTipVisit");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[6] = v29;
  v42[6] = CFSTR("EnergyModelInformationSheetVisit");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[7] = v28;
  v42[7] = CFSTR("EnergyModelInformationSheetViewDuration");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41[8] = v27;
  v42[8] = CFSTR("EnergyIndicatorAccessoryViewVisit");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v41[9] = v2;
  v42[9] = CFSTR("DashboardSinglePaneView");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41[10] = v3;
  v42[10] = CFSTR("DashboardDualPaneView");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41[11] = v4;
  v42[11] = CFSTR("EnergyWidgetAndComplicationSettings");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41[12] = v5;
  v42[12] = CFSTR("EnergyCategoryStatusItemVisit");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[13] = v6;
  v42[13] = CFSTR("EnergyCategoryViewAccessedFromURL");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[14] = v7;
  v42[14] = CFSTR("EnergyIndicatorAccessoryViewTapped");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = CFSTR("MetricType");
  v44[0] = v8;
  +[PPSMetricType genericDimension](PPSMetricType, "genericDimension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSCadence cadenceEventXPCWithFrequency:](PPSCadence, "cadenceEventXPCWithFrequency:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:](v10, "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:", CFSTR("eventType"), CFSTR("HomeEnergy"), CFSTR("HomeAppUIInteractions"), 7, v11, v12, 4.0, 0x300000003, 0x100000001, 0x300000001, 0x100000001, v26);

  v39[0] = CFSTR("EnumMapping");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v14;
  v38[0] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v15;
  v38[1] = CFSTR("Appear");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v16;
  v38[2] = CFSTR("Disappear");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v17;
  v38[3] = CFSTR("ViewAccessedFromURL");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = CFSTR("MetricType");
  v40[0] = v18;
  +[PPSMetricType stateDimension](PPSMetricType, "stateDimension");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = [PPSMetric alloc];
  +[PPSUnit dimensionless](PPSUnit, "dimensionless");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:](v21, "initWithName:version:datatype:unit:baseMetric:optionalPayload:", CFSTR("state"), 7, v22, v13, v20, 4.0);

  v36[0] = v13;
  v36[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)subsystem
{
  return CFSTR("HomeEnergy");
}

@end
