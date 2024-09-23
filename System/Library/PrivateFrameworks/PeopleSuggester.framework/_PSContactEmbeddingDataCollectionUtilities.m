@implementation _PSContactEmbeddingDataCollectionUtilities

+ (id)prepareEventFromContactEmbedding:(id)a3 contactId:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  ContactEmbeddingAnalysisPETNeuralNetEmbedding *v16;
  void *v17;
  char *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent *v26;
  void *v27;
  ContactEmbeddingAnalysisPETNeuralNetEmbedding *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  id v33;
  ContactEmbeddingAnalysisPETNeuralNetEmbedding *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33 = a4;
  v34 = objc_alloc_init(ContactEmbeddingAnalysisPETNeuralNetEmbedding);
  v35 = v5;
  objc_msgSend(v5, "objectForKey:", CFSTR("last_layer_before_activation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v32 = &v30;
  v8 = (char *)&v30 - ((4 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v41;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v14), "floatValue");
        *(_DWORD *)&v8[4 * v12 + 4 * v14++] = v15;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      v12 += v14;
    }
    while (v11);
  }

  -[ContactEmbeddingAnalysisPETNeuralNetEmbedding setEmbeddings:count:](v34, "setEmbeddings:count:", v8, v7);
  v16 = objc_alloc_init(ContactEmbeddingAnalysisPETNeuralNetEmbedding);
  objc_msgSend(v35, "objectForKey:", CFSTR("last_layer_after_activation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v17, "count");
  v18 = (char *)&v30 - ((4 * v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v37;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v24), "floatValue");
        *(_DWORD *)&v18[4 * v22 + 4 * v24++] = v25;
      }
      while (v21 != v24);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      v22 += v24;
    }
    while (v21);
  }

  -[ContactEmbeddingAnalysisPETNeuralNetEmbedding setEmbeddings:count:](v16, "setEmbeddings:count:", v18, v31);
  v26 = objc_alloc_init(ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent);
  v27 = v33;
  -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent setContactId:](v26, "setContactId:", v33);
  v28 = v34;
  -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent setEmbeddingsBeforeActivation:](v26, "setEmbeddingsBeforeActivation:", v34);
  -[ContactEmbeddingAnalysisPETContactEmbeddingAnalysisEvent setEmbeddingsAfterActivation:](v26, "setEmbeddingsAfterActivation:", v16);

  return v26;
}

+ (id)prepareAllEventsFromContactEmbeddingsDict:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "prepareEventFromContactEmbedding:contactId:", v12, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v13, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

+ (id)prepareEventArrayFromEmbeddingDict:(id)a3 forUser:(id)a4 sessionId:(id)a5
{
  id v7;
  id v8;
  id v9;
  ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v12, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16), (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent setContactEmbeddings:](v10, "setContactEmbeddings:", v11);
  -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent setUserId:](v10, "setUserId:", v8);
  -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent setSessinobd:](v10, "setSessinobd:", v9);

  return v10;
}

@end
