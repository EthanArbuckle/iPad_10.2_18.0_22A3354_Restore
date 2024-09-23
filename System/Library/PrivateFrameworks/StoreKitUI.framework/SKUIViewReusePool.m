@implementation SKUIViewReusePool

- (SKUIViewReusePool)initWithParentView:(id)a3
{
  SKUIViewReusePool *v4;
  id v5;
  NSMutableArray *v6;
  NSMutableArray *viewPool;
  objc_super v9;
  id location;

  objc_initWeak(&location, a3);
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIViewReusePool initWithParentView:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIViewReusePool;
  v4 = -[SKUIViewReusePool init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_parentView, v5);

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    viewPool = v4->_viewPool;
    v4->_viewPool = v6;

  }
  objc_destroyWeak(&location);
  return v4;
}

- (id)dequeueReusableViewWithReuseIdentifier:(id)a3
{
  id v4;
  NSMutableArray *viewPool;
  id v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  viewPool = self->_viewPool;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__SKUIViewReusePool_dequeueReusableViewWithReuseIdentifier___block_invoke;
  v12[3] = &unk_1E73A5F88;
  v6 = v4;
  v13 = v6;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](viewPool, "indexOfObjectPassingTest:", v12);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = -[SKUIViewReusePool viewClassWithReuseIdentifier:](self, "viewClassWithReuseIdentifier:", v6);
    if (v8)
    {
      v9 = objc_alloc_init(v8);
      objc_setAssociatedObject(v9, "com.apple.StoreKitUI.viewReuse.ID", v6, (void *)1);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v10 = v7;
    -[NSMutableArray objectAtIndexedSubscript:](self->_viewPool, "objectAtIndexedSubscript:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);
    -[NSMutableArray removeObjectAtIndex:](self->_viewPool, "removeObjectAtIndex:", v10);
  }

  return v9;
}

uint64_t __60__SKUIViewReusePool_dequeueReusableViewWithReuseIdentifier___block_invoke(uint64_t a1, id object)
{
  void *v3;
  uint64_t v4;

  objc_getAssociatedObject(object, "com.apple.StoreKitUI.viewReuse.ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)hideUnusedViews
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_viewPool;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setHidden:", 1, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)recycleReusableViews:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  __int128 v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_getAssociatedObject(v10, "com.apple.StoreKitUI.viewReuse.ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[NSMutableArray insertObject:atIndex:](self->_viewPool, "insertObject:atIndex:", v10, 0);
          LODWORD(v12) = 0;
          objc_msgSend(v10, "setCharge:", v12);
          v13 = v8[1];
          v14[0] = *v8;
          v14[1] = v13;
          v14[2] = v8[2];
          objc_msgSend(v10, "setTransform:", v14);
        }
        else
        {
          objc_msgSend(v10, "removeFromSuperview");
        }
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF4A7400))
          objc_msgSend(v10, "viewWasRecycled");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)registerClass:(Class)a3 forViewWithReuseIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *reuseClasses;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v6 = a4;
  reuseClasses = self->_reuseClasses;
  v10 = v6;
  if (!reuseClasses)
  {
    v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v9 = self->_reuseClasses;
    self->_reuseClasses = v8;

    v6 = v10;
    reuseClasses = self->_reuseClasses;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](reuseClasses, "setObject:forKeyedSubscript:", a3, v6);

}

- (Class)viewClassWithReuseIdentifier:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;

  v4 = a3;
  if (_SKUIViewReusePoolGetCommonReuseClasses_onceToken != -1)
    dispatch_once(&_SKUIViewReusePoolGetCommonReuseClasses_onceToken, &__block_literal_global_33);
  v5 = (void *)objc_msgSend((id)_SKUIViewReusePoolGetCommonReuseClasses_commonReuseClasses, "objectForKeyedSubscript:", v4);
  if (!v5)
    v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_reuseClasses, "objectForKeyedSubscript:", v4);
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewPool, 0);
  objc_storeStrong((id *)&self->_reuseClasses, 0);
  objc_destroyWeak((id *)&self->_parentView);
}

- (void)initWithParentView:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIViewReusePool initWithParentView:]";
}

@end
