@implementation SWNavigationManager

- (SWNavigationManager)init
{
  SWNavigationManager *v2;
  uint64_t v3;
  NSMutableArray *handlers;
  uint64_t v5;
  NSMutableDictionary *schemeHandlers;
  uint64_t v7;
  NSMutableDictionary *extensionHandlers;
  uint64_t v9;
  NSMutableSet *observers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SWNavigationManager;
  v2 = -[SWNavigationManager init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    schemeHandlers = v2->_schemeHandlers;
    v2->_schemeHandlers = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    extensionHandlers = v2->_extensionHandlers;
    v2->_extensionHandlers = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v9;

  }
  return v2;
}

- (unint64_t)actionForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SWNavigationManager extensionHandlers](self, "extensionHandlers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "handleRequest:", v4);
    if (v11)
      goto LABEL_7;
  }
  else
  {
    v11 = 0;
  }
  if (v8)
  {
    -[SWNavigationManager schemeHandlers](self, "schemeHandlers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v13, "handleRequest:", v4);
  }
LABEL_7:
  if (v11)
  {
LABEL_18:
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[SWNavigationManager observers](self, "observers", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v14);
          v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v23);
          objc_msgSend(v4, "URL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handledNavigationWithURL:", v25);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v21);
    }
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[SWNavigationManager handlers](self, "handlers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v14);
          v19 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v18), "handleRequest:", v4);
          if (v19)
          {
            v11 = v19;

            goto LABEL_18;
          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v16)
          continue;
        break;
      }
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)shouldPreviewRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char **v9;
  void *v10;
  void *v11;
  void *v12;
  SWNavigationPreview *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SWNavigationPreview *v19;
  char **v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = &selRef_onCompletion_;
  if (v6)
  {
    -[SWNavigationManager extensionHandlers](self, "extensionHandlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "previewViewControllerForRequest:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v13 = -[SWNavigationPreview initWithViewController:navigationHandler:URLRequest:]([SWNavigationPreview alloc], "initWithViewController:navigationHandler:URLRequest:", v12, v11, v4);
      else
        v13 = 0;

    }
    else
    {
      v13 = 0;
    }

    if (v13)
      goto LABEL_18;
  }
  else
  {
    v13 = 0;
  }
  if (v8)
  {
    -[SWNavigationManager schemeHandlers](self, "schemeHandlers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "previewViewControllerForRequest:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        v13 = -[SWNavigationPreview initWithViewController:navigationHandler:URLRequest:]([SWNavigationPreview alloc], "initWithViewController:navigationHandler:URLRequest:", v16, v15, v4);
      else
        v13 = 0;

    }
    else
    {
      v13 = 0;
    }

  }
LABEL_18:
  if (!v13)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[SWNavigationManager handlers](self, "handlers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (SWNavigationPreview *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v13)
    {
      v27 = v6;
      v28 = v8;
      v18 = *(_QWORD *)v30;
      while (2)
      {
        v19 = 0;
        v20 = v9;
        do
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v19);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v21, "previewViewControllerForRequest:", v4);
            v22 = objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = (void *)v22;
              v13 = -[SWNavigationPreview initWithViewController:navigationHandler:URLRequest:]([SWNavigationPreview alloc], "initWithViewController:navigationHandler:URLRequest:", v22, v21, v4);

              goto LABEL_30;
            }
          }
          v19 = (SWNavigationPreview *)((char *)v19 + 1);
        }
        while (v13 != v19);
        v13 = (SWNavigationPreview *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        v9 = v20;
        if (v13)
          continue;
        break;
      }
LABEL_30:
      v6 = v27;
      v8 = v28;
    }

  }
  -[SWNavigationManager setCurrentPreview:](self, "setCurrentPreview:", v13, v27, v28);
  -[SWNavigationManager currentPreview](self, "currentPreview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 != 0;

  return v25;
}

- (id)previewViewControllerForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4
    && (-[SWNavigationManager currentPreview](self, "currentPreview"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "request"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v4, "isEqual:", v6),
        v6,
        v5,
        v7))
  {
    -[SWNavigationManager currentPreview](self, "currentPreview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)commitViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SWNavigationManager currentPreview](self, "currentPreview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "viewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      -[SWNavigationManager setCurrentPreview:](self, "setCurrentPreview:", 0);
      objc_msgSend(v6, "navigationHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "commitViewController:URLRequest:", v4, v9);

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[SWNavigationManager observers](self, "observers", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
            objc_msgSend(v6, "request");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "URL");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handledNavigationWithURL:", v17);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v12);
      }

    }
  }

}

- (void)registerHandler:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SWNavigationManager handlers](self, "handlers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)registerHandler:(id)a3 scheme:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      -[SWNavigationManager schemeHandlers](self, "schemeHandlers");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v6);

    }
  }
}

- (void)registerHandler:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      -[SWNavigationManager extensionHandlers](self, "extensionHandlers");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v6);

    }
  }
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SWNavigationManager observers](self, "observers");
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
    -[SWNavigationManager observers](self, "observers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (NSMutableDictionary)schemeHandlers
{
  return self->_schemeHandlers;
}

- (NSMutableDictionary)extensionHandlers
{
  return self->_extensionHandlers;
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (SWNavigationPreview)currentPreview
{
  return self->_currentPreview;
}

- (void)setCurrentPreview:(id)a3
{
  objc_storeStrong((id *)&self->_currentPreview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPreview, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_extensionHandlers, 0);
  objc_storeStrong((id *)&self->_schemeHandlers, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end
