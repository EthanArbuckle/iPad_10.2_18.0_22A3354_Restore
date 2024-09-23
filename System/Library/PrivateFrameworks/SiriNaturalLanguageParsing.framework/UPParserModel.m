@implementation UPParserModel

- (UPParserModel)initWithLoadedModelConfiguration:(id)a3
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  UPParserModel *v11;
  UPParserModel *v12;
  UPModelIdentifier *v13;
  void *v14;
  uint64_t v15;
  UPModelIdentifier *identifier;
  UPUsoSerializer *v17;
  UPUsoSerializer *usoSerializer;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  objc_super v23;
  uint8_t buf[16];

  v5 = a3;
  SNLPOSLoggerForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  SNLPOSLoggerForCategory(7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UaaP UPParserModelInit initWithLoadedModelConfiguration", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN \"UaaP UPParserModelInit initWithLoadedModelConfiguration\", buf, 2u);
  }

  v23.receiver = self;
  v23.super_class = (Class)UPParserModel;
  v11 = -[UPParserModel init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->__loadedModelConfiguration, a3);
    v13 = [UPModelIdentifier alloc];
    -[UPLoadedModelConfiguration bundleId](v12->__loadedModelConfiguration, "bundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[UPModelIdentifier initWithAppBundleId:](v13, "initWithAppBundleId:", v14);
    identifier = v12->_identifier;
    v12->_identifier = (UPModelIdentifier *)v15;

    v17 = objc_alloc_init(UPUsoSerializer);
    usoSerializer = v12->__usoSerializer;
    v12->__usoSerializer = v17;

  }
  SNLPOSLoggerForCategory(7);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v20, OS_SIGNPOST_INTERVAL_END, v7, "UaaP UPParserModelInit initWithLoadedModelConfiguration", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v21, OS_LOG_TYPE_DEFAULT, "END \"UaaP UPParserModelInit initWithLoadedModelConfiguration\", buf, 2u);
  }

  return v12;
}

- (id)predictionFromQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  -[UPLoadedModelConfiguration preprocessor](self->__loadedModelConfiguration, "preprocessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v7, "preprocess:error:", v6, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;

  if (v8)
  {
    -[UPParserModel predictionFromQuery:preprocessorOutput:error:](self, "predictionFromQuery:preprocessorOutput:error:", v6, v8, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v10;
}

- (id)_candidateForUtterance:(const void *)a3 probability:(float)a4 labelledSpans:(const void *)a5 intent:(id)a6 sharedEntityResolution:(id)a7
{
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  std::string *p_p;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  UPResultCandidateEntity *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  UPUsoSerializer *usoSerializer;
  void *v37;
  void *v38;
  void *v39;
  UPResultCandidate *v40;
  id v43;
  unint64_t v44;
  const void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  std::string __p;
  std::basic_string<char16_t> v51;

  v43 = a6;
  v47 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((char *)a3 + 23) >= 0)
    v11 = *((unsigned __int8 *)a3 + 23);
  else
    v11 = *((_QWORD *)a3 + 1);
  v12 = 0x1E7BE3000uLL;
  if (v11)
  {
    v13 = 0;
    v44 = v11;
    v45 = a3;
    do
    {
      v14 = *(_QWORD *)a5;
      v15 = *((_QWORD *)a5 + 1);
      if (*(_QWORD *)a5 != v15)
      {
        v16 = 0;
        do
        {
          if (v13 == *(_QWORD *)(v14 + 16))
            v16 = v14;
          v14 += 104;
        }
        while (v14 != v15);
        if (v16)
        {
          u16Substring((uint64_t *)a3, *(_QWORD *)(v16 + 16), *(_QWORD *)(v16 + 24), &v51);
          objc_msgSend(*(id *)(v12 + 2208), "stdU16ToNSString:", &v51);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (*(_BYTE *)(v16 + 80))
          {
            v17 = (char *)(v16 + 56);
            if (*(char *)(v16 + 79) < 0)
              v17 = *(char **)v17;
            v18 = *(void **)(v12 + 2208);
            std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(&__p, v17);
            objc_msgSend(v18, "stdU16ToNSString:", &__p);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
          }
          else
          {
            v48 = 0;
          }
          objc_msgSend(*(id *)(v12 + 2208), "stdU16ToNSString:", v16 + 32);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (*(_BYTE *)(v16 + 96))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(v16 + 88));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = 0;
          }
          v21 = v12;
          v22 = objc_msgSend(*(id *)(v12 + 2208), "rangeFromStart:end:", *(_QWORD *)v16, *(_QWORD *)(v16 + 8));
          v24 = v23;
          v25 = (void *)MEMORY[0x1E0CB3940];
          toString(v16 + 32, &__p);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            p_p = &__p;
          else
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          objc_msgSend(v25, "stringWithUTF8String:", p_p);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          objc_msgSend(v47, "resolveSharedEntityForTokenRange:valueType:", v22, v24, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(*(id *)(v21 + 2208), "rangeFromStart:end:", *(_QWORD *)(v16 + 16), *(_QWORD *)(v16 + 24));
          v31 = -[UPResultCandidateEntity initWithRange:label:text:groupId:semanticValue:sharedEntityGraph:]([UPResultCandidateEntity alloc], "initWithRange:label:text:groupId:semanticValue:sharedEntityGraph:", v29, v30, v19, v49, v20, v48, v28);
          objc_msgSend(v46, "addObject:", v31);
          v34 = v16 + 16;
          v33 = *(_QWORD *)(v16 + 16);
          v32 = *(_QWORD *)(v34 + 8);

          if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v51.__r_.__value_.__l.__data_);
          v13 += v32 + ~v33;
          v11 = v44;
          a3 = v45;
          v12 = v21;
        }
      }
      ++v13;
    }
    while (v13 < v11);
  }
  objc_msgSend(*(id *)(v12 + 2208), "stdU16ToNSString:", a3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  usoSerializer = self->__usoSerializer;
  -[UPModelIdentifier appBundleId](self->_identifier, "appBundleId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPUsoSerializer serializeFromIntent:andEntities:forBundleId:](usoSerializer, "serializeFromIntent:andEntities:forBundleId:", v43, v46, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA2DB8]), "initWithTask:", v38);
  v40 = -[UPResultCandidate initWithUncalibratedProbability:calibratedProbability:utterance:intent:entities:modelIdentifier:task:]([UPResultCandidate alloc], "initWithUncalibratedProbability:calibratedProbability:utterance:intent:entities:modelIdentifier:task:", 0, v35, v43, v46, self->_identifier, v39, a4);

  return v40;
}

- (UPInferenceResult)forwardWithSpanLabels:(SEL)a3 embeddings:(UPGenericTensor *)a4 utterance:(UPGenericTensor *)a5
{
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  EspressoModule *v15;
  __int128 v16;
  float *v17;
  unint64_t *v18;
  float *v19;
  unint64_t *v20;
  float *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  UPInferenceResult *result;
  uint8_t v26[16];
  void *v27[2];
  unint64_t *v28;
  void *__p[2];
  float *v30;
  void *v31[2];
  unint64_t *v32;
  void *v33[2];
  float *v34;
  uint8_t buf[24];
  void *v36[2];
  float *v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;

  SNLPOSLoggerForCategory(7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  SNLPOSLoggerForCategory(7);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "UaaP EspressoInference", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"UaaP EspressoInference\", buf, 2u);
  }

  v15 = -[UPLoadedModelConfiguration parserEspressoModule](self->__loadedModelConfiguration, "parserEspressoModule");
  uaap::EspressoModule::reshape((uint64_t)v15, (uint64_t)a5, (uint64_t)a4);
  uaap::EspressoModule::buildPlan((uaap::EspressoModule *)v15);
  buf[23] = 12;
  strcpy((char *)buf, "span_indices");
  uaap::EspressoModule::setInput((uint64_t)v15, (uint64_t)buf, (uint64_t *)&a4->data);
  if ((char)buf[23] < 0)
    operator delete(*(void **)buf);
  buf[23] = 16;
  strcpy((char *)buf, "token_embeddings");
  uaap::EspressoModule::setInput((uint64_t)v15, (uint64_t)buf, (uint64_t *)&a5->data);
  if ((char)buf[23] < 0)
    operator delete(*(void **)buf);
  uaap::EspressoModule::executePlan((uaap::EspressoModule *)v15);
  std::string::basic_string[abi:ne180100]<0>(&v42, "intent_softmax");
  std::string::basic_string[abi:ne180100]<0>(&v40, "bio_labels_softmax");
  std::string::basic_string[abi:ne180100]<0>(&v38, "group_labels_softmax");
  uaap::EspressoModule::getOutput((uint64_t)buf);
  uaap::EspressoModule::getOutput((uint64_t)v31);
  uaap::EspressoModule::getOutput((uint64_t)v27);
  *(_OWORD *)&retstr->var0.shape.__begin_ = *(_OWORD *)buf;
  retstr->var0.shape.__end_cap_.__value_ = *(unint64_t **)&buf[16];
  v16 = *(_OWORD *)v36;
  v36[0] = 0;
  memset(buf, 0, sizeof(buf));
  v17 = v37;
  *(_OWORD *)&retstr->var0.data.__begin_ = v16;
  retstr->var0.data.__end_cap_.__value_ = v17;
  v36[1] = 0;
  v37 = 0;
  v18 = v32;
  *(_OWORD *)&retstr->var1.shape.__begin_ = *(_OWORD *)v31;
  retstr->var1.shape.__end_cap_.__value_ = v18;
  v31[0] = 0;
  v31[1] = 0;
  v19 = v34;
  *(_OWORD *)&retstr->var1.data.__begin_ = *(_OWORD *)v33;
  retstr->var1.data.__end_cap_.__value_ = v19;
  v32 = 0;
  v33[0] = 0;
  v33[1] = 0;
  v34 = 0;
  v20 = v28;
  *(_OWORD *)&retstr->var2.shape.__begin_ = *(_OWORD *)v27;
  retstr->var2.shape.__end_cap_.__value_ = v20;
  v27[0] = 0;
  v27[1] = 0;
  v21 = v30;
  *(_OWORD *)&retstr->var2.data.__begin_ = *(_OWORD *)__p;
  retstr->var2.data.__end_cap_.__value_ = v21;
  v28 = 0;
  __p[0] = 0;
  __p[1] = 0;
  v30 = 0;
  uaap::EspressoModule::cleanPlan((uaap::EspressoModule *)v15);
  SNLPOSLoggerForCategory(7);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v23, OS_SIGNPOST_INTERVAL_END, v11, "UaaP EspressoInference", ", v26, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_1C2196000, v24, OS_LOG_TYPE_DEFAULT, "END \"UaaP EspressoInference\", v26, 2u);
  }

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v27[0])
  {
    v27[1] = v27[0];
    operator delete(v27[0]);
  }
  if (v33[0])
  {
    v33[1] = v33[0];
    operator delete(v33[0]);
  }
  if (v31[0])
  {
    v31[1] = v31[0];
    operator delete(v31[0]);
  }
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  result = *(UPInferenceResult **)buf;
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  if (v39 < 0)
    operator delete(v38);
  if (v41 < 0)
    operator delete(v40);
  if (v43 < 0)
    operator delete(v42);
  return result;
}

- (id)_resultFromInferenceResult:(const void *)a3 query:(id)a4 outputTokens:(const void *)a5 resolver:(void *)a6 sharedEntityResolution:(id)a7
{
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  _QWORD *v15;
  unint64_t v16;
  float *v17;
  float *v18;
  double *v19;
  double v20;
  double *v21;
  double *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  double *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double *v39;
  double v40;
  void *v41;
  double *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  double *v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  double *v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  double *v60;
  double v61;
  double *v62;
  double *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  double *v69;
  uint64_t v70;
  _QWORD *v71;
  NSObject *v72;
  void *v73;
  nl_featurization::beam_search::BeamSequence *i;
  NSObject *v75;
  _BYTE *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  UPResult *v83;
  void *v84;
  UPResult *v85;
  os_signpost_id_t spid;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v95;
  uint64_t v96;
  id v97;
  void *v100[2];
  double *v101;
  uint64_t v102;
  _QWORD *v103;
  unint64_t v104;
  void *__p;
  double *v106;
  double *v107;
  void *v108;
  char v109;
  uint8_t buf[8];
  double *v111;
  double *v112;
  uint64_t v113;
  unint64_t *v114;
  _BYTE v115[12];
  char v116;
  uint8_t v117[4];
  _BYTE *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v92 = a4;
  v97 = a7;
  SNLPOSLoggerForCategory(7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  SNLPOSLoggerForCategory(7);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  spid = v10;
  v88 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "UaaP Post-Processing", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN \"UaaP Post-Processing\", buf, 2u);
  }

  objc_msgSend(v92, "utterance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UPUtilities nSStringToU16String:](UPUtilities, "nSStringToU16String:", v14);

  v15 = -[UPLoadedModelConfiguration beamMaskInput](self->__loadedModelConfiguration, "beamMaskInput");
  v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15[1] - *v15) >> 3);
  __p = 0;
  v106 = 0;
  v107 = 0;
  std::vector<double>::reserve(&__p, v16);
  v17 = (float *)*((_QWORD *)a3 + 3);
  v18 = (float *)*((_QWORD *)a3 + 4);
  if (v17 != v18)
  {
    v19 = v106;
    do
    {
      v20 = *v17;
      if (v19 >= v107)
      {
        v22 = (double *)__p;
        v23 = ((char *)v19 - (_BYTE *)__p) >> 3;
        v24 = v23 + 1;
        if ((unint64_t)(v23 + 1) >> 61)
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        v25 = (char *)v107 - (_BYTE *)__p;
        if (((char *)v107 - (_BYTE *)__p) >> 2 > v24)
          v24 = v25 >> 2;
        if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
          v26 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v26 = v24;
        if (v26)
        {
          v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v107, v26);
          v22 = (double *)__p;
          v19 = v106;
        }
        else
        {
          v27 = 0;
        }
        v28 = (double *)&v27[8 * v23];
        *v28 = v20;
        v21 = v28 + 1;
        while (v19 != v22)
        {
          v29 = *((_QWORD *)v19-- - 1);
          *((_QWORD *)v28-- - 1) = v29;
        }
        __p = v28;
        v106 = v21;
        v107 = (double *)&v27[8 * v26];
        if (v22)
          operator delete(v22);
      }
      else
      {
        *v19 = v20;
        v21 = v19 + 1;
      }
      v106 = v21;
      ++v17;
      v19 = v21;
    }
    while (v17 != v18);
  }
  v31 = *(_QWORD *)a5;
  v30 = *((_QWORD *)a5 + 1);
  v32 = -[UPLoadedModelConfiguration beamMaskInput](self->__loadedModelConfiguration, "beamMaskInput");
  v96 = v32[4];
  v95 = v32[3];
  v102 = 0;
  v103 = 0;
  v104 = 0;
  if ((unint64_t)(v30 - v31 + 47) >= 0x5F)
  {
    if ((unint64_t)((v30 - v31) / 48) > 0xAAAAAAAAAAAAAAALL)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    v114 = &v104;
    *(_QWORD *)buf = std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((v30 - v31) / 48);
    v111 = *(double **)buf;
    v112 = *(double **)buf;
    v113 = *(_QWORD *)buf + 24 * v33;
    std::vector<std::vector<unsigned long>>::__swap_out_circular_buffer(&v102, buf);
    std::__split_buffer<std::vector<unsigned long>>::~__split_buffer((uint64_t)buf);
  }
  v90 = v30;
  v91 = (v30 - v31) / 48;
  v89 = v31;
  if (v30 != v31)
  {
    v34 = 0;
    v35 = (v96 - v95) >> 3;
    if (v35 <= 1)
      v36 = 1;
    else
      v36 = (v96 - v95) >> 3;
    v37 = (v30 - v31) / 48;
    if (v91 <= 1)
      v37 = 1;
    v93 = v37;
    do
    {
      v100[0] = 0;
      v100[1] = 0;
      v101 = 0;
      std::vector<double>::reserve(v100, v35);
      if (v96 != v95)
      {
        v38 = 0;
        v39 = (double *)v100[1];
        do
        {
          v40 = *(float *)(*((_QWORD *)a3 + 9) + 4 * (v38 + v34 * v35));
          if (v39 >= v101)
          {
            v42 = (double *)v100[0];
            v43 = ((char *)v39 - (char *)v100[0]) >> 3;
            v44 = v43 + 1;
            if ((unint64_t)(v43 + 1) >> 61)
              std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
            v45 = (char *)v101 - (char *)v100[0];
            if (((char *)v101 - (char *)v100[0]) >> 2 > v44)
              v44 = v45 >> 2;
            if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8)
              v46 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v46 = v44;
            if (v46)
            {
              v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v101, v46);
              v42 = (double *)v100[0];
              v39 = (double *)v100[1];
            }
            else
            {
              v47 = 0;
            }
            v48 = (double *)&v47[8 * v43];
            *v48 = v40;
            v41 = v48 + 1;
            while (v39 != v42)
            {
              v49 = *((_QWORD *)v39-- - 1);
              *((_QWORD *)v48-- - 1) = v49;
            }
            v100[0] = v48;
            v100[1] = v41;
            v101 = (double *)&v47[8 * v46];
            if (v42)
              operator delete(v42);
          }
          else
          {
            *v39 = v40;
            v41 = v39 + 1;
          }
          v100[1] = v41;
          ++v38;
          v39 = (double *)v41;
        }
        while (v38 != v36);
      }
      v50 = v103;
      if ((unint64_t)v103 >= v104)
      {
        v51 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v103 - v102) >> 3);
        v52 = v51 + 1;
        if (v51 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * ((uint64_t)(v104 - v102) >> 3) > v52)
          v52 = 0x5555555555555556 * ((uint64_t)(v104 - v102) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v104 - v102) >> 3) >= 0x555555555555555)
          v53 = 0xAAAAAAAAAAAAAAALL;
        else
          v53 = v52;
        v114 = &v104;
        v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v53);
        v55 = (double *)&v54[24 * v51];
        *(_QWORD *)buf = v54;
        v111 = v55;
        v113 = (uint64_t)&v54[24 * v56];
        *v55 = 0.0;
        v55[1] = 0.0;
        v55[2] = 0.0;
        *(_OWORD *)v55 = *(_OWORD *)v100;
        *((_QWORD *)v55 + 2) = v101;
        v100[0] = 0;
        v100[1] = 0;
        v101 = 0;
        v112 = v55 + 3;
        std::vector<std::vector<unsigned long>>::__swap_out_circular_buffer(&v102, buf);
        v57 = v103;
        std::__split_buffer<std::vector<unsigned long>>::~__split_buffer((uint64_t)buf);
        v103 = v57;
        if (v100[0])
        {
          v100[1] = v100[0];
          operator delete(v100[0]);
        }
      }
      else
      {
        *v103 = 0;
        v50[1] = 0;
        v50[2] = 0;
        *(_OWORD *)v50 = *(_OWORD *)v100;
        v50[2] = v101;
        v100[0] = 0;
        v100[1] = 0;
        v101 = 0;
        v103 = v50 + 3;
      }
      ++v34;
    }
    while (v34 != v93);
  }
  *(_QWORD *)buf = 0;
  v111 = 0;
  v112 = 0;
  v58 = v91;
  std::vector<double>::reserve((void **)buf, v91);
  if (v90 != v89)
  {
    v59 = 0;
    if (v91 <= 1)
      v58 = 1;
    v60 = v111;
    do
    {
      v61 = *(float *)(*((_QWORD *)a3 + 15) + 4 * v59);
      if (v60 >= v112)
      {
        v63 = *(double **)buf;
        v64 = ((uint64_t)v60 - *(_QWORD *)buf) >> 3;
        v65 = v64 + 1;
        if ((unint64_t)(v64 + 1) >> 61)
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        v66 = (uint64_t)v112 - *(_QWORD *)buf;
        if (((uint64_t)v112 - *(_QWORD *)buf) >> 2 > v65)
          v65 = v66 >> 2;
        if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF8)
          v67 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v67 = v65;
        if (v67)
        {
          v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v112, v67);
          v63 = *(double **)buf;
          v60 = v111;
        }
        else
        {
          v68 = 0;
        }
        v69 = (double *)&v68[8 * v64];
        *v69 = v61;
        v62 = v69 + 1;
        while (v60 != v63)
        {
          v70 = *((_QWORD *)v60-- - 1);
          *((_QWORD *)v69-- - 1) = v70;
        }
        *(_QWORD *)buf = v69;
        v111 = v62;
        v112 = (double *)&v68[8 * v67];
        if (v63)
          operator delete(v63);
      }
      else
      {
        *v60 = v61;
        v62 = v60 + 1;
      }
      v111 = v62;
      ++v59;
      v60 = v62;
    }
    while (v59 != v58);
  }
  v71 = -[UPLoadedModelConfiguration beamMaskInput](self->__loadedModelConfiguration, "beamMaskInput");
  nl_featurization::beam_search::beamSearch((uint64_t *)&__p, (uint64_t)&v102, buf, v71, v71 + 3, v71 + 6, (uint64_t)(v71 + 9), (uint64_t)(v71 + 14), (uint64_t)v100, 5uLL);
  SNLPOSLoggerForCategory(3);
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v115 = 134217984;
    *(_QWORD *)&v115[4] = ((char *)v100[1] - (char *)v100[0]) >> 7;
    _os_log_impl(&dword_1C2196000, v72, OS_LOG_TYPE_DEBUG, "Number of BEAM sequences = %lu", v115, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", ((char *)v100[1] - (char *)v100[0]) >> 7);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = (nl_featurization::beam_search::BeamSequence *)v100[0];
        i != v100[1];
        i = (nl_featurization::beam_search::BeamSequence *)((char *)i + 128))
  {
    SNLPOSLoggerForCategory(3);
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
    {
      nl_featurization::beam_search::BeamSequence::toString((uint64_t *)v115, i);
      v76 = v116 >= 0 ? v115 : *(_BYTE **)v115;
      *(_DWORD *)v117 = 136315138;
      v118 = v76;
      _os_log_impl(&dword_1C2196000, v75, OS_LOG_TYPE_DEBUG, "Processing BEAM sequence: %s", v117, 0xCu);
      if (v116 < 0)
        operator delete(*(void **)v115);
    }

    -[UPParserModel _candidateForBeamSequence:utterance:outputTokens:resolver:sharedEntityResolution:](self, "_candidateForBeamSequence:utterance:outputTokens:resolver:sharedEntityResolution:", i, &v108, a5, a6, v97);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    SNLPOSLoggerForCategory(3);
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v77, "annotatedString");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v115 = 138412290;
      *(_QWORD *)&v115[4] = v79;
      _os_log_impl(&dword_1C2196000, v78, OS_LOG_TYPE_DEBUG, "Produced candidate: %@", v115, 0xCu);

    }
    objc_msgSend(v73, "addObject:", v77);

  }
  SNLPOSLoggerForCategory(7);
  v80 = objc_claimAutoreleasedReturnValue();
  v81 = v80;
  if (v88 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
  {
    *(_WORD *)v115 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v81, OS_SIGNPOST_INTERVAL_END, spid, "UaaP Post-Processing", ", v115, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v82 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v115 = 0;
    _os_log_impl(&dword_1C2196000, v82, OS_LOG_TYPE_DEFAULT, "END \"UaaP Post-Processing\", v115, 2u);
  }

  v83 = [UPResult alloc];
  objc_msgSend(v92, "uuid");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = -[UPResult initWithCandidates:queryUUID:](v83, "initWithCandidates:queryUUID:", v73, v84);

  *(_QWORD *)v115 = v100;
  std::vector<nl_featurization::beam_search::BeamSequence>::__destroy_vector::operator()[abi:ne180100]((void ***)v115);
  if (*(_QWORD *)buf)
  {
    v111 = *(double **)buf;
    operator delete(*(void **)buf);
  }
  *(_QWORD *)buf = &v102;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  if (__p)
  {
    v106 = (double *)__p;
    operator delete(__p);
  }
  if (v109 < 0)
    operator delete(v108);

  return v85;
}

- (id)_candidateForBeamSequence:(const void *)a3 utterance:(const void *)a4 outputTokens:(const void *)a5 resolver:(void *)a6 sharedEntityResolution:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  uint64_t i;
  uint64_t v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double *v37;
  id v38;
  std::basic_string<char16_t> __p;
  char v40;
  std::basic_string<char16_t> v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  std::basic_string<char16_t> v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55[2];
  char v56;
  void *v57;
  char v58;
  _QWORD v59[3];
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t *v64;
  __int128 buf;
  __int128 v66;
  std::basic_string<char16_t> v67;
  std::basic_string<char16_t> v68;
  unsigned __int8 v69;
  uint64_t v70;
  char v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v38 = a7;
  -[UPLoadedModelConfiguration intentVocabPath](self->__loadedModelConfiguration, "intentVocabPath");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v55, (char *)objc_msgSend(v12, "UTF8String"));
  -[UPLoadedModelConfiguration bioLabelsVocabPath](self->__loadedModelConfiguration, "bioLabelsVocabPath");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v57, (char *)objc_msgSend(v13, "UTF8String"));
  memset(v59, 0, sizeof(v59));
  std::vector<nl_featurization::Token>::__init_with_size[abi:ne180100]<nl_featurization::Token*,nl_featurization::Token*>(v59, *(__int128 **)a5, *((__int128 **)a5 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 4));

  v48 = *((_QWORD *)a3 + 2);
  v49 = 0;
  v50 = 0;
  v51 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v49, *((const void **)a3 + 7), *((_QWORD *)a3 + 8), (uint64_t)(*((_QWORD *)a3 + 8) - *((_QWORD *)a3 + 7)) >> 3);
  v52 = 0;
  v53 = 0;
  v54 = 0;
  std::vector<std::optional<unsigned long>>::__init_with_size[abi:ne180100]<std::optional<unsigned long>*,std::optional<unsigned long>*>(&v52, *((const void **)a3 + 13), *((_QWORD *)a3 + 14), (uint64_t)(*((_QWORD *)a3 + 14) - *((_QWORD *)a3 + 13)) >> 4);
  nl_featurization::postprocessing::base::postProcessBaseModel((__int128 **)v55, (const nl_featurization::postprocessing::base::BaseModelQueryContext *)&v48, &v45);
  SNLPOSLoggerForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = 0x4EC4EC4EC4EC4EC5 * ((v47 - v46) >> 3);
    _os_log_impl(&dword_1C2196000, v14, OS_LOG_TYPE_DEBUG, "%ld", (uint8_t *)&buf, 0xCu);
  }

  v37 = (double *)a3;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v16 = v46;
  for (i = v47; v16 != i; v16 += 104)
  {
    u16Substring((uint64_t *)a4, *(_QWORD *)(v16 + 16), *(_QWORD *)(v16 + 24), &v41);
    uaap_orchestration::resolution::Resolver::lookupSemanticValueForLabel(a6, (unsigned __int16 *)(v16 + 32), (unsigned __int16 *)&v41, &__p);
    if (v40)
    {
      buf = *(_OWORD *)v16;
      v66 = *(_OWORD *)(v16 + 16);
      if (*(char *)(v16 + 55) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external(&v67, *(const std::basic_string<char16_t>::value_type **)(v16 + 32), *(_QWORD *)(v16 + 40));
      }
      else
      {
        v17 = *(_OWORD *)(v16 + 32);
        v67.__r_.__value_.__r.__words[2] = *(_QWORD *)(v16 + 48);
        *(_OWORD *)&v67.__r_.__value_.__l.__data_ = v17;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        std::basic_string<char16_t>::__init_copy_ctor_external(&v68, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      else
        v68 = __p;
      v69 = 1;
      v20 = *(_QWORD *)(v16 + 88);
      v71 = *(_BYTE *)(v16 + 96);
      v70 = v20;
      v21 = v43;
      if (v43 >= v44)
      {
        v24 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v43 - v42) >> 3);
        v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) > 0x276276276276276)
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        if (0x9D89D89D89D89D8ALL * ((uint64_t)(v44 - v42) >> 3) > v25)
          v25 = 0x9D89D89D89D89D8ALL * ((uint64_t)(v44 - v42) >> 3);
        if ((unint64_t)(0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v44 - v42) >> 3)) >= 0x13B13B13B13B13BLL)
          v26 = 0x276276276276276;
        else
          v26 = v25;
        v64 = &v44;
        if (v26)
          v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<nl_featurization::postprocessing::LabelledSpan>>(v26);
        else
          v27 = 0;
        v60 = v26;
        v61 = v26 + 104 * v24;
        v62 = v61;
        v63 = v26 + 104 * v27;
        std::allocator<nl_featurization::postprocessing::LabelledSpan>::construct[abi:ne180100]<nl_featurization::postprocessing::LabelledSpan,nl_featurization::postprocessing::LabelledSpan>(v61, (uint64_t)&buf);
        v62 += 104;
        std::vector<nl_featurization::postprocessing::LabelledSpan>::__swap_out_circular_buffer(&v42, &v60);
        v22 = v43;
        std::__split_buffer<nl_featurization::postprocessing::LabelledSpan>::~__split_buffer((uint64_t)&v60);
        v23 = v69;
      }
      else
      {
        std::allocator<nl_featurization::postprocessing::LabelledSpan>::construct[abi:ne180100]<nl_featurization::postprocessing::LabelledSpan,nl_featurization::postprocessing::LabelledSpan>(v43, (uint64_t)&buf);
        v22 = v21 + 104;
        v23 = 1;
      }
      v43 = v22;
      if (v23 && SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v68.__r_.__value_.__l.__data_);
      if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v67.__r_.__value_.__l.__data_);
    }
    else
    {
      v18 = v43;
      if (v43 >= v44)
      {
        v28 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v43 - v42) >> 3);
        v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) > 0x276276276276276)
          std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
        if (0x9D89D89D89D89D8ALL * ((uint64_t)(v44 - v42) >> 3) > v29)
          v29 = 0x9D89D89D89D89D8ALL * ((uint64_t)(v44 - v42) >> 3);
        if ((unint64_t)(0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v44 - v42) >> 3)) >= 0x13B13B13B13B13BLL)
          v30 = 0x276276276276276;
        else
          v30 = v29;
        v67.__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)&v44;
        if (v30)
          v30 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<nl_featurization::postprocessing::LabelledSpan>>(v30);
        else
          v31 = 0;
        *(_QWORD *)&buf = v30;
        *((_QWORD *)&buf + 1) = v30 + 104 * v28;
        *(_QWORD *)&v66 = *((_QWORD *)&buf + 1);
        *((_QWORD *)&v66 + 1) = v30 + 104 * v31;
        std::allocator<nl_featurization::postprocessing::LabelledSpan>::construct[abi:ne180100]<nl_featurization::postprocessing::LabelledSpan,nl_featurization::postprocessing::LabelledSpan const&>(*((uint64_t *)&buf + 1), v16);
        *(_QWORD *)&v66 = v66 + 104;
        std::vector<nl_featurization::postprocessing::LabelledSpan>::__swap_out_circular_buffer(&v42, &buf);
        v19 = v43;
        std::__split_buffer<nl_featurization::postprocessing::LabelledSpan>::~__split_buffer((uint64_t)&buf);
      }
      else
      {
        std::allocator<nl_featurization::postprocessing::LabelledSpan>::construct[abi:ne180100]<nl_featurization::postprocessing::LabelledSpan,nl_featurization::postprocessing::LabelledSpan const&>(v43, v16);
        v19 = v18 + 104;
      }
      v43 = v19;
    }
    if (v40 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v41.__r_.__value_.__l.__data_);
  }
  v32 = *v37;
  +[UPUtilities stdU16ToNSString:](UPUtilities, "stdU16ToNSString:", &v45);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v34 = v32;
  -[UPParserModel _candidateForUtterance:probability:labelledSpans:intent:sharedEntityResolution:](self, "_candidateForUtterance:probability:labelledSpans:intent:sharedEntityResolution:", a4, &v42, v33, v38, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = &v42;
  std::vector<nl_featurization::postprocessing::LabelledSpan>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  *(_QWORD *)&buf = &v46;
  std::vector<nl_featurization::postprocessing::LabelledSpan>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  if (v52)
  {
    v53 = v52;
    operator delete(v52);
  }
  if (v49)
  {
    v50 = v49;
    operator delete(v49);
  }
  *(_QWORD *)&buf = v59;
  std::vector<nl_featurization::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (v58 < 0)
    operator delete(v57);
  if (v56 < 0)
    operator delete(v55[0]);

  return v35;
}

- (id)predictionFromQuery:(id)a3 preprocessorOutput:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  UPSharedEntityResolution *v14;
  void *v15;
  UPSharedEntityResolution *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  void *__p;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint8_t buf[8];
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
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
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
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "UaaP Prediction", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN \"UaaP Prediction\", buf, 2u);
  }

  v14 = [UPSharedEntityResolution alloc];
  objc_msgSend(v7, "spans");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UPSharedEntityResolution initWithMatchingSpans:](v14, "initWithMatchingSpans:", v15);

  v17 = objc_msgSend(v8, "spanLabelsTensor");
  v31 = 0;
  v32 = 0;
  v33 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v31, *(const void **)v17, *(_QWORD *)(v17 + 8), (uint64_t)(*(_QWORD *)(v17 + 8) - *(_QWORD *)v17) >> 3);
  v34 = 0;
  v35 = 0;
  v36 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v34, *(const void **)(v17 + 24), *(_QWORD *)(v17 + 32), (uint64_t)(*(_QWORD *)(v17 + 32) - *(_QWORD *)(v17 + 24)) >> 2);
  v18 = objc_msgSend(v8, "embeddingsTensor");
  v25 = 0;
  v26 = 0;
  v27 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v25, *(const void **)v18, *(_QWORD *)(v18 + 8), (uint64_t)(*(_QWORD *)(v18 + 8) - *(_QWORD *)v18) >> 3);
  __p = 0;
  v29 = 0;
  v30 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, *(const void **)(v18 + 24), *(_QWORD *)(v18 + 32), (uint64_t)(*(_QWORD *)(v18 + 32) - *(_QWORD *)(v18 + 24)) >> 2);
  objc_msgSend(v7, "utterance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPParserModel forwardWithSpanLabels:embeddings:utterance:](self, "forwardWithSpanLabels:embeddings:utterance:", &v31, &v25, v19);

  if (__p)
  {
    v29 = __p;
    operator delete(__p);
  }
  if (v25)
  {
    v26 = v25;
    operator delete(v25);
  }
  if (v34)
  {
    v35 = v34;
    operator delete(v34);
  }
  if (v31)
  {
    v32 = v31;
    operator delete(v31);
  }
  -[UPParserModel _resultFromInferenceResult:query:outputTokens:resolver:sharedEntityResolution:](self, "_resultFromInferenceResult:query:outputTokens:resolver:sharedEntityResolution:", buf, v7, objc_msgSend(v8, "outputTokens"), -[UPLoadedModelConfiguration resolver](self->__loadedModelConfiguration, "resolver"), v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = v47;
    operator delete(v47);
  }
  if (v45)
  {
    v46 = v45;
    operator delete(v45);
  }
  if (v43)
  {
    v44 = v43;
    operator delete(v43);
  }
  if (v41)
  {
    v42 = v41;
    operator delete(v41);
  }
  if (v39)
  {
    v40 = v39;
    operator delete(v39);
  }
  if (*(_QWORD *)buf)
  {
    v38 = *(void **)buf;
    operator delete(*(void **)buf);
  }
  SNLPOSLoggerForCategory(7);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v22, OS_SIGNPOST_INTERVAL_END, v10, "UaaP Prediction", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v23, OS_LOG_TYPE_DEFAULT, "END \"UaaP Prediction\", buf, 2u);
  }

  return v20;
}

- (NSLocale)locale
{
  return -[UPLoadedModelConfiguration locale](self->__loadedModelConfiguration, "locale");
}

- (UPPreprocessor)preprocessor
{
  return -[UPLoadedModelConfiguration preprocessor](self->__loadedModelConfiguration, "preprocessor");
}

- (UPModelIdentifier)identifier
{
  return self->_identifier;
}

- (UPUsoSerializer)_usoSerializer
{
  return (UPUsoSerializer *)objc_getProperty(self, a2, 16, 1);
}

- (UPLoadedModelConfiguration)_loadedModelConfiguration
{
  return self->__loadedModelConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loadedModelConfiguration, 0);
  objc_storeStrong((id *)&self->__usoSerializer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (UPParserModel)modelWithLoadedModelConfiguration:(id)a3 error:(id *)a4
{
  id v5;
  UPParserModel *v6;
  UPParserModel *v7;

  v5 = a3;
  v6 = -[UPParserModel initWithLoadedModelConfiguration:]([UPParserModel alloc], "initWithLoadedModelConfiguration:", v5);
  v7 = v6;
  if (a4 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], 0, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
