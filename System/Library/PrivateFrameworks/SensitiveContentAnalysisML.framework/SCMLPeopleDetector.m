@implementation SCMLPeopleDetector

- (SCMLPeopleDetector)init
{
  SCMLPeopleDetectorConfiguration *v3;
  SCMLPeopleDetector *v4;

  v3 = -[SCMLPeopleDetectorConfiguration initWithModelManagerServicesUseCaseID:]([SCMLPeopleDetectorConfiguration alloc], "initWithModelManagerServicesUseCaseID:", CFSTR("Safety.unspecified"));
  v4 = -[SCMLPeopleDetector initWithConfiguration:error:](self, "initWithConfiguration:error:", v3, 0);

  return v4;
}

- (SCMLPeopleDetector)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  NSString *v23;
  scml::MultiwordGazetteer *v24;
  _TtC26SensitiveContentAnalysisML28SCMLVisualGenerationHandling *v25;
  int v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  NSObject *v31;
  SCMLPeopleDetector *v32;
  void *exception;
  scml *v35;
  void *v36;
  id v37;
  _QWORD v38[3];
  objc_super v39;
  uint8_t buf[4];
  SCMLPeopleDetector *v41;
  __int16 v42;
  void *v43;
  _QWORD v44[3];
  _QWORD *v45;
  id v46;
  os_signpost_id_t v47;
  _QWORD v48[5];

  v48[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  scml::SignpostInterval::SignpostInterval((scml::SignpostInterval *)&v46);
  v6 = v46;
  v7 = v6;
  v8 = v47;
  if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SCMLPeopleDetector.init", ", buf, 2u);
  }

  v44[0] = &off_2516E3BA0;
  v44[1] = &v46;
  v45 = v44;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v48, (uint64_t)v44);
  v9 = v45;
  if (v45 == v44)
  {
    v10 = 4;
    v9 = v44;
  }
  else
  {
    if (!v45)
      goto LABEL_9;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_9:
  +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v41 = self;
    v42 = 2112;
    v43 = v13;
    _os_log_impl(&dword_245BFA000, v11, OS_LOG_TYPE_DEFAULT, "Begin SCMLPeopleDetector init inst=%p loc=%@", buf, 0x16u);

  }
  v39.receiver = self;
  v39.super_class = (Class)SCMLPeopleDetector;
  v14 = -[SCMLPeopleDetector init](&v39, sel_init);
  if (v14)
  {
    objc_msgSend(v5, "locale");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v14 + 3);
    *((_QWORD *)v14 + 3) = v15;

    v17 = (void *)*((_QWORD *)v14 + 3);
    if (!v17
      || (objc_msgSend(v17, "languageCode"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v18, "lowercaseString"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("en")),
          v19,
          v18,
          (v20 & 1) == 0))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      objc_msgSend(*((id *)v14 + 3), "localeIdentifier");
      v35 = (scml *)objc_claimAutoreleasedReturnValue();
      scml::strFromNSString(v35, v38);
      scml::strCat<char const(&)[38],std::string>("Unsupported locale: ", (uint64_t)v38, buf);
      MEMORY[0x249544C64](exception, buf);
      __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    scml::strToNSString((uint64_t)"person_overrides", 16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pathForResource:ofType:", v22, CFSTR("gaze"));
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();

    v24 = (scml::MultiwordGazetteer *)operator new();
    scml::MultiwordGazetteer::MultiwordGazetteer(v24, *((NSLocale **)v14 + 3), v23, 5uLL);
    std::unique_ptr<scml::MultiwordGazetteer>::reset[abi:ne180100]((scml::MultiwordGazetteer **)v14 + 2, v24);

    v25 = [_TtC26SensitiveContentAnalysisML28SCMLVisualGenerationHandling alloc];
    v26 = objc_msgSend(v5, "onBehalfOfProcessID");
    objc_msgSend(v5, "modelManagerServicesUseCaseID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v28 = -[SCMLVisualGenerationHandling initOnBehalfOf:modelManagerServicesUseCaseID:error:](v25, "initOnBehalfOf:modelManagerServicesUseCaseID:error:", v26, v27, &v37);
    v29 = v37;
    v30 = (void *)*((_QWORD *)v14 + 1);
    *((_QWORD *)v14 + 1) = v28;

    if (!*((_QWORD *)v14 + 1))
    {
      v36 = __cxa_allocate_exception(0x10uLL);
      scml::makeException("Failed to load people detection model", 0x25uLL, v29, (uint64_t)v36);
      __cxa_throw(v36, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
    }
    +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_245BFA000, v31, OS_LOG_TYPE_DEFAULT, "End SCMLPeopleDetector init", buf, 2u);
    }

  }
  v32 = (SCMLPeopleDetector *)v14;
  scml::SignpostInterval::~SignpostInterval((scml::SignpostInterval *)&v46);

  return v32;
}

- (void)detectPeopleAsynchronously:(id)a3 completionHandler:(id)a4
{
  id v6;
  scml::SignpostInterval *v7;
  scml::SignpostInterval *Async;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  scml *v13;
  NSString *v14;
  void *v15;
  id v16;
  scml::SignpostInterval *v17;
  void *v18;
  _QWORD aBlock[4];
  id v20;
  scml::SignpostInterval *v21;
  scml::SignpostInterval *v22;
  uint8_t buf[4];
  SCMLPeopleDetector *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (scml::SignpostInterval *)a4;
  Async = scml::SignpostInterval::createAsync(v7);
  v9 = *(id *)Async;
  v10 = v9;
  v11 = *((_QWORD *)Async + 1);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SCMLPeopleDetector.detectPeople", ", buf, 2u);
  }

  +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "string");
    v13 = (scml *)objc_claimAutoreleasedReturnValue();
    scml::strEscape(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218243;
    v24 = self;
    v25 = 2117;
    v26 = v15;
    _os_log_impl(&dword_245BFA000, v12, OS_LOG_TYPE_DEFAULT, "Begin detectPeople: inst=%p %{sensitive}@", buf, 0x16u);

  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__SCMLPeopleDetector_detectPeopleAsynchronously_completionHandler___block_invoke;
  aBlock[3] = &unk_2516E48B8;
  v16 = v6;
  v20 = v16;
  v22 = Async;
  v17 = v7;
  v21 = v17;
  v18 = _Block_copy(aBlock);
  -[SCMLPeopleDetector _detectPeopleAsynchronously:completionHandler:](self, "_detectPeopleAsynchronously:completionHandler:", v16, v18);

}

void __67__SCMLPeopleDetector_detectPeopleAsynchronously_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  scml *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  scml::SignpostInterval *v20;
  _QWORD v21[3];
  _QWORD *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "spans");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      objc_msgSend(*(id *)(a1 + 32), "string");
      v10 = (scml *)objc_claimAutoreleasedReturnValue();
      scml::strEscape(v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134283779;
      v24 = v9;
      v25 = 2117;
      v26 = v12;
      _os_log_impl(&dword_245BFA000, v7, OS_LOG_TYPE_DEFAULT, "End detectPeople spans=%{private}lu %{sensitive}@", buf, 0x16u);

    }
  }
  else
  {
    +[SCMLLog textAnalyzer](SCMLLog, "textAnalyzer");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __67__SCMLPeopleDetector_detectPeopleAsynchronously_completionHandler___block_invoke_cold_1((uint64_t)v6, v7, v13);
  }

  v14 = **(id **)(a1 + 48);
  v15 = v14;
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245BFA000, v15, OS_SIGNPOST_INTERVAL_END, v16, "SCMLPeopleDetector.detectPeople", ", buf, 2u);
  }

  v17 = *(_QWORD *)(a1 + 48);
  v21[0] = &off_2516E4178;
  v22 = v21;
  std::__function::__value_func<void ()(void)>::operator=[abi:ne180100]((_QWORD *)(v17 + 16), (uint64_t)v21);
  v18 = v22;
  if (v22 == v21)
  {
    v19 = 4;
    v18 = v21;
  }
  else
  {
    if (!v22)
      goto LABEL_14;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_14:
  v20 = *(scml::SignpostInterval **)(a1 + 48);
  if (v20)
  {
    scml::SignpostInterval::~SignpostInterval(v20);
    MEMORY[0x249544F58]();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_detectPeopleAsynchronously:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  MultiwordGazetteer *value;
  _TtC26SensitiveContentAnalysisML28SCMLVisualGenerationHandling *handler;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  MultiwordGazetteer *v16;

  v6 = a3;
  v7 = a4;
  handler = self->_handler;
  value = self->_personOverrides.__ptr_.__value_;
  objc_msgSend(v6, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__SCMLPeopleDetector__detectPeopleAsynchronously_completionHandler___block_invoke;
  v13[3] = &unk_2516E48E0;
  v16 = value;
  v11 = v6;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  -[SCMLVisualGenerationHandling predictWithText:completionHandler:](handler, "predictWithText:completionHandler:", v10, v13);

}

void __68__SCMLPeopleDetector__detectPeopleAsynchronously_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char v7;
  void *v8;
  scml::_anonymous_namespace_ *v9;
  NSString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SCMLPeopleDetectionSpan *v18;
  void *v19;
  void *v20;
  void *v21;
  scml::_anonymous_namespace_ *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSString *v29;
  uint64_t AttributeSpan;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id obj;
  uint64_t v47;
  scml::MultiwordGazetteer::Impl **v48;
  uint64_t v49;
  SCMLPeopleDetectionSpan *v50;
  SCMLPeopleDetection *v51;
  uint64_t i;
  void *v53;
  NSUInteger v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t *v65;
  uint64_t *v66;
  uint64_t v67;
  _NSRange v68;

  v67 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v40 = v6;
  v41 = v5;
  v39 = a1;
  if (!v5)
  {
    v37 = *(_QWORD *)(a1 + 40);
    scml::error(0x13u, (uint64_t)"Failed to query VisualGenerationHandling", 40, v6);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v37 + 16))(v37, 0, v38);

    goto LABEL_44;
  }
  v48 = *(scml::MultiwordGazetteer::Impl ***)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "string");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v44 = v5;
  v51 = objc_alloc_init(SCMLPeopleDetection);
  v43 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v44, "people");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (!v49)
    goto LABEL_42;
  v7 = 0;
  v47 = *(_QWORD *)v57;
  do
  {
    for (i = 0; i != v49; ++i)
    {
      if (*(_QWORD *)v57 != v47)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
      if (!scml::MultiwordGazetteer::hasGazetteerMatch(v48, (NSString *)v8))
      {
        v9 = (scml::_anonymous_namespace_ *)v45;
        v10 = v8;
        if (-[NSString length](v10, "length"))
        {
          if (v65 != v66)
          {
            v11 = v65[1];
            v55 = *v65;
            goto LABEL_13;
          }
          v11 = 0;
          v54 = 0;
          v55 = 0x7FFFFFFFFFFFFFFFLL;
          if (v65)
          {
LABEL_13:
            v66 = v65;
            operator delete(v65);
            v54 = v11;
          }
        }
        else
        {
          v54 = 0;
          v55 = 0;
        }

        if (v55 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v44, "people");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v10);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v7 & 1) != 0)
            v13 = 1;
          else
            v13 = objc_msgSend(v53, "isGroup");
          -[SCMLPeopleDetection setHasMultiplePeople:](v51, "setHasMultiplePeople:", v13);
          if (-[SCMLPeopleDetection hasGenericPeople](v51, "hasGenericPeople"))
            v14 = 1;
          else
            v14 = objc_msgSend(v53, "specific") ^ 1;
          -[SCMLPeopleDetection setHasGenericPeople:](v51, "setHasGenericPeople:", v14);
          if (-[SCMLPeopleDetection hasGender](v51, "hasGender"))
            v15 = 1;
          else
            v15 = objc_msgSend(v53, "hasGender");
          -[SCMLPeopleDetection setHasGender:](v51, "setHasGender:", v15);
          if (-[SCMLPeopleDetection hasEthnicity](v51, "hasEthnicity"))
            v16 = 1;
          else
            v16 = objc_msgSend(v53, "hasEthnicity");
          -[SCMLPeopleDetection setHasEthnicity:](v51, "setHasEthnicity:", v16);
          if (-[SCMLPeopleDetection hasAge](v51, "hasAge"))
            v17 = 1;
          else
            v17 = objc_msgSend(v53, "hasAge");
          -[SCMLPeopleDetection setHasAge:](v51, "setHasAge:", v17);
          v18 = objc_alloc_init(SCMLPeopleDetectionSpan);
          -[SCMLPeopleDetectionSpan setRange:](v18, "setRange:", v55, v54);
          -[SCMLPeopleDetectionSpan setIsGeneric:](v18, "setIsGeneric:", objc_msgSend(v53, "specific") ^ 1);
          -[SCMLPeopleDetectionSpan setIsGroup:](v18, "setIsGroup:", objc_msgSend(v53, "isGroup"));
          -[SCMLPeopleDetectionSpan setHasAge:](v18, "setHasAge:", objc_msgSend(v53, "hasAge"));
          -[SCMLPeopleDetectionSpan setHasGender:](v18, "setHasGender:", objc_msgSend(v53, "hasGender"));
          -[SCMLPeopleDetectionSpan setHasEthnicity:](v18, "setHasEthnicity:", objc_msgSend(v53, "hasEthnicity"));
          objc_msgSend(v53, "age");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCMLPeopleDetectionSpan setAgeSpans:](v18, "setAgeSpans:", v20);

          objc_msgSend(v53, "gender");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v9;
          v42 = v21;
          v23 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v24 = v42;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v60, &v65, 16);
          if (v25)
          {
            v26 = *(_QWORD *)v61;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v61 != v26)
                  objc_enumerationMutation(v24);
                v28 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
                objc_msgSend(v28, "term");
                v29 = (NSString *)objc_claimAutoreleasedReturnValue();
                v68.location = v54;
                v32 = v31;

                if (AttributeSpan != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v33 = (void *)objc_opt_new();
                  objc_msgSend(v33, "setRange:", AttributeSpan, v32);
                  objc_msgSend(v33, "setGender:", objc_msgSend(v28, "gender"));
                  objc_msgSend(v23, "addObject:", v33);

                }
              }
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v60, &v65, 16);
            }
            while (v25);
          }

          -[SCMLPeopleDetectionSpan setGenderSpans:](v50, "setGenderSpans:", v23);
          objc_msgSend(v53, "ethnicity");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCMLPeopleDetectionSpan setEthnicitySpans:](v50, "setEthnicitySpans:", v35);

          -[SCMLPeopleDetectionSpan setHasImplicitCategoryRequiringPersonalization:](v50, "setHasImplicitCategoryRequiringPersonalization:", objc_msgSend(v53, "hasImplicitCategoryRequiringPersonalization"));
          objc_msgSend(v43, "addObject:", v50);

          v7 = 1;
        }
        continue;
      }
    }
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  }
  while (v49);
LABEL_42:

  objc_msgSend(v43, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCMLPeopleDetection setSpans:](v51, "setSpans:", v36);

  (*(void (**)(void))(*(_QWORD *)(v39 + 40) + 16))();
LABEL_44:

}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  std::unique_ptr<scml::MultiwordGazetteer>::reset[abi:ne180100]((scml::MultiwordGazetteer **)&self->_personOverrides, 0);
  objc_storeStrong((id *)&self->_handler, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)initWithConfiguration:error:
{
}

- (_QWORD)initWithConfiguration:error:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_2516E3BA0;
  result[1] = v3;
  return result;
}

- (uint64_t)initWithConfiguration:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (id)detectPeople:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  dispatch_semaphore_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__SCMLPeopleDetector_Test__detectPeople_error___block_invoke;
  v11[3] = &unk_2516E4950;
  v13 = &v21;
  v14 = &v15;
  v12 = v7;
  v8 = v7;
  -[SCMLPeopleDetector detectPeopleAsynchronously:completionHandler:](self, "detectPeopleAsynchronously:completionHandler:", v6, v11);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __47__SCMLPeopleDetector_Test__detectPeople_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)initWithConfiguration:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v5 = 136315138;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_245BFA000, a2, v4, "End SCMLPeopleDetector init with error: %s", (uint8_t *)&v5);
}

void __67__SCMLPeopleDetector_detectPeopleAsynchronously_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_245BFA000, a2, a3, "End detectPeople with error: %@", (uint8_t *)&v3);
}

@end
