@implementation CLSCLIPprintModel

- (CLSCLIPprintModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSCLIPprintModel *v4;
  CLSCLIPprintModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSCLIPprintModel;
  v4 = -[CLSCLIPprintModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x54)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v6 = objc_opt_class();
        *(_DWORD *)buf = 67109378;
        v10 = a3;
        v11 = 2112;
        v12 = v6;
        _os_log_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
      }

      return 0;
    }
    else
    {
      -[CLSCLIPprintModel setupVersion84](v4, "setupVersion84");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSCLIPprintModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", +[CLSCLIPprintModel latestVersion](CLSCLIPprintModel, "latestVersion"));
}

- (void)setupVersion84
{
  self->_version = 84;
}

- (unint64_t)version
{
  return self->_version;
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  if (a3 >= 0x54)
    return 84;
  else
    return 0;
}

+ (NSString)name
{
  return (NSString *)CFSTR("CLIPprint");
}

+ (unint64_t)latestVersion
{
  return 84;
}

+ (int64_t)requiredCSUCLIPTextEncoderRevision
{
  return -1;
}

+ (id)encodeText:(id)a3 textEncoder:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__CLSCLIPprintModel_encodeText_textEncoder___block_invoke;
  v12[3] = &unk_25149B610;
  v15 = &v16;
  v8 = v7;
  v13 = v8;
  v9 = v5;
  v14 = v9;
  objc_msgSend(v6, "runOnInputText:completion:", v9, v12);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (id)encodeTextAverage:(id)a3 textEncoder:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  float *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  float *v27;
  float *v28;
  uint64_t v29;
  float v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  const char *v35;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[16];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        +[CLSCLIPprintModel encodeText:textEncoder:](CLSCLIPprintModel, "encodeText:textEncoder:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i), v6);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[CLSCLIPprintModel] CLIP Embedding for text failed batch", buf, 2u);
          }

          goto LABEL_33;
        }
        v14 = (void *)v13;
        objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v10);
  }

  if (!objc_msgSend(v7, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[CLSCLIPprintModel] CLIP Embedding for text returned no results", buf, 2u);
    }
LABEL_33:
    v33 = 0;
    goto LABEL_44;
  }
  objc_msgSend(v7, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  v17 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v16));
  v18 = objc_msgSend(v17, "mutableBytes");
  if (!v18)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[CLSCLIPprintModel] CLIP Embedding failed to create a mutable byte array", buf, 2u);
    }
    v33 = 0;
    goto LABEL_43;
  }
  v19 = (float *)v18;
  v37 = v17;
  v20 = v16 >> 2;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v7;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (!v21)
    goto LABEL_24;
  v22 = v21;
  v23 = *(_QWORD *)v40;
  if (v20 <= 1)
    v24 = 1;
  else
    v24 = v16 >> 2;
  while (2)
  {
    for (j = 0; j != v22; ++j)
    {
      if (*(_QWORD *)v40 != v23)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
      if (objc_msgSend(v26, "length") != v16)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
LABEL_42:

          v33 = 0;
          v17 = v37;
          goto LABEL_43;
        }
        *(_WORD *)buf = 0;
        v34 = MEMORY[0x24BDACB70];
        v35 = "[CLSCLIPprintModel] CLIP Embedding failed, inconsistent embedding length";
LABEL_46:
        _os_log_error_impl(&dword_244052000, v34, OS_LOG_TYPE_ERROR, v35, buf, 2u);
        goto LABEL_42;
      }
      v27 = (float *)objc_msgSend(objc_retainAutorelease(v26), "bytes");
      if (!v27)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_42;
        *(_WORD *)buf = 0;
        v34 = MEMORY[0x24BDACB70];
        v35 = "[CLSCLIPprintModel] CLIP Embedding failed to read embedding byte array";
        goto LABEL_46;
      }
      v28 = v19;
      v29 = v24;
      if (v16 >= 4)
      {
        do
        {
          v30 = *v27++;
          *v28 = v30 + *v28;
          ++v28;
          --v29;
        }
        while (v29);
      }
    }
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    v20 = v16 >> 2;
    if (v22)
      continue;
    break;
  }
LABEL_24:

  v31 = objc_msgSend(obj, "count");
  if (v16 >= 4)
  {
    if (v20 <= 1)
      v32 = 1;
    else
      v32 = v20;
    do
    {
      *v19 = (float)(1.0 / (float)v31) * *v19;
      ++v19;
      --v32;
    }
    while (v32);
  }
  v17 = v37;
  v33 = v37;
LABEL_43:

LABEL_44:
  return v33;
}

void __44__CLSCLIPprintModel_encodeText_textEncoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "clipTextEmbedding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __44__CLSCLIPprintModel_encodeText_textEncoder___block_invoke_2;
    v9[3] = &unk_25149B5E8;
    v11 = *(_QWORD *)(a1 + 48);
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v7, "accessDataUsingBlock:", v9);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[CLSCLIPprintModel] CLIP Embedding for text query %@ is nil, failed with error %@", buf, 0x16u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

intptr_t __44__CLSCLIPprintModel_encodeText_textEncoder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
