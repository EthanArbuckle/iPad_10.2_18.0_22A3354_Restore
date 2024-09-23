@implementation VMUStackLogConsolidator

- (VMUStackLogConsolidator)initWithScannerOrGraph:(id)a3 stackLogReader:(id)a4
{
  id v7;
  id v8;
  VMUStackLogConsolidator *v9;
  VMUStackLogConsolidator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VMUStackLogConsolidator;
  v9 = -[VMUStackLogConsolidator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scannerOrGraph, a3);
    objc_storeStrong((id *)&v10->_stackLogReader, a4);
  }

  return v10;
}

- (id)stackIDsToNodesFilteredBy:(id)a3
{
  id v4;
  void *v5;
  VMUDebugTimer *debugTimer;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  VMUDebugTimer *v11;
  NSObject *v12;
  unint64_t v13;
  os_signpost_id_t v14;
  int v15;
  VMUCommonGraphInterface *scannerOrGraph;
  uint64_t v17;
  id v18;
  NSMapTable *v19;
  VMUDebugTimer *v20;
  uint64_t v21;
  NSObject *v22;
  os_signpost_id_t v23;
  VMUDebugTimer *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  VMUStackLogReader *stackLogReader;
  VMUDebugTimer *v28;
  uint64_t v29;
  NSObject *v30;
  os_signpost_id_t v31;
  VMUDebugTimer *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  VMUDebugTimer *v41;
  uint64_t v42;
  NSObject *v43;
  os_signpost_id_t v44;
  uint8_t v46[16];
  void *value;
  void *key;
  NSMapEnumerator v49;
  _QWORD v50[4];
  NSMapTable *v51;
  _QWORD v52[5];
  NSMapTable *v53;
  id v54;
  uint8_t *v55;
  int v56;
  uint8_t buf[8];
  uint8_t *v58;
  uint64_t v59;
  int v60;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 258, 259);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    v7 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v7)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v8, OS_SIGNPOST_INTERVAL_END, v10, "VMUStackLogConsolidator", ", buf, 2u);
        }
      }

      debugTimer = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUStackLogConsolidator");
  -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUStackLogConsolidator", "step 1 -- build map table with live malloc block addresses as keys");
  v11 = self->_debugTimer;
  if (v11)
  {
    -[VMUDebugTimer logHandle](v11, "logHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VMUStackLogConsolidator", "step 1 -- build map table with live malloc block addresses as keys", buf, 2u);
      }
    }

  }
  *(_QWORD *)buf = 0;
  v58 = buf;
  v59 = 0x2020000000;
  v60 = 0;
  v15 = -[VMUCommonGraphInterface nodeCount](self->_scannerOrGraph, "nodeCount");
  scannerOrGraph = self->_scannerOrGraph;
  v17 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __53__VMUStackLogConsolidator_stackIDsToNodesFilteredBy___block_invoke;
  v52[3] = &unk_1E4E01DF8;
  v52[4] = self;
  v55 = buf;
  v56 = v15;
  v18 = v4;
  v54 = v18;
  v19 = v5;
  v53 = v19;
  -[VMUCommonGraphInterface enumerateRegionsWithBlock:](scannerOrGraph, "enumerateRegionsWithBlock:", v52);
  if ((!-[VMUStackLogReader inspectingLiveProcess](self->_stackLogReader, "inspectingLiveProcess")
     || (-[VMUStackLogReader usesLiteMode](self->_stackLogReader, "usesLiteMode") & 1) == 0)
    && (-[VMUStackLogReader usesCoreFile](self->_stackLogReader, "usesCoreFile") & 1) == 0)
  {
    v20 = self->_debugTimer;
    if (v20)
    {
      v21 = -[VMUDebugTimer signpostID](v20, "signpostID");
      v20 = self->_debugTimer;
      if (v21)
      {
        -[VMUDebugTimer logHandle](v20, "logHandle");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          LOWORD(v49._pi) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v22, OS_SIGNPOST_INTERVAL_END, v23, "VMUStackLogConsolidator", ", (uint8_t *)&v49, 2u);
        }

        v20 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v20, "endEvent:", "VMUStackLogConsolidator");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUStackLogConsolidator", "step 2 -- enumerate stack log records to record unique backtrace IDs for objects of interest");
    v24 = self->_debugTimer;
    if (v24)
    {
      -[VMUDebugTimer logHandle](v24, "logHandle");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        LOWORD(v49._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v26, "VMUStackLogConsolidator", "step 2 -- enumerate stack log records to record unique backtrace IDs for objects of interest", (uint8_t *)&v49, 2u);
      }

    }
    stackLogReader = self->_stackLogReader;
    v50[0] = v17;
    v50[1] = 3221225472;
    v50[2] = __53__VMUStackLogConsolidator_stackIDsToNodesFilteredBy___block_invoke_5;
    v50[3] = &unk_1E4E01458;
    v51 = v19;
    -[VMUStackLogReader enumerateMSLRecordsAndPayloads:](stackLogReader, "enumerateMSLRecordsAndPayloads:", v50);

  }
  v28 = self->_debugTimer;
  if (v28)
  {
    v29 = -[VMUDebugTimer signpostID](v28, "signpostID");
    v28 = self->_debugTimer;
    if (v29)
    {
      -[VMUDebugTimer logHandle](v28, "logHandle");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        LOWORD(v49._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v30, OS_SIGNPOST_INTERVAL_END, v31, "VMUStackLogConsolidator", ", (uint8_t *)&v49, 2u);
      }

      v28 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v28, "endEvent:", "VMUStackLogConsolidator");
  -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUStackLogConsolidator", "step 3 -- from uniqueBacktraceToObjectsMap, create uniqueBacktraceToObjectsMap");
  v32 = self->_debugTimer;
  if (v32)
  {
    -[VMUDebugTimer logHandle](v32, "logHandle");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      LOWORD(v49._pi) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4D79000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v34, "VMUStackLogConsolidator", "step 3 -- from uniqueBacktraceToObjectsMap, create uniqueBacktraceToObjectsMap", (uint8_t *)&v49, 2u);
    }

  }
  v35 = (void *)objc_opt_new();
  memset(&v49, 0, sizeof(v49));
  NSEnumerateMapTable(&v49, v19);
  value = 0;
  key = 0;
  while (NSNextMapEnumeratorPair(&v49, &key, &value))
  {
    v36 = *(_QWORD *)value;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)value);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      v38 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v38, v39);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)value + 4));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v40);

  }
  NSEndMapTableEnumeration(&v49);
  v41 = self->_debugTimer;
  if (v41)
  {
    v42 = -[VMUDebugTimer signpostID](v41, "signpostID");
    v41 = self->_debugTimer;
    if (v42)
    {
      -[VMUDebugTimer logHandle](v41, "logHandle");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        *(_WORD *)v46 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v43, OS_SIGNPOST_INTERVAL_END, v44, "VMUStackLogConsolidator", ", v46, 2u);
      }

      v41 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v41, "endEvent:", "VMUStackLogConsolidator");

  _Block_object_dispose(buf, 8);
  return v35;
}

void __53__VMUStackLogConsolidator_stackIDsToNodesFilteredBy___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(uint64_t, uint64_t, __int128 *, void *);
  _QWORD *v15;
  uint64_t uniquing_table_index;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  void *key[2];
  uint64_t v22;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "zoneNameForIndex:", *((unsigned int *)v3 + 37));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "usesLiteMode"))
  {
    v5 = v4;
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone")))
      v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("MallocStackLoggingLiteZone_Wrapper")) ^ 1;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  v7 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(v7 + 8);
  v8 = v7 + 8;
  if (*(_DWORD *)(v9 + 24) < *(_DWORD *)(a1 + 64))
  {
    while (1)
    {
      key[1] = 0;
      v22 = 0;
      key[0] = 0;
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      if (v10)
      {
        objc_msgSend(v10, "nodeDetails:", *(unsigned int *)(*(_QWORD *)v8 + 24));
        v11 = key[0];
      }
      else
      {
        v11 = 0;
      }
      if ((unint64_t)v11 >= v3[2] + v3[1])
        goto LABEL_26;
      if ((((unint64_t)key[1] >> 60) | 4) == 5)
      {
        v12 = *(_QWORD *)(a1 + 48);
        if (!v12)
          break;
        v13 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        v14 = *(unsigned int (**)(uint64_t, uint64_t, __int128 *, void *))(v12 + 16);
        v19 = *(_OWORD *)key;
        v20 = v22;
        if (v14(v12, v13, &v19, v4))
          break;
      }
LABEL_23:
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v17 = *(_QWORD *)(a1 + 56);
      v18 = *(_QWORD *)(v17 + 8);
      v8 = v17 + 8;
      if (*(_DWORD *)(v18 + 24) >= *(_DWORD *)(a1 + 64))
        goto LABEL_26;
    }
    v15 = malloc_type_malloc(0x18uLL, 0x10000400CE834B2uLL);
    *v15 = -1;
    v15[1] = (unint64_t)key[1] & 0xFFFFFFFFFFFFFFFLL;
    *((_DWORD *)v15 + 4) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "inspectingLiveProcess")
      && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "usesLiteMode"))
    {
      if (!v6)
      {
        free(v15);
        goto LABEL_23;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "liteMSLPayloadforMallocAddress:size:", key[0], (unint64_t)key[1] & 0xFFFFFFFFFFFFFFFLL);
      uniquing_table_index = msl_payload_get_uniquing_table_index();
    }
    else
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "usesCoreFile"))
      {
LABEL_22:
        NSMapInsert(*(NSMapTable **)(a1 + 40), key[0], v15);
        goto LABEL_23;
      }
      uniquing_table_index = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stackIDForNode:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    }
    *v15 = uniquing_table_index;
    goto LABEL_22;
  }
LABEL_26:

}

_QWORD *__53__VMUStackLogConsolidator_stackIDsToNodesFilteredBy___block_invoke_5(uint64_t a1, char a2, const void *a3)
{
  _QWORD *result;
  _QWORD *v7;

  result = (_QWORD *)msl_payload_get_uniquing_table_index();
  if ((a2 & 0x12) != 0)
  {
    v7 = result;
    result = NSMapGet(*(NSMapTable **)(a1 + 32), a3);
    if (result)
      *result = v7;
  }
  return result;
}

- (id)callTreeWithOptions:(unint64_t)a3 nodeFilter:(id)a4
{
  void *v6;
  VMUDebugTimer *debugTimer;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  VMUDebugTimer *v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  VMUCallTreeRoot *v16;
  VMUBacktrace *v17;
  VMUBacktrace *v18;
  VMUCallTreeRoot *v19;
  void *v20;
  VMUDebugTimer *v21;
  uint64_t v22;
  NSObject *v23;
  unint64_t v24;
  os_signpost_id_t v25;
  VMUCallTreeRoot *v26;
  VMUCallTreeRoot *v27;
  _QWORD v29[5];
  VMUBacktrace *v30;
  VMUCallTreeRoot *v31;
  uint8_t buf[16];

  -[VMUStackLogConsolidator stackIDsToNodesFilteredBy:](self, "stackIDsToNodesFilteredBy:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    v8 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
    debugTimer = self->_debugTimer;
    if (v8)
    {
      -[VMUDebugTimer logHandle](debugTimer, "logHandle");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v9, OS_SIGNPOST_INTERVAL_END, v11, "VMUStackLogConsolidator", ", buf, 2u);
        }
      }

      debugTimer = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUStackLogConsolidator");
  -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUStackLogConsolidator", "step 4 -- build call tree by iterating the uniqueBacktraceToObjectsMap");
  v12 = self->_debugTimer;
  if (v12)
  {
    -[VMUDebugTimer logHandle](v12, "logHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VMUStackLogConsolidator", "step 4 -- build call tree by iterating the uniqueBacktraceToObjectsMap", buf, 2u);
      }
    }

  }
  if (-[VMUStackLogReader coldestFrameIsNotThreadId](self->_stackLogReader, "coldestFrameIsNotThreadId"))
    a3 |= 4uLL;
  v16 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]([VMUCallTreeRoot alloc], "initWithSymbolicator:sampler:options:", 0, 0, 0, a3);
  -[VMUCallTreeRoot setStackLogReader:](v16, "setStackLogReader:", self->_stackLogReader);
  v17 = objc_alloc_init(VMUBacktrace);
  v17->_flavor = 32;
  if (self->_debugTimer)
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "%qu unique stacks\n", objc_msgSend(v6, "count"));
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __58__VMUStackLogConsolidator_callTreeWithOptions_nodeFilter___block_invoke;
  v29[3] = &unk_1E4E01E20;
  v29[4] = self;
  v18 = v17;
  v30 = v18;
  v19 = v16;
  v31 = v19;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v29);
  -[VMUCallTreeRoot allBacktracesHaveBeenAdded](v19, "allBacktracesHaveBeenAdded");
  -[VMUCommonGraphInterface binaryImagesDescription](self->_scannerOrGraph, "binaryImagesDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUCallTreeRoot setBinaryImagesDescription:](v19, "setBinaryImagesDescription:", v20);

  v21 = self->_debugTimer;
  if (v21)
  {
    v22 = -[VMUDebugTimer signpostID](v21, "signpostID");
    v21 = self->_debugTimer;
    if (v22)
    {
      -[VMUDebugTimer logHandle](v21, "logHandle");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v25 = v24;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v23, OS_SIGNPOST_INTERVAL_END, v25, "VMUStackLogConsolidator", ", buf, 2u);
        }
      }

      v21 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v21, "endEvent:", "VMUStackLogConsolidator");
  v26 = v31;
  v27 = v19;

  return v27;
}

void __58__VMUStackLogConsolidator_callTreeWithOptions_nodeFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[513];

  v28[512] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "unsignedLongValue");
  if (v7 != -1)
  {
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getFramesForStackID:stackFramesBuffer:", v7, v28);
    if (v8)
    {
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "coldestFrameIsNotThreadId") & 1) != 0)
        LODWORD(v9) = -1;
      else
        v9 = v28[--v8];
      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 28) = v9;
      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 64) = v8;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v10);
            v16 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "unsignedIntValue");
            v21 = 0;
            v22 = 0;
            v20 = 0;
            v17 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
            if (v17)
              v17 = (void *)objc_msgSend(v17, "nodeDetails:", v16);
            v18 = (void *)MEMORY[0x1A85A9758](v17);
            v13 += v21 & 0xFFFFFFFFFFFFFFFLL;
            objc_autoreleasePoolPop(v18);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v12);
      }
      else
      {
        v13 = 0;
      }

      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = v28;
      objc_msgSend(*(id *)(a1 + 48), "addBacktrace:count:numBytes:", *(_QWORD *)(a1 + 40), objc_msgSend(v10, "count"), v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = 0;

    }
  }

}

- (VMUDebugTimer)debugTimer
{
  return self->_debugTimer;
}

- (void)setDebugTimer:(id)a3
{
  objc_storeStrong((id *)&self->_debugTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugTimer, 0);
  objc_storeStrong((id *)&self->_stackLogReader, 0);
  objc_storeStrong((id *)&self->_scannerOrGraph, 0);
}

@end
