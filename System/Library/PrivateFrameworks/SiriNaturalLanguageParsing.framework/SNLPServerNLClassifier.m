@implementation SNLPServerNLClassifier

+ (id)classifierWithPathURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void **v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
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
  void *v32;
  void *v33;
  void *__p[2];
  char v35;
  char v36;
  _QWORD v37[3];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v36);

  if (v36)
    v10 = v9;
  else
    v10 = 0;
  if (v10 == 1)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    std::string::basic_string[abi:ne180100]<0>(__p, "config.json");
    if (v35 >= 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    objc_msgSend(v11, "stringWithUTF8String:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35 < 0)
      operator delete(__p[0]);
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("SNLC/SNLC.mlmodelc"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("SNLC/spans_pad.txt"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("SNLC/context_pad.txt"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    std::string::basic_string[abi:ne180100]<0>(__p, "version.yaml");
    if (v35 >= 0)
      v17 = __p;
    else
      v17 = (void **)__p[0];
    objc_msgSend(v16, "stringWithUTF8String:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35 < 0)
      operator delete(__p[0]);
    objc_msgSend(a1, "_classifierWithModelURL:configURL:spanVocabularyURL:contextVocabularyURL:versionURL:error:", v32, v33, v14, v15, v19, a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a4)
    {
      v20 = 0;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("An error occured when attempting to read the SNLC model bundle at: %@"), &stru_1E7BED9E0, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Check that the path contains a valid model bundle: %@"), &stru_1E7BED9E0, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0CB35C8];
    v37[0] = *MEMORY[0x1E0CB2D50];
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", v33, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v15;
    v37[1] = *MEMORY[0x1E0CB2D68];
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", v33, v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v26;
    v37[2] = *MEMORY[0x1E0CB2D80];
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", v32, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("SNLPServerNLClassifierErrorDomain"), 1, v30);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v20 = 0;
  }

LABEL_19:
  return v20;
}

+ (id)_classifierWithModelURL:(id)a3 configURL:(id)a4 spanVocabularyURL:(id)a5 contextVocabularyURL:(id)a6 versionURL:(id)a7 error:(id *)a8
{
  void *v10;
  id v11;
  void *v12;
  SNLPITFMModelInfo *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v20;
  objc_super v21;
  id v22;

  v22 = 0;
  +[SNLPITFMModelBundle bundleWithEspressoModelURL:configURL:contextVocabularyURL:spanVocabularyURL:targetVocabularyURL:versionURL:errorDomain:error:](SNLPITFMModelBundle, "bundleWithEspressoModelURL:configURL:contextVocabularyURL:spanVocabularyURL:targetVocabularyURL:versionURL:errorDomain:error:", a3, a4, a6, a5, 0, a7, CFSTR("SNLPServerNLClassifierErrorDomain"), &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  v12 = v11;
  if (v10)
  {
    v13 = -[SNLPITFMModelInfo initWithType:loggingComponent:errorDomain:]([SNLPITFMModelInfo alloc], "initWithType:loggingComponent:errorDomain:", 1, 1, CFSTR("SNLPServerNLClassifierErrorDomain"));
    v21.receiver = a1;
    v21.super_class = (Class)&OBJC_METACLASS___SNLPServerNLClassifier;
    v14 = objc_msgSendSuper2(&v21, sel_alloc);
    objc_msgSend((id)objc_opt_class(), "_initializationBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v16 = (void *)objc_msgSend(v14, "initWithModelBundle:modelInfo:initializationBlock:error:", v10, v13, v15, &v20);
    v17 = v20;

    if (v16)
    {
      v18 = v16;
    }
    else if (a8)
    {
      *a8 = objc_retainAutorelease(v17);
    }

  }
  else
  {
    v16 = 0;
    if (a8)
      *a8 = objc_retainAutorelease(v11);
  }

  return v16;
}

+ (id)_initializationBlock
{
  return &__block_literal_global_1412;
}

+ (id)_convertSNLCRequest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D9F9D0]);
  objc_msgSend(v3, "embeddings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEmbeddings:", v5);

  objc_msgSend(v3, "matchingSpans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchingSpans:", v6);

  objc_msgSend(v3, "tokenisedUtterance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTokenisedUtterance:", v7);

  objc_msgSend(v3, "requestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestId:", v8);

  objc_msgSend(v3, "nluRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNluRequestId:", v9);

  objc_msgSend(v3, "turnInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTurnInput:", v10);

  return v4;
}

+ (id)_convertITFMResponse:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D9FA40]);
  objc_msgSend(v4, "setClassificationLabel:", objc_msgSend(v3, "classificationLabel"));
  objc_msgSend(v3, "classificationProbability");
  objc_msgSend(v4, "setClassificationProbability:");

  return v4;
}

void __46__SNLPServerNLClassifier__initializationBlock__block_invoke(void *a1@<X1>, void *a2@<X2>, _QWORD *a3@<X8>)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  const std::__fs::filesystem::path *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD *v18;
  void *__p[2];
  char v20;
  void *v21[2];
  char v22;
  void *v23[2];
  char v24;
  _BYTE v25[32];
  void *v26[2];
  char v27;
  _BYTE v28[40];
  char *v29[9];
  _BYTE v30[32];
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  *a3 = 0;
  objc_msgSend(v5, "configURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v26, (char *)objc_msgSend(v8, "UTF8String"));

  objc_msgSend(v5, "versionURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v29[0] = (char *)objc_msgSend(v10, "UTF8String");
  v11 = (const std::__fs::filesystem::path *)std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)v30, v29);
  getAssetDirectoryNCV(v11, (uint64_t)v25);
  if ((v30[23] & 0x80000000) != 0)
    operator delete(*(void **)v30);

  objc_msgSend(v5, "espressoModelURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v23, (char *)objc_msgSend(v13, "UTF8String"));
  objc_msgSend(v5, "spanVocabularyURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v21, (char *)objc_msgSend(v15, "UTF8String"));
  objc_msgSend(v5, "contextVocabularyURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "path");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v17, "UTF8String"));
  v18 = (_QWORD *)operator new();
  +[SNLPAssetVersionChecker loadUInt32ListFromConfigPListResourceName:](SNLPAssetVersionChecker, "loadUInt32ListFromConfigPListResourceName:", CFSTR("SNLCSupportedGenerationList"));
  v31 = xmmword_1C230EF28;
  v32 = unk_1C230EF38;
  v33[0] = xmmword_1C230EF48;
  *(_OWORD *)((char *)v33 + 12) = *(__int128 *)((char *)&xmmword_1C230EF48 + 12);
  *(_OWORD *)v30 = xmmword_1C230EF08;
  *(_OWORD *)&v30[16] = unk_1C230EF18;
  std::unordered_set<unsigned int>::unordered_set((uint64_t)v28, (unsigned int *)v30, 23);
  itfm_inference_orchestrator::orchestration::ITFMOrchestrator::ITFMOrchestrator((uint64_t)v18, (char *)v23, (char *)v26, (uint64_t)v21, (uint64_t)__p, (const sirinluinternalsnlp_intermediate::SNLPAssetVersion *)v25, (uint64_t)v29, (uint64_t)v28, &snlc_inference_orchestrator::orchestration::SNLCOrchestrator::kLoggingComponent);
  *v18 = &off_1E7BE9A88;
  *a3 = v18;
  if (v20 < 0)
    operator delete(__p[0]);

  if (v22 < 0)
    operator delete(v21[0]);

  if (v24 < 0)
    operator delete(v23[0]);

  MEMORY[0x1C3BB8674](v25);
  if (v27 < 0)
    operator delete(v26[0]);

}

- (id)responseForRequest:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SNLPServerNLClassifier;
  -[SNLPITFMClassifier responseForRequest:error:](&v5, sel_responseForRequest_error_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)inferenceResponseForRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_convertSNLCRequest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNLPServerNLClassifier responseForRequest:error:](self, "responseForRequest:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "_convertITFMResponse:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)inferenceResponseForRequest:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  -[SNLPServerNLClassifier inferenceResponseForRequest:error:](self, "inferenceResponseForRequest:error:", a3, &v9);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (!v3)
  {
    SNLPOSLoggerForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v11 = "SNLC";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1C2196000, v5, OS_LOG_TYPE_ERROR, "[%s] Encountered error in deprecated version of inferenceResponseForRequest: %@ (returning SERVER parser response)", buf, 0x16u);

    }
    v3 = objc_alloc_init(MEMORY[0x1E0D9FA40]);
    objc_msgSend(v3, "setClassificationLabel:", 0);
    LODWORD(v7) = 1.0;
    objc_msgSend(v3, "setClassificationProbability:", v7);
  }

  return v3;
}

@end
