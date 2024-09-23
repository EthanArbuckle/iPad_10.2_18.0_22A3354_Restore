@implementation SXPresentationAttributesManager

- (SXPresentationAttributesManager)init
{
  SXPresentationAttributesManager *v2;
  uint64_t v3;
  NSHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXPresentationAttributesManager;
  v2 = -[SXPresentationAttributesManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 5, 0);
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

  }
  return v2;
}

- (void)attributesChangedFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SXPresentationAttributesManager observers](self, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "presentationAttributesDidChangeFrom:toAttributes:", v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)updateAttributes:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  SXPresentationAttributes *v9;
  SXPresentationAttributes *presentationAttributes;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXPresentationAttributesManager presentationAttributes](self, "presentationAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl(&dword_217023000, v7, OS_LOG_TYPE_DEFAULT, "Updating presentation attributes: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    -[SXPresentationAttributesManager presentationAttributes](self, "presentationAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (SXPresentationAttributes *)objc_msgSend(v4, "copy");
    presentationAttributes = self->_presentationAttributes;
    self->_presentationAttributes = v9;

    -[SXPresentationAttributesManager presentationAttributes](self, "presentationAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXPresentationAttributesManager attributesChangedFrom:to:](self, "attributesChangedFrom:to:", v8, v11);

  }
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SXPresentationAttributesManager observers](self, "observers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SXPresentationAttributesManager observers](self, "observers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (SXPresentationAttributes)presentationAttributes
{
  return self->_presentationAttributes;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_presentationAttributes, 0);
}

@end
