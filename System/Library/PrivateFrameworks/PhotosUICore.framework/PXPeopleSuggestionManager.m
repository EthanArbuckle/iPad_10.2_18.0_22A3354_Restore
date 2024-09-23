@implementation PXPeopleSuggestionManager

- (PXPeopleSuggestionManager)initWithPerson:(id)a3
{
  id v5;
  PXPeopleSuggestionManager *v6;
  PXPeopleSuggestionManager *v7;
  PXPeoplePagingSuggestionProvider *v8;
  PXPeoplePagingSuggestionProvider *suggestionProvider;
  NSMutableSet *v10;
  NSMutableSet *confirmedSuggestions;
  NSMutableSet *v12;
  NSMutableSet *rejectedSuggestions;
  NSMutableSet *v14;
  NSMutableSet *skippedSuggestions;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPeopleSuggestionManager;
  v6 = -[PXPeopleSuggestionManager init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_confirmYesSoundID = 0;
    v6->_confirmNoSoundID = 0;
    objc_storeStrong((id *)&v6->_person, a3);
    v8 = objc_alloc_init(PXPeoplePagingSuggestionProvider);
    suggestionProvider = v7->_suggestionProvider;
    v7->_suggestionProvider = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    confirmedSuggestions = v7->_confirmedSuggestions;
    v7->_confirmedSuggestions = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    rejectedSuggestions = v7->_rejectedSuggestions;
    v7->_rejectedSuggestions = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    skippedSuggestions = v7->_skippedSuggestions;
    v7->_skippedSuggestions = v14;

    v7->_mute = 0;
    v7->_userConfirmationsCount = 0;
    v7->_autoConfirmationsCount = 0;
  }

  return v7;
}

- (PXPeopleSuggestionManager)init
{
  return -[PXPeopleSuggestionManager initWithPerson:](self, "initWithPerson:", 0);
}

- (void)dealloc
{
  SystemSoundID confirmYesSoundID;
  SystemSoundID confirmNoSoundID;
  objc_super v5;

  confirmYesSoundID = self->_confirmYesSoundID;
  if (confirmYesSoundID)
  {
    AudioServicesDisposeSystemSoundID(confirmYesSoundID);
    self->_confirmYesSoundID = 0;
  }
  confirmNoSoundID = self->_confirmNoSoundID;
  if (confirmNoSoundID)
  {
    AudioServicesDisposeSystemSoundID(confirmNoSoundID);
    self->_confirmNoSoundID = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleSuggestionManager;
  -[PXPeopleSuggestionManager dealloc](&v5, sel_dealloc);
}

- (NSArray)currentSuggestions
{
  void *v2;
  void *v3;

  -[PXPeopleSuggestionManager suggestionProvider](self, "suggestionProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)canUndo
{
  void *v3;
  void *v4;
  char v5;

  -[PXPeopleSuggestionManager suggestionProvider](self, "suggestionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXPeopleSuggestionManager didReachEnd](self, "didReachEnd"))
  {
    objc_msgSend(v3, "currentSuggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = objc_msgSend(v3, "hasPreviousSuggestions");
  }

  return v5;
}

- (BOOL)isLoading
{
  void *v2;
  BOOL v3;

  -[PXPeopleSuggestionManager suggestionToken](self, "suggestionToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setDataSource:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10[2];
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_dataSource, a3);
  -[PXPeopleSuggestionManager suggestionProvider](self, "suggestionProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllSuggestions");

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_msgSend(v5, "initialPageLimit");
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = v7;
  }
  else
  {
    v8 = 1;
  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__PXPeopleSuggestionManager_setDataSource___block_invoke;
  v9[3] = &unk_1E513E4E8;
  objc_copyWeak(v10, &location);
  v10[1] = (id)v8;
  -[PXPeopleSuggestionManager _loadMoreSuggestionsWithCompletion:](self, "_loadMoreSuggestionsWithCompletion:", v9);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

- (void)preloadSounds
{
  -[PXPeopleSuggestionManager setConfirmYesSoundID:](self, "setConfirmYesSoundID:", -[PXPeopleSuggestionManager _soundIdWithFilename:](self, "_soundIdWithFilename:", CFSTR("PXPeopleConfirmYes")));
  -[PXPeopleSuggestionManager setConfirmNoSoundID:](self, "setConfirmNoSoundID:", -[PXPeopleSuggestionManager _soundIdWithFilename:](self, "_soundIdWithFilename:", CFSTR("PXPeopleConfirmNo")));
}

- (void)requestNextSuggestion
{
  -[PXPeopleSuggestionManager requestNextSuggestionsWithPageLimit:](self, "requestNextSuggestionsWithPageLimit:", 1);
}

- (void)requestNextSuggestionsWithPageLimit:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8[2];
  id location;

  if (!-[PXPeopleSuggestionManager _fetchingSuggestions](self, "_fetchingSuggestions"))
  {
    -[PXPeopleSuggestionManager suggestionProvider](self, "suggestionProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasNextSuggestions"))
    {
      v6 = (id)objc_msgSend(v5, "nextSuggestionsWithPageLimit:", a3);
      -[PXPeopleSuggestionManager _notifyDelegateWeHaveMoreSuggestions:](self, "_notifyDelegateWeHaveMoreSuggestions:", 1);
    }
    else
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __65__PXPeopleSuggestionManager_requestNextSuggestionsWithPageLimit___block_invoke;
      v7[3] = &unk_1E513E510;
      objc_copyWeak(v8, &location);
      v8[1] = (id)a3;
      v7[4] = self;
      -[PXPeopleSuggestionManager _loadMoreSuggestionsWithCompletion:](self, "_loadMoreSuggestionsWithCompletion:", v7);
      objc_destroyWeak(v8);
      objc_destroyWeak(&location);
    }

  }
}

- (BOOL)isSuggestionConfirmed:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PXPeopleSuggestionManager confirmedSuggestions](self, "confirmedSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)markSuggestions:(id)a3 confirmed:(BOOL)a4 wantsSound:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v5 = a5;
  v6 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_msgSend(v8, "count");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "px_localIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v13);
  }

  if (!v6)
  {
    if (v5)
      -[PXPeopleSuggestionManager _playConfirmNoSound](self, "_playConfirmNoSound");
    -[PXPeopleSuggestionManager skippedSuggestions](self, "skippedSuggestions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "minusSet:", v30);

    -[PXPeopleSuggestionManager confirmedSuggestions](self, "confirmedSuggestions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "minusSet:", v32);

    -[PXPeopleSuggestionManager rejectedSuggestions](self, "rejectedSuggestions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v11);
    goto LABEL_25;
  }
  if (v5)
    -[PXPeopleSuggestionManager _playConfirmYesSound](self, "_playConfirmYesSound");
  -[PXPeopleSuggestionManager skippedSuggestions](self, "skippedSuggestions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "minusSet:", v18);

  -[PXPeopleSuggestionManager rejectedSuggestions](self, "rejectedSuggestions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "minusSet:", v20);

  -[PXPeopleSuggestionManager confirmedSuggestions](self, "confirmedSuggestions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObjectsFromArray:", v11);

  -[PXPeopleSuggestionManager delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    -[PXPeopleSuggestionManager setUserConfirmationsCount:](self, "setUserConfirmationsCount:", -[PXPeopleSuggestionManager userConfirmationsCount](self, "userConfirmationsCount") + v9);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = v11;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v27 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(v23);
          v26 += objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "numberOfAssets", (_QWORD)v34);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v25);
    }
    else
    {
      v26 = 0;
    }

    -[PXPeopleSuggestionManager setAutoConfirmationsCount:](self, "setAutoConfirmationsCount:", v26 - v9 + -[PXPeopleSuggestionManager autoConfirmationsCount](self, "autoConfirmationsCount"));
    -[PXPeopleSuggestionManager delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "confirmationCountUpdatedForSuggestionManager:undoing:", self, 0);
LABEL_25:

  }
}

- (void)markSuggestionsAsSkipped:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "px_localIdentifier", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  -[PXPeopleSuggestionManager skippedSuggestions](self, "skippedSuggestions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v6);

  -[PXPeopleSuggestionManager confirmedSuggestions](self, "confirmedSuggestions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minusSet:", v15);

  -[PXPeopleSuggestionManager rejectedSuggestions](self, "rejectedSuggestions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minusSet:", v17);

  -[PXPeopleSuggestionManager suggestionProvider](self, "suggestionProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeSuggestions:", v7);

}

- (void)removeAllSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXPeopleSuggestionManager rejectedSuggestions](self, "rejectedSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PXPeopleSuggestionManager confirmedSuggestions](self, "confirmedSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[PXPeopleSuggestionManager skippedSuggestions](self, "skippedSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[PXPeopleSuggestionManager suggestionProvider](self, "suggestionProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllSuggestions");

  -[PXPeopleSuggestionManager setUserConfirmationsCount:](self, "setUserConfirmationsCount:", 0);
  -[PXPeopleSuggestionManager setAutoConfirmationsCount:](self, "setAutoConfirmationsCount:", 0);
  -[PXPeopleSuggestionManager setDidReachEnd:](self, "setDidReachEnd:", 0);
  -[PXPeopleSuggestionManager delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "confirmationCountUpdatedForSuggestionManager:undoing:", self, 1);

}

- (void)undo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[PXPeopleSuggestionManager canUndo](self, "canUndo"))
  {
    if (-[PXPeopleSuggestionManager _fetchingSuggestions](self, "_fetchingSuggestions"))
      -[PXPeopleSuggestionManager cancelPendingSuggestionLoading](self, "cancelPendingSuggestionLoading");
    -[PXPeopleSuggestionManager delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSuggestionManager confirmedSuggestions](self, "confirmedSuggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSuggestionManager suggestionProvider](self, "suggestionProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXPeopleSuggestionManager didReachEnd](self, "didReachEnd"))
      objc_msgSend(v5, "currentSuggestions");
    else
      objc_msgSend(v5, "previousSuggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5;
    -[PXPeopleSuggestionManager setDidReachEnd:](self, "setDidReachEnd:", 0);
    -[PXPeopleSuggestionManager rejectedSuggestions](self, "rejectedSuggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minusSet:", v8);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v4, "containsObject:", v16))
          {
            objc_msgSend(v4, "removeObject:", v16);
            ++v13;
            v12 = v12 + objc_msgSend(v16, "numberOfAssets") - 1;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }

    -[PXPeopleSuggestionManager setAutoConfirmationsCount:](self, "setAutoConfirmationsCount:", -[PXPeopleSuggestionManager autoConfirmationsCount](self, "autoConfirmationsCount") - v12);
    -[PXPeopleSuggestionManager setUserConfirmationsCount:](self, "setUserConfirmationsCount:", -[PXPeopleSuggestionManager userConfirmationsCount](self, "userConfirmationsCount") - v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "confirmationCountUpdatedForSuggestionManager:undoing:", self, 1);
    objc_msgSend(v3, "suggestionManager:hasNewSuggestionsAvailable:", self, v9);

  }
}

- (void)commitUserResponses
{
  id v3;
  id v4;

  -[PXPeopleSuggestionManager person](self, "person");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXPeopleSuggestionManager commitUserResponsesToPerson:](self, "commitUserResponsesToPerson:", v4);

}

- (id)commitUserResponsesToPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (-[PXPeopleSuggestionManager _fetchingSuggestions](self, "_fetchingSuggestions"))
    -[PXPeopleSuggestionManager cancelPendingSuggestionLoading](self, "cancelPendingSuggestionLoading");
  -[PXPeopleSuggestionManager confirmedSuggestions](self, "confirmedSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleSuggestionManager rejectedSuggestions](self, "rejectedSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleSuggestionManager person](self, "person");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v7)
  {
    v9 = (void *)v7;
    if (objc_msgSend(v5, "count"))
    {

LABEL_7:
      -[PXPeopleSuggestionManager dataSource](self, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "commitSuggestionsForPerson:withConfirmedSuggestions:andRejectedSuggestions:", v4, v12, v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    v10 = objc_msgSend(v6, "count");

    v8 = v4;
    if (v10)
      goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (void)cancelPendingSuggestionLoading
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PXPeopleSuggestionManager suggestionToken](self, "suggestionToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXPeopleSuggestionManager dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSuggestionManager person](self, "person");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v6 = objc_msgSend(v4, "cancelSuggestionForPerson:withToken:error:", v5, v3, &v10);
    v7 = v10;

    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "Suggestions UI: Cancel loading more suggestions", buf, 2u);
      }

      -[PXPeopleSuggestionManager setSuggestionToken:](self, "setSuggestionToken:", 0);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Error cancelling suggestion request %@", buf, 0xCu);
      }

    }
  }

}

- (unsigned)_soundIdWithFilename:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFURL *v7;
  SystemSoundID v8;
  SystemSoundID outSystemSoundID;

  outSystemSoundID = 0;
  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "px_bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", v4, CFSTR("caf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    AudioServicesCreateSystemSoundID(v7, &outSystemSoundID);

    v8 = outSystemSoundID;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_playConfirmYesSound
{
  uint64_t v3;
  BOOL v4;

  LODWORD(v3) = -[PXPeopleSuggestionManager confirmYesSoundID](self, "confirmYesSoundID");
  if (!(_DWORD)v3)
  {
    v3 = -[PXPeopleSuggestionManager _soundIdWithFilename:](self, "_soundIdWithFilename:", CFSTR("PXPeopleConfirmYes"));
    -[PXPeopleSuggestionManager setConfirmYesSoundID:](self, "setConfirmYesSoundID:", v3);
  }
  v4 = -[PXPeopleSuggestionManager mute](self, "mute");
  if ((_DWORD)v3)
  {
    if (!v4)
      AudioServicesPlaySystemSound(v3);
  }
}

- (void)_playConfirmNoSound
{
  uint64_t v3;
  BOOL v4;

  LODWORD(v3) = -[PXPeopleSuggestionManager confirmNoSoundID](self, "confirmNoSoundID");
  if (!(_DWORD)v3)
  {
    v3 = -[PXPeopleSuggestionManager _soundIdWithFilename:](self, "_soundIdWithFilename:", CFSTR("PXPeopleConfirmNo"));
    -[PXPeopleSuggestionManager setConfirmNoSoundID:](self, "setConfirmNoSoundID:", v3);
  }
  v4 = -[PXPeopleSuggestionManager mute](self, "mute");
  if ((_DWORD)v3)
  {
    if (!v4)
      AudioServicesPlaySystemSound(v3);
  }
}

- (void)_loadMoreSuggestionsWithCompletion:(id)a3
{
  id v4;
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
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  -[PXPeopleSuggestionManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleSuggestionManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleSuggestionManager person](self, "person");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "willLoadMoreSuggestionsForSuggestionManager:", self);
    v14 = v6;
    objc_initWeak(&location, self);
    -[PXPeopleSuggestionManager confirmedSuggestions](self, "confirmedSuggestions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSuggestionManager rejectedSuggestions](self, "rejectedSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__PXPeopleSuggestionManager__loadMoreSuggestionsWithCompletion___block_invoke;
    v15[3] = &unk_1E513E538;
    objc_copyWeak(&v17, &location);
    v16 = v4;
    v12 = v5;
    objc_msgSend(v5, "suggestionsForPerson:withConfirmedSuggestions:andRejectedSuggestions:completion:", v7, v9, v11, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSuggestionManager setSuggestionToken:](self, "setSuggestionToken:", v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    v5 = v12;
    v6 = v14;
  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)_notifyDelegateWeHaveMoreSuggestions:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v3 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  -[PXPeopleSuggestionManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXPeopleSuggestionManager currentSuggestions](self, "currentSuggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionManager:hasNewSuggestionsAvailable:", self, v6);

  }
  else
  {
    if (PFOSVariantHasInternalUI())
    {
      -[PXPeopleSuggestionManager confirmedSuggestions](self, "confirmedSuggestions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleSuggestionManager rejectedSuggestions](self, "rejectedSuggestions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v9);
            v12 += objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "numberOfAssets");
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
        }
        while (v11);
      }
      else
      {
        v12 = 0;
      }

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = v8;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v15);
            v18 += objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "numberOfAssets", (_QWORD)v24);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
        }
        while (v17);
      }
      else
      {
        v18 = 0;
      }

      PLUIGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = objc_msgSend(v9, "count");
        v23 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 134218752;
        v33 = v22;
        v34 = 2048;
        v35 = v12;
        v36 = 2048;
        v37 = v23;
        v38 = 2048;
        v39 = v18;
        _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEBUG, "[People Suggestions Done] Confirmed:%lu Suggestions (%lu faces)   Rejected:%lu Suggestions (%lu faces)", buf, 0x2Au);
      }

    }
    objc_msgSend(v5, "noMoreSuggestionsAvailableForSuggestionManager:", self, (_QWORD)v24);
  }

}

- (id)_nonSkippedSuggestionsForSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeopleSuggestionManager skippedSuggestions](self, "skippedSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "px_localIdentifier", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "containsObject:", v13);

        if ((v14 & 1) == 0)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)_fetchingSuggestions
{
  void *v2;
  BOOL v3;

  -[PXPeopleSuggestionManager suggestionToken](self, "suggestionToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (PXPeopleSuggestionManagerDelegate)delegate
{
  return (PXPeopleSuggestionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXPeopleSuggestionManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)mute
{
  return self->_mute;
}

- (void)setMute:(BOOL)a3
{
  self->_mute = a3;
}

- (PXPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (unint64_t)userConfirmationsCount
{
  return self->_userConfirmationsCount;
}

- (void)setUserConfirmationsCount:(unint64_t)a3
{
  self->_userConfirmationsCount = a3;
}

- (unint64_t)autoConfirmationsCount
{
  return self->_autoConfirmationsCount;
}

- (void)setAutoConfirmationsCount:(unint64_t)a3
{
  self->_autoConfirmationsCount = a3;
}

- (BOOL)didReachEnd
{
  return self->_didReachEnd;
}

- (void)setDidReachEnd:(BOOL)a3
{
  self->_didReachEnd = a3;
}

- (PXSuggestionToken)suggestionToken
{
  return self->_suggestionToken;
}

- (void)setSuggestionToken:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionToken, a3);
}

- (unsigned)confirmYesSoundID
{
  return self->_confirmYesSoundID;
}

- (void)setConfirmYesSoundID:(unsigned int)a3
{
  self->_confirmYesSoundID = a3;
}

- (unsigned)confirmNoSoundID
{
  return self->_confirmNoSoundID;
}

- (void)setConfirmNoSoundID:(unsigned int)a3
{
  self->_confirmNoSoundID = a3;
}

- (PXPeoplePagingSuggestionProvider)suggestionProvider
{
  return self->_suggestionProvider;
}

- (void)setSuggestionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionProvider, a3);
}

- (NSMutableSet)confirmedSuggestions
{
  return self->_confirmedSuggestions;
}

- (void)setConfirmedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_confirmedSuggestions, a3);
}

- (NSMutableSet)rejectedSuggestions
{
  return self->_rejectedSuggestions;
}

- (void)setRejectedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_rejectedSuggestions, a3);
}

- (NSMutableSet)skippedSuggestions
{
  return self->_skippedSuggestions;
}

- (void)setSkippedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_skippedSuggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skippedSuggestions, 0);
  objc_storeStrong((id *)&self->_rejectedSuggestions, 0);
  objc_storeStrong((id *)&self->_confirmedSuggestions, 0);
  objc_storeStrong((id *)&self->_suggestionProvider, 0);
  objc_storeStrong((id *)&self->_suggestionToken, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __64__PXPeopleSuggestionManager__loadMoreSuggestionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setSuggestionToken:", 0);

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "_nonSkippedSuggestionsForSuggestions:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v11, "count");
  if (v7)
  {
    v8 = objc_loadWeakRetained(v3);
    objc_msgSend(v8, "suggestionProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendSuggestionArray:", v11);

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, BOOL))(v10 + 16))(v10, v7 != 0);

}

void __65__PXPeopleSuggestionManager_requestNextSuggestionsWithPageLimit___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  if ((_DWORD)a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "suggestionProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "nextSuggestionsWithPageLimit:", *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDidReachEnd:", 1);
  }
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v7, "_notifyDelegateWeHaveMoreSuggestions:", a2);

}

void __43__PXPeopleSuggestionManager_setDataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  if ((_DWORD)a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "suggestionProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "nextSuggestionsWithPageLimit:", *(_QWORD *)(a1 + 40));

  }
  v7 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "_notifyDelegateWeHaveMoreSuggestions:", a2);

}

@end
