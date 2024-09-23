@implementation ISPersonalizeOffersRequest

- (ISPersonalizeOffersRequest)initWithItems:(id)a3
{
  ISPersonalizeOffersRequest *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)ISPersonalizeOffersRequest;
  v4 = -[ISPersonalizeOffersRequest init](&v18, sel_init);
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(a3);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v10 = objc_msgSend((id)objc_msgSend(v9, "ITunesStoreIdentifier"), "stringValue");
          v11 = objc_msgSend(v9, "itemKind");
          if (v10)
            v12 = v11 == 0;
          else
            v12 = 1;
          if (!v12)
            -[ISPersonalizeOffersRequest addItemIdentifier:forItemType:](v4, "addItemIdentifier:forItemType:", v10, v11);
        }
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v6);
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISPersonalizeOffersRequest;
  -[ISPersonalizeOffersRequest dealloc](&v3, sel_dealloc);
}

- (void)addItemIdentifier:(id)a3 forItemType:(id)a4
{
  NSMutableDictionary *itemIDsByType;
  id v8;
  id v9;
  id v10;

  itemIDsByType = self->_itemIDsByType;
  if (!itemIDsByType)
  {
    itemIDsByType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    self->_itemIDsByType = itemIDsByType;
  }
  v8 = (id)-[NSMutableDictionary objectForKey:](itemIDsByType, "objectForKey:", a4);
  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[NSMutableDictionary setObject:forKey:](self->_itemIDsByType, "setObject:forKey:", v9, a4);
    v8 = v9;
  }
  v10 = v8;
  objc_msgSend(v8, "addObject:", a3);

}

- (NSArray)allItemTypes
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_itemIDsByType, "allKeys");
}

- (id)itemIdentifiersForItemType:(id)a3
{
  return (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_itemIDsByType, "objectForKey:", a3), "allObjects");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = -[NSNumber copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v5[2] = -[NSMutableDictionary mutableCopyWithZone:](self->_itemIDsByType, "mutableCopyWithZone:", a3);
  return v5;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
