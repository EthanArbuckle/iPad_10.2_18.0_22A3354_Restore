@implementation CRTextSequenceRecognizerModelEspresso

- (id)modelFilePath
{
  void *v2;
  void *v3;
  void *v4;

  -[CRTextSequenceRecognizerModel modelURL](self, "modelURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("model.espresso.net"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CRTextSequenceRecognizerModelEspresso)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v7;
  CRTextSequenceRecognizerModelEspresso *v8;
  CRTextSequenceRecognizerModelEspresso *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  NSObject *v16;
  qos_class_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *predictionQueue;
  CRTextSequenceRecognizerModelEspresso *v21;
  id v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CRTextSequenceRecognizerModelEspresso;
  v8 = -[CRTextSequenceRecognizerModelEspresso init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    CROSLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "defaultURLOfModelInThisBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_DEFAULT, "Loading model: %@", buf, 0xCu);

    }
    v23 = 0;
    v13 = -[CRTextSequenceRecognizerModelEspresso _setupContextAndPlanForConfiguration:error:](v9, "_setupContextAndPlanForConfiguration:error:", v7, &v23);
    v14 = v23;
    v15 = v14;
    if (a4 && v14)
      *a4 = objc_retainAutorelease(v14);
    if (!v13)
    {

      v21 = 0;
      goto LABEL_11;
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(v16, v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = dispatch_queue_create("com.apple.CoreRecognition.recognizerPredictionQueue", v18);
    predictionQueue = v9->_predictionQueue;
    v9->_predictionQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v9->_recognizerConfiguration, a3);
    v9->_submissionLock._os_unfair_lock_opaque = 0;

  }
  v21 = v9;
LABEL_11:

  return v21;
}

- (NSArray)outputNames
{
  return (NSArray *)&unk_1E993CF80;
}

- (id)predictFromInputs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id *v17;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  -[CRTextSequenceRecognizerModelEspresso predictionQueue](self, "predictionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__CRTextSequenceRecognizerModelEspresso_predictFromInputs_error___block_invoke;
  v14[3] = &unk_1E98DA188;
  v14[4] = self;
  v15 = v6;
  v17 = a4;
  v9 = v7;
  v16 = v9;
  v10 = v6;
  dispatch_sync(v8, v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __65__CRTextSequenceRecognizerModelEspresso_predictFromInputs_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  qos_class_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  unint64_t i;
  dispatch_block_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t j;
  void *v21;
  int v22;
  void *v23;
  unint64_t v24;
  char *v25;
  size_t v26;
  uint64_t v27;
  uint64_t v28;
  void **v29;
  size_t v30;
  const void *v31;
  uint64_t v32;
  int v33;
  unint64_t k;
  void *v35;
  BOOL v36;
  void *v37;
  id v38;
  int v39;
  os_unfair_lock_s *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t m;
  NSObject *attr;
  dispatch_queue_t v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *__p;
  void *v53;
  uint64_t v54;
  char v55[24];
  unint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void **v66;
  char v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t *v74;
  id v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "_shouldReconfigurePlanForInput:", v3);

  if (!(_DWORD)v2)
    goto LABEL_6;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  v6 = objc_msgSend(v4, "_configurePlanForInput:error:", v5, &v75);
  v7 = v75;

  if (v7 && *(_QWORD *)(a1 + 56))
    **(_QWORD **)(a1 + 56) = objc_retainAutorelease(v7);

  if (v6)
  {
LABEL_6:
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(v8, v9, 0);
    attr = objc_claimAutoreleasedReturnValue();

    v47 = dispatch_queue_create("com.apple.CoreRecognition.recognizerOutputQueue", attr);
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v11 = v10;
    v73 = 0;
    v72 = 0;
    v74 = 0;
    v66 = (void **)&v72;
    v67 = 0;
    if (v10)
    {
      if (v10 >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v12 = v10;
      v13 = (uint64_t *)operator new(8 * v10);
      v72 = v13;
      v74 = &v13[v11];
      bzero(v13, 8 * v11);
      v73 = &v13[v12];
    }
    for (i = 0; i < objc_msgSend(*(id *)(a1 + 40), "count", attr); ++i)
    {
      v15 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_5);
      v16 = (void *)v72[i];
      v72[i] = (uint64_t)v15;

    }
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = *(id *)(a1 + 40);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    if (v17)
    {
      v18 = 0;
      v19 = 0;
      v49 = *(_QWORD *)v69;
      do
      {
        v50 = v17;
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v69 != v49)
            objc_enumerationMutation(obj);
          if ((v19 & 1) != 0)
          {
            if (v18 >= v73 - v72)
              std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
            (*(void (**)(void))(v72[v18] + 16))();
            v19 = 1;
          }
          else
          {
            v21 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
            objc_msgSend(*(id *)(a1 + 32), "network");
            objc_msgSend(CFSTR("img_input"), "UTF8String");
            v22 = espresso_network_bind_buffer();
            objc_msgSend(*(id *)(a1 + 32), "outputNames");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");
            v63 = 0;
            v64 = 0;
            v65 = 0;
            if (v24)
            {
              std::vector<espresso_buffer_t>::__vallocate[abi:ne180100](&v63, v24);
              v25 = (char *)v64;
              v26 = 168 * ((168 * v24 - 168) / 0xA8) + 168;
              bzero(v64, v26);
              v64 = &v25[v26];
            }

            if (v22)
              goto LABEL_61;
            if (v21)
            {
              objc_msgSend(v21, "img_input");
              v27 = *((_QWORD *)&v62 + 1);
              objc_msgSend(v21, "img_input");
              v28 = v60;
              v29 = v66;
              objc_msgSend(v21, "img_input");
              v30 = v28 * v27;
              v31 = (const void *)v61;
            }
            else
            {
              v31 = 0;
              v30 = 0;
              v29 = v66;
              v61 = 0u;
              v62 = 0u;
            }
            memcpy(v29, v31, v30);
            v32 = 0;
            v33 = 0;
            for (k = 0; ; ++k)
            {
              objc_msgSend(*(id *)(a1 + 32), "outputNames");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = k < objc_msgSend(v35, "count");

              if (!v36)
                break;
              objc_msgSend(*(id *)(a1 + 32), "network");
              objc_msgSend(*(id *)(a1 + 32), "outputNames");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "objectAtIndexedSubscript:", k);
              v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              objc_msgSend(v38, "UTF8String");
              v33 = espresso_network_bind_buffer();

              v32 += 168;
            }
            if (v33)
              goto LABEL_61;
            v39 = objc_msgSend(*(id *)(a1 + 32), "engine");
            v40 = *(os_unfair_lock_s **)(a1 + 32);
            if (v39 == 10007)
            {
              os_unfair_lock_lock(v40 + 18);
              objc_msgSend(*(id *)(a1 + 32), "plan");
              v53 = 0;
              v54 = 0;
              __p = 0;
              std::vector<espresso_buffer_t>::__init_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(&__p, v63, (uint64_t)v64, 0xCF3CF3CF3CF3CF3DLL * (((_BYTE *)v64 - (_BYTE *)v63) >> 3));
              v51 = *(id *)(a1 + 48);
              memset(v55, 0, sizeof(v55));
              std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__init_with_size[abi:ne180100]<void({block_pointer} {__strong}*)(void),void({block_pointer} {__strong}*)(void)>(v55, v72, v73, v73 - v72);
              v56 = v18;
              v41 = espresso_plan_submit();
              os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 72));
              *(_QWORD *)&v61 = v55;
              std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);

              if (__p)
              {
                v53 = __p;
                operator delete(__p);
              }
            }
            else
            {
              -[os_unfair_lock_s plan](v40, "plan");
              v41 = espresso_plan_execute_sync();
              v42 = *(void **)(a1 + 32);
              v58 = 0;
              v59 = 0;
              v57 = 0;
              std::vector<espresso_buffer_t>::__init_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(&v57, v63, (uint64_t)v64, 0xCF3CF3CF3CF3CF3DLL * (((_BYTE *)v64 - (_BYTE *)v63) >> 3));
              objc_msgSend(v21, "textFeatureInfo");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "outputFromOutputBuffers:featureInfo:", &v57, v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v57)
              {
                v58 = v57;
                operator delete(v57);
              }
              objc_msgSend(*(id *)(a1 + 48), "addObject:", v44);
              if (!v41)
              {
                if (v18 >= v73 - v72)
                  std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
                (*(void (**)(void))(v72[v18] + 16))();
              }

            }
            if (v41)
            {
LABEL_61:
              if (*(_QWORD *)(a1 + 56))
              {
                +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -8);
                **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
              }
              if (v18 >= v73 - v72)
                std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
              (*(void (**)(void))(v72[v18] + 16))();
              v19 = 1;
            }
            else
            {
              v19 = 0;
            }
            if (v63)
            {
              v64 = v63;
              operator delete(v63);
            }
          }
          ++v18;
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      }
      while (v17);
    }

    for (m = 0; m < objc_msgSend(*(id *)(a1 + 40), "count"); ++m)
      dispatch_block_wait((dispatch_block_t)v72[m], 0xFFFFFFFFFFFFFFFFLL);
    v66 = (void **)&v72;
    std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__destroy_vector::operator()[abi:ne180100](&v66);

  }
}

void __65__CRTextSequenceRecognizerModelEspresso_predictFromInputs_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *__p;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v12 = 0;
  v13 = 0;
  __p = 0;
  std::vector<espresso_buffer_t>::__init_with_size[abi:ne180100]<espresso_buffer_t*,espresso_buffer_t*>(&__p, *(const void **)(a1 + 56), *(_QWORD *)(a1 + 64), 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*(_QWORD *)(a1 + 64) - *(_QWORD *)(a1 + 56)) >> 3));
  objc_msgSend(*(id *)(a1 + 40), "textFeatureInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputFromOutputBuffers:featureInfo:", &__p, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v12 = __p;
    operator delete(__p);
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  if (a2 && *(_DWORD *)(a2 + 4))
  {
    CROSLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a2 + 8);
      *(_DWORD *)buf = 136315138;
      v15 = v8;
      _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_ERROR, "Encountered error during plan submission: %s", buf, 0xCu);
    }

  }
  v9 = *(_QWORD *)(a1 + 104);
  v10 = *(_QWORD *)(a1 + 80);
  if (v9 >= (*(_QWORD *)(a1 + 88) - v10) >> 3)
    std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
  (*(void (**)(void))(*(_QWORD *)(v10 + 8 * v9) + 16))();

}

- (id)inputBatchFromLineRegions:(id)a3 image:(id)a4 regionWidth:(double)a5 configuration:(id)a6 rectifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  double v17;
  void *v18;
  CRTextRecognizerModelEspressoInput *v19;
  CRTextRecognizerModelEspressoInput *v20;
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(v12, "count");
  if (-[CRTextSequenceRecognizerModelEspresso shouldSaturateInputBatches](self, "shouldSaturateInputBatches"))
    v16 = objc_msgSend(v14, "batchSize");
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v14, "inputHeight");
  -[CRTextSequenceRecognizerModelEspresso _createBufferWithWidth:height:channels:batchSize:sequenceLength:](self, "_createBufferWithWidth:height:channels:batchSize:sequenceLength:", (unint64_t)a5, (unint64_t)v17, 1, v16, 1);
  -[CRTextSequenceRecognizerModel populateInputBatchData:lineRegions:image:batchSize:width:configuration:rectifier:](self, "populateInputBatchData:lineRegions:image:batchSize:width:configuration:rectifier:", (_QWORD)v23, v12, v13, v16, v14, v15, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [CRTextRecognizerModelEspressoInput alloc];
  v22[0] = v23;
  v22[1] = v24;
  v20 = -[CRTextRecognizerModelEspressoInput initWithImg_input:batchSize:featureInfo:](v19, "initWithImg_input:batchSize:featureInfo:", v22, v16, v18);

  return v20;
}

- (id)outputFromOutputBuffers:()vector<espresso_buffer_t featureInfo:(std:(id)a4 :allocator<espresso_buffer_t>> *)a3
{
  id v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CRTextRecognizerModelEspressoOutput *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v6 = a4;
  var0 = a3->var0;
  v8 = *(_OWORD *)((char *)a3->var0 + 120);
  v35 = *(_OWORD *)((char *)a3->var0 + 104);
  v36 = v8;
  v9 = *(_OWORD *)((char *)var0 + 152);
  v37 = *(_OWORD *)((char *)var0 + 136);
  v38 = v9;
  v10 = *(_OWORD *)((char *)var0 + 56);
  v31 = *(_OWORD *)((char *)var0 + 40);
  v32 = v10;
  v11 = *(_OWORD *)((char *)var0 + 88);
  v33 = *(_OWORD *)((char *)var0 + 72);
  v34 = v11;
  v12 = *(_OWORD *)((char *)var0 + 24);
  v29 = *(_OWORD *)((char *)var0 + 8);
  v30 = v12;
  v13 = malloc_type_malloc(*((_QWORD *)var0 + 9), 0x7EE2E855uLL);
  memcpy(v13, *(const void **)a3->var0, *((_QWORD *)a3->var0 + 9));
  v14 = objc_msgSend(v6, "count");
  if (-[CRTextSequenceRecognizerModelEspresso shouldSaturateInputBatches](self, "shouldSaturateInputBatches"))
  {
    -[CRTextSequenceRecognizerModelEspresso configuration](self, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "batchSize");

  }
  v25 = v35;
  v26 = v36;
  v27 = v37;
  v28 = v38;
  v21 = v31;
  v22 = v32;
  v23 = v33;
  v24 = v34;
  v19 = v29;
  v20 = v30;
  v18 = v13;
  v16 = -[CRTextRecognizerModelEspressoOutput initWithOutputLabelProbs:featureInfo:batchSize:]([CRTextRecognizerModelEspressoOutput alloc], "initWithOutputLabelProbs:featureInfo:batchSize:", &v18, v6, v14);

  return v16;
}

- (BOOL)shouldSaturateInputBatches
{
  void *v3;
  int v4;
  void *v6;

  -[CRTextSequenceRecognizerModel outputFormatVersion](self, "outputFormatVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4 == 1)
    return self->_engine == 10007;
  -[CRTextSequenceRecognizerModel outputFormatVersion](self, "outputFormatVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intValue");

  return 1;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  CROSLogForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "defaultURLOfModelInThisBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1D4FB8000, v3, OS_LOG_TYPE_DEFAULT, "Unloading model: %@", buf, 0xCu);

  }
  -[CRTextSequenceRecognizerModelEspresso _resetEspressoState](self, "_resetEspressoState");
  v6.receiver = self;
  v6.super_class = (Class)CRTextSequenceRecognizerModelEspresso;
  -[CRTextSequenceRecognizerModel dealloc](&v6, sel_dealloc);
}

- (id)_modelConfigurationNameForInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRTextSequenceRecognizerModelEspresso recognizerConfiguration](self, "recognizerConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextSequenceRecognizerModelEspresso _configurationHashForInput:batchSize:](self, "_configurationHashForInput:batchSize:", v4, objc_msgSend(v5, "batchSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_configurationHashForInput:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CRTextSequenceRecognizerModelEspresso _configurationHashForInput:batchSize:](self, "_configurationHashForInput:batchSize:", v4, objc_msgSend(v4, "batchSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_configurationHashForInput:(id)a3 batchSize:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v6, "img_input");
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[CRTextSequenceRecognizerModelEspresso recognizerConfiguration](self, "recognizerConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputHeight");
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%ld_%ld_%ld_%ld_%ld_"), CFSTR("img_input"), 1, a4, 1, (unint64_t)v10, (_QWORD)v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_setupContextAndPlanForConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t engine;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *plan;
  id v13;
  int v14;
  int v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  _DWORD v20[2];
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CRTextSequenceRecognizerModelEspresso _resetEspressoState](self, "_resetEspressoState");
  self->_engine = 5;
  self->_precision = 65552;
  if (objc_msgSend(v6, "computeDeviceType") == 1)
  {
    engine = 0;
    self->_engine = 0;
    self->_precision = 65568;
  }
  else if ((objc_msgSend(v6, "usesAppleNeuralEngine") & 1) != 0)
  {
    engine = 10007;
    self->_engine = 10007;
    self->_precision = 65552;
  }
  else
  {
    engine = self->_engine;
  }
  v8 = -[CRTextSequenceRecognizerModelEspresso _createContextForEngine:configuration:](self, "_createContextForEngine:configuration:", engine, v6);
  self->_context = v8;
  if (!v8)
  {
    if (objc_msgSend(v6, "computeDeviceType") || self->_engine == 5)
    {
      if (self->_context)
        goto LABEL_15;
    }
    else
    {
      self->_engine = 5;
      v11 = -[CRTextSequenceRecognizerModelEspresso _createContextForEngine:configuration:](self, "_createContextForEngine:configuration:", 5, v6);
      self->_context = v11;
      if (v11)
        goto LABEL_15;
    }
    if (!self->_engine
      || (self->_engine = 0,
          self->_precision = 65568,
          v9 = -[CRTextSequenceRecognizerModelEspresso _createContextForEngine:configuration:](self, "_createContextForEngine:configuration:", 0, v6), (self->_context = v9) == 0))
    {
      if (a4)
      {
        +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
        v16 = 0;
        *a4 = v10;
        goto LABEL_28;
      }
LABEL_27:
      v16 = 0;
      goto LABEL_28;
    }
  }
LABEL_15:
  espresso_context_set_low_precision_accumulation();
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan)
  {
    CROSLogForCategory(3);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_1D4FB8000, v17, OS_LOG_TYPE_ERROR, "Failed to initialize plan", (uint8_t *)v20, 2u);
    }

    -[CRTextSequenceRecognizerModelEspresso _resetEspressoState](self, "_resetEspressoState");
    if (!a4)
      goto LABEL_27;
    goto LABEL_25;
  }
  -[CRTextSequenceRecognizerModelEspresso modelFilePath](self, "modelFilePath");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "UTF8String");
  v14 = espresso_plan_add_network();

  v15 = espresso_plan_build();
  if (v14 | v15)
  {
    CROSLogForCategory(3);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 67109376;
      v20[1] = v14;
      v21 = 1024;
      v22 = v15;
      _os_log_impl(&dword_1D4FB8000, v18, OS_LOG_TYPE_ERROR, "Error loading network %d, %d", (uint8_t *)v20, 0xEu);
    }

    -[CRTextSequenceRecognizerModelEspresso _resetEspressoState](self, "_resetEspressoState");
    if (!a4)
      goto LABEL_27;
LABEL_25:
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v16 = 1;
LABEL_28:

  return v16;
}

- (void)_createContextForEngine:(int)a3 configuration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *context;

  v5 = a4;
  v6 = v5;
  if (a3 == 5)
  {
    objc_msgSend(v5, "metalDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "metalDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      espresso_device_id_for_metal_device();

    }
  }
  context = (void *)espresso_create_context();

  return context;
}

- (vImage_Buffer)_createBufferWithWidth:(SEL)a3 height:(unint64_t)a4 channels:(unint64_t)a5 batchSize:(unint64_t)a6 sequenceLength:(unint64_t)a7
{
  vImagePixelCount v10;
  vImage_Buffer *result;

  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  v10 = a7 * a5;
  result = (vImage_Buffer *)malloc_type_calloc(a7 * a5 * a4, 4uLL, 0x100004052888210uLL);
  retstr->data = result;
  retstr->height = v10;
  retstr->width = a4;
  retstr->rowBytes = 4 * a4;
  return result;
}

- (BOOL)_shouldReconfigurePlanForInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[CRTextSequenceRecognizerModelEspresso currentConfigurationHash](self, "currentConfigurationHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  if (v4)
  {
    -[CRTextSequenceRecognizerModelEspresso _configurationHashForInput:](self, "_configurationHashForInput:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTextSequenceRecognizerModelEspresso currentConfigurationHash](self, "currentConfigurationHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  objc_sync_exit(v5);

  return v8;
}

- (BOOL)preheatWithError:(id *)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  double v8;
  unint64_t v9;
  double v10;
  CRTextRecognizerModelEspressoInput *v11;
  CRTextRecognizerModelEspressoInput *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  BOOL v17;
  char v18;
  id v20;
  _OWORD v21[2];
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = -[CRNeuralRecognizerConfiguration batchSize](self->_configuration, "batchSize");
  -[CRNeuralRecognizerConfiguration inputWidths](self->_configuration, "inputWidths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = (unint64_t)v8;

  -[CRNeuralRecognizerConfiguration inputHeight](self->_configuration, "inputHeight");
  v22 = 0u;
  v23 = 0u;
  -[CRTextSequenceRecognizerModelEspresso _createBufferWithWidth:height:channels:batchSize:sequenceLength:](self, "_createBufferWithWidth:height:channels:batchSize:sequenceLength:", v9, (unint64_t)v10, 1, v5, 1);
  v11 = [CRTextRecognizerModelEspressoInput alloc];
  v21[0] = v22;
  v21[1] = v23;
  v12 = -[CRTextRecognizerModelEspressoInput initWithImg_input:batchSize:featureInfo:](v11, "initWithImg_input:batchSize:featureInfo:", v21, v5, MEMORY[0x1E0C9AA60]);
  v24[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  -[CRTextSequenceRecognizerModelEspresso predictFromInputs:error:](self, "predictFromInputs:error:", v13, &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v20;

  if (v15)
    v16 = v14 == 0;
  else
    v16 = 0;
  v17 = !v16 || a3 == 0;
  v18 = !v17;
  if (!v17)
    *a3 = objc_retainAutorelease(v15);

  return v18 ^ 1;
}

- (BOOL)_configurePlanForInput:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  id v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CRTextSequenceRecognizerModelEspresso currentConfigurationHash](self, "currentConfigurationHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  if (v5)
  {
    objc_msgSend(v5, "batchSize");
    -[CRTextSequenceRecognizerModelEspresso recognizerConfiguration](self, "recognizerConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputHeight");

    objc_msgSend(v5, "img_input");
    -[CRTextSequenceRecognizerModelEspresso _modelConfigurationNameForInput:](self, "_modelConfigurationNameForInput:", v5);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[CRTextSequenceRecognizerModelEspresso _configurationHashForInput:](self, "_configurationHashForInput:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (espresso_plan_get_phase() == 1)
      espresso_plan_build_clean();
    v16 = objc_retainAutorelease(v14);
    objc_msgSend(v16, "UTF8String");
    if (espresso_network_select_configuration())
      goto LABEL_14;
    objc_msgSend(CFSTR("img_input"), "UTF8String");
    if (espresso_network_change_blob_shape())
      goto LABEL_14;
    objc_msgSend(CFSTR("img_input"), "UTF8String");
    espresso_network_declare_input();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[CRTextSequenceRecognizerModelEspresso outputNames](self, "outputNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i)), "UTF8String");
          espresso_network_declare_output();
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    if (espresso_plan_build())
    {
LABEL_14:
      if (a4)
      {
        +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -8);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = 1;
    }
    else
    {
      -[CRTextSequenceRecognizerModelEspresso setCurrentConfigurationHash:](self, "setCurrentConfigurationHash:", v15);
      v12 = 0;
    }

  }
  else
  {
    v12 = 1;
  }
  objc_sync_exit(v6);

  return v12 == 0;
}

- (void)_resetEspressoState
{
  if (self->_plan)
  {
    espresso_plan_destroy();
    self->_plan = 0;
  }
  if (self->_context)
  {
    espresso_context_destroy();
    self->_context = 0;
  }
}

- (void)releaseIntermediateBuffers
{
  -[CRTextSequenceRecognizerModelEspresso setCurrentConfigurationHash:](self, "setCurrentConfigurationHash:", &stru_1E98DC948);
  -[CRTextSequenceRecognizerModelEspresso plan](self, "plan");
  espresso_plan_build_clean();
}

- (id)configuration
{
  return objc_getProperty(self, a2, 88, 1);
}

- (CRNeuralRecognizerConfiguration)recognizerConfiguration
{
  return (CRNeuralRecognizerConfiguration *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRecognizerConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (void)plan
{
  return self->_plan;
}

- (void)setPlan:(void *)a3
{
  self->_plan = a3;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  void *v2;
  uint64_t v3;
  _QWORD v4[2];
  $C4732ECC957FA13B9B3DF4A51A95735B result;

  objc_copyStruct(v4, &self->_network, 16, 1, 0);
  v2 = (void *)v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setNetwork:(id)a3
{
  $C4732ECC957FA13B9B3DF4A51A95735B v3;

  v3 = a3;
  objc_copyStruct(&self->_network, &v3, 16, 1, 0);
}

- (int)engine
{
  return self->_engine;
}

- (void)setEngine:(int)a3
{
  self->_engine = a3;
}

- (int)precision
{
  return self->_precision;
}

- (void)setPrecision:(int)a3
{
  self->_precision = a3;
}

- (NSString)currentConfigurationHash
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCurrentConfigurationHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (OS_dispatch_queue)predictionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPredictionQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionQueue, 0);
  objc_storeStrong((id *)&self->_currentConfigurationHash, 0);
  objc_storeStrong((id *)&self->_recognizerConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
