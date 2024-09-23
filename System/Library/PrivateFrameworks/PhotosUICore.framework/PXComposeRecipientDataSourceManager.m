@implementation PXComposeRecipientDataSourceManager

- (PXComposeRecipientDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientDataSourceManager.m"), 92, CFSTR("%s is not available as initializer"), "-[PXComposeRecipientDataSourceManager init]");

  abort();
}

- (PXComposeRecipientDataSourceManager)initWithPeopleSuggestionsDataSourceManager:(id)a3 sourceType:(int64_t)a4
{
  id v8;
  PXComposeRecipientDataSourceManager *v9;
  uint64_t v10;
  NSMutableArray *composeRecipients;
  uint64_t v12;
  NSMutableSet *recipients;
  uint64_t v14;
  PXPeopleSuggestionsDataSource *peopleSuggestionsDataSource;
  uint64_t v16;
  PXComposeRecipientDataSource *dataSource;
  void *v18;
  void *v20;
  objc_super v21;

  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXComposeRecipientDataSourceManager;
  v9 = -[PXComposeRecipientDataSourceManager init](&v21, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    composeRecipients = v9->_composeRecipients;
    v9->_composeRecipients = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    recipients = v9->_recipients;
    v9->_recipients = (NSMutableSet *)v12;

    objc_storeStrong((id *)&v9->_peopleSuggestionsDataSourceManager, a3);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](v9->_peopleSuggestionsDataSourceManager, "registerChangeObserver:context:", v9, PXPeopleSuggestionManagerObservationContext);
    if ((v8 == 0) != (a4 == 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PXComposeRecipientDataSourceManager.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(peopleSuggestionsDataSourceManager == nil && sourceType == PXPeopleSuggestionsSourceTypeNone) || (peopleSuggestionsDataSourceManager != nil && sourceType != PXPeopleSuggestionsSourceTypeNone)"));

    }
    v9->_sourceType = a4;
    -[PXSectionedDataSourceManager dataSource](v9->_peopleSuggestionsDataSourceManager, "dataSource");
    v14 = objc_claimAutoreleasedReturnValue();
    peopleSuggestionsDataSource = v9->_peopleSuggestionsDataSource;
    v9->_peopleSuggestionsDataSource = (PXPeopleSuggestionsDataSource *)v14;

    -[PXComposeRecipientDataSourceManager _createComposeRecipientDataSourceFromCurrentState](v9, "_createComposeRecipientDataSourceFromCurrentState");
    v16 = objc_claimAutoreleasedReturnValue();
    dataSource = v9->_dataSource;
    v9->_dataSource = (PXComposeRecipientDataSource *)v16;

    -[PXComposeRecipientDataSourceManager _composeRecipientsFromCurrentPeopleSuggestionsDataSource](v9, "_composeRecipientsFromCurrentPeopleSuggestionsDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_numberOfPeopleSuggested = objc_msgSend(v18, "count");
    if (objc_msgSend(v18, "count"))
      -[PXComposeRecipientDataSourceManager _addComposeRecipients:](v9, "_addComposeRecipients:", v18);

  }
  return v9;
}

- (void)addRecipients:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  PXComposeRecipient *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = (void *)-[NSMutableSet mutableCopy](self->_recipients, "mutableCopy");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v12 = objc_msgSend(v6, "containsObject:", v11);
        v13 = -[PXComposeRecipient initWithRecipient:]([PXComposeRecipient alloc], "initWithRecipient:", v11);
        if (v12)
        {
          -[PXComposeRecipientDataSourceManager dataSource](self, "dataSource");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "indexOfComposeRecipientForRecipient:", v11);

          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v19, "addIndex:", v15);
            -[PXComposeRecipientDataSourceManager _replaceComposeRecipientAtIndex:withComposeRecipient:](self, "_replaceComposeRecipientAtIndex:withComposeRecipient:", v15, v13);
          }
        }
        else
        {
          objc_msgSend(v5, "addObject:", v13);
          objc_msgSend(v6, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    -[PXComposeRecipientDataSourceManager _addComposeRecipients:](self, "_addComposeRecipients:", v5);
  if (objc_msgSend(v19, "count"))
  {
    -[PXComposeRecipientDataSourceManager _createComposeRecipientDataSourceFromCurrentState](self, "_createComposeRecipientDataSourceFromCurrentState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXComposeRecipientDataSourceManager setDataSource:](self, "setDataSource:", v16);
    v17 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, v19);
    -[PXComposeRecipientDataSourceManager delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "composeRecipientDataSourceManager:didUpdateDataSourceWithChangeDetails:", self, v17);

  }
}

- (void)deleteComposeRecipientAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[NSMutableArray objectAtIndexedSubscript:](self->_composeRecipients, "objectAtIndexedSubscript:");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recipient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[NSMutableSet removeObject:](self->_recipients, "removeObject:", v5);
  v6 = (void *)-[NSMutableArray copy](self->_composeRecipients, "copy");
  -[NSMutableArray removeObjectAtIndex:](self->_composeRecipients, "removeObjectAtIndex:", a3);
  -[PXComposeRecipientDataSourceManager _createComposeRecipientDataSourceFromCurrentState](self, "_createComposeRecipientDataSourceFromCurrentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientDataSourceManager setDataSource:](self, "setDataSource:", v7);
  objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v6, self->_composeRecipients, MEMORY[0x1E0C9AA60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientDataSourceManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "composeRecipientDataSourceManager:didUpdateDataSourceWithChangeDetails:", self, v8);

}

- (void)replaceComposeRecipientAtIndex:(unint64_t)a3 withNewComposeRecipient:(id)a4
{
  void *v6;
  void *v7;
  NSMutableSet *recipients;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_composeRecipients, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableSet removeObject:](self->_recipients, "removeObject:", v7);
    recipients = self->_recipients;
    objc_msgSend(v14, "recipient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](recipients, "addObject:", v9);

  }
  v10 = (void *)-[NSMutableArray copy](self->_composeRecipients, "copy");
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_composeRecipients, "replaceObjectAtIndex:withObject:", a3, v14);
  -[PXComposeRecipientDataSourceManager _createComposeRecipientDataSourceFromCurrentState](self, "_createComposeRecipientDataSourceFromCurrentState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientDataSourceManager setDataSource:](self, "setDataSource:", v11);
  objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v10, self->_composeRecipients, MEMORY[0x1E0C9AA60]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientDataSourceManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "composeRecipientDataSourceManager:didUpdateDataSourceWithChangeDetails:", self, v12);

}

- (id)_createComposeRecipientDataSourceFromCurrentState
{
  return -[PXComposeRecipientDataSource initWithComposeRecipients:recipients:]([PXComposeRecipientDataSource alloc], "initWithComposeRecipients:recipients:", self->_composeRecipients, self->_recipients);
}

- (id)_composeRecipientsFromCurrentPeopleSuggestionsDataSource
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  -[PXComposeRecipientDataSourceManager peopleSuggestionsDataSource](self, "peopleSuggestionsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)-[NSMutableSet mutableCopy](self->_recipients, "mutableCopy");
  v6 = objc_msgSend(v3, "identifier");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__PXComposeRecipientDataSourceManager__composeRecipientsFromCurrentPeopleSuggestionsDataSource__block_invoke;
  v14[3] = &unk_1E513B078;
  v15 = v3;
  v16 = v5;
  v7 = v4;
  v17 = v7;
  v13[0] = v6;
  v13[1] = 0;
  v13[2] = 0;
  v13[3] = 0x7FFFFFFFFFFFFFFFLL;
  v8 = v5;
  v9 = v3;
  objc_msgSend(v9, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v13, 0, v14);
  v10 = v17;
  v11 = v7;

  return v11;
}

- (int64_t)_lastValidComposeRecipientIndex
{
  NSMutableArray *composeRecipients;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  composeRecipients = self->_composeRecipients;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PXComposeRecipientDataSourceManager__lastValidComposeRecipientIndex__block_invoke;
  v5[3] = &unk_1E51232F0;
  v5[4] = &v6;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](composeRecipients, "enumerateObjectsWithOptions:usingBlock:", 2, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_addComposeRecipients:(id)a3
{
  id v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[7];
  _QWORD v14[3];
  uint64_t v15;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientDataSourceManager.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composeRecipients.count > 0"));

  }
  v6 = -[PXComposeRecipientDataSourceManager _lastValidComposeRecipientIndex](self, "_lastValidComposeRecipientIndex");
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = -[NSMutableArray count](self->_composeRecipients, "count");
  else
    v7 = v6 + 1;
  v15 = v7;
  v8 = (void *)-[NSMutableArray copy](self->_composeRecipients, "copy");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__PXComposeRecipientDataSourceManager__addComposeRecipients___block_invoke;
  v13[3] = &unk_1E5123318;
  v13[4] = self;
  v13[5] = v14;
  v13[6] = a2;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);
  -[PXComposeRecipientDataSourceManager _createComposeRecipientDataSourceFromCurrentState](self, "_createComposeRecipientDataSourceFromCurrentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientDataSourceManager setDataSource:](self, "setDataSource:", v9);
  objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v8, self->_composeRecipients, MEMORY[0x1E0C9AA60]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientDataSourceManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "composeRecipientDataSourceManager:didUpdateDataSourceWithChangeDetails:", self, v10);

  _Block_object_dispose(v14, 8);
}

- (void)_replaceComposeRecipientAtIndex:(int64_t)a3 withComposeRecipient:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientDataSourceManager.m"), 271, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index != NSNotFound"));

  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_composeRecipients, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recipient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[NSMutableSet removeObject:](self->_recipients, "removeObject:", v8);
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_composeRecipients, "replaceObjectAtIndex:withObject:", a3, v11);
  if (v9)
    -[NSMutableSet addObject:](self->_recipients, "addObject:", v9);

}

- (NSDictionary)diagnosticDictionary
{
  id v3;
  int64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = -[PXComposeRecipientDataSourceManager sourceType](self, "sourceType");
  v5 = CFSTR("PXPeopleSuggestionsSourceTypeNone");
  if (v4 == 1)
    v5 = CFSTR("PXPeopleSuggestionsSourceTypePhotosGraph");
  if (v4 == 2)
    v6 = CFSTR("PXPeopleSuggestionsSourceTypePreviewSuggestion");
  else
    v6 = v5;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("People Suggestions Source Type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXComposeRecipientDataSourceManager numberOfPeopleSuggested](self, "numberOfPeopleSuggested"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Number Of People Suggested"));

  -[PXComposeRecipientDataSourceManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "composeRecipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("Total Recipients Count"));

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PXComposeRecipientDataSourceManager dataSource](self, "dataSource", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "composeRecipients");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "diagnosticDictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v12, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("Recipients Debug Infos"));
  return (NSDictionary *)v3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  SEL v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  PXComposeRecipientDataSourceManager *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if ((a4 & 1) != 0 && (void *)PXPeopleSuggestionManagerObservationContext == a5)
  {
    -[PXComposeRecipientDataSourceManager peopleSuggestionsDataSource](self, "peopleSuggestionsDataSource", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXComposeRecipientDataSourceManager peopleSuggestionsDataSourceManager](self, "peopleSuggestionsDataSourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXComposeRecipientDataSourceManager peopleSuggestionsDataSourceManager](self, "peopleSuggestionsDataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "changeHistory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v7, "identifier"), objc_msgSend(v9, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count") == 1)
    {
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v13, "itemChangesInSection:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXComposeRecipientDataSourceManager setPeopleSuggestionsDataSource:](self, "setPeopleSuggestionsDataSource:", v9);
    v15 = objc_msgSend(v7, "numberOfItemsInSection:", 0);
    v16 = objc_msgSend(v9, "numberOfItemsInSection:", 0);
    objc_msgSend(v14, "insertedIndexes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "changedIndexes");
    v44 = a2;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = !v15
       && (objc_msgSend(v17, "count") || v16 >= 1)
       && -[PXComposeRecipientDataSourceManager sourceType](self, "sourceType") == 0;
    v19 = v45;
    v20 = objc_msgSend(v45, "count");
    if (v18 || v20)
    {
      v41 = v17;
      v42 = v13;
      v43 = v12;
      if (v18)
      {
        v40 = v7;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v22 = self->_composeRecipients;
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v51 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
              objc_msgSend(v27, "personSuggestion");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v44, self, CFSTR("PXComposeRecipientDataSourceManager.m"), 343, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composeRecipient.personSuggestion == nil"));

              }
              objc_msgSend(v21, "addObject:", v27);
            }
            v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
          }
          while (v24);
        }

        -[NSMutableSet removeAllObjects](self->_recipients, "removeAllObjects");
        -[NSMutableArray removeAllObjects](self->_composeRecipients, "removeAllObjects");
        -[PXComposeRecipientDataSourceManager _composeRecipientsFromCurrentPeopleSuggestionsDataSource](self, "_composeRecipientsFromCurrentPeopleSuggestionsDataSource");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v21);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "count"))
          -[PXComposeRecipientDataSourceManager _addComposeRecipients:](self, "_addComposeRecipients:", v31);
        -[PXComposeRecipientDataSourceManager setNumberOfPeopleSuggested:](self, "setNumberOfPeopleSuggested:", objc_msgSend(v30, "count"));

        v7 = v40;
        v17 = v41;
        v13 = v42;
        v12 = v43;
        v19 = v45;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14 || (objc_msgSend(v14, "hasIncrementalChanges") & 1) == 0)
        {
          -[PXComposeRecipientDataSourceManager _composeRecipientsFromCurrentPeopleSuggestionsDataSource](self, "_composeRecipientsFromCurrentPeopleSuggestionsDataSource");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v34, "count"));
          v35 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v35;
        }
        if (objc_msgSend(v19, "count"))
        {
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __68__PXComposeRecipientDataSourceManager_observable_didChange_context___block_invoke;
          v46[3] = &unk_1E51489A0;
          v47 = v9;
          v48 = self;
          v49 = v32;
          objc_msgSend(v19, "enumerateIndexesUsingBlock:", v46);

        }
        if (objc_msgSend(v32, "count") || objc_msgSend(v33, "count"))
        {
          -[PXComposeRecipientDataSourceManager _createComposeRecipientDataSourceFromCurrentState](self, "_createComposeRecipientDataSourceFromCurrentState");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXComposeRecipientDataSourceManager setDataSource:](self, "setDataSource:", v36);
          v37 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v33, 0, 0, 0, v32);
          -[PXComposeRecipientDataSourceManager delegate](self, "delegate");
          v38 = v19;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "composeRecipientDataSourceManager:didUpdateDataSourceWithChangeDetails:", self, v37);

          v19 = v38;
        }

        v13 = v42;
        v12 = v43;
        v17 = v41;
      }
    }

  }
}

- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsDataSourceManager
{
  return self->_peopleSuggestionsDataSourceManager;
}

- (void)setPeopleSuggestionsDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSourceManager, a3);
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (PXComposeRecipientDataSourceManagerDelegate)delegate
{
  return (PXComposeRecipientDataSourceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXComposeRecipientDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (PXPeopleSuggestionsDataSource)peopleSuggestionsDataSource
{
  return self->_peopleSuggestionsDataSource;
}

- (void)setPeopleSuggestionsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSource, a3);
}

- (unint64_t)numberOfPeopleSuggested
{
  return self->_numberOfPeopleSuggested;
}

- (void)setNumberOfPeopleSuggested:(unint64_t)a3
{
  self->_numberOfPeopleSuggested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_composeRecipients, 0);
}

void __68__PXComposeRecipientDataSourceManager_observable_didChange_context___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  PXComposeRecipient *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];

  v4 = objc_msgSend(a1[4], "identifier");
  v5 = a1[4];
  v10[0] = v4;
  v10[1] = 0;
  v10[2] = a2;
  v10[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "personSuggestionAtItemIndexPath:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXComposeRecipient initWithPersonSuggestion:]([PXComposeRecipient alloc], "initWithPersonSuggestion:", v6);
  v8 = objc_msgSend(*((id *)a1[5] + 1), "indexOfObject:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v8;
    objc_msgSend(a1[5], "_replaceComposeRecipientAtIndex:withComposeRecipient:", v8, v7);
    objc_msgSend(a1[6], "addIndex:", v9);
  }

}

void __61__PXComposeRecipientDataSourceManager__addComposeRecipients___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  if (v3)
  {
    if (objc_msgSend(*(id *)(v4 + 16), "containsObject:", v3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PXComposeRecipientDataSourceManager.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![_recipients containsObject:recipient]"));

    }
    objc_msgSend(*(id *)(a1[4] + 16), "addObject:", v3);
    v5 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    v6 = objc_msgSend(*(id *)(a1[4] + 8), "count");
    v7 = *(void **)(a1[4] + 8);
    if (v5 >= v6)
    {
      objc_msgSend(v7, "addObject:", v9);
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 8), "count");
    }
    else
    {
      objc_msgSend(v7, "insertObject:atIndex:", v9, (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++);
    }
  }
  else
  {
    objc_msgSend(*(id *)(v4 + 8), "addObject:", v9);
  }

}

void __70__PXComposeRecipientDataSourceManager__lastValidComposeRecipientIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;

  objc_msgSend(a2, "recipient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __95__PXComposeRecipientDataSourceManager__composeRecipientsFromCurrentPeopleSuggestionsDataSource__block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  PXComposeRecipient *v6;
  void *v7;
  _OWORD v8[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  objc_msgSend(v3, "personSuggestionAtItemIndexPath:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXComposeRecipient initWithPersonSuggestion:]([PXComposeRecipient alloc], "initWithPersonSuggestion:", v5);
  -[PXComposeRecipient recipient](v6, "recipient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_4;
  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
LABEL_4:
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  }

}

@end
