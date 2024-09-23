@implementation TUIRootBox

- (TUIRootBox)init
{
  TUIRootBox *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIRootBox;
  result = -[TUIBox init](&v3, "init");
  if (result)
    *(_WORD *)&result->_flags = 0;
  return result;
}

- (unint64_t)directEnvironmentUseMask
{
  return (unint64_t)self->_flags;
}

- (void)setDirectEnvironmentUseMask:(unint64_t)a3
{
  *(_BYTE *)&self->_flags = a3;
}

- (unint64_t)descendentEnvironmentUseMask
{
  return *((unsigned __int8 *)&self->_flags + 1);
}

- (void)setDescendentEnvironmentUseMask:(unint64_t)a3
{
  *((_BYTE *)&self->_flags + 1) = a3;
}

- (id)contentModels
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_opt_new(NSMutableArray);
  -[TUIContainerBox appendLayoutChildrenToArray:](self, "appendLayoutChildrenToArray:", v3);
  v4 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v10, "role", (_QWORD)v13))
          -[NSMutableArray addObject:](v4, "addObject:", v10);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = -[NSMutableArray copy](v4, "copy");
  return v11;
}

- (id)navBarModels
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_opt_new(NSMutableArray);
  -[TUIContainerBox appendLayoutChildrenToArray:](self, "appendLayoutChildrenToArray:", v3);
  v4 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "role", (_QWORD)v13) == &dword_4)
          -[NSMutableArray addObject:](v4, "addObject:", v10);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = -[NSMutableArray copy](v4, "copy");
  return v11;
}

- (TUIModelLayoutable)contentModel
{
  TUIModelLayoutable *contentModel;
  void *v4;
  TUIModelLayoutable *v5;
  TUIModelLayoutable *v6;

  contentModel = self->_contentModel;
  if (!contentModel)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRootBox contentModels](self, "contentModels"));
    if (objc_msgSend(v4, "count") == (char *)&dword_0 + 1)
      v5 = (TUIModelLayoutable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    else
      v5 = 0;
    v6 = self->_contentModel;
    self->_contentModel = v5;

    contentModel = self->_contentModel;
  }
  return contentModel;
}

- (void)onContainedModelsChanged
{
  TUIModelLayoutable *contentModel;

  contentModel = self->_contentModel;
  self->_contentModel = 0;

}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIRootLayout, a2);
}

+ (TUIRootBox)rootBoxWithContentModel:(id)a3
{
  id v3;
  TUIRootBox *v4;
  void *v5;
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(TUIRootBox);
  v7 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  -[TUIContainerBox updateModelChildren:](v4, "updateModelChildren:", v5);
  return v4;
}

- (id)validateInstantiationWithContext:(id)a3 transactionGroup:(id)a4 layout:(id)a5
{
  id v6;
  TUIBoxBuilder *v7;
  id v8;

  v6 = a3;
  v7 = objc_alloc_init(TUIBoxBuilder);
  *(_BYTE *)&self->_flags = objc_msgSend(v6, "updateWithEntry:withBuilder:environmentContainer:", self->_entry, v7, self);
  v8 = -[TUIBoxBuilder finalizeModelsWithParent:box:context:](v7, "finalizeModelsWithParent:box:context:", self, self, v6);

  return self;
}

- (BOOL)hasUpdatesForTransactionGroup:(id)a3
{
  return 0;
}

- (BOOL)needsValidationForTransactionGroup:(id)a3
{
  return 0;
}

- (TUIInstantiatingEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_contentModel, 0);
}

@end
