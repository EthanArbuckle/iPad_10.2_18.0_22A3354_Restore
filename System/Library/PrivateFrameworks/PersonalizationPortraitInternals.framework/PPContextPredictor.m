@implementation PPContextPredictor

- (PPContextPredictor)initWithLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PPContextPredictor *v7;

  v4 = a3;
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mlModelForModelName:namespaceName:error:", CFSTR("context_predictor.mlmodelc"), CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PPContextPredictor initWithMLModel:language:](self, "initWithMLModel:language:", v6, v4);

  return v7;
}

- (PPContextPredictor)initWithMLModel:(id)a3 language:(id)a4
{
  id v7;
  id v8;
  PPContextPredictor *v9;
  PPContextPredictor *v10;
  uint64_t v11;
  OS_dispatch_queue *coremlQueue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PPContextPredictor;
  v9 = -[PPContextPredictor init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mlModel, a3);
    objc_storeStrong((id *)&v10->_language, a4);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "PPContextPredictor-modelQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    coremlQueue = v10->_coremlQueue;
    v10->_coremlQueue = (OS_dispatch_queue *)v11;

  }
  return v10;
}

- (id)contextForSentence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  PPExtractionContext *v11;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *coremlQueue;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  unint64_t i;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSString *language;
  NSObject *v32;
  os_log_t oslog;
  void *v34;
  uint8_t v35[16];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  NSObject *v42;
  id v43;
  __int128 block;
  void (*v45)(_QWORD *);
  void *v46;
  PPContextPredictor *v47;
  os_log_t v48;
  uint64_t *v49;
  const __CFString *v50;
  void *v51;
  uint8_t buf[4];
  NSString *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!self->_mlModel)
    return 0;
  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sentenceEmbeddingVersion");

  v8 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0CCE128], "wordEmbeddingForLanguage:revision:", self->_language, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  if (v9 && (unint64_t)objc_msgSend(v9, "dimension") < 0x12D)
  {
    bzero(buf, 0x5DC0uLL);
    if ((unint64_t)objc_msgSend(v4, "count") <= 0x14)
    {
      v13 = objc_msgSend(v4, "count");
      if (!v13)
      {
LABEL_13:
        v43 = 0;
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithDataPointer:shape:dataType:strides:deallocator:error:", buf, &unk_1E7E5B308, 65568, &unk_1E7E5B320, &__block_literal_global_10388, &v43);
        v10 = v43;
        if (v34)
        {
          v17 = objc_alloc(MEMORY[0x1E0C9E8F8]);
          v18 = (void *)MEMORY[0x1C3BD6630]();
          v50 = CFSTR("embedded_content");
          v51 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v18);
          v42 = v10;
          v20 = (void *)objc_msgSend(v17, "initWithDictionary:error:", v19, &v42);
          v32 = v42;

          if (v20)
          {
            v36 = 0;
            v37 = &v36;
            v38 = 0x3032000000;
            v39 = __Block_byref_object_copy__10394;
            v40 = __Block_byref_object_dispose__10395;
            v41 = 0;
            coremlQueue = self->_coremlQueue;
            *(_QWORD *)&block = MEMORY[0x1E0C809B0];
            *((_QWORD *)&block + 1) = 3221225472;
            v45 = __52__PPContextPredictor_contextUsingCoreMLForSentence___block_invoke_37;
            v46 = &unk_1E7E1BAB8;
            v49 = &v36;
            v47 = self;
            oslog = v20;
            v48 = oslog;
            dispatch_sync(coremlQueue, &block);
            v22 = (void *)v37[5];
            if (v22)
            {
              objc_msgSend(v22, "featureValueForName:", CFSTR("probabilities"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "multiArrayValue");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24)
              {
                v25 = objc_opt_new();
                for (i = 0; i < objc_msgSend(v24, "count"); ++i)
                {
                  v27 = (void *)MEMORY[0x1C3BD6630]();
                  objc_msgSend(v24, "objectAtIndexedSubscript:", i);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v28, v29);

                  objc_autoreleasePoolPop(v27);
                }
                v11 = -[PPExtractionContext initWithProbabilities:]([PPExtractionContext alloc], "initWithProbabilities:", v25);
              }
              else
              {
                pp_default_log_handle();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v35 = 0;
                  _os_log_error_impl(&dword_1C392E000, v25, OS_LOG_TYPE_ERROR, "PPContextPredictor: unable to fetch array.", v35, 2u);
                }
                v11 = 0;
              }

            }
            else
            {
              v11 = 0;
            }

            _Block_object_dispose(&v36, 8);
          }
          else
          {
            pp_default_log_handle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              LODWORD(block) = 138412290;
              *(_QWORD *)((char *)&block + 4) = v32;
              _os_log_error_impl(&dword_1C392E000, v30, OS_LOG_TYPE_ERROR, "PPContextPredictor: unable to construct feature provider: %@", (uint8_t *)&block, 0xCu);
            }

            oslog = 0;
            v11 = 0;
          }
          v10 = v32;
        }
        else
        {
          pp_default_log_handle();
          oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            LODWORD(block) = 138412290;
            *(_QWORD *)((char *)&block + 4) = v10;
            _os_log_error_impl(&dword_1C392E000, oslog, OS_LOG_TYPE_ERROR, "PPContextPredictor: unable to allocate multiarray: %@", (uint8_t *)&block, 0xCu);
          }
          v11 = 0;
        }

        goto LABEL_35;
      }
    }
    else
    {
      v13 = 20;
    }
    v14 = 0;
    v15 = buf;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getVector:forString:", v15, v16);

      ++v14;
      v15 += 1200;
    }
    while (v13 != v14);
    goto LABEL_13;
  }
  pp_default_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    language = self->_language;
    *(_DWORD *)buf = 138412290;
    v53 = language;
    _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "PPContextPredictor: unsupported language %@", buf, 0xCu);
  }
  v11 = 0;
LABEL_35:

  objc_autoreleasePoolPop(v5);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coremlQueue, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
}

void __52__PPContextPredictor_contextUsingCoreMLForSentence___block_invoke_37(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  v9 = 0;
  objc_msgSend(v3, "predictionFromFeatures:error:", v2, &v9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "PPContextPredictor: unable to invoke model: %@", buf, 0xCu);
    }

  }
}

@end
