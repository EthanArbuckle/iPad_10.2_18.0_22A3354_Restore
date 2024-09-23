@implementation SCMLImageModelThresholds

+ (id)_validateScoreThresholdsJson:(id)a3 error:(id *)a4
{
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  _anonymous_namespace_ *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  id v18;
  id v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t i;
  void *v28;
  id obj;
  id v30;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _QWORD v46[12];

  v46[10] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_38;
  if ((v6 & 1) == 0
  {
    v46[0] = CFSTR("1.5.0");
    v46[1] = CFSTR("1.6.0");
    v46[2] = CFSTR("1.6.1");
    v46[3] = CFSTR("1.7.0");
    v46[4] = CFSTR("1.7.1");
    v46[5] = CFSTR("1.7.2");
    v46[6] = CFSTR("1.7.3");
    v46[7] = CFSTR("1.7.4");
    v46[8] = CFSTR("1.7.5");
    v46[9] = CFSTR("1.7.6");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 10);
  }
  {
LABEL_38:
    v20 = 0;
    goto LABEL_39;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v5;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (!v23)
    goto LABEL_34;
  v25 = *(_QWORD *)v40;
  while (2)
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v40 != v25)
        objc_enumerationMutation(obj);
      objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {

LABEL_37:
        goto LABEL_38;
      }
      {

        goto LABEL_37;
      }
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v30 = v28;
      v22 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v22)
      {
        v24 = *(_QWORD *)v36;
        while (2)
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v30);
            objc_msgSend(v30, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v9
                  v11 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v11, "allValues"),
                  v12 = (void *)objc_claimAutoreleasedReturnValue(),
                  v12,
                  v11,
                  (v13 & 1) == 0))
            {
              v14 = v9;
LABEL_36:

              goto LABEL_37;
            }
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v14 = v9;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
            if (v15)
            {
              v16 = *(_QWORD *)v32;
              while (2)
              {
                for (k = 0; k != v15; ++k)
                {
                  if (*(_QWORD *)v32 != v16)
                    objc_enumerationMutation(v14);
                  objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
                  v18 = (id)objc_claimAutoreleasedReturnValue();
                  if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v19 = v18;
                  }
                  else
                  {
                    v19 = 0;
                  }

                  if (!v19)
                  {

                    goto LABEL_36;
                  }
                }
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
                if (v15)
                  continue;
                break;
              }
            }

          }
          v22 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v22)
            continue;
          break;
        }
      }

    }
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v23)
      continue;
    break;
  }
LABEL_34:

  v20 = obj;
LABEL_39:

  return v20;
}

+ (id)_createThresholdDictionaryWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v5, "resourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v23[1] = CFSTR("Models/ImageModel/operating_thresholds_versioned.json");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPathComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v10, 0, &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v22;
  if (v11)
  {
    objc_msgSend(a1, "_validateScoreThresholdsJson:error:", v11, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SCMLLog handler](SCMLLog, "handler");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[SCMLImageModelThresholds _createThresholdDictionaryWithError:].cold.1((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);

    v13 = 0;
  }

  return v13;
}

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SCMLImageModelThresholds_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[SCMLImageModelThresholds instance]::onceToken != -1)
    dispatch_once(&+[SCMLImageModelThresholds instance]::onceToken, block);
  return (id)+[SCMLImageModelThresholds instance]::sharedCoder;
}

void __36__SCMLImageModelThresholds_instance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[SCMLImageModelThresholds instance]::sharedCoder;
  +[SCMLImageModelThresholds instance]::sharedCoder = (uint64_t)v1;

}

- (SCMLImageModelThresholds)init
{
  SCMLImageModelThresholds *v2;
  void *v3;
  id v4;
  void *v5;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCMLImageModelThresholds;
  v2 = -[SCMLImageModelThresholds init](&v8, sel_init);
  if (v2)
  {
    v7 = 0;
    +[SCMLImageModelThresholds _createThresholdDictionaryWithError:](SCMLImageModelThresholds, "_createThresholdDictionaryWithError:", &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    -[SCMLImageModelThresholds set_thresholdDict:](v2, "set_thresholdDict:", v3);

    if (v4)
    {
      v5 = (void *)objc_msgSend(v4, "copy");
      -[SCMLImageModelThresholds set_loadError:](v2, "set_loadError:", v5);

    }
    else
    {
      -[SCMLImageModelThresholds set_loadError:](v2, "set_loadError:", 0);
    }

  }
  return v2;
}

- (double)thresholdForLabel:(id)a3 classificationMode:(unint64_t)a4 modelVersion:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _anonymous_namespace_ *v20;
  _anonymous_namespace_ *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;

  v10 = a3;
  v11 = a5;
  -[SCMLImageModelThresholds _loadError](self, "_loadError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (objc_msgSend(v10, "hasPrefix:", CFSTR("otgx_")))
    {
      +[SCMLImageLabelCoder instance](SCMLImageLabelCoder, "instance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "decodeFromP1:", v10);
      v16 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v16;
    }
    -[SCMLImageModelThresholds _thresholdDict](self, "_thresholdDict");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      +[SCMLImageLabelCoder instance](SCMLImageLabelCoder, "instance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "encodeToHex:", v10);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "objectForKey:", v19);
      v20 = (_anonymous_namespace_ *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v23);
        v24 = objc_claimAutoreleasedReturnValue();

        -[_anonymous_namespace_ objectForKey:](v21, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          objc_msgSend(v25, "doubleValue");
          v13 = v27;
        }
        else
        {
          +[SCMLLog handler](SCMLLog, "handler");
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            -[SCMLImageModelThresholds thresholdForLabel:classificationMode:modelVersion:error:].cold.3(a4, v40);

          v13 = 1.1;
        }

      }
      else
      {
        +[SCMLLog handler](SCMLLog, "handler");
        v24 = objc_claimAutoreleasedReturnValue();
        v13 = 1.1;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[SCMLImageModelThresholds thresholdForLabel:classificationMode:modelVersion:error:].cold.2((uint64_t)v10, v24, v34, v35, v36, v37, v38, v39);
      }

    }
    else
    {
      +[SCMLLog handler](SCMLLog, "handler");
      v19 = objc_claimAutoreleasedReturnValue();
      v13 = 1.1;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[SCMLImageModelThresholds thresholdForLabel:classificationMode:modelVersion:error:].cold.1((uint64_t)v11, v19, v28, v29, v30, v31, v32, v33);
    }

    goto LABEL_20;
  }
  v13 = 1.1;
  if (a6)
  {
    -[SCMLImageModelThresholds _loadError](self, "_loadError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *a6 = (id)objc_msgSend(v14, "copy");
LABEL_20:

  }
  return v13;
}

- (NSDictionary)_thresholdDict
{
  return self->__thresholdDict;
}

- (void)set_thresholdDict:(id)a3
{
  objc_storeStrong((id *)&self->__thresholdDict, a3);
}

- (NSError)_loadError
{
  return self->__loadError;
}

- (void)set_loadError:(id)a3
{
  objc_storeStrong((id *)&self->__loadError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loadError, 0);
  objc_storeStrong((id *)&self->__thresholdDict, 0);
}

+ (void)_createThresholdDictionaryWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_245BFA000, a2, a3, "Failed to load json: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)thresholdForLabel:(uint64_t)a3 classificationMode:(uint64_t)a4 modelVersion:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_245BFA000, a2, a3, "Unsupported model version: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)thresholdForLabel:(uint64_t)a3 classificationMode:(uint64_t)a4 modelVersion:(uint64_t)a5 error:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_245BFA000, a2, a3, "Unsupported classification label: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)thresholdForLabel:(int)a1 classificationMode:(NSObject *)a2 modelVersion:error:.cold.3(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_245BFA000, a2, OS_LOG_TYPE_ERROR, "Unsupported classification mode: %d", (uint8_t *)v2, 8u);
}

@end
