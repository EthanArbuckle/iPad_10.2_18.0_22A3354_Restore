@implementation SiriNLUTypesUsoGraphConverter

+ (id)convertUsoGraph:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  siri::ontology *v14;
  uint64_t *SharedUsoVocabManager;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t v20;
  id v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  std::ios_base *v30;
  uint64_t v31;
  void *v32;
  void *p_p;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  void *v42;
  void *__p;
  char v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  uint64_t v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  _OWORD buf[4];
  __int128 v51;
  __int128 v52;
  int v53;
  _QWORD v54[22];

  v54[19] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DA2DE8]);
    objc_msgSend(v4, "nodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertUsoNodes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "edges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertUsoEdges:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertUsoEntityIdentifiers:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alignments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertUtteranceAlignments:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v5, "initWithNodes:edges:identifiers:alignments:", v7, v9, v11, v13);

    SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager(v14);
    v16 = *SharedUsoVocabManager;
    v17 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
    v48 = *SharedUsoVocabManager;
    v49 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v19 = __ldxr(p_shared_owners);
      while (__stxr(v19 + 1, p_shared_owners));
      v46 = v17;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
    }
    else
    {
      v46 = 0;
    }
    v45 = v16;
    if (v42)
      objc_msgSend(v42, "toCppUsoGraph:withError:", &v45, 0);
    else
      v47 = 0;
    v22 = v46;
    if (v46)
    {
      v23 = (unint64_t *)&v46->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    if (v47)
    {
      v25 = MEMORY[0x1E0DE4FE0];
      v26 = MEMORY[0x1E0DE4FE0] + 64;
      v27 = (_QWORD *)MEMORY[0x1E0DE4F60];
      v28 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
      v29 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
      v54[0] = MEMORY[0x1E0DE4FE0] + 64;
      *(_QWORD *)&buf[0] = v28;
      *(_QWORD *)((char *)buf + *(_QWORD *)(v28 - 24)) = v29;
      v30 = (std::ios_base *)((char *)buf + *(_QWORD *)(*(_QWORD *)&buf[0] - 24));
      std::ios_base::init(v30, (char *)buf + 8);
      v30[1].__vftable = 0;
      v30[1].__fmtflags_ = -1;
      *(_QWORD *)&buf[0] = v25 + 24;
      v54[0] = v26;
      std::streambuf::basic_streambuf();
      v31 = MEMORY[0x1E0DE4FB8];
      *((_QWORD *)&buf[0] + 1) = MEMORY[0x1E0DE4FB8] + 16;
      v51 = 0u;
      v52 = 0u;
      v53 = 16;
      siri::ontology::UsoGraph::prettyPrint();
      v32 = (void *)MEMORY[0x1E0CB3940];
      std::stringbuf::str();
      if (v44 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      objc_msgSend(v32, "stringWithUTF8String:", p_p);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setPrintedForm:", v34);

      if (v44 < 0)
        operator delete(__p);
      *(_QWORD *)&buf[0] = *v27;
      *(_QWORD *)((char *)buf + *(_QWORD *)(*(_QWORD *)&buf[0] - 24)) = v27[3];
      *((_QWORD *)&buf[0] + 1) = v31 + 16;
      if (SBYTE7(v52) < 0)
        operator delete((void *)v51);
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x1C3BB71AC](v54);
    }
    else
    {
      loggerContext(1);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf[0]) = 136315138;
        *(_QWORD *)((char *)buf + 4) = "+[SiriNLUTypesUsoGraphConverter convertUsoGraph:]";
        _os_log_impl(&dword_1C1D3C000, v35, OS_LOG_TYPE_INFO, "%s [WARN]: unable to convert serialized graph to cpp graph and get printed form", (uint8_t *)buf, 0xCu);
      }

    }
    v21 = v42;
    v36 = v47;
    v47 = 0;
    if (v36)
    {
      v37 = MEMORY[0x1C3BB7050]();
      MEMORY[0x1C3BB720C](v37, 0x10A0C403D23BABBLL);
    }
    v38 = v49;
    if (v49)
    {
      v39 = (unint64_t *)&v49->__shared_owners_;
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)convertUsoGraphs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertUsoGraph:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v5;
}

+ (id)convertUtteranceAlignment:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DA2E08]);
    v6 = objc_msgSend(v4, "nodeIndex");
    v7 = objc_msgSend(v4, "asrHypothesisIndex");
    objc_msgSend(v4, "spans");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertUtteranceSpans:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithNodeIndex:asrHypothesisIndex:spans:", v6, v7, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)convertUtteranceAlignments:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertUtteranceAlignment:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v5;
}

+ (id)convertUtteranceSpan:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA2E10]), "initWithStartIndex:endIndex:startUnicodeScalarIndex:endUnicodeScalarIndex:startMilliSeconds:endMilliSeconds:", objc_msgSend(v3, "startIndex"), objc_msgSend(v3, "endIndex"), objc_msgSend(v3, "startUnicodeScalarIndex"), objc_msgSend(v3, "endUnicodeScalarIndex"), objc_msgSend(v3, "startMilliSeconds"), objc_msgSend(v3, "endMilliSeconds"));
  else
    v4 = 0;

  return v4;
}

+ (id)convertUtteranceSpans:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertUtteranceSpan:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v5;
}

+ (id)convertUsoEdge:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DA2DF0]);
    objc_msgSend(v3, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "usoElementId");
    v7 = objc_msgSend(v3, "fromIndex");
    v8 = objc_msgSend(v3, "toIndex");
    objc_msgSend(v3, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v4, "initWithUsoElementId:fromVertex:toVertex:enumeration:", v6, v7, v8, objc_msgSend(v9, "enumeration"));

    objc_msgSend(v3, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "baseEdgeLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEdgeLabel:", v13);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)convertUsoEdges:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertUsoEdge:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v5;
}

+ (id)convertUsoEntityIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "hasProbability"))
    {
      v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
      objc_msgSend(v4, "probability");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "value");
      v18 = (void *)objc_msgSend(v5, "initWithDouble:");

    }
    else
    {
      v18 = 0;
    }
    if (objc_msgSend(v4, "hasSourceComponent"))
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", objc_msgSend(v4, "sourceComponent"));
    else
      v8 = 0;
    if (objc_msgSend(v4, "hasGroupIndex"))
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", objc_msgSend(v4, "groupIndex"));
    else
      v9 = 0;
    if (objc_msgSend(v4, "hasInterpretationGroup"))
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", objc_msgSend(v4, "interpretationGroup"));
    else
      v10 = 0;
    v11 = objc_alloc(MEMORY[0x1E0DA2E00]);
    v12 = objc_msgSend(v4, "nodeIndex");
    objc_msgSend(v4, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backingAppBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "namespaceA");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v11, "initWithNodeIndex:value:appBundleId:namespaceString:probability:sourceComponent:groupIndex:interpretationGroup:", v12, v13, v14, v16, v18, v8, v9, v10);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertUsoEntityIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertUsoEntityIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v5;
}

+ (id)convertUsoNode:(id)a3
{
  id v3;
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

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA2DF8]), "initWithUsoElementId:", objc_msgSend(v3, "usoElementId"));
    if (objc_msgSend(v3, "hasUsoVerbElementId"))
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "usoVerbElementId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setUsoVerbId:", v7);

    }
    if (objc_msgSend(v3, "hasIntegerPayload"))
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "integerPayload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "value"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setIntegerPayload:", v10);

    }
    if (objc_msgSend(v3, "hasStringPayload"))
    {
      objc_msgSend(v3, "stringPayload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setStringPayload:", v12);

    }
    objc_msgSend(v3, "normalizedStringPayloads");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v4, "setNormalizedStringPayloads:", v14);

    objc_msgSend(v3, "entityLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEntityLabel:", v15);

    objc_msgSend(v3, "verbLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVerbLabel:", v16);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertUsoNodes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertUsoNode:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v5;
}

@end
