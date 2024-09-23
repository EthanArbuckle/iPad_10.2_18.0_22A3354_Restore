@implementation PLXPCAgent

void __41__PLXPCAgent_logEventBackwardFrameCount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  if (objc_msgSend(v22, "count") == 6)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", *(_QWORD *)(a1 + 32));
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "integerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("reason"));

    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("bucket_0"));

    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("bucket_1"));

    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "objectAtIndexedSubscript:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("bucket_2"));

    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "objectAtIndexedSubscript:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "integerValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("bucket_3"));

    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "objectAtIndexedSubscript:", 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "integerValue"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("duration"));

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

- (void)logEventBackwardFrameCount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[8];
  NSObject *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("FrameCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __41__PLXPCAgent_logEventBackwardFrameCount___block_invoke;
    v16 = &unk_1E8581C38;
    v10 = v7;
    v17 = v10;
    v11 = v8;
    v18 = v11;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v13);

    if (objc_msgSend(v11, "count", v13, v14, v15, v16))
    {
      v20 = v10;
      v21[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v12, v10);

    }
  }
  else
  {
    PLLogXPC();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_ERROR, "Error, FrameCount is invalid", buf, 2u);
    }
  }

}

- (void)logEventPointBackgroundTransfer:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  if (a3)
  {
    v24 = (id)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("errorFailingURL"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("errorFailingURL"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("errorFailingURL"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "absoluteString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v9, CFSTR("errorFailingURL"));

      }
    }
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("BackgroundTransfer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v10, v24);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bytesReceived"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    if (v13 >= 101)
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bytesReceived"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "roundToSigFig:withSigFig:", objc_msgSend(v16, "intValue"), 2));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("bytesReceived"));

    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bytesSent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");

    if (v19 >= 101)
    {
      v20 = (void *)MEMORY[0x1E0CB37E8];
      v21 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bytesSent"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithInt:", objc_msgSend(v21, "roundToSigFig:withSigFig:", objc_msgSend(v22, "intValue"), 2));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, CFSTR("bytesSent"));

    }
    -[PLOperator logEntry:](self, "logEntry:", v11);

  }
}

- (void)logEventBackwardRenderPassCount:(id)a3
{
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
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") >= 0xA)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("bucket0"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("bucket1"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("bucket2"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("bucket3"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("bucket4"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("bucket5"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("bucket6"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("bucket7"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("bucket8"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("bucket9"));

  }
  PLLogXPC();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138412290;
    v19 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "RenderPassCount updated payload: %@", (uint8_t *)&v18, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("RenderData"), CFSTR("RenderPassCount"), v5);
}

- (void)logEventBackwardLayerCount:(id)a3
{
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
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") >= 0xA)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("bucket0"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("bucket1"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("bucket2"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("bucket3"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("bucket4"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("bucket5"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("bucket6"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("bucket7"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("bucket8"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("bucket9"));

  }
  PLLogXPC();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138412290;
    v19 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "layerCount updated payload: %@", (uint8_t *)&v18, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("RenderData"), CFSTR("LayerCount"), v5);
}

- (void)logEventPointCloudKit:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;

  v63 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("CloudKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v63);
  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("CKRequestUUIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("CKRequestUUIDs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("CKRequestUUIDs"));

  }
  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("MMCSRequestUUIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("MMCSRequestUUIDs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("MMCSRequestUUIDs"));

  }
  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("CKProtoRequestOperationsByCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("CKProtoRequestOperationsByCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("CKProtoRequestOperationsByCount"));

  }
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
  {
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("operationGroupID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("operationGroupID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");
      if (v24 >= 4)
        v25 = 4;
      else
        v25 = v24;
      objc_msgSend(v23, "substringToIndex:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("operationGroupID"));

    }
  }
  if ((objc_msgSend(MEMORY[0x1E0D80020], "internalBuild") & 1) == 0)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &stru_1E8587D00, CFSTR("operationID"));
    v27 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKBytesUploaded"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithInt:", (100 * ((int)(objc_msgSend(v28, "intValue") + 50) / 100)));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("CKBytesUploaded"));

    v30 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKBytesDownloaded"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithInt:", (100 * ((int)(objc_msgSend(v31, "intValue") + 50) / 100)));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("CKBytesDownloaded"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKRecordsUploaded"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "intValue");

    if (v34 >= 1001)
    {
      v35 = (void *)MEMORY[0x1E0CB37E8];
      v36 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKRecordsUploaded"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "numberWithInt:", objc_msgSend(v36, "roundToSigFig:withSigFig:", objc_msgSend(v37, "intValue"), 3));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, CFSTR("CKRecordsUploaded"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKRecordsDownloaded"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "intValue");

    if (v40 >= 1001)
    {
      v41 = (void *)MEMORY[0x1E0CB37E8];
      v42 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKRecordsDownloaded"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "numberWithInt:", objc_msgSend(v42, "roundToSigFig:withSigFig:", objc_msgSend(v43, "intValue"), 3));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("CKRecordsDownloaded"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKRecordsDeleted"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "intValue");

    if (v46 >= 1001)
    {
      v47 = (void *)MEMORY[0x1E0CB37E8];
      v48 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKRecordsDeleted"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "numberWithInt:", objc_msgSend(v48, "roundToSigFig:withSigFig:", objc_msgSend(v49, "intValue"), 3));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v50, CFSTR("CKRecordsDeleted"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKAssetsUploaded"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "intValue");

    if (v52 >= 101)
    {
      v53 = (void *)MEMORY[0x1E0CB37E8];
      v54 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKAssetsUploaded"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "numberWithInt:", objc_msgSend(v54, "roundToSigFig:withSigFig:", objc_msgSend(v55, "intValue"), 2));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v56, CFSTR("CKAssetsUploaded"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKAssetsDownloaded"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "intValue");

    if (v58 >= 101)
    {
      v59 = (void *)MEMORY[0x1E0CB37E8];
      v60 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKAssetsDownloaded"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "numberWithInt:", objc_msgSend(v60, "roundToSigFig:withSigFig:", objc_msgSend(v61, "intValue"), 2));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v62, CFSTR("CKAssetsDownloaded"));

    }
  }
  -[PLOperator logEntry:](self, "logEntry:", v5);

}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLXPCAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return &unk_1E864E4C0;
}

+ (BOOL)shouldLogiOSWatchOSOnly
{
  if (qword_1ED8859E8 != -1)
    dispatch_once(&qword_1ED8859E8, &__block_literal_global_571_0);
  return _MergedGlobals_1_67;
}

uint64_t __37__PLXPCAgent_shouldLogiOSWatchOSOnly__block_invoke()
{
  uint64_t result;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isiOS") & 1) != 0)
    result = 1;
  else
    result = objc_msgSend(MEMORY[0x1E0D80020], "isWatch");
  _MergedGlobals_1_67 = result;
  return result;
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[44];
  _QWORD v50[46];

  v50[44] = *MEMORY[0x1E0C80C00];
  v49[0] = CFSTR("TestMarker");
  objc_msgSend(a1, "entryEventPointDefinitionTestMarkers");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v48;
  v49[1] = CFSTR("DASyncStart");
  objc_msgSend(a1, "entryEventPointDefinitionDASyncStart");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v47;
  v49[2] = CFSTR("MailFetch");
  objc_msgSend(a1, "entryEventPointDefinitionMailFetch");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v46;
  v49[3] = CFSTR("NanoMailSession");
  objc_msgSend(a1, "entryEventPointDefinitionNanoMailSession");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v45;
  v49[4] = CFSTR("Jetsam");
  objc_msgSend(a1, "entryEventPointDefinitionJetsam");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v44;
  v49[5] = CFSTR("Symptoms-NetworkAdvisory");
  objc_msgSend(a1, "entryEventPointDefinitionsSymptomsNetworkAdvisory");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v43;
  v49[6] = CFSTR("BackgroundTransfer");
  objc_msgSend(a1, "entryEventPointDefinitionsBackgroundTransfer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v42;
  v49[7] = CFSTR("MobileBackupStatistics");
  objc_msgSend(a1, "entryEventPointDefinitionMobileBackupStatistics");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v41;
  v49[8] = CFSTR("MobileBackupEvents");
  objc_msgSend(a1, "entryEventPointDefinitionMobileBackupEvents");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v40;
  v49[9] = CFSTR("CloudKit");
  objc_msgSend(a1, "entryEventPointDefinitionCloudKit");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = v39;
  v49[10] = CFSTR("NetworkEnergyModel");
  objc_msgSend(a1, "entryEventPointDefinitionNetworkEnergyModel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[10] = v38;
  v49[11] = CFSTR("CacheDelete");
  objc_msgSend(a1, "entryEventPointDefinitionCacheDelete");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50[11] = v37;
  v49[12] = CFSTR("MachineTranslation");
  objc_msgSend(a1, "entryEventPointDefinitionMachineTranslation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v50[12] = v36;
  v49[13] = CFSTR("DeepScanReasons");
  objc_msgSend(a1, "entryEventPointDefinitionDeepScanReasons");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v50[13] = v35;
  v49[14] = CFSTR("AppActivationPerformanceActivationData");
  objc_msgSend(a1, "entryEventPointDefinitionAppActivationPerformanceActivationData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v50[14] = v34;
  v49[15] = CFSTR("AppActivationPerformanceProcessData");
  objc_msgSend(a1, "entryEventPointDefinitionAppActivationPerformanceProcessData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v50[15] = v33;
  v49[16] = CFSTR("AppActivationPerformanceCPUStatistics");
  objc_msgSend(a1, "entryEventPointDefinitionAppActivationPerformanceCPUStatistics");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50[16] = v32;
  v49[17] = CFSTR("AppActivationPerformanceMemoryStatistics");
  objc_msgSend(a1, "entryEventPointDefinitionAppActivationPerformanceMemoryStatistics");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50[17] = v31;
  v49[18] = CFSTR("AppActivationPerformancePowerStateStatistics");
  objc_msgSend(a1, "entryEventPointDefinitionAppActivationPerformancePowerStateStatistics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v50[18] = v30;
  v49[19] = CFSTR("OctagonTrust");
  objc_msgSend(a1, "entryEventPointDefinitionOctagonTrust");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v50[19] = v29;
  v49[20] = CFSTR("CKKSSyncingRateLimit");
  objc_msgSend(a1, "entryEventPointDefinitionCKKSSyncingRateLimit");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50[20] = v28;
  v49[21] = CFSTR("ShortcutsTriggerFired");
  objc_msgSend(a1, "entryEventPointDefinitionShortcutsTriggerFired");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v50[21] = v27;
  v49[22] = CFSTR("NetworkRelayBTLinkAssertion");
  objc_msgSend(a1, "entryEventPointDefinitionNetworkRelayBTLinkAssertion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[22] = v26;
  v49[23] = CFSTR("SleepLock");
  objc_msgSend(a1, "entryEventPointDefinitionSleepLock");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v50[23] = v25;
  v49[24] = CFSTR("WeatherNotificationState");
  objc_msgSend(a1, "entryEventPointDefinitionWeatherNotificationState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50[24] = v24;
  v49[25] = CFSTR("WeatherNotification");
  objc_msgSend(a1, "entryEventPointDefinitionWeatherNotification");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50[25] = v23;
  v49[26] = CFSTR("TerminusBTWake");
  objc_msgSend(a1, "entryEventPointDefinitionTerminusBTWake");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50[26] = v22;
  v49[27] = CFSTR("PortraitHighlightsResult");
  objc_msgSend(a1, "entryEventPointDefinitioPortraitHighlightsResult");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50[27] = v21;
  v49[28] = CFSTR("SpotlightHighlightsResult");
  objc_msgSend(a1, "entryEventPointDefinitionSpotlightHighlightsResult");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50[28] = v20;
  v49[29] = CFSTR("FocusFilters");
  objc_msgSend(a1, "entryEventPointDefinitionFocusFilters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50[29] = v19;
  v49[30] = CFSTR("DACalendarItemsDownloaded");
  objc_msgSend(a1, "entryEventPointDefinitionDACalendarItemsDownloaded");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v50[30] = v18;
  v49[31] = CFSTR("DACalendarItemsUploaded");
  objc_msgSend(a1, "entryEventPointDefinitionDACalendarItemsUploaded");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v50[31] = v17;
  v49[32] = CFSTR("navd");
  objc_msgSend(a1, "entryEventPointDefinitionNavd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50[32] = v16;
  v49[33] = CFSTR("MapsWidgetSession");
  objc_msgSend(a1, "entryEventPointDefinitionNavdMapsWidgetSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50[33] = v15;
  v49[34] = CFSTR("GEONetworkActivity");
  objc_msgSend(a1, "entryEventPointDefinitionNavdGeoNetworkActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v50[34] = v3;
  v49[35] = CFSTR("MapsNavigationStateEvent");
  objc_msgSend(a1, "entryEventPointDefinitionNavdMapsNavigationStateEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50[35] = v4;
  v49[36] = CFSTR("VehicularDetection");
  objc_msgSend(a1, "entryEventPointDefinitionLocationVehicularDetection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50[36] = v5;
  v49[37] = CFSTR("MotionWakeReason");
  objc_msgSend(a1, "entryEventPointDefinitionMotionWakeReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50[37] = v6;
  v49[38] = CFSTR("CommuteRefresh");
  objc_msgSend(a1, "entryEventPointDefinitionCommuteRefresh");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50[38] = v7;
  v49[39] = CFSTR("SecItem");
  objc_msgSend(a1, "entryEventPointDefinitionSecItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50[39] = v8;
  v49[40] = CFSTR("SiriActivation");
  objc_msgSend(a1, "entryEventPointDefinitionSiriActivication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50[40] = v9;
  v49[41] = CFSTR("SpotlightWatchdogFired");
  objc_msgSend(a1, "entryEventPointDefinitionSpotlightWatchdogFired");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50[41] = v10;
  v49[42] = CFSTR("AirPlayDiscoveryMode");
  objc_msgSend(a1, "entryEventPointDefinitionAirPlayDiscoveryMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50[42] = v11;
  v49[43] = CFSTR("ADD");
  objc_msgSend(a1, "entryEventPointDefinitionADD");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50[43] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 44);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)entryEventPointDefinitionADD
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
  _QWORD v12[3];
  _QWORD v13[3];
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("APWakeReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("reasonStartTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("reasonEndTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventPointDefinitionWeatherNotificationState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("severeNotificationEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("precipitationNotificationEnabled");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventPointDefinitionWeatherNotification
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
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1E8653A60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("channels");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("totalRelevantAlerts");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("totalPushes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("totalNotifications");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionSleepLock
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653A50;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionNetworkRelayBTLinkAssertion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("client");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("type");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventPointDefinitionTerminusBTWake
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("seqNo");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("spi");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventPointDefinitioPortraitHighlightsResult
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653A50;
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("limit");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("portraitResultCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("portraitCacheDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_DateFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionSpotlightHighlightsResult
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("spotlightResultCount");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionFocusFilters
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
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("ExtensionCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("Source");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("SemanticType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionNetworkEnergyModel
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitionDASyncStart
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8653A50;
  v16[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("AccountClass");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("AccountID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("AccountName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionDACalendarItemsDownloaded
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8653A50;
  v20[1] = MEMORY[0x1E0C9AAA0];
  v19[2] = *MEMORY[0x1E0D80330];
  v20[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("AccountClass");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("AccountID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("AccountName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("ContainerID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("NumberOfItemsChanged");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionDACalendarItemsUploaded
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8653A50;
  v20[1] = MEMORY[0x1E0C9AAA0];
  v19[2] = *MEMORY[0x1E0D80330];
  v20[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("AccountClass");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("AccountID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("AccountName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("ContainerID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("NumberOfItemsChanged");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionMailFetch
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1E8653A50;
  v22[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("account");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("cause");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("rx");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("tx");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("wifi");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionNanoMailSession
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isWatch"))
    return MEMORY[0x1E0C9AA70];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653A50;
  v18[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("Category");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat_withUnit_s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("Account type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("Network interface");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionTestMarkers
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("Status");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("TestName");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionJetsam
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653A50;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Level");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionsSymptomsNetworkAdvisory
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("advisoryKey");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("Network Type");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionsBackgroundTransfer
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[19];
  _QWORD v46[19];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[2];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  v49[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v47[0] = *MEMORY[0x1E0D80318];
  v47[1] = v2;
  v48[0] = &unk_1E8653A70;
  v48[1] = MEMORY[0x1E0C9AAA0];
  v47[2] = *MEMORY[0x1E0D80250];
  v48[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v44;
  v49[1] = *MEMORY[0x1E0D802F0];
  v45[0] = CFSTR("taskKind");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v42;
  v45[1] = CFSTR("taskID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v40;
  v45[2] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_StringFormat_withBundleID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v38;
  v45[3] = CFSTR("taskUUID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_StringFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v36;
  v45[4] = CFSTR("sessionID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_StringFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v34;
  v45[5] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v32;
  v45[6] = CFSTR("bytesSent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v30;
  v45[7] = CFSTR("bytesReceived");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v46[7] = v28;
  v45[8] = CFSTR("willRetry");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v46[8] = v26;
  v45[9] = CFSTR("previousFailureCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v46[9] = v24;
  v45[10] = CFSTR("interfaceName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_StringFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46[10] = v22;
  v45[11] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46[11] = v20;
  v45[12] = CFSTR("errorDomain");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_StringFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46[12] = v18;
  v45[13] = CFSTR("errorCFStreamErrorCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v46[13] = v16;
  v45[14] = CFSTR("errorCFStreamErrorDomain");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46[14] = v14;
  v45[15] = CFSTR("errorFailingURLSessionTask");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v46[15] = v4;
  v45[16] = CFSTR("errorFailingURL");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46[16] = v6;
  v45[17] = CFSTR("isDiscretionary");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46[17] = v8;
  v45[18] = CFSTR("isDataBudgetingEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46[18] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionNavd
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653A50;
  v12[1] = MEMORY[0x1E0C9AAA0];
  v11[2] = *MEMORY[0x1E0D80330];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("EventRequest");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionNavdMapsWidgetSession
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[4];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653A50;
  v18[1] = MEMORY[0x1E0C9AAA0];
  v17[2] = *MEMORY[0x1E0D80330];
  v18[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("StartUnix");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("EndUnix");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("ScreenLocked");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("TransportType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionNavdGeoNetworkActivity
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8653A50;
  v20[1] = MEMORY[0x1E0C9AAA0];
  v19[2] = *MEMORY[0x1E0D80330];
  v20[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("StartUnix");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("EndUnix");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("Client");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("NetworkingReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("RequestCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionNavdMapsNavigationStateEvent
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1E8653A80;
  v22[1] = MEMORY[0x1E0C9AAA0];
  v21[2] = *MEMORY[0x1E0D80330];
  v22[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("StartUnix");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("EndUnix");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("NightMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("NavigationType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("NavigationAppState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("NavigationMapType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionMobileBackupStatistics
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[20];
  _QWORD v48[20];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v51[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v49[0] = *MEMORY[0x1E0D80318];
  v49[1] = v2;
  v50[0] = &unk_1E8653A90;
  v50[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v46;
  v51[1] = *MEMORY[0x1E0D802F0];
  v47[0] = CFSTR("DomainName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_StringFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v44;
  v47[1] = CFSTR("DirectoryCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v42;
  v47[2] = CFSTR("FileCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v40;
  v47[3] = CFSTR("SymLinkCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v38;
  v47[4] = CFSTR("SparseFileCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v36;
  v47[5] = CFSTR("EncryptionKeyCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v34;
  v47[6] = CFSTR("DeletionMarkerCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v32;
  v47[7] = CFSTR("DataProtectionACount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v30;
  v47[8] = CFSTR("DataProtectionBCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v28;
  v47[9] = CFSTR("DataProtectionCCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[9] = v26;
  v47[10] = CFSTR("DataProtectionDCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48[10] = v24;
  v47[11] = CFSTR("SQLiteFileCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v48[11] = v22;
  v47[12] = CFSTR("TotalSQLiteFileSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48[12] = v20;
  v47[13] = CFSTR("TotalFileSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48[13] = v18;
  v47[14] = CFSTR("TotalResourceSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[14] = v16;
  v47[15] = CFSTR("TotalAttributeSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[15] = v14;
  v47[16] = CFSTR("RecordChurnPct");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v48[16] = v4;
  v47[17] = CFSTR("ContentChurnPct");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48[17] = v6;
  v47[18] = CFSTR("FailureCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48[18] = v8;
  v47[19] = CFSTR("BackupType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48[19] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionMobileBackupEvents
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8653A50;
  v20[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("end");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_DateFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("finished");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("hasError");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("start");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_DateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionAppActivationPerformanceActivationData
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[8];
  _QWORD v24[8];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v27[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v25[0] = *MEMORY[0x1E0D80318];
  v25[1] = v2;
  v26[0] = &unk_1E8653A50;
  v26[1] = MEMORY[0x1E0C9AAA0];
  v25[2] = *MEMORY[0x1E0D80250];
  v26[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v27[1] = *MEMORY[0x1E0D802F0];
  v23[0] = CFSTR("ActivationID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  v23[1] = CFSTR("UniqueID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  v23[2] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v16;
  v23[3] = CFSTR("ActivationDuration_ms");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v14;
  v23[4] = CFSTR("ActivationResult");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v4;
  v23[5] = CFSTR("ActivationType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v6;
  v23[6] = CFSTR("SystemUptime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v8;
  v23[7] = CFSTR("ActivationFlags");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionAppActivationPerformanceProcessData
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  v13[2] = *MEMORY[0x1E0D80250];
  v14[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("UniqueID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("ProcessName");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat_withProcessName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionAppActivationPerformanceCPUStatistics
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[14];
  _QWORD v36[14];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v39[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v37[0] = *MEMORY[0x1E0D80318];
  v37[1] = v2;
  v38[0] = &unk_1E8653A50;
  v38[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v34;
  v39[1] = *MEMORY[0x1E0D802F0];
  v35[0] = CFSTR("ActivationID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v32;
  v35[1] = CFSTR("UniqueID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v30;
  v35[2] = CFSTR("TotalCPU_ms");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v28;
  v35[3] = CFSTR("QOSDisabled_ms");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v26;
  v35[4] = CFSTR("QOSUserInteractive_ms");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v24;
  v35[5] = CFSTR("QOSUserInitiated_ms");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v22;
  v35[6] = CFSTR("QOSDefault_ms");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v20;
  v35[7] = CFSTR("QOSUtility_ms");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v18;
  v35[8] = CFSTR("QOSMaintenance_ms");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v16;
  v35[9] = CFSTR("QOSBackground_ms");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v14;
  v35[10] = CFSTR("IOReads_kb");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v4;
  v35[11] = CFSTR("IOWrites_kb");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[11] = v6;
  v35[12] = CFSTR("PageIns");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[12] = v8;
  v35[13] = CFSTR("ProcessLifecycleState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionAppActivationPerformanceMemoryStatistics
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[24];
  _QWORD v56[24];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[4];

  v60[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v59[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v57[0] = *MEMORY[0x1E0D80318];
  v57[1] = v2;
  v58[0] = &unk_1E8653A50;
  v58[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v54;
  v59[1] = *MEMORY[0x1E0D802F0];
  v55[0] = CFSTR("SequenceID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v52;
  v55[1] = CFSTR("ActivationID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v50;
  v55[2] = CFSTR("FreeQueue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v48;
  v55[3] = CFSTR("ActiveQueue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v46;
  v55[4] = CFSTR("InactiveQueue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v44;
  v55[5] = CFSTR("SpeculativeQueue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v42;
  v55[6] = CFSTR("ThrottledQueue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v40;
  v55[7] = CFSTR("WiredQueue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v38;
  v55[8] = CFSTR("PurgeableQueue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56[8] = v36;
  v55[9] = CFSTR("FileBackedQueue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v56[9] = v34;
  v55[10] = CFSTR("AnonymousQueue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[10] = v32;
  v55[11] = CFSTR("Faults");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v56[11] = v30;
  v55[12] = CFSTR("CopyOnWriteFault");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v56[12] = v28;
  v55[13] = CFSTR("ZeroFill");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v56[13] = v26;
  v55[14] = CFSTR("Reactivated");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v56[14] = v24;
  v55[15] = CFSTR("Purged");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56[15] = v22;
  v55[16] = CFSTR("TotalCompressed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v56[16] = v20;
  v55[17] = CFSTR("CompressorSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v56[17] = v18;
  v55[18] = CFSTR("Decompressions");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56[18] = v16;
  v55[19] = CFSTR("Compressions");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v56[19] = v14;
  v55[20] = CFSTR("PageIns");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v56[20] = v4;
  v55[21] = CFSTR("PageOuts");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v56[21] = v6;
  v55[22] = CFSTR("SwapIns");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56[22] = v8;
  v55[23] = CFSTR("SwapOuts");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56[23] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionAppActivationPerformancePowerStateStatistics
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653A50;
  v18[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("ActivationID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("CPU");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("DutyCycle");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionCloudKit
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[35];
  _QWORD v78[35];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[2];
  _QWORD v82[4];

  v82[2] = *MEMORY[0x1E0C80C00];
  v81[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v79[0] = *MEMORY[0x1E0D80318];
  v79[1] = v2;
  v80[0] = &unk_1E8653AA0;
  v80[1] = MEMORY[0x1E0C9AAA0];
  v79[2] = *MEMORY[0x1E0D80250];
  v80[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v76;
  v81[1] = *MEMORY[0x1E0D802F0];
  v77[0] = CFSTR("operationID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "commonTypeDict_StringFormat");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v74;
  v77[1] = CFSTR("operationType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "commonTypeDict_IntegerFormat");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v72;
  v77[2] = CFSTR("containerIdentifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "commonTypeDict_StringFormat");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v70;
  v77[3] = CFSTR("containerEnvironment");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "commonTypeDict_IntegerFormat");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v68;
  v77[4] = CFSTR("bundleIdentifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "commonTypeDict_StringFormat_withBundleID");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v78[4] = v66;
  v77[5] = CFSTR("sourceAppBundleIdentifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_StringFormat_withAppName");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v78[5] = v64;
  v77[6] = CFSTR("CKStartDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "commonTypeDict_DateFormat");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v78[6] = v62;
  v77[7] = CFSTR("CKDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "commonTypeDict_RealFormat");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v78[7] = v60;
  v77[8] = CFSTR("CKBytesUploaded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v78[8] = v58;
  v77[9] = CFSTR("CKBytesDownloaded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v78[9] = v56;
  v77[10] = CFSTR("CKConnections");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v78[10] = v54;
  v77[11] = CFSTR("CKConnectionsCreated");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v78[11] = v52;
  v77[12] = CFSTR("CKRecordsUploaded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v78[12] = v50;
  v77[13] = CFSTR("CKRecordsDownloaded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v78[13] = v48;
  v77[14] = CFSTR("CKRecordsDeleted");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v78[14] = v46;
  v77[15] = CFSTR("CKRetries");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v78[15] = v44;
  v77[16] = CFSTR("MMCSDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_RealFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v78[16] = v42;
  v77[17] = CFSTR("MMCSBytesUploaded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v78[17] = v40;
  v77[18] = CFSTR("MMCSBytesDownloaded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v78[18] = v38;
  v77[19] = CFSTR("MMCSConnections");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v78[19] = v36;
  v77[20] = CFSTR("MMCSConnectionsCreated");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v78[20] = v34;
  v77[21] = CFSTR("CKRequestUUIDs");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_StringFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v78[21] = v32;
  v77[22] = CFSTR("MMCSRequestUUIDs");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_StringFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v78[22] = v30;
  v77[23] = CFSTR("operationGroupID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_StringFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v78[23] = v28;
  v77[24] = CFSTR("operationGroupName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_StringFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v78[24] = v26;
  v77[25] = CFSTR("operationGroupQuantity");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v78[25] = v24;
  v77[26] = CFSTR("CKNumberOfRequests");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v78[26] = v22;
  v77[27] = CFSTR("MMCSNumberOfRequests");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v78[27] = v20;
  v77[28] = CFSTR("operationQualityOfService");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v78[28] = v18;
  v77[29] = CFSTR("CKProtoRequestOperationsByCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v78[29] = v16;
  v77[30] = CFSTR("CKAssetsUploaded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v78[30] = v14;
  v77[31] = CFSTR("CKAssetsUploadedFileSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v78[31] = v4;
  v77[32] = CFSTR("CKAssetsDownloaded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v78[32] = v6;
  v77[33] = CFSTR("CKAssetsDownloadedFileSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v78[33] = v8;
  v77[34] = CFSTR("ZoneNames");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v78[34] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 35);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionLocationVehicularDetection
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653A50;
  v12[1] = MEMORY[0x1E0C9AAA0];
  v11[2] = *MEMORY[0x1E0D80330];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Mode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionMotionWakeReason
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653A50;
  v12[1] = MEMORY[0x1E0C9AAA0];
  v11[2] = *MEMORY[0x1E0D80330];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("OscarWakeReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionCommuteRefresh
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[9];
  _QWORD v26[9];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[2];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  v29[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v27[0] = *MEMORY[0x1E0D80318];
  v27[1] = v2;
  v28[0] = &unk_1E8653A50;
  v28[1] = MEMORY[0x1E0C9AAA0];
  v27[2] = *MEMORY[0x1E0D80330];
  v28[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E0D802F0];
  v25[0] = CFSTR("LOIEntryDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  v25[1] = CFSTR("LOIExitDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  v25[2] = CFSTR("destinationLOI");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  v25[3] = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v16;
  v25[4] = CFSTR("networkRequest");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v14;
  v25[5] = CFSTR("notified");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v4;
  v25[6] = CFSTR("scheduledWakeup");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v6;
  v25[7] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v8;
  v25[8] = CFSTR("trigger");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionCacheDelete
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1E8653A50;
  v22[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("operationType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("urgencyLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("serviceName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("requestedBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("purgedBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionMachineTranslation
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v14[0] = *MEMORY[0x1E0D80318];
  v14[1] = v2;
  v15[0] = &unk_1E8653A50;
  v15[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D802A0];
  v14[2] = *MEMORY[0x1E0D80250];
  v14[3] = v3;
  v15[2] = MEMORY[0x1E0C9AAB0];
  v15[3] = &unk_1E86526D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("processName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withProcessName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("requestType");
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventPointDefinitionSecItem
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  v13[2] = *MEMORY[0x1E0D80330];
  v14[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("operation");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("AccessGroup");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionOctagonTrust
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653A50;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("operation");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionCKKSSyncingRateLimit
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("accessgroup");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("ratelimit");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionDeepScanReasons
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("AppLibraryID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("Reason");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionSiriActivication
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isWatch"))
    return MEMORY[0x1E0C9AA70];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  v13[2] = *MEMORY[0x1E0D80330];
  v14[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("event");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("mode");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionSpotlightWatchdogFired
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isMac"))
    return MEMORY[0x1E0C9AA70];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653A50;
  v12[1] = MEMORY[0x1E0C9AAA0];
  v11[2] = *MEMORY[0x1E0D80330];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("indexingWatchdogFired");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionShortcutsTriggerFired
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiOS"))
    return MEMORY[0x1E0C9AA70];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1E8653A50;
  v22[1] = MEMORY[0x1E0C9AAA0];
  v21[2] = *MEMORY[0x1E0D80250];
  v22[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("WFTriggerKind");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("WFActionCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("WFTriggerID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("WFWorkflowID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("WFWorkflowName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("WFAssociatedAppBundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat_withBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionAirPlayDiscoveryMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("Mode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[38];
  _QWORD v44[40];

  v44[38] = *MEMORY[0x1E0C80C00];
  v43[0] = CFSTR("UIKitKeyboard");
  objc_msgSend(a1, "entryEventForwardDefinitionUIKitKeyboard");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v42;
  v43[1] = CFSTR("UIKitActivity");
  objc_msgSend(a1, "entryEventForwardDefinitionUIKitActivity");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v41;
  v43[2] = CFSTR("SafariFetcher");
  objc_msgSend(a1, "entryEventForwardDefinitionSafariFetcher");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v40;
  v43[3] = CFSTR("AppAccessory");
  objc_msgSend(a1, "entryEventForwardDefinitionAppAccessory");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v39;
  v43[4] = CFSTR("InCallService");
  objc_msgSend(a1, "entryEventForwardDefinitionInCallService");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v38;
  v43[5] = CFSTR("WebApp");
  objc_msgSend(a1, "entryEventForwardDefinitionWebApp");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v37;
  v43[6] = CFSTR("ThermalLevel");
  objc_msgSend(a1, "entryEventForwardDefinitionThermalLevel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v36;
  v43[7] = CFSTR("AirDrop");
  objc_msgSend(a1, "entryEventForwardDefinitionAirDrop");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v35;
  v43[8] = CFSTR("AirDropSession");
  objc_msgSend(a1, "entryEventForwardDefinitionAirDropSession");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[8] = v34;
  v43[9] = CFSTR("Accessory");
  objc_msgSend(a1, "entryEventForwardDefinitionAccessory");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v44[9] = v33;
  v43[10] = CFSTR("UARPStatus");
  objc_msgSend(a1, "entryEventForwardDefinitionUARPStatus");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[10] = v32;
  v43[11] = CFSTR("CallScreeningEnabled");
  objc_msgSend(a1, "entryEventForwardCallScreeningEnabled");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v44[11] = v31;
  v43[12] = CFSTR("SOSKVSRateLimitingEvent");
  objc_msgSend(a1, "entryEventForwardDefinitionSOSKVSRateLimitingEvent");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[12] = v30;
  v43[13] = CFSTR("ThermalHiP");
  objc_msgSend(a1, "entryEventForwardDefinitionThermalHiP");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44[13] = v29;
  v43[14] = CFSTR("AppleBacklightBrightness");
  objc_msgSend(a1, "entryEventForwardDefinitionAppleBacklightBrightness");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[14] = v28;
  v43[15] = CFSTR("UIKitEclipse");
  objc_msgSend(a1, "entryEventForwardDefinitionUIKitEclipse");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v44[15] = v27;
  v43[16] = CFSTR("Dosimetry");
  +[PLXPCAgent entryEventForwardDefinitionsDosimetry](PLXPCAgent, "entryEventForwardDefinitionsDosimetry");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[16] = v26;
  v43[17] = CFSTR("SecondaryDisplay");
  objc_msgSend(a1, "entryEventForwardDefinitionSecondaryDisplay");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44[17] = v25;
  v43[18] = CFSTR("SleepMode");
  objc_msgSend(a1, "entryEventForwardDefinitionSleepMode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[18] = v24;
  v43[19] = CFSTR("SpatialAudio");
  objc_msgSend(a1, "entryEventForwardDefinitionSpatialAudio");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44[19] = v23;
  v43[20] = CFSTR("ThermalSensors");
  objc_msgSend(a1, "entryEventForwardDefinitionThermalSensors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[20] = v22;
  v43[21] = CFSTR("TelephonyState");
  objc_msgSend(a1, "entryEventForwardDefinitionTelephonyState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44[21] = v21;
  v43[22] = CFSTR("PreferredLink");
  objc_msgSend(a1, "entryEventForwardDefinitionPreferredLink");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[22] = v20;
  v43[23] = CFSTR("AudioRouting");
  objc_msgSend(a1, "entryEventForwardDefinitionAudioRouting");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44[23] = v19;
  v43[24] = CFSTR("WirelessSync");
  objc_msgSend(a1, "entryEventForwardDefinitionWirelessSync");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[24] = v18;
  v43[25] = CFSTR("EnhancedDiscovery");
  objc_msgSend(a1, "entryEventForwardDefinitionEnhancedDiscovery");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v44[25] = v17;
  v43[26] = CFSTR("Siri");
  objc_msgSend(a1, "entryEventForwardDefinitionSiri");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[26] = v16;
  v43[27] = CFSTR("UIKitAlert");
  objc_msgSend(a1, "entryEventForwardDefinitionUIKitAlert");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44[27] = v15;
  v43[28] = CFSTR("AccessoryMotion");
  objc_msgSend(a1, "entryEventForwardDefinitionAccessoryMotion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v44[28] = v3;
  v43[29] = CFSTR("MXDiscoveryLevel");
  objc_msgSend(a1, "entryEventForwardDefinitionMXDiscoveryLevel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44[29] = v4;
  v43[30] = CFSTR("RapidSecurityResponse");
  objc_msgSend(a1, "entryEventForwardDefinitionRapidSecurityResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44[30] = v5;
  v43[31] = CFSTR("CarPlay");
  objc_msgSend(a1, "entryEventForwardDefinitionCarPlay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44[31] = v6;
  v43[32] = CFSTR("CarPlayScreens");
  objc_msgSend(a1, "entryEventForwardDefinitionCarPlayScreens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44[32] = v7;
  v43[33] = CFSTR("NetworkRelay");
  objc_msgSend(a1, "entryEventForwardDefinitionNetworkRelay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44[33] = v8;
  v43[34] = CFSTR("NetworkRelayWiFiAssertion");
  objc_msgSend(a1, "entryEventForwardDefinitionNetworkRelayWiFiAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44[34] = v9;
  v43[35] = CFSTR("WatchPresence");
  objc_msgSend(a1, "entryEventForwardDefinitionWatchPresence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44[35] = v10;
  v43[36] = CFSTR("PasskeyAuthentication");
  objc_msgSend(a1, "entryEventForwardDefinitionPasskeyAuthentication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44[36] = v11;
  v43[37] = CFSTR("AvailabilityModes");
  objc_msgSend(a1, "entryEventForwardDefinitionAvailabilityModes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[37] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 38);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)entryEventForwardDefinitionAvailabilityModes
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
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = *MEMORY[0x1E0D80298];
  v18 = *MEMORY[0x1E0D80318];
  v19 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E0D802F0];
  v16[0] = CFSTR("Available");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_BoolFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v16[1] = CFSTR("ExtensionCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  v16[2] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  v16[3] = CFSTR("Source");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  v16[4] = CFSTR("SemanticType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionWatchPresence
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("Event");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("RSSI");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionUIKitKeyboard
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8653AB0;
  v16[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("Status");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("Keyboard-ID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("Process-ID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionUIKitEclipse
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiOS"))
    return MEMORY[0x1E0C9AA70];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("Mode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("Value");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionMXDiscoveryLevel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[3];
  _QWORD v32[5];

  v32[3] = *MEMORY[0x1E0C80C00];
  v31[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802A8];
  v29[0] = *MEMORY[0x1E0D80318];
  v29[1] = v2;
  v30[0] = &unk_1E8653A60;
  v30[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D80250];
  v30[2] = MEMORY[0x1E0C9AAB0];
  v4 = *MEMORY[0x1E0D802A0];
  v29[2] = v3;
  v29[3] = v4;
  v28[0] = CFSTR("Level");
  v28[1] = CFSTR("Client");
  v28[2] = CFSTR("OnBehalfOf");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v20;
  v31[1] = *MEMORY[0x1E0D802F0];
  v26[0] = CFSTR("ObjectHash");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_StringFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  v26[1] = CFSTR("Client");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat_withAppName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v16;
  v26[2] = CFSTR("Level");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v7;
  v31[2] = *MEMORY[0x1E0D802B0];
  v24[0] = CFSTR("key");
  v22 = CFSTR("OnBehalfOf");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat_withBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = CFSTR("value");
  v25[0] = v10;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commonTypeDict_StringFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)entryEventForwardDefinitionCarPlay
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
  _QWORD v12[3];
  _QWORD v13[3];
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiPhone"))
    return MEMORY[0x1E0C9AA70];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("Activated");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("Wireless");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("SessionID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventForwardDefinitionCarPlayScreens
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
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiPhone"))
    return MEMORY[0x1E0C9AA70];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1E8653A60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("Resume");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_BoolFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("SessionID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("ScreenUUID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("Size");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionSecondaryDisplay
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isiPad") & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0D80020], "isMac"))
  {
    return MEMORY[0x1E0C9AA70];
  }
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8653A50;
  v16[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("IsConnected");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("Codec");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("Transport");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionSpatialAudio
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[4];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v18[0] = *MEMORY[0x1E0D80318];
  v18[1] = v2;
  v19[0] = &unk_1E8653A80;
  v19[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D802A0];
  v18[2] = *MEMORY[0x1E0D80250];
  v18[3] = v3;
  v19[2] = MEMORY[0x1E0C9AAB0];
  v19[3] = &unk_1E86526E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E0D802F0];
  v16[0] = CFSTR("processName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withProcessName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = CFSTR("spatialAudio");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v16[2] = CFSTR("headTracking");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_BoolFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v9;
  v16[3] = CFSTR("up-mixing");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_BoolFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventForwardDefinitionTelephonyState
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitionAccessoryMotion
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8653A50;
  v16[1] = MEMORY[0x1E0C9AAA0];
  v15[2] = *MEMORY[0x1E0D80250];
  v16[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("client");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("tracking");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionPreferredLink
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitionAudioRouting
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("EventType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("ScanType");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionUIKitActivity
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653A50;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Status");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardDefinitionUIKitAlert
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653A50;
  v12[1] = MEMORY[0x1E0C9AAA0];
  v11[2] = *MEMORY[0x1E0D80330];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Status");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardDefinitionSafariFetcher
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("subevent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("item");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionAccessory
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[11];
  _QWORD v31[11];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  v34[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v32[0] = *MEMORY[0x1E0D80318];
  v32[1] = v2;
  v33[0] = &unk_1E8653A50;
  v33[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v27;
  v34[1] = *MEMORY[0x1E0D802F0];
  v30[0] = *MEMORY[0x1E0D33B18];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_BoolFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E0D33B78];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_StringFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v23;
  v30[2] = *MEMORY[0x1E0D33B68];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v21;
  v30[3] = *MEMORY[0x1E0D33B70];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_StringFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v19;
  v30[4] = *MEMORY[0x1E0D33BE0];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v17;
  v30[5] = *MEMORY[0x1E0D33B40];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v15;
  v30[6] = *MEMORY[0x1E0D33B50];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v3;
  v30[7] = *MEMORY[0x1E0D33BD8];
  v28 = *MEMORY[0x1E0D80358];
  v29 = &unk_1E8635358;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v4;
  v30[8] = *MEMORY[0x1E0D33BD0];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v6;
  v30[9] = *MEMORY[0x1E0D33B20];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v8;
  v30[10] = *MEMORY[0x1E0D33BF0];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionAppAccessory
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8653A50;
  v20[1] = MEMORY[0x1E0C9AAA0];
  v19[2] = *MEMORY[0x1E0D80250];
  v20[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = *MEMORY[0x1E0D33CD0];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_BoolFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = *MEMORY[0x1E0D33CC8];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = *MEMORY[0x1E0D33B78];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = *MEMORY[0x1E0D33CD8];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = *MEMORY[0x1E0D33AF8];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionUARPStatus
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[7];
  _QWORD v22[7];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];

  v26[2] = *MEMORY[0x1E0C80C00];
  v25[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v23[0] = *MEMORY[0x1E0D80318];
  v23[1] = v2;
  v24[0] = &unk_1E8653A50;
  v24[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E0D802F0];
  v21[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v21[1] = CFSTR("model");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v21[2] = CFSTR("requestOffset");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v21[3] = CFSTR("bytesTransferred");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v4;
  v21[4] = CFSTR("activeFWVers");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v21[5] = CFSTR("fwVersion");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v8;
  v21[6] = CFSTR("error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardCallScreeningEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitionAirDrop
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[4];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653A50;
  v18[1] = MEMORY[0x1E0C9AAA0];
  v17[2] = *MEMORY[0x1E0D80250];
  v18[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("Subevent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("bundleId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat_withBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("pid");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionAirDropSession
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
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = *MEMORY[0x1E0D80298];
  v18 = *MEMORY[0x1E0D80318];
  v19 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E0D802F0];
  v16[0] = CFSTR("FileSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v16[1] = CFSTR("Identifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  v16[2] = CFSTR("Interface");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  v16[3] = CFSTR("Subevent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  v16[4] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionSiri
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653A50;
  v12[1] = MEMORY[0x1E0C9AAA0];
  v11[2] = *MEMORY[0x1E0D80330];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("event");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardDefinitionInCallService
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8653A60;
  v20[1] = MEMORY[0x1E0C9AAA0];
  v19[2] = *MEMORY[0x1E0D80250];
  v20[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("kCallSubType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("providerIdentifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("video");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionWebApp
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8653A50;
  v16[1] = MEMORY[0x1E0C9AAA0];
  v15[2] = *MEMORY[0x1E0D80250];
  v16[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withAppName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("url");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionThermalLevel
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8653A50;
  v16[1] = MEMORY[0x1E0C9AAB0];
  v15[2] = *MEMORY[0x1E0D80300];
  v16[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("startOffset");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("thermalLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("pressureLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionThermalHiP
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653A50;
  v18[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("timeOffset");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("client");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionSOSKVSRateLimitingEvent
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8653A50;
  v16[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("AccessGroup");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("BadnessLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("peerShouldSend");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_BoolFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionAppleBacklightBrightness
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653A60;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("linearBrightness");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardDefinitionNetworkRelay
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("SessionID");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionNetworkRelayWiFiAssertion
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653A50;
  v18[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("WiFiWoWState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("WiFiClientType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("WiFiAssertionReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("WiFiAssertionClients");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionSleepMode
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8653A50;
  v16[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("specificState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("sleepScreenEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_BoolFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionsDosimetry
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isWatch"))
    return MEMORY[0x1E0C9AA70];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("noiseEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitionThermalSensors
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  _QWORD v29[11];
  _QWORD v30[11];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v33[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v31[0] = *MEMORY[0x1E0D80318];
  v31[1] = v2;
  v32[0] = &unk_1E8653A50;
  v32[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E0D802F0];
  v29[0] = CFSTR("TS0A");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v29[1] = CFSTR("TG0B");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  v29[2] = CFSTR("TSBa");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v22;
  v29[3] = CFSTR("TSBE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v20;
  v29[4] = CFSTR("TSBH");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v18;
  v29[5] = CFSTR("TSRM");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v16;
  v29[6] = CFSTR("TSBQ");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v14;
  v29[7] = CFSTR("TSBR");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v4;
  v29[8] = CFSTR("TSFC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v6;
  v29[9] = CFSTR("TSFD");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v8;
  v29[10] = CFSTR("PG0B");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionWirelessSync
{
  void *v3;
  void *v4;
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
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isTVOS") & 1) != 0)
    return MEMORY[0x1E0C9AA70];
  v20[0] = *MEMORY[0x1E0D80298];
  v18 = *MEMORY[0x1E0D80318];
  v19 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E0D802F0];
  v16[0] = CFSTR("HostClient");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_StringFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v16[1] = CFSTR("Service");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  v16[2] = CFSTR("ServiceInstanceID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v6;
  v16[3] = CFSTR("DurationSeconds");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v8;
  v16[4] = CFSTR("SyncStart");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionPasskeyAuthentication
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("AuthenticationDidStart");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitionEnhancedDiscovery
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("Enabled");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventForwardDefinitionRapidSecurityResponse
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
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[23];
  _QWORD v53[23];
  uint64_t v54;
  void *v55;
  _QWORD v56[2];
  _QWORD v57[4];

  v57[2] = *MEMORY[0x1E0C80C00];
  v56[0] = *MEMORY[0x1E0D80298];
  v54 = *MEMORY[0x1E0D80318];
  v55 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v51;
  v56[1] = *MEMORY[0x1E0D802F0];
  v52[0] = CFSTR("EventType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v49;
  v52[1] = CFSTR("event");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v47;
  v52[2] = CFSTR("RequestUUID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commonTypeDict_StringFormat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v45;
  v52[3] = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_StringFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v43;
  v52[4] = CFSTR("RollbackRecProcAttributedProc");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_StringFormat");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v41;
  v52[5] = CFSTR("failureReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_StringFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v39;
  v52[6] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_StringFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v37;
  v52[7] = CFSTR("updateType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v35;
  v52[8] = CFSTR("eventTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v33;
  v52[9] = CFSTR("targetOSVersion");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_StringFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53[9] = v31;
  v52[10] = CFSTR("installTonight");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_BoolFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[10] = v29;
  v52[11] = CFSTR("brainVersion");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_StringFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[11] = v27;
  v52[12] = CFSTR("MobileAssetAssetAudience");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_StringFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53[12] = v25;
  v52[13] = CFSTR("breadcrumbs");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_StringFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53[13] = v23;
  v52[14] = CFSTR("originalOSVersion");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53[14] = v21;
  v52[15] = CFSTR("forcedResetUptime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v53[15] = v19;
  v52[16] = CFSTR("initialForcedResetUptime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53[16] = v17;
  v52[17] = CFSTR("preRecoveryClientId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[17] = v15;
  v52[18] = CFSTR("recoveryInitiated");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_BoolFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53[18] = v13;
  v52[19] = CFSTR("controllerVersion");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v53[19] = v3;
  v52[20] = CFSTR("preConv");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v53[20] = v5;
  v52[21] = CFSTR("postConv");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53[21] = v7;
  v52[22] = CFSTR("fsckMetrics");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v53[22] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[21];
  _QWORD v27[23];

  v27[21] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("SiriAlarm");
  objc_msgSend(a1, "entryEventBackwardDefinitionSiriFalseAlarm");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v25;
  v26[1] = CFSTR("PeekPop");
  objc_msgSend(a1, "entryEventBackwardDefinitionPeekPop");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v24;
  v26[2] = CFSTR("AASSampling");
  objc_msgSend(a1, "entryEventBackwardDefinitionAttentionSampling");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v23;
  v26[3] = CFSTR("AASPolling");
  objc_msgSend(a1, "entryEventBackwardDefinitionAttentionPolling");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  v26[4] = CFSTR("AASService");
  objc_msgSend(a1, "entryEventBackwardDefinitionAttentionService");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v21;
  v26[5] = CFSTR("ODOff");
  objc_msgSend(a1, "entryEventBackwardDefinitionODOff");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v20;
  v26[6] = CFSTR("ODOn");
  objc_msgSend(a1, "entryEventBackwardDefinitionODOn");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v19;
  v26[7] = CFSTR("ODHN");
  objc_msgSend(a1, "entryEventBackwardDefinitionODHN");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v18;
  v26[8] = CFSTR("DRMaxRate");
  objc_msgSend(a1, "entryEventBackwardDefinitionDRMaxRate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v17;
  v26[9] = CFSTR("FrameCount");
  objc_msgSend(a1, "entryEventBackwardDefinitionFrameCount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v16;
  v26[10] = CFSTR("EnergyTelemetry");
  objc_msgSend(a1, "entryEventBackwardDefinitionEnergyTelemetry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v15;
  v26[11] = CFSTR("UbiquityAccountStatistics");
  objc_msgSend(a1, "entryEventBackwardDefinitionUbiquityAccountStatistics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[11] = v3;
  v26[12] = CFSTR("CKKSSyncing");
  objc_msgSend(a1, "entryEventBackwardDefinitionCKKSSyncing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[12] = v4;
  v26[13] = CFSTR("CallScreeningDuration");
  objc_msgSend(a1, "entryEventBackwardDefinitionCallScreeningDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[13] = v5;
  v26[14] = CFSTR("KeyboardSession");
  objc_msgSend(a1, "entryEventBackwardDefinitionKeyboardSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[14] = v6;
  v26[15] = CFSTR("KeyboardTrackpadResidencies");
  objc_msgSend(a1, "entryEventBackwardDefinitionTrackpadResidencies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[15] = v7;
  v26[16] = CFSTR("ActiveStylusInking");
  objc_msgSend(a1, "entryEventBackwardDefinitionActiveStylus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[16] = v8;
  v26[17] = CFSTR("PassiveStylusInking");
  objc_msgSend(a1, "entryEventBackwardDefinitionPassiveStylus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[17] = v9;
  v26[18] = CFSTR("VoicemailDuration");
  objc_msgSend(a1, "entryEventBackwardDefinitionVoicemailDuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[18] = v10;
  v26[19] = CFSTR("AVConference");
  objc_msgSend(a1, "entryEventBackwardDefinitionAVConference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[19] = v11;
  v26[20] = CFSTR("SpotlightQos");
  objc_msgSend(a1, "entryEventBackwardDefinitionSpotlightQos");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[20] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 21);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)entryEventBackwardDefinitionSiriFalseAlarm
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("numFalseWakeUp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("secondsSinceLastReport");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventBackwardDefinitionCallScreeningDuration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventBackwardDefinitionKeyboardSession
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1E8653A60;
  v22[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("WordsTapped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("CharactersTapped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("WordsPathed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("CharactersPathed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("TimeSpentTapTyping");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("TimeSpentPathTyping");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionTrackpadResidencies
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
    return MEMORY[0x1E0C9AA70];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8653A50;
  v20[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("SampleTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_RealFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("Active");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("Inactive");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("LowPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("Ready");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_RealFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionActiveStylus
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
    return MEMORY[0x1E0C9AA70];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8653A60;
  v20[1] = MEMORY[0x1E0C9AAA0];
  v19[2] = *MEMORY[0x1E0D80330];
  v20[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("Inking");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_RealFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("Hovering");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("NotTracking");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("SampleTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("TouchDownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionPassiveStylus
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
    return MEMORY[0x1E0C9AA70];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8653A60;
  v20[1] = MEMORY[0x1E0C9AAA0];
  v19[2] = *MEMORY[0x1E0D80330];
  v20[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("Inking");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_RealFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("Hovering");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("NotTracking");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("SampleTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("TouchDownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionVoicemailDuration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventBackwardDefinitionPeekPop
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653A50;
  v18[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("Process-ID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("PeekCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("PopCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("PeekDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_RealFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionSpotlightQos
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isMac"))
    return MEMORY[0x1E0C9AA70];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8653A50;
  v16[1] = MEMORY[0x1E0C9AAA0];
  v15[2] = *MEMORY[0x1E0D80330];
  v16[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("utiType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("qos");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitionAttentionSampling
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8653A50;
  v16[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("client");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("samplingRateMS");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("cumulativeSamplingTimeMS");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitionAttentionPolling
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A50;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("client");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("cumulativeSamplingTimeMS");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventBackwardDefinitionAttentionService
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8653A50;
  v20[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("singleShotsRequested");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("pollsRequested");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("cumulativeSamplingTimeMS");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("positiveOutcomes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("negativeOutcomes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionODOff
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  _QWORD v29[11];
  _QWORD v30[11];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v33[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v31[0] = *MEMORY[0x1E0D80318];
  v31[1] = v2;
  v32[0] = &unk_1E8653A60;
  v32[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E0D802F0];
  v29[0] = CFSTR("mach_absolute_time");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v29[1] = CFSTR("DR_0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  v29[2] = CFSTR("DR_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v22;
  v29[3] = CFSTR("DR_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v20;
  v29[4] = CFSTR("DR_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v18;
  v29[5] = CFSTR("DR_4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v16;
  v29[6] = CFSTR("DR_5");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v14;
  v29[7] = CFSTR("DR_6");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v4;
  v29[8] = CFSTR("DR_7");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v6;
  v29[9] = CFSTR("DR_8");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v8;
  v29[10] = CFSTR("DR_9");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionODOn
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  _QWORD v29[11];
  _QWORD v30[11];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v33[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v31[0] = *MEMORY[0x1E0D80318];
  v31[1] = v2;
  v32[0] = &unk_1E8653A60;
  v32[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E0D802F0];
  v29[0] = CFSTR("mach_absolute_time");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v29[1] = CFSTR("DR_0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  v29[2] = CFSTR("DR_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v22;
  v29[3] = CFSTR("DR_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v20;
  v29[4] = CFSTR("DR_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v18;
  v29[5] = CFSTR("DR_4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v16;
  v29[6] = CFSTR("DR_5");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v14;
  v29[7] = CFSTR("DR_6");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v4;
  v29[8] = CFSTR("DR_7");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v6;
  v29[9] = CFSTR("DR_8");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v8;
  v29[10] = CFSTR("DR_9");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionODHN
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653A60;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("mach_absolute_time");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("count");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventBackwardDefinitionDRMaxRate
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  _QWORD v29[11];
  _QWORD v30[11];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiPhone"))
    return MEMORY[0x1E0C9AA70];
  v33[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v31[0] = *MEMORY[0x1E0D80318];
  v31[1] = v2;
  v32[0] = &unk_1E8653A50;
  v32[1] = MEMORY[0x1E0C9AAA0];
  v31[2] = *MEMORY[0x1E0D80330];
  v32[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E0D802F0];
  v29[0] = CFSTR("mach_absolute_time");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v29[1] = CFSTR("DR_0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  v29[2] = CFSTR("DR_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v22;
  v29[3] = CFSTR("DR_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v20;
  v29[4] = CFSTR("DR_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v18;
  v29[5] = CFSTR("DR_4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v16;
  v29[6] = CFSTR("DR_5");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v14;
  v29[7] = CFSTR("DR_6");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v4;
  v29[8] = CFSTR("DR_7");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v6;
  v29[9] = CFSTR("DR_8");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v8;
  v29[10] = CFSTR("DR_9");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionFrameCount
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isiPhone"))
    return MEMORY[0x1E0C9AA70];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1E8653A50;
  v22[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("bucket_0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("bucket_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("bucket_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("bucket_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionEnergyTelemetry
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653A60;
  v18[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("slot_id");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("wall_energy_consumed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("system_energy_consumed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("adapter_family");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionUbiquityAccountStatistics
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
    return MEMORY[0x1E0C9AA70];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653A50;
  v18[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("totalNumberOfItems");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("totalNumberOfFaults");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("totalNumberOfDocuments");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("totalNumberOfDirectories");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionCKKSSyncing
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653A50;
  v18[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("operation");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("accessgroup");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("zone");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionAVConference
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1E8653A50;
  v22[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("ClientName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("ServiceName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("DRTN");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("DUPTYPE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("CONFIG");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("DCCFG");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[11];
  _QWORD v20[13];

  v20[11] = *MEMORY[0x1E0C80C00];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
  {
    v19[0] = CFSTR("AirTraffic_AssetDownload");
    objc_msgSend(a1, "entryEventIntervalDefinitionAirTrafficAssetDownload");
    v16 = objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    v19[1] = CFSTR("AnimatedStickerCreation");
    objc_msgSend(a1, "entryEventIntervalDefinitionAnimatedStickerCreation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v3;
    v19[2] = CFSTR("AnimatedStickerScoring");
    objc_msgSend(a1, "entryEventIntervalDefinitionAnimatedStickerScoring");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v4;
    v19[3] = CFSTR("CoreDuet_KnowledgeSync");
    objc_msgSend(a1, "entryEventIntervalDefinitionCoreDuetKnowledgeSync");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v5;
    v19[4] = CFSTR("MomentsDeferredProcessing");
    objc_msgSend(a1, "entryEventIntervalDefinitionMomentsDeferredProcessing");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[4] = v15;
    v19[5] = CFSTR("RapportReceivedMessage");
    objc_msgSend(a1, "entryEventIntervalDefinitionRapportReceivedMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[5] = v6;
    v19[6] = CFSTR("SpotlightIndexes");
    objc_msgSend(a1, "entryEventIntervalDefinitionSpotlightIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[6] = v7;
    v19[7] = CFSTR("SpotlightQueries");
    objc_msgSend(a1, "entryEventIntervalDefinitionSpotlightQueries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[7] = v8;
    v19[8] = CFSTR("StaticStickerCreation");
    objc_msgSend(a1, "entryEventIntervalDefinitionStaticStickerCreation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[8] = v9;
    v19[9] = CFSTR("StaticStickerScoring");
    objc_msgSend(a1, "entryEventIntervalDefinitionStaticStickerScoring");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[9] = v10;
    v19[10] = CFSTR("UserSafetyProcessing");
    objc_msgSend(a1, "entryEventIntervalDefinitionUserSafety");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[10] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)v16;
  }
  else
  {
    v17[0] = CFSTR("RapportReceivedMessage");
    objc_msgSend(a1, "entryEventIntervalDefinitionRapportReceivedMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v17[1] = CFSTR("SpotlightIndexes");
    objc_msgSend(a1, "entryEventIntervalDefinitionSpotlightIndexes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v3;
    v17[2] = CFSTR("SpotlightQueries");
    objc_msgSend(a1, "entryEventIntervalDefinitionSpotlightQueries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v4;
    v17[3] = CFSTR("UserSafetyProcessing");
    objc_msgSend(a1, "entryEventIntervalDefinitionUserSafety");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)entryEventIntervalDefinitionAirTrafficAssetDownload
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
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[11];
  _QWORD v29[11];
  uint64_t v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v32[0] = *MEMORY[0x1E0D80298];
  v30 = *MEMORY[0x1E0D80318];
  v31 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  v32[1] = *MEMORY[0x1E0D802F0];
  v28[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_DateFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  v28[1] = CFSTR("linkType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v23;
  v28[2] = CFSTR("dataclass");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v21;
  v28[3] = CFSTR("assetType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_StringFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v19;
  v28[4] = CFSTR("sumBytesRequested");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v17;
  v28[5] = CFSTR("countDownloadsBegun");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v15;
  v28[6] = CFSTR("countCanUseCellular");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v13;
  v28[7] = CFSTR("countIsForeground");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v3;
  v28[8] = CFSTR("sumBytesDownloaded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v5;
  v28[9] = CFSTR("countDownloadsSucceeded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v7;
  v28[10] = CFSTR("countDownloadsFailed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventIntervalDefinitionAnimatedStickerCreation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("ProcessedFrameCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("timestampEnd");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_DateFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventIntervalDefinitionAnimatedStickerScoring
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_DateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventIntervalDefinitionCoreDuetKnowledgeSync
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_DateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("isEmpty");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventIntervalDefinitionMomentsDeferredProcessing
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
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("ProcessingType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("ProcessedAssetCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("RequestedAssetCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_DateFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventIntervalDefinitionRapportReceivedMessage
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[8];
  _QWORD v24[8];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  v27[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v25[0] = *MEMORY[0x1E0D80318];
  v25[1] = v2;
  v26[0] = &unk_1E8653A50;
  v26[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v27[1] = *MEMORY[0x1E0D802F0];
  v23[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_DateFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  v23[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  v23[2] = CFSTR("bytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v16;
  v23[3] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v14;
  v23[4] = CFSTR("appID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v4;
  v23[5] = CFSTR("linkType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v6;
  v23[6] = CFSTR("messages");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v8;
  v23[7] = CFSTR("senderID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitionSpotlightIndexes
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v29;
  void *v30;
  _QWORD v31[12];
  _QWORD v32[12];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  v35[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v33[0] = *MEMORY[0x1E0D80318];
  v33[1] = v2;
  v34[0] = &unk_1E8653AA0;
  v34[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v30;
  v35[1] = *MEMORY[0x1E0D802F0];
  v31[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_DateFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v28;
  v31[1] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_StringFormat_withBundleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v26;
  v31[2] = CFSTR("IndexCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v24;
  v31[3] = CFSTR("DeletedCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v22;
  v31[4] = CFSTR("WatchdogCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v20;
  v31[5] = CFSTR("ClientMitigationCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v18;
  v31[6] = CFSTR("processName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v16;
  v31[7] = CFSTR("computeEmbeddings");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v14;
  v31[8] = CFSTR("computeKeyphrases");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v4;
  v31[9] = CFSTR("reindexItemCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[9] = v6;
  v31[10] = CFSTR("reindexAll");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[10] = v8;
  v31[11] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitionSpotlightQueries
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[4];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  v27[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v25[0] = *MEMORY[0x1E0D80318];
  v25[1] = v2;
  v26[0] = &unk_1E8653A80;
  v26[1] = MEMORY[0x1E0C9AAB0];
  v25[2] = *MEMORY[0x1E0D802A0];
  v24[0] = CFSTR("BundleID");
  v24[1] = CFSTR("ResultCount");
  v24[2] = CFSTR("StartQueryCount");
  v24[3] = CFSTR("CancelQueryCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v20;
  v27[1] = *MEMORY[0x1E0D802F0];
  v22[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_DateFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  v22[1] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  v22[2] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v14;
  v22[3] = CFSTR("StartQueryCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v4;
  v22[4] = CFSTR("CancelQueryCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v6;
  v22[5] = CFSTR("ResultCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v8;
  v22[6] = CFSTR("processName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitionStaticStickerCreation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_DateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventIntervalDefinitionStaticStickerScoring
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
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = *MEMORY[0x1E0D80298];
  v18 = *MEMORY[0x1E0D80318];
  v19 = &unk_1E8653A50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E0D802F0];
  v16[0] = CFSTR("IsOnDemand");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_BoolFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v16[1] = CFSTR("ProcessedAssetCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  v16[2] = CFSTR("StickerScoringAssetCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  v16[3] = CFSTR("VisualSearchAssetCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  v16[4] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_DateFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventIntervalDefinitionUserSafety
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653A60;
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("AssetType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("ClientBundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("EndTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_DateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("IsCacheReused");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[3];
  _QWORD v30[5];

  v30[3] = *MEMORY[0x1E0C80C00];
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
  {
    v29[0] = CFSTR("Aggregate");
    v27[0] = *MEMORY[0x1E0D80298];
    v3 = *MEMORY[0x1E0D80300];
    v25[0] = *MEMORY[0x1E0D80318];
    v25[1] = v3;
    v26[0] = &unk_1E8653A50;
    v26[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v4;
    v27[1] = *MEMORY[0x1E0D802F0];
    v23[0] = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "commonTypeDict_StringFormat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = CFSTR("count");
    v24[0] = v15;
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "commonTypeDict_RealFormat_aggregateFunction_sum");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v6;
    v27[2] = *MEMORY[0x1E0D80228];
    v21 = &unk_1E8653A40;
    v19 = *MEMORY[0x1E0D80220];
    v20 = &unk_1E8653AC0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = *MEMORY[0x1E0D80238];
    v28[2] = v8;
    v28[3] = &unk_1E8652700;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v9;
    v29[1] = CFSTR("KeyboardWordsAndCharacters");
    objc_msgSend(a1, "entryAggregateDefinitionKeyboardWordsAndCharacters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v10;
    v29[2] = CFSTR("KeyboardTime");
    objc_msgSend(a1, "entryAggregateDefinitionKeyboardTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = CFSTR("TouchEvents");
    objc_msgSend(a1, "entryAggregateDefinitionTouchEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)entryAggregateDefinitionKeyboardWordsAndCharacters
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[4];
  _QWORD v28[6];

  v28[4] = *MEMORY[0x1E0C80C00];
  v27[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v25[0] = *MEMORY[0x1E0D80318];
  v25[1] = v2;
  v26[0] = &unk_1E8653A50;
  v26[1] = MEMORY[0x1E0C9AAA0];
  v25[2] = *MEMORY[0x1E0D80330];
  v26[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v27[1] = *MEMORY[0x1E0D802F0];
  v23[0] = CFSTR("WordsTapped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v23[1] = CFSTR("CharactersTapped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  v23[2] = CFSTR("WordsPathed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v5;
  v23[3] = CFSTR("CharactersPathed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v8;
  v27[2] = *MEMORY[0x1E0D80228];
  v21 = &unk_1E8653AD0;
  v19 = *MEMORY[0x1E0D80220];
  v20 = &unk_1E8653AC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v10;
  v27[3] = *MEMORY[0x1E0D80238];
  v18[0] = CFSTR("WordsTapped");
  v18[1] = CFSTR("CharactersTapped");
  v18[2] = CFSTR("WordsPathed");
  v18[3] = CFSTR("CharactersPathed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryAggregateDefinitionKeyboardTime
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[4];
  _QWORD v24[6];

  v24[4] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1E8653A50;
  v22[1] = MEMORY[0x1E0C9AAA0];
  v21[2] = *MEMORY[0x1E0D80330];
  v22[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("TimeSpentTapTyping");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("TimeSpentPathTyping");
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  v23[2] = *MEMORY[0x1E0D80228];
  v17 = &unk_1E8653A40;
  v15 = *MEMORY[0x1E0D80220];
  v16 = &unk_1E8653AC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  v23[3] = *MEMORY[0x1E0D80238];
  v14[0] = CFSTR("TimeSpentTapTyping");
  v14[1] = CFSTR("TimeSpentPathTyping");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryAggregateDefinitionTouchEvents
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLXPCAgent)init
{
  PLXPCAgent *v2;
  uint64_t v3;
  NSMutableDictionary *localCache;
  uint64_t v5;
  NSMutableDictionary *inferenceEntries;
  uint64_t v7;
  NSMutableDictionary *summarizationEntries;
  id v9;
  uint64_t v10;
  PLXPCAgent *v11;
  uint64_t v12;
  PLNSNotificationOperatorComposition *MemoryWarningListener;
  _QWORD v15[4];
  PLXPCAgent *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PLXPCAgent;
  v2 = -[PLAgent init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    localCache = v2->_localCache;
    v2->_localCache = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    inferenceEntries = v2->_inferenceEntries;
    v2->_inferenceEntries = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    summarizationEntries = v2->_summarizationEntries;
    v2->_summarizationEntries = (NSMutableDictionary *)v7;

    if (+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly")
      && objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("MemoryPressureNotification"), 0))
    {
      v9 = objc_alloc(MEMORY[0x1E0D80010]);
      v10 = *MEMORY[0x1E0D803C0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __18__PLXPCAgent_init__block_invoke;
      v15[3] = &unk_1E8577F48;
      v11 = v2;
      v16 = v11;
      v12 = objc_msgSend(v9, "initWithOperator:forNotification:withBlock:", v11, v10, v15);
      MemoryWarningListener = v11->_MemoryWarningListener;
      v11->_MemoryWarningListener = (PLNSNotificationOperatorComposition *)v12;

    }
    v2->_lastLinearBrightness = -1;
  }
  return v2;
}

void __18__PLXPCAgent_init__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  if (v13)
  {
    v9 = *MEMORY[0x1E0D803C0];
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D803C0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v13, "objectForKeyedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logEventPointJetsam:", objc_msgSend(v12, "unsignedLongValue"));

    }
  }

}

- (void)initTaskOperatorDependancies
{
  id v3;
  uint64_t v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];

  v3 = objc_alloc(MEMORY[0x1E0D80090]);
  v4 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke;
  v42[3] = &unk_1E8578610;
  v42[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E4E8, v42);
  -[PLXPCAgent setNavdXPCListener:](self, "setNavdXPCListener:", v5);

  v41[0] = v4;
  v41[1] = 3221225472;
  v41[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1190;
  v41[3] = &unk_1E8578610;
  v41[4] = self;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E510, v41);
  -[PLXPCAgent setNavdXPCListener:](self, "setNavdXPCListener:", v6);

  v40[0] = v4;
  v40[1] = 3221225472;
  v40[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1196;
  v40[3] = &unk_1E8578610;
  v40[4] = self;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E538, v40);
  -[PLXPCAgent setNavdXPCListener:](self, "setNavdXPCListener:", v7);

  v39[0] = v4;
  v39[1] = 3221225472;
  v39[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1200;
  v39[3] = &unk_1E8578610;
  v39[4] = self;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E560, v39);
  -[PLXPCAgent setNavdXPCListener:](self, "setNavdXPCListener:", v8);

  v38[0] = v4;
  v38[1] = 3221225472;
  v38[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1205;
  v38[3] = &unk_1E8578610;
  v38[4] = self;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E588, v38);
  -[PLXPCAgent setDACalendarItemsDownloadedXPCListener:](self, "setDACalendarItemsDownloadedXPCListener:", v9);

  v37[0] = v4;
  v37[1] = 3221225472;
  v37[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1209;
  v37[3] = &unk_1E8578610;
  v37[4] = self;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E5B0, v37);
  -[PLXPCAgent setDACalendarItemsUploadedXPCListener:](self, "setDACalendarItemsUploadedXPCListener:", v10);

  if (+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
  {
    v36[0] = v4;
    v36[1] = 3221225472;
    v36[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1216;
    v36[3] = &unk_1E8578610;
    v36[4] = self;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E5D8, v36);
    -[PLXPCAgent setUIKitAlertXPCListener:](self, "setUIKitAlertXPCListener:", v11);

  }
  v35[0] = v4;
  v35[1] = 3221225472;
  v35[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1223;
  v35[3] = &unk_1E8578610;
  v35[4] = self;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E600, v35);
  -[PLXPCAgent setSiriXPCListener:](self, "setSiriXPCListener:", v12);

  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1227;
  v34[3] = &unk_1E8578610;
  v34[4] = self;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E628, v34);
  -[PLXPCAgent setNanoSiriXPCListener:](self, "setNanoSiriXPCListener:", v13);

  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1232;
  v33[3] = &unk_1E8578610;
  v33[4] = self;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E650, v33);
  -[PLXPCAgent setSpotlightQosXPCListener:](self, "setSpotlightQosXPCListener:", v14);

  v32[0] = v4;
  v32[1] = 3221225472;
  v32[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1236;
  v32[3] = &unk_1E8578610;
  v32[4] = self;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E678, v32);
  -[PLXPCAgent setSpotlightWatchdogFiredXPCListener:](self, "setSpotlightWatchdogFiredXPCListener:", v15);

  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1241;
  v31[3] = &unk_1E8578610;
  v31[4] = self;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E6A0, v31);
  -[PLXPCAgent setLocationVehicularDetectionXPCListener:](self, "setLocationVehicularDetectionXPCListener:", v16);

  v30[0] = v4;
  v30[1] = 3221225472;
  v30[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1245;
  v30[3] = &unk_1E8578610;
  v30[4] = self;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E6C8, v30);
  -[PLXPCAgent setMotionWakeReasonXPCListener:](self, "setMotionWakeReasonXPCListener:", v17);

  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1249;
  v29[3] = &unk_1E8578610;
  v29[4] = self;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E6F0, v29);
  -[PLXPCAgent setCommuteRefreshXPCListener:](self, "setCommuteRefreshXPCListener:", v18);

  v28[0] = v4;
  v28[1] = 3221225472;
  v28[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1254;
  v28[3] = &unk_1E8578610;
  v28[4] = self;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E718, v28);
  -[PLXPCAgent setSecItemXPCListener:](self, "setSecItemXPCListener:", v19);

  if (objc_msgSend(MEMORY[0x1E0D80020], "isiPhone"))
  {
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1259;
    v27[3] = &unk_1E8578610;
    v27[4] = self;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E740, v27);
    -[PLXPCAgent setDRMaxRateListener:](self, "setDRMaxRateListener:", v20);

  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
  {
    v26[0] = v4;
    v26[1] = 3221225472;
    v26[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1266;
    v26[3] = &unk_1E8578610;
    v26[4] = self;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E768, v26);
    -[PLXPCAgent setActiveStylusXPCListener:](self, "setActiveStylusXPCListener:", v21);

    v25[0] = v4;
    v25[1] = 3221225472;
    v25[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1272;
    v25[3] = &unk_1E8578610;
    v25[4] = self;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E790, v25);
    -[PLXPCAgent setPassiveStylusXPCListener:](self, "setPassiveStylusXPCListener:", v22);

  }
  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1277;
  v24[3] = &unk_1E8578610;
  v24[4] = self;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E7B8, v24);
  -[PLXPCAgent setWatchPresenceXPCListener:](self, "setWatchPresenceXPCListener:", v23);

}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Navd callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointNavd:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Navd Maps Widget Session callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointNavdMapsWidgetSession:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1196(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Navd GEO Network Activity callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointNavdGeoNetworkActivity:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Navd Navigation State Event callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointNavdMapsNavigationStateEvent:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1205(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "DACalendarItemsDownloaded callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointDACalendarItemsDownloaded:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1209(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "DACalendarItemsUploaded callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointDACalendarItemsUploaded:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1216(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "UIKit alert callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardUIKitAlert:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1223(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Siri Borealis callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSiri:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1227(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Siri Activation callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointSiriActivation:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1232(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "SpotlightQos callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardNameSpotlightQos:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1236(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "SpotlightWatchdog callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointNameSpotlightWatchdogFired:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1241(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Location Vehicular Detection Session callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointLocationVehicularDetectionSession:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1245(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "MotionWakeReason Session callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointMotionWakeReasonSession:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1249(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "CommuteRefresh Session callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointCommuteRefreshSession:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "SecItem Session callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointSecItemSession:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1259(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "DR MaxRate callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardDRMaxRate:", v6);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1266(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLLogXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "Active stylus payload received from %@, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardActiveStylus:", v8);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1272(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLLogXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "Passive stylus payload received from %@, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardPassiveStylus:", v8);
}

void __42__PLXPCAgent_initTaskOperatorDependancies__block_invoke_1277(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "WatchPresence payload, %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardWatchPresence:", v6);
}

- (void)initOperatorDependancies
{
  int v3;
  uint64_t v4;
  PLCFNotificationOperatorComposition *v5;
  PLCFNotificationOperatorComposition *gmsOptInListener;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  PLEntry *v125;
  PLEntry *lastDosimetryEntry;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  PLCFNotificationOperatorComposition *v146;
  PLCFNotificationOperatorComposition *ihaToggleListener;
  PLEntry *v148;
  void *v149;
  void *v150;
  void *v151;
  _QWORD v152[5];
  _QWORD v153[5];
  _QWORD v154[5];
  _QWORD v155[5];
  _QWORD v156[5];
  _QWORD v157[5];
  _QWORD v158[5];
  _QWORD v159[5];
  _QWORD v160[5];
  _QWORD v161[5];
  _QWORD v162[5];
  _QWORD v163[5];
  _QWORD v164[5];
  _QWORD v165[5];
  _QWORD v166[5];
  _QWORD v167[5];
  _QWORD v168[5];
  _QWORD v169[5];
  _QWORD v170[5];
  _QWORD v171[5];
  _QWORD v172[5];
  _QWORD v173[5];
  _QWORD v174[5];
  _QWORD v175[5];
  _QWORD v176[5];
  _QWORD v177[5];
  _QWORD v178[5];
  _QWORD v179[5];
  _QWORD v180[5];
  _QWORD v181[5];
  _QWORD v182[5];
  _QWORD v183[5];
  _QWORD v184[5];
  _QWORD v185[5];
  _QWORD v186[5];
  _QWORD v187[5];
  _QWORD v188[5];
  _QWORD v189[5];
  _QWORD v190[5];
  _QWORD v191[5];
  _QWORD v192[5];
  _QWORD v193[5];
  _QWORD v194[5];
  _QWORD v195[5];
  _QWORD v196[5];
  _QWORD v197[5];
  _QWORD v198[5];
  _QWORD v199[5];
  _QWORD v200[5];
  _QWORD v201[5];
  _QWORD v202[5];
  _QWORD v203[5];
  _QWORD v204[5];
  _QWORD v205[5];
  _QWORD v206[5];
  _QWORD v207[5];
  _QWORD v208[5];
  _QWORD v209[5];
  _QWORD v210[5];
  _QWORD v211[5];
  _QWORD v212[5];
  _QWORD v213[5];
  _QWORD v214[5];
  _QWORD v215[5];
  _QWORD v216[5];
  _QWORD v217[5];
  _QWORD v218[5];
  _QWORD v219[5];
  _QWORD v220[5];
  _QWORD v221[5];
  _QWORD v222[5];
  _QWORD v223[5];
  _QWORD v224[5];
  _QWORD v225[5];
  _QWORD v226[5];
  _QWORD v227[5];
  _QWORD v228[5];
  _QWORD v229[5];
  _QWORD v230[5];
  _QWORD v231[5];
  _QWORD v232[5];
  _QWORD v233[5];
  _QWORD v234[5];
  _QWORD v235[5];
  _QWORD v236[5];
  _QWORD v237[5];
  _QWORD v238[5];
  _QWORD v239[5];
  _QWORD v240[5];
  _QWORD v241[5];
  _QWORD v242[5];
  _QWORD v243[5];
  _QWORD v244[5];
  _QWORD v245[5];
  _QWORD v246[5];
  _QWORD v247[5];
  _QWORD v248[5];
  _QWORD v249[5];
  _QWORD v250[5];
  _QWORD v251[5];
  _QWORD v252[5];
  _QWORD v253[5];
  _QWORD v254[5];
  _QWORD v255[5];
  _QWORD v256[5];
  _QWORD v257[5];
  _QWORD v258[5];
  _QWORD v259[5];
  _QWORD v260[5];
  _QWORD v261[5];
  _QWORD v262[5];
  _QWORD v263[5];
  _QWORD v264[5];
  _QWORD v265[5];
  _QWORD v266[5];
  _QWORD v267[5];
  _QWORD v268[5];
  _QWORD v269[5];
  _QWORD v270[5];
  _QWORD v271[5];
  _QWORD v272[5];
  _QWORD v273[5];
  _QWORD v274[5];
  uint8_t buf[4];
  const __CFString *v276;
  __int16 v277;
  void *v278;
  uint64_t v279;

  v279 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D80020], "hasGenerativeModelSystems");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v274[0] = MEMORY[0x1E0C809B0];
    v274[1] = 3221225472;
    v274[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke;
    v274[3] = &unk_1E8577F48;
    v274[4] = self;
    v5 = (PLCFNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FF80]), "initWithOperator:forNotification:requireState:withBlock:", self, CFSTR("com.apple.CloudSubscriptionFeatures.OptIn.Changed"), 0, v274);
    gmsOptInListener = self->_gmsOptInListener;
    self->_gmsOptInListener = v5;

    v273[0] = v4;
    v273[1] = 3221225472;
    v273[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1285;
    v273[3] = &unk_1E8578610;
    v273[4] = self;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E7E0, v273);
    -[PLXPCAgent setAppleDiffusionListener:](self, "setAppleDiffusionListener:", v7);

    v272[0] = v4;
    v272[1] = 3221225472;
    v272[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1291;
    v272[3] = &unk_1E8578610;
    v272[4] = self;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E808, v272);
    -[PLXPCAgent setSummarizationListener:](self, "setSummarizationListener:", v8);

    v271[0] = v4;
    v271[1] = 3221225472;
    v271[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1297;
    v271[3] = &unk_1E8578610;
    v271[4] = self;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E830, v271);
    -[PLXPCAgent setAssetLoadGFListener:](self, "setAssetLoadGFListener:", v9);

    v270[0] = v4;
    v270[1] = 3221225472;
    v270[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1303;
    v270[3] = &unk_1E8578610;
    v270[4] = self;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E858, v270);
    -[PLXPCAgent setFileResidentInfoListener:](self, "setFileResidentInfoListener:", v10);

    v269[0] = v4;
    v269[1] = 3221225472;
    v269[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1309;
    v269[3] = &unk_1E8578610;
    v269[4] = self;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E880, v269);
    -[PLXPCAgent setHandwritingInferenceListener:](self, "setHandwritingInferenceListener:", v11);

    v268[0] = v4;
    v268[1] = 3221225472;
    v268[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1315;
    v268[3] = &unk_1E8578610;
    v268[4] = self;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E8A8, v268);
    -[PLXPCAgent setMmExecuteRequestListener:](self, "setMmExecuteRequestListener:", v12);

    v267[0] = v4;
    v267[1] = 3221225472;
    v267[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1321;
    v267[3] = &unk_1E8578610;
    v267[4] = self;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E8D0, v267);
    -[PLXPCAgent setTgiExecuteRequestListener:](self, "setTgiExecuteRequestListener:", v13);

    v266[0] = v4;
    v266[1] = 3221225472;
    v266[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1327;
    v266[3] = &unk_1E8578610;
    v266[4] = self;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E8F8, v266);
    -[PLXPCAgent setSmartReplySessionListener:](self, "setSmartReplySessionListener:", v14);

  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasANE"))
  {
    v265[0] = v4;
    v265[1] = 3221225472;
    v265[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1333;
    v265[3] = &unk_1E8578610;
    v265[4] = self;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E920, v265);
    -[PLXPCAgent setModelCompilationListener:](self, "setModelCompilationListener:", v15);

    v264[0] = v4;
    v264[1] = 3221225472;
    v264[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1341;
    v264[3] = &unk_1E8578610;
    v264[4] = self;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E948, v264);
    -[PLXPCAgent setModelInferenceListener:](self, "setModelInferenceListener:", v16);

    v263[0] = v4;
    v263[1] = 3221225472;
    v263[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1349;
    v263[3] = &unk_1E8578610;
    v263[4] = self;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E970, v263);
    -[PLXPCAgent setModelLoadListener:](self, "setModelLoadListener:", v17);

    v262[0] = v4;
    v262[1] = 3221225472;
    v262[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1357;
    v262[3] = &unk_1E8578610;
    v262[4] = self;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E998, v262);
    -[PLXPCAgent setModelUnLoadListener:](self, "setModelUnLoadListener:", v18);

    v261[0] = v4;
    v261[1] = 3221225472;
    v261[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1365;
    v261[3] = &unk_1E8578610;
    v261[4] = self;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E9C0, v261);
    -[PLXPCAgent setInstanceModelLoadListener:](self, "setInstanceModelLoadListener:", v19);

    v260[0] = v4;
    v260[1] = 3221225472;
    v260[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1373;
    v260[3] = &unk_1E8578610;
    v260[4] = self;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864E9E8, v260);
    -[PLXPCAgent setInstanceModelUnLoadListener:](self, "setInstanceModelUnLoadListener:", v20);

  }
  v259[0] = v4;
  v259[1] = 3221225472;
  v259[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1377;
  v259[3] = &unk_1E8577F48;
  v259[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v259);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLXPCAgent setBatteryLevelChangedNotifications:](self, "setBatteryLevelChangedNotifications:", v21);

  v258[0] = v4;
  v258[1] = 3221225472;
  v258[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1382;
  v258[3] = &unk_1E8578610;
  v258[4] = self;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EA10, v258);
  -[PLXPCAgent setMXDiscoveryLevelXPCListener:](self, "setMXDiscoveryLevelXPCListener:", v22);

  v257[0] = v4;
  v257[1] = 3221225472;
  v257[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1388;
  v257[3] = &unk_1E8578610;
  v257[4] = self;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EA38, v257);
  -[PLXPCAgent setAirPlayDiscoveryModeXPCListener:](self, "setAirPlayDiscoveryModeXPCListener:", v23);

  v256[0] = v4;
  v256[1] = 3221225472;
  v256[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1392;
  v256[3] = &unk_1E8578610;
  v256[4] = self;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EA60, v256);
  -[PLXPCAgent setCommuteRefreshXPCListener:](self, "setCommuteRefreshXPCListener:", v24);

  v255[0] = v4;
  v255[1] = 3221225472;
  v255[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1397;
  v255[3] = &unk_1E8578610;
  v255[4] = self;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EA88, v255);
  -[PLXPCAgent setTestMarkerXPCListener:](self, "setTestMarkerXPCListener:", v25);

  v254[0] = v4;
  v254[1] = 3221225472;
  v254[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1402;
  v254[3] = &unk_1E8578610;
  v254[4] = self;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EAB0, v254);
  -[PLXPCAgent setEnergyTelemetryXPCListener:](self, "setEnergyTelemetryXPCListener:", v26);

  if (objc_msgSend(MEMORY[0x1E0D80020], "isiOS"))
  {
    v253[0] = v4;
    v253[1] = 3221225472;
    v253[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1408;
    v253[3] = &unk_1E8578610;
    v253[4] = self;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EAD8, v253);
    -[PLXPCAgent setUIKitEclipseXPCListener:](self, "setUIKitEclipseXPCListener:", v27);

  }
  v252[0] = v4;
  v252[1] = 3221225472;
  v252[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1415;
  v252[3] = &unk_1E8578610;
  v252[4] = self;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EB00, v252);
  -[PLXPCAgent setSleepModeXPCListener:](self, "setSleepModeXPCListener:", v28);

  v251[0] = v4;
  v251[1] = 3221225472;
  v251[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1419;
  v251[3] = &unk_1E8578610;
  v251[4] = self;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EB28, v251);
  -[PLXPCAgent setSleepLockXPCListener:](self, "setSleepLockXPCListener:", v29);

  v250[0] = v4;
  v250[1] = 3221225472;
  v250[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1424;
  v250[3] = &unk_1E8578610;
  v250[4] = self;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EB50, v250);
  -[PLXPCAgent setWeatherNotificationStateXPCListener:](self, "setWeatherNotificationStateXPCListener:", v30);

  v249[0] = v4;
  v249[1] = 3221225472;
  v249[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1428;
  v249[3] = &unk_1E8578610;
  v249[4] = self;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EB78, v249);
  -[PLXPCAgent setWeatherNotificationXPCListener:](self, "setWeatherNotificationXPCListener:", v31);

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isiPad") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isMac"))
  {
    v248[0] = v4;
    v248[1] = 3221225472;
    v248[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1435;
    v248[3] = &unk_1E8578610;
    v248[4] = self;
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EBA0, v248);
    -[PLXPCAgent setSecondaryDisplayXPCListener:](self, "setSecondaryDisplayXPCListener:", v32);

  }
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
  {
    v247[0] = v4;
    v247[1] = 3221225472;
    v247[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1441;
    v247[3] = &unk_1E8578610;
    v247[4] = self;
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EBC8, v247);
    -[PLXPCAgent setUIKitKeyboardXPCListener:](self, "setUIKitKeyboardXPCListener:", v33);

    v246[0] = v4;
    v246[1] = 3221225472;
    v246[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1447;
    v246[3] = &unk_1E8578610;
    v246[4] = self;
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EBF0, v246);
    -[PLXPCAgent setUIKitActivityXPCListener:](self, "setUIKitActivityXPCListener:", v34);

    v245[0] = v4;
    v245[1] = 3221225472;
    v245[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1451;
    v245[3] = &unk_1E8578610;
    v245[4] = self;
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EC18, v245);
    -[PLXPCAgent setDASyncStartXPCListener:](self, "setDASyncStartXPCListener:", v35);

  }
  v244[0] = v4;
  v244[1] = 3221225472;
  v244[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1457;
  v244[3] = &unk_1E8578610;
  v244[4] = self;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EC40, v244);
  -[PLXPCAgent setLinkAdvisoryXPCListener:](self, "setLinkAdvisoryXPCListener:", v36);

  v243[0] = v4;
  v243[1] = 3221225472;
  v243[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1463;
  v243[3] = &unk_1E8578610;
  v243[4] = self;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EC68, v243);
  -[PLXPCAgent setRCSSessionManagementXPCListener:](self, "setRCSSessionManagementXPCListener:", v37);

  v242[0] = v4;
  v242[1] = 3221225472;
  v242[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1469;
  v242[3] = &unk_1E8578610;
  v242[4] = self;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EC90, v242);
  -[PLXPCAgent setVkDataScannerListener:](self, "setVkDataScannerListener:", v38);

  v241[0] = v4;
  v241[1] = 3221225472;
  v241[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1475;
  v241[3] = &unk_1E8578610;
  v241[4] = self;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864ECB8, v241);
  -[PLXPCAgent setAlbumAnimationListener:](self, "setAlbumAnimationListener:", v39);

  v240[0] = v4;
  v240[1] = 3221225472;
  v240[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1481;
  v240[3] = &unk_1E8578610;
  v240[4] = self;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864ECE0, v240);
  -[PLXPCAgent setAlbumMotionListener:](self, "setAlbumMotionListener:", v40);

  v239[0] = v4;
  v239[1] = 3221225472;
  v239[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1486;
  v239[3] = &unk_1E8578610;
  v239[4] = self;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864ED08, v239);
  -[PLXPCAgent setCallScreeningDurationListener:](self, "setCallScreeningDurationListener:", v41);

  v238[0] = v4;
  v238[1] = 3221225472;
  v238[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1490;
  v238[3] = &unk_1E8578610;
  v238[4] = self;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864ED30, v238);
  -[PLXPCAgent setCallScreeningEnabledListener:](self, "setCallScreeningEnabledListener:", v42);

  if (objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
  {
    v237[0] = v4;
    v237[1] = 3221225472;
    v237[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1496;
    v237[3] = &unk_1E8578610;
    v237[4] = self;
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864ED58, v237);
    -[PLXPCAgent setKeyboardTrackpadXPCListener:](self, "setKeyboardTrackpadXPCListener:", v43);

  }
  v236[0] = v4;
  v236[1] = 3221225472;
  v236[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1500;
  v236[3] = &unk_1E8578610;
  v236[4] = self;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864ED80, v236);
  -[PLXPCAgent setVoicemailDurationListener:](self, "setVoicemailDurationListener:", v44);

  v235[0] = v4;
  v235[1] = 3221225472;
  v235[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1507;
  v235[3] = &unk_1E8578610;
  v235[4] = self;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EDA8, v235);
  -[PLXPCAgent setKeyboardSessionXPCListener:](self, "setKeyboardSessionXPCListener:", v45);

  v234[0] = v4;
  v234[1] = 3221225472;
  v234[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1513;
  v234[3] = &unk_1E8578610;
  v234[4] = self;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EDD0, v234);
  -[PLXPCAgent setRenderPassCountXPCListener:](self, "setRenderPassCountXPCListener:", v46);

  v233[0] = v4;
  v233[1] = 3221225472;
  v233[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1519;
  v233[3] = &unk_1E8578610;
  v233[4] = self;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EDF8, v233);
  -[PLXPCAgent setLayerCountXPCListener:](self, "setLayerCountXPCListener:", v47);

  v232[0] = v4;
  v232[1] = 3221225472;
  v232[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1524;
  v232[3] = &unk_1E8578610;
  v232[4] = self;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EE20, v232);
  -[PLXPCAgent setMomentsDeferredProcessingListener:](self, "setMomentsDeferredProcessingListener:", v48);

  v231[0] = v4;
  v231[1] = 3221225472;
  v231[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1530;
  v231[3] = &unk_1E8578610;
  v231[4] = self;
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EE48, v231);
  -[PLXPCAgent setGroupActivitiesXPCListener:](self, "setGroupActivitiesXPCListener:", v49);

  v230[0] = v4;
  v230[1] = 3221225472;
  v230[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1536;
  v230[3] = &unk_1E8578610;
  v230[4] = self;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EE70, v230);
  -[PLXPCAgent setCPUViolationsXPCListener:](self, "setCPUViolationsXPCListener:", v50);

  v229[0] = v4;
  v229[1] = 3221225472;
  v229[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1540;
  v229[3] = &unk_1E8578610;
  v229[4] = self;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EE98, v229);
  -[PLXPCAgent setAnimatedStickerCreationListener:](self, "setAnimatedStickerCreationListener:", v51);

  v228[0] = v4;
  v228[1] = 3221225472;
  v228[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1544;
  v228[3] = &unk_1E8578610;
  v228[4] = self;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EEC0, v228);
  -[PLXPCAgent setAnimatedStickerScoringListener:](self, "setAnimatedStickerScoringListener:", v52);

  v227[0] = v4;
  v227[1] = 3221225472;
  v227[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1548;
  v227[3] = &unk_1E8578610;
  v227[4] = self;
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EEE8, v227);
  -[PLXPCAgent setStaticStickerCreationListener:](self, "setStaticStickerCreationListener:", v53);

  v226[0] = v4;
  v226[1] = 3221225472;
  v226[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1552;
  v226[3] = &unk_1E8578610;
  v226[4] = self;
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EF10, v226);
  -[PLXPCAgent setStaticStickerScoringListener:](self, "setStaticStickerScoringListener:", v54);

  v225[0] = v4;
  v225[1] = 3221225472;
  v225[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1558;
  v225[3] = &unk_1E8578610;
  v225[4] = self;
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EF38, v225);
  -[PLXPCAgent setMailCategorizationListener:](self, "setMailCategorizationListener:", v55);

  v224[0] = v4;
  v224[1] = 3221225472;
  v224[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1564;
  v224[3] = &unk_1E8578610;
  v224[4] = self;
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EF60, v224);
  -[PLXPCAgent setUserSafetyProcessing:](self, "setUserSafetyProcessing:", v56);

  if (objc_msgSend(MEMORY[0x1E0D80020], "isiPhone"))
  {
    v223[0] = v4;
    v223[1] = 3221225472;
    v223[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1568;
    v223[3] = &unk_1E8578610;
    v223[4] = self;
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EF88, v223);
    -[PLXPCAgent setCarPlayXPCListener:](self, "setCarPlayXPCListener:", v57);

    v222[0] = v4;
    v222[1] = 3221225472;
    v222[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1572;
    v222[3] = &unk_1E8578610;
    v222[4] = self;
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EFB0, v222);
    -[PLXPCAgent setCarPlayScreensXPCListener:](self, "setCarPlayScreensXPCListener:", v58);

  }
  v221[0] = v4;
  v221[1] = 3221225472;
  v221[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1578;
  v221[3] = &unk_1E8578610;
  v221[4] = self;
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864EFD8, v221);
  -[PLXPCAgent setRelevanceContextUpdateXPCListener:](self, "setRelevanceContextUpdateXPCListener:", v59);

  v220[0] = v4;
  v220[1] = 3221225472;
  v220[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1585;
  v220[3] = &unk_1E8578610;
  v220[4] = self;
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F000, v220);
  -[PLXPCAgent setMailFetchXPCListener:](self, "setMailFetchXPCListener:", v60);

  if (objc_msgSend(MEMORY[0x1E0D80020], "isWatch"))
  {
    v219[0] = v4;
    v219[1] = 3221225472;
    v219[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1590;
    v219[3] = &unk_1E8578610;
    v219[4] = self;
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F028, v219);
    -[PLXPCAgent setNanoMailSessionXPCListener:](self, "setNanoMailSessionXPCListener:", v61);

  }
  v218[0] = v4;
  v218[1] = 3221225472;
  v218[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1597;
  v218[3] = &unk_1E8578610;
  v218[4] = self;
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F050, v218);
  -[PLXPCAgent setSafariFetcherXPCListener:](self, "setSafariFetcherXPCListener:", v62);

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F078, &__block_literal_global_1604);
    -[PLXPCAgent setSafariViewServiceXPCListener:](self, "setSafariViewServiceXPCListener:", v63);

  }
  v217[0] = v4;
  v217[1] = 3221225472;
  v217[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1616;
  v217[3] = &unk_1E8578610;
  v217[4] = self;
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F0A0, v217);
  -[PLXPCAgent setAppAccessoriesXPCListener:](self, "setAppAccessoriesXPCListener:", v64);

  v216[0] = v4;
  v216[1] = 3221225472;
  v216[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1622;
  v216[3] = &unk_1E8578610;
  v216[4] = self;
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F0C8, v216);
  -[PLXPCAgent setAccessoriesXPCListener:](self, "setAccessoriesXPCListener:", v65);

  v215[0] = v4;
  v215[1] = 3221225472;
  v215[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1627;
  v215[3] = &unk_1E8578610;
  v215[4] = self;
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F0F0, v215);
  -[PLXPCAgent setSymptomsNetworkAdvisory:](self, "setSymptomsNetworkAdvisory:", v66);

  v214[0] = v4;
  v214[1] = 3221225472;
  v214[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1634;
  v214[3] = &unk_1E8578610;
  v214[4] = self;
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F118, v214);
  -[PLXPCAgent setBackgroundTransfer:](self, "setBackgroundTransfer:", v67);

  v213[0] = v4;
  v213[1] = 3221225472;
  v213[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1641;
  v213[3] = &unk_1E8578610;
  v213[4] = self;
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F140, v213);
  -[PLXPCAgent setDeepScanReasonsXPCListener:](self, "setDeepScanReasonsXPCListener:", v68);

  v212[0] = v4;
  v212[1] = 3221225472;
  v212[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1647;
  v212[3] = &unk_1E8578610;
  v212[4] = self;
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F168, v212);
  -[PLXPCAgent setInCallServiceXPCListener:](self, "setInCallServiceXPCListener:", v69);

  if (+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
  {
    v211[0] = v4;
    v211[1] = 3221225472;
    v211[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1654;
    v211[3] = &unk_1E8578610;
    v211[4] = self;
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F190, v211);
    -[PLXPCAgent setWebAppXPCListener:](self, "setWebAppXPCListener:", v70);

  }
  v71 = objc_alloc(MEMORY[0x1E0D80098]);
  dispatch_get_global_queue(0, 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v210[0] = v4;
  v210[1] = 3221225472;
  v210[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1661;
  v210[3] = &unk_1E8577F70;
  v210[4] = self;
  v73 = (void *)objc_msgSend(v71, "initWithWorkQueue:withRegistration:withBlock:", v72, &unk_1E864F1B8, v210);
  -[PLXPCAgent setEntryRequestResponder:](self, "setEntryRequestResponder:", v73);

  v151 = v72;
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
  {
    v209[0] = v4;
    v209[1] = 3221225472;
    v209[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1668;
    v209[3] = &unk_1E8578610;
    v209[4] = self;
    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F1E0, v209);
    -[PLXPCAgent setTelNotificationXPCListener:](self, "setTelNotificationXPCListener:", v74);

  }
  v208[0] = v4;
  v208[1] = 3221225472;
  v208[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1675;
  v208[3] = &unk_1E8578610;
  v208[4] = self;
  v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F208, v208);
  -[PLXPCAgent setSiriFalseAlarm:](self, "setSiriFalseAlarm:", v75);

  if (+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
  {
    v207[0] = v4;
    v207[1] = 3221225472;
    v207[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1681;
    v207[3] = &unk_1E8578610;
    v207[4] = self;
    v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F230, v207);
    -[PLXPCAgent setPeekXPCListener:](self, "setPeekXPCListener:", v76);

  }
  v206[0] = v4;
  v206[1] = 3221225472;
  v206[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1687;
  v206[3] = &unk_1E8578610;
  v206[4] = self;
  v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F258, v206);
  -[PLXPCAgent setPopXPCListener:](self, "setPopXPCListener:", v77);

  v205[0] = v4;
  v205[1] = 3221225472;
  v205[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1694;
  v205[3] = &unk_1E8578610;
  v205[4] = self;
  v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F280, v205);
  -[PLXPCAgent setThermalLevelXPCListener:](self, "setThermalLevelXPCListener:", v78);

  v204[0] = v4;
  v204[1] = 3221225472;
  v204[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1700;
  v204[3] = &unk_1E8578610;
  v204[4] = self;
  v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F2A8, v204);
  -[PLXPCAgent setThermalSensorsXPCListener:](self, "setThermalSensorsXPCListener:", v79);

  v203[0] = v4;
  v203[1] = 3221225472;
  v203[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1706;
  v203[3] = &unk_1E8578610;
  v203[4] = self;
  v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F2D0, v203);
  -[PLXPCAgent setThermalHiPXPCListener:](self, "setThermalHiPXPCListener:", v80);

  if (+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
  {
    v202[0] = v4;
    v202[1] = 3221225472;
    v202[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1713;
    v202[3] = &unk_1E8578610;
    v202[4] = self;
    v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F2F8, v202);
    -[PLXPCAgent setMobileBackupStatisticsXPCListener:](self, "setMobileBackupStatisticsXPCListener:", v81);

    v201[0] = v4;
    v201[1] = 3221225472;
    v201[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1719;
    v201[3] = &unk_1E8578610;
    v201[4] = self;
    v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F320, v201);
    -[PLXPCAgent setMobileBackupEventsXPCListener:](self, "setMobileBackupEventsXPCListener:", v82);

  }
  v200[0] = v4;
  v200[1] = 3221225472;
  v200[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1726;
  v200[3] = &unk_1E8578610;
  v200[4] = self;
  v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F348, v200);
  -[PLXPCAgent setCloudKitXPCListener:](self, "setCloudKitXPCListener:", v83);

  v199[0] = v4;
  v199[1] = 3221225472;
  v199[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1733;
  v199[3] = &unk_1E8578610;
  v199[4] = self;
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F370, v199);
  -[PLXPCAgent setCacheDeleteXPCListener:](self, "setCacheDeleteXPCListener:", v84);

  v198[0] = v4;
  v198[1] = 3221225472;
  v198[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1740;
  v198[3] = &unk_1E8578610;
  v198[4] = self;
  v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F398, v198);
  -[PLXPCAgent setMachineTranslationXPCListener:](self, "setMachineTranslationXPCListener:", v85);

  if (+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
  {
    v197[0] = v4;
    v197[1] = 3221225472;
    v197[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1746;
    v197[3] = &unk_1E8578610;
    v197[4] = self;
    v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F3C0, v197);
    -[PLXPCAgent setUbiquityAccountStatisticsXPCListener:](self, "setUbiquityAccountStatisticsXPCListener:", v86);

    v196[0] = v4;
    v196[1] = 3221225472;
    v196[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1753;
    v196[3] = &unk_1E8578610;
    v196[4] = self;
    v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F3E8, v196);
    -[PLXPCAgent setAttentionSamplingXPCListener:](self, "setAttentionSamplingXPCListener:", v87);

    v195[0] = v4;
    v195[1] = 3221225472;
    v195[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1759;
    v195[3] = &unk_1E8578610;
    v195[4] = self;
    v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F410, v195);
    -[PLXPCAgent setAttentionPollingXPCListener:](self, "setAttentionPollingXPCListener:", v88);

    v194[0] = v4;
    v194[1] = 3221225472;
    v194[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1765;
    v194[3] = &unk_1E8578610;
    v194[4] = self;
    v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F438, v194);
    -[PLXPCAgent setAttentionServiceXPCListener:](self, "setAttentionServiceXPCListener:", v89);

    v193[0] = v4;
    v193[1] = 3221225472;
    v193[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1769;
    v193[3] = &unk_1E8578610;
    v193[4] = self;
    v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F460, v193);
    -[PLXPCAgent setODOffXPCListener:](self, "setODOffXPCListener:", v90);

    v192[0] = v4;
    v192[1] = 3221225472;
    v192[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1773;
    v192[3] = &unk_1E8578610;
    v192[4] = self;
    v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F488, v192);
    -[PLXPCAgent setODOnXPCListener:](self, "setODOnXPCListener:", v91);

    v191[0] = v4;
    v191[1] = 3221225472;
    v191[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1777;
    v191[3] = &unk_1E8578610;
    v191[4] = self;
    v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F4B0, v191);
    -[PLXPCAgent setODHNXPCListener:](self, "setODHNXPCListener:", v92);

    v190[0] = v4;
    v190[1] = 3221225472;
    v190[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1781;
    v190[3] = &unk_1E8578610;
    v190[4] = self;
    v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F4D8, v190);
    -[PLXPCAgent setFrameCountXPCListener:](self, "setFrameCountXPCListener:", v93);

  }
  v189[0] = v4;
  v189[1] = 3221225472;
  v189[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1786;
  v189[3] = &unk_1E8578610;
  v189[4] = self;
  v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F500, v189);
  -[PLXPCAgent setAirDropSessionXPCListener:](self, "setAirDropSessionXPCListener:", v94);

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    v188[0] = v4;
    v188[1] = 3221225472;
    v188[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1790;
    v188[3] = &unk_1E8578610;
    v188[4] = self;
    v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F528, v188);
    -[PLXPCAgent setAirDropXPCListener:](self, "setAirDropXPCListener:", v95);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 4, MEMORY[0x1E0C9AA60], v97);

  }
  v98 = *MEMORY[0x1E0D80378];
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SOSKVSRateLimitingEvent"));
  v99 = objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = (void *)v99;
  self->_SOSKVSEntries = objc_msgSend(v100, "countOfEntriesForKey:", v99);

  v187[0] = v4;
  v187[1] = 3221225472;
  v187[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1794;
  v187[3] = &unk_1E8578610;
  v187[4] = self;
  v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F550, v187);
  -[PLXPCAgent setSOSKVSRateLimitingEventXPCListener:](self, "setSOSKVSRateLimitingEventXPCListener:", v101);

  v186[0] = v4;
  v186[1] = 3221225472;
  v186[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1798;
  v186[3] = &unk_1E8578610;
  v186[4] = self;
  v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F578, v186);
  -[PLXPCAgent setCKKSSyncingEventXPCListener:](self, "setCKKSSyncingEventXPCListener:", v102);

  v185[0] = v4;
  v185[1] = 3221225472;
  v185[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1802;
  v185[3] = &unk_1E8578610;
  v185[4] = self;
  v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F5A0, v185);
  -[PLXPCAgent setOctagonTrustEventXPCListener:](self, "setOctagonTrustEventXPCListener:", v103);

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 44, &unk_1E864F5C8, v105);

  }
  if (+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
  {
    v184[0] = v4;
    v184[1] = 3221225472;
    v184[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1812;
    v184[3] = &unk_1E8578610;
    v184[4] = self;
    v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F5F0, v184);
    -[PLXPCAgent setAirTrafficAssetDownloadXPCListener:](self, "setAirTrafficAssetDownloadXPCListener:", v106);

    if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
    {
      v183[0] = v4;
      v183[1] = 3221225472;
      v183[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1817;
      v183[3] = &unk_1E8578610;
      v183[4] = self;
      v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F618, v183);
      -[PLXPCAgent setCoreDuetKnowledgeSyncXPCListener:](self, "setCoreDuetKnowledgeSyncXPCListener:", v107);

    }
    v182[0] = v4;
    v182[1] = 3221225472;
    v182[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1824;
    v182[3] = &unk_1E8578610;
    v182[4] = self;
    v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F640, v182);
    -[PLXPCAgent setAppActivationPerformanceActivationDataXPCListener:](self, "setAppActivationPerformanceActivationDataXPCListener:", v108);

    v181[0] = v4;
    v181[1] = 3221225472;
    v181[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1830;
    v181[3] = &unk_1E8578610;
    v181[4] = self;
    v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F668, v181);
    -[PLXPCAgent setAppActivationPerformanceProcessDataXPCListener:](self, "setAppActivationPerformanceProcessDataXPCListener:", v109);

    v180[0] = v4;
    v180[1] = 3221225472;
    v180[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1836;
    v180[3] = &unk_1E8578610;
    v180[4] = self;
    v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F690, v180);
    -[PLXPCAgent setAppActivationPerformanceCPUStatisticsXPCListener:](self, "setAppActivationPerformanceCPUStatisticsXPCListener:", v110);

    v179[0] = v4;
    v179[1] = 3221225472;
    v179[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1842;
    v179[3] = &unk_1E8578610;
    v179[4] = self;
    v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F6B8, v179);
    -[PLXPCAgent setAppActivationPerformanceMemoryStatisticsXPCListener:](self, "setAppActivationPerformanceMemoryStatisticsXPCListener:", v111);

    v178[0] = v4;
    v178[1] = 3221225472;
    v178[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1848;
    v178[3] = &unk_1E8578610;
    v178[4] = self;
    v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F6E0, v178);
    -[PLXPCAgent setAppActivationPerformancePowerStateStatisticsXPCListener:](self, "setAppActivationPerformancePowerStateStatisticsXPCListener:", v112);

  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isiOS"))
  {
    v177[0] = v4;
    v177[1] = 3221225472;
    v177[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1852;
    v177[3] = &unk_1E8578610;
    v177[4] = self;
    v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F708, v177);
    -[PLXPCAgent setShortcutsTriggerFiredXPCListener:](self, "setShortcutsTriggerFiredXPCListener:", v113);

  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isMac"))
  {
    v176[0] = v4;
    v176[1] = 3221225472;
    v176[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1859;
    v176[3] = &unk_1E8578610;
    v176[4] = self;
    v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F730, v176);
    -[PLXPCAgent setAppleBacklightBrightnessXPCListener:](self, "setAppleBacklightBrightnessXPCListener:", v114);

  }
  v175[0] = v4;
  v175[1] = 3221225472;
  v175[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1866;
  v175[3] = &unk_1E8578610;
  v175[4] = self;
  v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F758, v175);
  -[PLXPCAgent setNetworkRelayXPCListener:](self, "setNetworkRelayXPCListener:", v115);

  v174[0] = v4;
  v174[1] = 3221225472;
  v174[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1872;
  v174[3] = &unk_1E8578610;
  v174[4] = self;
  v116 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F780, v174);
  -[PLXPCAgent setNetworkRelayWiFiAssertionXPCListener:](self, "setNetworkRelayWiFiAssertionXPCListener:", v116);

  v173[0] = v4;
  v173[1] = 3221225472;
  v173[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1878;
  v173[3] = &unk_1E8578610;
  v173[4] = self;
  v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F7A8, v173);
  -[PLXPCAgent setNetworkRelayBTLinkAssertionXPCListener:](self, "setNetworkRelayBTLinkAssertionXPCListener:", v117);

  v172[0] = v4;
  v172[1] = 3221225472;
  v172[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1884;
  v172[3] = &unk_1E8578610;
  v172[4] = self;
  v118 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F7D0, v172);
  -[PLXPCAgent setNetworkRelayTerminusBTWakeXPCListener:](self, "setNetworkRelayTerminusBTWakeXPCListener:", v118);

  v171[0] = v4;
  v171[1] = 3221225472;
  v171[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1889;
  v171[3] = &unk_1E8578610;
  v171[4] = self;
  v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F7F8, v171);
  -[PLXPCAgent setAccessoryMotionXPCListener:](self, "setAccessoryMotionXPCListener:", v119);

  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v98, CFSTR("UARPStatus"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLXPCAgent setAccessoryUARPEntryCount:](self, "setAccessoryUARPEntryCount:", objc_msgSend(v121, "countOfEntriesForKey:", v120));

  v170[0] = v4;
  v170[1] = 3221225472;
  v170[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1895;
  v170[3] = &unk_1E8578610;
  v170[4] = self;
  v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F820, v170);
  -[PLXPCAgent setAccessoryUARPListener:](self, "setAccessoryUARPListener:", v122);

  if (objc_msgSend(MEMORY[0x1E0D80020], "isWatch"))
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v98, CFSTR("Dosimetry"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "lastEntryForKey:", v123);
    v125 = (PLEntry *)objc_claimAutoreleasedReturnValue();
    lastDosimetryEntry = self->_lastDosimetryEntry;
    self->_lastDosimetryEntry = v125;

    PLLogXPC();
    v127 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
    {
      v148 = self->_lastDosimetryEntry;
      if (v148)
      {
        -[PLEntry objectForKeyedSubscript:](v148, "objectForKeyedSubscript:", CFSTR("noiseEnabled"));
        v149 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v149 = 0;
      }
      *(_DWORD *)buf = 138412546;
      v276 = CFSTR("noiseEnabled");
      v277 = 2112;
      v278 = v149;
      _os_log_debug_impl(&dword_1CAF47000, v127, OS_LOG_TYPE_DEBUG, "Dosimetry state %@ was %@\n", buf, 0x16u);
      if (v148)

    }
    v169[0] = v4;
    v169[1] = 3221225472;
    v169[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1902;
    v169[3] = &unk_1E8578610;
    v169[4] = self;
    v128 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F848, v169);
    -[PLXPCAgent setDosimetryXPCListener:](self, "setDosimetryXPCListener:", v128);

  }
  v168[0] = v4;
  v168[1] = 3221225472;
  v168[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1909;
  v168[3] = &unk_1E8578610;
  v168[4] = self;
  v129 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F870, v168);
  -[PLXPCAgent setAudioRoutingXPCListener:](self, "setAudioRoutingXPCListener:", v129);

  v167[0] = v4;
  v167[1] = 3221225472;
  v167[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1916;
  v167[3] = &unk_1E8578610;
  v167[4] = self;
  v130 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F898, v167);
  -[PLXPCAgent setRapportReceivedMessageXPCListener:](self, "setRapportReceivedMessageXPCListener:", v130);

  v166[0] = v4;
  v166[1] = 3221225472;
  v166[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1921;
  v166[3] = &unk_1E8578610;
  v166[4] = self;
  v131 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F8C0, v166);
  -[PLXPCAgent setEnhancedDiscoveryXPCListener:](self, "setEnhancedDiscoveryXPCListener:", v131);

  v165[0] = v4;
  v165[1] = 3221225472;
  v165[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1928;
  v165[3] = &unk_1E8578610;
  v165[4] = self;
  v132 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F8E8, v165);
  -[PLXPCAgent setWirelessSyncStartEventXPCListener:](self, "setWirelessSyncStartEventXPCListener:", v132);

  v164[0] = v4;
  v164[1] = 3221225472;
  v164[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1934;
  v164[3] = &unk_1E8578610;
  v164[4] = self;
  v133 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F910, v164);
  -[PLXPCAgent setWirelessSyncStopEventXPCListener:](self, "setWirelessSyncStopEventXPCListener:", v133);

  v163[0] = v4;
  v163[1] = 3221225472;
  v163[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1940;
  v163[3] = &unk_1E8578610;
  v163[4] = self;
  v134 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F938, v163);
  -[PLXPCAgent setSpatialAudioXPCListener:](self, "setSpatialAudioXPCListener:", v134);

  v162[0] = v4;
  v162[1] = 3221225472;
  v162[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1946;
  v162[3] = &unk_1E8578610;
  v162[4] = self;
  v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F960, v162);
  -[PLXPCAgent setAVConferenceXPCListener:](self, "setAVConferenceXPCListener:", v135);

  v161[0] = v4;
  v161[1] = 3221225472;
  v161[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1951;
  v161[3] = &unk_1E8578610;
  v161[4] = self;
  v136 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F988, v161);
  -[PLXPCAgent setAvailabilityModesXPCListener:](self, "setAvailabilityModesXPCListener:", v136);

  v160[0] = v4;
  v160[1] = 3221225472;
  v160[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1955;
  v160[3] = &unk_1E8578610;
  v160[4] = self;
  v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F9B0, v160);
  -[PLXPCAgent setFocusFiltersXPCListener:](self, "setFocusFiltersXPCListener:", v137);

  v159[0] = v4;
  v159[1] = 3221225472;
  v159[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1960;
  v159[3] = &unk_1E8578610;
  v159[4] = self;
  v138 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864F9D8, v159);
  -[PLXPCAgent setPortraitHighlightsResultXPCListener:](self, "setPortraitHighlightsResultXPCListener:", v138);

  v158[0] = v4;
  v158[1] = 3221225472;
  v158[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1964;
  v158[3] = &unk_1E8578610;
  v158[4] = self;
  v139 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864FA00, v158);
  -[PLXPCAgent setSpotlightHighlightsResultXPCListener:](self, "setSpotlightHighlightsResultXPCListener:", v139);

  v157[0] = v4;
  v157[1] = 3221225472;
  v157[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1970;
  v157[3] = &unk_1E8578610;
  v157[4] = self;
  v140 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864FA28, v157);
  -[PLXPCAgent setSpotlightIndexesXPCListener:](self, "setSpotlightIndexesXPCListener:", v140);

  v156[0] = v4;
  v156[1] = 3221225472;
  v156[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1974;
  v156[3] = &unk_1E8578610;
  v156[4] = self;
  v141 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864FA50, v156);
  -[PLXPCAgent setSpotlightQueriesXPCListener:](self, "setSpotlightQueriesXPCListener:", v141);

  v155[0] = v4;
  v155[1] = 3221225472;
  v155[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1979;
  v155[3] = &unk_1E8578610;
  v155[4] = self;
  v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864FA78, v155);
  -[PLXPCAgent setPasskeyAuthenticationXPCListener:](self, "setPasskeyAuthenticationXPCListener:", v142);

  v154[0] = v4;
  v154[1] = 3221225472;
  v154[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_1986;
  v154[3] = &unk_1E8578610;
  v154[4] = self;
  v143 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864FAA0, v154);
  -[PLXPCAgent setADDListener:](self, "setADDListener:", v143);

  v144 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80098]), "initWithWorkQueue:withRegistration:withBlock:", v151, &unk_1E864FAC8, &__block_literal_global_1993);
  -[PLXPCAgent setTaskModeQueryResponder:](self, "setTaskModeQueryResponder:", v144);

  v153[0] = v4;
  v153[1] = 3221225472;
  v153[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_2000;
  v153[3] = &unk_1E8578610;
  v153[4] = self;
  v145 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864FAF0, v153);
  -[PLXPCAgent setRapidSecurityResponseXPCListener:](self, "setRapidSecurityResponseXPCListener:", v145);

  v152[0] = v4;
  v152[1] = 3221225472;
  v152[2] = __38__PLXPCAgent_initOperatorDependancies__block_invoke_2001;
  v152[3] = &unk_1E8577F48;
  v152[4] = self;
  v146 = (PLCFNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FF80]), "initWithOperator:forNotification:requireState:withBlock:", self, CFSTR("com.apple.managedconfiguration.allowhealthdatasubmissionchanged"), 0, v152);
  ihaToggleListener = self->_ihaToggleListener;
  self->_ihaToggleListener = v146;

}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogXPC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "GenerativeFunctionMetrics OptIn State Changed: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardGMSOptIn");
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1285(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics appleDiffusion payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAppleDiffusion:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1291(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics Summarization payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSummarization:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1297(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics assetLoad payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAssetLoadGF:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1303(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics fileResidentInfo payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logFileResidentInfo:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1309(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics HandwritingInference payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardHandwritingInference:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1315(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics mmExecuteRequest payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardMMExecuteRequest:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1321(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics tgiExecuteRequest payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardTGIExecuteRequest:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1327(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics SmartReplySession payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSmartReplySession:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1333(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "ANEd model compilation payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointANE:withCategory:", v6, CFSTR("modelCompilation"));
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1341(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "ANEd model inference payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointANE:withCategory:", v6, CFSTR("modelInference"));
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1349(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "ANEd model load payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointANE:withCategory:", v6, CFSTR("modelLoad"));
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1357(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "ANEd model unload payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointANE:withCategory:", v6, CFSTR("modelUnload"));
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1365(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "ANEd new instance model load payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointANE:withCategory:", v6, CFSTR("newInstanceModelLoad"));
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1373(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "ANEd new instance model unload payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointANE:withCategory:", v6, CFSTR("newInstanceModelUnload"));
}

uint64_t __38__PLXPCAgent_initOperatorDependancies__block_invoke_1377(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSBCNotificationWithUserInfo:", a2);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1382(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "MXDiscoveryLevel payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardMXDiscoveryLevel:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Airplay DiscoveryMode payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointAirPlayDiscoveryMode:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1392(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "CommuteRefresh Session callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointCommuteRefreshSession:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1397(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "TestMarker callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointTestMarker:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1402(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEFAULT, "[Energy Telemetry] callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardEnergyTelemetry:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "UIKit eclipse callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardUIKitEclipse:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1415(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Sleep Mode activity callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSleepMode:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1419(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Sleep Lock activity callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointSleepLock:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Weather Notification State callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointWeatherNotificationState:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Weather Notification callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointWeatherNotification:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1435(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "SecondaryDisplay callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSecondaryDisplay:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1441(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "UIKit keyboard callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardUIKitKeyboard:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1447(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "UIKit activity callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardUIKitActivity:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1451(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "DASyncStart callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointDASyncStart:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1457(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "LinkAdvisory payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardLinkAdvisory:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1463(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "RCSSessionManagement payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventEventPointRCSSessionManagement:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1469(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLLogXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "XPCMetrics::VKDataScanner payload received from %@, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalVKDataScanner:", v8);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1475(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLLogXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "RenderData::AlbumAnimationDuration payload received from %@, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logAlbumAnimation:", v8);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1481(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLLogXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "RenderData::AlbumMotionDownload payload received from %@, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logAlbumMotion:", v8);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1486(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLLogXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "CallScreeningDuration payload received from %@, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardCallScreeningDuration:", v8);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1490(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLLogXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "CallScreeningEnabled payload received from %@, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardCallScreeningEnabled:", v8);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1496(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLLogXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "Trackpad logging payload received from %@, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardKeyboardTrackpad:", v8);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "VoicemailDuration callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardVoicemailDuration:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1507(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "KeyboardSession callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardKeyboardSession:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1513(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "RenderPassCount callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardRenderPassCount:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1519(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "LayerCount callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardLayerCount:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "MomentsDeferredProcessing callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalMomentsDeferredProcessing:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "GroupActivities payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalGroupActivities:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1536(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "CPUViolations payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalEndCPUViolations:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AnimatedStickerCreation callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalAnimatedStickerCreation:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AnimatedStickerScoring callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalAnimatedStickerScoring:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "StaticStickerCreation callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalStaticStickerCreation:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1552(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "StaticStickerScoring callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalStaticStickerScoring:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1558(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLLogXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "XPCMetrics::MailCategorizationEvent payload received from %@, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logMailCategorization:", v8);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "MADIVSProcessing callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalUserSafetyProcessing:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "CarPlay payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardCarPlay:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1572(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "CarPlayScreens payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardCarPlayScreens:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "RelevanceContextUpdate payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardRelevanceContextUpdate:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1585(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Mail Framework Fetch AFC callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointMailFetch:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "NanoMailSession callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointNanoMailSession:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1597(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Safari Reading list fetcher callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSafariFetcherStatus:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1603(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a5;
  PLLogXPC();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "Safari View Service callback: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "numberWithDouble:", 1.0 / (double)(unint64_t)objc_msgSend(v14, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 42, v7, v17);

}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1616(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "App Accessory callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAppAccessory:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1622(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Accessory callback: %@", (uint8_t *)&v16, 0xCu);
  }

  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v9 = *MEMORY[0x1E0D33BD8];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D33BD8]);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v9);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAccessory:", v8);

}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1627(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Network Symptoms callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointNetworkSymptomsAdviosry:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Background transfer callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointBackgroundTransfer:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1641(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Deep Scan Reasons callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointDeepScanReasons:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1647(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "InCallService callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardInCallService:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "WebApp callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardWebApp:", v6);
}

id __38__PLXPCAgent_initOperatorDependancies__block_invoke_1661(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(*(id *)(a1 + 32), "entryRequestResponseForPayload:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogXPC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "EntryRequest callback: payload=%@\nentries=%@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Location callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventAggregateTelNotification:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1675(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Siri False Alarm callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardSiriFalseAlarm:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1681(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Peek callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardNamePeek:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1687(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Pop callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardNamePop:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Thermal level callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardThermalLevel:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Thermal sensors callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardThermalSensors:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1706(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Thermal HiP callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardThermalHiP:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1713(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Mobile Backup callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointMobileBackupStatistics:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1719(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Mobile Backup callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointMobileBackupEvents:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1726(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "CloudKit callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointCloudKit:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1733(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "CacheDelete callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointCacheDelete:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Translation callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointMachineTranslation:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1746(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Ubiquity Account Statistics callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardUbiquityAccountStatistics:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1753(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AttentionSampling callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardAttentionSampling:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1759(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AttentionPolling callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardAttentionPolling:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1765(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AttentionService callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardAttentionService:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1769(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "OD Off callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardODOff:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1773(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "OD On callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardODOn:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1777(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "OD HN callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardODHN:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1781(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "FrameCount callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardFrameCount:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1786(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AirDropSession callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAirDropSession:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AirDrop callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAirDrop:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "SOS KVS Rate Limiting Event callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSOSKVSRateLimitingEvent:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "CKKSSyncing Callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "handleCKKSSyncingEvent:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1802(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "OctagonTrust callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointOctagonTrustEvent:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1812(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AirTraffic callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalAirTrafficAssetDownload:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1817(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "CoreDuet KnowledgeSync callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalCoreDuetKnowledgeSync:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "App Activation Performance callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointAppActivationPerformanceActivationData:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "App Activation Performance callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointAppActivationPerformanceProcessData:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1836(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "App Activation Performance callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointAppActivationPerformanceCPUStatistics:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1842(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "App Activation Performance callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointAppActivationPerformanceMemoryStatistics:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "App Activation Performance callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointAppActivationPerformancePowerStateStatistics:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1852(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Shortcuts trigger fired callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointShortcutsTriggerFired:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1859(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AppleBacklight Brightness callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAppleBackklightBrightness:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1866(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "NetworkRelay callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardNetworkRelay:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1872(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "NetworkRelay WiFi Assertion callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardNetworkRelayWiFiAssertion:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "NetworkRelay BT Link Assertion callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointNetworkRelayBTLinkAssertion:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "NetworkRelay Terminus BT wake callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointNetworkRelayTerminusBTWake:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1889(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AccessoryMotion callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAccessoryMotion:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1895(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "UARP Update callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventFowardUARPStatus:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1902(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Dosimetry callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardDosimetry:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1909(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AudioRouting callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAudioRouting:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1916(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Rapport received message callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalRapportReceivedMessage:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1921(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "EnhancedDiscovery callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardEnhancedDiscovery:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "WirelessSyncStart payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardWirelessSync:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "WirelessSyncStop payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardWirelessSync:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Spatial Audio callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSpatialAudio:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1946(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AVConference callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardAVConference:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1951(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "AvailabilityModes payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAvailabilityModes:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1955(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "FocusFilters payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointFocusFilters:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "PortraitHighlightsResult payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointNamePortraitHighlightsResult:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "SpotlightHighlightsResult payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointNameSpotlightHighlightsResult:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "SpotlightIndexes payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalNameSpotlightIndexes:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "SpotlightQueries payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalNameSpotlightQueries:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1979(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Passkey Authentication callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardPasskeyAuthentication:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_1986(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "ADD callback %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointADD:", v6);
}

id __38__PLXPCAgent_initOperatorDependancies__block_invoke_1992(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a5;
  PLLogXPC();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "TaskModeQuery: payload=%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode", CFSTR("Task Mode")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Rapid Security Response callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardRapidSecurityResponse:", v6);
}

void __38__PLXPCAgent_initOperatorDependancies__block_invoke_2001(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogXPC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "IHA Toggle State Changed: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardIHA");
}

- (id)entryRequestResponseForPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  PLXPCAgent *v40;
  id obj;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("timedout"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

  }
  else
  {
    v11 = 60.0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Operator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0D7FFC0];
    v39 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Operator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "entryKeysForOperatorName:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v15);

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EntryKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "agents");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "log");

      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "services");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "log");

      v32 = &unk_1E864FB18;
      goto LABEL_25;
    }
    v39 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EntryKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v38 = v5;
  obj = v5;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v44;
    v20 = 0x1E0D7F000uLL;
    v40 = self;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v21);
        PLLogXPC();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v22;
          _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "requesting %@", buf, 0xCu);
        }

        v24 = *(void **)(v20 + 4040);
        v42 = 0;
        objc_msgSend(v24, "requestEntryForEntryKey:forOperator:withTimeout:error:", v22, self, &v42, v11);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v42;
        if (v26)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timedout"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v22);

          PLLogXPC();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v22;
            v49 = 2112;
            v50 = v26;
            _os_log_error_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_ERROR, "timeout %@: %@", buf, 0x16u);
          }

        }
        objc_msgSend(v25, "serializedForJSON", v38);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend(v6, "setObject:forKey:", v29, v22);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v30 = v20;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v31, v22);

          v20 = v30;
          self = v40;
        }

        ++v21;
      }
      while (v18 != v21);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v18);
  }

  v32 = v6;
  v5 = v38;
  v4 = v39;
LABEL_25:

  return v32;
}

- (void)handleSBCNotificationWithUserInfo:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("entry"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v14, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(v14, "entryDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSince1970");
      self->_lastSBCupdateTimestamp = v7;

      -[PLXPCAgent inferenceEntries](self, "inferenceEntries");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLXPCAgent distributeBundleIDEntriesToWeight:toDistributionID:](self, "distributeBundleIDEntriesToWeight:toDistributionID:", v8, 53);

      -[NSMutableDictionary removeAllObjects](self->_inferenceEntries, "removeAllObjects");
      -[PLXPCAgent summarizationEntries](self, "summarizationEntries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLXPCAgent distributeBundleIDEntriesToWeight:toDistributionID:](self, "distributeBundleIDEntriesToWeight:toDistributionID:", v9, 54);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLXPCAgent summarizationEntries](self, "summarizationEntries");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", 17, v12, v13);

      -[NSMutableDictionary removeAllObjects](self->_summarizationEntries, "removeAllObjects");
    }
  }

}

- (void)log
{
  -[PLXPCAgent logEventForwardGMSOptIn](self, "logEventForwardGMSOptIn");
  -[PLXPCAgent logEventForwardIHA](self, "logEventForwardIHA");
}

- (void)logEventAggregateTelNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("Aggregate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("telNotification"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("telNotification"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("kCTRegistrationCellChangedNotification")))
      {

      }
      else
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("telNotification"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("kCTCellMonitorUpdateNotification"));

        if (!v8)
          goto LABEL_9;
      }
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v4);
      if (v9)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("telNotification"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("name"));

        objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E8635850, CFSTR("count"));
        -[PLOperator logEntry:](self, "logEntry:", v9);
      }

    }
  }
LABEL_9:

}

- (void)logEventBackwardSiriFalseAlarm:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("SiriAlarm"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardKeyboardTrackpad:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("KeyboardTrackpadResidencies"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardActiveStylus:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("ActiveStylusInking"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardPassiveStylus:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("PassiveStylusInking"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardKeyboardSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  v4 = a3;
  if (v4)
  {
    v58 = v4;
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("KeyboardSession"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v57);
    v6 = *MEMORY[0x1E0D80368];
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("KeyboardWordsAndCharacters"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v56);
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v6, CFSTR("KeyboardTime"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v55);
    objc_msgSend(v58, "objectForKey:", CFSTR("WordsTapped"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      v11 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("WordsTapped"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "roundToSigFig:withSigFig:", objc_msgSend(v12, "intValue"), 2));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("WordsTapped"));

      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WordsTapped"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "intValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("WordsTapped"));

    }
    objc_msgSend(v58, "objectForKey:", CFSTR("CharactersTapped"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      v19 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("CharactersTapped"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "roundToSigFig:withSigFig:", objc_msgSend(v20, "intValue"), 2));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("CharactersTapped"));

      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CharactersTapped"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "numberWithInt:", objc_msgSend(v23, "intValue"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("CharactersTapped"));

    }
    objc_msgSend(v58, "objectForKey:", CFSTR("WordsPathed"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0CB37E8];
      v27 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("WordsPathed"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "numberWithInt:", objc_msgSend(v27, "roundToSigFig:withSigFig:", objc_msgSend(v28, "intValue"), 2));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("WordsPathed"));

      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WordsPathed"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "numberWithInt:", objc_msgSend(v31, "intValue"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, CFSTR("WordsPathed"));

    }
    objc_msgSend(v58, "objectForKey:", CFSTR("CharactersPathed"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = (void *)MEMORY[0x1E0CB37E8];
      v35 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("CharactersPathed"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "numberWithInt:", objc_msgSend(v35, "roundToSigFig:withSigFig:", objc_msgSend(v36, "intValue"), 2));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("CharactersPathed"));

      v38 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CharactersPathed"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "numberWithInt:", objc_msgSend(v39, "intValue"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v40, CFSTR("CharactersPathed"));

    }
    objc_msgSend(v58, "objectForKey:", CFSTR("TimeSpentTapTyping"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      v42 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("TimeSpentTapTyping"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v43, "integerValue"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("TimeSpentTapTyping"));

      v45 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TimeSpentTapTyping"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "numberWithInt:", objc_msgSend(v46, "intValue"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v47, CFSTR("TimeSpentTapTyping"));

    }
    objc_msgSend(v58, "objectForKey:", CFSTR("TimeSpentPathTyping"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("TimeSpentPathTyping"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "numberWithInteger:", objc_msgSend(v50, "integerValue"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, CFSTR("TimeSpentPathTyping"));

      v52 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TimeSpentPathTyping"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "numberWithInt:", objc_msgSend(v53, "intValue"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v54, CFSTR("TimeSpentPathTyping"));

    }
    -[PLOperator logEntry:](self, "logEntry:", v5);
    if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
    {
      -[PLOperator logEntry:](self, "logEntry:", v7);
      -[PLOperator logEntry:](self, "logEntry:", v8);
    }

    v4 = v58;
  }

}

- (void)logEventBackwardVoicemailDuration:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("VoicemailDuration"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v14);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "intValue");
  if ((v8 - 1) > 8)
  {
    if ((v8 - 10) > 0x59)
    {
      if ((int)v8 < 100)
        goto LABEL_8;
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = (void *)MEMORY[0x1E0D80078];
      v11 = v8;
      v12 = 2;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = (void *)MEMORY[0x1E0D80078];
      v11 = v8;
      v12 = 1;
    }
    objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "roundToSigFig:withSigFig:", v11, v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("duration"));

    goto LABEL_8;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E8635868, CFSTR("duration"));
LABEL_8:
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventPointSleepLock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80078], "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SleepLock"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SleepLock"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithEntryKey:withRawData:", v5, v7);

    -[PLOperator logEntry:](self, "logEntry:", v8);
  }
  else
  {
    PLLogXPC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_ERROR, "SleepLock submission not allowed by IHA", v10, 2u);
    }

  }
}

- (void)logEventPointWeatherNotificationState:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("WeatherNotificationState"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointWeatherNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  if (v4)
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("WeatherNotification"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v5, v4);
    -[PLOperator logEntry:](self, "logEntry:", v6);

  }
  else
  {
    PLLogXPC();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_ERROR, "Empty payload, returning", v8, 2u);
    }

  }
}

- (void)logEventPointNetworkRelayBTLinkAssertion:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("NetworkRelayBTLinkAssertion"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointNetworkRelayTerminusBTWake:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("TerminusBTWake"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v13);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Packet SPI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInt:", objc_msgSend(v8, "unsignedIntValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("spi"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Packet sequence number"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "numberWithUnsignedInt:", objc_msgSend(v11, "unsignedIntValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("seqNo"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointNamePortraitHighlightsResult:(id)a3
{
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;

  v20 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("PortraitHighlightsResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v4);
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("client"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithApplicationIdentifier:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("BundleID"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BundleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("BundleID"));

  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("limit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("limit"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = (void *)MEMORY[0x1E0D80078];
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("portraitResultCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "roundToSigFig:withSigFig:", objc_msgSend(v14, "intValue"), 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("portraitResultCount"));

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("portraitCacheDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v16, "convertFromSystemToMonotonic");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("portraitCacheDate"));

    }
  }
  -[PLOperator logEntry:](self, "logEntry:", v5);

}

- (void)logEventPointNameSpotlightHighlightsResult:(id)a3
{
  uint64_t v4;
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
  id v16;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("SpotlightHighlightsResult"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v16, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("client"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithApplicationIdentifier:error:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("BundleID"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("BundleID"));

  }
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = (void *)MEMORY[0x1E0D80078];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spotlightResultCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "roundToSigFig:withSigFig:", objc_msgSend(v14, "intValue"), 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("spotlightResultCount"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointTestMarker:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("TestMarker"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointDASyncStart:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("DASyncStart"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointDACalendarItemsDownloaded:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("DACalendarItemsDownloaded"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointDACalendarItemsUploaded:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("DACalendarItemsUploaded"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointMailFetch:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("MailFetch"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointNanoMailSession:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = a3;
  if (v4)
  {
    v37 = v4;
    v5 = objc_msgSend(MEMORY[0x1E0D80020], "isWatch");
    v4 = v37;
    if (v5)
    {
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Category"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v37;
      if (v6)
      {
        +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("NanoMailSession"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Timestamp"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Timestamp"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "doubleValue");
          objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "convertFromSystemToMonotonic");
          v13 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v13;
        }
        if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
        {
          v14 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v8, "timeIntervalSince1970");
          objc_msgSend(v14, "dateWithTimeIntervalSince1970:", round(v15 / 10.0) * 10.0);
          v16 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v16;
        }
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v7, v8);
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Category"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("LoadWebView"));

        if ((v19 & 1) != 0)
        {
          v20 = 1;
        }
        else
        {
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Category"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("MailFetch"));

          if ((v22 & 1) != 0)
          {
            v20 = 2;
          }
          else
          {
            objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Category"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("AttachmentDownload"));

            if ((v24 & 1) != 0)
            {
              v20 = 3;
            }
            else
            {
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Category"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("ContentDownload"));

              if (v26)
                v20 = 4;
              else
                v20 = 0;
            }
          }
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, CFSTR("Category"));

        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Duration"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, CFSTR("Duration"));

        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
        {
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Account type"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v29, CFSTR("Account type"));

          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Duration"));
          v30 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Duration"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
LABEL_22:
            objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Network interface"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v36, CFSTR("Network interface"));

            -[PLOperator logEntry:](self, "logEntry:", v17);
            v4 = v37;
            goto LABEL_23;
          }
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Duration"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "doubleValue");
          v34 = v33;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(v34 * 100.0) / 100.0);
          v30 = objc_claimAutoreleasedReturnValue();
        }
        v35 = (void *)v30;
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, CFSTR("Duration"));

        goto LABEL_22;
      }
    }
  }
LABEL_23:

}

- (void)logEventPointJetsam:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PLOperator storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flushCachesWithReason:", CFSTR("Jetsam"));

  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Jetsam"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("Level"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointNavd:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;

  v13 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("navd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v4);
  objc_msgSend(v13, "objectForKey:", CFSTR("Event"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ReceivedNewHypothesis"));

  if ((v7 & 1) != 0)
  {
    v8 = &unk_1E8635880;
LABEL_7:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("EventRequest"));
    goto LABEL_8;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("Event"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("SendingETARequest"));

  if ((v10 & 1) != 0)
  {
    v8 = &unk_1E8635898;
    goto LABEL_7;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("Event"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("RequestingDirections"));

  if (v12)
  {
    v8 = &unk_1E86358B0;
    goto LABEL_7;
  }
LABEL_8:
  -[PLOperator logEntry:](self, "logEntry:", v5);

}

- (void)logEventPointNavdMapsWidgetSession:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("MapsWidgetSession"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointNavdGeoNetworkActivity:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("GEONetworkActivity"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PLXPCAgent logNetworkActivity:withEntryKey:](self, "logNetworkActivity:withEntryKey:", v5, v6);

}

- (void)logNetworkActivity:(id)a3 withEntryKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  PLXPCAgent *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v25 = self;
  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StartUnix"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EndUnix"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v5, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    v26 = *(_QWORD *)v38;
    v27 = v5;
    do
    {
      v11 = 0;
      v28 = v9;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v11);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12, v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v30 = v11;
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v15, "allKeys");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v34 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
                v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, CFSTR("StartUnix"));
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v31, CFSTR("EndUnix"));
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, CFSTR("Client"));
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("NetworkingReason"));
                objc_msgSend(v15, "objectForKeyedSubscript:", v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("RequestCount"));

                objc_msgSend(v7, "addObject:", v22);
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
            }
            while (v18);
          }

          v5 = v27;
          v9 = v28;
          v10 = v26;
          v11 = v30;
        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v9);
  }

  v41 = v6;
  v42 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logEntries:withGroupID:](v25, "logEntries:withGroupID:", v24, v6);

}

- (void)logEventPointNavdMapsNavigationStateEvent:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("MapsNavigationStateEvent"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointMobileBackupStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("MobileBackupStatistics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x1E0D7FFB0]);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithEntryKey:withRawData:", v5, v13);

        -[PLOperator logEntry:](self, "logEntry:", v14);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)logEventPointMobileBackupEvents:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("MobileBackupEvents"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v21, v5);

  if ((objc_msgSend(MEMORY[0x1E0D80020], "internalBuild") & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("start"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v7, "dateWithTimeIntervalSince1970:", round(v9));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("start"));

    v11 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("end"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "dateWithTimeIntervalSince1970:", round(v13));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("end"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("finished"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0D7FFA0];
    v18 = objc_alloc(MEMORY[0x1E0CB37E8]);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("end"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSince1970");
    v20 = (void *)objc_msgSend(v18, "initWithDouble:");
    objc_msgSend(v17, "setObject:forKey:saveToDisk:", v20, CFSTR("LastBackupTimestamp"), 1);

  }
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventPointADD:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80078], "isSafetyDataSubmissionAllowed"))
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ADD"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v5, v4);
    -[PLOperator logEntry:](self, "logEntry:", v6);

  }
  else
  {
    PLLogXPC();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Not logging ADD because Improve Safety is not enabled", v8, 2u);
    }

  }
}

- (BOOL)shouldLogAppActivationData
{
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode") & 1) != 0)
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0D7FFA0], "eplEnabled");
}

- (void)logEventPointAppActivationPerformanceActivationData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[PLXPCAgent shouldLogAppActivationData](self, "shouldLogAppActivationData"))
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("AppActivationPerformanceActivationData"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v12);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Timestamp"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "convertFromSystemToMonotonic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEntryDate:", v11);

      -[PLOperator logEntry:](self, "logEntry:", v5);
    }

  }
}

- (void)logEventPointAppActivationPerformanceProcessData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id obj;
  PLXPCAgent *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = self;
  if (-[PLXPCAgent shouldLogAppActivationData](self, "shouldLogAppActivationData"))
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("AppActivationPerformanceProcessData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
          v11 = objc_alloc(MEMORY[0x1E0D7FFB0]);
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v11, "initWithEntryKey:withRawData:", v5, v12);

          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Timestamp"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Timestamp"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "doubleValue");
            v19 = v18;

            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "convertFromSystemToMonotonic");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setEntryDate:", v21);

            -[PLOperator logEntry:](v23, "logEntry:", v13);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v7);
    }

  }
}

- (void)logEventPointAppActivationPerformanceCPUStatistics:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id obj;
  PLXPCAgent *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = self;
  if (-[PLXPCAgent shouldLogAppActivationData](self, "shouldLogAppActivationData"))
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("AppActivationPerformanceCPUStatistics"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
          v11 = objc_alloc(MEMORY[0x1E0D7FFB0]);
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v11, "initWithEntryKey:withRawData:", v5, v12);

          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Timestamp"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Timestamp"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "doubleValue");
            v19 = v18;

            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "convertFromSystemToMonotonic");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setEntryDate:", v21);

            -[PLOperator logEntry:](v23, "logEntry:", v13);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v7);
    }

  }
}

- (void)logEventPointAppActivationPerformanceMemoryStatistics:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id obj;
  PLXPCAgent *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = self;
  if (-[PLXPCAgent shouldLogAppActivationData](self, "shouldLogAppActivationData"))
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("AppActivationPerformanceMemoryStatistics"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
          v11 = objc_alloc(MEMORY[0x1E0D7FFB0]);
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v11, "initWithEntryKey:withRawData:", v5, v12);

          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Timestamp"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Timestamp"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "doubleValue");
            v19 = v18;

            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "convertFromSystemToMonotonic");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setEntryDate:", v21);

            -[PLOperator logEntry:](v23, "logEntry:", v13);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v7);
    }

  }
}

- (void)logEventPointAppActivationPerformancePowerStateStatistics:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id obj;
  PLXPCAgent *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = self;
  if (-[PLXPCAgent shouldLogAppActivationData](self, "shouldLogAppActivationData"))
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("AppActivationPerformancePowerStateStatistics"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
          v11 = objc_alloc(MEMORY[0x1E0D7FFB0]);
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v11, "initWithEntryKey:withRawData:", v5, v12);

          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Timestamp"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Timestamp"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "doubleValue");
            v19 = v18;

            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "convertFromSystemToMonotonic");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setEntryDate:", v21);

            -[PLOperator logEntry:](v23, "logEntry:", v13);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v7);
    }

  }
}

- (void)logEventForwardAvailabilityModes:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("AvailabilityModes"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v15, v5);
  v7 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v7, "dateWithTimeIntervalSince1970:", round(v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntryDate:", v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SemanticType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "numberWithUnsignedInt:", -[PLXPCAgent mapAvailabilityModeSemanticType:](self, "mapAvailabilityModeSemanticType:", (int)objc_msgSend(v13, "intValue")));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("SemanticType"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointFocusFilters:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("FocusFilters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v14);
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertFromSystemToMonotonic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:", round(v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEntryDate:", v10);

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("SemanticType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithUnsignedInt:", -[PLXPCAgent mapAvailabilityModeSemanticType:](self, "mapAvailabilityModeSemanticType:", (int)objc_msgSend(v12, "intValue")));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("SemanticType"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("SemanticType"));
  }
  -[PLOperator logEntry:](self, "logEntry:", v5);

}

- (void)logEventPointLocationVehicularDetectionSession:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("VehicularDetection"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v14, v5);

  v7 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v6, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;
  objc_msgSend(v6, "entryDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  *(float *)&v12 = v12;
  objc_msgSend(v7, "dateWithTimeIntervalSince1970:", round(v10 - fmodf(*(float *)&v12, 60.0)));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntryDate:", v13);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointMotionWakeReasonSession:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("MotionWakeReason"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointCommuteRefreshSession:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  id v22;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("CommuteRefresh"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v22, v5);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOIEntryDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "intValue");

  if ((int)v5 >= 1)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOIEntryDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOIEntryDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");
    objc_msgSend(v8, "numberWithInt:", (v10 + 300 * (v12 / 300) - v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("LOIEntryDate"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOIExitDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  if (v15 >= 1)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOIExitDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOIExitDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "intValue");
    objc_msgSend(v16, "numberWithInt:", (v18 + 300 * (v20 / 300) - v20));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("LOIExitDate"));

  }
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventPointSecItemSession:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("SecItem"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointDeepScanReasons:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("DeepScanReasons"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("AppLibraryID"));
          if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", v11);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "length");
              if (v15 >= 0xC8)
                v16 = 200;
              else
                v16 = v15;
              objc_msgSend(v14, "substringToIndex:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("Reason"));

            }
          }
          -[PLOperator logEntry:](self, "logEntry:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    v4 = v18;
  }

}

- (void)logEventPointSiriActivation:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10 && objc_msgSend(MEMORY[0x1E0D80020], "isWatch"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v4, "timeIntervalSince1970");
      objc_msgSend(v5, "dateWithTimeIntervalSince1970:", round(v6 / 60.0) * 60.0);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SiriActivation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v8, v10);
    objc_msgSend(v9, "setEntryDate:", v4);
    -[PLOperator logEntry:](self, "logEntry:", v9);

  }
}

- (void)logEventPointAirPlayDiscoveryMode:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  id v10;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("AirPlayDiscoveryMode"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Mode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PLXPCAgent modeTypeStringToEnum:](self, "modeTypeStringToEnum:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("Mode"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointShortcutsTriggerFired:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;

  if (a3)
  {
    v15 = (id)objc_msgSend(a3, "mutableCopy");
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("WFWorkflowName"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
LABEL_13:

        return;
      }
      v5 = v4;
      v6 = objc_msgSend(v4, "length");
      if (v6 >= 0x40)
        v7 = 64;
      else
        v7 = v6;
      objc_msgSend(v5, "substringToIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, CFSTR("WFWorkflowName"));

    }
    else
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, CFSTR("WFTriggerID"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, CFSTR("WFWorkflowID"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, CFSTR("WFWorkflowName"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, CFSTR("WFAssociatedAppBundleID"));
    }
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ShortcutsTriggerFired"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v9, v15);
    if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v10, "entryDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSince1970");
      objc_msgSend(v11, "dateWithTimeIntervalSince1970:", round(v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEntryDate:", v14);

    }
    -[PLOperator logEntry:](self, "logEntry:", v10);

    goto LABEL_13;
  }
}

- (void)logEventForwardSOSKVSRateLimitingEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  int64_t SOSKVSEntries;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[16];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp")), (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_15:
    PLLogXPC();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, "SOSKVSRateLimiting Event Dropped, invalid", buf, 2u);
    }
    goto LABEL_17;
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("peerShouldSend"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_15;
  }
  v9 = (void *)v8;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attributeBadness"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_15;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SOSKVSRateLimitingEvent"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertFromSystemToMonotonic");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("peerShouldSend"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  v30 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attributeBadness"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        SOSKVSEntries = self->_SOSKVSEntries;
        self->_SOSKVSEntries = SOSKVSEntries + 1;
        if (SOSKVSEntries >= 1000)
        {
          PLLogXPC();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "SOSKVSRateLimiting Event Dropped, table full", buf, 2u);
          }

          goto LABEL_21;
        }
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
        objc_msgSend(v26, "setEntryDate:", v16);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v24, CFSTR("AccessGroup"));
        objc_msgSend(v19, "objectForKeyedSubscript:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("BadnessLevel"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("peerShouldSend"));

        -[PLOperator logEntry:](self, "logEntry:", v26);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v21)
        continue;
      break;
    }
  }
LABEL_21:

  v5 = v30;
LABEL_17:

}

- (void)logEventPointOctagonTrustEvent:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = *MEMORY[0x1E0D80390];
    v5 = a3;
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("OctagonTrust"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

    -[PLOperator logEntry:](self, "logEntry:", v6);
  }
}

- (void)handleCKKSSyncingEvent:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("ratelimit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = CFSTR("CKKSSyncingRateLimit");
    else
      v6 = CFSTR("CKKSSyncing");
    v7 = (_QWORD *)MEMORY[0x1E0D80370];
    if (v5)
      v7 = (_QWORD *)MEMORY[0x1E0D80390];
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v8, v12);
    objc_msgSend(v12, "objectForKey:", CFSTR("items"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("items"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("count"));

    }
    -[PLOperator logEntry:](self, "logEntry:", v9);

    v4 = v12;
  }

}

- (void)logEventForwardGMSOptIn
{
  NSObject *v3;
  uint8_t v4[8];
  _QWORD v5[5];

  if (objc_msgSend(MEMORY[0x1E0D80020], "hasGenerativeModelSystems"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__PLXPCAgent_logEventForwardGMSOptIn__block_invoke;
    v5[3] = &unk_1E8581C10;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0D116A0], "getGMOptInToggleWithCompletion:", v5);
  }
  else
  {
    PLLogXPC();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEFAULT, "Device does not support GenerativeFunctionMetrics OptIn logging", v4, 2u);
    }

  }
}

void __37__PLXPCAgent_logEventForwardGMSOptIn__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  PLLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_error_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_ERROR, "Error grabbing GenerativeFunctionMetrics OptIn state, logging 0: %@", buf, 0xCu);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E86358C8, CFSTR("Enabled"));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = a2;
      _os_log_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEFAULT, "GenerativeFunctionMetrics OptIn isEnabled state: %d", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("Enabled"));

  }
  objc_msgSend(*(id *)(a1 + 32), "logForSubsystem:category:data:", CFSTR("GenerativeFunctionMetrics"), CFSTR("OptIn"), v6);
  objc_msgSend(*(id *)(a1 + 32), "logForSubsystem:category:data:", CFSTR("BackgroundProcessing"), CFSTR("GenerativeFunctionMetricsOptIn"), v6);
  v11 = v6;
  v10 = v6;
  AnalyticsSendEventLazy();

}

id __37__PLXPCAgent_logEventForwardGMSOptIn__block_invoke_2068(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLLogXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Enabled"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "GenerativeFunctionMetrics OptIn state being sent to Core Analytics: %@", (uint8_t *)&v5, 0xCu);

  }
  return *(id *)(a1 + 32);
}

- (void)logEventForwardAssetLoadGF:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasGenerativeModelSystems"))
  {
    v5 = objc_msgSend(v4, "mutableCopy");
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "convertFromSystemToMonotonic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("timestampValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v10, "intValue");

    v11 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catalogResourceIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFirstPartyBundleIDPrefix:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, CFSTR("catalogResourceIdentifier"));

    if ((_DWORD)v7 == 1)
    {
      -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("GenerativeFunctionMetrics"), CFSTR("assetLoad"), v5, v9);
    }
    else
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("timestampEnd"), &unk_1E86358C8, 6);
      v15 = objc_alloc(MEMORY[0x1E0D80080]);
      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("catalogResourceIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithKey:withValue:withComparisonOperation:", CFSTR("catalogResourceIdentifier"), v16, 0);

      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "storage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v17;
      v30[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastEntryForKey:withComparisons:isSingleton:", CFSTR("GenerativeFunctionMetrics_assetLoad_1_2"), v20, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogXPC();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
      if (v21)
      {
        if (v23)
        {
          *(_DWORD *)buf = 138412290;
          v29 = v21;
          _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics assetLoad found openEntry = %@", buf, 0xCu);
        }

        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __41__PLXPCAgent_logEventForwardAssetLoadGF___block_invoke;
        v24[3] = &unk_1E857BB40;
        v25 = v21;
        v26 = v9;
        v27 = v4;
        -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v25, v24);

      }
      else
      {
        if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics assetLoad did not find openEntry", buf, 2u);
        }

        -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, CFSTR("timestampEnd"));
        -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("GenerativeFunctionMetrics"), CFSTR("assetLoad"), v5, v9);
      }

    }
  }
  else
  {
    PLLogXPC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "Device does not support GenerativeFunctionMetrics assetLoad logging", buf, 2u);
    }
  }

}

void __41__PLXPCAgent_logEventForwardAssetLoadGF___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("timestampEnd"));
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("result"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("result"));

  PLLogXPC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics assetLoad updateEntry: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)logFileResidentInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_msgSend(v17, "mutableCopy");
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("timestampValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertFromSystemToMonotonic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("timestampValue"));
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("fileResidentRatio"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("fileResidentRatio"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v10, "numberWithInt:", (int)(v12 * 100.0));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("fileResidentRatio"));

  }
  v14 = (void *)MEMORY[0x1E0D80078];
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("catalogResourceIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFirstPartyBundleIDPrefix:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("catalogResourceIdentifier"));

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("GenerativeFunctionMetrics"), CFSTR("fileResidentInfo"), v4, v8);
}

- (void)logEventForwardMMExecuteRequest:(id)a3
{
  id v4;
  NSObject *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  _QWORD v37[4];
  id v38;
  id v39;
  NSObject *v40;
  uint8_t buf[4];
  void *v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasGenerativeModelSystems"))
  {
    v5 = objc_msgSend(v4, "mutableCopy");
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "convertFromSystemToMonotonic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("timestampValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v10, "intValue");

    if ((_DWORD)v7 == 1)
    {
      v11 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("createdByBundleIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFirstPartyBundleIDPrefix:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, CFSTR("createdByBundleIdentifier"));

      v14 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onBehalfOfBundleIdentifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeFirstPartyBundleIDPrefix:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v16, CFSTR("onBehalfOfBundleIdentifier"));

      v17 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catalogResourceIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeFirstPartyBundleIDPrefix:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, CFSTR("catalogResourceIdentifier"));

      -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("GenerativeFunctionMetrics"), CFSTR("mmExecuteRequest"), v5, v9);
    }
    else
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("timestampEnd"), &unk_1E86358C8, 6);
      v21 = objc_alloc(MEMORY[0x1E0D80080]);
      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("requestIdentifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithKey:withValue:withComparisonOperation:", CFSTR("requestIdentifier"), v22, 0);

      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "storage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v23;
      v43[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastEntryForKey:withComparisons:isSingleton:", CFSTR("GenerativeFunctionMetrics_mmExecuteRequest_1_2"), v26, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogXPC();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
      if (v27)
      {
        if (v29)
        {
          *(_DWORD *)buf = 138412290;
          v42 = v27;
          _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics mmExecuteRequest found openEntry = %@", buf, 0xCu);
        }

        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __46__PLXPCAgent_logEventForwardMMExecuteRequest___block_invoke;
        v37[3] = &unk_1E857BB40;
        v30 = v27;
        v38 = v30;
        v31 = v9;
        v39 = v31;
        v40 = v5;
        -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v30, v37);
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("onBehalfOfBundleIdentifier"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "entryDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "timeIntervalSince1970");
        v35 = v34;

        objc_msgSend(v31, "timeIntervalSince1970");
        -[PLXPCAgent setInferenceEntriesWithBundleID:inferenceStart:inferenceEnd:](self, "setInferenceEntriesWithBundleID:inferenceStart:inferenceEnd:", v32, v35, v36);

      }
      else
      {
        if (v29)
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics mmExecuteRequest did not find openEntry", buf, 2u);
        }

        -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, CFSTR("timestampEnd"));
        -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("GenerativeFunctionMetrics"), CFSTR("mmExecuteRequest"), v5, v9);
      }

    }
  }
  else
  {
    PLLogXPC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "Device does not support GenerativeFunctionMetrics mmExecuteRequest logging", buf, 2u);
    }
  }

}

void __46__PLXPCAgent_logEventForwardMMExecuteRequest___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("timestampEnd"));
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("error"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("error"));

  PLLogXPC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics mmExecuteRequest updateEntry: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)logEventForwardSummarization:(id)a3
{
  int v4;
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
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *summarizationEntries;
  void *v20;
  id v21;

  v21 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0D80020], "hasGenerativeModelSystems");
  v5 = v21;
  if (v4)
  {
    v6 = (void *)objc_msgSend(v21, "mutableCopy");
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "convertFromSystemToMonotonic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("timestampEnd"));
    v11 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("timestampStart"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "convertFromSystemToMonotonic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "removeObjectForKey:", CFSTR("timestampStart"));
    -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("GenerativeFunctionMetrics"), CFSTR("Summarization"), v6, v14);
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("kind"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v15, "intValue");

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("stackDepth"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");

    if ((_DWORD)v13 && v16 && (int)v18 >= 1)
    {
      summarizationEntries = self->_summarizationEntries;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](summarizationEntries, "setObject:forKey:", v20, v16);

    }
    v5 = v21;
  }

}

- (void)logEventForwardTGIExecuteRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasGenerativeModelSystems"))
  {
    v5 = objc_msgSend(v4, "mutableCopy");
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "convertFromSystemToMonotonic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("timestampValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    PLLogXPC();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v38) = v11;
      _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics eventType: %d", buf, 8u);
    }

    if (v11 == 1)
    {
      -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("GenerativeFunctionMetrics"), CFSTR("tgiExecuteRequest"), v5, v9);
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("timestampEnd"), &unk_1E86358C8, 6);
      v14 = objc_alloc(MEMORY[0x1E0D80080]);
      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("requestIdentifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithKey:withValue:withComparisonOperation:", CFSTR("requestIdentifier"), v15, 0);

      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "storage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v16;
      v39[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastEntryForKey:withComparisons:isSingleton:", CFSTR("GenerativeFunctionMetrics_tgiExecuteRequest_1_2"), v19, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogXPC();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
      if (v20)
      {
        if (v22)
        {
          *(_DWORD *)buf = 138412290;
          v38 = v20;
          _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics tgiExecuteRequest found openEntry = %@", buf, 0xCu);
        }

        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __47__PLXPCAgent_logEventForwardTGIExecuteRequest___block_invoke;
        v33[3] = &unk_1E857BB40;
        v34 = v20;
        v35 = v9;
        v36 = v4;
        -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v34, v33);

      }
      else
      {
        if (v22)
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics tgiExecuteRequest did not find openEntry", buf, 2u);
        }

        -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, CFSTR("timestampEnd"));
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sd_draftTokenAcceptanceRate"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v24 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sd_draftTokenAcceptanceRate"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          objc_msgSend(v24, "numberWithInt:", (int)(v26 * 100.0));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v27, CFSTR("sd_draftTokenAcceptanceRate"));

        }
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sd_speculationSuccessRate"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sd_speculationSuccessRate"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          objc_msgSend(v29, "numberWithInt:", (int)(v31 * 100.0));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v32, CFSTR("sd_speculationSuccessRate"));

        }
        -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("GenerativeFunctionMetrics"), CFSTR("tgiExecuteRequest"), v5, v9);
      }

    }
  }
  else
  {
    PLLogXPC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "Device does not support GenerativeFunctionMetrics tgiExecuteRequest logging", buf, 2u);
    }
  }

}

void __47__PLXPCAgent_logEventForwardTGIExecuteRequest___block_invoke(uint64_t a1)
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("timestampEnd"));
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("errorType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("errorType"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("extendTokenInferenceLatency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, CFSTR("extendTokenInferenceLatency"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("firstTokenInferenceLatency"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("firstTokenInferenceLatency"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("inputTokensCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("inputTokensCount"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("outputTokensCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("outputTokensCount"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("qos"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("qos"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("sd_draftModelInferenceCallCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("sd_draftModelInferenceCallCount"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("sd_targetModelInferenceCallCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("sd_targetModelInferenceCallCount"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("sd_draftOutputTokensCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("sd_draftOutputTokensCount"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("sd_totalOutputTokensCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, CFSTR("sd_totalOutputTokensCount"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("sd_draftModelTotalLatency"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, CFSTR("sd_draftModelTotalLatency"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("sd_targetModelTotalLatency"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, CFSTR("sd_targetModelTotalLatency"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("sd_draftTokenAcceptanceRate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("sd_draftTokenAcceptanceRate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    objc_msgSend(v15, "numberWithInt:", (int)(v17 * 100.0));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, CFSTR("sd_draftTokenAcceptanceRate"));

  }
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("sd_speculationSuccessRate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("sd_speculationSuccessRate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    objc_msgSend(v20, "numberWithInt:", (int)(v22 * 100.0));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v23, CFSTR("sd_speculationSuccessRate"));

  }
  PLLogXPC();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v25 = *(_QWORD *)(a1 + 32);
    v26 = 138412290;
    v27 = v25;
    _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics tgiExecuteRequest updateEntry: %@", (uint8_t *)&v26, 0xCu);
  }

}

- (void)logEventForwardSmartReplySession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  PLXPCAgent *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  _QWORD v41[7];

  v41[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasGenerativeModelSystems"))
  {
    v5 = objc_msgSend(v4, "mutableCopy");
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "convertFromSystemToMonotonic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("EventTime"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EventType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    PLLogXPC();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = v11;
      _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics SmartReplySession %d", buf, 8u);
    }

    if (v11)
    {
      v32 = v9;
      v34 = self;
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("timestampEnd"), &unk_1E86358C8, 6);
      v14 = objc_alloc(MEMORY[0x1E0D80080]);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("App"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "initWithKey:withValue:withComparisonOperation:", CFSTR("App"), v15, 0);

      v17 = objc_alloc(MEMORY[0x1E0D80080]);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("QueryType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "initWithKey:withValue:withComparisonOperation:", CFSTR("QueryType"), v18, 0);

      v20 = objc_alloc(MEMORY[0x1E0D80080]);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InputTokenCount"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithKey:withValue:withComparisonOperation:", CFSTR("InputTokenCount"), v21, 0);

      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("OutputTokenCount"), &unk_1E86358C8, 6);
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "storage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)v13;
      v41[0] = v13;
      v41[1] = v16;
      v31 = (void *)v16;
      v26 = (void *)v19;
      v41[2] = v19;
      v41[3] = v22;
      v41[4] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastEntryForKey:withComparisons:isSingleton:", CFSTR("GenerativeFunctionMetrics_SmartReplySession_1_2"), v27, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogXPC();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
      if (v28)
      {
        v9 = v32;
        if (v30)
        {
          *(_DWORD *)buf = 138412290;
          v40 = v28;
          _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics SmartReplySession found openEntry = %@", buf, 0xCu);
        }

        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __47__PLXPCAgent_logEventForwardSmartReplySession___block_invoke;
        v35[3] = &unk_1E857BB40;
        v36 = v28;
        v37 = v32;
        v38 = v4;
        -[PLOperator updateEntry:withBlock:](v34, "updateEntry:withBlock:", v36, v35);

      }
      else
      {
        v9 = v32;
        if (v30)
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics SmartReplySession did not find openEntry", buf, 2u);
        }

        -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v32, CFSTR("timestampEnd"));
        -[PLOperator logForSubsystem:category:data:date:](v34, "logForSubsystem:category:data:date:", CFSTR("GenerativeFunctionMetrics"), CFSTR("SmartReplySession"), v5, v32);
      }

    }
    else
    {
      -[NSObject removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("OutputTokenCount"));
      -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("GenerativeFunctionMetrics"), CFSTR("SmartReplySession"), v5, v9);
    }

  }
  else
  {
    PLLogXPC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "Device does not support GenerativeFunctionMetrics smartReplySession logging", buf, 2u);
    }
  }

}

void __47__PLXPCAgent_logEventForwardSmartReplySession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("timestampEnd"));
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("OutputTokenCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("OutputTokenCount"));

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("EventType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, CFSTR("EventType"));

  PLLogXPC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics SmartReplySession updateEntry: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (int)convertPixelCount:(int)a3
{
  NSObject *v4;
  NSObject *v6;
  int v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLLogXPC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = 67109120;
    v8 = a3;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics appleDiffusion converting pixelCount %d to a bucket", (uint8_t *)&v7, 8u);
  }

  if ((a3 - 100000) < 0x186A1)
    return 1;
  if ((a3 - 200001) < 0x493E0)
    return 2;
  if ((a3 - 500001) < 0x927C0)
    return 3;
  if (a3 > 1100000)
    return 4;
  PLLogXPC();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 67109120;
    v8 = a3;
    _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics appleDiffusion pixelCount %d does not fall in any bucket", (uint8_t *)&v7, 8u);
  }

  return 5;
}

- (void)logEventForwardAppleDiffusion:(id)a3
{
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
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasGenerativeModelSystems"))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertFromSystemToMonotonic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("timestampEnd"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertFromSystemToMonotonic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "removeObjectForKey:", CFSTR("startDate"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inputPixels"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputPixels"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithInt:", -[PLXPCAgent convertPixelCount:](self, "convertPixelCount:", objc_msgSend(v12, "intValue")));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("inputPixels"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("outputPixels"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outputPixels"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithInt:", -[PLXPCAgent convertPixelCount:](self, "convertPixelCount:", objc_msgSend(v16, "intValue")));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("outputPixels"));

    }
    PLLogXPC();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "GenerativeFunctionMetrics appleDiffusion updatedPayload: %@", (uint8_t *)&v19, 0xCu);
    }

    -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("GenerativeFunctionMetrics"), CFSTR("appleDiffusion"), v5, v9);
  }

}

- (void)logEventForwardHandwritingInference:(id)a3
{
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v4 = (void *)objc_msgSend(v33, "mutableCopy");
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("startTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertFromSystemToMonotonic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("startTimestamp"));
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("endTimestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "convertFromSystemToMonotonic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("timestampEnd"));
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("inputStringLength"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("inputStringLength"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "roundToSigFig:withSigFig:", objc_msgSend(v16, "intValue"), 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("inputStringLength"));

  }
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("inputStrokeCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    v20 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("inputStrokeCount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithInt:", objc_msgSend(v20, "roundToSigFig:withSigFig:", objc_msgSend(v21, "intValue"), 1));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("inputStrokeCount"));

  }
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("outputStringLength"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0CB37E8];
    v25 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("outputStringLength"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "numberWithInt:", objc_msgSend(v25, "roundToSigFig:withSigFig:", objc_msgSend(v26, "intValue"), 1));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("outputStringLength"));

  }
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("outputStrokeCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = (void *)MEMORY[0x1E0CB37E8];
    v30 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("outputStrokeCount"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "numberWithInt:", objc_msgSend(v30, "roundToSigFig:withSigFig:", objc_msgSend(v31, "intValue"), 1));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("outputStrokeCount"));

  }
  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("GenerativeFunctionMetrics"), CFSTR("HandwritingInference"), v4, v8);

}

- (void)logEventPointANE:(id)a3 withCategory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasANE"))
    goto LABEL_22;
  PLLogXPC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138412290;
    v19 = v7;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "logEventPointANE for category: %@", (uint8_t *)&v18, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    PLLogXPC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "logEventPointANE internal build, payload: %@", (uint8_t *)&v18, 0xCu);
    }

    -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("ANE"), v7, v6);
    goto LABEL_22;
  }
  v10 = (void *)objc_msgSend(v6, "mutableCopy");
  PLLogXPC();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138412290;
    v19 = v10;
    _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "logEventPointANE mutablepayload: %@", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(v6, "objectForKey:", CFSTR("privacy_score"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("privacy_score"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    PLLogXPC();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v18 = 67109120;
      LODWORD(v19) = v14;
      _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "logEventPointANE privacy_score: %d", (uint8_t *)&v18, 8u);
    }

    if ((v14 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
    PLLogXPC();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "logEventPointANE privacy_score missing", (uint8_t *)&v18, 2u);
    }

  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &stru_1E8587D00, CFSTR("modelURL"));
LABEL_19:
  PLLogXPC();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138412290;
    v19 = v10;
    _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "logEventPointANE updated payload: %@", (uint8_t *)&v18, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("ANE"), v7, v10);
LABEL_22:

}

- (void)logEventForwardWatchPresence:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  id v10;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("WatchPresence"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v10, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Event"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PLXPCAgent eventNameStringToEnum:](self, "eventNameStringToEnum:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("Event"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardUIKitKeyboard:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("UIKitKeyboard"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardUIKitEclipse:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("UIKitEclipse"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardWirelessSync:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("WirelessSync"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v9, v5);
  objc_msgSend(v5, "objectForKey:", CFSTR("DurationSeconds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = MEMORY[0x1E0C9AAA0];
  else
    v8 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("SyncStart"));
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventForwardMXDiscoveryLevel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("MXDiscoveryLevel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v16);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Client"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Client"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ObjectHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("ObjectHash"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Level"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("Level"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OnBehalfOf"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v23 = CFSTR("OnBehalfOf");
        v24 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OnBehalfOf"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v13);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v9);
  }

  -[PLOperator logEntry:](self, "logEntry:", v4);
}

- (void)logEventForwardCarPlay:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("CarPlay"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardCarPlayScreens:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  int64_t v10;
  void *v11;
  id v12;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("CarPlayScreens"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v12, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Width"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Height"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v9, "unsignedIntValue");
  v10 = -[PLXPCAgent mapPixelsToBucket:](self, "mapPixelsToBucket:", v5 * (unint64_t)v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("Size"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardSecondaryDisplay:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isiPad") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isMac"))
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SecondaryDisplay"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v6);
    -[PLOperator logEntry:](self, "logEntry:", v5);

  }
}

- (void)logEventForwardUIKitActivity:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("UIKitActivity"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardUIKitAlert:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("UIKitAlert"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardSafariFetcherStatus:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("SafariFetcher"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardAppleBackklightBrightness:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linearBrightness"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("linearBrightness"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      v10 = (int)(v9 * 100.0);
      PLLogXPC();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v15 = 67109120;
        v16 = (int)(v9 * 100.0);
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "Received linear brightness: %d\n", (uint8_t *)&v15, 8u);
      }

      if (self->_lastLinearBrightness == v10)
      {
        PLLogXPC();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v15 = 67109120;
          v16 = (int)(v9 * 100.0);
          _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "Skip same linear brightness logging: %d\n", (uint8_t *)&v15, 8u);
        }
      }
      else
      {
        self->_lastLinearBrightness = v10;
        +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("AppleBacklightBrightness"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v12, v5);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_lastLinearBrightness);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("linearBrightness"));

        -[PLOperator logEntry:](self, "logEntry:", v13);
      }

    }
  }

}

- (void)logEventForwardAccessory:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("Accessory"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardAppAccessory:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("AppAccessory"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (unint64_t)convertAirDropSessionState:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Start")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Stop")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Failed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InterfaceChanged")) & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    PLLogXPC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "AirDropSession Unknown/Other AirDropSession State %@", (uint8_t *)&v7, 0xCu);
    }

    v4 = 4;
  }

  return v4;
}

- (void)logEventForwardAirDropSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("AirDropSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v4);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Subevent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "isEqualToString:", CFSTR("Send")) ^ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("Subevent"));

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("State"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLXPCAgent convertAirDropSessionState:](self, "convertAirDropSessionState:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("State"));

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ContentSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ContentSize"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    LODWORD(v16) = llround(v15 * 0.000000953674316);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("FileSize"));

  }
  v18 = (void *)MEMORY[0x1E0D80078];
  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("TransferID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hashString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("Identifier"));

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Interface"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("Interface"));

  -[PLOperator logEntry:](self, "logEntry:", v5);
}

- (void)logEventForwardAirDrop:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("AirDrop"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v8, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("bundleId"));
  -[PLOperator logEntry:](self, "logEntry:", v6);
  -[PLXPCAgent createAirDropAccountingEvent:](self, "createAirDropAccountingEvent:", v6);

}

- (void)logEventForwardSiri:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("Siri"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardInCallService:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("InCallService"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v13, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("providerContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCallSubType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("kCallSubType"));
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "entryDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    objc_msgSend(v9, "dateWithTimeIntervalSince1970:", round(v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEntryDate:", v12);

  }
  -[PLOperator logEntry:](self, "logEntry:", v6);
  -[PLXPCAgent createInCallServiceAccountingEvent:](self, "createInCallServiceAccountingEvent:", v6);

}

- (void)logEventForwardCallScreeningEnabled:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("CallScreeningEnabled"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardWebApp:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("WebApp"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardThermalLevel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  unint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ThermalLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v17);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Time"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Time"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "earlierDate:", v6);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  objc_msgSend(v6, "convertFromSystemToMonotonic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v13);
  v15 = llround(v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("startOffset"));

  -[PLOperator logEntry:](self, "logEntry:", v5);
}

- (void)logEventForwardThermalSensors:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ThermalSensors"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v13);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Time"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Time"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "earlierDate:", v6);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  objc_msgSend(v6, "convertFromSystemToMonotonic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEntryDate:", v12);

  -[PLOperator logEntry:](self, "logEntry:", v5);
}

- (void)logEventForwardThermalHiP:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  unint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ThermalHiP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v16);
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Time"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Time"));
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v7, "intValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "earlierDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertFromSystemToMonotonic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "entryDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v12);
  v14 = llround(v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("timeOffset"));

  -[PLOperator logEntry:](self, "logEntry:", v5);
}

- (void)logEventForwardNetworkRelay:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  id v11;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("NetworkRelay"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v11, v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v8, "dateWithTimeIntervalSince1970:", round(v9 / 60.0) * 60.0);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  objc_msgSend(v6, "setEntryDate:", v7);
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventForwardNetworkRelayWiFiAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WiFiAssertionClients"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("NetworkRelayWiFiAssertion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v7);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WiFiWoWState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("WiFiWoWState"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WiFiClientType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("WiFiClientType"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WiFiAssertionReason"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("WiFiAssertionReason"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("WiFiAssertionClients"));
  -[PLOperator logEntry:](self, "logEntry:", v8);

}

- (void)logEventForwardAudioRouting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  v4 = a3;
  if (v4)
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("AudioRouting"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
    objc_msgSend(v4, "valueForKey:", CFSTR("timestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "convertFromSystemToMonotonic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEntryDate:", v11);

    }
    objc_msgSend(v4, "valueForKey:", CFSTR("kEventType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ScanStart"));

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = 1;
    }
    else
    {
      objc_msgSend(v4, "valueForKey:", CFSTR("kEventType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("ScanStop"));

      v14 = (void *)MEMORY[0x1E0CB37E8];
      if (v18)
        v15 = 2;
      else
        v15 = 3;
    }
    objc_msgSend(v14, "numberWithInt:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("EventType"));
    objc_msgSend(v4, "valueForKey:", CFSTR("kScanType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("ScanType"));

    -[PLOperator logEntry:](self, "logEntry:", v6);
  }
  else
  {
    PLLogXPC();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_ERROR, "Received null payload with SmartRouting event.", v21, 2u);
    }

  }
}

- (void)logEventForwardAccessoryMotion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("AccessoryMotion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v15);
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("client"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("client"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("/usr/sbin/mediaserverd"));

    if (v9)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("mediaserverd"), CFSTR("client"));
  }
  -[PLOperator logEntry:](self, "logEntry:", v5);
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("tracking"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("client"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v12, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 46, v13, v14);
  else
    objc_msgSend(v12, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 46, v13, v14);

}

- (void)logEventFowardUARPStatus:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLXPCAgent accessoryUARPEntryCount](self, "accessoryUARPEntryCount") < 501)
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("UARPStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v6, v4);
    -[PLOperator logEntry:](self, "logEntry:", v7);
    -[PLXPCAgent setAccessoryUARPEntryCount:](self, "setAccessoryUARPEntryCount:", -[PLXPCAgent accessoryUARPEntryCount](self, "accessoryUARPEntryCount") + 1);

  }
  else
  {
    PLLogXPC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_error_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_ERROR, "Discarding entry %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)logEventForwardDosimetry:(id)a3
{
  id v4;
  void *v5;
  PLEntry *lastDosimetryEntry;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("noiseEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    lastDosimetryEntry = self->_lastDosimetryEntry;
    if (!lastDosimetryEntry)
      goto LABEL_4;
    -[PLEntry objectForKeyedSubscript:](lastDosimetryEntry, "objectForKeyedSubscript:", CFSTR("noiseEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("noiseEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v8 == v10)
    {
      v14 = 0;
    }
    else
    {
LABEL_4:
      +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Dosimetry"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v11, v4);
      -[PLOperator logEntry:](self, "logEntry:", v12);
      -[PLXPCAgent setLastDosimetryEntry:](self, "setLastDosimetryEntry:", v12);
      PLLogXPC();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[PLEntry objectForKeyedSubscript:](self->_lastDosimetryEntry, "objectForKeyedSubscript:", CFSTR("noiseEnabled"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = CFSTR("noiseEnabled");
        v22 = 2112;
        v23 = (uint64_t)v19;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "Dosimetry state %@ changed to %@\n", (uint8_t *)&v20, 0x16u);

      }
      v14 = 1;
    }
    PLLogXPC();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("noiseEnabled"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = "skipped";
      v20 = 138412802;
      v21 = CFSTR("noiseEnabled");
      if (v14)
        v18 = "logged";
      v22 = 2112;
      v23 = v16;
      v24 = 2080;
      v25 = v18;
      _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "Dosimetry state %@ = %@ %s\n", (uint8_t *)&v20, 0x20u);

    }
  }

}

- (void)logEventForwardSpatialAudio:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("SpatialAudio"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v8, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stereoUpmix"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("up-mixing"));
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventForwardPasskeyAuthentication:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("PasskeyAuthentication"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardEnhancedDiscovery:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("EnhancedDiscovery"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v6, v4);

  -[PLOperator logEntry:](self, "logEntry:", v5);
}

- (void)logEventForwardSleepMode:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int out_token;
  uint8_t buf[16];

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80078], "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SleepMode"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SleepTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithEntryKey:withRawData:", v5, v7);

    -[PLOperator logEntry:](self, "logEntry:", v8);
    out_token = 0;
    notify_register_check((const char *)objc_msgSend(CFSTR("PLSleepModeNotification"), "UTF8String"), &out_token);
    LODWORD(v7) = out_token;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    notify_set_state((int)v7, objc_msgSend(v9, "integerValue"));

    notify_post((const char *)objc_msgSend(CFSTR("PLSleepModeNotification"), "UTF8String"));
    notify_cancel(out_token);

  }
  else
  {
    PLLogXPC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_ERROR, "SleepMode submission not allowed by IHA", buf, 2u);
    }
  }

}

- (void)logEventForwardRapidSecurityResponse:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("RapidSecurityResponse"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardRelevanceContextUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampOfEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObjectForKey:", CFSTR("timestampOfEvent"));
  PLLogXPC();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "RelevanceContextUpdate updated payload: %@", (uint8_t *)&v11, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("Widget"), CFSTR("RelevanceContextUpdate"), v5, v9);
}

- (void)logEventForwardLinkAdvisory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogXPC();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v9;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "LinkAdvisory monotonic eventTime: %@", (uint8_t *)&v11, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("NetworkRelay"), CFSTR("LinkAdvisory"), v5, v9);
}

- (void)logEventForwardIHA
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D80078], "isHealthDataSubmissionAllowed");
  PLLogXPC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "IHA Toggle State: %d", (uint8_t *)v7, 8u);
  }

  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("Enabled"));

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("XPCMetrics"), CFSTR("IHAConsent"), v5);
}

- (void)logEventBackwardCallScreeningDuration:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("CallScreeningDuration"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardNameSpotlightQos:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "isMac"))
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("SpotlightQos"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v3, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v20)
    {
      v18 = *(_QWORD *)v28;
      v19 = v3;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(obj);
          v21 = v6;
          v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v6);
          objc_msgSend(v3, "objectForKeyedSubscript:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v8, "allKeys");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v24;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v24 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
                v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v4, v5);
                objc_msgSend(v15, "setObject:forKeyedSubscript:", v7, CFSTR("utiType"));
                objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("qos"));
                objc_msgSend(v8, "objectForKeyedSubscript:", v14);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("count"));

                -[PLOperator logEntry:](self, "logEntry:", v15);
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v11);
          }

          v6 = v21 + 1;
          v3 = v19;
        }
        while (v21 + 1 != v20);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v20);
    }

  }
}

- (void)logEventPointNameSpotlightWatchdogFired:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "isMac"))
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("SpotlightWatchdogFired"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v6);
    -[PLOperator logEntry:](self, "logEntry:", v5);

  }
}

- (void)logEventBackwardNamePop:(id)a3
{
  -[PLXPCAgent setPopCount:](self, "setPopCount:", -[PLXPCAgent popCount](self, "popCount", a3) + 1);
}

- (void)logEventBackwardNamePeek:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  int64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  int64_t v27;
  uint64_t v28;
  int v29;
  int64_t v30;
  __int16 v31;
  NSObject *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("PeekPop"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Process-ID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  -[PLXPCAgent peekStartTime](self, "peekStartTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[PLXPCAgent setPeekStartTime:](self, "setPeekStartTime:", 0);
    -[PLXPCAgent setPeekpopProcessID:](self, "setPeekpopProcessID:", v7);
    -[PLXPCAgent setPeekCount:](self, "setPeekCount:", 0);
    -[PLXPCAgent setPopCount:](self, "setPopCount:", 0);
    -[PLXPCAgent setPeekDuration:](self, "setPeekDuration:", 0.0);
  }
  if (-[PLXPCAgent peekpopProcessID](self, "peekpopProcessID")
    && v7 != -[PLXPCAgent peekpopProcessID](self, "peekpopProcessID"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PLXPCAgent peekpopProcessID](self, "peekpopProcessID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("Process-ID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PLXPCAgent peekCount](self, "peekCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("PeekCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PLXPCAgent popCount](self, "popCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("PopCount"));

    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[PLXPCAgent peekDuration](self, "peekDuration");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("PeekDuration"));

    -[PLOperator logEntry:](self, "logEntry:", v9);
    -[PLXPCAgent setPeekCount:](self, "setPeekCount:", 0);
    -[PLXPCAgent setPopCount:](self, "setPopCount:", 0);
    -[PLXPCAgent setPeekDuration:](self, "setPeekDuration:", 0.0);
    -[PLXPCAgent setPeekStartTime:](self, "setPeekStartTime:", 0);

  }
  -[PLXPCAgent setPeekpopProcessID:](self, "setPeekpopProcessID:", v7);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Status"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  if (v16 == 1)
  {
    -[PLXPCAgent setPeekCount:](self, "setPeekCount:", -[PLXPCAgent peekCount](self, "peekCount") + 1);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Timestamp"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLXPCAgent setPeekStartTime:](self, "setPeekStartTime:", v17);

    PLLogXPC();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = -[PLXPCAgent peekpopProcessID](self, "peekpopProcessID");
      -[PLXPCAgent peekStartTime](self, "peekStartTime");
      v20 = objc_claimAutoreleasedReturnValue();
      v29 = 134218242;
      v30 = v19;
      v31 = 2112;
      v32 = v20;
      _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "Process-ID=%ld, Peek start time=%@", (uint8_t *)&v29, 0x16u);

    }
LABEL_13:

    goto LABEL_14;
  }
  -[PLXPCAgent peekStartTime](self, "peekStartTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Timestamp"));
    v18 = objc_claimAutoreleasedReturnValue();
    -[PLXPCAgent peekStartTime](self, "peekStartTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSinceDate:](v18, "timeIntervalSinceDate:", v22);
    v24 = v23;
    -[PLXPCAgent peekDuration](self, "peekDuration");
    -[PLXPCAgent setPeekDuration:](self, "setPeekDuration:", v24 + v25);

    PLLogXPC();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = -[PLXPCAgent peekpopProcessID](self, "peekpopProcessID");
      -[PLXPCAgent peekDuration](self, "peekDuration");
      v29 = 134218498;
      v30 = v27;
      v31 = 2112;
      v32 = v18;
      v33 = 2048;
      v34 = v28;
      _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "Process-ID=%ld, Peek end time=%@, Peek duration=%f", (uint8_t *)&v29, 0x20u);
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (void)logEventBackwardAttentionSampling:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("AASSampling"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardAttentionPolling:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("AASPolling"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardAttentionService:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("AASService"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardODOff:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("ODOff"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardODOn:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("ODOn"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardODHN:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("ODHN"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardEnergyTelemetry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  int v57;
  NSObject *log;
  unint64_t v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;
  id (*v68)(uint64_t);
  void *v69;
  double v70;
  _BYTE v71[128];
  NSObject *v72;
  void *v73;
  uint8_t buf[4];
  _BYTE v75[18];
  __int16 v76;
  double v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("EnergyTelemetry"));
    log = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NumRows"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Keys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", CFSTR("telemetry_date"));

    v59 = v9;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      PLLogXPC();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, "[Energy Telemetry] Date key not found in payload", buf, 2u);
      }
      goto LABEL_31;
    }
    if (!v7)
    {
LABEL_20:
      if (!objc_msgSend(v5, "count"))
      {
LABEL_32:

        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v36 = objc_claimAutoreleasedReturnValue();
      -[NSObject timeIntervalSince1970](v36, "timeIntervalSince1970");
      v38 = v37;
      objc_msgSend(v5, "lastObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "entryDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "timeIntervalSince1970");
      v42 = v41;

      v43 = (v38 - v42) / 60.0;
      PLLogCommon();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "lastObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "entryDate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v75 = v36;
        *(_WORD *)&v75[8] = 2112;
        *(_QWORD *)&v75[10] = v46;
        v76 = 2048;
        v77 = v43;
        _os_log_impl(&dword_1CAF47000, v44, OS_LOG_TYPE_DEFAULT, "[Energy Telemetry] receivedTime = %@, endTime = %@, delayInMinutes = %f", buf, 0x20u);

      }
      v66 = MEMORY[0x1E0C809B0];
      v67 = 3221225472;
      v68 = __46__PLXPCAgent_logEventBackwardEnergyTelemetry___block_invoke;
      v69 = &__block_descriptor_40_e19___NSDictionary_8__0l;
      v70 = v43;
      AnalyticsSendEventLazy();
      v72 = log;
      v73 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v47, log);

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v61 = v5;
      v48 = v5;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v63 != v51)
              objc_enumerationMutation(v48);
            v53 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            objc_msgSend(v53, "dictionary");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "entryDate");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("EnergyMetrics"), CFSTR("EnergyAccounting"), v54, v55);

          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        }
        while (v50);
      }

      v11 = v36;
      v5 = v61;
LABEL_31:

      goto LABEL_32;
    }
    v12 = 0;
    v13 = 0x1E0CB3000uLL;
    *(_QWORD *)&v10 = 138412546;
    v56 = v10;
    v60 = v4;
    v57 = v7;
    while (1)
    {
      objc_msgSend(*(id *)(v13 + 2024), "numberWithUnsignedInt:", v12, v56);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        objc_msgSend(*(id *)(v13 + 2024), "numberWithUnsignedInt:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v17);
        v18 = v13;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        v13 = v18;
        if (v20 > v59)
        {
          objc_msgSend(*(id *)(v18 + 2024), "numberWithUnsignedInt:", v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", v59);
          v23 = objc_claimAutoreleasedReturnValue();

          v24 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend(*(id *)(v18 + 2024), "numberWithUnsignedInt:", v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("Keys"));
          v27 = v5;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "dictionaryWithObjects:forKeys:", v26, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = v27;
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", log, v29);
          -[NSObject convertFromSystemToMonotonic](v23, "convertFromSystemToMonotonic");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setEntryDate:", v31);

          objc_msgSend(v27, "addObject:", v30);
          PLLogCommon();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v30, "entryDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v75 = v12;
            *(_WORD *)&v75[4] = 2112;
            *(_QWORD *)&v75[6] = v33;
            _os_log_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEFAULT, "[Energy Telemetry] sample %d entryDate = %@", buf, 0x12u);

          }
          v7 = v57;
          v13 = v18;
          goto LABEL_16;
        }
      }
      else
      {

      }
      PLLogXPC();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(v13 + 2024), "numberWithUnsignedInt:", v12);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v60;
        objc_msgSend(v60, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v56;
        *(_QWORD *)v75 = v35;
        *(_WORD *)&v75[8] = 1024;
        *(_DWORD *)&v75[10] = v12;
        _os_log_error_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_ERROR, "[Energy Telemetry] Invalid sample %@ at index %d", buf, 0x12u);

        goto LABEL_17;
      }
LABEL_16:
      v4 = v60;
LABEL_17:

      v12 = (v12 + 1);
      if (v7 == (_DWORD)v12)
        goto LABEL_20;
    }
  }
  PLLogXPC();
  log = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CAF47000, log, OS_LOG_TYPE_ERROR, "[Energy Telemetry] Empty payload", buf, 2u);
  }
LABEL_33:

}

id __46__PLXPCAgent_logEventBackwardEnergyTelemetry___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("delay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)logEventBackwardDRMaxRate:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("DRMaxRate"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventBackwardUbiquityAccountStatistics:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("UbiquityAccountStatistics"));
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v31, v5);

  if ((objc_msgSend(MEMORY[0x1E0D80020], "internalBuild") & 1) == 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalNumberOfDirectories"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    if (v8 >= 101)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalNumberOfDirectories"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "roundToSigFig:withSigFig:", objc_msgSend(v11, "intValue"), 2));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("totalNumberOfDirectories"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalNumberOfDocuments"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");

    if (v14 >= 101)
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalNumberOfDocuments"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "roundToSigFig:withSigFig:", objc_msgSend(v17, "intValue"), 2));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("totalNumberOfDocuments"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalNumberOfItems"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "intValue");

    if (v20 >= 101)
    {
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v22 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalNumberOfItems"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "numberWithInt:", objc_msgSend(v22, "roundToSigFig:withSigFig:", objc_msgSend(v23, "intValue"), 2));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("totalNumberOfItems"));

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalNumberOfFaults"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "intValue");

    if (v26 >= 101)
    {
      v27 = (void *)MEMORY[0x1E0CB37E8];
      v28 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalNumberOfFaults"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "numberWithInt:", objc_msgSend(v28, "roundToSigFig:withSigFig:", objc_msgSend(v29, "intValue"), 2));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, CFSTR("totalNumberOfFaults"));

    }
  }
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventPointNetworkSymptomsAdviosry:(id)a3
{
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
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  if (v4)
  {
    v21 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Network Type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v21;
    if (v5)
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("advisoryKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v21;
      if (v6)
      {
        -[PLXPCAgent localCache](self, "localCache");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Symptoms-NetworkAdvisory"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          v9 = (void *)objc_opt_new();
          -[PLXPCAgent localCache](self, "localCache");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("Symptoms-NetworkAdvisory"));

        }
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Network Type"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("advisoryKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLXPCAgent localCache](self, "localCache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Symptoms-NetworkAdvisory"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15 || (v16 = objc_msgSend(v15, "intValue"), v16 != objc_msgSend(v12, "intValue")))
        {
          -[PLXPCAgent localCache](self, "localCache");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Symptoms-NetworkAdvisory"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, v11);

          +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Symptoms-NetworkAdvisory"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v19);
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, CFSTR("Network Type"));
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, CFSTR("advisoryKey"));
          -[PLOperator logEntry:](self, "logEntry:", v20);

        }
        v4 = v21;
      }
    }
  }

}

- (void)logEventPointCacheDelete:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  PLXPCAgent *v19;
  void *v20;
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v19 = self;
  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("CacheDelete"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v3;
  objc_msgSend(v3, "objectForKey:", CFSTR("events"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80078], "deviceBootTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v11);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("startFromUptime"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("startFromUptime"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;

          objc_msgSend(v22, "dateByAddingTimeInterval:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setEntryDate:", v17);

        }
        objc_msgSend(v6, "addObject:", v12, v19);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v8);
  }

  v27 = v4;
  v28 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logEntries:withGroupID:](v19, "logEntries:withGroupID:", v18, v4);

}

- (void)logEventPointMachineTranslation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("MachineTranslation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v6);
    -[PLOperator logEntry:](self, "logEntry:", v5);

  }
}

- (void)logEventEventPointRCSSessionManagement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObjectForKey:", CFSTR("Timestamp"));
  PLLogXPC();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v9;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "RCSSessionManagement monotonic eventTime: %@", (uint8_t *)&v16, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("Message"), CFSTR("RCSSessionManagement"), v5, v9);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TransactionType"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TransactionType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");

    if (v14 == 4)
    {
      PLLogXPC();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v16) = 0;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "Logging SIPRegisterKeepAlive to RAPID", (uint8_t *)&v16, 2u);
      }

      -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("Message"), CFSTR("SIPRegisterKeepAlive"), v5, v9);
    }
  }

}

- (void)logEventIntervalAirTrafficAssetDownload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id obj;
  uint64_t v46;
  int v47;
  PLXPCAgent *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48 = self;
  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("AirTraffic_AssetDownload"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v47 = objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode");
    v44 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messages"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v50)
    {
      v46 = *(_QWORD *)v54;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v54 != v46)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v5);
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          v52 = v5;
          if (v47)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v7, "timeIntervalSince1970");
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", round(v10 / 10.0) * 10.0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "timeIntervalSince1970");
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", round(v13 / 10.0) * 10.0);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v9, "timeIntervalSinceDate:", v11);
            if (v14 >= 10.0)
            {
              v8 = v11;
            }
            else
            {
              objc_msgSend(v11, "dateByAddingTimeInterval:", 10.0);
              v15 = objc_claimAutoreleasedReturnValue();

              v8 = v11;
              v9 = (void *)v15;
            }
          }
          v51 = v9;
          v16 = objc_alloc(MEMORY[0x1E0D7FFB0]);
          objc_msgSend(v8, "convertFromSystemToMonotonic");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithEntryKey:withDate:", v49, v17);

          objc_msgSend(v9, "convertFromSystemToMonotonic");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("timestampEnd"));

          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("linkType"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("linkType"));

          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dataclass"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("dataclass"));

          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetType"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("assetType"));

          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sumBytesRequested"));
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v23;
          if (v23)
            v25 = (void *)v23;
          else
            v25 = &unk_1E86358C8;
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("sumBytesRequested"));
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countDownloadsBegun"));
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v26)
            v28 = (void *)v26;
          else
            v28 = &unk_1E86358C8;
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, CFSTR("countDownloadsBegun"));
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countCanUseCellular"));
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v29;
          if (v29)
            v31 = (void *)v29;
          else
            v31 = &unk_1E86358C8;
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v31, CFSTR("countCanUseCellular"));
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countIsForeground"));
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          if (v32)
            v34 = (void *)v32;
          else
            v34 = &unk_1E86358C8;
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v34, CFSTR("countIsForeground"));
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sumBytesDownloaded"));
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v35;
          if (v35)
            v37 = (void *)v35;
          else
            v37 = &unk_1E86358C8;
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v37, CFSTR("sumBytesDownloaded"));
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countDownloadsSucceeded"));
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v38;
          if (v38)
            v40 = (void *)v38;
          else
            v40 = &unk_1E86358C8;
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v40, CFSTR("countDownloadsSucceeded"));
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countDownloadsFailed"));
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = (void *)v41;
          if (v41)
            v43 = (void *)v41;
          else
            v43 = &unk_1E86358C8;
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v43, CFSTR("countDownloadsFailed"));
          -[PLOperator logEntry:](v48, "logEntry:", v18);

          ++v5;
        }
        while (v50 != v52 + 1);
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v50);
    }

    v4 = v44;
  }

}

- (void)logEventIntervalCoreDuetKnowledgeSync:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
  {
    objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("CoreDuet_KnowledgeSync"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEmpty"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transportType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6 && v7 && v8 && v9)
    {
      if (objc_msgSend(v9, "integerValue"))
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v6, "timeIntervalSince1970");
      v12 = v11;
      objc_msgSend(v7, "timeIntervalSince1970");
      if (v13 >= v12)
      {
        v18 = v13;
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", round(v12));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", round(v18));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_alloc(MEMORY[0x1E0D7FFB0]);
        objc_msgSend(v19, "convertFromSystemToMonotonic");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithEntryKey:withDate:", v5, v22);

        objc_msgSend(v20, "convertFromSystemToMonotonic");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("timestampEnd"));

        objc_msgSend(v23, "setObject:forKeyedSubscript:", v8, CFSTR("isEmpty"));
        -[PLOperator logEntry:](self, "logEntry:", v23);

        v7 = v20;
        v6 = v19;
        goto LABEL_14;
      }
      PLLogXPC();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        v15 = "Dropping CoreDuet KnowledgeSync event; End timestamp must be after start timestamp";
        v16 = v14;
        v17 = 2;
LABEL_19:
        _os_log_error_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v25, v17);
      }
    }
    else
    {
      PLLogXPC();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v25 = 138412290;
        v26 = v4;
        v15 = "Dropping CoreDuet KnowledgeSync event; missing required key in payload: %@";
        v16 = v14;
        v17 = 12;
        goto LABEL_19;
      }
    }

    goto LABEL_14;
  }
LABEL_16:

}

- (void)logEventIntervalAnimatedStickerCreation:(id)a3
{
  uint64_t v4;
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
  id v16;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("AnimatedStickerCreation"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StartTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v16, v9);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ProcessedFrameCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("ProcessedFrameCount"));

  v12 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EndTimestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "doubleValue");
  objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "convertFromSystemToMonotonic");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("timestampEnd"));
  -[PLOperator logEntry:](self, "logEntry:", v10);

}

- (void)logEventIntervalAnimatedStickerScoring:(id)a3
{
  uint64_t v4;
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
  id v15;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("AnimatedStickerScoring"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StartTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v15, v9);
  v11 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EndTimestamp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "convertFromSystemToMonotonic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("timestampEnd"));
  -[PLOperator logEntry:](self, "logEntry:", v10);

}

- (void)logEventIntervalMomentsDeferredProcessing:(id)a3
{
  uint64_t v4;
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
  void *v16;
  void *v17;
  id v18;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("MomentsDeferredProcessing"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StartTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v18, v9);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ProcessedAssetCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("ProcessedAssetCount"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ProcessingType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("ProcessingType"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RequestedAssetCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("RequestedAssetCount"));

  v14 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EndTimestamp"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "convertFromSystemToMonotonic");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("timestampEnd"));
  -[PLOperator logEntry:](self, "logEntry:", v10);

}

- (void)logEventIntervalStaticStickerCreation:(id)a3
{
  uint64_t v4;
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
  id v15;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("StaticStickerCreation"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StartTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v15, v9);
  v11 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EndTimestamp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "convertFromSystemToMonotonic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("timestampEnd"));
  -[PLOperator logEntry:](self, "logEntry:", v10);

}

- (void)logEventIntervalStaticStickerScoring:(id)a3
{
  uint64_t v4;
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
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("StaticStickerScoring"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StartTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v19, v9);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsOnDemand"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("IsOnDemand"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ProcessedAssetCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("ProcessedAssetCount"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StickerScoringAssetCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("StickerScoringAssetCount"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VisualSearchAssetCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("VisualSearchAssetCount"));

  v15 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EndTimestamp"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "doubleValue");
  objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "convertFromSystemToMonotonic");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("timestampEnd"));
  -[PLOperator logEntry:](self, "logEntry:", v10);

}

- (void)logEventIntervalRapportReceivedMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("RapportReceivedMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeBegin"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeEnd"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 && v7)
    {
      v9 = objc_alloc(MEMORY[0x1E0D7FFB0]);
      objc_msgSend(v6, "convertFromSystemToMonotonic");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithEntryKey:withDate:", v5, v10);

      objc_msgSend(v8, "convertFromSystemToMonotonic");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("timestampEnd"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("appID"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("type"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytes"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("bytes"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("identifier"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("linkType"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messages"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("messages"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("senderID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("senderID"));

      -[PLOperator logEntry:](self, "logEntry:", v11);
    }
    else
    {
      PLLogXPC();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = 138412290;
        v22 = v4;
        _os_log_error_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_ERROR, "Dropping Rapport received message event; missing required key in payload: %@",
          (uint8_t *)&v21,
          0xCu);
      }

    }
  }

}

- (void)logEventIntervalNameSpotlightIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertFromSystemToMonotonic");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    v7 = v10;
    if (v9)
      goto LABEL_3;
  }
  v9 = v11;
LABEL_3:
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("SpotlightIndexes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __51__PLXPCAgent_logEventIntervalNameSpotlightIndexes___block_invoke;
  v23 = &unk_1E8581C60;
  v14 = v12;
  v24 = v14;
  v15 = v7;
  v25 = v15;
  v16 = v9;
  v26 = v16;
  v17 = v5;
  v27 = v17;
  v18 = v13;
  v28 = v18;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v20);
  if (objc_msgSend(v18, "count", v20, v21, v22, v23))
  {
    v29 = v14;
    v30[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v19, v14);

  }
}

void __51__PLXPCAgent_logEventIntervalNameSpotlightIndexes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("timestampEnd"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("BundleID"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("processName"));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__PLXPCAgent_logEventIntervalNameSpotlightIndexes___block_invoke_2;
    v9[3] = &unk_1E857B198;
    v10 = v6;
    v7 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v7);

  }
}

void __51__PLXPCAgent_logEventIntervalNameSpotlightIndexes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0D80078], "roundToSigFig:withSigFig:", objc_msgSend(a3, "intValue"), 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("indexItems")))
  {
    v7 = *(void **)(a1 + 32);
    v8 = CFSTR("IndexCount");
LABEL_15:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("deleteItems")))
  {
    v7 = *(void **)(a1 + 32);
    v8 = CFSTR("DeletedCount");
    goto LABEL_15;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("computeEmbeddings")))
  {
    v7 = *(void **)(a1 + 32);
    v8 = CFSTR("computeEmbeddings");
    goto LABEL_15;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("computeKeyphrases")))
  {
    v7 = *(void **)(a1 + 32);
    v8 = CFSTR("computeKeyphrases");
    goto LABEL_15;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("reindexItemCount")))
  {
    v7 = *(void **)(a1 + 32);
    v8 = CFSTR("reindexItemCount");
    goto LABEL_15;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("reason")))
  {
    v7 = *(void **)(a1 + 32);
    v8 = CFSTR("reason");
    goto LABEL_15;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("reindexAll")))
  {
    v7 = *(void **)(a1 + 32);
    v8 = CFSTR("reindexAll");
    goto LABEL_15;
  }
  PLLogXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_error_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_ERROR, "SpotlightIndexes unknown key found: %@", (uint8_t *)&v10, 0xCu);
  }

LABEL_16:
}

- (void)logEventIntervalNameSpotlightQueries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertFromSystemToMonotonic");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    v7 = v10;
    if (v9)
      goto LABEL_3;
  }
  v9 = v11;
LABEL_3:
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("SpotlightQueries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __51__PLXPCAgent_logEventIntervalNameSpotlightQueries___block_invoke;
  v23 = &unk_1E8581C60;
  v14 = v12;
  v24 = v14;
  v15 = v7;
  v25 = v15;
  v16 = v9;
  v26 = v16;
  v17 = v5;
  v27 = v17;
  v18 = v13;
  v28 = v18;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v20);
  if (objc_msgSend(v18, "count", v20, v21, v22, v23))
  {
    v29 = v14;
    v30[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v19, v14);

  }
}

void __51__PLXPCAgent_logEventIntervalNameSpotlightQueries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("timestampEnd"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("BundleID"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("processName"));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__PLXPCAgent_logEventIntervalNameSpotlightQueries___block_invoke_2;
    v9[3] = &unk_1E8581C88;
    v10 = v6;
    v7 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v7);

  }
}

void __51__PLXPCAgent_logEventIntervalNameSpotlightQueries___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a2, CFSTR("Reason"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PLXPCAgent_logEventIntervalNameSpotlightQueries___block_invoke_3;
  v7[3] = &unk_1E857B198;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __51__PLXPCAgent_logEventIntervalNameSpotlightQueries___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0D80078], "roundToSigFig:withSigFig:", objc_msgSend(a3, "intValue"), 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("startQuery")))
  {
    v7 = *(void **)(a1 + 32);
    v8 = CFSTR("StartQueryCount");
LABEL_7:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("cancelQuery")))
  {
    v7 = *(void **)(a1 + 32);
    v8 = CFSTR("CancelQueryCount");
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("finishQuery")))
  {
    v7 = *(void **)(a1 + 32);
    v8 = CFSTR("ResultCount");
    goto LABEL_7;
  }
  PLLogXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_error_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_ERROR, "SpotlightIndexes unknown key found: %@", (uint8_t *)&v10, 0xCu);
  }

LABEL_8:
}

- (void)logEventBackwardAVConference:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("method"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("method"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    if (v7 == 70)
    {
      +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("AVConference"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v8, v14);
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("_clientName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("_clientName"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("ClientName"));

      }
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("_serviceName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("_serviceName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("ServiceName"));

      }
      -[PLOperator logEntry:](self, "logEntry:", v9);

    }
  }

}

- (void)logEventIntervalUserSafetyProcessing:(id)a3
{
  uint64_t v4;
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
  void *v16;
  void *v17;
  id v18;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v4, CFSTR("UserSafetyProcessing"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StartTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v18, v9);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AssetType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("AssetType"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ClientBundleID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("ClientBundleID"));

  v13 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EndTimestamp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "convertFromSystemToMonotonic");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("EndTimestamp"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsCacheReused"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("IsCacheReused"));
  -[PLOperator logEntry:](self, "logEntry:", v10);

}

- (void)logEventIntervalGroupActivities:(id)a3
{
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
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampStart"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObjectForKey:", CFSTR("timestampStart"));
  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "convertFromSystemToMonotonic");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("timestampEnd"));
  PLLogXPC();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412290;
    v16 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "GroupActivities updated payload: %@", (uint8_t *)&v15, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("XPCMetrics"), CFSTR("GroupActivities"), v5, v9);
}

- (void)logEventIntervalEndCPUViolations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("timestampEnd"));
  PLLogXPC();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "CPUViolations updated payload: %@", (uint8_t *)&v11, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("XPCMetrics"), CFSTR("CPUViolations"), v5, v9);
}

- (void)logEventIntervalVKDataScanner:(id)a3
{
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
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SessionStartTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObjectForKey:", CFSTR("SessionStartTime"));
  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SessionStopTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "convertFromSystemToMonotonic");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("SessionStopTime"));
  PLLogXPC();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412290;
    v16 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "XPCMetrics::VKDataScanner updated payload: %@", (uint8_t *)&v15, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("XPCMetrics"), CFSTR("VKDataScanner"), v5, v9);
}

- (void)logAlbumAnimation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AlbumAnimationDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AlbumAnimationDuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    LODWORD(v7) = llround(v9);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("AlbumAnimationDuration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("AlbumAnimationDuration"));

  }
  PLLogXPC();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "RenderData::AlbumAnimationDuration updated payload: %@", (uint8_t *)&v13, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("RenderData"), CFSTR("AlbumAnimationDuration"), v5);
}

- (void)logAlbumMotion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AlbumMotionDownload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AlbumMotionDownload"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0D80078], "roundToSigFigDouble:withSigFig:", 2, v9);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("AlbumMotionDownload"));

  }
  PLLogXPC();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "RenderData::AlbumMotionDownload updated payload: %@", (uint8_t *)&v12, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("RenderData"), CFSTR("AlbumMotionDownload"), v5);
}

- (void)logMailCategorization:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    if ((int)v8 > 10)
    {
      v9 = objc_msgSend(MEMORY[0x1E0D80078], "roundToSigFig:withSigFig:", v8, 1);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("count"));

    }
    else
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E86358E0, CFSTR("count"));
    }
  }
  PLLogXPC();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "XPCMetrics::MailCategorizationEvent updated payload: %@", (uint8_t *)&v12, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("XPCMetrics"), CFSTR("MailCategorizationEvent"), v5);
}

- (void)createAccessoryAccountingEventWithName:(id)a3 isStartEvent:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    v6 = CFSTR("accessory-unknown");
    if (v5 && -[__CFString length](v5, "length"))
      v6 = v5;
    v7 = v6;
    v8 = v7;
    if (v4)
    {
      v12 = v7;
      v13[0] = &unk_1E8653A50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 10, v9, v11);

  }
}

- (void)createAirDropAccountingEvent:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("State"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (__CFString *)v4;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Subevent"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_15;
      v7 = (void *)v6;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Subevent"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("BluetoothScanning")))
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Subevent"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("BonjourAdvertise"));

      if ((v10 & 1) == 0)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleId"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleId"));
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = CFSTR("airdrop-unknown");
        }

        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("State"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Start"));

        if (v13)
        {
          v21 = v5;
          v22[0] = &unk_1E8653A50;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v5;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "entryDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 4, v8, v17);

          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "entryDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 3, v7, v19);

          goto LABEL_14;
        }
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("State"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Stop"));

        if (v15)
        {
          v8 = (void *)MEMORY[0x1E0C9AA60];
          v7 = &unk_1E864FB40;
          goto LABEL_13;
        }
LABEL_15:

      }
    }
  }

}

- (void)createInCallServiceAccountingEvent:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("incallservice-unknown");
    }

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("callForegrounded")))
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 1, v5, v8);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createQualificationEventForwardWithQualificationID:withAddingChildNodeName:withStartDate:", 2, v5, v10);
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("callBackgrounded")))
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 1, v5, v12);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createQualificationEventForwardWithQualificationID:withRemovingChildNodeName:withStartDate:", 2, v5, v10);
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("callStart")))
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 11, v5, v14);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 7, v5, v16);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v5;
      v23[0] = &unk_1E8653A50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 44, v10, v17);

    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("callStop")))
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 11, v5, v19);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 7, v5, v21);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 44, &unk_1E864FB68, v10);
    }

    goto LABEL_14;
  }
LABEL_15:

}

- (int)mapAvailabilityModeSemanticType:(int64_t)a3
{
  if ((unint64_t)(a3 + 2) > 0xB)
    return 6;
  else
    return dword_1CB3894EC[a3 + 2];
}

- (int64_t)modeTypeStringToEnum:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Presence")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DetailedNonP2P")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Detailed")))
  {
    v4 = 30;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)mapPixelsToBucket:(unint64_t)a3
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 1;
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (a3 > 0x7E9000)
    v6 = 5;
  if (a3 >= 0x1FA401)
    v5 = v6;
  if (a3 > 0xE1000)
    v4 = v5;
  if (a3 >= 0x7E901)
    v3 = v4;
  if (a3 >= 0x5DC01)
    return v3;
  else
    return 0;
}

- (int64_t)eventNameStringToEnum:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WatchPresence")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WatchAbsence")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WatchDisconnected")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WatchConnected")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WatchUnavailable")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WatchUnreachable")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WatchSwitched")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WatchWristStatusOnWrist")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WatchWristStatusOffWrist")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WatchWristStatusDisabled")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setInferenceEntriesWithBundleID:(id)a3 inferenceStart:(double)a4 inferenceEnd:(double)a5
{
  id v8;
  double lastSBCupdateTimestamp;
  double v11;
  void *v12;
  NSMutableDictionary *inferenceEntries;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  id v20;

  v8 = a3;
  if (v8)
  {
    lastSBCupdateTimestamp = self->_lastSBCupdateTimestamp;
    if (lastSBCupdateTimestamp >= a5 || lastSBCupdateTimestamp <= a4)
      lastSBCupdateTimestamp = a4;
    v11 = a5 - lastSBCupdateTimestamp;
    if (v11 > 0.0)
    {
      v20 = v8;
      -[NSMutableDictionary objectForKey:](self->_inferenceEntries, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      inferenceEntries = self->_inferenceEntries;
      if (v12)
      {
        -[NSMutableDictionary objectForKey:](self->_inferenceEntries, "objectForKey:", v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;

        inferenceEntries = self->_inferenceEntries;
        v17 = (void *)MEMORY[0x1E0CB37E8];
        v18 = v11 + v16;
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0CB37E8];
        v18 = v11;
      }
      objc_msgSend(v17, "numberWithDouble:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](inferenceEntries, "setObject:forKey:", v19, v20);

      v8 = v20;
    }
  }

}

- (void)distributeBundleIDEntriesToWeight:(id)a3 toDistributionID:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[5];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__PLXPCAgent_distributeBundleIDEntriesToWeight_toDistributionID___block_invoke;
  v14[3] = &unk_1E8581CB0;
  v14[4] = &v15;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v14);
  if (v16[3] > 0.0)
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __65__PLXPCAgent_distributeBundleIDEntriesToWeight_toDistributionID___block_invoke_2;
    v11[3] = &unk_1E8581CD8;
    v8 = v6;
    v12 = v8;
    v13 = &v15;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", v4, v8, v10);

  }
  _Block_object_dispose(&v15, 8);

}

double __65__PLXPCAgent_distributeBundleIDEntriesToWeight_toDistributionID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  double v5;
  double result;

  objc_msgSend(a3, "doubleValue");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

void __65__PLXPCAgent_distributeBundleIDEntriesToWeight_toDistributionID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  double v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v5, "numberWithDouble:", v7 / *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);

}

- (NSMutableDictionary)localCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCListenerOperatorComposition)testMarkerXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTestMarkerXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)UIKitKeyboardXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUIKitKeyboardXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)UIKitActivityXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUIKitActivityXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLXPCListenerOperatorComposition)UIKitAlertXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUIKitAlertXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLXPCListenerOperatorComposition)UIKitEclipseXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUIKitEclipseXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLXPCListenerOperatorComposition)userSafetyProcessing
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUserSafetyProcessing:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLXPCListenerOperatorComposition)activeStylusXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setActiveStylusXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLXPCListenerOperatorComposition)animatedStickerCreationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAnimatedStickerCreationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLXPCListenerOperatorComposition)animatedStickerScoringListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAnimatedStickerScoringListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLXPCListenerOperatorComposition)passiveStylusXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPassiveStylusXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLXPCListenerOperatorComposition)keyboardTrackpadXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setKeyboardTrackpadXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLXPCListenerOperatorComposition)KeyboardSessionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setKeyboardSessionXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLXPCListenerOperatorComposition)momentsDeferredProcessingListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setMomentsDeferredProcessingListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (PLXPCListenerOperatorComposition)RenderPassCountXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRenderPassCountXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (PLXPCListenerOperatorComposition)staticStickerCreationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setStaticStickerCreationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (PLXPCListenerOperatorComposition)staticStickerScoringListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setStaticStickerScoringListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (PLXPCListenerOperatorComposition)LayerCountXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLayerCountXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (PLXPCListenerOperatorComposition)vkDataScannerListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setVkDataScannerListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (PLXPCListenerOperatorComposition)albumAnimationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAlbumAnimationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (PLXPCListenerOperatorComposition)albumMotionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 216, 1);
}

- (void)setAlbumMotionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (PLXPCListenerOperatorComposition)mailCategorizationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 224, 1);
}

- (void)setMailCategorizationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (PLXPCListenerOperatorComposition)watchPresenceXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 232, 1);
}

- (void)setWatchPresenceXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (PLXPCListenerOperatorComposition)CarPlayXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 240, 1);
}

- (void)setCarPlayXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (PLXPCListenerOperatorComposition)CarPlayScreensXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 248, 1);
}

- (void)setCarPlayScreensXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (PLXPCListenerOperatorComposition)SecondaryDisplayXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSecondaryDisplayXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (PLXPCListenerOperatorComposition)SpatialAudioXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSpatialAudioXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (PLXPCListenerOperatorComposition)DASyncStartXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 272, 1);
}

- (void)setDASyncStartXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (PLXPCListenerOperatorComposition)DACalendarItemsDownloadedXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 280, 1);
}

- (void)setDACalendarItemsDownloadedXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (PLXPCListenerOperatorComposition)DACalendarItemsUploadedXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 288, 1);
}

- (void)setDACalendarItemsUploadedXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (PLXPCListenerOperatorComposition)MailFetchXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 296, 1);
}

- (void)setMailFetchXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (PLXPCListenerOperatorComposition)NanoMailSessionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 304, 1);
}

- (void)setNanoMailSessionXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (PLXPCListenerOperatorComposition)NavdXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 312, 1);
}

- (void)setNavdXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (PLXPCListenerOperatorComposition)SafariFetcherXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 320, 1);
}

- (void)setSafariFetcherXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (PLXPCListenerOperatorComposition)SafariViewServiceXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 328, 1);
}

- (void)setSafariViewServiceXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (PLXPCListenerOperatorComposition)SiriXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 336, 1);
}

- (void)setSiriXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (PLXPCListenerOperatorComposition)NanoSiriXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 344, 1);
}

- (void)setNanoSiriXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (PLNSNotificationOperatorComposition)MemoryWarningListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 352, 1);
}

- (void)setMemoryWarningListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (PLXPCListenerOperatorComposition)AccessoryMotionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 360, 1);
}

- (void)setAccessoryMotionXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (PLXPCListenerOperatorComposition)accessoryUARPListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 368, 1);
}

- (void)setAccessoryUARPListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (int64_t)accessoryUARPEntryCount
{
  return self->_accessoryUARPEntryCount;
}

- (void)setAccessoryUARPEntryCount:(int64_t)a3
{
  self->_accessoryUARPEntryCount = a3;
}

- (PLXPCListenerOperatorComposition)AccessoriesXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 384, 1);
}

- (void)setAccessoriesXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (PLXPCListenerOperatorComposition)AppAccessoriesXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 392, 1);
}

- (void)setAppAccessoriesXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (PLXPCListenerOperatorComposition)AirDropXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 400, 1);
}

- (void)setAirDropXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (PLXPCListenerOperatorComposition)AirDropSessionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 408, 1);
}

- (void)setAirDropSessionXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (PLXPCListenerOperatorComposition)SymptomsNetworkAdvisory
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 416, 1);
}

- (void)setSymptomsNetworkAdvisory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (PLXPCListenerOperatorComposition)voicemailDurationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 424, 1);
}

- (void)setVoicemailDurationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (PLXPCListenerOperatorComposition)InCallServiceXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 432, 1);
}

- (void)setInCallServiceXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (PLXPCListenerOperatorComposition)CallScreeningDurationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 440, 1);
}

- (void)setCallScreeningDurationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (PLXPCListenerOperatorComposition)CallScreeningEnabledListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 448, 1);
}

- (void)setCallScreeningEnabledListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (PLXPCListenerOperatorComposition)WebAppXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 456, 1);
}

- (void)setWebAppXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (PLXPCListenerOperatorComposition)BackgroundTransfer
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 464, 1);
}

- (void)setBackgroundTransfer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (PLXPCListenerOperatorComposition)telNotificationXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 472, 1);
}

- (void)setTelNotificationXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (PLXPCListenerOperatorComposition)PortraitHighlightsResultXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 480, 1);
}

- (void)setPortraitHighlightsResultXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (PLXPCListenerOperatorComposition)SpotlightHighlightsResultXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 488, 1);
}

- (void)setSpotlightHighlightsResultXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (PLXPCListenerOperatorComposition)SpotlightIndexesXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 496, 1);
}

- (void)setSpotlightIndexesXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (PLXPCListenerOperatorComposition)SpotlightQueriesXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 504, 1);
}

- (void)setSpotlightQueriesXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (PLXPCListenerOperatorComposition)SpotlightQosXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 512, 1);
}

- (void)setSpotlightQosXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

- (PLXPCListenerOperatorComposition)SpotlightWatchdogFiredXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 520, 1);
}

- (void)setSpotlightWatchdogFiredXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 520);
}

- (PLXPCListenerOperatorComposition)siriFalseAlarm
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 528, 1);
}

- (void)setSiriFalseAlarm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (PLXPCResponderOperatorComposition)entryRequestResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 536, 1);
}

- (void)setEntryRequestResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (PLXPCResponderOperatorComposition)taskModeQueryResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 544, 1);
}

- (void)setTaskModeQueryResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 544);
}

- (PLXPCListenerOperatorComposition)PeekXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 552, 1);
}

- (void)setPeekXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (PLXPCListenerOperatorComposition)PopXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 560, 1);
}

- (void)setPopXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (PLXPCListenerOperatorComposition)ThermalLevelXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 568, 1);
}

- (void)setThermalLevelXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 568);
}

- (PLXPCListenerOperatorComposition)ThermalSensorsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 576, 1);
}

- (void)setThermalSensorsXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 576);
}

- (PLXPCListenerOperatorComposition)ThermalHiPXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 584, 1);
}

- (void)setThermalHiPXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 584);
}

- (PLXPCListenerOperatorComposition)MobileBackupStatisticsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 592, 1);
}

- (void)setMobileBackupStatisticsXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (PLXPCListenerOperatorComposition)MobileBackupEventsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 600, 1);
}

- (void)setMobileBackupEventsXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 600);
}

- (PLXPCListenerOperatorComposition)CloudKitXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 608, 1);
}

- (void)setCloudKitXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 608);
}

- (PLXPCListenerOperatorComposition)SleepModeXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 616, 1);
}

- (void)setSleepModeXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 616);
}

- (PLXPCListenerOperatorComposition)SleepLockXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 624, 1);
}

- (void)setSleepLockXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 624);
}

- (PLXPCListenerOperatorComposition)WeatherNotificationStateXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 632, 1);
}

- (void)setWeatherNotificationStateXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 632);
}

- (PLXPCListenerOperatorComposition)WeatherNotificationXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 640, 1);
}

- (void)setWeatherNotificationXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 640);
}

- (PLXPCListenerOperatorComposition)CacheDeleteXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 648, 1);
}

- (void)setCacheDeleteXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 648);
}

- (PLXPCListenerOperatorComposition)MachineTranslationXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 656, 1);
}

- (void)setMachineTranslationXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 656);
}

- (PLXPCListenerOperatorComposition)AppActivationPerformanceActivationDataXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 664, 1);
}

- (void)setAppActivationPerformanceActivationDataXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 664);
}

- (PLXPCListenerOperatorComposition)AppActivationPerformanceProcessDataXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 672, 1);
}

- (void)setAppActivationPerformanceProcessDataXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 672);
}

- (PLXPCListenerOperatorComposition)AppActivationPerformanceCPUStatisticsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 680, 1);
}

- (void)setAppActivationPerformanceCPUStatisticsXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 680);
}

- (PLXPCListenerOperatorComposition)AppActivationPerformanceMemoryStatisticsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 688, 1);
}

- (void)setAppActivationPerformanceMemoryStatisticsXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 688);
}

- (PLXPCListenerOperatorComposition)AppActivationPerformancePowerStateStatisticsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 696, 1);
}

- (void)setAppActivationPerformancePowerStateStatisticsXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 696);
}

- (PLXPCListenerOperatorComposition)UbiquityAccountStatisticsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 704, 1);
}

- (void)setUbiquityAccountStatisticsXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 704);
}

- (PLXPCListenerOperatorComposition)DeepScanReasonsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 712, 1);
}

- (void)setDeepScanReasonsXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 712);
}

- (PLXPCListenerOperatorComposition)LocationVehicularDetectionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 720, 1);
}

- (void)setLocationVehicularDetectionXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 720);
}

- (PLXPCListenerOperatorComposition)MotionWakeReasonXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 728, 1);
}

- (void)setMotionWakeReasonXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 728);
}

- (PLXPCListenerOperatorComposition)CommuteRefreshXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 736, 1);
}

- (void)setCommuteRefreshXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 736);
}

- (PLXPCListenerOperatorComposition)SecItemXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 744, 1);
}

- (void)setSecItemXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 744);
}

- (PLXPCListenerOperatorComposition)SOSKVSRateLimitingEventXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 752, 1);
}

- (void)setSOSKVSRateLimitingEventXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 752);
}

- (PLXPCListenerOperatorComposition)CKKSSyncingEventXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 760, 1);
}

- (void)setCKKSSyncingEventXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

- (PLXPCListenerOperatorComposition)OctagonTrustEventXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 768, 1);
}

- (void)setOctagonTrustEventXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 768);
}

- (PLXPCListenerOperatorComposition)AirPlayDiscoveryModeXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 776, 1);
}

- (void)setAirPlayDiscoveryModeXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 776);
}

- (PLXPCListenerOperatorComposition)MXDiscoveryLevelXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 784, 1);
}

- (void)setMXDiscoveryLevelXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 784);
}

- (PLXPCListenerOperatorComposition)WirelessSyncStartEventXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 792, 1);
}

- (void)setWirelessSyncStartEventXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

- (PLXPCListenerOperatorComposition)WirelessSyncStopEventXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 800, 1);
}

- (void)setWirelessSyncStopEventXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 800);
}

- (PLXPCListenerOperatorComposition)groupActivitiesXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 808, 1);
}

- (void)setGroupActivitiesXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (PLXPCListenerOperatorComposition)appleDiffusionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 816, 1);
}

- (void)setAppleDiffusionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (PLXPCListenerOperatorComposition)assetLoadGFListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 824, 1);
}

- (void)setAssetLoadGFListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 824);
}

- (PLXPCListenerOperatorComposition)fileResidentInfoListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 832, 1);
}

- (void)setFileResidentInfoListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 832);
}

- (PLXPCListenerOperatorComposition)handwritingInferenceListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 840, 1);
}

- (void)setHandwritingInferenceListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 840);
}

- (PLXPCListenerOperatorComposition)mmExecuteRequestListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 848, 1);
}

- (void)setMmExecuteRequestListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 848);
}

- (PLXPCListenerOperatorComposition)summarizationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 856, 1);
}

- (void)setSummarizationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 856);
}

- (PLXPCListenerOperatorComposition)tgiExecuteRequestListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 864, 1);
}

- (void)setTgiExecuteRequestListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 864);
}

- (PLXPCListenerOperatorComposition)smartReplySessionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 872, 1);
}

- (void)setSmartReplySessionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 872);
}

- (PLCFNotificationOperatorComposition)gmsAvailablityListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 880, 1);
}

- (void)setGmsAvailablityListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 880);
}

- (PLCFNotificationOperatorComposition)gmsOptInListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 888, 1);
}

- (void)setGmsOptInListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 888);
}

- (PLXPCListenerOperatorComposition)modelCompilationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 896, 1);
}

- (void)setModelCompilationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 896);
}

- (PLXPCListenerOperatorComposition)modelInferenceListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 904, 1);
}

- (void)setModelInferenceListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 904);
}

- (PLXPCListenerOperatorComposition)modelLoadListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 912, 1);
}

- (void)setModelLoadListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 912);
}

- (PLXPCListenerOperatorComposition)modelUnLoadListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 920, 1);
}

- (void)setModelUnLoadListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 920);
}

- (PLXPCListenerOperatorComposition)instanceModelLoadListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 928, 1);
}

- (void)setInstanceModelLoadListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 928);
}

- (PLXPCListenerOperatorComposition)instanceModelUnLoadListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 936, 1);
}

- (void)setInstanceModelUnLoadListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 936);
}

- (PLXPCListenerOperatorComposition)relevanceContextUpdateXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 944, 1);
}

- (void)setRelevanceContextUpdateXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 944);
}

- (int64_t)SOSKVSEntries
{
  return self->_SOSKVSEntries;
}

- (void)setSOSKVSEntries:(int64_t)a3
{
  self->_SOSKVSEntries = a3;
}

- (int64_t)peekpopProcessID
{
  return self->_peekpopProcessID;
}

- (void)setPeekpopProcessID:(int64_t)a3
{
  self->_peekpopProcessID = a3;
}

- (NSDate)peekStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 968, 1);
}

- (void)setPeekStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (int64_t)peekCount
{
  return self->_peekCount;
}

- (void)setPeekCount:(int64_t)a3
{
  self->_peekCount = a3;
}

- (int64_t)popCount
{
  return self->_popCount;
}

- (void)setPopCount:(int64_t)a3
{
  self->_popCount = a3;
}

- (double)peekDuration
{
  return self->_peekDuration;
}

- (void)setPeekDuration:(double)a3
{
  self->_peekDuration = a3;
}

- (PLXPCListenerOperatorComposition)AttentionSamplingXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setAttentionSamplingXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (PLXPCListenerOperatorComposition)AttentionPollingXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setAttentionPollingXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (PLXPCListenerOperatorComposition)AttentionServiceXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setAttentionServiceXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (PLXPCListenerOperatorComposition)ODOffXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setODOffXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (PLXPCListenerOperatorComposition)ODOnXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setODOnXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (PLXPCListenerOperatorComposition)ODHNXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setODHNXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (PLXPCListenerOperatorComposition)DRMaxRateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setDRMaxRateListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (PLXPCListenerOperatorComposition)FrameCountXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setFrameCountXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (PLXPCListenerOperatorComposition)EnergyTelemetryXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setEnergyTelemetryXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (PLXPCListenerOperatorComposition)AirTrafficAssetDownloadXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setAirTrafficAssetDownloadXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (PLXPCListenerOperatorComposition)CoreDuetKnowledgeSyncXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setCoreDuetKnowledgeSyncXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (PLXPCListenerOperatorComposition)AppleBacklightBrightnessXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setAppleBacklightBrightnessXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (PLXPCListenerOperatorComposition)ShortcutsTriggerFiredXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setShortcutsTriggerFiredXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (PLXPCListenerOperatorComposition)RapportReceivedMessageXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setRapportReceivedMessageXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (PLXPCListenerOperatorComposition)EnhancedDiscoveryXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setEnhancedDiscoveryXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (PLXPCListenerOperatorComposition)AudioRoutingXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setAudioRoutingXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1120);
}

- (PLXPCListenerOperatorComposition)NetworkRelayXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setNetworkRelayXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (PLXPCListenerOperatorComposition)NetworkRelayWiFiAssertionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setNetworkRelayWiFiAssertionXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (PLXPCListenerOperatorComposition)NetworkRelayBTLinkAssertionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setNetworkRelayBTLinkAssertionXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (PLXPCListenerOperatorComposition)NetworkRelayTerminusBTWakeXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setNetworkRelayTerminusBTWakeXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1152);
}

- (PLXPCListenerOperatorComposition)LinkAdvisoryXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setLinkAdvisoryXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (PLXPCListenerOperatorComposition)RCSSessionManagementXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setRCSSessionManagementXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1168);
}

- (PLXPCListenerOperatorComposition)ADDListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setADDListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1176);
}

- (PLXPCListenerOperatorComposition)DosimetryXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setDosimetryXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1184);
}

- (PLEntry)lastDosimetryEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setLastDosimetryEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (PLXPCListenerOperatorComposition)AVConferenceXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setAVConferenceXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
}

- (PLXPCListenerOperatorComposition)AvailabilityModesXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setAvailabilityModesXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1208);
}

- (PLXPCListenerOperatorComposition)FocusFiltersXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setFocusFiltersXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (PLXPCListenerOperatorComposition)PasskeyAuthenticationXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setPasskeyAuthenticationXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (PLXPCListenerOperatorComposition)RapidSecurityResponseXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setRapidSecurityResponseXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1232);
}

- (PLXPCListenerOperatorComposition)CPUViolationsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setCPUViolationsXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1240);
}

- (PLCFNotificationOperatorComposition)ihaToggleListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setIhaToggleListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1248);
}

- (int)lastLinearBrightness
{
  return self->_lastLinearBrightness;
}

- (void)setLastLinearBrightness:(int)a3
{
  self->_lastLinearBrightness = a3;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChangedNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setBatteryLevelChangedNotifications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (NSMutableDictionary)inferenceEntries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setInferenceEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1264);
}

- (NSMutableDictionary)summarizationEntries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setSummarizationEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1272);
}

- (double)lastSBCupdateTimestamp
{
  return self->_lastSBCupdateTimestamp;
}

- (void)setLastSBCupdateTimestamp:(double)a3
{
  self->_lastSBCupdateTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summarizationEntries, 0);
  objc_storeStrong((id *)&self->_inferenceEntries, 0);
  objc_storeStrong((id *)&self->_batteryLevelChangedNotifications, 0);
  objc_storeStrong((id *)&self->_ihaToggleListener, 0);
  objc_storeStrong((id *)&self->_CPUViolationsXPCListener, 0);
  objc_storeStrong((id *)&self->_RapidSecurityResponseXPCListener, 0);
  objc_storeStrong((id *)&self->_PasskeyAuthenticationXPCListener, 0);
  objc_storeStrong((id *)&self->_FocusFiltersXPCListener, 0);
  objc_storeStrong((id *)&self->_AvailabilityModesXPCListener, 0);
  objc_storeStrong((id *)&self->_AVConferenceXPCListener, 0);
  objc_storeStrong((id *)&self->_lastDosimetryEntry, 0);
  objc_storeStrong((id *)&self->_DosimetryXPCListener, 0);
  objc_storeStrong((id *)&self->_ADDListener, 0);
  objc_storeStrong((id *)&self->_RCSSessionManagementXPCListener, 0);
  objc_storeStrong((id *)&self->_LinkAdvisoryXPCListener, 0);
  objc_storeStrong((id *)&self->_NetworkRelayTerminusBTWakeXPCListener, 0);
  objc_storeStrong((id *)&self->_NetworkRelayBTLinkAssertionXPCListener, 0);
  objc_storeStrong((id *)&self->_NetworkRelayWiFiAssertionXPCListener, 0);
  objc_storeStrong((id *)&self->_NetworkRelayXPCListener, 0);
  objc_storeStrong((id *)&self->_AudioRoutingXPCListener, 0);
  objc_storeStrong((id *)&self->_EnhancedDiscoveryXPCListener, 0);
  objc_storeStrong((id *)&self->_RapportReceivedMessageXPCListener, 0);
  objc_storeStrong((id *)&self->_ShortcutsTriggerFiredXPCListener, 0);
  objc_storeStrong((id *)&self->_AppleBacklightBrightnessXPCListener, 0);
  objc_storeStrong((id *)&self->_CoreDuetKnowledgeSyncXPCListener, 0);
  objc_storeStrong((id *)&self->_AirTrafficAssetDownloadXPCListener, 0);
  objc_storeStrong((id *)&self->_EnergyTelemetryXPCListener, 0);
  objc_storeStrong((id *)&self->_FrameCountXPCListener, 0);
  objc_storeStrong((id *)&self->_DRMaxRateListener, 0);
  objc_storeStrong((id *)&self->_ODHNXPCListener, 0);
  objc_storeStrong((id *)&self->_ODOnXPCListener, 0);
  objc_storeStrong((id *)&self->_ODOffXPCListener, 0);
  objc_storeStrong((id *)&self->_AttentionServiceXPCListener, 0);
  objc_storeStrong((id *)&self->_AttentionPollingXPCListener, 0);
  objc_storeStrong((id *)&self->_AttentionSamplingXPCListener, 0);
  objc_storeStrong((id *)&self->_peekStartTime, 0);
  objc_storeStrong((id *)&self->_relevanceContextUpdateXPCListener, 0);
  objc_storeStrong((id *)&self->_instanceModelUnLoadListener, 0);
  objc_storeStrong((id *)&self->_instanceModelLoadListener, 0);
  objc_storeStrong((id *)&self->_modelUnLoadListener, 0);
  objc_storeStrong((id *)&self->_modelLoadListener, 0);
  objc_storeStrong((id *)&self->_modelInferenceListener, 0);
  objc_storeStrong((id *)&self->_modelCompilationListener, 0);
  objc_storeStrong((id *)&self->_gmsOptInListener, 0);
  objc_storeStrong((id *)&self->_gmsAvailablityListener, 0);
  objc_storeStrong((id *)&self->_smartReplySessionListener, 0);
  objc_storeStrong((id *)&self->_tgiExecuteRequestListener, 0);
  objc_storeStrong((id *)&self->_summarizationListener, 0);
  objc_storeStrong((id *)&self->_mmExecuteRequestListener, 0);
  objc_storeStrong((id *)&self->_handwritingInferenceListener, 0);
  objc_storeStrong((id *)&self->_fileResidentInfoListener, 0);
  objc_storeStrong((id *)&self->_assetLoadGFListener, 0);
  objc_storeStrong((id *)&self->_appleDiffusionListener, 0);
  objc_storeStrong((id *)&self->_groupActivitiesXPCListener, 0);
  objc_storeStrong((id *)&self->_WirelessSyncStopEventXPCListener, 0);
  objc_storeStrong((id *)&self->_WirelessSyncStartEventXPCListener, 0);
  objc_storeStrong((id *)&self->_MXDiscoveryLevelXPCListener, 0);
  objc_storeStrong((id *)&self->_AirPlayDiscoveryModeXPCListener, 0);
  objc_storeStrong((id *)&self->_OctagonTrustEventXPCListener, 0);
  objc_storeStrong((id *)&self->_CKKSSyncingEventXPCListener, 0);
  objc_storeStrong((id *)&self->_SOSKVSRateLimitingEventXPCListener, 0);
  objc_storeStrong((id *)&self->_SecItemXPCListener, 0);
  objc_storeStrong((id *)&self->_CommuteRefreshXPCListener, 0);
  objc_storeStrong((id *)&self->_MotionWakeReasonXPCListener, 0);
  objc_storeStrong((id *)&self->_LocationVehicularDetectionXPCListener, 0);
  objc_storeStrong((id *)&self->_DeepScanReasonsXPCListener, 0);
  objc_storeStrong((id *)&self->_UbiquityAccountStatisticsXPCListener, 0);
  objc_storeStrong((id *)&self->_AppActivationPerformancePowerStateStatisticsXPCListener, 0);
  objc_storeStrong((id *)&self->_AppActivationPerformanceMemoryStatisticsXPCListener, 0);
  objc_storeStrong((id *)&self->_AppActivationPerformanceCPUStatisticsXPCListener, 0);
  objc_storeStrong((id *)&self->_AppActivationPerformanceProcessDataXPCListener, 0);
  objc_storeStrong((id *)&self->_AppActivationPerformanceActivationDataXPCListener, 0);
  objc_storeStrong((id *)&self->_MachineTranslationXPCListener, 0);
  objc_storeStrong((id *)&self->_CacheDeleteXPCListener, 0);
  objc_storeStrong((id *)&self->_WeatherNotificationXPCListener, 0);
  objc_storeStrong((id *)&self->_WeatherNotificationStateXPCListener, 0);
  objc_storeStrong((id *)&self->_SleepLockXPCListener, 0);
  objc_storeStrong((id *)&self->_SleepModeXPCListener, 0);
  objc_storeStrong((id *)&self->_CloudKitXPCListener, 0);
  objc_storeStrong((id *)&self->_MobileBackupEventsXPCListener, 0);
  objc_storeStrong((id *)&self->_MobileBackupStatisticsXPCListener, 0);
  objc_storeStrong((id *)&self->_ThermalHiPXPCListener, 0);
  objc_storeStrong((id *)&self->_ThermalSensorsXPCListener, 0);
  objc_storeStrong((id *)&self->_ThermalLevelXPCListener, 0);
  objc_storeStrong((id *)&self->_PopXPCListener, 0);
  objc_storeStrong((id *)&self->_PeekXPCListener, 0);
  objc_storeStrong((id *)&self->_taskModeQueryResponder, 0);
  objc_storeStrong((id *)&self->_entryRequestResponder, 0);
  objc_storeStrong((id *)&self->_siriFalseAlarm, 0);
  objc_storeStrong((id *)&self->_SpotlightWatchdogFiredXPCListener, 0);
  objc_storeStrong((id *)&self->_SpotlightQosXPCListener, 0);
  objc_storeStrong((id *)&self->_SpotlightQueriesXPCListener, 0);
  objc_storeStrong((id *)&self->_SpotlightIndexesXPCListener, 0);
  objc_storeStrong((id *)&self->_SpotlightHighlightsResultXPCListener, 0);
  objc_storeStrong((id *)&self->_PortraitHighlightsResultXPCListener, 0);
  objc_storeStrong((id *)&self->_telNotificationXPCListener, 0);
  objc_storeStrong((id *)&self->_BackgroundTransfer, 0);
  objc_storeStrong((id *)&self->_WebAppXPCListener, 0);
  objc_storeStrong((id *)&self->_CallScreeningEnabledListener, 0);
  objc_storeStrong((id *)&self->_CallScreeningDurationListener, 0);
  objc_storeStrong((id *)&self->_InCallServiceXPCListener, 0);
  objc_storeStrong((id *)&self->_voicemailDurationListener, 0);
  objc_storeStrong((id *)&self->_SymptomsNetworkAdvisory, 0);
  objc_storeStrong((id *)&self->_AirDropSessionXPCListener, 0);
  objc_storeStrong((id *)&self->_AirDropXPCListener, 0);
  objc_storeStrong((id *)&self->_AppAccessoriesXPCListener, 0);
  objc_storeStrong((id *)&self->_AccessoriesXPCListener, 0);
  objc_storeStrong((id *)&self->_accessoryUARPListener, 0);
  objc_storeStrong((id *)&self->_AccessoryMotionXPCListener, 0);
  objc_storeStrong((id *)&self->_MemoryWarningListener, 0);
  objc_storeStrong((id *)&self->_NanoSiriXPCListener, 0);
  objc_storeStrong((id *)&self->_SiriXPCListener, 0);
  objc_storeStrong((id *)&self->_SafariViewServiceXPCListener, 0);
  objc_storeStrong((id *)&self->_SafariFetcherXPCListener, 0);
  objc_storeStrong((id *)&self->_NavdXPCListener, 0);
  objc_storeStrong((id *)&self->_NanoMailSessionXPCListener, 0);
  objc_storeStrong((id *)&self->_MailFetchXPCListener, 0);
  objc_storeStrong((id *)&self->_DACalendarItemsUploadedXPCListener, 0);
  objc_storeStrong((id *)&self->_DACalendarItemsDownloadedXPCListener, 0);
  objc_storeStrong((id *)&self->_DASyncStartXPCListener, 0);
  objc_storeStrong((id *)&self->_SpatialAudioXPCListener, 0);
  objc_storeStrong((id *)&self->_SecondaryDisplayXPCListener, 0);
  objc_storeStrong((id *)&self->_CarPlayScreensXPCListener, 0);
  objc_storeStrong((id *)&self->_CarPlayXPCListener, 0);
  objc_storeStrong((id *)&self->_watchPresenceXPCListener, 0);
  objc_storeStrong((id *)&self->_mailCategorizationListener, 0);
  objc_storeStrong((id *)&self->_albumMotionListener, 0);
  objc_storeStrong((id *)&self->_albumAnimationListener, 0);
  objc_storeStrong((id *)&self->_vkDataScannerListener, 0);
  objc_storeStrong((id *)&self->_LayerCountXPCListener, 0);
  objc_storeStrong((id *)&self->_staticStickerScoringListener, 0);
  objc_storeStrong((id *)&self->_staticStickerCreationListener, 0);
  objc_storeStrong((id *)&self->_RenderPassCountXPCListener, 0);
  objc_storeStrong((id *)&self->_momentsDeferredProcessingListener, 0);
  objc_storeStrong((id *)&self->_KeyboardSessionXPCListener, 0);
  objc_storeStrong((id *)&self->_keyboardTrackpadXPCListener, 0);
  objc_storeStrong((id *)&self->_passiveStylusXPCListener, 0);
  objc_storeStrong((id *)&self->_animatedStickerScoringListener, 0);
  objc_storeStrong((id *)&self->_animatedStickerCreationListener, 0);
  objc_storeStrong((id *)&self->_activeStylusXPCListener, 0);
  objc_storeStrong((id *)&self->_userSafetyProcessing, 0);
  objc_storeStrong((id *)&self->_UIKitEclipseXPCListener, 0);
  objc_storeStrong((id *)&self->_UIKitAlertXPCListener, 0);
  objc_storeStrong((id *)&self->_UIKitActivityXPCListener, 0);
  objc_storeStrong((id *)&self->_UIKitKeyboardXPCListener, 0);
  objc_storeStrong((id *)&self->_testMarkerXPCListener, 0);
  objc_storeStrong((id *)&self->_localCache, 0);
}

@end
