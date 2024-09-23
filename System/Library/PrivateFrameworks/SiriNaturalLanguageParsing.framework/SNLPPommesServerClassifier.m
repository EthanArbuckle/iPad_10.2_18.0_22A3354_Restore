@implementation SNLPPommesServerClassifier

- (id)responseForRequest:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  float v12;
  float v13;
  float v14;
  NSObject *v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)SNLPPommesServerClassifier;
  -[SNLPITFMClassifier responseForRequest:error:](&v25, sel_responseForRequest_error_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "hypotheses", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v36, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v11, "label") == 1)
          {
            objc_msgSend(v11, "probability");
            v13 = v12;
            -[SNLPPommesServerClassifier confidenceThreshold](self, "confidenceThreshold");
            if (v13 < v14)
            {
              SNLPOSLoggerForCategory(2);
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v11, "stringLabel");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "probability");
                v18 = v17;
                -[SNLPPommesServerClassifier confidenceThreshold](self, "confidenceThreshold");
                *(_DWORD *)buf = 136316162;
                v27 = "PSC";
                v28 = 2080;
                v29 = "[insights-snlp-psc]: ";
                v30 = 2112;
                v31 = v16;
                v32 = 2048;
                v33 = v18;
                v34 = 2048;
                v35 = v19;
                _os_log_impl(&dword_1C2196000, v15, OS_LOG_TYPE_DEBUG, "[%s] %sPSC %@ probability (%1.2f) is below the 'confidence_threshold: (%1.2f)', setting to -0.0", buf, 0x34u);

              }
              objc_msgSend(v11, "setProbability:", COERCE_DOUBLE(0x8000000080000000));
              objc_msgSend(v6, "setClassificationProbability:", COERCE_DOUBLE(0x8000000080000000));
            }
            goto LABEL_15;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v36, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_15:

  }
  return v6;
}

- (float)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setConfidenceThreshold:(float)a3
{
  self->_confidenceThreshold = a3;
}

+ (id)classifierWithPathURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  _BYTE *v11;
  void *v12;
  void *v13;
  void *v14;
  _BYTE *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  SNLPITFMModelInfo *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  NSObject *v33;
  float v34;
  int v35;
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
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  char v61;
  _QWORD v62[3];
  _QWORD v63[3];
  _BYTE buf[12];
  __int16 v65;
  double v66;
  char v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v61 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v58, "fileExistsAtPath:isDirectory:", v7, &v61);

  if (v61)
    v9 = v8;
  else
    v9 = 0;
  if (v9 != 1)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("An error occured when attempting to read the LVC model bundle at: %@"), &stru_1E7BED9E0, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Check that the path contains a valid model bundle: %@"), &stru_1E7BED9E0, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x1E0CB35C8];
      v62[0] = *MEMORY[0x1E0CB2D50];
      v39 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "path");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", v57, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v41;
      v62[1] = *MEMORY[0x1E0CB2D68];
      v42 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "path");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", v57, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v44;
      v62[2] = *MEMORY[0x1E0CB2D80];
      v45 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "path");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringWithFormat:", v55, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v63[2] = v47;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("SNLPPommesServerClassifierErrorDomain"), 1, v48);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v24 = 0;
    goto LABEL_36;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  std::string::basic_string[abi:ne180100]<0>(buf, "config.json");
  if (v67 >= 0)
    v11 = buf;
  else
    v11 = *(_BYTE **)buf;
  objc_msgSend(v10, "stringWithUTF8String:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v12);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67 < 0)
    operator delete(*(void **)buf);
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("PSC/PSC.mlmodelc"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("PSC/spans_pad.txt"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("PSC/context_pad.txt"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("PSC/targets.txt"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  std::string::basic_string[abi:ne180100]<0>(buf, "version.yaml");
  if (v67 >= 0)
    v15 = buf;
  else
    v15 = *(_BYTE **)buf;
  objc_msgSend(v14, "stringWithUTF8String:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67 < 0)
    operator delete(*(void **)buf);
  objc_msgSend(v13, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v58, "isReadableFileAtPath:", v18);

  if ((v19 & 1) == 0)
  {

    v13 = 0;
  }
  v60 = 0;
  +[SNLPITFMModelBundle bundleWithEspressoModelURL:configURL:contextVocabularyURL:spanVocabularyURL:targetVocabularyURL:versionURL:errorDomain:error:](SNLPITFMModelBundle, "bundleWithEspressoModelURL:configURL:contextVocabularyURL:spanVocabularyURL:targetVocabularyURL:versionURL:errorDomain:error:", v52, v56, v54, v53, v13, v17, CFSTR("SNLPPommesServerClassifierErrorDomain"), &v60);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v60;
  if (v20)
  {
    v21 = -[SNLPITFMModelInfo initWithType:loggingComponent:errorDomain:]([SNLPITFMModelInfo alloc], "initWithType:loggingComponent:errorDomain:", 2, 4, CFSTR("SNLPPommesServerClassifierErrorDomain"));
    v22 = objc_alloc((Class)a1);
    objc_msgSend(a1, "_initializationBlock");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v24 = (id)objc_msgSend(v22, "initWithModelBundle:modelInfo:initializationBlock:error:", v20, v21, v23, &v59);
    v25 = v59;

    if (v24)
    {
      v26 = (void *)MEMORY[0x1E0CB36D8];
      v27 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v20, "configURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dataWithContentsOfURL:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "JSONObjectWithData:options:error:", v29, 0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "objectForKey:", CFSTR("confidence_threshold"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "floatValue");
      objc_msgSend(v24, "setConfidenceThreshold:");

      objc_msgSend(v24, "confidenceThreshold");
      if (v32 > 0.0)
      {
        SNLPOSLoggerForCategory(2);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v24, "confidenceThreshold");
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "PSC";
          v65 = 2048;
          v66 = v34;
          _os_log_impl(&dword_1C2196000, v33, OS_LOG_TYPE_DEBUG, "[%s] Loaded config confidence_threshold: %1.2f", buf, 0x16u);
        }

      }
      v35 = 0;
    }
    else
    {
      if (a4)
        *a4 = objc_retainAutorelease(v25);
      v35 = 1;
    }

  }
  else
  {
    v24 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v51);
    v35 = 1;
  }

  if (!v35)
  {
LABEL_36:
    v24 = v24;
    v49 = v24;
    goto LABEL_37;
  }
  v49 = 0;
LABEL_37:

  return v49;
}

+ (id)_initializationBlock
{
  return &__block_literal_global_1701;
}

void __50__SNLPPommesServerClassifier__initializationBlock__block_invoke(void *a1@<X1>, void *a2@<X2>, uint64_t *a3@<X8>)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  const std::__fs::filesystem::path *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t *v39;
  id v40;
  void *v41[2];
  char v42;
  void *__p[2];
  char v44;
  void *v45[2];
  char v46;
  void *v47[2];
  char v48;
  void *v49[2];
  char v50;
  _BYTE v51[32];
  void *v52;
  char v53;
  _BYTE v54[40];
  char *v55[9];
  _BYTE v56[32];
  __int128 v57;
  __int128 v58;
  _OWORD v59[2];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v39 = a3;
  v40 = a2;
  *a3 = 0;
  objc_msgSend(v5, "configURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v52, (char *)objc_msgSend(v7, "UTF8String"));

  objc_msgSend(v5, "versionURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v55[0] = (char *)objc_msgSend(v9, "UTF8String");
  v10 = (const std::__fs::filesystem::path *)std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)v56, v55);
  getAssetDirectoryNCV(v10, (uint64_t)v51);
  if ((v56[23] & 0x80000000) != 0)
    operator delete(*(void **)v56);

  objc_msgSend(v5, "targetVocabularyURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    objc_msgSend(v5, "espressoModelURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "path");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v49, (char *)objc_msgSend(v28, "UTF8String"));
    objc_msgSend(v5, "configURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "path");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v47, (char *)objc_msgSend(v30, "UTF8String"));
    objc_msgSend(v5, "spanVocabularyURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "path");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v45, (char *)objc_msgSend(v32, "UTF8String"));
    objc_msgSend(v5, "contextVocabularyURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "path");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v34, "UTF8String"));
    v35 = operator new();
    +[SNLPAssetVersionChecker loadUInt32ListFromConfigPListResourceName:](SNLPAssetVersionChecker, "loadUInt32ListFromConfigPListResourceName:", CFSTR("PSCSupportedGenerationList"));
    v57 = xmmword_1C230EF28;
    v58 = unk_1C230EF38;
    v59[0] = xmmword_1C230EF48;
    *(_OWORD *)((char *)v59 + 12) = *(__int128 *)((char *)&xmmword_1C230EF48 + 12);
    *(_OWORD *)v56 = xmmword_1C230EF08;
    *(_OWORD *)&v56[16] = unk_1C230EF18;
    std::unordered_set<unsigned int>::unordered_set((uint64_t)v54, (unsigned int *)v56, 23);
    itfm_inference_orchestrator::orchestration::ITFMOrchestrator::ITFMOrchestrator(v35, (char *)v49, (char *)v47, (uint64_t)v45, (uint64_t)__p, (const sirinluinternalsnlp_intermediate::SNLPAssetVersion *)v51, (uint64_t)v55, (uint64_t)v54, &psc_inference_orchestrator::orchestration::PSCOrchestrator::kLoggingComponent);
    *(_QWORD *)v35 = &off_1E7BE94C8;
    *(_OWORD *)(v35 + 1664) = 0u;
    *v39 = v35;
    if (v44 < 0)
      operator delete(__p[0]);

    if (v46 < 0)
      operator delete(v45[0]);

    if (v48 < 0)
      operator delete(v47[0]);

    if (v50 < 0)
      operator delete(v49[0]);

  }
  else
  {
    objc_msgSend(v5, "espressoModelURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "path");
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v49, (char *)objc_msgSend(v37, "UTF8String"));
    objc_msgSend(v5, "configURL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "path");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v47, (char *)objc_msgSend(v13, "UTF8String"));
    objc_msgSend(v5, "spanVocabularyURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v45, (char *)objc_msgSend(v15, "UTF8String"));
    objc_msgSend(v5, "contextVocabularyURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v17, "UTF8String"));
    objc_msgSend(v5, "targetVocabularyURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v41, (char *)objc_msgSend(v19, "UTF8String"));
    v20 = (_QWORD *)operator new();
    +[SNLPAssetVersionChecker loadUInt32ListFromConfigPListResourceName:](SNLPAssetVersionChecker, "loadUInt32ListFromConfigPListResourceName:", CFSTR("PSCSupportedGenerationList"));
    v57 = xmmword_1C230EF28;
    v58 = unk_1C230EF38;
    v59[0] = xmmword_1C230EF48;
    *(_OWORD *)((char *)v59 + 12) = *(__int128 *)((char *)&xmmword_1C230EF48 + 12);
    *(_OWORD *)v56 = xmmword_1C230EF08;
    *(_OWORD *)&v56[16] = unk_1C230EF18;
    std::unordered_set<unsigned int>::unordered_set((uint64_t)v54, (unsigned int *)v56, 23);
    itfm_inference_orchestrator::orchestration::ITFMOrchestrator::ITFMOrchestrator((uint64_t)v20, (char *)v49, (char *)v47, (uint64_t)v45, (uint64_t)__p, (uint64_t)v41, (const sirinluinternalsnlp_intermediate::SNLPAssetVersion *)v51, (uint64_t)v55, (uint64_t)v54, &psc_inference_orchestrator::orchestration::PSCOrchestrator::kLoggingComponent);
    *v20 = &off_1E7BE94C8;
    v21 = v20[1];
    v22 = (std::__shared_weak_count *)v20[2];
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v24 = __ldxr(p_shared_owners);
      while (__stxr(v24 + 1, p_shared_owners));
      v20[208] = v21;
      v20[209] = v22;
      do
        v25 = __ldxr(p_shared_owners);
      while (__stxr(v25 + 1, p_shared_owners));
      do
        v26 = __ldaxr(p_shared_owners);
      while (__stlxr(v26 - 1, p_shared_owners));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    else
    {
      v20[208] = v21;
      v20[209] = 0;
    }
    *v39 = (uint64_t)v20;
    if (v42 < 0)
      operator delete(v41[0]);

    if (v44 < 0)
      operator delete(__p[0]);

    if (v46 < 0)
      operator delete(v45[0]);

    if (v48 < 0)
      operator delete(v47[0]);

    if (v50 < 0)
      operator delete(v49[0]);

  }
  MEMORY[0x1C3BB8674](v51);
  if (v53 < 0)
    operator delete(v52);

}

@end
