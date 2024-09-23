@implementation _PXPhotosDetailsPurger

- (_PXPhotosDetailsPurger)init
{
  _PXPhotosDetailsPurger *v2;
  uint64_t v3;
  NSHashTable *allViewControllers;
  uint64_t v5;
  NSPointerArray *lastUsedViewControllers;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_PXPhotosDetailsPurger;
  v2 = -[_PXPhotosDetailsPurger init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    allViewControllers = v2->_allViewControllers;
    v2->_allViewControllers = (NSHashTable *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
    lastUsedViewControllers = v2->_lastUsedViewControllers;
    v2->_lastUsedViewControllers = (NSPointerArray *)v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_didReceiveMemoryWarning_, *MEMORY[0x1E0DC4778], 0);

  }
  return v2;
}

- (void)didReceiveMemoryWarning:(id)a3
{
  void *v4;
  int v5;

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "purgeOnMemoryWarning");

  if (v5)
    -[_PXPhotosDetailsPurger _purgeAllViewControllers](self, "_purgeAllViewControllers");
}

- (void)detailsViewControllerDidAppear:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  -[NSHashTable addObject:](self->_allViewControllers, "addObject:");
  v4 = -[NSPointerArray count](self->_lastUsedViewControllers, "count");
  if (v4 >= 1)
  {
    v5 = v4 + 1;
    do
    {
      if (!-[NSPointerArray pointerAtIndex:](self->_lastUsedViewControllers, "pointerAtIndex:", v5 - 2))
        -[NSPointerArray removePointerAtIndex:](self->_lastUsedViewControllers, "removePointerAtIndex:", v5 - 2);
      --v5;
    }
    while (v5 > 1);
  }
  if (-[NSPointerArray count](self->_lastUsedViewControllers, "count"))
  {
    v6 = 0;
    while (1)
    {
      -[NSPointerArray pointerAtIndex:](self->_lastUsedViewControllers, "pointerAtIndex:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == v11)
        break;

      if (++v6 >= -[NSPointerArray count](self->_lastUsedViewControllers, "count"))
        goto LABEL_12;
    }
    -[NSPointerArray removePointerAtIndex:](self->_lastUsedViewControllers, "removePointerAtIndex:", v6);

  }
LABEL_12:
  -[NSPointerArray addPointer:](self->_lastUsedViewControllers, "addPointer:", v11);
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "detailViewsToKeepLoaded");

  if (-[NSPointerArray count](self->_lastUsedViewControllers, "count") > v9)
  {
    v10 = -[NSPointerArray count](self->_lastUsedViewControllers, "count") - v9;
    if (v10 >= 1)
    {
      do
      {
        -[NSPointerArray removePointerAtIndex:](self->_lastUsedViewControllers, "removePointerAtIndex:", 0);
        --v10;
      }
      while (v10);
    }
  }

}

- (void)purgeOldViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[NSPointerArray allObjects](self->_lastUsedViewControllers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSHashTable allObjects](self->_allViewControllers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v11) & 1) == 0)
        {
          objc_msgSend(v11, "navigationController");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
            goto LABEL_9;
          v13 = (void *)v12;
          objc_msgSend(v11, "navigationController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "topViewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 != v11)
LABEL_9:
            objc_msgSend(v11, "purgeIfPossible");
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (void)_purgeAllViewControllers
{
  void *v2;
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
  -[NSHashTable allObjects](self->_allViewControllers, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "purgeIfPossible");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedViewControllers, 0);
  objc_storeStrong((id *)&self->_allViewControllers, 0);
}

+ (id)sharedPurger
{
  if (sharedPurger_onceToken != -1)
    dispatch_once(&sharedPurger_onceToken, &__block_literal_global_89449);
  return (id)sharedPurger_sharedPurger;
}

@end
