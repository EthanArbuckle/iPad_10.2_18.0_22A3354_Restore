@implementation PTCinematographyNetworkParameters

- (PTCinematographyNetworkParameters)initWithURL:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  NSObject *v8;
  PTCinematographyNetworkParameters *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PTCinematographyNetworkParameters *v18;
  NSSet *supportedDetectionTypes;
  void *v21;
  objc_super v22;
  id v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "open");
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithStream:options:error:", v5, 0, &v23);
  v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v7 = v23;
  if (v7)
  {
    _PTLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PTCinematographyNetworkParameters initWithURL:].cold.2();
LABEL_10:

    v18 = 0;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    _PTLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PTCinematographyNetworkParameters initWithURL:].cold.1(v6, (uint64_t)v4, v8);
    goto LABEL_10;
  }
  v22.receiver = self;
  v22.super_class = (Class)PTCinematographyNetworkParameters;
  v9 = -[PTCinematographyNetworkParameters init](&v22, sel_init);
  if (v9)
  {
    -[objc_class objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("expected_fps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v9->_expectedFPS = v11;

    -[objc_class objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("detections"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("forget_after_seconds"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v9->_forgetDetectionsAfterSeconds = v14;

    -[objc_class objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("sync_with_detector"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_runOnlyWhenDetectorDidRun = objc_msgSend(v15, "BOOLValue");

    -[objc_class objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("supported_detection_types"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
    else
      -[PTCinematographyNetworkParameters _defaultSupportedDetectionTypes](v9, "_defaultSupportedDetectionTypes");
    v17 = objc_claimAutoreleasedReturnValue();
    supportedDetectionTypes = v9->_supportedDetectionTypes;
    v9->_supportedDetectionTypes = (NSSet *)v17;

    -[objc_class objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("input_schemas"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyNetworkParameters _processInputSchemaDicts:](v9, "_processInputSchemaDicts:", v21);

  }
  self = v9;
  v18 = self;
LABEL_11:

  return v18;
}

- (void)_processInputSchemaDicts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PTCinematographyNetworkInputSchema *v12;
  PTCinematographyNetworkInputSchema *v13;
  NSArray *v14;
  NSArray *inputSchemas;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_totalInputFloatCount = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = [PTCinematographyNetworkInputSchema alloc];
        v13 = -[PTCinematographyNetworkInputSchema initWithModelDictionary:](v12, "initWithModelDictionary:", v11, (_QWORD)v16);
        objc_msgSend(v5, "addObject:", v13);
        self->_totalInputFloatCount += -[PTCinematographyNetworkInputSchema count](v13, "count");

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (NSArray *)objc_msgSend(v5, "copy");
  inputSchemas = self->_inputSchemas;
  self->_inputSchemas = v14;

}

- (id)_defaultSupportedDetectionTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E8252E98);
}

- (float)expectedFPS
{
  return self->_expectedFPS;
}

- (void)setExpectedFPS:(float)a3
{
  self->_expectedFPS = a3;
}

- (float)forgetDetectionsAfterSeconds
{
  return self->_forgetDetectionsAfterSeconds;
}

- (void)setForgetDetectionsAfterSeconds:(float)a3
{
  self->_forgetDetectionsAfterSeconds = a3;
}

- (BOOL)runOnlyWhenDetectorDidRun
{
  return self->_runOnlyWhenDetectorDidRun;
}

- (void)setRunOnlyWhenDetectorDidRun:(BOOL)a3
{
  self->_runOnlyWhenDetectorDidRun = a3;
}

- (NSSet)supportedDetectionTypes
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSupportedDetectionTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)inputSchemas
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInputSchemas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)totalInputFloatCount
{
  return self->_totalInputFloatCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputSchemas, 0);
  objc_storeStrong((id *)&self->_supportedDetectionTypes, 0);
}

- (void)initWithURL:(NSObject *)a3 .cold.1(objc_class *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  v8 = a2;
  OUTLINED_FUNCTION_0_8(&dword_1C9281000, a3, v6, "expected a dictionary, got a %@ from network parameters %@", v7);

}

- (void)initWithURL:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_4();
  v3 = v0;
  OUTLINED_FUNCTION_0_8(&dword_1C9281000, v1, (uint64_t)v1, "error %@ reading network parameters %@", v2);
}

@end
