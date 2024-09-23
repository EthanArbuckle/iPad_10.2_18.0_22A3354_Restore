@implementation SUPurchaseBatch

- (SUPurchaseBatch)initWithItems:(id)a3
{
  return -[SUPurchaseBatch initWithItems:offers:](self, "initWithItems:offers:", a3, 0);
}

- (SUPurchaseBatch)initWithItems:(id)a3 offers:(id)a4
{
  SUPurchaseBatch *v6;

  v6 = -[SUPurchaseBatch init](self, "init");
  if (v6)
  {
    v6->_items = (NSArray *)objc_msgSend(a3, "copy");
    v6->_offers = (NSArray *)objc_msgSend(a4, "copy");
    -[SUPurchaseBatch _validateItems](v6, "_validateItems");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUPurchaseBatch;
  -[SUPurchaseBatch dealloc](&v3, sel_dealloc);
}

- (void)setDocumentTargetIdentifier:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = -[SUPurchaseBatch validPurchases](self, "validPurchases");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v8 = *MEMORY[0x24BEB2358];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v10, "setValue:forDownloadProperty:", a3, v8);
        else
          objc_msgSend(v10, "setValue:forProperty:", a3, v8);
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
}

- (void)setPurchasesAndContinuationsFromPurchases:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v5 = -[SUPurchaseBatch copyContinuationsForPurchases:](self, "copyContinuationsForPurchases:", v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "purchase");
        if (v10)
          objc_msgSend(v4, "removeObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  -[SUPurchaseBatch setContinuations:](self, "setContinuations:", v5);
  -[SUPurchaseBatch setValidPurchases:](self, "setValidPurchases:", v4);

}

- (id)copyContinuationsForPurchases:(id)a3
{
  return 0;
}

- (void)errorEqualCallback
{
  return __SUPurchaseBatchErrorEqual;
}

- (id)everythingFailedErrorForError:(id)a3
{
  return a3;
}

- (id)mergedErrorForError:(id)a3 withCount:(int64_t)a4
{
  return a3;
}

- (id)_copyModifiedErrorsFromDictionary:(__CFDictionary *)a3
{
  id v5;
  _QWORD v7[2];

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7[0] = v5;
  v7[1] = self;
  CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)__SUPurchaseBatchAddModifiedError, v7);
  return v5;
}

- (id)_copyUniqueErrorsFromErrors:(id)a3
{
  __int128 v5;
  CFMutableDictionaryRef v6;
  const __CFDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const void *v12;
  char *Value;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CFDictionaryKeyCallBacks keyCallBacks;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = *(_OWORD *)(MEMORY[0x24BDBD6A0] + 16);
  *(_OWORD *)&keyCallBacks.version = *MEMORY[0x24BDBD6A0];
  *(_OWORD *)&keyCallBacks.release = v5;
  keyCallBacks.hash = (CFDictionaryHashCallBack)__SUPurchaseBatchErrorHash;
  keyCallBacks.equal = (CFDictionaryEqualCallBack)-[SUPurchaseBatch errorEqualCallback](self, "errorEqualCallback");
  v6 = CFDictionaryCreateMutable(0, 0, &keyCallBacks, 0);
  if (!v6)
    return 0;
  v7 = v6;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(a3);
        v12 = *(const void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        Value = (char *)CFDictionaryGetValue(v7, v12);
        CFDictionarySetValue(v7, v12, Value + 1);
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v9);
  }
  v14 = -[SUPurchaseBatch _copyModifiedErrorsFromDictionary:](self, "_copyModifiedErrorsFromDictionary:", v7);
  CFRelease(v7);
  return v14;
}

- (id)_copyValidPurchasesForItems:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  int64_t v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = +[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource");
  v7 = -[NSArray count](self->_offers, "count");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a3;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = (id)objc_msgSend(v12, "defaultStoreOffer");
        if (v7 >= 1)
        {
          v14 = -[NSArray indexOfObjectIdenticalTo:](self->_items, "indexOfObjectIdenticalTo:", v12);
          if (v14 < v7)
            v13 = -[NSArray objectAtIndex:](self->_offers, "objectAtIndex:", v14);
        }
        v15 = (void *)objc_msgSend(v6, "newExternalDownloadWithItem:storeOffer:", v12, v13);
        if (v15 || (v15 = (void *)objc_msgSend(v6, "newPurchaseWithItem:storeOffer:", v12, v13)) != 0)
          objc_msgSend(v5, "addObject:", v15);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  return v5;
}

- (void)_validateItems
{
  id v3;
  id v4;

  v4 = -[SUPurchaseBatch copyFilteredItemsFromItems:](self, "copyFilteredItemsFromItems:", self->_items);
  v3 = -[SUPurchaseBatch _copyValidPurchasesForItems:](self, "_copyValidPurchasesForItems:", v4);
  -[SUPurchaseBatch setPurchasesAndContinuationsFromPurchases:](self, "setPurchasesAndContinuationsFromPurchases:", v3);

}

- (NSArray)continuations
{
  return self->_continuations;
}

- (void)setContinuations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)offers
{
  return self->_offers;
}

- (SUPurchaseManager)purchaseManager
{
  return self->_purchaseManager;
}

- (void)setPurchaseManager:(id)a3
{
  self->_purchaseManager = (SUPurchaseManager *)a3;
}

- (NSArray)validPurchases
{
  return self->_validPurchases;
}

- (void)setValidPurchases:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
