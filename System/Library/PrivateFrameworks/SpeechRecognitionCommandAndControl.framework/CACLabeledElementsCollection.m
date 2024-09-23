@implementation CACLabeledElementsCollection

+ (id)labeledElementsFromTextMarkerRanges:(id)a3 axElement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double x;
  double y;
  double width;
  double height;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CACLabeledElement *v29;
  CACLabeledElement *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v16 = 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "nsRange");
        objc_msgSend(v6, "rectForRange:", v19, v20);
        x = v39.origin.x;
        y = v39.origin.y;
        width = v39.size.width;
        height = v39.size.height;
        v41.origin.x = v12;
        v41.origin.y = v13;
        v41.size.width = v14;
        v41.size.height = v15;
        if (!CGRectEqualToRect(v39, v41))
        {
          objc_msgSend(v6, "visibleFrame");
          v42.origin.x = v25;
          v42.origin.y = v26;
          v42.size.width = v27;
          v42.size.height = v28;
          v40.origin.x = x;
          v40.origin.y = y;
          v40.size.width = width;
          v40.size.height = height;
          if (CGRectIntersectsRect(v40, v42))
          {
            v29 = -[CACLabeledElement initWithElement:recognitionStrings:rectangle:]([CACLabeledElement alloc], "initWithElement:recognitionStrings:rectangle:", v6, 0, x, y, width, height);
            v30 = v29;
            if (v29)
            {
              -[CACLabeledElement setTextMarkerRange:](v29, "setTextMarkerRange:", v18);
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v16);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[CACLabeledElement setNumberedLabel:](v30, "setNumberedLabel:", v31);

              objc_msgSend(v7, "addObject:", v30);
              ++v16;
            }

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)_elementActionManager
{
  if (_elementActionManager_onceToken_1 != -1)
    dispatch_once(&_elementActionManager_onceToken_1, &__block_literal_global_44);
  return (id)_elementActionManager_sElementActionManager_1;
}

void __53__CACLabeledElementsCollection__elementActionManager__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x24BDFFA58]);
  +[CACAXDragManager sharedManager](CACAXDragManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithDragManager:", v3);
  v2 = (void *)_elementActionManager_sElementActionManager_1;
  _elementActionManager_sElementActionManager_1 = v1;

}

+ (BOOL)canShowElementActionsForElement:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;

  v4 = a3;
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "carPlayConnected");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(a1, "_elementActionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "canShowActionsForElement:", v4);

  }
  return v7;
}

- (CACLabeledElementsCollection)init
{
  CACLabeledElementsCollection *v2;
  CACLabeledElementsCollection *v3;
  uint64_t v4;
  NSMutableDictionary *cachedElementsByTitle;
  uint64_t v6;
  NSMutableDictionary *cachedElementsByTrait;
  uint64_t v8;
  NSMutableArray *cachedElementsSorted;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CACLabeledElementsCollection;
  v2 = -[CACLabeledElementsCollection init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentCollectionTransactionID = 0.0;
    v2->_cachedCollectionTransactionID = 0.0;
    v4 = objc_opt_new();
    cachedElementsByTitle = v3->_cachedElementsByTitle;
    v3->_cachedElementsByTitle = (NSMutableDictionary *)v4;

    v6 = objc_opt_new();
    cachedElementsByTrait = v3->_cachedElementsByTrait;
    v3->_cachedElementsByTrait = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    cachedElementsSorted = v3->_cachedElementsSorted;
    v3->_cachedElementsSorted = (NSMutableArray *)v8;

  }
  return v3;
}

- (id)_initWithCollection:(id)a3
{
  id v4;
  CACLabeledElementsCollection *v5;
  void *v6;
  uint64_t v7;
  NSArray *axElements;
  uint64_t v9;
  NSMutableDictionary *cachedElementsByTitle;
  uint64_t v11;
  NSMutableDictionary *cachedElementsByTrait;
  uint64_t v13;
  NSMutableArray *cachedElementsSorted;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CACLabeledElementsCollection;
  v5 = -[CACLabeledElementsCollection init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "axElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    axElements = v5->_axElements;
    v5->_axElements = (NSArray *)v7;

    v9 = objc_msgSend(v4, "copyTableOfCollectedElementsByTitle");
    cachedElementsByTitle = v5->_cachedElementsByTitle;
    v5->_cachedElementsByTitle = (NSMutableDictionary *)v9;

    v11 = objc_msgSend(v4, "copyTableOfCollectedElementsByTrait");
    cachedElementsByTrait = v5->_cachedElementsByTrait;
    v5->_cachedElementsByTrait = (NSMutableDictionary *)v11;

    v13 = objc_msgSend(v4, "copyListOfCollectedElementsSorted");
    cachedElementsSorted = v5->_cachedElementsSorted;
    v5->_cachedElementsSorted = (NSMutableArray *)v13;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithCollection:", self);
}

- (void)cancelCollecting
{
  CACLabeledElementsCollection *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_currentCollectionTransactionID = 0.0;
  obj->_cachedCollectionTransactionID = 0.0;
  -[NSMutableDictionary removeAllObjects](obj->_cachedElementsByTitle, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](obj->_cachedElementsByTrait, "removeAllObjects");
  -[NSMutableArray removeAllObjects](obj->_cachedElementsSorted, "removeAllObjects");
  objc_sync_exit(obj);

}

- (BOOL)isCollecting
{
  CACLabeledElementsCollection *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentCollectionTransactionID != 0.0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEmpty
{
  CACLabeledElementsCollection *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary count](v2->_cachedElementsByTitle, "count") == 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)updateWithAXElements:(id)a3
{
  double v5;
  double v6;
  CACLabeledElementsCollection *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  id obj;
  char v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v6 = v5;
  v7 = self;
  objc_sync_enter(v7);
  v7->_currentCollectionTransactionID = v6;
  v7->_cachedCollectionTransactionID = v6;
  objc_storeStrong((id *)&v7->_axElements, a3);
  v7->_areElementsNumbered = 0;
  objc_sync_exit(v7);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleId");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v10, "length"))
  {

    v10 = CFSTR("UnknownAppIdentifier");
  }
  objc_msgSend(v28, "setObject:forKey:", v24, v10, v10);
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  if (v7->_currentCollectionTransactionID != v6)
  {
    objc_sync_enter(v7);
LABEL_25:
    -[NSMutableDictionary removeAllObjects](v7->_cachedElementsByTitle, "removeAllObjects");
    -[NSMutableDictionary addEntriesFromDictionary:](v7->_cachedElementsByTitle, "addEntriesFromDictionary:", v11);
    -[NSMutableDictionary removeAllObjects](v7->_cachedElementsByTrait, "removeAllObjects");
    -[NSMutableDictionary addEntriesFromDictionary:](v7->_cachedElementsByTrait, "addEntriesFromDictionary:", v12);
    -[NSMutableArray removeAllObjects](v7->_cachedElementsSorted, "removeAllObjects");
    -[NSMutableArray addObjectsFromArray:](v7->_cachedElementsSorted, "addObjectsFromArray:", v13);
    goto LABEL_26;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v28, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v14)
  {
    v26 = 0;
    v27 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        +[CACAppElementsEvaluationManager sharedManager](CACAppElementsEvaluationManager, "sharedManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKey:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "actionableAXElementsFromAXElements:forAppIdentifier:", v18, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v30 != v21)
                objc_enumerationMutation(v19);
              -[CACLabeledElementsCollection addLabeledElementWithItemElement:elementsByTitle:elementsByTrait:elementsSorted:](v7, "addLabeledElementWithItemElement:elementsByTitle:elementsByTrait:elementsSorted:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j), v11, v12, v13);
              if (v7->_currentCollectionTransactionID != v6)
              {
                v26 = 1;
                goto LABEL_19;
              }
            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v20)
              continue;
            break;
          }
        }
LABEL_19:

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v14);
  }
  else
  {
    v26 = 0;
  }

  objc_sync_enter(v7);
  if ((v26 & 1) == 0)
    goto LABEL_25;
LABEL_26:
  if (v7->_currentCollectionTransactionID == v6)
    v7->_currentCollectionTransactionID = 0.0;
  objc_sync_exit(v7);

}

- (unint64_t)collectionCount
{
  CACLabeledElementsCollection *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](v2->_cachedElementsByTitle, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v4 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "count");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v4;
}

- (id)collectedElements
{
  void *v3;
  CACLabeledElementsCollection *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v3, "addObjectsFromArray:", v4->_cachedElementsSorted);
  objc_sync_exit(v4);

  return v3;
}

- (id)newlyCollectedElements
{
  void *v3;
  CACLabeledElementsCollection *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CACLabeledElementsCollection collectedElements](v4, "collectedElements", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "hasBeenCollected") & 1) == 0)
        {
          objc_msgSend(v3, "addObject:", v9);
          objc_msgSend(v9, "setHasBeenCollected:", 1);
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (void)resetCollectedFlagForAllElements
{
  CACLabeledElementsCollection *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CACLabeledElementsCollection collectedElements](v2, "collectedElements", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setHasBeenCollected:", 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (id)copyTableOfCollectedElementsByTitle
{
  void *v3;
  CACLabeledElementsCollection *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4->_cachedElementsByTitle;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](v4->_cachedElementsByTitle, "objectForKey:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");

        objc_msgSend(v3, "setObject:forKey:", v11, v9);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)copyListOfCollectedElementsSorted
{
  void *v3;
  CACLabeledElementsCollection *v4;

  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v3, "addObjectsFromArray:", v4->_cachedElementsSorted);
  objc_sync_exit(v4);

  return v3;
}

- (id)collectedElementsWithTitle:(id)a3
{
  id v4;
  CACLabeledElementsCollection *v5;
  NSMutableDictionary *cachedElementsByTitle;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  cachedElementsByTitle = v5->_cachedElementsByTitle;
  objc_msgSend(v4, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cachedElementsByTitle, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_sync_exit(v5);
  return v9;
}

- (id)copyTableOfCollectedElementsByTrait
{
  void *v3;
  CACLabeledElementsCollection *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4->_cachedElementsByTrait;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](v4->_cachedElementsByTrait, "objectForKey:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");

        objc_msgSend(v3, "setObject:forKey:", v11, v9);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)collectedElementsWithTrait:(unint64_t)a3
{
  CACLabeledElementsCollection *v4;
  NSMutableDictionary *cachedElementsByTrait;
  void *v6;
  void *v7;
  void *v8;

  v4 = self;
  objc_sync_enter(v4);
  cachedElementsByTrait = v4->_cachedElementsByTrait;
  -[CACLabeledElementsCollection _keyFromTrait:](v4, "_keyFromTrait:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cachedElementsByTrait, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_sync_exit(v4);
  return v8;
}

- (void)addLabeledElementWithItemElement:(id)a3 elementsByTitle:(id)a4 elementsByTrait:(id)a5 elementsSorted:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  char v19;
  CACLabeledElement *v20;
  CACLabeledElement *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  CACLabeledElementsCollection *obj;
  id v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v39 = a5;
  v37 = a6;
  v12 = (void *)MEMORY[0x24BDBCEB8];
  v40 = v10;
  objc_msgSend(v10, "recognitionStrings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v10, "recognitionStrings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithArray:", v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v12, "arrayWithArray:", MEMORY[0x24BDBD1A8]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v15 = v41;
  if (objc_msgSend(v41, "count"))
  {
    v16 = 0;
    do
    {
      +[CACAppElementsEvaluationManager sharedManager](CACAppElementsEvaluationManager, "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndex:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isRecognitionString:supportedForElement:", v18, v10);

      if ((v19 & 1) != 0)
      {
        ++v16;
        v15 = v41;
      }
      else
      {
        v15 = v41;
        objc_msgSend(v41, "removeObjectAtIndex:", v16);
      }
    }
    while (v16 < objc_msgSend(v15, "count"));
  }
  v20 = [CACLabeledElement alloc];
  objc_msgSend(v10, "visibleFrame");
  v21 = -[CACLabeledElement initWithElement:recognitionStrings:rectangle:](v20, "initWithElement:recognitionStrings:rectangle:", v10, v15);
  if (v21)
  {
    obj = self;
    objc_sync_enter(obj);
    -[CACLabeledElement element](v21, "element");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[CACLabeledElementsCollection canShowElementActionsForElement:](CACLabeledElementsCollection, "canShowElementActionsForElement:", v22))
    {
      v23 = 2;
    }
    else
    {
      v23 = 0;
    }
    -[CACLabeledElement setBadgeIndicatorMask:](v21, "setBadgeIndicatorMask:", v23);

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v24 = v15;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v43 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v28, "lowercaseString");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "lowercaseString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKey:", v30, v31);

          }
          objc_msgSend(v30, "addObject:", v21);

        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v25);
    }

    v32 = objc_msgSend(v40, "traits");
    v33 = 1;
    v34 = 64;
    do
    {
      if ((v33 & v32) != 0)
      {
        -[CACLabeledElementsCollection _keyFromTrait:](obj, "_keyFromTrait:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKey:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKey:", v36, v35);
        }
        objc_msgSend(v36, "addObject:", v21);

      }
      v33 *= 2;
      --v34;
    }
    while (v34);
    objc_msgSend(v37, "addObject:", v21);
    objc_sync_exit(obj);

  }
}

- (id)_keyFromTrait:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), a3);
}

- (NSArray)axElements
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAxElements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)cachedCollectionTransactionID
{
  return self->_cachedCollectionTransactionID;
}

- (BOOL)areElementsNumbered
{
  return self->_areElementsNumbered;
}

- (void)setAreElementsNumbered:(BOOL)a3
{
  self->_areElementsNumbered = a3;
}

- (double)finishedTime
{
  return self->_finishedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedElementsSorted, 0);
  objc_storeStrong((id *)&self->_cachedElementsByTrait, 0);
  objc_storeStrong((id *)&self->_cachedElementsByTitle, 0);
  objc_storeStrong((id *)&self->_axElements, 0);
}

@end
