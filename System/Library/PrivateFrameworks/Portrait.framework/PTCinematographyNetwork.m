@implementation PTCinematographyNetwork

+ (NSString)defaultVersionString
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "firstExistingVersion:", &unk_1E8252D30);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(&unk_1E8252D48, "objectAtIndexedSubscript:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

+ (id)defaultVersionStringForDetectionModel:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (a3 == 1)
  {
    v3 = &unk_1E8252D60;
    v4 = 0;
  }
  else
  {
    if (a3 != 2)
    {
      objc_msgSend(a1, "defaultVersionString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    v3 = &unk_1E8252D78;
    v4 = 1;
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

+ (id)firstExistingVersion:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(a1, "existsVersionString:", v9, (_QWORD)v13) & 1) != 0)
        {
          v11 = v9;
          v10 = v4;
          goto LABEL_13;
        }
      }
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }

  _PTLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    +[PTCinematographyNetwork firstExistingVersion:].cold.1();
  v11 = 0;
LABEL_13:

  return v11;
}

+ (BOOL)existsVersionString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PTVersionStringWithComponents(v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cinematography_models/%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:subdirectory:", CFSTR("model.espresso"), CFSTR("net"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

- (PTCinematographyNetwork)init
{
  void *v3;
  PTCinematographyNetwork *v4;

  objc_msgSend((id)objc_opt_class(), "defaultVersionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PTCinematographyNetwork initWithVersionString:](self, "initWithVersionString:", v3);

  return v4;
}

- (PTCinematographyNetwork)initWithVersionString:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  PTCinematographyNetworkParameters *v12;
  id *v13;
  NSObject *v14;
  PTCinematographyNetwork *v15;
  NSObject *v16;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PTVersionStringWithComponents(v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cinematography_models/%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:subdirectory:", CFSTR("model.espresso"), CFSTR("net"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "URLForResource:withExtension:subdirectory:", CFSTR("model.parameters"), CFSTR("json"), v8);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      _PTLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v7;
        _os_log_impl(&dword_1C9281000, v11, OS_LOG_TYPE_DEFAULT, "no model parameters json file for version %@", buf, 0xCu);
      }

    }
    v12 = -[PTCinematographyNetworkParameters initWithURL:]([PTCinematographyNetworkParameters alloc], "initWithURL:", v10);
    if (v12)
    {
      v13 = -[PTCinematographyNetwork _initWithNetwork:parameters:](self, "_initWithNetwork:parameters:", v9, v12);
      if (v13)
      {
        _PTLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[PTCinematographyNetwork initWithVersionString:].cold.3();

        objc_storeStrong(v13 + 153, a3);
      }
      self = v13;
      v15 = self;
    }
    else
    {
      _PTLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PTCinematographyNetwork initWithVersionString:].cold.2();

      v15 = 0;
    }

  }
  else
  {
    _PTLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PTCinematographyNetwork initWithVersionString:].cold.1();
    v15 = 0;
  }

  return v15;
}

- (id)_initWithNetwork:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  PTCinematographyNetwork *v8;
  PTCinematographyNetwork *v9;
  PTCinematographyDetection *v10;
  double v11;
  uint64_t v12;
  PTCinematographyDetection *zeroDisparityDetection;
  uint64_t v14;
  NSMutableArray *networkDetections;
  uint64_t v16;
  NSMutableIndexSet *unusedIndexes;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  PTCinematographyNetworkSignal *v26;
  void *v27;
  PTCinematographyNetworkSignal *v28;
  uint64_t v29;
  NSArray *inputSignals;
  PTCinematographyNetwork *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)PTCinematographyNetwork;
  v8 = -[PTCinematographyNetwork init](&v40, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_params, a4);
    if (-[PTCinematographyNetwork _loadEspressoNetwork:](v9, "_loadEspressoNetwork:", v6))
    {
      v33 = v7;
      v9->_step_i = -1;
      *(_OWORD *)&v9->_lastNetworkPredictionIndex = xmmword_1C9322AE0;
      v10 = [PTCinematographyDetection alloc];
      v38 = *MEMORY[0x1E0CA2E10];
      v39 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
      LODWORD(v11) = 0;
      v12 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v10, "initWithTime:rect:focusDistance:", &v38, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v11);
      zeroDisparityDetection = v9->_zeroDisparityDetection;
      v9->_zeroDisparityDetection = (PTCinematographyDetection *)v12;

      -[PTCinematographyDetection setDetectionType:](v9->_zeroDisparityDetection, "setDetectionType:", 101);
      -[PTCinematographyDetection setTrackIdentifier:](v9->_zeroDisparityDetection, "setTrackIdentifier:", 0x1000000000);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9->_x_in.height);
      v14 = objc_claimAutoreleasedReturnValue();
      networkDetections = v9->_networkDetections;
      v9->_networkDetections = (NSMutableArray *)v14;

      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v16 = objc_claimAutoreleasedReturnValue();
      unusedIndexes = v9->_unusedIndexes;
      v9->_unusedIndexes = (NSMutableIndexSet *)v16;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v18 = objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      -[PTCinematographyNetwork params](v9, "params");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "inputSchemas");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v35 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            v26 = [PTCinematographyNetworkSignal alloc];
            objc_msgSend(v25, "params");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = -[PTCinematographyNetworkSignal initWithModelDictionary:](v26, "initWithModelDictionary:", v27);

            -[NSObject addObject:](v18, "addObject:", v28);
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        }
        while (v22);
      }

      v29 = -[NSObject copy](v18, "copy");
      inputSignals = v9->_inputSignals;
      v9->_inputSignals = (NSArray *)v29;

      bzero(v9->_x_in.data, 4 * v9->_x_in.width * v9->_x_in.height);
      bzero(v9->_mask_in.data, 4 * v9->_mask_in.height);
      bzero(v9->_hx_out.data, 4 * v9->_hx_out.width * v9->_hx_out.height);
      bzero(v9->_cx_out.data, 4 * v9->_cx_out.width * v9->_cx_out.height);
      v31 = v9;
      v7 = v33;
    }
    else
    {
      _PTLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PTCinematographyNetwork _initWithNetwork:parameters:].cold.1();
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)PTCinematographyNetwork;
  -[PTCinematographyNetwork dealloc](&v3, sel_dealloc);
}

- (float)expectedFPS
{
  void *v2;
  float v3;
  float v4;

  -[PTCinematographyNetwork params](self, "params");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expectedFPS");
  v4 = v3;

  return v4;
}

- (id)stepWithFrameDetections:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;

  v4 = a3;
  ++self->_step_i;
  -[PTCinematographyNetwork _setNetworkDetectionsFromFrameDetections:](self, "_setNetworkDetectionsFromFrameDetections:", v4);
  -[PTCinematographyNetwork params](self, "params");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "runOnlyWhenDetectorDidRun")
    && (objc_msgSend(v4, "detectorDidRun"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "detectorDidRun");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) == 0)
    {
      -[PTCinematographyNetwork lastFocusDetection](self, "lastFocusDetection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      _PTLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
      if (v10)
      {
        if (v12)
          -[PTCinematographyNetwork stepWithFrameDetections:].cold.5();

        -[PTCinematographyNetwork lastFocusDetection](self, "lastFocusDetection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "detectionForTrackIdentifier:", objc_msgSend(v13, "trackIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          -[PTCinematographyNetwork lastFocusDetection](self, "lastFocusDetection");
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v25 = v16;

      }
      else
      {
        if (v12)
          -[PTCinematographyNetwork stepWithFrameDetections:].cold.4();

        objc_msgSend(v4, "autoFocusDetection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTCinematographyNetwork setLastFocusDetection:](self, "setLastFocusDetection:", v25);
      }
      goto LABEL_27;
    }
  }
  else
  {

  }
  v31 = 0uLL;
  v32 = 0;
  if (v4)
    objc_msgSend(v4, "presentationTime");
  -[PTCinematographyNetwork _setNetworkInputsFromNetworkDetections](self, "_setNetworkInputsFromNetworkDetections");
  _PTLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);

  if (v18)
  {
    _PTLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyNetwork stepWithFrameDetections:].cold.3();

    -[PTCinematographyNetwork _debugLogNetworkInputs](self, "_debugLogNetworkInputs");
  }
  v20 = -[PTCinematographyNetwork _networkPredictionIndex](self, "_networkPredictionIndex");
  _PTLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);

  if (v22)
  {
    _PTLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyNetwork stepWithFrameDetections:].cold.2();

    -[PTCinematographyNetwork _debugLogNetworkOutputs](self, "_debugLogNetworkOutputs");
  }
  v29 = v31;
  v30 = v32;
  if (-[PTCinematographyNetwork _shouldIgnoreNetworkPredictionIndex:time:](self, "_shouldIgnoreNetworkPredictionIndex:time:", v20, &v29))
  {
    _PTLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyNetwork stepWithFrameDetections:].cold.1(self, v20, v24);

    v20 = 0;
  }
  -[PTCinematographyNetwork _detectionAtNetworkIndex:frameDetections:](self, "_detectionAtNetworkIndex:frameDetections:", v20, v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend(v4, "autoFocusDetection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = v31;
  v30 = v32;
  -[PTCinematographyNetwork _updateLastNetworkPredictionIndex:time:](self, "_updateLastNetworkPredictionIndex:time:", v20, &v29);
LABEL_27:
  -[PTCinematographyNetwork params](self, "params");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "runOnlyWhenDetectorDidRun");

  if (v27)
    -[PTCinematographyNetwork setLastFocusDetection:](self, "setLastFocusDetection:", v25);

  return v25;
}

- (void)_updateLastNetworkPredictionIndex:(unint64_t)a3 time:(id *)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int32_t v19;
  NSObject *v20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21;
  CMTime time1;

  v7 = -[PTCinematographyNetwork lastNetworkPredictionIndex](self, "lastNetworkPredictionIndex");
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "trackIdentifier");

  v11 = -[PTCinematographyNetwork lastNetworkPredictionTrackID](self, "lastNetworkPredictionTrackID");
  if (!v7)
    goto LABEL_9;
  v12 = v11;
  if (v11 == v10)
    goto LABEL_9;
  -[PTCinematographyNetwork unusedIndexes](self, "unusedIndexes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "containsIndex:", v7))
  {
LABEL_8:

    goto LABEL_9;
  }
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "trackIdentifier") != v12)
  {

    goto LABEL_8;
  }
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    objc_msgSend(v17, "time");
  else
    memset(&time1, 0, sizeof(time1));
  v21 = *a4;
  v19 = CMTimeCompare(&time1, (CMTime *)&v21);

  if (v19 < 0)
  {
    _PTLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyNetwork _updateLastNetworkPredictionIndex:time:].cold.1(self, v7, v20);

    -[PTCinematographyNetwork _forgetNetworkDetectionAtIndex:](self, "_forgetNetworkDetectionAtIndex:", v7);
  }
LABEL_9:
  -[PTCinematographyNetwork setLastNetworkPredictionIndex:](self, "setLastNetworkPredictionIndex:", a3);
  -[PTCinematographyNetwork setLastNetworkPredictionTrackID:](self, "setLastNetworkPredictionTrackID:", v10);
}

- (BOOL)_isNetworkCompatibleDetectionType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[PTCinematographyNetwork params](self, "params");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedDetectionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  return v7;
}

- (BOOL)_loadEspressoNetwork:(id)a3
{
  id v4;
  void *context;
  void *plan;
  id v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  unint64_t *p_height;
  unint64_t height;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a3;
  context = (void *)espresso_create_context();
  self->_context = context;
  if (context)
  {
    plan = (void *)espresso_create_plan();
    self->_plan = plan;
    if (plan)
    {
      objc_msgSend(v4, "path");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "UTF8String");
      v8 = espresso_plan_add_network();

      if (v8)
      {
        _PTLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[PTCinematographyNetwork _loadEspressoNetwork:].cold.12();
      }
      else if (espresso_plan_build())
      {
        _PTLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[PTCinematographyNetwork _loadEspressoNetwork:].cold.11();
      }
      else
      {
        objc_msgSend(CFSTR("x"), "UTF8String");
        if (espresso_network_bind_buffer())
        {
          _PTLogSystem();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.10();

        }
        objc_msgSend(CFSTR("hx_in"), "UTF8String");
        if (espresso_network_bind_buffer())
        {
          _PTLogSystem();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.9();

        }
        objc_msgSend(CFSTR("cx_in"), "UTF8String");
        if (espresso_network_bind_buffer())
        {
          _PTLogSystem();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.8();

        }
        objc_msgSend(CFSTR("mask"), "UTF8String");
        if (espresso_network_bind_buffer())
        {
          _PTLogSystem();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.7();

        }
        objc_msgSend(CFSTR("hx_out"), "UTF8String");
        if (espresso_network_bind_buffer())
        {
          _PTLogSystem();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.6();

        }
        objc_msgSend(CFSTR("cx_out"), "UTF8String");
        if (espresso_network_bind_buffer())
        {
          _PTLogSystem();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.5();

        }
        objc_msgSend(CFSTR("pred"), "UTF8String");
        if (espresso_network_bind_buffer())
        {
          _PTLogSystem();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            -[PTCinematographyNetwork _loadEspressoNetwork:].cold.4();

        }
        height = self->_x_in.height;
        p_height = &self->_x_in.height;
        if (height)
        {
          v24 = 1;
          goto LABEL_14;
        }
        _PTLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[PTCinematographyNetwork _loadEspressoNetwork:].cold.3((uint64_t)p_height, v9, v35, v36, v37, v38, v39, v40);
      }
    }
    else
    {
      _PTLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[PTCinematographyNetwork _loadEspressoNetwork:].cold.2(v9, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  else
  {
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PTCinematographyNetwork _loadEspressoNetwork:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  v24 = 0;
LABEL_14:

  return v24;
}

- (BOOL)_shouldIgnoreNetworkPredictionIndex:(unint64_t)a3 time:(id *)a4
{
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int32_t v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;
  CMTime time1;

  if (!a3)
    return 0;
  v7 = -[PTCinematographyNetwork lastNetworkPredictionTrackID](self, "lastNetworkPredictionTrackID");
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "trackIdentifier");

  if (v7 == v10)
    return 0;
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "time");
  else
    memset(&time1, 0, sizeof(time1));
  v16 = *a4;
  v15 = CMTimeCompare(&time1, (CMTime *)&v16);

  if ((v15 & 0x80000000) == 0)
    return 0;
  if (!-[PTCinematographyNetwork lastNetworkPredictionIndex](self, "lastNetworkPredictionIndex"))
    return 1;
  v16 = *a4;
  return -[PTCinematographyNetwork _allNetworkDetectionsAreStaleAtTime:](self, "_allNetworkDetectionsAreStaleAtTime:", &v16);
}

- (BOOL)_allNetworkDetectionsAreStaleAtTime:(id *)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  int32_t v13;
  void *v14;
  unint64_t v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;
  CMTime time1;

  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 < 2)
    return 1;
  v7 = 1;
  while (1)
  {
    -[PTCinematographyNetwork unusedIndexes](self, "unusedIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsIndex:", v7);

    if ((v9 & 1) == 0)
    {
      -[PTCinematographyNetwork networkDetections](self, "networkDetections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        objc_msgSend(v11, "time");
      else
        memset(&time1, 0, sizeof(time1));
      v17 = *a3;
      v13 = CMTimeCompare(&time1, (CMTime *)&v17);

      if (!v13)
        break;
    }
    ++v7;
    -[PTCinematographyNetwork networkDetections](self, "networkDetections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v7 >= v15)
      return 1;
  }
  return 0;
}

- (void)_setNetworkDetectionsFromFrameDetections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CMTime v38;
  CMTime rhs;
  CMTime lhs;
  CMTime v41;
  CMTime v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "allTrackIdentifiersForCinematicChoice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v42, 0, sizeof(v42));
  if (v4)
    objc_msgSend(v4, "presentationTime");
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v41 = v42;
    -[PTCinematographyNetwork _setMissingDetectionAtIndex:time:](self, "_setMissingDetectionAtIndex:time:", 0, &v41);
  }
  else
  {
    -[PTCinematographyNetwork zeroDisparityDetection](self, "zeroDisparityDetection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v42;
    -[PTCinematographyNetwork _setNetworkDetection:atIndex:time:](self, "_setNetworkDetection:atIndex:time:", v10, 0, &v41);

  }
  -[PTCinematographyNetworkParameters forgetDetectionsAfterSeconds](self->_params, "forgetDetectionsAfterSeconds");
  if (v11 > 0.0)
  {
    v12 = v11;
    memset(&v41, 0, sizeof(v41));
    if (v4)
      objc_msgSend(v4, "presentationTime");
    else
      memset(&lhs, 0, sizeof(lhs));
    CMTimeMakeWithSeconds(&rhs, v12, 90000);
    CMTimeSubtract(&v41, &lhs, &rhs);
    v38 = v41;
    -[PTCinematographyNetwork _forgetNetworkDetectionsOlderThan:](self, "_forgetNetworkDetectionsOlderThan:", &v38);
  }
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14 >= 2)
  {
    v15 = 1;
    do
    {
      -[PTCinematographyNetwork unusedIndexes](self, "unusedIndexes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsIndex:", v15);

      if ((v17 & 1) == 0)
      {
        -[PTCinematographyNetwork networkDetections](self, "networkDetections");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "trackIdentifier");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v19) = objc_msgSend(v7, "containsObject:", v21);

        if ((_DWORD)v19)
        {
          objc_msgSend(v4, "detectionForTrackIdentifier:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v42;
          -[PTCinematographyNetwork _setNetworkDetection:atIndex:time:](self, "_setNetworkDetection:atIndex:time:", v22, v15, &v41);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeObject:", v23);

        }
        else
        {
          v41 = v42;
          -[PTCinematographyNetwork _setMissingDetectionAtIndex:time:](self, "_setMissingDetectionAtIndex:time:", v15, &v41);
        }
      }
      ++v15;
      -[PTCinematographyNetwork networkDetections](self, "networkDetections");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

    }
    while (v15 < v25);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v26 = v7;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(v26);
        v31 = PTTrackIDFromNumber(*(void **)(*((_QWORD *)&v34 + 1) + 8 * i));
        objc_msgSend(v4, "detectionForTrackIdentifier:", v31, (_QWORD)v34);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PTCinematographyNetwork _isNetworkCompatibleDetectionType:](self, "_isNetworkCompatibleDetectionType:", objc_msgSend(v32, "detectionType")))
        {
          v33 = -[PTCinematographyNetwork _allocateNetworkDetectionIndex](self, "_allocateNetworkDetectionIndex");
          v41 = v42;
          -[PTCinematographyNetwork _setNetworkDetection:atIndex:time:](self, "_setNetworkDetection:atIndex:time:", v32, v33, &v41);
        }

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v28);
  }

}

- (void)_setNetworkInputsFromNetworkDetections
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  float v7;
  void *v8;
  unint64_t v9;

  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[PTCinematographyNetwork unusedIndexes](self, "unusedIndexes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "containsIndex:", v5))
        v7 = 0.0;
      else
        v7 = 1.0;
      *((float *)self->_mask_in.data + v5) = v7;

      ++v5;
      -[PTCinematographyNetwork networkDetections](self, "networkDetections");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

    }
    while (v5 < v9);
  }
  memcpy(self->_hx_in.data, self->_hx_out.data, 4 * self->_hx_in.width * self->_hx_in.height);
  memcpy(self->_cx_in.data, self->_cx_out.data, 4 * self->_cx_in.width * self->_cx_in.height);
}

- (unint64_t)_networkPredictionIndex
{
  unint64_t height;
  unint64_t v4;
  float *data;
  float v6;
  uint64_t i;
  NSObject *v8;

  espresso_plan_execute_sync();
  height = self->_pred_out.height;
  if (height < 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = 0;
    data = (float *)self->_pred_out.data;
    v6 = *data;
    for (i = 1; i != height; ++i)
    {
      if (v6 < data[i])
      {
        v4 = i;
        v6 = data[i];
      }
    }
  }
  _PTLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PTCinematographyNetwork _networkPredictionIndex].cold.1();

  return v4;
}

- (id)_detectionAtNetworkIndex:(unint64_t)a3 frameDetections:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v6 = a4;
  -[PTCinematographyNetwork unusedIndexes](self, "unusedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsIndex:", a3);

  if (v8)
  {
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PTCinematographyNetwork _detectionAtNetworkIndex:frameDetections:].cold.1(a3, v9);

    goto LABEL_9;
  }
  if (a3)
  {
    -[PTCinematographyNetwork networkDetections](self, "networkDetections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 <= a3)
    {
LABEL_9:
      a3 = 0;
      goto LABEL_10;
    }
    -[PTCinematographyNetwork networkDetections](self, "networkDetections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "trackIdentifier");

    objc_msgSend(v6, "detectionForTrackIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      a3 = v15;
    }
    else
    {
      -[PTCinematographyNetwork networkDetections](self, "networkDetections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = objc_msgSend(v19, "copy");

    }
  }
LABEL_10:

  return (id)a3;
}

- (void)_setDetection:(id)a3 asInputRow:(unint64_t)a4 time:(id *)a5 missing:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  unint64_t width;
  char *v12;
  PTCinematographyNetworkPayload *v13;
  PTCinematographyNetworkPayload *v14;
  PTCinematographyNetworkFloatOutputStream *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v25;
  _BYTE v26[128];
  uint64_t v27;

  v6 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  width = self->_x_in.width;
  v12 = (char *)self->_x_in.data + 4 * width * a4;
  v13 = [PTCinematographyNetworkPayload alloc];
  v25 = *a5;
  v14 = -[PTCinematographyNetworkPayload initWithTime:detection:missing:](v13, "initWithTime:detection:missing:", &v25, v10, v6);
  v15 = -[PTCinematographyNetworkFloatOutputStream initWithDestination:count:]([PTCinematographyNetworkFloatOutputStream alloc], "initWithDestination:count:", v12, width);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PTCinematographyNetwork inputSignals](self, "inputSignals", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "writePayload:toStream:", v14, v15);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v18);
  }

}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4;
  void *v5;
  PTCinematographyNetwork *v6;
  void *v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PTCinematographyDetection *v16;
  id v17;
  NSMutableArray *networkDetections;
  void *v19;
  PTCinematographyDetection *v20;
  PTCinematographyDetection *lastFocusDetection;
  uint64_t v22;
  NSMutableIndexSet *unusedIndexes;
  unint64_t v24;
  void *v25;
  int v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  PTCinematographyNetwork *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PTCinematographyNetwork initWithVersionString:](self, "initWithVersionString:", v5);

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_step_i"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_step_i = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_network_detections"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, &v45, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v42;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v42 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v14);
          v16 = [PTCinematographyDetection alloc];
          v17 = -[PTCinematographyDetection _initWithCinematographyDictionary:](v16, "_initWithCinematographyDictionary:", v15, (_QWORD)v41);
          -[NSMutableArray addObject:](v9, "addObject:", v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, &v45, 16);
      }
      while (v12);
    }

    networkDetections = v6->_networkDetections;
    v6->_networkDetections = v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_last_focus_detection"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = -[PTCinematographyDetection _initWithCinematographyDictionary:]([PTCinematographyDetection alloc], "_initWithCinematographyDictionary:", v19);
      lastFocusDetection = v6->_lastFocusDetection;
      v6->_lastFocusDetection = v20;

    }
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet", (_QWORD)v41);
    v22 = objc_claimAutoreleasedReturnValue();
    unusedIndexes = v6->_unusedIndexes;
    v6->_unusedIndexes = (NSMutableIndexSet *)v22;

    if ((unint64_t)-[NSMutableArray count](v6->_networkDetections, "count") >= 2)
    {
      v24 = 1;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](v6->_networkDetections, "objectAtIndexedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "_isInvalid");

        if (v26)
          -[NSMutableIndexSet addIndex:](v6->_unusedIndexes, "addIndex:", v24);
        ++v24;
      }
      while (v24 < -[NSMutableArray count](v6->_networkDetections, "count"));
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_hx_out"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_OWORD *)&v6->_hx_out.stride_batch_number;
    v53 = *(_OWORD *)&v6->_hx_out.stride_height;
    v54 = v28;
    v55 = *(_QWORD *)&v6->_hx_out.storage_type;
    v29 = *(_OWORD *)&v6->_hx_out.width;
    v49 = *(_OWORD *)&v6->_hx_out.stride[2];
    v50 = v29;
    v30 = *(_OWORD *)&v6->_hx_out.sequence_length;
    v51 = *(_OWORD *)&v6->_hx_out.channels;
    v52 = v30;
    v31 = *(_OWORD *)v6->_hx_out.dim;
    v45 = *(_OWORD *)&v6->_hx_out.data;
    v46 = v31;
    v32 = *(_OWORD *)v6->_hx_out.stride;
    v47 = *(_OWORD *)&v6->_hx_out.dim[2];
    v48 = v32;
    SetEspressoArray((uint64_t *)&v45, v27);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_cx_out"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *(_OWORD *)&v6->_cx_out.stride_batch_number;
    v53 = *(_OWORD *)&v6->_cx_out.stride_height;
    v54 = v34;
    v55 = *(_QWORD *)&v6->_cx_out.storage_type;
    v35 = *(_OWORD *)&v6->_cx_out.width;
    v49 = *(_OWORD *)&v6->_cx_out.stride[2];
    v50 = v35;
    v36 = *(_OWORD *)&v6->_cx_out.sequence_length;
    v51 = *(_OWORD *)&v6->_cx_out.channels;
    v52 = v36;
    v37 = *(_OWORD *)v6->_cx_out.dim;
    v45 = *(_OWORD *)&v6->_cx_out.data;
    v46 = v37;
    v38 = *(_OWORD *)v6->_cx_out.stride;
    v47 = *(_OWORD *)&v6->_cx_out.dim[2];
    v48 = v38;
    SetEspressoArray((uint64_t *)&v45, v33);

    v39 = v6;
  }

  return v6;
}

- (id)_asCinematographyDictionary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_versionString, CFSTR("version"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_step_i);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("_step_i"));

  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, &v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v11), "_asCinematographyDictionary", (_QWORD)v30);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, &v34, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("_network_detections"));

  -[PTCinematographyNetwork lastFocusDetection](self, "lastFocusDetection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_asCinematographyDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("_last_focus_detection"));

  v16 = *(_OWORD *)&self->_hx_out.stride_batch_number;
  v42 = *(_OWORD *)&self->_hx_out.stride_height;
  v43 = v16;
  v44 = *(_QWORD *)&self->_hx_out.storage_type;
  v17 = *(_OWORD *)&self->_hx_out.width;
  v38 = *(_OWORD *)&self->_hx_out.stride[2];
  v39 = v17;
  v18 = *(_OWORD *)&self->_hx_out.sequence_length;
  v40 = *(_OWORD *)&self->_hx_out.channels;
  v41 = v18;
  v19 = *(_OWORD *)self->_hx_out.dim;
  v34 = *(_OWORD *)&self->_hx_out.data;
  v35 = v19;
  v20 = *(_OWORD *)self->_hx_out.stride;
  v36 = *(_OWORD *)&self->_hx_out.dim[2];
  v37 = v20;
  CopyEspressoArray((int **)&v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("_hx_out"));

  v22 = *(_OWORD *)&self->_cx_out.stride_batch_number;
  v42 = *(_OWORD *)&self->_cx_out.stride_height;
  v43 = v22;
  v44 = *(_QWORD *)&self->_cx_out.storage_type;
  v23 = *(_OWORD *)&self->_cx_out.width;
  v38 = *(_OWORD *)&self->_cx_out.stride[2];
  v39 = v23;
  v24 = *(_OWORD *)&self->_cx_out.sequence_length;
  v40 = *(_OWORD *)&self->_cx_out.channels;
  v41 = v24;
  v25 = *(_OWORD *)self->_cx_out.dim;
  v34 = *(_OWORD *)&self->_cx_out.data;
  v35 = v25;
  v26 = *(_OWORD *)self->_cx_out.stride;
  v36 = *(_OWORD *)&self->_cx_out.dim[2];
  v37 = v26;
  CopyEspressoArray((int **)&v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("_cx_out"));

  v28 = (void *)objc_msgSend(v3, "copy");
  return v28;
}

- (unint64_t)_getLeastRecentNetworkDetectionIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int32_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  CMTime v21;
  CMTime time1;
  CMTime v23;

  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
    -[PTCinematographyNetwork _getLeastRecentNetworkDetectionIndex].cold.1();

  memset(&v23, 0, sizeof(v23));
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "time");
  else
    memset(&v23, 0, sizeof(v23));

  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 < 3)
    return 1;
  v9 = 1;
  v10 = 2;
  do
  {
    -[PTCinematographyNetwork networkDetections](self, "networkDetections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "time");
    else
      memset(&time1, 0, sizeof(time1));
    v21 = v23;
    v14 = CMTimeCompare(&time1, &v21);

    if (v14 < 0)
    {
      -[PTCinematographyNetwork networkDetections](self, "networkDetections");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
        objc_msgSend(v16, "time");
      else
        memset(&v21, 0, sizeof(v21));
      v23 = v21;

      v9 = v10;
    }
    ++v10;
    -[PTCinematographyNetwork networkDetections](self, "networkDetections", *(_OWORD *)&v21.value, v21.epoch, time1.value, *(_QWORD *)&time1.timescale, time1.epoch);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

  }
  while (v10 < v19);
  return v9;
}

- (void)_forgetNetworkDetectionAtIndex:(unint64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  -[PTCinematographyNetwork unusedIndexes](self, "unusedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsIndex:", a3);

  if ((v6 & 1) == 0)
  {
    -[PTCinematographyNetwork networkDetections](self, "networkDetections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setInvalid:", 1);

    -[PTCinematographyNetwork unusedIndexes](self, "unusedIndexes");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIndex:", a3);

  }
}

- (void)_forgetNetworkDetectionsOlderThan:(id *)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int32_t v11;
  void *v12;
  unint64_t v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  CMTime time1;

  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
  {
    v7 = 1;
    do
    {
      -[PTCinematographyNetwork networkDetections](self, "networkDetections");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        objc_msgSend(v9, "time");
      else
        memset(&time1, 0, sizeof(time1));
      v14 = *a3;
      v11 = CMTimeCompare(&time1, (CMTime *)&v14);

      if (v11 < 0)
        -[PTCinematographyNetwork _forgetNetworkDetectionAtIndex:](self, "_forgetNetworkDetectionAtIndex:", v7);
      ++v7;
      -[PTCinematographyNetwork networkDetections](self, "networkDetections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

    }
    while (v7 < v13);
  }
}

- (unint64_t)_allocateNetworkDetectionIndex
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[PTCinematographyNetwork unusedIndexes](self, "unusedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[PTCinematographyNetwork unusedIndexes](self, "unusedIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "firstIndex");

  }
  if (v4 >= self->_x_in.height)
    return -[PTCinematographyNetwork _getLeastRecentNetworkDetectionIndex](self, "_getLeastRecentNetworkDetectionIndex");
  else
    return v4;
}

- (void)_setMissingDetectionAtIndex:(unint64_t)a3 time:(id *)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  __int128 v11;
  int64_t var3;

  if (self->_x_in.height <= a3)
    -[PTCinematographyNetwork _setMissingDetectionAtIndex:time:].cold.3();
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") <= a3)
    -[PTCinematographyNetwork _setMissingDetectionAtIndex:time:].cold.2();

  if (a3)
  {
    _PTLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyNetwork _setMissingDetectionAtIndex:time:].cold.1();

  }
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  -[PTCinematographyNetwork _setDetection:asInputRow:time:missing:](self, "_setDetection:asInputRow:time:missing:", v10, a3, &v11, 1);

}

- (BOOL)_shouldResetDetectionFromType:(unint64_t)a3 toType:(unint64_t)a4
{
  if (a3 == 1 && a4 == 2)
    return 1;
  return a3 == 2 && a4 == 1;
}

- (void)_setNetworkDetection:(id)a3 atIndex:(unint64_t)a4 time:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  int64_t var3;

  v8 = a3;
  if (self->_x_in.height <= a4)
    -[PTCinematographyNetwork _setNetworkDetection:atIndex:time:].cold.3();
  v9 = v8;
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") < a4)
    -[PTCinematographyNetwork _setNetworkDetection:atIndex:time:].cold.1();

  _PTLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[PTCinematographyNetwork _setNetworkDetection:atIndex:time:].cold.2((uint64_t)v9, a4);

  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == a4)
    goto LABEL_12;
  -[PTCinematographyNetwork unusedIndexes](self, "unusedIndexes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsIndex:", a4) & 1) != 0)
  {
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "trackIdentifier");
  if (v16 != objc_msgSend(v9, "trackIdentifier"))
  {

    goto LABEL_11;
  }
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PTCinematographyNetwork _shouldResetDetectionFromType:toType:](self, "_shouldResetDetectionFromType:toType:", objc_msgSend(v17, "detectionType"), objc_msgSend(v9, "detectionType"));

  if (v18)
  {
LABEL_13:
    -[PTCinematographyNetwork unusedIndexes](self, "unusedIndexes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeIndex:", a4);

    v23 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    -[PTCinematographyNetwork _setDetection:asInputRow:time:missing:](self, "_setDetection:asInputRow:time:missing:", v9, a4, &v23, 0);
    bzero((char *)self->_hx_out.data + 4 * self->_hx_out.width * a4, 4 * self->_hx_out.width);
    bzero((char *)self->_cx_out.data + 4 * self->_cx_out.width * a4, 4 * self->_cx_out.width);
    goto LABEL_14;
  }
  v23 = *(_OWORD *)&a5->var0;
  var3 = a5->var3;
  -[PTCinematographyNetwork _setDetection:asInputRow:time:missing:](self, "_setDetection:asInputRow:time:missing:", v9, a4, &v23, 0);
LABEL_14:
  v20 = (void *)objc_msgSend(v9, "copy");
  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:atIndexedSubscript:", v20, a4);

}

- (void)_debugLogNetworkInputs
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  -[PTCinematographyNetwork networkDetections](self, "networkDetections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      if (*((float *)self->_mask_in.data + v5) == 1.0)
        _DebugLogEspressoBufferRow(&self->_x_in.data, v5);
      ++v5;
      -[PTCinematographyNetwork networkDetections](self, "networkDetections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

    }
    while (v5 < v7);
  }
}

- (void)_debugLogNetworkOutputs
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134218242;
  v3 = 0;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(&dword_1C9281000, v0, v1, "%zu: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

- (void)_debugLogAllNetworkInputs
{
  OUTLINED_FUNCTION_0_0(&dword_1C9281000, a1, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (id)earliestVersionString
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "firstExistingVersion:", &unk_1E8252D90);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(&unk_1E8252DA8, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)latestVersionString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(&unk_1E8252DC0, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "firstExistingVersion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(&unk_1E8252DD8, "lastObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (NSString)versionString
{
  return (NSString *)objc_getProperty(self, a2, 1224, 1);
}

- (PTCinematographyNetworkParameters)params
{
  return (PTCinematographyNetworkParameters *)objc_getProperty(self, a2, 1232, 1);
}

- (NSArray)inputSignals
{
  return (NSArray *)objc_getProperty(self, a2, 1240, 1);
}

- (PTCinematographyDetection)zeroDisparityDetection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 1248, 1);
}

- (NSMutableArray)networkDetections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1256, 1);
}

- (NSMutableIndexSet)unusedIndexes
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 1264, 1);
}

- (PTCinematographyDetection)lastFocusDetection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setLastFocusDetection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1272);
}

- (unint64_t)lastNetworkPredictionIndex
{
  return self->_lastNetworkPredictionIndex;
}

- (void)setLastNetworkPredictionIndex:(unint64_t)a3
{
  self->_lastNetworkPredictionIndex = a3;
}

- (int64_t)lastNetworkPredictionTrackID
{
  return self->_lastNetworkPredictionTrackID;
}

- (void)setLastNetworkPredictionTrackID:(int64_t)a3
{
  self->_lastNetworkPredictionTrackID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFocusDetection, 0);
  objc_storeStrong((id *)&self->_unusedIndexes, 0);
  objc_storeStrong((id *)&self->_networkDetections, 0);
  objc_storeStrong((id *)&self->_zeroDisparityDetection, 0);
  objc_storeStrong((id *)&self->_inputSignals, 0);
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
}

+ (void)firstExistingVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1C9281000, v0, v1, "unable to find espresso model for version in %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithVersionString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1C9281000, v0, v1, "cannot find espresso model for version %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithVersionString:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1C9281000, v0, v1, "malformed model.parameters.json for version %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithVersionString:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1C9281000, v0, v1, "Cinematography network version %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithNetwork:parameters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1C9281000, v0, v1, "espresso error loading network %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)stepWithFrameDetections:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "networkDetections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1C9281000, a3, v7, "ignoring network decision to focus on stale track: %@", v8);

  OUTLINED_FUNCTION_10();
}

- (void)stepWithFrameDetections:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(&dword_1C9281000, v0, v1, "network outputs:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)stepWithFrameDetections:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(&dword_1C9281000, v0, v1, "network inputs:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)stepWithFrameDetections:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(&dword_1C9281000, v0, v1, "network repeating last decision, but there is none, so autofocus", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)stepWithFrameDetections:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(&dword_1C9281000, v0, v1, "network repeating last decision", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)_updateLastNetworkPredictionIndex:(NSObject *)a3 time:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "networkDetections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1C9281000, a3, v7, "network forgetting stale detection: %@", v8);

  OUTLINED_FUNCTION_10();
}

- (void)_loadEspressoNetwork:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_15(&dword_1C9281000, a1, a3, "espresso error unable to create context for engine %d on default system device", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)_loadEspressoNetwork:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_15(&dword_1C9281000, a1, a3, "espresso error unable to create plan for engine %d on default system device", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)_loadEspressoNetwork:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a2, a3, "espresso error binding network (_x_in.height == %zd)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_loadEspressoNetwork:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1C9281000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_loadEspressoNetwork:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1C9281000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_loadEspressoNetwork:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1C9281000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_loadEspressoNetwork:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1C9281000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_loadEspressoNetwork:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1C9281000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_loadEspressoNetwork:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1C9281000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_loadEspressoNetwork:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1C9281000, v0, v1, "espresso error %d binding %@ to %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_loadEspressoNetwork:.cold.11()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_14(&dword_1C9281000, v0, v1, "espresso error %d building plan for %@");
  OUTLINED_FUNCTION_1();
}

- (void)_loadEspressoNetwork:.cold.12()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_14(&dword_1C9281000, v0, v1, "espresso error %d loading network %@");
  OUTLINED_FUNCTION_1();
}

- (void)_networkPredictionIndex
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1C9281000, v0, v1, "raw prediction: %zd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_detectionAtNetworkIndex:(uint64_t)a1 frameDetections:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "error: network predicts disabled index %@", v4, 0xCu);

  OUTLINED_FUNCTION_9();
}

- (void)_getLeastRecentNetworkDetectionIndex
{
  __assert_rtn("-[PTCinematographyNetwork _getLeastRecentNetworkDetectionIndex]", "PTCinematographyNetwork.m", 684, "self.networkDetections.count >= 2");
}

- (void)_setMissingDetectionAtIndex:time:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1C9281000, v0, v1, "_setMissingDetection[%ld]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setMissingDetectionAtIndex:time:.cold.2()
{
  __assert_rtn("-[PTCinematographyNetwork _setMissingDetectionAtIndex:time:]", "PTCinematographyNetwork.m", 731, "i < self.networkDetections.count");
}

- (void)_setMissingDetectionAtIndex:time:.cold.3()
{
  __assert_rtn("-[PTCinematographyNetwork _setMissingDetectionAtIndex:time:]", "PTCinematographyNetwork.m", 730, "i < _x_in.height");
}

- (void)_setNetworkDetection:atIndex:time:.cold.1()
{
  __assert_rtn("-[PTCinematographyNetwork _setNetworkDetection:atIndex:time:]", "PTCinematographyNetwork.m", 756, "i <= self.networkDetections.count");
}

- (void)_setNetworkDetection:(uint64_t)a1 atIndex:(uint64_t)a2 time:.cold.2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(&dword_1C9281000, v2, (uint64_t)v2, "_setNetworkDetection[%ld]: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_setNetworkDetection:atIndex:time:.cold.3()
{
  __assert_rtn("-[PTCinematographyNetwork _setNetworkDetection:atIndex:time:]", "PTCinematographyNetwork.m", 755, "i < _x_in.height");
}

@end
