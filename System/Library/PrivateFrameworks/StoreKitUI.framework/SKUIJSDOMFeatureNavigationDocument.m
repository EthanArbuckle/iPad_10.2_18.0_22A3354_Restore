@implementation SKUIJSDOMFeatureNavigationDocument

- (SKUIJSDOMFeatureNavigationDocument)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIJSDOMFeatureNavigationDocument *v16;
  void *v17;
  uint64_t v18;
  NSString *featureName;
  NSMutableArray *v20;
  NSMutableArray *stackItems;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIJSDOMFeatureNavigationDocument initWithDOMNode:featureName:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIJSDOMFeatureNavigationDocument;
  v16 = -[SKUIJSDOMFeatureNavigationDocument init](&v23, sel_init);
  if (v16)
  {
    objc_msgSend(v6, "appContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v16->_appContext, v17);

    v18 = objc_msgSend(v7, "copy");
    featureName = v16->_featureName;
    v16->_featureName = (NSString *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stackItems = v16->_stackItems;
    v16->_stackItems = v20;

  }
  return v16;
}

- (void)setNavigationDocumentController:(id)a3
{
  SKUINavigationDocumentController *v5;

  v5 = (SKUINavigationDocumentController *)a3;
  if (self->_navigationDocumentController != v5)
  {
    objc_storeStrong((id *)&self->_navigationDocumentController, a3);
    if (-[NSMutableArray count](self->_stackItems, "count"))
    {
      -[SKUINavigationDocumentController setStackItems:animated:](self->_navigationDocumentController, "setStackItems:animated:", self->_stackItems, 0);
      -[NSMutableArray removeAllObjects](self->_stackItems, "removeAllObjects");
    }
  }

}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIJSDOMFeatureNavigationDocument makeFeatureJSObjectForFeature:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = (objc_class *)MEMORY[0x1E0D3A6B0];
  v13 = v3;
  v14 = [v12 alloc];
  objc_msgSend(v13, "appContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithAppContext:navigationController:", v15, v13);

  return v16;
}

+ (id)possibleFeatureNames
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIJSDOMFeatureNavigationDocument possibleFeatureNames].cold.1();
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("leftNavigationDocument"), CFSTR("rightNavigationDocument"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)clear
{
  SKUINavigationDocumentController *navigationDocumentController;

  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
    -[SKUINavigationDocumentController clear](navigationDocumentController, "clear");
  else
    -[NSMutableArray removeAllObjects](self->_stackItems, "removeAllObjects");
}

- (id)documents
{
  SKUINavigationDocumentController *navigationDocumentController;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    -[SKUINavigationDocumentController documents](navigationDocumentController, "documents");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_stackItems;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "document", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    return v5;
  }
}

- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5
{
  id v8;
  SKUINavigationDocumentController *navigationDocumentController;
  id v10;
  id v11;
  NSMutableArray *stackItems;
  id v13;
  id v14;
  uint64_t v15;
  SKUIDocumentStackItem *v16;
  NSMutableArray *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a4;
  navigationDocumentController = self->_navigationDocumentController;
  v18 = v8;
  if (navigationDocumentController)
  {
    v10 = a5;
    v11 = a3;
    -[SKUINavigationDocumentController insertDocument:beforeDocument:options:](navigationDocumentController, "insertDocument:beforeDocument:options:", v11, v18, v10);

  }
  else
  {
    stackItems = self->_stackItems;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __76__SKUIJSDOMFeatureNavigationDocument_insertDocument_beforeDocument_options___block_invoke;
    v19[3] = &unk_1E73A52A0;
    v20 = v8;
    v13 = a5;
    v14 = a3;
    v15 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v19);
    v16 = -[SKUIDocumentStackItem initWithDocument:presentationOptions:]([SKUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v14, v13);

    v17 = self->_stackItems;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray addObject:](v17, "addObject:", v16);
    else
      -[NSMutableArray insertObject:atIndex:](v17, "insertObject:atIndex:", v16, v15);

    v11 = v20;
  }

}

BOOL __76__SKUIJSDOMFeatureNavigationDocument_insertDocument_beforeDocument_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)pushDocument:(id)a3 options:(id)a4
{
  SKUINavigationDocumentController *navigationDocumentController;
  id v6;
  id v8;
  id v9;
  SKUIDocumentStackItem *v10;

  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    v6 = a4;
    v10 = (SKUIDocumentStackItem *)a3;
    -[SKUINavigationDocumentController pushDocument:options:](navigationDocumentController, "pushDocument:options:");

  }
  else
  {
    v8 = a4;
    v9 = a3;
    v10 = -[SKUIDocumentStackItem initWithDocument:presentationOptions:]([SKUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v9, v8);

    -[NSMutableArray addObject:](self->_stackItems, "addObject:", v10);
  }

}

- (void)popDocument
{
  SKUINavigationDocumentController *navigationDocumentController;

  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
    -[SKUINavigationDocumentController popDocument](navigationDocumentController, "popDocument");
  else
    -[NSMutableArray removeLastObject](self->_stackItems, "removeLastObject");
}

- (void)popToDocument:(id)a3
{
  id v4;
  SKUINavigationDocumentController *navigationDocumentController;
  NSMutableArray *stackItems;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  navigationDocumentController = self->_navigationDocumentController;
  v8 = v4;
  if (navigationDocumentController)
  {
    -[SKUINavigationDocumentController popToDocument:](navigationDocumentController, "popToDocument:", v4);
  }
  else
  {
    stackItems = self->_stackItems;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__SKUIJSDOMFeatureNavigationDocument_popToDocument___block_invoke;
    v9[3] = &unk_1E73A52A0;
    v10 = v4;
    v7 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v9);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectsInRange:](self->_stackItems, "removeObjectsInRange:", v7, -[NSMutableArray count](self->_stackItems, "count") - v7);

  }
}

BOOL __52__SKUIJSDOMFeatureNavigationDocument_popToDocument___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)popToRootDocument
{
  SKUINavigationDocumentController *navigationDocumentController;
  uint64_t v4;

  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    -[SKUINavigationDocumentController popToRootDocument](navigationDocumentController, "popToRootDocument");
  }
  else
  {
    v4 = -[NSMutableArray count](self->_stackItems, "count");
    if (v4 >= 2)
      -[NSMutableArray removeObjectsInRange:](self->_stackItems, "removeObjectsInRange:", 1, v4 - 1);
  }
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  id v8;
  SKUINavigationDocumentController *navigationDocumentController;
  id v10;
  id v11;
  NSMutableArray *stackItems;
  id v13;
  id v14;
  uint64_t v15;
  SKUIDocumentStackItem *v16;
  NSMutableArray *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  navigationDocumentController = self->_navigationDocumentController;
  v18 = v8;
  if (navigationDocumentController)
  {
    v10 = a5;
    v11 = a4;
    -[SKUINavigationDocumentController replaceDocument:withDocument:options:](navigationDocumentController, "replaceDocument:withDocument:options:", v18, v11, v10);

  }
  else
  {
    stackItems = self->_stackItems;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__SKUIJSDOMFeatureNavigationDocument_replaceDocument_withDocument_options___block_invoke;
    v19[3] = &unk_1E73A52A0;
    v20 = v8;
    v13 = a5;
    v14 = a4;
    v15 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v19);
    v16 = -[SKUIDocumentStackItem initWithDocument:presentationOptions:]([SKUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v14, v13);

    v17 = self->_stackItems;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray addObject:](v17, "addObject:", v16);
    else
      -[NSMutableArray replaceObjectAtIndex:withObject:](v17, "replaceObjectAtIndex:withObject:", v15, v16);

    v11 = v20;
  }

}

BOOL __75__SKUIJSDOMFeatureNavigationDocument_replaceDocument_withDocument_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)removeDocument:(id)a3
{
  id v4;
  SKUINavigationDocumentController *navigationDocumentController;
  NSMutableArray *stackItems;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  navigationDocumentController = self->_navigationDocumentController;
  v8 = v4;
  if (navigationDocumentController)
  {
    -[SKUINavigationDocumentController removeDocument:](navigationDocumentController, "removeDocument:", v4);
  }
  else
  {
    stackItems = self->_stackItems;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__SKUIJSDOMFeatureNavigationDocument_removeDocument___block_invoke;
    v9[3] = &unk_1E73A52A0;
    v10 = v4;
    v7 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v9);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_stackItems, "removeObjectAtIndex:", v7);

  }
}

BOOL __53__SKUIJSDOMFeatureNavigationDocument_removeDocument___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (SKUINavigationDocumentController)navigationDocumentController
{
  return self->_navigationDocumentController;
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_stackItems, 0);
  objc_storeStrong((id *)&self->_navigationDocumentController, 0);
  objc_destroyWeak((id *)&self->_jsNavigationDocument);
}

- (void)initWithDOMNode:(uint64_t)a3 featureName:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)makeFeatureJSObjectForFeature:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)possibleFeatureNames
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUIJSDOMFeatureNavigationDocument possibleFeatureNames]";
  OUTLINED_FUNCTION_1();
}

@end
