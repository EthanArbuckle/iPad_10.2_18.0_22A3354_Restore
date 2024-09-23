@implementation GeneratePredictionsOperation

- (GeneratePredictionsOperation)initWithInputManager:(id)a3 predictionOptions:(unint64_t)a4 prefixContext:(id)a5
{
  id v9;
  id v10;
  GeneratePredictionsOperation *v11;
  GeneratePredictionsOperation *v12;
  uint64_t v13;
  TIWordSearchHandwriting *wordSearch;
  void *v15;
  uint64_t v16;
  NSArray *committedCandidates;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GeneratePredictionsOperation;
  v11 = -[GeneratePredictionsOperation init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inputManager, a3);
    objc_msgSend(v9, "wordSearch");
    v13 = objc_claimAutoreleasedReturnValue();
    wordSearch = v12->_wordSearch;
    v12->_wordSearch = (TIWordSearchHandwriting *)v13;

    objc_msgSend(v9, "committedCandidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    committedCandidates = v12->_committedCandidates;
    v12->_committedCandidates = (NSArray *)v16;

    v12->_predictionOptions = a4;
    objc_storeStrong((id *)&v12->_prefixContext, a5);
  }

  return v12;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  GeneratePredictionsOperation *v30;
  void *v31;
  id obj;
  id v33;
  id v34;
  NSObject *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id location[2];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v3;
  objc_storeStrong((id *)&self->_candidates, v3);
  objc_storeStrong((id *)&self->_proactiveTriggers, v4);
  objc_storeStrong((id *)&self->_candidateRefsDictionary, v5);
  -[GeneratePredictionsOperation wordSearch](self, "wordSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GeneratePredictionsOperation committedCandidates](self, "committedCandidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GeneratePredictionsOperation prefixContext](self, "prefixContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = self;
  objc_msgSend(v6, "generatePredictionsWithCandidateContext:stringContext:option:", v7, v8, -[GeneratePredictionsOperation predictionOptions](self, "predictionOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    v13 = *MEMORY[0x24BEB5260];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (MecabraCandidateGetType() == 6)
        {
          MecabraCandidateGetAttributes();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
            goto LABEL_11;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v17);
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v13);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB5430]), "initWithSourceType:attributes:", 0, v18);
          objc_msgSend(v4, "addObject:", v19);

        }
        else
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E80]), "initWithMecabraCandidate:", v15);
          objc_msgSend(v16, "setTypingEngine:", 6);
          objc_msgSend(v31, "addObject:", v16);
          objc_msgSend(v16, "mecabraCandidatePointerValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v17);
        }

LABEL_11:
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v4, "count") && TICanLogMessageAtLevel())
  {
    TIOSLogFacility();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: Mecabra found prediction proactive triggers: %@"), "-[GeneratePredictionsOperation main]", v4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v29;
      _os_log_debug_impl(&dword_248040000, v20, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)location, 0xCu);

    }
  }
  -[GeneratePredictionsOperation candidates](v30, "candidates");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[GeneratePredictionsOperation inputManager](v30, "inputManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stickerCandidateGenerator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "candidate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "generateStickerQueriesForText:tokenize:", v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "count"))
    {
      v27 = dispatch_group_create();
      dispatch_group_enter(v27);
      objc_initWeak(location, v30);
      v33 = v24;
      v34 = v26;
      objc_copyWeak(&v36, location);
      v35 = v27;
      v28 = v27;
      TIDispatchAsync();
      dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);

      objc_destroyWeak(&v36);
      objc_destroyWeak(location);
    }

  }
}

- (TIInputManagerHandwriting)inputManager
{
  return self->_inputManager;
}

- (TIWordSearchHandwriting)wordSearch
{
  return self->_wordSearch;
}

- (NSArray)committedCandidates
{
  return self->_committedCandidates;
}

- (unint64_t)predictionOptions
{
  return self->_predictionOptions;
}

- (NSString)prefixContext
{
  return self->_prefixContext;
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (NSArray)stickers
{
  return self->_stickers;
}

- (NSArray)proactiveTriggers
{
  return self->_proactiveTriggers;
}

- (NSDictionary)candidateRefsDictionary
{
  return self->_candidateRefsDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateRefsDictionary, 0);
  objc_storeStrong((id *)&self->_proactiveTriggers, 0);
  objc_storeStrong((id *)&self->_stickers, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_prefixContext, 0);
  objc_storeStrong((id *)&self->_committedCandidates, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
  objc_storeStrong((id *)&self->_inputManager, 0);
}

void __36__GeneratePredictionsOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "inputManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secureCandidateRenderTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "inputManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "languageWithRegion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__GeneratePredictionsOperation_main__block_invoke_2;
  v10[3] = &unk_2519802E8;
  objc_copyWeak(&v12, (id *)(a1 + 64));
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v2, "generateStickerCandidatesForSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:", v3, v6, 1, v9, v10);

  objc_destroyWeak(&v12);
}

void __36__GeneratePredictionsOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD *WeakRetained;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)WeakRetained[37];
  WeakRetained[37] = v3;
  v5 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
