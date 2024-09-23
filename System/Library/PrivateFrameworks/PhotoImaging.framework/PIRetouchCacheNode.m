@implementation PIRetouchCacheNode

- (PIRetouchCacheNode)initWithInputs:(id)a3 settings:(id)a4 subsampleFactor:(int64_t)a5
{
  PIRetouchCacheNode *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *retouchQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PIRetouchCacheNode;
  v5 = -[NUCacheNode initWithInputs:settings:subsampleFactor:](&v9, sel_initWithInputs_settings_subsampleFactor_, a3, a4, a5);
  v6 = dispatch_queue_create("PIRetouchCacheNode", 0);
  retouchQueue = v5->_retouchQueue;
  v5->_retouchQueue = (OS_dispatch_queue *)v6;

  return v5;
}

- (id)descriptionSubClassHook
{
  return CFSTR("Retouch");
}

- (id)persistentURL
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0C99E98]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[NUCacheNode cacheIdentifier](self, "cacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("x-cache-node://retouch/%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithString:", v6);

  return v7;
}

- (int64_t)subsampleFactorForScale:(id)a3
{
  return 1;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  PIRetouchCompositeNode *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v29;
  void *v30;
  const void **v31;
  void *specific;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  objc_super v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_4602();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v30;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v37 = dispatch_get_specific(*v31);
        v38 = (void *)MEMORY[0x1E0CB3978];
        v39 = v37;
        objc_msgSend(v38, "callStackSymbols");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v37;
        v49 = 2114;
        v50 = v41;
        _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v36;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  if (objc_msgSend(v9, "evaluationMode") == 1 || !objc_msgSend(v10, "evaluationMode"))
  {
    v46.receiver = self;
    v46.super_class = (Class)PIRetouchCacheNode;
    -[NUCacheNode nodeByReplayingAgainstCache:pipelineState:error:](&v46, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v10, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (-[NURenderNode isCached](self, "isCached"))
      {
        v11 = v12;
      }
      else
      {
        objc_msgSend(v12, "subsampleFactor");
        v13 = NUScaleMake();
        v15 = v14;
        objc_msgSend(v10, "scale");
        v42 = v13;
        v16 = NUScaleDivide();
        v18 = v17;
        v19 = (uint64_t *)MEMORY[0x1E0D51F70];
        v44 = *MEMORY[0x1E0D51F70];
        v45 = *(_QWORD *)(MEMORY[0x1E0D51F70] + 8);
        v20 = (void *)objc_msgSend(v10, "copy");
        NUScaleMake();
        if (NUScaleCompare() < 1)
        {
          v21 = v16;
        }
        else
        {
          objc_msgSend(v20, "setScale:", v42, v15);
          v44 = v16;
          v45 = v18;
          v21 = *v19;
          v18 = v19[1];
        }
        -[PIRetouchCacheNode retouchInputNode](self, "retouchInputNode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v20, a5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v24 = -[PIRetouchCompositeNode initWithScale:sampleMode:input:retouch:]([PIRetouchCompositeNode alloc], "initWithScale:sampleMode:input:retouch:", v21, v18, objc_msgSend(v10, "sampleMode"), v23, v12);
          objc_msgSend(MEMORY[0x1E0D52258], "nodeFromCache:cache:", v24, v8);
          v11 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
          if ((NUScaleEqual() & 1) == 0)
          {
            v43 = objc_alloc(MEMORY[0x1E0D522B8]);
            v25 = objc_msgSend(v10, "scale");
            v27 = (void *)objc_msgSend(v43, "initWithTargetScale:effectiveScale:sampleMode:input:", v25, v26, v44, v45, objc_msgSend(v10, "sampleMode"), v11);

            objc_msgSend(MEMORY[0x1E0D52258], "nodeFromCache:cache:", v27, v8);
            v11 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
          }
        }
        else
        {
          v11 = 0;
        }

      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Cannot evaluate cache node"), self);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PIRetouchCacheNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  NSObject *retouchQueue;
  BOOL v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4600;
  v13 = __Block_byref_object_dispose__4601;
  v14 = 0;
  retouchQueue = self->_retouchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PIRetouchCacheNode_tryLoadPersistentURL_error___block_invoke;
  block[3] = &unk_1E5015FF8;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(retouchQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    v6 = 1;
  }
  else
  {
    *a4 = objc_retainAutorelease((id)v10[5]);
    v6 = *((_BYTE *)v16 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (BOOL)_tryLoad:(id *)a3
{
  int v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NURegion *v26;
  NURegion *outputRegion;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  void *outputKey;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NURegion *v39;
  NURegion *inputRegion;
  NSObject *v41;
  int v42;
  uint64_t v43;
  NURegion *v44;
  NUMutableBufferImage *v45;
  NUMutableBufferImage *inputImage;
  NSObject *v47;
  int v48;
  NURegion *v49;
  NURegion *v50;
  NUMutableBufferImage *v51;
  NSString *v52;
  id v54;
  id v55;
  uint64_t v56;
  id obj;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  PIRetouchCacheNode *v62;
  __int128 *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  int v79;
  __int16 v80;
  int v81;
  __int16 v82;
  _QWORD v83[2];
  __int128 v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  if (self->_outputKey)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[NUCacheNode inputNode](self, "inputNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "outputImageGeometry:", a3);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      -[NURenderNode settings](self, "settings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("strokes"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = objc_msgSend(v8, "count");
      -[PIRetouchCacheNode baseIdentifier](self, "baseIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:");
      objc_msgSend(v10, "addObject:", v9);
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v75;
        do
        {
          v14 = 0;
          v15 = v9;
          do
          {
            if (*(_QWORD *)v75 != v13)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v14);
            v17 = objc_alloc_init(MEMORY[0x1E0D52090]);
            objc_msgSend(v15, "nu_updateDigest:", v17);
            -[PIRetouchCacheNode _updateDigest:forStroke:](self, "_updateDigest:forStroke:", v17, v16);
            objc_msgSend(v17, "stringValue");
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "addObject:", v9);
            ++v14;
            v15 = v9;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
        }
        while (v12);
      }

      v18 = objc_alloc_init(MEMORY[0x1E0D521E8]);
      v19 = objc_alloc_init(MEMORY[0x1E0D521E8]);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v56 + 1);
      objc_msgSend(MEMORY[0x1E0D52240], "region");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v21);

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      obj = v11;
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v89, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v71 != v23)
              objc_enumerationMutation(obj);
            -[PIRetouchCacheNode _updateInputRegion:outputRegion:forStroke:geometry:](self, "_updateInputRegion:outputRegion:forStroke:geometry:", v18, v19, *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i), v58);
            v25 = (void *)objc_msgSend(v19, "copy");
            objc_msgSend(v20, "addObject:", v25);

          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v89, 16);
        }
        while (v22);
      }

      v26 = (NURegion *)objc_msgSend(v19, "copy");
      outputRegion = self->_outputRegion;
      self->_outputRegion = v26;

      objc_opt_class();
      +[PIRetouchSourceNode intermediateCacheForSubsample:](PIRetouchSourceNode, "intermediateCacheForSubsample:", objc_opt_isKindOfClass() & 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0;
      v67 = &v66;
      v68 = 0x2020000000;
      v69 = 0x7FFFFFFFFFFFFFFFLL;
      *(_QWORD *)&v84 = 0;
      *((_QWORD *)&v84 + 1) = &v84;
      v85 = 0x3032000000;
      v86 = __Block_byref_object_copy__4600;
      v87 = __Block_byref_object_dispose__4601;
      v88 = 0;
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __31__PIRetouchCacheNode__tryLoad___block_invoke;
      v59[3] = &unk_1E5016020;
      v63 = &v84;
      v55 = v28;
      v60 = v55;
      v29 = v20;
      v61 = v29;
      v62 = self;
      v64 = &v66;
      v65 = v56;
      objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, v59);
      objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 40), "validRegion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v30, "includesRegion:", v18);

      if (v3)
      {
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_224);
        v31 = (id)*MEMORY[0x1E0D52398];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = -[NUCacheNode subsampleFactor](self, "subsampleFactor");
          v33 = v67[3];
          *(_DWORD *)buf = 67109632;
          v79 = v32;
          v80 = 1024;
          v81 = v33;
          v82 = 1024;
          LODWORD(v83[0]) = v56;
          _os_log_impl(&dword_1A6382000, v31, OS_LOG_TYPE_DEFAULT, "Retouch intermediate #%d cache hit (stroke #%d out of %d)", buf, 0x14u);
        }

        objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 40), "immutableImageCopy");
        outputKey = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "subarrayWithRange:", v67[3], v56 - v67[3]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PIRetouchCacheNode resolveWithInputImage:retouchStrokes:cacheKey:](self, "resolveWithInputImage:retouchStrokes:cacheKey:", outputKey, v35, v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 40), "endAccess");

      }
      else
      {
        v37 = *(void **)(*((_QWORD *)&v84 + 1) + 40);
        if (v37)
        {
          objc_msgSend(v37, "validRegion");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "regionByRemovingRegion:", v38);
          v39 = (NURegion *)objc_claimAutoreleasedReturnValue();
          inputRegion = self->_inputRegion;
          self->_inputRegion = v39;

          if (*MEMORY[0x1E0D52390] != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_224);
          v41 = (id)*MEMORY[0x1E0D52398];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = -[NUCacheNode subsampleFactor](self, "subsampleFactor");
            v43 = v67[3];
            v44 = self->_inputRegion;
            *(_DWORD *)buf = 67109890;
            v79 = v42;
            v80 = 1024;
            v81 = v43;
            v82 = 1024;
            LODWORD(v83[0]) = v56;
            WORD2(v83[0]) = 2112;
            *(_QWORD *)((char *)v83 + 6) = v44;
            _os_log_impl(&dword_1A6382000, v41, OS_LOG_TYPE_DEFAULT, "Retouch intermediate #%d cache hit [partial] (stroke #%d out of %d), invalid region: %@", buf, 0x1Eu);
          }

          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 40), "mutableImageCopy");
          v45 = (NUMutableBufferImage *)objc_claimAutoreleasedReturnValue();
          inputImage = self->_inputImage;
          self->_inputImage = v45;

          self->_baseStrokeIndex = v67[3];
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 40), "endAccess");
        }
        else
        {
          if (*MEMORY[0x1E0D52390] != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_224);
          v47 = (id)*MEMORY[0x1E0D52398];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v48 = -[NUCacheNode subsampleFactor](self, "subsampleFactor");
            *(_DWORD *)buf = 67109632;
            v79 = v48;
            v80 = 1024;
            v81 = v56;
            v82 = 2048;
            v83[0] = self;
            _os_log_impl(&dword_1A6382000, v47, OS_LOG_TYPE_DEFAULT, "Retouch intermediate #%d cache miss [%d strokes] (%p)", buf, 0x18u);
          }

          v49 = (NURegion *)objc_msgSend(v18, "copy");
          v50 = self->_inputRegion;
          self->_inputRegion = v49;

          self->_baseStrokeIndex = 0;
          v51 = self->_inputImage;
          self->_inputImage = 0;

        }
        v52 = v9;
        outputKey = self->_outputKey;
        self->_outputKey = v52;
      }

      _Block_object_dispose(&v84, 8);
      _Block_object_dispose(&v66, 8);

    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_224);
      v36 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v54 = *a3;
        LODWORD(v84) = 138543362;
        *(_QWORD *)((char *)&v84 + 4) = v54;
        _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "Failed to load retouch geometry, error: %{public}@", (uint8_t *)&v84, 0xCu);
      }
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (id)baseIdentifier
{
  NSString *baseIdentifier;
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  baseIdentifier = self->_baseIdentifier;
  if (!baseIdentifier)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D52090]);
    -[NUCacheNode inputNode](self, "inputNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nu_updateDigest:", v4);

    objc_msgSend(v4, "addString:", CFSTR("subsample["));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NUCacheNode subsampleFactor](self, "subsampleFactor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nu_updateDigest:", v4);

    objc_msgSend(v4, "addString:", CFSTR("]"));
    objc_msgSend(v4, "stringValue");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_baseIdentifier;
    self->_baseIdentifier = v7;

    baseIdentifier = self->_baseIdentifier;
  }
  return baseIdentifier;
}

- (void)_updateDigest:(id)a3 forStroke:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = a4;
  objc_msgSend(v15, "addString:", CFSTR("RetouchStroke{"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sourceOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nu_updateDigest:", v15);
  objc_msgSend(v15, "addCString:", ",");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("radius"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nu_updateDigest:", v15);

  objc_msgSend(v15, "addCString:", ",");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("softness"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nu_updateDigest:", v15);

  objc_msgSend(v15, "addCString:", ",");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("opacity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nu_updateDigest:", v15);

  objc_msgSend(v15, "addCString:", ",");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("points"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nu_updateDigest:", v15);
  if (v11)
  {
    objc_msgSend(v15, "addCString:", ",");
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nu_updateDigest:", v15);

    objc_msgSend(v15, "addCString:", ",");
    objc_msgSend(v10, "objectAtIndexedSubscript:", v11 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nu_updateDigest:", v15);

  }
  objc_msgSend(v15, "addString:", CFSTR("}"));

}

- (int64_t)padding
{
  return 80;
}

- (void)_updateInputRegion:(id)a3 outputRegion:(id)a4 forStroke:(id)a5 geometry:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  float v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _BYTE v24[32];
  __int128 v25;
  __int128 v26;
  _BYTE v27[32];
  __int128 v28;
  __int128 v29;
  _BYTE v30[32];
  _BYTE v31[32];
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
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v10 = a6;
  v11 = a5;
  v23 = a4;
  v12 = a3;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sourceOffset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("x"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("y"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v15, "doubleValue");
  v46 = 0u;
  v47 = 0u;
  if (v10)
    objc_msgSend(v10, "extent");
  +[PIRepairUtilities brushStrokeFromRetouchStrokeDictionary:](PIRepairUtilities, "brushStrokeFromRetouchStrokeDictionary:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("mode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = PIRetouchModeFromString(v17);
  if (v18 == 2)
  {
    v44 = v46;
    v45 = v47;
    v42 = v46;
    v43 = v47;
    v40 = v46;
    v41 = v47;
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
    if (v16)
    {
      objc_msgSend(v16, "extent");
    }
    else
    {
      v36 = 0uLL;
      v37 = 0uLL;
    }
    NUPixelRectIntersection();
    objc_msgSend(v16, "radius");
    v20 = v19;
    v21 = NUPixelPointFromCGPoint();
    v34 = v46;
    v35 = v47;
    v32 = v38;
    v33 = v39;
    +[PIRepairUtilities calcExtentsForStrokeRadius:offset:inputImageExtent:maskExtent:repairExtent:textureExtent:sourceExtent:](PIRepairUtilities, "calcExtentsForStrokeRadius:offset:inputImageExtent:maskExtent:repairExtent:textureExtent:sourceExtent:", v21, v22, &v34, &v32, &v44, &v42, v20, &v40);
  }
  v34 = v44;
  v35 = v45;
  v32 = v46;
  v33 = v47;
  NUPixelRectFlipYOrigin();
  v44 = v38;
  v45 = v39;
  v34 = v40;
  v35 = v41;
  v32 = v46;
  v33 = v47;
  NUPixelRectFlipYOrigin();
  v40 = v38;
  v41 = v39;
  v34 = v42;
  v35 = v43;
  v32 = v46;
  v33 = v47;
  NUPixelRectFlipYOrigin();
  v42 = v38;
  v43 = v39;
  -[PIRetouchCacheNode padding](self, "padding");
  v34 = v44;
  v35 = v45;
  NUPixelRectDilate();
  v44 = v38;
  v45 = v39;
  v38 = 0u;
  v39 = 0u;
  v34 = v40;
  v35 = v41;
  NUAlignPixelRectToPixelGrid();
  v34 = v38;
  v35 = v39;
  v32 = v46;
  v33 = v47;
  NUPixelRectIntersection();
  objc_msgSend(v12, "addRect:", v31);
  v34 = 0u;
  v35 = 0u;
  v32 = v42;
  v33 = v43;
  NUAlignPixelRectToPixelGrid();
  v32 = v34;
  v33 = v35;
  NUPixelRectIntersection();
  objc_msgSend(v12, "addRect:", v30);
  v32 = 0u;
  v33 = 0u;
  NUAlignPixelRectToPixelGrid();
  v28 = v32;
  v29 = v33;
  NUPixelRectIntersection();
  objc_msgSend(v12, "addRect:", v27);

  v28 = 0u;
  v29 = 0u;
  NUAlignPixelRectToPixelGrid();
  v25 = v28;
  v26 = v29;
  NUPixelRectIntersection();
  objc_msgSend(v23, "addRect:", v24);

}

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *retouchQueue;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v16;
  void *v17;
  const void **v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD block[5];
  id v31;
  uint64_t *v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_4602();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "originalRequest != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific(*v18);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v28;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v7 = v6;
  v8 = objc_alloc(MEMORY[0x1E0D52020]);
  objc_msgSend(v7, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithComposition:", v9);

  objc_msgSend(v10, "setName:", CFSTR("PIRetouchCacheNode-newRequest"));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v39 = __Block_byref_object_copy__4600;
  v40 = __Block_byref_object_dispose__4601;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  retouchQueue = self->_retouchQueue;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PIRetouchCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke;
  block[3] = &unk_1E5016048;
  v32 = &v34;
  block[4] = self;
  v13 = v10;
  v31 = v13;
  v33 = buf;
  dispatch_sync(retouchQueue, block);
  if (*((_BYTE *)v35 + 24))
  {
    objc_msgSend(v13, "setResponseQueue:", self->_retouchQueue);
    v29[0] = v12;
    v29[1] = 3221225472;
    v29[2] = __64__PIRetouchCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke_2;
    v29[3] = &unk_1E5016CB8;
    v29[4] = self;
    objc_msgSend(v13, "setCompletionBlock:", v29);
    v14 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to generate retouch render request"), self, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(buf, 8);

  return v14;
}

- (id)_modifyEvaluatedGeometry:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D52170]);
  if (v3)
  {
    objc_msgSend(v3, "extent");
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  v5 = objc_msgSend(v3, "orientation", v8, v9);
  v6 = (void *)objc_msgSend(v4, "initWithExtent:renderScale:orientation:", &v8, *MEMORY[0x1E0D51F70], *(_QWORD *)(MEMORY[0x1E0D51F70] + 8), v5);

  return v6;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  objc_super v12;
  id v13;

  v12.receiver = self;
  v12.super_class = (Class)PIRetouchCacheNode;
  v13 = 0;
  -[NUCacheNode _evaluateImageGeometry:](&v12, sel__evaluateImageGeometry_, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v13;
    -[PIRetouchCacheNode _modifyEvaluatedGeometry:](self, "_modifyEvaluatedGeometry:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0D520A0];
    v9 = v13;
    objc_msgSend(v8, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not get the input geometry"), self, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    *a3 = v10;
  }

  return v7;
}

- (BOOL)_setupRenderRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NURegion *inputRegion;
  void *v11;
  NSObject *v13;
  void *v14;
  const void **v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_4602();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v21;
        v28 = 2114;
        v29 = v25;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0D52068], "workingColorSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColorSpace:", v8);

  objc_msgSend(MEMORY[0x1E0D52220], "RGBAh");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPixelFormat:", v9);

  objc_msgSend(v7, "setTileSize:", 256, 256);
  objc_msgSend(v7, "setName:", CFSTR("PIRetouchCacheNode-setup"));
  inputRegion = self->_inputRegion;
  if (inputRegion)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520D8]), "initWithRegion:", self->_inputRegion);
    objc_msgSend(v7, "setRegionPolicy:", v11);

    objc_msgSend(v7, "setTargetBufferImage:", self->_inputImage);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing input retouch region"), 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return inputRegion != 0;
}

- (void)_resolveSourceWithResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t baseStrokeIndex;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const void **v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_4602();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "response != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v21;
        v29 = 2114;
        v30 = v25;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  v26 = 0;
  objc_msgSend(v4, "result:", &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  if (v6)
  {
    -[NURenderNode settings](self, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("strokes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    baseStrokeIndex = self->_baseStrokeIndex;
    if (baseStrokeIndex)
    {
      objc_msgSend(v9, "subarrayWithRange:", baseStrokeIndex, objc_msgSend(v9, "count") - self->_baseStrokeIndex);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }
    objc_msgSend(v6, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIRetouchCacheNode resolveWithInputImage:retouchStrokes:cacheKey:](self, "resolveWithInputImage:retouchStrokes:cacheKey:", v12, v9, self->_outputKey);

  }
  else
  {
    -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", 0, v7);
  }

}

- (void)resolveWithInputImage:(id)a3 retouchStrokes:(id)a4 cacheKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  PIRetouchSourceNode *v11;
  void *v12;
  void *v13;
  PIRetouchSourceNode *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [PIRetouchSourceNode alloc];
  -[NURenderNode settings](self, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("detectedFaces"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PIRetouchSourceNode initWithInputImage:retouchStrokes:detectedFaces:cacheKey:](v11, "initWithInputImage:retouchStrokes:detectedFaces:cacheKey:", v10, v9, v13, v8);

  -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", v14, 0);
}

- (id)outputRegion
{
  NSObject *retouchQueue;
  void *v3;
  id v4;
  NSObject *v6;
  void *v7;
  const void **v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4600;
  v22 = __Block_byref_object_dispose__4601;
  v23 = 0;
  retouchQueue = self->_retouchQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __34__PIRetouchCacheNode_outputRegion__block_invoke;
  v17[3] = &unk_1E5017DE0;
  v17[4] = self;
  v17[5] = &v18;
  dispatch_sync(retouchQueue, v17);
  v3 = (void *)v19[5];
  if (!v3)
  {
    NUAssertLogger_4602();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing output region"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v8 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v14;
        v26 = 2114;
        v27 = v16;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v4 = v3;
  _Block_object_dispose(&v18, 8);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retouchQueue, 0);
  objc_storeStrong((id *)&self->_outputRegion, 0);
  objc_storeStrong((id *)&self->_inputRegion, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_outputKey, 0);
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
}

void __34__PIRetouchCacheNode_outputRegion__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 264));
}

void __64__PIRetouchCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  obj = 0;
  v5 = objc_msgSend(v2, "_setupRenderRequest:error:", v3, &obj);
  objc_storeStrong(v4, obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

uint64_t __64__PIRetouchCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolveSourceWithResponse:", a2);
}

void __31__PIRetouchCacheNode__tryLoad___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  _DWORD v20[2];
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v11)
  {
    objc_msgSend(v11, "beginAccess");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "validRegion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "includesRegion:", v13);

    if (v14)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
      *a4 = 1;
    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_224);
      v15 = (void *)*MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(void **)(a1 + 48);
        v17 = v15;
        v18 = objc_msgSend(v16, "subsampleFactor");
        v19 = *(_QWORD *)(a1 + 72);
        v20[0] = 67109632;
        v20[1] = v18;
        v21 = 1024;
        v22 = a3;
        v23 = 1024;
        v24 = v19;
        _os_log_impl(&dword_1A6382000, v17, OS_LOG_TYPE_DEFAULT, "Retouch intermediate #%d cache miss [purged] (stroke #%d out of %d)", (uint8_t *)v20, 0x14u);

      }
      objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v7);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "endAccess");
    }
  }

}

void __49__PIRetouchCacheNode_tryLoadPersistentURL_error___block_invoke(_QWORD *a1)
{
  void *v2;
  id *v3;
  char v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  v4 = objc_msgSend(v2, "_tryLoad:", &obj);
  objc_storeStrong(v3, obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

+ (id)nodeWithInput:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  PIRetouchCacheNode *v20;
  PIRetouchSubsampleCacheNode *v21;
  NSObject *v23;
  const void **v24;
  const void **v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  NSObject *v30;
  const void **v31;
  void *v32;
  int v33;
  void *v34;
  NSObject *v35;
  const void **v36;
  void *v37;
  int v38;
  void *v39;
  const void **v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  uint8_t buf[4];
  const void **v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!a6)
  {
    NUAssertLogger_4602();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v24;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v41 = dispatch_get_specific(*v25);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v25 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = (const void **)v41;
        v58 = 2114;
        v59 = v44;
        _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v25;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v33 = _NUAssertFailHandler();
    goto LABEL_31;
  }
  if (!v9)
  {
    NUAssertLogger_4602();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v31;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = (const void **)MEMORY[0x1E0D51D48];
    v32 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v27 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (!v32)
    {
      if (v33)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v25;
        _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_33:

      v38 = _NUAssertFailHandler();
      goto LABEL_34;
    }
LABEL_31:
    if (v33)
    {
      v45 = dispatch_get_specific(*v25);
      v46 = (void *)MEMORY[0x1E0CB3978];
      v47 = v45;
      objc_msgSend(v46, "callStackSymbols");
      v25 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = (const void **)v45;
      v58 = 2114;
      v59 = v48;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_33;
  }
  if (!v10)
  {
    NUAssertLogger_4602();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "settings != nil");
      v36 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v36;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = (const void **)MEMORY[0x1E0D51D48];
    v37 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v27 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (!v37)
    {
      if (v38)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v40;
        _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_36;
    }
LABEL_34:
    if (v38)
    {
      v49 = dispatch_get_specific(*v25);
      v50 = (void *)MEMORY[0x1E0CB3978];
      v51 = v49;
      objc_msgSend(v50, "callStackSymbols");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = (const void **)v49;
      v58 = 2114;
      v59 = v53;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_36:

    _NUAssertFailHandler();
  }
  v12 = v11;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("retouch"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("inputStrokes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0C99E08]);
      v54 = CFSTR("strokes");
      v55 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithDictionary:", v17);

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("detectedFaces"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("detectedFaces"));
      v20 = -[NUCacheNode initWithInput:settings:]([PIRetouchCacheNode alloc], "initWithInput:settings:", v9, v18);
      v21 = -[NUCacheNode initWithInput:settings:]([PIRetouchSubsampleCacheNode alloc], "initWithInput:settings:", v20, v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing input strokes"), v14);
      v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing retouch settings"), v10);
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

@end
