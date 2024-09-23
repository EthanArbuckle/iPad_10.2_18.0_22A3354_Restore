@implementation PRSCoreDuet

- (PRSCoreDuet)initWithStreamName:(id)a3
{
  id v4;
  PRSCoreDuet *v5;
  uint64_t v6;
  _DKKnowledgeStore *knowledgeStore;
  void *v8;
  void *v9;
  uint64_t v10;
  _DKEventStream *spotlightStream;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRSCoreDuet;
  v5 = -[PRSCoreDuet init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
    v6 = objc_claimAutoreleasedReturnValue();
    knowledgeStore = v5->_knowledgeStore;
    v5->_knowledgeStore = (_DKKnowledgeStore *)v6;

    v8 = (void *)MEMORY[0x1E0D15A18];
    objc_msgSend(MEMORY[0x1E0D15980], "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eventStreamWithName:valueType:", v4, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    spotlightStream = v5->_spotlightStream;
    v5->_spotlightStream = (_DKEventStream *)v10;

  }
  return v5;
}

- (id)getRankedCategoriesDictionaryWithPredictionWindow:(double)a3 predictionInterval:(double)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _DKEventStream *spotlightStream;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a4);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D15A28];
  spotlightStream = self->_spotlightStream;
  v28 = (void *)v6;
  v29 = (void *)v5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v6);
  objc_msgSend(v7, "histogramQueryForStream:interval:", spotlightStream, v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)v10;
  -[_DKKnowledgeStore executeQuery:error:](self->_knowledgeStore, "executeQuery:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "histogram");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v26 = v11;
  v14 = objc_msgSend(v11, "countOverAllValues");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v12, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        if (v14)
        {
          v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22 / (double)v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setValue:forKey:", v23, v20);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v17);
  }

  v24 = (void *)objc_msgSend(v13, "copy");
  return v24;
}

- (void)addResultCategoryAndGroupToHistory:(id)a3 groupName:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _DKKnowledgeStore *knowledgeStore;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = v7;
  v11 = (void *)MEMORY[0x1E0C99D68];
  v12 = v10;
  objc_msgSend(v11, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D159F8], "eventWithStream:startDate:endDate:identifierStringValue:metadata:", self->_spotlightStream, v13, v13, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  knowledgeStore = self->_knowledgeStore;
  v17[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(knowledgeStore) = -[_DKKnowledgeStore saveObjects:error:](knowledgeStore, "saveObjects:error:", v16, 0);

  if ((knowledgeStore & 1) == 0)
    NSLog(CFSTR("Error saving engagement to knowledge store"));

}

- (_DKKnowledgeStore)knowledgeStore
{
  return (_DKKnowledgeStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKnowledgeStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_DKEventStream)spotlightStream
{
  return (_DKEventStream *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSpotlightStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightStream, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end
