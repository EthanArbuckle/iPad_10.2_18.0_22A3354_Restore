@implementation AXPhoenixClassifierConfiguration

- (AXPhoenixClassifierConfiguration)init
{
  AXPhoenixClassifierConfiguration *v3;
  objc_super v4;
  SEL v5;
  AXPhoenixClassifierConfiguration *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)AXPhoenixClassifierConfiguration;
  v6 = -[AXPhoenixClassifierConfiguration init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    -[AXPhoenixClassifierConfiguration _initializeKeys](v6, "_initializeKeys");
    -[AXPhoenixClassifierConfiguration _setDefaultConfiguration](v6, "_setDefaultConfiguration");
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (AXPhoenixClassifierConfiguration)initWithDictionary:(id)a3 missingKeys:(id)a4
{
  AXPhoenixClassifierConfiguration *v4;
  AXPhoenixClassifierConfiguration *v6;
  objc_super v8;
  id v9;
  id location[2];
  AXPhoenixClassifierConfiguration *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AXPhoenixClassifierConfiguration;
  v11 = -[AXPhoenixClassifierConfiguration init](&v8, sel_init);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    -[AXPhoenixClassifierConfiguration _initializeKeys](v11, "_initializeKeys");
    -[AXPhoenixClassifierConfiguration _parseFromDictionary:missingKeys:](v11, "_parseFromDictionary:missingKeys:", location[0], v9);
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (void)_initializeKeys
{
  -[AXPhoenixClassifierConfiguration setDataKey:](self, "setDataKey:", CFSTR("data"));
  -[AXPhoenixClassifierConfiguration setAccelerometerSampleRateInHzKey:](self, "setAccelerometerSampleRateInHzKey:", CFSTR("accelerometerSampleRateInHz"));
  -[AXPhoenixClassifierConfiguration setMaxAccelerationBufferSizeKey:](self, "setMaxAccelerationBufferSizeKey:", CFSTR("maxAccelerationBufferSize"));
  -[AXPhoenixClassifierConfiguration setPolicyKey:](self, "setPolicyKey:", CFSTR("policy"));
  -[AXPhoenixClassifierConfiguration setPredictionConfidenceThresholdKey:](self, "setPredictionConfidenceThresholdKey:", CFSTR("predictionConfidenceThreshold"));
  -[AXPhoenixClassifierConfiguration setMinDurationBetweenTriggersInSecondsKey:](self, "setMinDurationBetweenTriggersInSecondsKey:", CFSTR("minDurationBetweenTriggersInSeconds"));
  -[AXPhoenixClassifierConfiguration setMaxPredictionBufferSizeKey:](self, "setMaxPredictionBufferSizeKey:", CFSTR("maxPredictionBufferSize"));
  -[AXPhoenixClassifierConfiguration setModelPredictionRateInHzKey:](self, "setModelPredictionRateInHzKey:", CFSTR("modelPredictionRateInHz"));
  -[AXPhoenixClassifierConfiguration setPredictionCountThresholdsKey:](self, "setPredictionCountThresholdsKey:", CFSTR("predictionCountThresholds"));
  -[AXPhoenixClassifierConfiguration setDoubleTapPolicyKey:](self, "setDoubleTapPolicyKey:", CFSTR("doubleTapPolicy"));
  -[AXPhoenixClassifierConfiguration setTripleTapPolicyKey:](self, "setTripleTapPolicyKey:", CFSTR("tripleTapPolicy"));
  -[AXPhoenixClassifierConfiguration setGeneralPolicyKey:](self, "setGeneralPolicyKey:", CFSTR("generalPolicy"));
  -[AXPhoenixClassifierConfiguration setPredictionClassNoneKey:](self, "setPredictionClassNoneKey:", CFSTR("none"));
  -[AXPhoenixClassifierConfiguration setPredictionClassDoubleTapKey:](self, "setPredictionClassDoubleTapKey:", CFSTR("doubleTap"));
  -[AXPhoenixClassifierConfiguration setPredictionClassTripleTapKey:](self, "setPredictionClassTripleTapKey:", CFSTR("tripleTap"));
}

- (void)_setDefaultConfiguration
{
  id v2;
  id v3;
  id v4[2];
  AXPhoenixClassifierConfiguration *v5;

  v5 = self;
  v4[1] = (id)a2;
  -[AXPhoenixClassifierConfiguration setAccelerometerSampleRateInHz:](self, "setAccelerometerSampleRateInHz:", 100);
  -[AXPhoenixClassifierConfiguration setMaxAccelerationBufferSize:](v5, "setMaxAccelerationBufferSize:", 250);
  v4[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  objc_msgSend(v4[0], "setObject:atIndexedSubscript:");
  objc_msgSend(v4[0], "setObject:atIndexedSubscript:", &unk_24F1967A0);
  objc_msgSend(v4[0], "setObject:atIndexedSubscript:");
  -[AXPhoenixClassifierConfiguration setGeneralPolicyThresholds:](v5, "setGeneralPolicyThresholds:", v4[0]);
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  objc_msgSend(v3, "setObject:atIndexedSubscript:", &unk_24F196788, 0);
  objc_msgSend(v3, "setObject:atIndexedSubscript:", &unk_24F1967B8, 1);
  -[AXPhoenixClassifierConfiguration setDoubleTapPolicyThresholds:](v5, "setDoubleTapPolicyThresholds:", v3);
  v2 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  objc_msgSend(v2, "setObject:atIndexedSubscript:", &unk_24F196788, 0);
  objc_msgSend(v2, "setObject:atIndexedSubscript:", &unk_24F1967B8, 1);
  -[AXPhoenixClassifierConfiguration setTripleTapPolicyThresholds:](v5, "setTripleTapPolicyThresholds:", v2);
  -[AXPhoenixClassifierConfiguration setPredictionConfidenceThreshold:](v5, "setPredictionConfidenceThreshold:", 0.95);
  -[AXPhoenixClassifierConfiguration setMinDurationBetweenTriggersInSeconds:](v5, "setMinDurationBetweenTriggersInSeconds:", 2);
  -[AXPhoenixClassifierConfiguration setMaxPredictionBufferSize:](v5, "setMaxPredictionBufferSize:", 8);
  -[AXPhoenixClassifierConfiguration setModelPredictionRateInHz:](v5, "setModelPredictionRateInHz:", 10);
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
}

- (void)_parseFromDictionary:(id)a3 missingKeys:(id)a4
{
  id v4;
  NSString *v5;
  id v6;
  NSString *v7;
  id v8;
  NSString *v9;
  void *v10;
  id v11;
  id v12;
  NSString *v13;
  NSString *v14;
  id v15;
  id v16;
  NSString *v17;
  void *v18;
  id v19;
  id v20;
  NSString *v21;
  NSString *v22;
  id v23;
  id v24;
  NSString *v25;
  void *v26;
  id v27;
  id v28;
  NSString *v29;
  void *v30;
  NSArray *v31;
  NSString *v32;
  id v33;
  id v34;
  NSString *v35;
  id v36;
  NSString *v37;
  id v38;
  NSString *v39;
  void *v40;
  id v41;
  id v42;
  NSString *v43;
  NSString *v44;
  id v45;
  id v46;
  NSString *v47;
  void *v48;
  id v49;
  id v50;
  NSString *v51;
  void *v52;
  NSArray *v53;
  NSString *v54;
  id v55;
  id v56;
  NSString *v57;
  id v58;
  NSString *v59;
  id v60;
  NSString *v61;
  void *v62;
  id v63;
  id v64;
  NSString *v65;
  NSString *v66;
  id v67;
  id v68;
  NSString *v69;
  void *v70;
  id v71;
  id v72;
  NSString *v73;
  void *v74;
  NSArray *v75;
  NSString *v76;
  id v77;
  NSString *v78;
  NSString *v79;
  id v80;
  NSString *v81;
  AXPhoenixClassifierConfiguration *v82;
  id v83;
  NSString *v84;
  NSString *v85;
  id v86;
  id v87;
  NSString *v88;
  AXPhoenixClassifierConfiguration *v89;
  id v90;
  NSString *v91;
  NSString *v92;
  id v93;
  id v94;
  NSString *v95;
  AXPhoenixClassifierConfiguration *v96;
  id v97;
  NSString *v98;
  NSString *v99;
  id v100;
  id v101;
  NSString *v102;
  AXPhoenixClassifierConfiguration *v103;
  id v104;
  NSString *v105;
  NSString *v106;
  id v107;
  id v108;
  NSString *v109;
  id v110;
  NSString *v111;
  id v112;
  NSString *v113;
  AXPhoenixClassifierConfiguration *v114;
  id v115;
  NSString *v116;
  NSString *v117;
  id v118;
  id v119;
  NSString *v120;
  AXPhoenixClassifierConfiguration *v121;
  id v122;
  NSString *v123;
  NSString *v124;
  id v125;
  id v127;
  NSString *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id location[2];
  AXPhoenixClassifierConfiguration *v140;

  v140 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v138 = 0;
  objc_storeStrong(&v138, a4);
  v127 = location[0];
  v128 = -[AXPhoenixClassifierConfiguration dataKey](v140, "dataKey");
  v137 = (id)objc_msgSend(v127, "objectForKey:");

  if (v137)
  {
    v124 = -[AXPhoenixClassifierConfiguration accelerometerSampleRateInHzKey](v140, "accelerometerSampleRateInHzKey");
    v125 = (id)objc_msgSend(v137, "objectForKey:");

    if (v125)
    {
      v121 = v140;
      v123 = -[AXPhoenixClassifierConfiguration accelerometerSampleRateInHzKey](v140, "accelerometerSampleRateInHzKey");
      v122 = (id)objc_msgSend(v137, "objectForKey:");
      -[AXPhoenixClassifierConfiguration setAccelerometerSampleRateInHz:](v121, "setAccelerometerSampleRateInHz:", objc_msgSend(v122, "unsignedIntegerValue"));

    }
    else
    {
      v119 = v138;
      v120 = -[AXPhoenixClassifierConfiguration accelerometerSampleRateInHzKey](v140, "accelerometerSampleRateInHzKey");
      objc_msgSend(v119, "addObject:");

    }
    v117 = -[AXPhoenixClassifierConfiguration maxAccelerationBufferSizeKey](v140, "maxAccelerationBufferSizeKey");
    v118 = (id)objc_msgSend(v137, "objectForKey:");

    if (v118)
    {
      v114 = v140;
      v116 = -[AXPhoenixClassifierConfiguration maxAccelerationBufferSizeKey](v140, "maxAccelerationBufferSizeKey");
      v115 = (id)objc_msgSend(v137, "objectForKey:");
      -[AXPhoenixClassifierConfiguration setMaxAccelerationBufferSize:](v114, "setMaxAccelerationBufferSize:", objc_msgSend(v115, "unsignedIntegerValue"));

    }
    else
    {
      v112 = v138;
      v113 = -[AXPhoenixClassifierConfiguration maxAccelerationBufferSizeKey](v140, "maxAccelerationBufferSizeKey");
      objc_msgSend(v112, "addObject:");

    }
  }
  else
  {
    v110 = v138;
    v111 = -[AXPhoenixClassifierConfiguration dataKey](v140, "dataKey");
    objc_msgSend(v110, "addObject:");

  }
  v108 = location[0];
  v109 = -[AXPhoenixClassifierConfiguration policyKey](v140, "policyKey");
  v136 = (id)objc_msgSend(v108, "objectForKey:");

  if (v136)
  {
    v106 = -[AXPhoenixClassifierConfiguration modelPredictionRateInHzKey](v140, "modelPredictionRateInHzKey");
    v107 = (id)objc_msgSend(v136, "objectForKey:");

    if (v107)
    {
      v103 = v140;
      v105 = -[AXPhoenixClassifierConfiguration modelPredictionRateInHzKey](v140, "modelPredictionRateInHzKey");
      v104 = (id)objc_msgSend(v136, "objectForKey:");
      -[AXPhoenixClassifierConfiguration setModelPredictionRateInHz:](v103, "setModelPredictionRateInHz:", objc_msgSend(v104, "unsignedIntegerValue"));

    }
    else
    {
      v101 = v138;
      v102 = -[AXPhoenixClassifierConfiguration modelPredictionRateInHzKey](v140, "modelPredictionRateInHzKey");
      objc_msgSend(v101, "addObject:");

    }
    v99 = -[AXPhoenixClassifierConfiguration maxPredictionBufferSizeKey](v140, "maxPredictionBufferSizeKey");
    v100 = (id)objc_msgSend(v136, "objectForKey:");

    if (v100)
    {
      v96 = v140;
      v98 = -[AXPhoenixClassifierConfiguration maxPredictionBufferSizeKey](v140, "maxPredictionBufferSizeKey");
      v97 = (id)objc_msgSend(v136, "objectForKey:");
      -[AXPhoenixClassifierConfiguration setMaxPredictionBufferSize:](v96, "setMaxPredictionBufferSize:", objc_msgSend(v97, "unsignedIntegerValue"));

    }
    else
    {
      v94 = v138;
      v95 = -[AXPhoenixClassifierConfiguration maxPredictionBufferSizeKey](v140, "maxPredictionBufferSizeKey");
      objc_msgSend(v94, "addObject:");

    }
    v92 = -[AXPhoenixClassifierConfiguration minDurationBetweenTriggersInSecondsKey](v140, "minDurationBetweenTriggersInSecondsKey");
    v93 = (id)objc_msgSend(v136, "objectForKey:");

    if (v93)
    {
      v89 = v140;
      v91 = -[AXPhoenixClassifierConfiguration minDurationBetweenTriggersInSecondsKey](v140, "minDurationBetweenTriggersInSecondsKey");
      v90 = (id)objc_msgSend(v136, "objectForKey:");
      -[AXPhoenixClassifierConfiguration setMinDurationBetweenTriggersInSeconds:](v89, "setMinDurationBetweenTriggersInSeconds:", objc_msgSend(v90, "unsignedIntegerValue"));

    }
    else
    {
      v87 = v138;
      v88 = -[AXPhoenixClassifierConfiguration minDurationBetweenTriggersInSecondsKey](v140, "minDurationBetweenTriggersInSecondsKey");
      objc_msgSend(v87, "addObject:");

    }
    v85 = -[AXPhoenixClassifierConfiguration predictionConfidenceThresholdKey](v140, "predictionConfidenceThresholdKey");
    v86 = (id)objc_msgSend(v136, "objectForKey:");

    if (v86)
    {
      v82 = v140;
      v84 = -[AXPhoenixClassifierConfiguration predictionConfidenceThresholdKey](v140, "predictionConfidenceThresholdKey");
      v83 = (id)objc_msgSend(v136, "objectForKey:");
      objc_msgSend(v83, "doubleValue");
      -[AXPhoenixClassifierConfiguration setPredictionConfidenceThreshold:](v82, "setPredictionConfidenceThreshold:");

    }
    else
    {
      v80 = v138;
      v81 = -[AXPhoenixClassifierConfiguration predictionConfidenceThresholdKey](v140, "predictionConfidenceThresholdKey");
      objc_msgSend(v80, "addObject:");

    }
    v79 = -[AXPhoenixClassifierConfiguration predictionCountThresholdsKey](v140, "predictionCountThresholdsKey");
    v135 = (id)objc_msgSend(v136, "objectForKey:");

    if (v135)
    {
      v78 = -[AXPhoenixClassifierConfiguration doubleTapPolicyKey](v140, "doubleTapPolicyKey");
      v134 = (id)objc_msgSend(v135, "objectForKey:");

      if (v134)
      {
        v74 = (void *)MEMORY[0x24BDBCEB8];
        v75 = -[AXPhoenixClassifierConfiguration doubleTapPolicyThresholds](v140, "doubleTapPolicyThresholds");
        v133 = (id)objc_msgSend(v74, "arrayWithArray:");

        v76 = -[AXPhoenixClassifierConfiguration predictionClassNoneKey](v140, "predictionClassNoneKey");
        v77 = (id)objc_msgSend(v134, "objectForKey:");

        if (v77)
        {
          v70 = (void *)MEMORY[0x24BDD16E0];
          v73 = -[AXPhoenixClassifierConfiguration predictionClassNoneKey](v140, "predictionClassNoneKey");
          v72 = (id)objc_msgSend(v134, "objectForKey:");
          v71 = (id)objc_msgSend(v70, "numberWithUnsignedInteger:", objc_msgSend(v72, "unsignedIntegerValue"));
          objc_msgSend(v133, "setObject:atIndexedSubscript:");

        }
        else
        {
          v68 = v138;
          v69 = -[AXPhoenixClassifierConfiguration predictionClassNoneKey](v140, "predictionClassNoneKey");
          objc_msgSend(v68, "addObject:");

        }
        v66 = -[AXPhoenixClassifierConfiguration predictionClassDoubleTapKey](v140, "predictionClassDoubleTapKey");
        v67 = (id)objc_msgSend(v134, "objectForKey:");

        if (v67)
        {
          v62 = (void *)MEMORY[0x24BDD16E0];
          v65 = -[AXPhoenixClassifierConfiguration predictionClassDoubleTapKey](v140, "predictionClassDoubleTapKey");
          v64 = (id)objc_msgSend(v134, "objectForKey:");
          v63 = (id)objc_msgSend(v62, "numberWithUnsignedInteger:", objc_msgSend(v64, "unsignedIntegerValue"));
          objc_msgSend(v133, "setObject:atIndexedSubscript:");

        }
        else
        {
          v60 = v138;
          v61 = -[AXPhoenixClassifierConfiguration predictionClassDoubleTapKey](v140, "predictionClassDoubleTapKey");
          objc_msgSend(v60, "addObject:");

        }
        -[AXPhoenixClassifierConfiguration setDoubleTapPolicyThresholds:](v140, "setDoubleTapPolicyThresholds:", v133);
        objc_storeStrong(&v133, 0);
      }
      else
      {
        v58 = v138;
        v59 = -[AXPhoenixClassifierConfiguration doubleTapPolicyKey](v140, "doubleTapPolicyKey");
        objc_msgSend(v58, "addObject:");

      }
      v56 = v135;
      v57 = -[AXPhoenixClassifierConfiguration tripleTapPolicyKey](v140, "tripleTapPolicyKey");
      v132 = (id)objc_msgSend(v56, "objectForKey:");

      if (v132)
      {
        v52 = (void *)MEMORY[0x24BDBCEB8];
        v53 = -[AXPhoenixClassifierConfiguration tripleTapPolicyThresholds](v140, "tripleTapPolicyThresholds");
        v131 = (id)objc_msgSend(v52, "arrayWithArray:");

        v54 = -[AXPhoenixClassifierConfiguration predictionClassNoneKey](v140, "predictionClassNoneKey");
        v55 = (id)objc_msgSend(v132, "objectForKey:");

        if (v55)
        {
          v48 = (void *)MEMORY[0x24BDD16E0];
          v51 = -[AXPhoenixClassifierConfiguration predictionClassNoneKey](v140, "predictionClassNoneKey");
          v50 = (id)objc_msgSend(v132, "objectForKey:");
          v49 = (id)objc_msgSend(v48, "numberWithUnsignedInteger:", objc_msgSend(v50, "unsignedIntegerValue"));
          objc_msgSend(v131, "setObject:atIndexedSubscript:");

        }
        else
        {
          v46 = v138;
          v47 = -[AXPhoenixClassifierConfiguration predictionClassNoneKey](v140, "predictionClassNoneKey");
          objc_msgSend(v46, "addObject:");

        }
        v44 = -[AXPhoenixClassifierConfiguration predictionClassTripleTapKey](v140, "predictionClassTripleTapKey");
        v45 = (id)objc_msgSend(v132, "objectForKey:");

        if (v45)
        {
          v40 = (void *)MEMORY[0x24BDD16E0];
          v43 = -[AXPhoenixClassifierConfiguration predictionClassTripleTapKey](v140, "predictionClassTripleTapKey");
          v42 = (id)objc_msgSend(v132, "objectForKey:");
          v41 = (id)objc_msgSend(v40, "numberWithUnsignedInteger:", objc_msgSend(v42, "unsignedIntegerValue"));
          objc_msgSend(v131, "setObject:atIndexedSubscript:");

        }
        else
        {
          v38 = v138;
          v39 = -[AXPhoenixClassifierConfiguration predictionClassTripleTapKey](v140, "predictionClassTripleTapKey");
          objc_msgSend(v38, "addObject:");

        }
        -[AXPhoenixClassifierConfiguration setTripleTapPolicyThresholds:](v140, "setTripleTapPolicyThresholds:", v131);
        objc_storeStrong(&v131, 0);
      }
      else
      {
        v36 = v138;
        v37 = -[AXPhoenixClassifierConfiguration tripleTapPolicyKey](v140, "tripleTapPolicyKey");
        objc_msgSend(v36, "addObject:");

      }
      v34 = v135;
      v35 = -[AXPhoenixClassifierConfiguration generalPolicyKey](v140, "generalPolicyKey");
      v130 = (id)objc_msgSend(v34, "objectForKey:");

      if (v130)
      {
        v30 = (void *)MEMORY[0x24BDBCEB8];
        v31 = -[AXPhoenixClassifierConfiguration generalPolicyThresholds](v140, "generalPolicyThresholds");
        v129 = (id)objc_msgSend(v30, "arrayWithArray:");

        v32 = -[AXPhoenixClassifierConfiguration predictionClassNoneKey](v140, "predictionClassNoneKey");
        v33 = (id)objc_msgSend(v130, "objectForKey:");

        if (v33)
        {
          v26 = (void *)MEMORY[0x24BDD16E0];
          v29 = -[AXPhoenixClassifierConfiguration predictionClassNoneKey](v140, "predictionClassNoneKey");
          v28 = (id)objc_msgSend(v130, "objectForKey:");
          v27 = (id)objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v28, "unsignedIntegerValue"));
          objc_msgSend(v129, "setObject:atIndexedSubscript:");

        }
        else
        {
          v24 = v138;
          v25 = -[AXPhoenixClassifierConfiguration predictionClassNoneKey](v140, "predictionClassNoneKey");
          objc_msgSend(v24, "addObject:");

        }
        v22 = -[AXPhoenixClassifierConfiguration predictionClassDoubleTapKey](v140, "predictionClassDoubleTapKey");
        v23 = (id)objc_msgSend(v130, "objectForKey:");

        if (v23)
        {
          v18 = (void *)MEMORY[0x24BDD16E0];
          v21 = -[AXPhoenixClassifierConfiguration predictionClassDoubleTapKey](v140, "predictionClassDoubleTapKey");
          v20 = (id)objc_msgSend(v130, "objectForKey:");
          v19 = (id)objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v20, "unsignedIntegerValue"));
          objc_msgSend(v129, "setObject:atIndexedSubscript:");

        }
        else
        {
          v16 = v138;
          v17 = -[AXPhoenixClassifierConfiguration predictionClassDoubleTapKey](v140, "predictionClassDoubleTapKey");
          objc_msgSend(v16, "addObject:");

        }
        v14 = -[AXPhoenixClassifierConfiguration predictionClassTripleTapKey](v140, "predictionClassTripleTapKey");
        v15 = (id)objc_msgSend(v130, "objectForKey:");

        if (v15)
        {
          v10 = (void *)MEMORY[0x24BDD16E0];
          v13 = -[AXPhoenixClassifierConfiguration predictionClassTripleTapKey](v140, "predictionClassTripleTapKey");
          v12 = (id)objc_msgSend(v130, "objectForKey:");
          v11 = (id)objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v12, "unsignedIntegerValue"));
          objc_msgSend(v129, "setObject:atIndexedSubscript:");

        }
        else
        {
          v8 = v138;
          v9 = -[AXPhoenixClassifierConfiguration predictionClassTripleTapKey](v140, "predictionClassTripleTapKey");
          objc_msgSend(v8, "addObject:");

        }
        -[AXPhoenixClassifierConfiguration setGeneralPolicyThresholds:](v140, "setGeneralPolicyThresholds:", v129);
        objc_storeStrong(&v129, 0);
      }
      else
      {
        v6 = v138;
        v7 = -[AXPhoenixClassifierConfiguration generalPolicyKey](v140, "generalPolicyKey");
        objc_msgSend(v6, "addObject:");

      }
      objc_storeStrong(&v130, 0);
      objc_storeStrong(&v132, 0);
      objc_storeStrong(&v134, 0);
    }
    else
    {
      v4 = v138;
      v5 = -[AXPhoenixClassifierConfiguration predictionCountThresholdsKey](v140, "predictionCountThresholdsKey");
      objc_msgSend(v4, "addObject:");

    }
    objc_storeStrong(&v135, 0);
  }
  objc_storeStrong(&v136, 0);
  objc_storeStrong(&v137, 0);
  objc_storeStrong(&v138, 0);
  objc_storeStrong(location, 0);
}

- (id)toDictionary
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSArray *v9;
  NSString *v10;
  id v11;
  NSArray *v12;
  NSString *v13;
  id v14;
  NSArray *v15;
  NSString *v16;
  NSString *v17;
  id v18;
  id v19;
  NSArray *v20;
  NSString *v21;
  id v22;
  NSArray *v23;
  NSString *v24;
  NSString *v25;
  id v26;
  id v27;
  NSArray *v28;
  NSString *v29;
  id v30;
  NSArray *v31;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  id v35;
  NSString *v36;
  id v37;
  NSString *v38;
  id v39;
  NSString *v40;
  id v41;
  NSString *v42;
  NSString *v43;
  id v44;
  id v45;
  NSString *v46;
  id v47;
  NSString *v48;
  NSString *v49;
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[3];

  v64[2] = *MEMORY[0x24BDAC8D0];
  v49 = -[AXPhoenixClassifierConfiguration dataKey](self, "dataKey");
  v63[0] = v49;
  v48 = -[AXPhoenixClassifierConfiguration accelerometerSampleRateInHzKey](self, "accelerometerSampleRateInHzKey");
  v61[0] = v48;
  v47 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AXPhoenixClassifierConfiguration accelerometerSampleRateInHz](self, "accelerometerSampleRateInHz"));
  v62[0] = v47;
  v46 = -[AXPhoenixClassifierConfiguration maxAccelerationBufferSizeKey](self, "maxAccelerationBufferSizeKey");
  v61[1] = v46;
  v45 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AXPhoenixClassifierConfiguration maxAccelerationBufferSize](self, "maxAccelerationBufferSize"));
  v62[1] = v45;
  v44 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61);
  v64[0] = v44;
  v43 = -[AXPhoenixClassifierConfiguration policyKey](self, "policyKey");
  v63[1] = v43;
  v42 = -[AXPhoenixClassifierConfiguration modelPredictionRateInHzKey](self, "modelPredictionRateInHzKey");
  v59[0] = v42;
  v41 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AXPhoenixClassifierConfiguration modelPredictionRateInHz](self, "modelPredictionRateInHz"));
  v60[0] = v41;
  v40 = -[AXPhoenixClassifierConfiguration maxPredictionBufferSizeKey](self, "maxPredictionBufferSizeKey");
  v59[1] = v40;
  v39 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AXPhoenixClassifierConfiguration maxPredictionBufferSize](self, "maxPredictionBufferSize"));
  v60[1] = v39;
  v38 = -[AXPhoenixClassifierConfiguration minDurationBetweenTriggersInSecondsKey](self, "minDurationBetweenTriggersInSecondsKey");
  v59[2] = v38;
  v37 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AXPhoenixClassifierConfiguration minDurationBetweenTriggersInSeconds](self, "minDurationBetweenTriggersInSeconds"));
  v60[2] = v37;
  v36 = -[AXPhoenixClassifierConfiguration predictionConfidenceThresholdKey](self, "predictionConfidenceThresholdKey");
  v59[3] = v36;
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[AXPhoenixClassifierConfiguration predictionConfidenceThreshold](self, "predictionConfidenceThreshold");
  v35 = (id)objc_msgSend(v3, "numberWithDouble:");
  v60[3] = v35;
  v34 = -[AXPhoenixClassifierConfiguration predictionCountThresholdsKey](self, "predictionCountThresholdsKey");
  v59[4] = v34;
  v33 = -[AXPhoenixClassifierConfiguration doubleTapPolicyKey](self, "doubleTapPolicyKey");
  v57[0] = v33;
  v32 = -[AXPhoenixClassifierConfiguration predictionClassNoneKey](self, "predictionClassNoneKey");
  v55[0] = v32;
  v31 = -[AXPhoenixClassifierConfiguration doubleTapPolicyThresholds](self, "doubleTapPolicyThresholds");
  v30 = -[NSArray objectAtIndexedSubscript:](v31, "objectAtIndexedSubscript:");
  v56[0] = v30;
  v29 = -[AXPhoenixClassifierConfiguration predictionClassDoubleTapKey](self, "predictionClassDoubleTapKey");
  v55[1] = v29;
  v28 = -[AXPhoenixClassifierConfiguration doubleTapPolicyThresholds](self, "doubleTapPolicyThresholds");
  v27 = -[NSArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:");
  v56[1] = v27;
  v26 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  v58[0] = v26;
  v25 = -[AXPhoenixClassifierConfiguration tripleTapPolicyKey](self, "tripleTapPolicyKey");
  v57[1] = v25;
  v24 = -[AXPhoenixClassifierConfiguration predictionClassNoneKey](self, "predictionClassNoneKey");
  v53[0] = v24;
  v23 = -[AXPhoenixClassifierConfiguration tripleTapPolicyThresholds](self, "tripleTapPolicyThresholds");
  v22 = -[NSArray objectAtIndexedSubscript:](v23, "objectAtIndexedSubscript:", 0);
  v54[0] = v22;
  v21 = -[AXPhoenixClassifierConfiguration predictionClassTripleTapKey](self, "predictionClassTripleTapKey");
  v53[1] = v21;
  v20 = -[AXPhoenixClassifierConfiguration tripleTapPolicyThresholds](self, "tripleTapPolicyThresholds");
  v19 = -[NSArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", 1);
  v54[1] = v19;
  v18 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v58[1] = v18;
  v17 = -[AXPhoenixClassifierConfiguration generalPolicyKey](self, "generalPolicyKey");
  v57[2] = v17;
  v16 = -[AXPhoenixClassifierConfiguration predictionClassNoneKey](self, "predictionClassNoneKey");
  v51[0] = v16;
  v15 = -[AXPhoenixClassifierConfiguration generalPolicyThresholds](self, "generalPolicyThresholds");
  v14 = -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 0);
  v52[0] = v14;
  v13 = -[AXPhoenixClassifierConfiguration predictionClassDoubleTapKey](self, "predictionClassDoubleTapKey");
  v51[1] = v13;
  v12 = -[AXPhoenixClassifierConfiguration generalPolicyThresholds](self, "generalPolicyThresholds");
  v11 = -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 1);
  v52[1] = v11;
  v10 = -[AXPhoenixClassifierConfiguration predictionClassTripleTapKey](self, "predictionClassTripleTapKey");
  v51[2] = v10;
  v9 = -[AXPhoenixClassifierConfiguration generalPolicyThresholds](self, "generalPolicyThresholds");
  v8 = -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 2);
  v52[2] = v8;
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51);
  v58[2] = v7;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 3);
  v60[4] = v6;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 5);
  v64[1] = v4;
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);

  return v5;
}

- (unint64_t)accelerometerSampleRateInHz
{
  return self->_accelerometerSampleRateInHz;
}

- (void)setAccelerometerSampleRateInHz:(unint64_t)a3
{
  self->_accelerometerSampleRateInHz = a3;
}

- (unint64_t)maxAccelerationBufferSize
{
  return self->_maxAccelerationBufferSize;
}

- (void)setMaxAccelerationBufferSize:(unint64_t)a3
{
  self->_maxAccelerationBufferSize = a3;
}

- (unint64_t)modelPredictionRateInHz
{
  return self->_modelPredictionRateInHz;
}

- (void)setModelPredictionRateInHz:(unint64_t)a3
{
  self->_modelPredictionRateInHz = a3;
}

- (double)predictionConfidenceThreshold
{
  return self->_predictionConfidenceThreshold;
}

- (void)setPredictionConfidenceThreshold:(double)a3
{
  self->_predictionConfidenceThreshold = a3;
}

- (unint64_t)minDurationBetweenTriggersInSeconds
{
  return self->_minDurationBetweenTriggersInSeconds;
}

- (void)setMinDurationBetweenTriggersInSeconds:(unint64_t)a3
{
  self->_minDurationBetweenTriggersInSeconds = a3;
}

- (unint64_t)maxPredictionBufferSize
{
  return self->_maxPredictionBufferSize;
}

- (void)setMaxPredictionBufferSize:(unint64_t)a3
{
  self->_maxPredictionBufferSize = a3;
}

- (NSArray)doubleTapPolicyThresholds
{
  return self->_doubleTapPolicyThresholds;
}

- (void)setDoubleTapPolicyThresholds:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapPolicyThresholds, a3);
}

- (NSArray)tripleTapPolicyThresholds
{
  return self->_tripleTapPolicyThresholds;
}

- (void)setTripleTapPolicyThresholds:(id)a3
{
  objc_storeStrong((id *)&self->_tripleTapPolicyThresholds, a3);
}

- (NSArray)generalPolicyThresholds
{
  return self->_generalPolicyThresholds;
}

- (void)setGeneralPolicyThresholds:(id)a3
{
  objc_storeStrong((id *)&self->_generalPolicyThresholds, a3);
}

- (NSString)dataKey
{
  return self->_dataKey;
}

- (void)setDataKey:(id)a3
{
  objc_storeStrong((id *)&self->_dataKey, a3);
}

- (NSString)accelerometerSampleRateInHzKey
{
  return self->_accelerometerSampleRateInHzKey;
}

- (void)setAccelerometerSampleRateInHzKey:(id)a3
{
  objc_storeStrong((id *)&self->_accelerometerSampleRateInHzKey, a3);
}

- (NSString)maxAccelerationBufferSizeKey
{
  return self->_maxAccelerationBufferSizeKey;
}

- (void)setMaxAccelerationBufferSizeKey:(id)a3
{
  objc_storeStrong((id *)&self->_maxAccelerationBufferSizeKey, a3);
}

- (NSString)policyKey
{
  return self->_policyKey;
}

- (void)setPolicyKey:(id)a3
{
  objc_storeStrong((id *)&self->_policyKey, a3);
}

- (NSString)modelPredictionRateInHzKey
{
  return self->_modelPredictionRateInHzKey;
}

- (void)setModelPredictionRateInHzKey:(id)a3
{
  objc_storeStrong((id *)&self->_modelPredictionRateInHzKey, a3);
}

- (NSString)predictionConfidenceThresholdKey
{
  return self->_predictionConfidenceThresholdKey;
}

- (void)setPredictionConfidenceThresholdKey:(id)a3
{
  objc_storeStrong((id *)&self->_predictionConfidenceThresholdKey, a3);
}

- (NSString)minDurationBetweenTriggersInSecondsKey
{
  return self->_minDurationBetweenTriggersInSecondsKey;
}

- (void)setMinDurationBetweenTriggersInSecondsKey:(id)a3
{
  objc_storeStrong((id *)&self->_minDurationBetweenTriggersInSecondsKey, a3);
}

- (NSString)maxPredictionBufferSizeKey
{
  return self->_maxPredictionBufferSizeKey;
}

- (void)setMaxPredictionBufferSizeKey:(id)a3
{
  objc_storeStrong((id *)&self->_maxPredictionBufferSizeKey, a3);
}

- (NSString)predictionCountThresholdsKey
{
  return self->_predictionCountThresholdsKey;
}

- (void)setPredictionCountThresholdsKey:(id)a3
{
  objc_storeStrong((id *)&self->_predictionCountThresholdsKey, a3);
}

- (NSString)doubleTapPolicyKey
{
  return self->_doubleTapPolicyKey;
}

- (void)setDoubleTapPolicyKey:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapPolicyKey, a3);
}

- (NSString)tripleTapPolicyKey
{
  return self->_tripleTapPolicyKey;
}

- (void)setTripleTapPolicyKey:(id)a3
{
  objc_storeStrong((id *)&self->_tripleTapPolicyKey, a3);
}

- (NSString)generalPolicyKey
{
  return self->_generalPolicyKey;
}

- (void)setGeneralPolicyKey:(id)a3
{
  objc_storeStrong((id *)&self->_generalPolicyKey, a3);
}

- (NSString)predictionClassNoneKey
{
  return self->_predictionClassNoneKey;
}

- (void)setPredictionClassNoneKey:(id)a3
{
  objc_storeStrong((id *)&self->_predictionClassNoneKey, a3);
}

- (NSString)predictionClassDoubleTapKey
{
  return self->_predictionClassDoubleTapKey;
}

- (void)setPredictionClassDoubleTapKey:(id)a3
{
  objc_storeStrong((id *)&self->_predictionClassDoubleTapKey, a3);
}

- (NSString)predictionClassTripleTapKey
{
  return self->_predictionClassTripleTapKey;
}

- (void)setPredictionClassTripleTapKey:(id)a3
{
  objc_storeStrong((id *)&self->_predictionClassTripleTapKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionClassTripleTapKey, 0);
  objc_storeStrong((id *)&self->_predictionClassDoubleTapKey, 0);
  objc_storeStrong((id *)&self->_predictionClassNoneKey, 0);
  objc_storeStrong((id *)&self->_generalPolicyKey, 0);
  objc_storeStrong((id *)&self->_tripleTapPolicyKey, 0);
  objc_storeStrong((id *)&self->_doubleTapPolicyKey, 0);
  objc_storeStrong((id *)&self->_predictionCountThresholdsKey, 0);
  objc_storeStrong((id *)&self->_maxPredictionBufferSizeKey, 0);
  objc_storeStrong((id *)&self->_minDurationBetweenTriggersInSecondsKey, 0);
  objc_storeStrong((id *)&self->_predictionConfidenceThresholdKey, 0);
  objc_storeStrong((id *)&self->_modelPredictionRateInHzKey, 0);
  objc_storeStrong((id *)&self->_policyKey, 0);
  objc_storeStrong((id *)&self->_maxAccelerationBufferSizeKey, 0);
  objc_storeStrong((id *)&self->_accelerometerSampleRateInHzKey, 0);
  objc_storeStrong((id *)&self->_dataKey, 0);
  objc_storeStrong((id *)&self->_generalPolicyThresholds, 0);
  objc_storeStrong((id *)&self->_tripleTapPolicyThresholds, 0);
  objc_storeStrong((id *)&self->_doubleTapPolicyThresholds, 0);
}

@end
