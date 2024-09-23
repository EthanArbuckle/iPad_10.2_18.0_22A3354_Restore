@implementation WOMockWorkout

+ (id)defaultTriathlon
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -7200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4118], "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:statistics:goalType:goal:device:metadata:", 82, v3, v2, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 0, 0.0, 0, 0, 0, MEMORY[0x24BDBD1B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultOutdoorRunWithGoalType:(unint64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
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
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
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
  void *v63;
  _QWORD v65[10];
  _QWORD v66[12];

  v66[10] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -1800.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = (void *)MEMORY[0x24BDD4150];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v4, 300.0);
  generateSplitMetadata(1, 0, 1000.0, 300.0, 1000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workoutEventWithType:dateInterval:metadata:", 7, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v5;
  objc_msgSend(v5, "addObject:", v9);

  v10 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "quantityWithUnit:doubleValue:", v11, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD4150];
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v4, 482.8);
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v12;
  objc_msgSend(v12, "doubleValueForUnit:", v15);
  v17 = v16;
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValueForUnit:", v18);
  generateSplitMetadata(0, 0, v17, 482.8, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "workoutEventWithType:dateInterval:metadata:", 7, v14, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v21);

  v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = *MEMORY[0x24BDD3560];
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  addSimpleSumStats(v22, v23, v4, v3, v24, 5080.0);

  v25 = *MEMORY[0x24BDD3340];
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v4;
  v61 = v22;
  v59 = v3;
  addSimpleSumStats(v22, v25, v4, v3, v26, 257.0);

  v27 = *MEMORY[0x24BDD3388];
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  addSimpleSumStats(v22, v27, v4, v3, v28, 50.0);

  v65[0] = *MEMORY[0x24BDD4460];
  v29 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "_countPerMinuteUnit");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "quantityWithUnit:doubleValue:", v58, 162.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v57;
  v65[1] = *MEMORY[0x24BE378F8];
  v30 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "_countPerMinuteUnit");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "quantityWithUnit:doubleValue:", v56, 121.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v55;
  v65[2] = *MEMORY[0x24BE37918];
  v31 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "_countPerMinuteUnit");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "quantityWithUnit:doubleValue:", v54, 104.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v53;
  v65[3] = *MEMORY[0x24BE37908];
  v32 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "_countPerMinuteUnit");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "quantityWithUnit:doubleValue:", v52, 136.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v51;
  v65[4] = *MEMORY[0x24BE37910];
  v33 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "quantityWithUnit:doubleValue:", v34, 300.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v35;
  v65[5] = *MEMORY[0x24BE37900];
  v36 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "quantityWithUnit:doubleValue:", v37, 900.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *MEMORY[0x24BDD4478];
  v66[5] = v38;
  v66[6] = MEMORY[0x24BDBD1C8];
  v40 = *MEMORY[0x24BDD4458];
  v65[6] = v39;
  v65[7] = v40;
  v66[7] = &unk_251C04FD0;
  v65[8] = *MEMORY[0x24BDD3240];
  v41 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "degreeFahrenheitUnit");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "quantityWithUnit:doubleValue:", v42, 66.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v66[8] = v43;
  v65[9] = *MEMORY[0x24BDD3238];
  v44 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "percentUnit");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "quantityWithUnit:doubleValue:", v45, 61.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v66[9] = v46;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 10);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  +[WOMockWorkout defaultGoalValueForGoalType:](WOMockWorkout, "defaultGoalValueForGoalType:", a3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4118], "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:statistics:goalType:goal:device:metadata:", 37, v60, v59, v62, MEMORY[0x24BDBD1A8], v61, 0.0, a3, v48, 0, v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

+ (id)defaultOutdoorRowingWithGoalType:(unint64_t)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  _QWORD v62[7];
  _QWORD v63[9];

  v63[7] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "dateByAddingTimeInterval:", -1800.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = (void *)MEMORY[0x24BDD4150];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v3, 300.0);
  generateSplitMetadata(1, 0, 1000.0, 390.4, 1000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workoutEventWithType:dateInterval:metadata:", 7, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  v9 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quantityWithUnit:doubleValue:", v10, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD4150];
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v3, 482.8);
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v11;
  objc_msgSend(v11, "doubleValueForUnit:", v14);
  v16 = v15;
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValueForUnit:", v17);
  generateSplitMetadata(0, 0, v16, 482.8, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "workoutEventWithType:dateInterval:metadata:", 7, v13, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v20);

  v21 = (void *)MEMORY[0x24BDD4150];
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v3, 482.8);
  generateSplitMetadata(0, 1, 500.0, 192.8, 500.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "workoutEventWithType:dateInterval:metadata:", 7, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v4;
  objc_msgSend(v4, "addObject:", v24);

  v25 = (void *)MEMORY[0x24BDD4150];
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v3, 482.8);
  generateSplitMetadata(0, 1, 500.0, 197.6, 500.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "workoutEventWithType:dateInterval:metadata:", 7, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v28);

  v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v30 = *MEMORY[0x24BDD3548];
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  addSimpleSumStats(v29, v30, v3, v61, v31, 5080.0);

  v32 = *MEMORY[0x24BDD3340];
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v3;
  addSimpleSumStats(v29, v32, v3, v61, v33, 257.0);

  v34 = *MEMORY[0x24BDD3388];
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  addSimpleSumStats(v29, v34, v3, v61, v35, 50.0);

  v62[0] = *MEMORY[0x24BE378F8];
  v36 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "_countPerMinuteUnit");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "quantityWithUnit:doubleValue:", v56, 121.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v55;
  v62[1] = *MEMORY[0x24BE37918];
  v37 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "_countPerMinuteUnit");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "quantityWithUnit:doubleValue:", v38, 104.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v39;
  v62[2] = *MEMORY[0x24BE37908];
  v40 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "_countPerMinuteUnit");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "quantityWithUnit:doubleValue:", v41, 136.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *MEMORY[0x24BDD4478];
  v63[2] = v42;
  v63[3] = MEMORY[0x24BDBD1C8];
  v44 = *MEMORY[0x24BDD4458];
  v62[3] = v43;
  v62[4] = v44;
  v63[4] = &unk_251C04FD0;
  v62[5] = *MEMORY[0x24BDD3240];
  v45 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "degreeFahrenheitUnit");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "quantityWithUnit:doubleValue:", v46, 66.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v63[5] = v47;
  v62[6] = *MEMORY[0x24BDD3238];
  v48 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "percentUnit");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "quantityWithUnit:doubleValue:", v49, 61.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v63[6] = v50;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 7);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  +[WOMockWorkout defaultGoalValueForGoalType:](WOMockWorkout, "defaultGoalValueForGoalType:", a3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4118], "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:statistics:goalType:goal:device:metadata:", 35, v57, v61, v58, MEMORY[0x24BDBD1A8], v29, 0.0, a3, v52, 0, v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

+ (id)defaultGoalValueForGoalType:(unint64_t)a3
{
  void *v3;
  void *v4;
  double v5;
  void *v6;

  switch(a3)
  {
    case 3uLL:
      v3 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "largeCalorieUnit");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 300.0;
      break;
    case 2uLL:
      v3 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 3600.0;
      break;
    case 1uLL:
      v3 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 5000.0;
      break;
    default:
      v6 = 0;
      return v6;
  }
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
