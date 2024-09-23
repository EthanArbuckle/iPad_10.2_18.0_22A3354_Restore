@implementation PRDataRecorder

+ (id)generateFilename
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("dd-MM-yyyy-HH-mm-ss"));
  objc_msgSend(v3, "stringFromDate:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)generateTemporaryDirectoryURL
{
  void *v2;
  void *v3;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 9, 1, 0, 1, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PRDataRecorder)init
{
  PRDataRecorder *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PRDataRecorder;
  v2 = -[PRDataRecorder init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRDataRecorder setMeasurements:](v2, "setMeasurements:", v3);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRDataRecorder setEstimatorInput:](v2, "setEstimatorInput:", v4);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRDataRecorder setEstimatorOutput:](v2, "setEstimatorOutput:", v5);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRDataRecorder setRangeEstimatorOutput:](v2, "setRangeEstimatorOutput:", v6);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRDataRecorder setCustomData:](v2, "setCustomData:", v7);

  }
  return v2;
}

- (void)discardSensorData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PRDataRecorder measurements](self, "measurements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PRDataRecorder estimatorInput](self, "estimatorInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[PRDataRecorder estimatorOutput](self, "estimatorOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[PRDataRecorder rangeEstimatorOutput](self, "rangeEstimatorOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[PRDataRecorder customData](self, "customData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

- (void)recordProximityMeasurement:(id)a3
{
  void *v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v18[0] = CFSTR("proximity");
  v17[0] = CFSTR("type");
  v17[1] = CFSTR("range");
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v5, "range_m");
  *(float *)&v6 = v6;
  objc_msgSend(v4, "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v7;
  v17[2] = CFSTR("rangeUncertainty");
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "range_unc_m");
  *(float *)&v9 = v9;
  objc_msgSend(v8, "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  v17[3] = CFSTR("time");
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "mach_absolute_time_sec");
  v13 = v12;

  objc_msgSend(v11, "numberWithDouble:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRDataRecorder measurements](self, "measurements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v15);

}

- (void)recordPoseMeasurement:(id)a3
{
  id v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v17[4];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "pose");
  v17[0] = v5;
  v17[1] = v6;
  v17[2] = v7;
  v17[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v17, 64);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("pose");
  v18[0] = CFSTR("type");
  v18[1] = CFSTR("data");
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  v18[2] = CFSTR("time");
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "timestamp");
  v13 = v12;

  objc_msgSend(v11, "numberWithDouble:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRDataRecorder measurements](self, "measurements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v15);

}

- (void)recordEstimatorInput:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  int v11;
  double v12;
  void *v13;
  int v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
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
  _QWORD v48[3];
  _QWORD v49[4];
  _QWORD v50[8];
  _QWORD v51[10];

  v51[8] = *MEMORY[0x24BDAC8D0];
  v50[0] = CFSTR("time");
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a3;
  objc_msgSend(v4, "timestamp");
  objc_msgSend(v3, "numberWithDouble:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v46;
  v50[1] = CFSTR("prior_time");
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "priorTimestamp");
  objc_msgSend(v5, "numberWithDouble:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v45;
  v50[2] = CFSTR("subsequent_time");
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "subsequentTimestamp");
  objc_msgSend(v6, "numberWithDouble:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v44;
  v50[3] = CFSTR("quat");
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "rotation");
  objc_msgSend(v7, "numberWithFloat:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v43;
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "rotation");
  LODWORD(v9) = HIDWORD(v9);
  objc_msgSend(v8, "numberWithFloat:", v9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v42;
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "rotation");
  LODWORD(v12) = v11;
  objc_msgSend(v10, "numberWithFloat:", v12);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v41;
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "rotation");
  LODWORD(v15) = v14;
  objc_msgSend(v13, "numberWithFloat:", v15);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v39;
  v50[4] = CFSTR("trans");
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "translation");
  objc_msgSend(v16, "numberWithFloat:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v38;
  v17 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "translation");
  LODWORD(v18) = HIDWORD(v18);
  objc_msgSend(v17, "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v19;
  v20 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "translation");
  LODWORD(v22) = v21;
  objc_msgSend(v20, "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v24;
  v50[5] = CFSTR("range");
  v25 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "proximity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "range_m");
  *(float *)&v27 = v27;
  objc_msgSend(v25, "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v28;
  v50[6] = CFSTR("rangeUncertainty");
  v29 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "proximity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "range_unc_m");
  *(float *)&v31 = v31;
  objc_msgSend(v29, "numberWithFloat:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v32;
  v50[7] = CFSTR("antenna");
  v33 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "proximity");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "numberWithInteger:", objc_msgSend(v34, "antenna_type"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRDataRecorder estimatorInput](self, "estimatorInput");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v36);

}

- (void)recordTargetEstimates:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  _QWORD v37[5];
  _QWORD v38[5];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v3;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v33;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v4);
        v37[0] = CFSTR("target");
        v6 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "vector");
        objc_msgSend(v6, "numberWithFloat:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v7;
        v8 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "vector");
        LODWORD(v9) = HIDWORD(v9);
        objc_msgSend(v8, "numberWithFloat:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v10;
        v11 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "vector");
        LODWORD(v13) = v12;
        objc_msgSend(v11, "numberWithFloat:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v36[2] = v14;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v15;
        v37[1] = CFSTR("uncertainty");
        v16 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "uncertainty");
        objc_msgSend(v16, "numberWithDouble:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v18;
        v37[2] = CFSTR("weight");
        v19 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "weight");
        objc_msgSend(v19, "numberWithDouble:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v38[2] = v21;
        v37[3] = CFSTR("time");
        v22 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "timestamp");
        objc_msgSend(v22, "numberWithDouble:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v38[3] = v23;
        v37[4] = CFSTR("verticalState");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v5, "verticalState"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v38[4] = v24;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "addObject:", v25);
        ++v4;
      }
      while (v31 != v4);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v31);
  }

  -[PRDataRecorder estimatorOutput](self, "estimatorOutput");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v30);

}

- (void)recordRangeEstimate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("range");
  v13[0] = CFSTR("type");
  v13[1] = CFSTR("range");
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v5, "range");
  objc_msgSend(v4, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("time");
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRDataRecorder rangeEstimatorOutput](self, "rangeEstimatorOutput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v11);

}

- (void)recordTargetMovingStateChanged:(BOOL)a3 atTime:(double)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v4 = a3;
  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("time");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("moving");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRDataRecorder estimatorInput](self, "estimatorInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

}

- (void)recordCustomData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PRDataRecorder customData](self, "customData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)writeSensorDataToURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (objc_class *)MEMORY[0x24BDBCF08];
  v5 = a3;
  v12 = (id)objc_msgSend([v4 alloc], "initWithURL:append:", v5, 0);

  objc_msgSend(v12, "open");
  -[PRDataRecorder customData](self, "customData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[PRDataRecorder measurements](self, "measurements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("measurements"));

  -[PRDataRecorder estimatorInput](self, "estimatorInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("estimator_input"));

  -[PRDataRecorder estimatorOutput](self, "estimatorOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("estimator_output"));

  -[PRDataRecorder rangeEstimatorOutput](self, "rangeEstimatorOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("range_estimator_output"));

  objc_msgSend(MEMORY[0x24BDD1608], "writeJSONObject:toStream:options:error:", v7, v12, 1, 0);
  objc_msgSend(v12, "close");

}

- (id)stopAndSave
{
  void *v3;

  -[PRDataRecorder writeToURL](self, "writeToURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRDataRecorder stopAndDiscard](self, "stopAndDiscard");
  return v3;
}

- (id)writeToURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[PRDataRecorder generateFilename](PRDataRecorder, "generateFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRDataRecorder generateTemporaryDirectoryURL](PRDataRecorder, "generateTemporaryDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.json"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRDataRecorder writeSensorDataToURL:](self, "writeSensorDataToURL:", v6);

  objc_msgSend(v4, "URLByAppendingPathComponent:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSMutableArray)measurements
{
  return self->_measurements;
}

- (void)setMeasurements:(id)a3
{
  objc_storeStrong((id *)&self->_measurements, a3);
}

- (NSMutableArray)estimatorInput
{
  return self->_estimatorInput;
}

- (void)setEstimatorInput:(id)a3
{
  objc_storeStrong((id *)&self->_estimatorInput, a3);
}

- (NSMutableArray)estimatorOutput
{
  return self->_estimatorOutput;
}

- (void)setEstimatorOutput:(id)a3
{
  objc_storeStrong((id *)&self->_estimatorOutput, a3);
}

- (NSMutableArray)rangeEstimatorOutput
{
  return self->_rangeEstimatorOutput;
}

- (void)setRangeEstimatorOutput:(id)a3
{
  objc_storeStrong((id *)&self->_rangeEstimatorOutput, a3);
}

- (NSMutableDictionary)customData
{
  return self->_customData;
}

- (void)setCustomData:(id)a3
{
  objc_storeStrong((id *)&self->_customData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_rangeEstimatorOutput, 0);
  objc_storeStrong((id *)&self->_estimatorOutput, 0);
  objc_storeStrong((id *)&self->_estimatorInput, 0);
  objc_storeStrong((id *)&self->_measurements, 0);
}

@end
