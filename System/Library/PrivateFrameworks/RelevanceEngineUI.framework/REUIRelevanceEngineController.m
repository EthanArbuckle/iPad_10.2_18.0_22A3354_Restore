@implementation REUIRelevanceEngineController

- (REUIRelevanceEngineController)initWithRelevanceEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  REUIRelevanceEngineController *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "configuration", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "historicSectionDescriptor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

        }
        objc_msgSend(v12, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v16);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_msgSend(v5, "copy");
  v18 = -[REUIRelevanceEngineController initWithRelevanceEngine:sectionOrder:](self, "initWithRelevanceEngine:sectionOrder:", v4, v17);

  return v18;
}

- (REUIRelevanceEngineController)initWithRelevanceEngine:(id)a3 sectionOrder:(id)a4
{
  id v6;
  id v7;
  REUIRelevanceEngineController *v8;
  uint64_t v9;
  NSArray *sectionOrder;
  uint64_t v11;
  NSMutableDictionary *sectionNameOrdering;
  NSArray *v13;
  REUIRelevanceEngineController *v14;
  uint64_t v15;
  NSMutableDictionary *currentElementStates;
  _REUIControllerTrainingContext *v17;
  _REUIControllerTrainingContext *trainingContext;
  RERelevanceEnginePreferences *v19;
  RERelevanceEnginePreferences *preferences;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *hiddenIndices;
  uint64_t v26;
  NSMutableSet *hiddenBundleIdentifiers;
  uint64_t v28;
  NSMutableArray *pendingOperations;
  _QWORD v31[4];
  REUIRelevanceEngineController *v32;
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)REUIRelevanceEngineController;
  v8 = -[REUIRelevanceEngineController init](&v33, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    sectionOrder = v8->_sectionOrder;
    v8->_sectionOrder = (NSArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    sectionNameOrdering = v8->_sectionNameOrdering;
    v8->_sectionNameOrdering = (NSMutableDictionary *)v11;

    v13 = v8->_sectionOrder;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __70__REUIRelevanceEngineController_initWithRelevanceEngine_sectionOrder___block_invoke;
    v31[3] = &unk_24CF79870;
    v14 = v8;
    v32 = v14;
    -[NSArray enumerateObjectsUsingBlock:](v13, "enumerateObjectsUsingBlock:", v31);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v15 = objc_claimAutoreleasedReturnValue();
    currentElementStates = v14->_currentElementStates;
    v14->_currentElementStates = (NSMutableDictionary *)v15;

    v17 = objc_alloc_init(_REUIControllerTrainingContext);
    trainingContext = v14->_trainingContext;
    v14->_trainingContext = v17;

    -[_REUIControllerTrainingContext setDelegate:](v14->_trainingContext, "setDelegate:", v14);
    objc_msgSend(v6, "addTrainingContext:", v14->_trainingContext);
    v19 = (RERelevanceEnginePreferences *)objc_alloc_init(MEMORY[0x24BE7D090]);
    preferences = v14->_preferences;
    v14->_preferences = v19;

    objc_msgSend(v6, "setPreferences:forObject:", v14->_preferences, v14);
    *(_DWORD *)&v14->_isShowingContentElements = 0;
    -[REUIRelevanceEngineController setMinimumPositiveDwellTime:](v14, "setMinimumPositiveDwellTime:", 1.5);
    -[REUIRelevanceEngineController setMaximumNegativeDwellTime:](v14, "setMaximumNegativeDwellTime:", 0.5);
    -[REUIRelevanceEngineController setOnScreenElementCount:](v14, "setOnScreenElementCount:", 3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](v8->_sectionOrder, "count"))
    {
      v22 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v23);

        ++v22;
      }
      while (v22 < -[NSArray count](v8->_sectionOrder, "count"));
    }
    v24 = objc_msgSend(v21, "copy");
    hiddenIndices = v14->_hiddenIndices;
    v14->_hiddenIndices = (NSArray *)v24;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v26 = objc_claimAutoreleasedReturnValue();
    hiddenBundleIdentifiers = v14->_hiddenBundleIdentifiers;
    v14->_hiddenBundleIdentifiers = (NSMutableSet *)v26;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = objc_claimAutoreleasedReturnValue();
    pendingOperations = v14->_pendingOperations;
    v14->_pendingOperations = (NSMutableArray *)v28;

    -[REUIRelevanceEngineController _loadNewRelevanceEngine:withCompletion:](v14, "_loadNewRelevanceEngine:withCompletion:", v6, 0);
  }

  return v8;
}

void __70__REUIRelevanceEngineController_initWithRelevanceEngine_sectionOrder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v7, v6);

}

- (void)dealloc
{
  objc_super v3;

  -[RERelevanceEngine removeTrainingContext:](self->_engine, "removeTrainingContext:", self->_trainingContext);
  -[RERelevanceEngine removeObserver:](self->_engine, "removeObserver:", self);
  -[RERelevanceEngine removePreferencesForObject:](self->_engine, "removePreferencesForObject:", self);
  v3.receiver = self;
  v3.super_class = (Class)REUIRelevanceEngineController;
  -[REUIRelevanceEngineController dealloc](&v3, sel_dealloc);
}

- (id)_sectionAtIndex:(int64_t)a3
{
  if (a3 < 0 || -[NSArray count](self->_sectionOrder, "count") <= a3)
    RERaiseInternalException();
  return -[NSArray objectAtIndexedSubscript:](self->_sectionOrder, "objectAtIndexedSubscript:", a3);
}

- (int64_t)_indexForSection:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  id v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionNameOrdering, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v8 = v4;
    RERaiseInternalException();
  }
  v6 = objc_msgSend(v5, "integerValue", v8);

  return v6;
}

- (id)_sectionPathForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[REUIRelevanceEngineController _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(MEMORY[0x24BE7D098], "sectionPathWithSectionName:element:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_indexPathForSectionPath:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "sectionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REUIRelevanceEngineController _indexForSection:](self, "_indexForSection:", v5);

  v7 = objc_msgSend(v4, "element");
  return (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v7, v6);
}

- (id)_controllerIndexPathForEngineIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(v4, "section");
    v6 = objc_msgSend(v4, "item");

    -[NSArray objectAtIndexedSubscript:](self->_hiddenIndices, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsIndex:", v6) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      v9 = objc_msgSend(v7, "countOfIndexesInRange:", 0, v6);
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v6 - v9, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_engineIndexPathForControllerIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  uint64_t i;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "item");
  -[NSArray objectAtIndexedSubscript:](self->_hiddenIndices, "objectAtIndexedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__REUIRelevanceEngineController__engineIndexPathForControllerIndexPath___block_invoke;
  v13[3] = &unk_24CF798C0;
  v8 = v7;
  v14 = v8;
  v9 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x2199AF51C](v13);
  for (i = v9[2](v9, 0); v6; --v6)
    i += v9[2](v9, i + 1) + 1;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", i, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __72__REUIRelevanceEngineController__engineIndexPathForControllerIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  if (!objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2))
    return 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = "";
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__REUIRelevanceEngineController__engineIndexPathForControllerIndexPath___block_invoke_2;
  v7[3] = &unk_24CF79898;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateRangesInRange:options:usingBlock:", a2, 0x7FFFFFFFFFFFFFFFLL, 0, v7);
  v5 = v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __72__REUIRelevanceEngineController__engineIndexPathForControllerIndexPath___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v4 + 32) = a2;
  *(_QWORD *)(v4 + 40) = a3;
  *a4 = 1;
  return result;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFF7 | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFEF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFDF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 64;
    else
      v10 = 0;
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFFBF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 128;
    else
      v11 = 0;
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFF7F | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 256;
    else
      v12 = 0;
    *(_WORD *)&self->_delegateCallbacks = *(_WORD *)&self->_delegateCallbacks & 0xFEFF | v12;
  }

}

- (unint64_t)numberOfSections
{
  return -[NSArray count](self->_sectionOrder, "count");
}

- (unint64_t)numberOfItemsInSectionAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[REUIRelevanceEngineController _sectionAtIndex:](self, "_sectionAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentElementStates, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (unint64_t)_numberOfItemsInSectionAtIndex:(unint64_t)a3
{
  RERelevanceEngine *engine;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;

  engine = self->_engine;
  -[REUIRelevanceEngineController _sectionAtIndex:](self, "_sectionAtIndex:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RERelevanceEngine numberOfElementsInSection:](engine, "numberOfElementsInSection:", v6);

  -[NSArray objectAtIndexedSubscript:](self->_hiddenIndices, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") <= v7)
    v9 = v7 - objc_msgSend(v8, "count");
  else
    v9 = 0;

  return v9;
}

- (id)elementAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[REUIRelevanceEngineController _engineIndexPathForControllerIndexPath:](self, "_engineIndexPathForControllerIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUIRelevanceEngineController _sectionPathForIndexPath:](self, "_sectionPathForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngine elementAtPath:](self->_engine, "elementAtPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contentAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[REUIRelevanceEngineController _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "row");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentElementStates, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
  {
    v11 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_currentElementStates, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v4, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "content");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)indexPathForElementWithIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  REUIRelevanceEngineController *v23;
  NSMutableDictionary *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = self->_currentElementStates;
  v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v21)
  {
    v6 = *(_QWORD *)v30;
    v23 = self;
    v24 = v5;
    v20 = *(_QWORD *)v30;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v5);
        v8 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v7);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v22 = v8;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_currentElementStates, "objectForKeyedSubscript:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v10)
        {
          v11 = v10;
          v12 = 0;
          v13 = *(_QWORD *)v26;
          while (2)
          {
            v14 = 0;
            v15 = v12 + v11;
            do
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", v4);

              if ((v17 & 1) != 0)
              {
                objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v12 + v14, -[REUIRelevanceEngineController _indexForSection:](v23, "_indexForSection:", v22));
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                v5 = v24;
                goto LABEL_19;
              }
              ++v14;
            }
            while (v11 != v14);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            v12 = v15;
            if (v11)
              continue;
            break;
          }
        }

        ++v7;
        v6 = v20;
        self = v23;
        v5 = v24;
      }
      while (v7 != v21);
      v18 = 0;
      v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v21);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)generateDiffableSnapshot
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_sectionOrder;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v17 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v9 = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendSectionsWithIdentifiers:", v10);

        -[NSMutableDictionary objectForKeyedSubscript:](self->_currentElementStates, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendItemsWithIdentifiers:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_contentAtIndexPath:(id)a3
{
  void *v4;
  void *v5;

  -[REUIRelevanceEngineController _elementAtIndexPath:](self, "_elementAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUIRelevanceEngineController _contentForElement:](self, "_contentForElement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)actionAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[REUIRelevanceEngineController elementAtIndexPath:](self, "elementAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)identifierForElementAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[REUIRelevanceEngineController elementAtIndexPath:](self, "elementAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)predictionForElementAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[REUIRelevanceEngineController _engineIndexPathForControllerIndexPath:](self, "_engineIndexPathForControllerIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUIRelevanceEngineController _sectionPathForIndexPath:](self, "_sectionPathForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngine predictionForElementAtPath:](self->_engine, "predictionForElementAtPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)elementIdentifierAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[REUIRelevanceEngineController elementAtIndexPath:](self, "elementAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_indexPathForElementWithIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __68__REUIRelevanceEngineController__indexPathForElementWithIdentifier___block_invoke;
  v14 = &unk_24CF798E8;
  v5 = v4;
  v15 = v5;
  v16 = &v17;
  -[REUIRelevanceEngineController _enumerateEngineElementsWithOptions:usingBlock:](self, "_enumerateEngineElementsWithOptions:usingBlock:", 0, &v11);
  if (v18[5])
  {
    -[REUIRelevanceEngineController _controllerIndexPathForEngineIndexPath:](self, "_controllerIndexPathForEngineIndexPath:", v11, v12, v13, v14);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v18[5];
    v18[5] = v6;

    v8 = (void *)v18[5];
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __68__REUIRelevanceEngineController__indexPathForElementWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

- (id)metadataForElementWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[REUIRelevanceEngineController indexPathForElementWithIdentifier:](self, "indexPathForElementWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[REUIRelevanceEngineController _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v5, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_currentElementStates, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v5, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v12 = CFSTR("REMetadataBundleIdentifierKey");
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSSet)disabledDataSources
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_hiddenBundleIdentifiers, "copy");
}

- (BOOL)isDataSourceEnabled:(id)a3
{
  return -[NSMutableSet containsObject:](self->_hiddenBundleIdentifiers, "containsObject:", a3) ^ 1;
}

- (void)setDataSource:(id)a3 enabled:(BOOL)a4
{
  int v4;
  id v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  RERelevanceEngine *engine;
  id v11;
  _QWORD v12[5];
  id v13;
  char v14;
  uint8_t buf[4];
  REUIRelevanceEngineController *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[REUIRelevanceEngineController isDataSourceEnabled:](self, "isDataSourceEnabled:", v6);
  RELogForDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("disabled");
    *(_DWORD *)buf = 138412802;
    v16 = self;
    v17 = 2112;
    if (v4)
      v9 = CFSTR("enabled");
    v18 = v9;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_213276000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", buf, 0x20u);
  }

  if (v7 != v4)
  {
    if (v4)
      -[NSMutableSet removeObject:](self->_hiddenBundleIdentifiers, "removeObject:", v6);
    engine = self->_engine;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__REUIRelevanceEngineController_setDataSource_enabled___block_invoke;
    v12[3] = &unk_24CF79938;
    v12[4] = self;
    v11 = v6;
    v13 = v11;
    v14 = v4;
    -[REUIRelevanceEngineController relevanceEngine:performBatchUpdateBlock:completion:](self, "relevanceEngine:performBatchUpdateBlock:completion:", engine, v12, &__block_literal_global);
    if ((v4 & 1) == 0)
      -[NSMutableSet addObject:](self->_hiddenBundleIdentifiers, "addObject:", v11);
    -[RERelevanceEnginePreferences setDisabledDataSourceIdentifiers:](self->_preferences, "setDisabledDataSourceIdentifiers:", self->_hiddenBundleIdentifiers);

  }
}

void __55__REUIRelevanceEngineController_setDataSource_enabled___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  char v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__REUIRelevanceEngineController_setDataSource_enabled___block_invoke_2;
  v5[3] = &unk_24CF79910;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "_enumerateEngineElementsWithOptions:usingBlock:", 0, v5);

}

void __55__REUIRelevanceEngineController_setDataSource_enabled___block_invoke_2(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  void *v8;
  char v9;
  int v10;
  id v11;

  v11 = a2;
  v7 = a3;
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "_isElementHidden:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = *(unsigned __int8 *)(a1 + 48);
      if (v10 == a4)
        objc_msgSend(*(id *)(a1 + 40), "_setElement:atIndexPath:hidden:", v7, v11, v10 == 0);
    }
  }
  else
  {

  }
}

- (void)setAllowsLocationUse:(BOOL)a3
{
  if (self->_allowsLocationUse != a3)
  {
    self->_allowsLocationUse = a3;
    -[RERelevanceEnginePreferences setMode:](self->_preferences, "setMode:", -[RERelevanceEnginePreferences mode](self->_preferences, "mode") & 0xFFFFFFFFFFFFFFFELL | a3);
  }
}

- (void)setWantsLiveDataSources:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  if (self->_wantsLiveDataSources != a3)
  {
    v3 = a3;
    self->_wantsLiveDataSources = a3;
    v5 = -[RERelevanceEnginePreferences mode](self->_preferences, "mode") & 0xFFFFFFFFFFFFFFFDLL;
    v6 = 2;
    if (!v3)
      v6 = 0;
    -[RERelevanceEnginePreferences setMode:](self->_preferences, "setMode:", v5 | v6);
  }
}

- (REUITrainingContext)trainingContext
{
  return (REUITrainingContext *)self->_trainingContext;
}

- (void)makeCurrent
{
  -[REUIRelevanceEngineController setWantsLiveDataSources:](self, "setWantsLiveDataSources:", 1);
  -[RETrainingContext becomeCurrent](self->_trainingContext, "becomeCurrent");
}

- (void)resignCurrent
{
  -[REUIRelevanceEngineController setWantsLiveDataSources:](self, "setWantsLiveDataSources:", 0);
  if (-[REUITrainingContext resetsWhenResignsCurrent](self->_trainingContext, "resetsWhenResignsCurrent"))
    -[REUITrainingContext resetContext](self->_trainingContext, "resetContext");
}

- (id)predictedContentForSectionAtIndex:(unint64_t)a3 atDate:(id)a4 limit:(int64_t)a5
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[REUIRelevanceEngineController predictedElementsForSectionAtIndex:atDate:limit:](self, "predictedElementsForSectionAtIndex:atDate:limit:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        -[REUIRelevanceEngineController _contentForElement:](self, "_contentForElement:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
}

- (id)predictedElementsForSectionAtIndex:(unint64_t)a3 atDate:(id)a4 limit:(int64_t)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  unint64_t v21;

  v8 = a4;
  if ((unint64_t)a5 >= 0x7FFFFFFFFFFFFFFFLL)
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v9 = a5;
  v10 = (void *)MEMORY[0x24BDBCEB8];
  v11 = -[REUIRelevanceEngineController _numberOfItemsInSectionAtIndex:](self, "_numberOfItemsInSectionAtIndex:", a3);
  if (v9 >= v11)
    v12 = v11;
  else
    v12 = v9;
  objc_msgSend(v10, "arrayWithCapacity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __81__REUIRelevanceEngineController_predictedElementsForSectionAtIndex_atDate_limit___block_invoke;
  v18[3] = &unk_24CF799A0;
  v20 = v8;
  v21 = v9;
  v19 = v13;
  v14 = v8;
  v15 = v13;
  -[REUIRelevanceEngineController _enumerateEngineElementsInSection:withOptions:usingBlock:](self, "_enumerateEngineElementsInSection:withOptions:usingBlock:", a3, 0, v18);
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
}

void __81__REUIRelevanceEngineController_predictedElementsForSectionAtIndex_atDate_limit___block_invoke(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < *(_QWORD *)(a1 + 48) && (a4 & 1) == 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v6;
    objc_msgSend(v6, "relevanceProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v12;
            objc_msgSend(v13, "irrelevantDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "laterDate:", *(_QWORD *)(a1 + 40));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToDate:", *(_QWORD *)(a1 + 40));

            if ((v16 & 1) != 0)
            {

              v6 = v17;
              goto LABEL_14;
            }
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }
    }

    v6 = v17;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
  }
LABEL_14:

}

- (void)_loadNewRelevanceEngine:(id)a3 withCompletion:(id)a4
{
  RERelevanceEngine *v6;
  id v7;
  void *v8;
  RERelevanceEngine *v9;
  void *v10;
  uint64_t v11;
  id v12;
  RERelevanceEngine *engine;
  RERelevanceEngine *v14;
  RERelevanceEngine *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  REUIRelevanceEngineController *v22;
  _QWORD v23[4];
  id v24;

  v6 = (RERelevanceEngine *)a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = self->_engine;
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke;
  v23[3] = &unk_24CF799C8;
  v12 = v10;
  v24 = v12;
  -[REUIRelevanceEngineController _enumerateEngineElementsWithOptions:usingBlock:](self, "_enumerateEngineElementsWithOptions:usingBlock:", 0, v23);
  -[RERelevanceEngine removeObserver:](v9, "removeObserver:", self);
  engine = self->_engine;
  self->_engine = v6;
  v14 = v6;

  -[RERelevanceEngine addObserver:](self->_engine, "addObserver:", self);
  v15 = self->_engine;
  v19 = v7;
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_2;
  v20[3] = &unk_24CF79A58;
  v21 = v12;
  v22 = self;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_5;
  v18[3] = &unk_24CF79A80;
  v16 = v7;
  v17 = v12;
  -[REUIRelevanceEngineController relevanceEngine:performBatchUpdateBlock:completion:](self, "relevanceEngine:performBatchUpdateBlock:completion:", v15, v20, v18);

}

uint64_t __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_47);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v10 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_contentForElement:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "engineController:didRemoveContent:atIndexPath:", *(_QWORD *)(a1 + 40), v12, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(v14 + 32);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_4;
  v23[3] = &unk_24CF79A30;
  v23[4] = v14;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);
  if (objc_msgSend(*(id *)(a1 + 40), "numberOfSections"))
  {
    v16 = 0;
    do
    {
      v17 = objc_msgSend(*(id *)(a1 + 40), "_numberOfItemsInSectionAtIndex:", v16);
      if (v17)
      {
        v18 = v17;
        for (j = 0; j != v18; ++j)
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", j, v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "_contentAtIndexPath:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "delegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "engineController:didInsertContent:atIndexPath:", *(_QWORD *)(a1 + 40), v21, v20);

        }
      }
      ++v16;
    }
    while (v16 < objc_msgSend(*(id *)(a1 + 40), "numberOfSections"));
  }

}

uint64_t __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "removeAllIndexes");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1A8], v5);
  objc_msgSend(*(id *)(a1 + 32), "_sectionSupportingNoContentElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = objc_msgSend(*(id *)(a1 + 32), "_sectionHasContent:", v6);
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "numberOfElementsInSection:", v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7D098]), "initWithSectionName:element:", v5, i);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "elementAtPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 32), "_isElementHidden:", v11))
        objc_msgSend(v13, "addIndex:", i);
      else
        objc_msgSend(v8, "addObject:", v11);

    }
  }
  v12 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v12, v5);

}

uint64_t __72__REUIRelevanceEngineController__loadNewRelevanceEngine_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_sectionSupportingNoContentElements
{
  return (id)*MEMORY[0x24BE7D0B8];
}

- (BOOL)_sectionHasContent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  int v12;

  v4 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_hiddenIndices, "objectAtIndexedSubscript:", -[REUIRelevanceEngineController _indexForSection:](self, "_indexForSection:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RERelevanceEngine numberOfElementsInSection:](self->_engine, "numberOfElementsInSection:", v4);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 1;
    do
    {
      if ((objc_msgSend(v5, "containsIndex:", v8) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE7D098], "sectionPathWithSectionName:element:", v4, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RERelevanceEngine elementAtPath:](self->_engine, "elementAtPath:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isNoContentElement");

        if (!v12)
          break;
      }
      v9 = ++v8 < v7;
    }
    while (v7 != v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_contentForElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (self->_wantsIdealizedContent)
  {
    objc_msgSend(v4, "idealizedContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v5, "content");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

  }
  else
  {
    objc_msgSend(v4, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_enumerateEngineElementsInSection:(unint64_t)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  RERelevanceEngine *engine;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;

  v8 = a5;
  if (v8 && self->_engine)
  {
    v15 = v8;
    -[NSArray objectAtIndexedSubscript:](self->_hiddenIndices, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD15E0];
    engine = self->_engine;
    -[REUIRelevanceEngineController _sectionAtIndex:](self, "_sectionAtIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexSetWithIndexesInRange:", 0, -[RERelevanceEngine numberOfElementsInSection:](engine, "numberOfElementsInSection:", v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __90__REUIRelevanceEngineController__enumerateEngineElementsInSection_withOptions_usingBlock___block_invoke;
    v16[3] = &unk_24CF79AA8;
    v19 = a3;
    v16[4] = self;
    v17 = v9;
    v18 = v15;
    v14 = v9;
    objc_msgSend(v13, "enumerateIndexesWithOptions:usingBlock:", a4, v16);

    v8 = v15;
  }

}

void __90__REUIRelevanceEngineController__enumerateEngineElementsInSection_withOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[10];
  objc_msgSend(v4, "_sectionPathForIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "elementAtPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "containsIndex:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_enumerateEngineElementsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, -[NSArray count](self->_sectionOrder, "count"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__REUIRelevanceEngineController__enumerateEngineElementsWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_24CF79AD0;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v7 = v6;
  objc_msgSend(v8, "enumerateIndexesWithOptions:usingBlock:", a3, v9);

}

uint64_t __80__REUIRelevanceEngineController__enumerateEngineElementsWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateEngineElementsInSection:withOptions:usingBlock:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_setElement:(id)a3 atIndexPath:(id)a4 hidden:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a3;
  -[REUIRelevanceEngineController _sectionPathForIndexPath:](self, "_sectionPathForIndexPath:", a4);
  v9 = objc_claimAutoreleasedReturnValue();
  v11 = (id)v9;
  if (v5)
    +[REUIRelevanceEngineControllerUpdateOperation hideElement:atPath:](REUIRelevanceEngineControllerUpdateOperation, "hideElement:atPath:", v8, v9);
  else
    +[REUIRelevanceEngineControllerUpdateOperation showElement:atPath:](REUIRelevanceEngineControllerUpdateOperation, "showElement:atPath:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[REUIRelevanceEngineController _performOrEnqueueOperation:](self, "_performOrEnqueueOperation:", v10);
}

- (BOOL)_isElementHidden:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[REUIRelevanceEngineController isDataSourceEnabled:](self, "isDataSourceEnabled:", v5))
  {
    if (self->_isShowingContentElements)
      v6 = objc_msgSend(v4, "isNoContentElement");
    else
      v6 = 0;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)_performOrEnqueueOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (self->_performingBatch)
  {
    -[NSMutableArray addObject:](self->_pendingOperations, "addObject:", v4);
  }
  else
  {
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sectionName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[REUIRelevanceEngineController _indexForSection:](self, "_indexForSection:", v6);

    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUIRelevanceEngineController _performOperations:toSection:](self, "_performOperations:toSection:", v8, v7);

  }
}

- (void)_performBatchUpdateUsingBlock:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  id v8;
  void (**v9)(_QWORD);
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id *location;
  REUIRelevanceEngineController *v30;
  id v31;
  id v32;
  void (**v33)(_QWORD);
  void (**v34)(_QWORD);
  _QWORD v35[4];
  id v36;
  REUIRelevanceEngineController *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __74__REUIRelevanceEngineController__performBatchUpdateUsingBlock_completion___block_invoke;
  v42[3] = &unk_24CF79A80;
  v8 = v7;
  v43 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x2199AF51C](v42);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = WeakRetained;
  if ((*(_WORD *)&self->_delegateCallbacks & 1) != 0 && WeakRetained)
  {
    v32 = WeakRetained;
    self->_performingBatch = 1;
    if (v6)
      v6[2](v6);
    v33 = v9;
    v34 = v6;
    v31 = v8;
    self->_performingBatch = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", &self->_delegate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)-[NSMutableArray copy](self->_pendingOperations, "copy");
    v30 = self;
    -[NSMutableArray removeAllObjects](self->_pendingOperations, "removeAllObjects");
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v39;
      v18 = 1;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v39 != v17)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v20, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "sectionName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, v22);

          }
          if (objc_msgSend(v20, "type") && objc_msgSend(v20, "type") != 4
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v18 = 0;
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v16);
    }
    else
    {
      v18 = 1;
    }

    if (objc_msgSend(v12, "count") && objc_msgSend(v14, "count"))
    {
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __74__REUIRelevanceEngineController__performBatchUpdateUsingBlock_completion___block_invoke_2;
      v35[3] = &unk_24CF79A58;
      v36 = v12;
      v37 = v30;
      v26 = MEMORY[0x2199AF51C](v35);
      v27 = (void *)v26;
      v9 = v33;
      v6 = v34;
      v11 = v32;
      if ((v18 & 1) == 0 && (*(_WORD *)&v30->_delegateCallbacks & 1) != 0)
      {
        v28 = objc_loadWeakRetained(location);
        v8 = v31;
        objc_msgSend(v28, "engineController:performBatchUpdateBlock:completion:", v30, v27, v31);

      }
      else
      {
        (*(void (**)(uint64_t))(v26 + 16))(v26);
        v8 = v31;
        if (v33)
          v33[2](v33);
      }

    }
    else
    {
      v9 = v33;
      v6 = v34;
      v8 = v31;
      v11 = v32;
      if (v33)
        v33[2](v33);
    }

  }
  else
  {
    if (v6)
      v6[2](v6);
    if (v9)
      v9[2](v9);
  }

}

uint64_t __74__REUIRelevanceEngineController__performBatchUpdateUsingBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__REUIRelevanceEngineController__performBatchUpdateUsingBlock_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __74__REUIRelevanceEngineController__performBatchUpdateUsingBlock_completion___block_invoke_3;
  v3[3] = &unk_24CF79AF8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __74__REUIRelevanceEngineController__performBatchUpdateUsingBlock_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_performOperations:toSection:", v6, objc_msgSend(v5, "_indexForSection:", a2));

}

- (void)_performOperations:(id)a3 toSection:(unint64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  _BOOL4 v43;
  NSObject *v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  unint64_t v54;
  void *v55;
  uint64_t j;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  __CFString *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  __CFString *v67;
  void *v68;
  NSObject *v69;
  _BOOL4 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  void *v86;
  id v87;
  void *v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  void *v96;
  id obj;
  void *v98;
  id v99;
  void *v100;
  _QWORD v101[6];
  _QWORD v102[4];
  id v103;
  REUIRelevanceEngineController *v104;
  id v105;
  BOOL v106;
  _QWORD v107[4];
  id v108;
  id v109;
  id v110;
  REUIRelevanceEngineController *v111;
  id v112;
  id v113;
  unint64_t v114;
  _QWORD v115[4];
  id v116;
  REUIRelevanceEngineController *v117;
  id v118;
  id v119;
  id v120;
  id v121;
  unint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint8_t buf[4];
  REUIRelevanceEngineController *v128;
  __int16 v129;
  const __CFString *v130;
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
  v96 = v5;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v124;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v124 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
        objc_msgSend(v11, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "element");

        objc_msgSend(v11, "element");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = objc_msgSend(v11, "updateType");
          if (v16 == 1)
          {
            objc_msgSend(v100, "addIndex:", v13);
            objc_msgSend(v11, "element");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v98;
          }
          else
          {
            if (v16 != 2)
              goto LABEL_12;
            objc_msgSend(v5, "addIndex:", v13);
            objc_msgSend(v11, "element");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v6;
          }
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v18);

          v5 = v96;
        }
LABEL_12:
        v20 = objc_msgSend(v11, "type");
        switch(v20)
        {
          case 1:
            objc_msgSend(v5, "addIndex:", v13);
            objc_msgSend(v11, "element");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, v31);

            v23 = v92;
            break;
          case 3:
            objc_msgSend(v90, "addObject:", v15);
            objc_msgSend(v5, "addIndex:", v13);
            objc_msgSend(v11, "element");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, v25);

            objc_msgSend(v11, "movedToPath");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "element");

            objc_msgSend(v100, "addIndex:", v27);
            objc_msgSend(v11, "element");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setObject:forKeyedSubscript:", v28, v29);

            goto LABEL_19;
          case 2:
            objc_msgSend(v100, "addIndex:", v13);
            objc_msgSend(v11, "element");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setObject:forKeyedSubscript:", v21, v22);

            v23 = v94;
            break;
          default:
            goto LABEL_19;
        }
        objc_msgSend(v23, "addObject:", v15);
LABEL_19:

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_hiddenIndices, "objectAtIndexedSubscript:", a4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = MEMORY[0x24BDAC760];
  v115[0] = MEMORY[0x24BDAC760];
  v115[1] = 3221225472;
  v115[2] = __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke;
  v115[3] = &unk_24CF79B20;
  v122 = a4;
  v87 = v6;
  v116 = v87;
  v117 = self;
  v36 = v90;
  v118 = v36;
  v37 = v32;
  v119 = v37;
  v38 = v34;
  v120 = v38;
  v93 = v92;
  v121 = v93;
  objc_msgSend(v5, "enumerateIndexesWithOptions:usingBlock:", 2, v115);
  v107[0] = v35;
  v107[1] = 3221225472;
  v107[2] = __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_53;
  v107[3] = &unk_24CF79B20;
  v114 = a4;
  v99 = v98;
  v108 = v99;
  v91 = v36;
  v109 = v91;
  v95 = v94;
  v110 = v95;
  v111 = self;
  v39 = v38;
  v112 = v39;
  v85 = v37;
  v113 = v85;
  objc_msgSend(v100, "enumerateIndexesUsingBlock:", v107);
  -[REUIRelevanceEngineController _sectionSupportingNoContentElements](self, "_sectionSupportingNoContentElements");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUIRelevanceEngineController _sectionAtIndex:](self, "_sectionAtIndex:", a4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v38) = objc_msgSend(v41, "isEqualToString:", v40);

  if ((_DWORD)v38)
  {
    v42 = -[REUIRelevanceEngineController _sectionHasContent:](self, "_sectionHasContent:", v40);
    if (self->_isShowingContentElements != v42)
    {
      v43 = v42;
      self->_isShowingContentElements = v42;
      RELogForDomain();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v45 = CFSTR("no content");
        if (v43)
          v45 = CFSTR("content");
        *(_DWORD *)buf = 134218242;
        v128 = self;
        v129 = 2114;
        v130 = v45;
        _os_log_impl(&dword_213276000, v44, OS_LOG_TYPE_INFO, "%p Showing %{public}@ state.", buf, 0x16u);
      }

      if (v43)
        v46 = 2;
      else
        v46 = 0;
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, -[RERelevanceEngine numberOfElementsInSection:](self->_engine, "numberOfElementsInSection:", v40));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v102[0] = v35;
      v102[1] = 3221225472;
      v102[2] = __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_58;
      v102[3] = &unk_24CF79B48;
      v103 = v40;
      v104 = self;
      v105 = v39;
      v106 = v43;
      objc_msgSend(v47, "enumerateIndexesWithOptions:usingBlock:", v46, v102);

    }
  }
  v86 = v39;
  -[REUIRelevanceEngineController _sectionAtIndex:](self, "_sectionAtIndex:", a4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentElementStates, "objectForKeyedSubscript:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "copy");
  v51 = (void *)v50;
  v52 = (void *)MEMORY[0x24BDBD1A8];
  if (v50)
    v52 = (void *)v50;
  v53 = v52;

  v54 = -[REUIRelevanceEngineController _numberOfItemsInSectionAtIndex:](self, "_numberOfItemsInSectionAtIndex:", a4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    for (j = 0; j != v54; ++j)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", j, v33);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[REUIRelevanceEngineController elementAtIndexPath:](self, "elementAtIndexPath:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObject:", v58);

      v33 = a4;
    }
  }
  v59 = (void *)objc_msgSend(v55, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentElementStates, "setObject:forKeyedSubscript:", v59, v48);

  RELogForDomain();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(sel_identifier);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "valueForKeyPath:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "componentsJoinedByString:", CFSTR(", "));
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v128 = self;
    v129 = 2114;
    v130 = v63;
    _os_log_impl(&dword_213276000, v60, OS_LOG_TYPE_INFO, "%p Performing operations with original content: %{public}@", buf, 0x16u);

    v33 = a4;
  }

  RELogForDomain();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(sel_identifier);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "valueForKeyPath:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "componentsJoinedByString:", CFSTR(", "));
    v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v128 = self;
    v129 = 2114;
    v130 = v67;
    _os_log_impl(&dword_213276000, v64, OS_LOG_TYPE_INFO, "%p Performing operations with current content: %{public}@", buf, 0x16u);

    v33 = a4;
  }

  objc_msgSend(MEMORY[0x24BE7D068], "diffFromElements:toElements:equalComparator:hashGenerator:changeComparator:", v53, v55, &__block_literal_global_66, &__block_literal_global_68, &__block_literal_global_69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  RELogForDomain();
  v69 = objc_claimAutoreleasedReturnValue();
  v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG);
  v77 = MEMORY[0x24BDAC760];
  if (v70)
    -[REUIRelevanceEngineController _performOperations:toSection:].cold.2((uint64_t)self, v69, v71, v72, v73, v74, v75, v76);

  v101[0] = v77;
  v101[1] = 3221225472;
  v101[2] = __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_70;
  v101[3] = &unk_24CF79C10;
  v101[4] = self;
  v101[5] = v33;
  objc_msgSend(v68, "enumerateOperationsUsingBlock:", v101);
  RELogForDomain();
  v78 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
    -[REUIRelevanceEngineController _performOperations:toSection:].cold.1((uint64_t)self, v78, v79, v80, v81, v82, v83, v84);

}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 80));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_controllerIndexPathForEngineIndexPath:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v8))
  {
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v9, v8);
    RELogForDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v18 = 134218754;
      v19 = v11;
      v20 = 2114;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      v24 = 2114;
      v25 = v4;
      v12 = "%p Removing (through move) %{public}@ at index path %{public}@ (mapped from %{public}@).";
      v13 = v10;
      v14 = 42;
LABEL_7:
      _os_log_impl(&dword_213276000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v18, v14);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(*(id *)(a1 + 72), "containsObject:", v8))
  {
    RELogForDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 40);
      v18 = 134218242;
      v19 = v15;
      v20 = 2114;
      v21 = v8;
      v12 = "%p Removing %{public}@ (in removed elements).";
      v13 = v10;
      v14 = 22;
      goto LABEL_7;
    }
LABEL_8:

    objc_msgSend(*(id *)(a1 + 64), "shiftIndexesStartingAtIndex:by:", objc_msgSend(v4, "item") + 1, -1);
    goto LABEL_9;
  }
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 64), "addIndex:", objc_msgSend(v4, "item"));
    RELogForDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(_QWORD *)(a1 + 40);
      v18 = 134218754;
      v19 = v17;
      v20 = 2114;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      v24 = 2114;
      v25 = v4;
      _os_log_impl(&dword_213276000, v16, OS_LOG_TYPE_INFO, "%p Hiding %{public}@ at index path %{public}@ (mapped from %{public}@; path removed).",
        (uint8_t *)&v18,
        0x2Au);
    }

  }
LABEL_9:

}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_53(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 80));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 48), "containsObject:", v8))
  {
    RELogForDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_53_cold_1(a1, (uint64_t)v8, v9);

    objc_msgSend(*(id *)(a1 + 64), "shiftIndexesStartingAtIndex:by:", objc_msgSend(v4, "item"), 1);
  }
  RELogForDomain();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(a1 + 56);
    v17 = 134218242;
    v18 = v11;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_213276000, v10, OS_LOG_TYPE_INFO, "%p Showing %{public}@.", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 64), "removeIndex:", objc_msgSend(v4, "item"));
  objc_msgSend(*(id *)(a1 + 56), "_controllerIndexPathForEngineIndexPath:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8))
  {
    objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      RELogForDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = *(_QWORD *)(a1 + 56);
        v17 = 134219010;
        v18 = v15;
        v19 = 2114;
        v20 = v8;
        v21 = 2114;
        v22 = 0;
        v23 = 2114;
        v24 = v12;
        v25 = 2114;
        v26 = v4;
        _os_log_impl(&dword_213276000, v14, OS_LOG_TYPE_INFO, "%p Ignoring move of %{public}@ from index path %{public}@ to index path %{public}@ (mapped from %{public}@).", (uint8_t *)&v17, 0x34u);
      }

      objc_msgSend(*(id *)(a1 + 64), "addIndex:", objc_msgSend(v4, "item"));
    }
LABEL_17:

    goto LABEL_18;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v8)
    && objc_msgSend(*(id *)(a1 + 56), "_isElementHidden:", v7))
  {
    objc_msgSend(*(id *)(a1 + 64), "addIndex:", objc_msgSend(v4, "item"));
    RELogForDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 56);
      v17 = 134218754;
      v18 = v16;
      v19 = 2114;
      v20 = v8;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v4;
      _os_log_impl(&dword_213276000, v13, OS_LOG_TYPE_INFO, "%p Filtering %{public}@ at index path %{public}@ (mapped from %{public}@).", (uint8_t *)&v17, 0x2Au);
    }
    goto LABEL_17;
  }
LABEL_18:

}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_58(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  objc_msgSend(MEMORY[0x24BE7D098], "sectionPathWithSectionName:element:", *(_QWORD *)(a1 + 32), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "elementAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isNoContentElement")
    && *(unsigned __int8 *)(a1 + 56) != objc_msgSend(*(id *)(a1 + 48), "containsIndex:", a2))
  {
    v6 = *(void **)(a1 + 48);
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(v6, "addIndex:", a2);
      RELogForDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_58_cold_2(a1 + 40, v7, v8, v9, v10, v11, v12, v13);
    }
    else
    {
      objc_msgSend(v6, "removeIndex:", a2);
      RELogForDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_58_cold_1(a1 + 40, v7, v14, v15, v16, v17, v18, v19);
    }

  }
}

uint64_t __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  return v7;
}

uint64_t __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

uint64_t __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:") ^ 1;
}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_70(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int16 v14;
  void *WeakRetained;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  RELogForDomain();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v26 = *(_QWORD *)(a1 + 32);
    REDiffOperationTypeDescription();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 134218498;
    v30 = v26;
    v31 = 2114;
    v32 = v27;
    v33 = 2114;
    v34 = v28;
    _os_log_debug_impl(&dword_213276000, v10, OS_LOG_TYPE_DEBUG, "%p Performing %{public}@ operation on %{public}@.", (uint8_t *)&v29, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a4, *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a5, *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a2)
  {
    case 0:
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_WORD *)(v13 + 24);
      if ((v14 & 0x100) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)(v13 + 96));
        v25 = *(void **)(a1 + 32);
        objc_msgSend(v25, "_contentForElement:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "engineController:didReloadContent:withIdentifier:", v25, v17, v22);
        goto LABEL_16;
      }
      if ((v14 & 2) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)(v13 + 96));
        v16 = *(void **)(a1 + 32);
        objc_msgSend(v16, "_contentForElement:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "engineController:didReloadContent:atIndexPath:", v16, v17, v11);
        goto LABEL_17;
      }
      break;
    case 1:
      v18 = *(_QWORD *)(a1 + 32);
      if ((*(_WORD *)(v18 + 24) & 8) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)(v18 + 96));
        v19 = *(void **)(a1 + 32);
        objc_msgSend(v19, "_contentForElement:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "engineController:didInsertContent:atIndexPath:", v19, v17, v11);
        goto LABEL_17;
      }
      break;
    case 2:
      objc_msgSend(v9, "identifier");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isDisplayingElementWithIdentifier:", WeakRetained))objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "elementWithIdentifierDidEndDisplay:", WeakRetained);
      v20 = *(_QWORD *)(a1 + 32);
      if ((*(_WORD *)(v20 + 24) & 4) == 0)
        goto LABEL_18;
      v17 = objc_loadWeakRetained((id *)(v20 + 96));
      v21 = *(void **)(a1 + 32);
      objc_msgSend(v21, "_contentForElement:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "engineController:didRemoveContent:atIndexPath:", v21, v22, v12);
LABEL_16:

      goto LABEL_17;
    case 3:
      v23 = *(_QWORD *)(a1 + 32);
      if ((*(_WORD *)(v23 + 24) & 0x10) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)(v23 + 96));
        v24 = *(void **)(a1 + 32);
        objc_msgSend(v24, "_contentForElement:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "engineController:didMoveContent:fromIndexPath:toIndexPath:", v24, v17, v12, v11);
LABEL_17:

LABEL_18:
      }
      break;
    default:
      break;
  }

}

- (void)relevanceEngine:(id)a3 performBatchUpdateBlock:(id)a4 completion:(id)a5
{
  -[REUIRelevanceEngineController _performBatchUpdateUsingBlock:completion:](self, "_performBatchUpdateUsingBlock:completion:", a4, a5);
}

- (void)relevanceEngine:(id)a3 didReloadElement:(id)a4 atPath:(id)a5
{
  id v6;

  objc_msgSend(MEMORY[0x24BE7D088], "reloadElement:atPath:", a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[REUIRelevanceEngineController _performOrEnqueueOperation:](self, "_performOrEnqueueOperation:", v6);

}

- (void)relevanceEngine:(id)a3 didRemoveElement:(id)a4 atPath:(id)a5
{
  id v6;

  objc_msgSend(MEMORY[0x24BE7D088], "removeElement:atPath:", a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[REUIRelevanceEngineController _performOrEnqueueOperation:](self, "_performOrEnqueueOperation:", v6);

}

- (void)relevanceEngine:(id)a3 didInsertElement:(id)a4 atPath:(id)a5
{
  id v6;

  objc_msgSend(MEMORY[0x24BE7D088], "insertElement:atPath:", a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[REUIRelevanceEngineController _performOrEnqueueOperation:](self, "_performOrEnqueueOperation:", v6);

}

- (void)relevanceEngine:(id)a3 didMoveElement:(id)a4 fromPath:(id)a5 toPath:(id)a6
{
  id v7;

  objc_msgSend(MEMORY[0x24BE7D088], "moveElement:fromPath:toPath:", a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[REUIRelevanceEngineController _performOrEnqueueOperation:](self, "_performOrEnqueueOperation:", v7);

}

- (BOOL)relevanceEngine:(id)a3 isElementAtPathVisible:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  id WeakRetained;

  -[REUIRelevanceEngineController _indexPathForSectionPath:](self, "_indexPathForSectionPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUIRelevanceEngineController _controllerIndexPathForEngineIndexPath:](self, "_controllerIndexPathForEngineIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (*(_WORD *)&self->_delegateCallbacks & 0x20) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_msgSend(WeakRetained, "engineController:isElementAtIndexPathVisible:", self, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)relevanceEngineDidBeginUpdatingRelevance:(id)a3
{
  id WeakRetained;

  if ((*(_WORD *)&self->_delegateCallbacks & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "engineControllerDidBeginUpdatingRelevance:", self);

  }
}

- (void)relevanceEngineDidFinishUpdatingRelevance:(id)a3
{
  id WeakRetained;

  if ((*(_WORD *)&self->_delegateCallbacks & 0x80) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "engineControllerDidFinishUpdatingRelevance:", self);

  }
}

- (id)elementsOrdered:(unint64_t)a3 relativeToElement:(id)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[REUIRelevanceEngineController _indexPathForElementWithIdentifier:](self, "_indexPathForElementWithIdentifier:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
  {
    if (a3 == 1)
      v8 = objc_msgSend(v6, "item");
    else
      v8 = 0;
    v9 = 0;
  }
  else
  {
    v9 = objc_msgSend(v6, "item") + 1;
    v8 = -[REUIRelevanceEngineController _numberOfItemsInSectionAtIndex:](self, "_numberOfItemsInSectionAtIndex:", objc_msgSend(v7, "section"));
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 < v8)
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v9, objc_msgSend(v7, "section"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[REUIRelevanceEngineController elementIdentifierAtIndexPath:](self, "elementIdentifierAtIndexPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v10, "addObject:", v12);

      ++v9;
    }
    while (v8 != v9);
  }
  v13 = (void *)objc_msgSend(v10, "copy");

  return v13;
}

- (BOOL)elementIsAvailable:(id)a3
{
  void *v3;
  BOOL v4;

  -[REUIRelevanceEngineController _indexPathForElementWithIdentifier:](self, "_indexPathForElementWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)interactionTypeForElement:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[REUIRelevanceEngineController _indexPathForElementWithIdentifier:](self, "_indexPathForElementWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUIRelevanceEngineController _contentAtIndexPath:](self, "_contentAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE7D0B0]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
  }
  if (v7)
    v8 = v7;
  else
    v8 = (void *)*MEMORY[0x24BE7D0C8];
  v9 = v8;

  return v9;
}

- (RERelevanceEngine)engine
{
  return self->_engine;
}

- (NSArray)sectionOrder
{
  return self->_sectionOrder;
}

- (REUIRelevanceEngineControllerDelegate)delegate
{
  return (REUIRelevanceEngineControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)allowsLocationUse
{
  return self->_allowsLocationUse;
}

- (BOOL)wantsLiveDataSources
{
  return self->_wantsLiveDataSources;
}

- (BOOL)wantsIdealizedContent
{
  return self->_wantsIdealizedContent;
}

- (void)setWantsIdealizedContent:(BOOL)a3
{
  self->_wantsIdealizedContent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionOrder, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_trainingContext, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_hiddenBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_hiddenIndices, 0);
  objc_storeStrong((id *)&self->_currentElementStates, 0);
  objc_storeStrong((id *)&self->_sectionNameOrdering, 0);
}

- (double)maximumNegativeDwellTime
{
  double result;

  -[_REUIControllerTrainingContext maximumNegativeDwellTime](self->_trainingContext, "maximumNegativeDwellTime");
  return result;
}

- (void)setMaximumNegativeDwellTime:(double)a3
{
  -[_REUIControllerTrainingContext setMaximumNegativeDwellTime:](self->_trainingContext, "setMaximumNegativeDwellTime:", a3);
}

- (double)minimumPositiveDwellTime
{
  double result;

  -[_REUIControllerTrainingContext minimumPositiveDwellTime](self->_trainingContext, "minimumPositiveDwellTime");
  return result;
}

- (void)setMinimumPositiveDwellTime:(double)a3
{
  -[_REUIControllerTrainingContext setMinimumPositiveDwellTime:](self->_trainingContext, "setMinimumPositiveDwellTime:", a3);
}

- (unint64_t)onScreenElementCount
{
  return -[_REUIControllerTrainingContext onScreenElementCount](self->_trainingContext, "onScreenElementCount");
}

- (void)setOnScreenElementCount:(unint64_t)a3
{
  -[_REUIControllerTrainingContext setOnScreenElementCount:](self->_trainingContext, "setOnScreenElementCount:", a3);
}

- (void)elementAtIndexPathWasSelected:(id)a3
{
  id v4;

  -[REUIRelevanceEngineController elementIdentifierAtIndexPath:](self, "elementIdentifierAtIndexPath:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REUITrainingContext selectElementWithIdentifier:](self->_trainingContext, "selectElementWithIdentifier:", v4);

}

- (void)elemenAtIndexPathDidDisplay:(id)a3
{
  void *v4;
  void *v5;

  -[REUIRelevanceEngineController elementIdentifierAtIndexPath:](self, "elementIdentifierAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[REUITrainingContext elementWithIdentifierDidDisplay:](self->_trainingContext, "elementWithIdentifierDidDisplay:", v4);
    v4 = v5;
  }

}

- (void)elementAtIndexPathDidEndDisplay:(id)a3
{
  void *v4;
  void *v5;

  -[REUIRelevanceEngineController elementIdentifierAtIndexPath:](self, "elementIdentifierAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[REUITrainingContext elementWithIdentifierDidEndDisplay:](self->_trainingContext, "elementWithIdentifierDidEndDisplay:", v4);
    v4 = v5;
  }

}

- (void)_performOperations:(uint64_t)a3 toSection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213276000, a2, a3, "%p Finish updating delegate.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_performOperations:(uint64_t)a3 toSection:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213276000, a2, a3, "%p Begin updating delegate.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_53_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_213276000, log, OS_LOG_TYPE_DEBUG, "%p inserting element %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_58_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213276000, a2, a3, "%p Showing no content element.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __62__REUIRelevanceEngineController__performOperations_toSection___block_invoke_58_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213276000, a2, a3, "%p Hiding no content element.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
