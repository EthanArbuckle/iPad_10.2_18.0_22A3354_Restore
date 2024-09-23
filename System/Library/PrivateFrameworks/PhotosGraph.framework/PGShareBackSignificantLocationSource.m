@implementation PGShareBackSignificantLocationSource

- (BOOL)prepareSourceWithGraph:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  PGGraphHomeWorkNodeCollection *v7;
  PGGraphHomeWorkNodeCollection *homeNodes;
  unint64_t v9;
  uint8_t v11[16];

  v4 = a3;
  -[PGShareBackSource loggingConnection](self, "loggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meNodeCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "homeNodes");
  v7 = (PGGraphHomeWorkNodeCollection *)objc_claimAutoreleasedReturnValue();
  homeNodes = self->_homeNodes;
  self->_homeNodes = v7;

  v9 = -[MAElementCollection count](self->_homeNodes, "count");
  if (!v9 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1CA237000, v5, OS_LOG_TYPE_INFO, "[PGShareBackSignificantLocationSource] No home available", v11, 2u);
  }

  return v9 != 0;
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  id v7;
  void *v8;
  id v9;
  PGGraphHomeWorkNodeCollection *homeNodes;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a3;
  -[PGShareBackSource loggingConnection](self, "loggingConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  homeNodes = self->_homeNodes;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__PGShareBackSignificantLocationSource_suggesterResultsForInputs_momentNodes_inGraph_error___block_invoke;
  v17[3] = &unk_1E842D728;
  v18 = v7;
  v19 = v8;
  v11 = v9;
  v20 = v11;
  v12 = v8;
  v13 = v7;
  -[MANodeCollection enumerateNodesUsingBlock:](homeNodes, "enumerateNodesUsingBlock:", v17);
  v14 = v20;
  v15 = v11;

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeNodes, 0);
}

void __92__PGShareBackSignificantLocationSource_suggesterResultsForInputs_momentNodes_inGraph_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  NSObject *v18;
  PGShareBackSuggesterResult *v19;
  uint64_t v20;
  void *v21;
  PGShareBackSuggesterResult *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "coordinate");
  v29 = v6;
  v30 = v7;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "location", v23, v24, (_QWORD)v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "coordinate", 0, 0);
          v23 = v15;
          v24 = v16;
          CLLocationCoordinate2DGetDistanceFrom();
          if (v17 <= 200.0)
          {
            v18 = *(NSObject **)(a1 + 40);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v5;
              _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[PGShareBackSignificantLocationSource] Matched home %@", buf, 0xCu);
            }
            v19 = [PGShareBackSuggesterResult alloc];
            v20 = *(_QWORD *)(a1 + 32);
            objc_msgSend(MEMORY[0x1E0C99E60], "set", v23, v24);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[PGShareBackSuggesterResult initWithInputs:processingValue:momentNodes:](v19, "initWithInputs:processingValue:momentNodes:", v20, 2048, v21);

            objc_msgSend(*(id *)(a1 + 48), "addObject:", v22);
            *a3 = 1;

            goto LABEL_14;
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_14:

}

@end
