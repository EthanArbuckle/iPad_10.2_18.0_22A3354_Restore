@implementation UPCalibrationModel

- (id)scoreFromQuery:(id)a3 preprocessorOutput:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  void *__p;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  SNLPOSLoggerForCategory(7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  SNLPOSLoggerForCategory(7);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CalibrationInference", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN \"CalibrationInference\", buf, 2u);
  }

  v14 = objc_msgSend(v8, "spanLabelsTensor");
  v30 = 0;
  v31 = 0;
  v32 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v30, *(const void **)v14, *(_QWORD *)(v14 + 8), (uint64_t)(*(_QWORD *)(v14 + 8) - *(_QWORD *)v14) >> 3);
  v33 = 0;
  v34 = 0;
  v35 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v33, *(const void **)(v14 + 24), *(_QWORD *)(v14 + 32), (uint64_t)(*(_QWORD *)(v14 + 32) - *(_QWORD *)(v14 + 24)) >> 2);
  v15 = objc_msgSend(v8, "embeddingsTensor");
  v24 = 0;
  v25 = 0;
  v26 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v24, *(const void **)v15, *(_QWORD *)(v15 + 8), (uint64_t)(*(_QWORD *)(v15 + 8) - *(_QWORD *)v15) >> 3);
  __p = 0;
  v28 = 0;
  v29 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, *(const void **)(v15 + 24), *(_QWORD *)(v15 + 32), (uint64_t)(*(_QWORD *)(v15 + 32) - *(_QWORD *)(v15 + 24)) >> 2);
  objc_msgSend(v7, "utterance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPCalibrationModel forwardWithSpanLabels:embeddings:utterance:](self, "forwardWithSpanLabels:embeddings:utterance:", &v30, &v24, v16);
  v18 = v17;

  if (__p)
  {
    v28 = __p;
    operator delete(__p);
  }
  if (v24)
  {
    v25 = v24;
    operator delete(v24);
  }
  if (v33)
  {
    v34 = v33;
    operator delete(v33);
  }
  if (v30)
  {
    v31 = v30;
    operator delete(v30);
  }
  SNLPOSLoggerForCategory(7);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v20, OS_SIGNPOST_INTERVAL_END, v10, "CalibrationInference", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v21, OS_LOG_TYPE_DEFAULT, "END \"CalibrationInference\", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (UPCalibrationModel)initWithLoadedModelConfiguration:(id)a3
{
  id v5;
  UPCalibrationModel *v6;
  UPCalibrationModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UPCalibrationModel;
  v6 = -[UPCalibrationModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__loadedModelConfiguration, a3);

  return v7;
}

- (double)forwardWithSpanLabels:(UPGenericTensor *)a3 embeddings:(UPGenericTensor *)a4 utterance:(id)a5
{
  id v8;
  EspressoModule *v9;
  float v10;
  char __p[17];
  char v13;
  void *v14;
  _BYTE *v15;
  void *v16;
  char v17;

  v8 = a5;
  v9 = -[UPLoadedModelConfiguration calibrationEspressoModule](self->__loadedModelConfiguration, "calibrationEspressoModule");
  uaap::EspressoModule::reshape((uint64_t)v9, (uint64_t)a4, (uint64_t)a3);
  uaap::EspressoModule::buildPlan((uaap::EspressoModule *)v9);
  v13 = 12;
  strcpy(__p, "span_indices");
  uaap::EspressoModule::setInput((uint64_t)v9, (uint64_t)__p, (uint64_t *)&a3->data);
  if (v13 < 0)
    operator delete(*(void **)__p);
  v13 = 16;
  strcpy(__p, "token_embeddings");
  uaap::EspressoModule::setInput((uint64_t)v9, (uint64_t)__p, (uint64_t *)&a4->data);
  if (v13 < 0)
    operator delete(*(void **)__p);
  uaap::EspressoModule::executePlan((uaap::EspressoModule *)v9);
  std::string::basic_string[abi:ne180100]<0>(&v16, "app_label_softmax");
  uaap::EspressoModule::getOutput((uint64_t)__p);
  if ((unint64_t)(v15 - (_BYTE *)v14) <= 4)
    std::vector<nlv4_inference_orchestrator::trees::TreeNode>::__throw_out_of_range[abi:ne180100]();
  v10 = *((float *)v14 + 1);
  uaap::EspressoModule::cleanPlan((uaap::EspressoModule *)v9);
  if (v14)
  {
    v15 = v14;
    operator delete(v14);
  }
  if (*(_QWORD *)__p)
  {
    *(_QWORD *)&__p[8] = *(_QWORD *)__p;
    operator delete(*(void **)__p);
  }
  if (v17 < 0)
    operator delete(v16);

  return v10;
}

- (UPLoadedModelConfiguration)_loadedModelConfiguration
{
  return self->__loadedModelConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loadedModelConfiguration, 0);
}

+ (UPCalibrationModel)modelWithLoadedModelConfiguration:(id)a3 error:(id *)a4
{
  id v5;
  UPCalibrationModel *v6;

  v5 = a3;
  if (objc_msgSend(v5, "calibrationEspressoModule"))
  {
    v6 = -[UPCalibrationModel initWithLoadedModelConfiguration:]([UPCalibrationModel alloc], "initWithLoadedModelConfiguration:", v5);
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 9, 0);
    v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
