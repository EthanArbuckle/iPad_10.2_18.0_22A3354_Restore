@implementation WBSTabOrderManager

- (void)setTabOrderProvider:(id)a3
{
  objc_storeWeak((id *)&self->_tabOrderProvider, a3);
}

- (WBSTabOrderManager)init
{
  WBSTabOrderManager *v2;
  uint64_t v3;
  NSMutableDictionary *simplifiedIdentifierMap;
  WBSTabOrderManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSTabOrderManager;
  v2 = -[WBSTabOrderManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    simplifiedIdentifierMap = v2->_simplifiedIdentifierMap;
    v2->_simplifiedIdentifierMap = (NSMutableDictionary *)v3;

    objc_storeWeak((id *)&v2->_preferenceProvider, v2);
    v5 = v2;
  }

  return v2;
}

- (id)tabToInsertNewTabAfterForPosition:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[WBSTabOrderManager tabInsertionHintForPosition:](self, "tabInsertionHintForPosition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabToInsertAfter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tabInsertionHintForPosition:(unint64_t)a3
{
  return -[WBSTabOrderManager _tabInsertionHintForPosition:isBlankTab:](self, "_tabInsertionHintForPosition:isBlankTab:", a3, 0);
}

- (id)_tabInsertionHintForPosition:(unint64_t)a3 isBlankTab:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  WBSTabOrderInsertionHint *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WBSTabOrderManager *v13;
  unint64_t v14;
  WBSTabOrderInsertionHint *v15;

  v4 = a4;
  -[WBSTabOrderManager tabOrderProvider](self, "tabOrderProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTabForTabOrderProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (objc_msgSend(v7, "numberOfTabs"))
    {
      switch(a3)
      {
        case 0uLL:
          -[WBSTabOrderManager _tabInsertionHintForNewTabAfterTab:relation:](self, "_tabInsertionHintForNewTabAfterTab:relation:", v8, 0);
          v9 = (WBSTabOrderInsertionHint *)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 1uLL:
          v10 = -[WBSTabOrderManager _indexOfTabToInsertNewTabAfter](self, "_indexOfTabToInsertNewTabAfter");
          v11 = !v4 || v10 != objc_msgSend(v7, "numberOfTabs") - 1;
          goto LABEL_14;
        case 2uLL:
          v10 = -[WBSTabOrderManager _indexOfLastRelatedTab](self, "_indexOfLastRelatedTab");
          if (v4)
            v11 = 2 * (v10 != objc_msgSend(v7, "numberOfTabs") - 1);
          else
            v11 = 2;
LABEL_14:
          v14 = -[WBSTabOrderManager _relationConsideringUserPreferenceForRelation:isBlankTab:](self, "_relationConsideringUserPreferenceForRelation:isBlankTab:", v11, v4);
          v13 = self;
          v12 = v10;
          break;
        case 3uLL:
          v12 = objc_msgSend(v7, "numberOfTabs") - 1;
          v13 = self;
          v14 = 0;
          break;
        default:
          goto LABEL_5;
      }
      -[WBSTabOrderManager _insertionHintWithIndexOfTabToInsertAfter:relation:](v13, "_insertionHintWithIndexOfTabToInsertAfter:relation:", v12, v14);
      v9 = (WBSTabOrderInsertionHint *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = -[WBSTabOrderInsertionHint initWithTabToInsertAfter:insertionIndex:relation:]([WBSTabOrderInsertionHint alloc], "initWithTabToInsertAfter:insertionIndex:relation:", 0, 0, 0);
    }
  }
  else
  {
LABEL_5:
    -[WBSTabOrderManager _insertionHintWithTabToInsertAfter:relation:](self, "_insertionHintWithTabToInsertAfter:relation:", 0, 0);
    v9 = (WBSTabOrderInsertionHint *)objc_claimAutoreleasedReturnValue();
  }
LABEL_16:
  v15 = v9;

  return v15;
}

- (id)_tabInsertionHintForNewTabAfterTab:(id)a3 relation:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a3;
  if ((objc_msgSend(v6, "isPinnedTab") & 1) != 0)
  {
    -[WBSTabOrderManager tabOrderProvider](self, "tabOrderProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexForTab:", v6);
    v9 = objc_msgSend(v7, "numberOfTabs");
    if (v8 >= v9)
    {
      v11 = v8;
    }
    else
    {
      v10 = v9;
      v11 = v8;
      do
      {
        objc_msgSend(v7, "tabAtIndex:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isPinnedTab");

        if (v13)
          v11 = v8;
        ++v8;
      }
      while (v10 != v8);
    }
    -[WBSTabOrderManager _insertionHintWithIndexOfTabToInsertAfter:relation:](self, "_insertionHintWithIndexOfTabToInsertAfter:relation:", v11, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WBSTabOrderManager _insertionHintWithTabToInsertAfter:relation:](self, "_insertionHintWithTabToInsertAfter:relation:", v6, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)tabInsertionHintForDuplicateOfTab:(id)a3
{
  return -[WBSTabOrderManager _tabInsertionHintForNewTabAfterTab:relation:](self, "_tabInsertionHintForNewTabAfterTab:relation:", a3, 1);
}

- (unint64_t)_indexOfTabToInsertNewTabAfter
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v16;
  uint64_t v17;

  -[WBSTabOrderManager tabOrderProvider](self, "tabOrderProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTabForTabOrderProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "numberOfTabs");
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "indexOfSelectedTab");
  if (v6 >= v4)
    goto LABEL_18;
  v7 = v6;
  v8 = 0;
  v16 = v3;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    objc_msgSend(v2, "tabAtIndex:", v7, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isPinnedTab") & 1) != 0)
      goto LABEL_13;
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", v5))
    {

    }
    else
    {
      objc_msgSend(v10, "ancestorTabIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v5);

      if ((v13 & 1) == 0)
      {
        v14 = v17;
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          v14 = v7;
        v17 = v14;
        goto LABEL_13;
      }
    }
    v8 = 1;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL && v7 - 1 != v9)
    {

      v3 = v16;
      goto LABEL_17;
    }
    v9 = v7;
LABEL_13:

    ++v7;
  }
  while (v4 != v7);
  v3 = v16;
  if ((v8 & 1) != 0)
    goto LABEL_20;
LABEL_17:
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_18:
    v9 = v4 - 1;
  else
    v9 = v17 - 1;
LABEL_20:

  return v9;
}

- (unint64_t)_indexOfLastRelatedTab
{
  WBSTabOrderManager *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  unint64_t v12;

  v2 = self;
  -[WBSTabOrderManager tabOrderProvider](self, "tabOrderProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTabForTabOrderProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "numberOfTabs");
  v6 = objc_msgSend(v3, "indexOfSelectedTab");
  if (v6 >= v5)
  {
    v8 = 0;
    goto LABEL_18;
  }
  v7 = v6;
  v8 = 1;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    objc_msgSend(v3, "tabAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isPinnedTab") & 1) == 0)
      break;
LABEL_10:

    v8 = ++v7 < v5;
    if (v5 == v7)
    {
      v8 = 0;
      goto LABEL_17;
    }
  }
  if (-[WBSTabOrderManager _tab:isRelatedOrEqualToTab:](v2, "_tab:isRelatedOrEqualToTab:", v10, v4))
  {
    if (v7 - 1 == v9 || v9 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = v7;
    goto LABEL_10;
  }
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v2 = (WBSTabOrderManager *)(v5 - 1);
  else
    v2 = (WBSTabOrderManager *)v9;

LABEL_17:
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_18:
    v9 = v5 - 1;
  if (v8)
    v12 = (unint64_t)v2;
  else
    v12 = v9;

  return v12;
}

- (id)tabToInsertNewBlankTabAfter
{
  void *v2;
  void *v3;

  -[WBSTabOrderManager tabInsertionHintForNewBlankTab](self, "tabInsertionHintForNewBlankTab");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabToInsertAfter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tabInsertionHintForNewBlankTab
{
  return -[WBSTabOrderManager _tabInsertionHintForNewBlankTabWithRecommendedPosition:](self, "_tabInsertionHintForNewBlankTabWithRecommendedPosition:", -[WBSTabOrderManager _userPreferredNewBlankTabPositionInCurrentContext:](self, "_userPreferredNewBlankTabPositionInCurrentContext:", 0));
}

- (id)_tabInsertionHintForNewBlankTabWithRecommendedPosition:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v15;

  -[WBSTabOrderManager tabOrderProvider](self, "tabOrderProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedTabForTabOrderProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isPinnedTab"))
  {
    -[WBSTabOrderManager _tabInsertionHintForPosition:isBlankTab:](self, "_tabInsertionHintForPosition:isBlankTab:", 3, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_preferenceProvider);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v10 = v9;
    objc_msgSend(v6, "lastActivationTime");
    v12 = v11;
    objc_msgSend(WeakRetained, "minimumDelayForRelatingNewBlankTab");
    if (v10 - v12 >= v13 || v12 == 0.0)
      v15 = a3;
    else
      v15 = 3;
    -[WBSTabOrderManager _tabInsertionHintForPosition:isBlankTab:](self, "_tabInsertionHintForPosition:isBlankTab:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)tabInsertionHintForNewBlankTabInCurrentContext
{
  return -[WBSTabOrderManager _tabInsertionHintForNewBlankTabWithRecommendedPosition:](self, "_tabInsertionHintForNewBlankTabWithRecommendedPosition:", -[WBSTabOrderManager _userPreferredNewBlankTabPositionInCurrentContext:](self, "_userPreferredNewBlankTabPositionInCurrentContext:", 1));
}

- (id)tabToInsertSpawnedTabAfter
{
  void *v2;
  void *v3;

  -[WBSTabOrderManager tabInsertionHintForSpawnedTab](self, "tabInsertionHintForSpawnedTab");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabToInsertAfter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tabInsertionHintForSpawnedTab
{
  return -[WBSTabOrderManager _tabInsertionHintForPosition:isBlankTab:](self, "_tabInsertionHintForPosition:isBlankTab:", -[WBSTabOrderManager _userPreferredNewSpawnedTabPosition](self, "_userPreferredNewSpawnedTabPosition"), 0);
}

- (id)tabInsertionHintForNewTabOfType:(int64_t)a3
{
  const char *v3;

  switch(a3)
  {
    case 2:
      -[WBSTabOrderManager tabInsertionHintForSpawnedTab](self, "tabInsertionHintForSpawnedTab");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[WBSTabOrderManager tabInsertionHintForNewBlankTabInCurrentContext](self, "tabInsertionHintForNewBlankTabInCurrentContext");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      -[WBSTabOrderManager tabInsertionHintForNewBlankTab](self, "tabInsertionHintForNewBlankTab");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      a2 = v3;
      break;
  }
  return (id)(id)a2;
}

- (unint64_t)_userPreferredNewBlankTabPositionInCurrentContext:(BOOL)a3
{
  id WeakRetained;
  int v5;
  unint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_preferenceProvider);
  v5 = objc_msgSend(WeakRetained, "newBlankTabPositionAppliesToAllBlankTabs");
  if (a3 || v5)
    v6 = objc_msgSend(WeakRetained, "newTabPosition");
  else
    v6 = 3;

  return v6;
}

- (unint64_t)_userPreferredNewSpawnedTabPosition
{
  if (-[WBSTabOrderManager _newTabPositionPreferenceAppliesToSwawnedTabs](self, "_newTabPositionPreferenceAppliesToSwawnedTabs"))
  {
    return -[WBSTabOrderManager _userPreferredNewBlankTabPositionInCurrentContext:](self, "_userPreferredNewBlankTabPositionInCurrentContext:", 1);
  }
  else
  {
    return 1;
  }
}

- (BOOL)_newTabPositionPreferenceAppliesToSwawnedTabs
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_preferenceProvider);
  v3 = objc_msgSend(WeakRetained, "newTabPositionAppliesToSpawnedTabs");

  return v3;
}

- (id)tabToSelectBeforeClosingTabs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSSet *v7;
  NSSet *closingTabs;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  WBSTabOrderManager *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  int v27;
  void *v28;
  _BOOL4 v29;
  _QWORD v30[5];

  v4 = a3;
  -[WBSTabOrderManager tabOrderProvider](self, "tabOrderProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "numberOfTabs") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    closingTabs = self->_closingTabs;
    self->_closingTabs = v7;

    v9 = objc_alloc_init(MEMORY[0x1E0D89D00]);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __51__WBSTabOrderManager_tabToSelectBeforeClosingTabs___block_invoke;
    v30[3] = &unk_1E4B2A078;
    v30[4] = self;
    objc_msgSend(v9, "setHandler:", v30);
    objc_msgSend(v5, "selectedTabForTabOrderProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (-[NSSet containsObject:](self->_closingTabs, "containsObject:", v10))
      {
        if (objc_msgSend(v10, "shouldSelectOriginatingTabWhenClosed"))
        {
          objc_msgSend(v5, "originatingTabForTab:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v11;
          if (v11)
          {
            objc_msgSend(v11, "windowIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "windowIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "isEqualToString:", v13);

            if ((v14 & 1) != 0)
              goto LABEL_17;
          }

        }
        v15 = objc_msgSend(v5, "indexOfSelectedTab");
        v16 = objc_msgSend(v5, "numberOfTabs");
        if (v15)
        {
          if (v15 != v16 - 1)
          {
            -[WBSTabOrderManager _nextNonClosedTabAdjacentToIndex:inAscendingOrder:](self, "_nextNonClosedTabAdjacentToIndex:inAscendingOrder:", v15, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSTabOrderManager _nextNonClosedTabAdjacentToIndex:inAscendingOrder:](self, "_nextNonClosedTabAdjacentToIndex:inAscendingOrder:", v15, 0);
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v23;
            if (v22 && v23)
            {
              v25 = -[WBSTabOrderManager tab:isInSameSetAsTab:](self, "tab:isInSameSetAsTab:", v10, v23);
              v26 = -[WBSTabOrderManager tab:isInSameSetAsTab:](self, "tab:isInSameSetAsTab:", v10, v22);
              v27 = !v25 || v26;
              if (v27)
                v28 = v22;
              else
                v28 = v24;
              if (v27 == 1 && !v26)
              {
                v29 = -[WBSTabOrderManager _tab:isRelatedOrEqualToTab:](self, "_tab:isRelatedOrEqualToTab:", v10, v24);
                if (((v29 | -[WBSTabOrderManager _tab:isRelatedOrEqualToTab:](self, "_tab:isRelatedOrEqualToTab:", v10, v22)) & v29) != 0)v28 = v24;
                else
                  v28 = v22;
              }
            }
            else if (v22)
            {
              v28 = v22;
            }
            else
            {
              v28 = (void *)v23;
            }
            v6 = v28;

            goto LABEL_17;
          }
          v17 = self;
          v18 = v15;
          v19 = 0;
        }
        else
        {
          v17 = self;
          v18 = 0;
          v19 = 1;
        }
        -[WBSTabOrderManager _nextNonClosedTabAdjacentToIndex:inAscendingOrder:](v17, "_nextNonClosedTabAdjacentToIndex:inAscendingOrder:", v18, v19);
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = v10;
      }
      v6 = v20;
    }
    else
    {
      v6 = 0;
    }
LABEL_17:

    goto LABEL_18;
  }
  v6 = 0;
LABEL_18:

  return v6;
}

void __51__WBSTabOrderManager_tabToSelectBeforeClosingTabs___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (BOOL)tab:(id)a3 isInSameSetAsTab:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "ancestorTabIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ancestorTabIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
  {
    v10 = (void *)objc_msgSend(v8, "count");
    if (v10 == (void *)objc_msgSend(v9, "count"))
    {
      objc_msgSend(v8, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v4);
LABEL_15:

      goto LABEL_16;
    }
    v12 = objc_msgSend(v8, "count");
    if (v12)
    {
      objc_msgSend(v8, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", v4) & 1) != 0)
      {
        v11 = 1;
        goto LABEL_15;
      }
      if (!objc_msgSend(v9, "count"))
      {
        v11 = 0;
        goto LABEL_15;
      }
LABEL_12:
      objc_msgSend(v9, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "isEqualToString:", v14);

      if (!v12)
        goto LABEL_16;
      goto LABEL_15;
    }
    if (objc_msgSend(v9, "count"))
      goto LABEL_12;
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
LABEL_16:

  return v11;
}

- (BOOL)_tab:(id)a3 isRelatedOrEqualToTab:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "ancestorTabIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ancestorTabIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) == 0)
  {
    if (!objc_msgSend(v8, "count") && !objc_msgSend(v9, "count"))
    {
      v12 = 0;
      goto LABEL_19;
    }
    v13 = objc_msgSend(v8, "count");
    if (v13)
    {
      objc_msgSend(v7, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "containsObject:", v4) & 1) != 0)
      {
        v12 = 1;
LABEL_18:

        goto LABEL_19;
      }
      if (objc_msgSend(v9, "count"))
        goto LABEL_11;

    }
    else if (objc_msgSend(v9, "count"))
    {
LABEL_11:
      objc_msgSend(v6, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v9, "containsObject:", v14);

      if (v13)
      if ((v15 & 1) != 0)
        goto LABEL_2;
    }
    objc_msgSend(v8, "count");
    objc_msgSend(v9, "count");
    objc_msgSend(v8, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "isEqualToString:", v16);

    goto LABEL_18;
  }
LABEL_2:
  v12 = 1;
LABEL_19:

  return v12;
}

- (id)simplifiedIdentifierForDisplayInTabTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_simplifiedIdentifierMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), self->_nextSimplifiedIdentifier);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_simplifiedIdentifierMap, "setObject:forKeyedSubscript:", v7, v4);
    ++self->_nextSimplifiedIdentifier;
  }

  return v7;
}

- (unint64_t)newTabPosition
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_numberForKey:", CFSTR("WBSNewTabPositionPreferenceKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
    if (v4 >= 4)
      v5 = 1;
    else
      v5 = v4;
  }
  else
  {
    v5 = 2;
  }

  return v5;
}

- (BOOL)newTabPositionAppliesToSpawnedTabs
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSNewTabPositionAppliesToSpawnedTabsPreferenceKey"));

  return v3;
}

- (BOOL)newBlankTabPositionAppliesToAllBlankTabs
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSNewBlankTabPositionAppliesToAllBlankTabsPreferenceKey"));

  return v3;
}

- (BOOL)suppressRelatingNewBlankTabs
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WBSTabOrderManagerSuppressRelatingNewBlankTabsPreferenceKey"));

  return v3;
}

- (double)minimumDelayForRelatingNewBlankTab
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("WBSNewBlankTabPositionDelayPreferenceKey"));
  v4 = v3;

  return v4;
}

- (id)_insertionHintWithIndexOfTabToInsertAfter:(unint64_t)a3 relation:(unint64_t)a4
{
  WBSTabOrderInsertionHint *v7;
  void *v8;
  void *v9;
  WBSTabOrderInsertionHint *v10;

  v7 = [WBSTabOrderInsertionHint alloc];
  -[WBSTabOrderManager tabOrderProvider](self, "tabOrderProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tabAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WBSTabOrderInsertionHint initWithTabToInsertAfter:insertionIndex:relation:](v7, "initWithTabToInsertAfter:insertionIndex:relation:", v9, a3 + 1, a4);

  return v10;
}

- (id)_insertionHintWithTabToInsertAfter:(id)a3 relation:(unint64_t)a4
{
  id v6;
  WBSTabOrderInsertionHint *v7;
  WBSTabOrderInsertionHint *v8;
  void *v9;
  WBSTabOrderInsertionHint *v10;

  v6 = a3;
  v7 = [WBSTabOrderInsertionHint alloc];
  v8 = v7;
  if (v6)
  {
    -[WBSTabOrderManager tabOrderProvider](self, "tabOrderProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WBSTabOrderInsertionHint initWithTabToInsertAfter:insertionIndex:relation:](v8, "initWithTabToInsertAfter:insertionIndex:relation:", v6, objc_msgSend(v9, "indexForTab:", v6) + 1, a4);

  }
  else
  {
    v10 = -[WBSTabOrderInsertionHint initWithTabToInsertAfter:relation:](v7, "initWithTabToInsertAfter:relation:", 0, a4);
  }

  return v10;
}

- (unint64_t)_relationConsideringUserPreferenceForRelation:(unint64_t)a3 isBlankTab:(BOOL)a4
{
  unint64_t v4;
  id WeakRetained;

  v4 = a3;
  if (a4 && a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_preferenceProvider);
    if (objc_msgSend(WeakRetained, "suppressRelatingNewBlankTabs"))
      v4 = 0;

  }
  return v4;
}

- (id)_nextNonClosedTabAdjacentToIndex:(unint64_t)a3 inAscendingOrder:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;

  v4 = a4;
  -[WBSTabOrderManager tabOrderProvider](self, "tabOrderProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    v9 = 1;
  else
    v9 = -1;
  v10 = objc_msgSend(v7, "numberOfTabs");
  v11 = 0;
  if ((uint64_t)(v9 + a3) < v10 && ((v9 + a3) & 0x8000000000000000) == 0)
  {
    v12 = v10;
    v13 = 2 * v9;
    do
    {
      objc_msgSend(v8, "tabAtIndex:", v9 + a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && !-[NSSet containsObject:](self->_closingTabs, "containsObject:", v11))
        break;

      v11 = 0;
      v14 = v13 + a3;
      if ((uint64_t)(v13 + a3) >= v12)
        break;
      a3 += v9;
    }
    while ((v14 & 0x8000000000000000) == 0);
  }

  return v11;
}

- (WBSTabOrderProvider)tabOrderProvider
{
  return (WBSTabOrderProvider *)objc_loadWeakRetained((id *)&self->_tabOrderProvider);
}

- (WBSTabOrderPreferenceProviding)preferenceProvider
{
  return (WBSTabOrderPreferenceProviding *)objc_loadWeakRetained((id *)&self->_preferenceProvider);
}

- (void)setPreferenceProvider:(id)a3
{
  objc_storeWeak((id *)&self->_preferenceProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_preferenceProvider);
  objc_destroyWeak((id *)&self->_tabOrderProvider);
  objc_storeStrong((id *)&self->_simplifiedIdentifierMap, 0);
  objc_storeStrong((id *)&self->_closingTabs, 0);
}

@end
