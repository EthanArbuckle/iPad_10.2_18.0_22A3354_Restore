@implementation VGMLEspressoModel

+ (id)modelVersionWithNetworkFilePath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("properties"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("network_version"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("unknown");
  v8 = v7;

  return v8;
}

+ (id)modelVersionWithModelPath:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("model.espresso.net"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "modelVersionWithNetworkFilePath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (VGMLEspressoModel)initWithModelInfo:(id)a3
{
  id v4;
  VGMLEspressoModel *v5;
  uint64_t v6;
  NSString *networkFilePath;
  uint64_t v8;
  NSMutableArray *inputLayerNames;
  uint64_t v10;
  NSMutableArray *outputLayerNames;
  NSObject *v12;
  int v13;
  int v14;
  VGMLEspressoModel *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  NSMutableArray *inputBuffers;
  unint64_t v26;
  VGMLEspressoBuffer *v27;
  void *v28;
  VGMLEspressoBuffer *v29;
  uint64_t v30;
  NSMutableArray *outputBuffers;
  unint64_t v32;
  VGMLEspressoBuffer *v33;
  void *v34;
  VGMLEspressoBuffer *v35;
  std::runtime_error *exception;
  const char *v38;
  std::runtime_error *v39;
  const char *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)VGMLEspressoModel;
  v5 = -[VGMLEspressoModel init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("config"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("model_path"));
    v6 = objc_claimAutoreleasedReturnValue();
    networkFilePath = v5->_networkFilePath;
    v5->_networkFilePath = (NSString *)v6;

    if (v5->_networkFilePath)
    {
      objc_msgSend(v41, "valueForKeyPath:", CFSTR("input_name"));
      v8 = objc_claimAutoreleasedReturnValue();
      inputLayerNames = v5->_inputLayerNames;
      v5->_inputLayerNames = (NSMutableArray *)v8;

      objc_msgSend(v41, "valueForKeyPath:", CFSTR("output_name"));
      v10 = objc_claimAutoreleasedReturnValue();
      outputLayerNames = v5->_outputLayerNames;
      v5->_outputLayerNames = (NSMutableArray *)v10;

      v5->_numInputs = -[NSMutableArray count](v5->_inputLayerNames, "count");
      v5->_numOutputs = -[NSMutableArray count](v5->_outputLayerNames, "count");
      objc_msgSend(v41, "valueForKey:", CFSTR("engine"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = 65552;
      if ((-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("ANE")) & 1) != 0)
      {
        v14 = 10007;
      }
      else if ((-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("GPU")) & 1) != 0)
      {
        v14 = 5;
      }
      else
      {
        -[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("CPU"));
        v14 = 0;
        v13 = 65568;
      }
      v5->_engine = v14;
      v5->_storageFormat = v13;
      v5->_context = (void *)espresso_create_context();
      v5->_plan_flags = 0;
      v5->_plan = (void *)espresso_create_plan();
      -[NSString UTF8String](v5->_networkFilePath, "UTF8String");
      espresso_plan_add_network();
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v16 = v5->_inputLayerNames;
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v47 != v18)
              objc_enumerationMutation(v16);
            objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i)), "UTF8String");
            if (espresso_network_declare_input())
            {
              exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              espresso_plan_get_error_info();
              std::runtime_error::runtime_error(exception, v38);
              __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
            }
          }
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        }
        while (v17);
      }

      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v20 = v5->_outputLayerNames;
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v43 != v22)
              objc_enumerationMutation(v20);
            objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j)), "UTF8String");
            if (espresso_network_declare_output())
            {
              v39 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              espresso_plan_get_error_info();
              std::runtime_error::runtime_error(v39, v40);
              __cxa_throw(v39, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
            }
          }
          v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        }
        while (v21);
      }

      v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v5->_numInputs);
      inputBuffers = v5->_inputBuffers;
      v5->_inputBuffers = (NSMutableArray *)v24;

      if (v5->_numInputs)
      {
        v26 = 0;
        do
        {
          v27 = [VGMLEspressoBuffer alloc];
          -[NSMutableArray objectAtIndexedSubscript:](v5->_inputLayerNames, "objectAtIndexedSubscript:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[VGMLEspressoBuffer initWithNetwork:withLayerName:withMode:](v27, "initWithNetwork:withLayerName:withMode:", &v5->_network, v28, 0x10000);
          -[NSMutableArray setObject:atIndexedSubscript:](v5->_inputBuffers, "setObject:atIndexedSubscript:", v29, v26);

          ++v26;
        }
        while (v26 < v5->_numInputs);
      }
      v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v5->_numOutputs);
      outputBuffers = v5->_outputBuffers;
      v5->_outputBuffers = (NSMutableArray *)v30;

      if (v5->_numOutputs)
      {
        v32 = 0;
        do
        {
          v33 = [VGMLEspressoBuffer alloc];
          -[NSMutableArray objectAtIndexedSubscript:](v5->_outputLayerNames, "objectAtIndexedSubscript:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[VGMLEspressoBuffer initWithNetwork:withLayerName:withMode:](v33, "initWithNetwork:withLayerName:withMode:", &v5->_network, v34, 0x20000);
          -[NSMutableArray setObject:atIndexedSubscript:](v5->_outputBuffers, "setObject:atIndexedSubscript:", v35, v32);

          ++v32;
        }
        while (v32 < v5->_numOutputs);
      }
      espresso_plan_build();
      v15 = v5;
    }
    else
    {
      __VGLogSharedInstance();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v4;
        _os_log_impl(&dword_249CAD000, v12, OS_LOG_TYPE_ERROR, " No modelpath with info %@ ", buf, 0xCu);
      }
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VGMLEspressoModel)initWithModelPath:(id)a3
{
  id v4;
  VGMLEspressoModel *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VGMLEspressoModel;
  v5 = -[VGMLEspressoModel init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("config.plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithContentsOfFile:", v6);
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("model.espresso.net"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("config"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("model_path"));
    v5 = -[VGMLEspressoModel initWithModelInfo:](v5, "initWithModelInfo:", v9);

  }
  return v5;
}

- (VGMLEspressoModel)initWithNetworkFile:(id)a3
{
  id v4;
  VGMLEspressoModel *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  VGMLEspressoModel *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  objc_super v34;
  _QWORD v35[4];
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VGMLEspressoModel;
  v5 = -[VGMLEspressoModel init](&v34, sel_init);
  if (v5)
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v4, 0, &v33);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v33;
    if (v7)
    {
      v8 = v7;
      __VGLogSharedInstance();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v43 = v10;
        _os_log_impl(&dword_249CAD000, v9, OS_LOG_TYPE_ERROR, " Failed to read network file. %@ ", buf, 0xCu);

      }
      v11 = 0;
      goto LABEL_27;
    }
    v32 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v32);
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = v32;
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("properties"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v8 || !v12)
    {
      __VGLogSharedInstance();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v26 = " Properties field is missing in the network file. ";
    }
    else
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("network_version"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 == 0;

      if (v15)
      {
        __VGLogSharedInstance();
        v25 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          goto LABEL_25;
        *(_WORD *)buf = 0;
        v26 = " network_version field is missing in the network properties. ";
      }
      else
      {
        objc_msgSend(v13, "objectForKey:", CFSTR("engine"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        if (v17)
        {
          __VGLogSharedInstance();
          v25 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            goto LABEL_25;
          *(_WORD *)buf = 0;
          v26 = " engine field is missing in the network properties. ";
        }
        else
        {
          objc_msgSend(v13, "objectForKey:", CFSTR("input_name"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 == 0;

          if (!v19)
          {
            objc_msgSend(v13, "objectForKey:", CFSTR("output_name"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20 == 0;

            if (!v21)
            {
              v41[0] = v4;
              v40[0] = CFSTR("model_path");
              v40[1] = CFSTR("config");
              v35[0] = CFSTR("version");
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("network_version"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v31;
              v35[1] = CFSTR("engine");
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("engine"));
              v37 = objc_claimAutoreleasedReturnValue();
              v35[2] = CFSTR("input_name");
              v30 = (void *)v37;
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("input_name"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "componentsSeparatedByString:", CFSTR(","));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v28;
              v35[3] = CFSTR("output_name");
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("output_name"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(","));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v23;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, v35, 4);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v41[1] = v24;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
              v25 = objc_claimAutoreleasedReturnValue();

              v5 = -[VGMLEspressoModel initWithModelInfo:](v5, "initWithModelInfo:", v25);
              v11 = v5;
LABEL_26:

LABEL_27:
              goto LABEL_28;
            }
            __VGLogSharedInstance();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v26 = " output_name is missing in the network properties. ";
              goto LABEL_24;
            }
LABEL_25:
            v11 = 0;
            goto LABEL_26;
          }
          __VGLogSharedInstance();
          v25 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            goto LABEL_25;
          *(_WORD *)buf = 0;
          v26 = " input_name is missing in the network properties. ";
        }
      }
    }
LABEL_24:
    _os_log_impl(&dword_249CAD000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_25;
  }
  v11 = 0;
LABEL_28:

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)VGMLEspressoModel;
  -[VGMLEspressoModel dealloc](&v3, sel_dealloc);
}

- (void)inferModel
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (espresso_plan_execute_sync())
  {
    espresso_plan_get_error_info();
    v3 = v2;
    __VGLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = v3;
      _os_log_impl(&dword_249CAD000, v4, OS_LOG_TYPE_ERROR, " Espresso error: %s ", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (const)getInputDimensions:(unint64_t)a3
{
  void *v3;
  const unint64_t *v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_inputBuffers, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const unint64_t *)objc_msgSend(v3, "getDimensions");

  return v4;
}

- (const)getOutputDimensions:(unint64_t)a3
{
  void *v3;
  const unint64_t *v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_outputBuffers, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const unint64_t *)objc_msgSend(v3, "getDimensions");

  return v4;
}

- (unint64_t)getInputSize
{
  void *v2;
  unint64_t v3;

  -[NSMutableArray objectAtIndexedSubscript:](self->_inputBuffers, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getSize");

  return v3;
}

- (unint64_t)getOutputSize
{
  void *v2;
  unint64_t v3;

  -[NSMutableArray objectAtIndexedSubscript:](self->_outputBuffers, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getSize");

  return v3;
}

- (unint64_t)getOutputSize:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_outputBuffers, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getSize");

  return v4;
}

- (void)inferInputs:(id)a3 toOutputs:(id)a4
{
  id v6;
  unint64_t i;
  void *v8;
  void *v9;
  unint64_t j;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  for (i = 0; i < -[NSMutableArray count](self->_inputBuffers, "count"); ++i)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_inputBuffers, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bindTensor:", v9);

  }
  for (j = 0; j < -[NSMutableArray count](self->_outputBuffers, "count"); ++j)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_outputBuffers, "objectAtIndexedSubscript:", j);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", j);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bindTensor:", v12);

  }
  -[VGMLEspressoModel inferModel](self, "inferModel");

}

- (id)inferInputs:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  id v11;
  VGMLFloatIOData *v12;
  void *v13;

  v4 = a3;
  v5 = -[VGMLEspressoModel numOutputs](self, "numOutputs");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v5);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_outputBuffers, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "getSize");

      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 4 * v10);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = -[VGMLFloatIOData initWithSize:withData:]([VGMLFloatIOData alloc], "initWithSize:withData:", v10, objc_msgSend(v11, "mutableBytes"));
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v12, i);
      -[NSMutableArray objectAtIndexedSubscript:](self->_outputLayerNames, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v12, v13);

    }
  }
  -[VGMLEspressoModel inferInputs:toOutputs:](self, "inferInputs:toOutputs:", v4, v6);

  return v7;
}

- (unint64_t)numInputs
{
  return self->_numInputs;
}

- (unint64_t)numOutputs
{
  return self->_numOutputs;
}

- (NSString)networkFilePath
{
  return self->_networkFilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkFilePath, 0);
  objc_storeStrong((id *)&self->_outputBuffers, 0);
  objc_storeStrong((id *)&self->_inputBuffers, 0);
  objc_storeStrong((id *)&self->_outputLayerNames, 0);
  objc_storeStrong((id *)&self->_inputLayerNames, 0);
}

@end
