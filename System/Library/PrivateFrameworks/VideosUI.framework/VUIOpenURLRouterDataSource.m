@implementation VUIOpenURLRouterDataSource

+ (id)routerDataSourceWithDict:(id)a3 appContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "vui_arrayForKey:", CFSTR("documentDataSources"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v7;
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v38;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(v9);
          +[VUIDocumentDataSource documentDataSourceWithDictionary:](VUIDocumentDataSource, "documentDataSourceWithDictionary:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "vui_dictionaryForKey:", CFSTR("actionDataSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAction actionWithDictionary:appContext:](VUIAction, "actionWithDictionary:appContext:", v15, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_dictionaryForKey:", CFSTR("postActionDataSource"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v6;
  +[VUIAction actionWithDictionary:appContext:](VUIAction, "actionWithDictionary:appContext:", v17, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_stringForKey:", CFSTR("tabIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_stringForKey:", CFSTR("nativePageSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_dictionaryForKey:", CFSTR("localLibraryDataSource"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v5, "vui_BOOLForKey:defaultValue:", CFSTR("actionFirst"), 0);
  if (v16 || objc_msgSend(v8, "count") || v19 || v21 || v20)
  {
    v33 = v22;
    v23 = (void *)objc_opt_new();
    v34 = v21;
    v24 = v5;
    v25 = v20;
    v26 = v19;
    v27 = v16;
    v28 = v18;
    v29 = v17;
    v30 = v15;
    v31 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v23, "setDocumentDataSources:", v31);

    v15 = v30;
    v17 = v29;
    v18 = v28;
    v16 = v27;
    v19 = v26;
    v20 = v25;
    v5 = v24;
    v21 = v34;
    objc_msgSend(v23, "setAction:", v16);
    objc_msgSend(v23, "setPostAction:", v18);
    objc_msgSend(v23, "setTabIdentifier:", v19);
    objc_msgSend(v23, "setNativePageName:", v20);
    objc_msgSend(v23, "setLocalLibraryLink:", v34);
    objc_msgSend(v23, "setActionFirst:", v33);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSArray)documentDataSources
{
  return self->_documentDataSources;
}

- (void)setDocumentDataSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (VUIAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (VUIAction)postAction
{
  return self->_postAction;
}

- (void)setPostAction:(id)a3
{
  objc_storeStrong((id *)&self->_postAction, a3);
}

- (NSString)tabIdentifier
{
  return self->_tabIdentifier;
}

- (void)setTabIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_tabIdentifier, a3);
}

- (NSDictionary)localLibraryLink
{
  return self->_localLibraryLink;
}

- (void)setLocalLibraryLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)nativePageName
{
  return self->_nativePageName;
}

- (void)setNativePageName:(id)a3
{
  objc_storeStrong((id *)&self->_nativePageName, a3);
}

- (BOOL)actionFirst
{
  return self->_actionFirst;
}

- (void)setActionFirst:(BOOL)a3
{
  self->_actionFirst = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nativePageName, 0);
  objc_storeStrong((id *)&self->_localLibraryLink, 0);
  objc_storeStrong((id *)&self->_tabIdentifier, 0);
  objc_storeStrong((id *)&self->_postAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_documentDataSources, 0);
}

@end
