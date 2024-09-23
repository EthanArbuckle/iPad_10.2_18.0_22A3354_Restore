@implementation PMLTrackerParsecAdapter

- (void)postMetricId:(unsigned int)a3 message:(id)a4
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  +[PMLTrackerParsecAdapter wrappedMessage:](PMLTrackerParsecAdapter, "wrappedMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_opt_class(), "_writeDataForTransparency:", v5) & 1) != 0)
  {
    objc_msgSend(v5, "data");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84DF8]), "initWithType:data:", 5, v6);
    PML_LogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      v12 = 138412546;
      v13 = v10;
      v14 = 2048;
      v15 = -[NSObject length](v6, "length");
      _os_log_debug_impl(&dword_2159BB000, v8, OS_LOG_TYPE_DEBUG, "Sending %@ (size: %tu) to Parsec.", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BE1FA70], "sharedSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendCustomFeedback:", v7);

  }
  else
  {
    PML_LogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_2159BB000, v6, OS_LOG_TYPE_ERROR, "Failed writing analytics log for data transparency. Skip upload", (uint8_t *)&v12, 2u);
    }
  }

}

+ (BOOL)_writeDataForTransparency:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  NSObject *v8;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "dataWithJSONObject:options:error:", v4, 1, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;

  if (v5)
  {
    v11 = v5;
    v7 = OSAWriteLogForSubmission();
    v8 = v11;
  }
  else
  {
    PML_LogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_error_impl(&dword_2159BB000, v8, OS_LOG_TYPE_ERROR, "Error serializing trystero envelope to JSON: %@", buf, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

+ (id)wrappedMessage:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "setEvaluation:", v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "setLogRegWeights:", v3);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "setLogRegGradient:", v3);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "setLinRegFeatureMatrix:", v3);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v4, "setLinRegObjectiveFeatures:", v3);
          }
          else
          {
            PML_LogHandle();
            v5 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v8 = v3;
              _os_log_error_impl(&dword_2159BB000, v5, OS_LOG_TYPE_ERROR, "Unsupported proto buf message: %@", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Unsupported proto buf message: %@"), v3);
          }
        }
      }
    }
  }

  return v4;
}

uint64_t __53__PMLTrackerParsecAdapter__writeDataForTransparency___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeData:", *(_QWORD *)(a1 + 32));
}

@end
