@implementation _SBHLibraryCollectionOfModelThings

- (_SBHLibraryCollectionOfModelThings)initWithIconViewProvider:(id)a3 iconModel:(id)a4 rootFolder:(id)a5 listLayoutProvider:(id)a6 iconImageCache:(id)a7 folderIconImageCache:(id)a8 categoryMapProvider:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _SBHLibraryCollectionOfModelThings *v22;
  _SBHLibraryCollectionOfModelThings *v23;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v25.receiver = self;
  v25.super_class = (Class)_SBHLibraryCollectionOfModelThings;
  v22 = -[_SBHLibraryCollectionOfModelThings init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_iconViewProvider, v15);
    objc_storeWeak((id *)&v23->_iconModel, v16);
    objc_storeWeak((id *)&v23->_rootFolder, v17);
    objc_storeWeak((id *)&v23->_listLayoutProvider, v18);
    objc_storeWeak((id *)&v23->_iconImageCache, v19);
    objc_storeWeak((id *)&v23->_folderIconImageCache, v20);
    objc_storeWeak((id *)&v23->_categoryMapProvider, v21);
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  void *v5;
  char isKindOfClass;
  id *v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  id v22;
  char v23;
  char v25;

  v4 = (id *)a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained(v4 + 1);
    v9 = objc_loadWeakRetained((id *)&self->_iconViewProvider);
    v25 = BSEqualObjects();

    v10 = objc_loadWeakRetained(v7 + 2);
    v11 = objc_loadWeakRetained((id *)&self->_iconModel);
    LOBYTE(WeakRetained) = BSEqualObjects();

    v12 = objc_loadWeakRetained(v7 + 3);
    v13 = objc_loadWeakRetained((id *)&self->_rootFolder);
    LOBYTE(v10) = BSEqualObjects();

    v14 = objc_loadWeakRetained(v7 + 4);
    v15 = objc_loadWeakRetained((id *)&self->_listLayoutProvider);
    LOBYTE(v12) = BSEqualObjects();

    v16 = objc_loadWeakRetained(v7 + 5);
    v17 = objc_loadWeakRetained((id *)&self->_iconImageCache);
    LOBYTE(v14) = BSEqualObjects();

    v18 = objc_loadWeakRetained(v7 + 6);
    v19 = objc_loadWeakRetained((id *)&self->_folderIconImageCache);
    v20 = BSEqualObjects();

    v21 = objc_loadWeakRetained(v7 + 7);
    v22 = objc_loadWeakRetained((id *)&self->_categoryMapProvider);
    LOBYTE(v7) = BSEqualObjects();

    v23 = v25 & WeakRetained & v10 & v12 & v14 & v20 & v7;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)examineModelValidityWithError:(id *)a3
{
  id WeakRetained;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  int v18;
  id v19;
  id v20;
  void *v21;
  id *v23;

  WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);

  v6 = objc_loadWeakRetained((id *)&self->_iconModel);
  v7 = objc_loadWeakRetained((id *)&self->_rootFolder);

  v8 = objc_loadWeakRetained((id *)&self->_listLayoutProvider);
  v9 = objc_loadWeakRetained((id *)&self->_iconImageCache);

  v10 = objc_loadWeakRetained((id *)&self->_folderIconImageCache);
  v11 = objc_loadWeakRetained((id *)&self->_categoryMapProvider);

  if (WeakRetained)
    v12 = v6 == 0;
  else
    v12 = 1;
  v18 = v12 || v7 == 0 || v8 == 0 || v9 == 0 || v10 == 0 || v11 == 0;
  if (a3 && v18)
  {
    v23 = a3;
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = v20;
    if (WeakRetained)
    {
      if (v6)
        goto LABEL_26;
    }
    else
    {
      objc_msgSend(v20, "addObject:", CFSTR("_iconViewProvider"));
      if (v6)
      {
LABEL_26:
        if (v7)
          goto LABEL_27;
        goto LABEL_35;
      }
    }
    objc_msgSend(v21, "addObject:", CFSTR("_iconModel"));
    if (v7)
    {
LABEL_27:
      if (v8)
        goto LABEL_28;
      goto LABEL_36;
    }
LABEL_35:
    objc_msgSend(v21, "addObject:", CFSTR("_rootFolder"));
    if (v8)
    {
LABEL_28:
      if (v9)
        goto LABEL_29;
      goto LABEL_37;
    }
LABEL_36:
    objc_msgSend(v21, "addObject:", CFSTR("_listLayoutProvider"));
    if (v9)
    {
LABEL_29:
      if (v10)
        goto LABEL_30;
      goto LABEL_38;
    }
LABEL_37:
    objc_msgSend(v21, "addObject:", CFSTR("_iconImageCache"));
    if (v10)
    {
LABEL_30:
      if (v11)
      {
LABEL_31:
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("missingModelItems"));
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBHLibraryErrorDomain"), 1, v19);
        *v23 = (id)objc_claimAutoreleasedReturnValue();

        return v18 ^ 1;
      }
LABEL_39:
      objc_msgSend(v21, "addObject:", CFSTR("_categoryMapProvider"));
      goto LABEL_31;
    }
LABEL_38:
    objc_msgSend(v21, "addObject:", CFSTR("_folderIconImageCache"));
    if (v11)
      goto LABEL_31;
    goto LABEL_39;
  }
  return v18 ^ 1;
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (SBHIconModel)iconModel
{
  return (SBHIconModel *)objc_loadWeakRetained((id *)&self->_iconModel);
}

- (SBRootFolder)rootFolder
{
  return (SBRootFolder *)objc_loadWeakRetained((id *)&self->_rootFolder);
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return (SBIconListLayoutProvider *)objc_loadWeakRetained((id *)&self->_listLayoutProvider);
}

- (SBHIconImageCache)iconImageCache
{
  return (SBHIconImageCache *)objc_loadWeakRetained((id *)&self->_iconImageCache);
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return (SBFolderIconImageCache *)objc_loadWeakRetained((id *)&self->_folderIconImageCache);
}

- (SBHLibraryCategoryMapProvider)categoryMapProvider
{
  return (SBHLibraryCategoryMapProvider *)objc_loadWeakRetained((id *)&self->_categoryMapProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_categoryMapProvider);
  objc_destroyWeak((id *)&self->_folderIconImageCache);
  objc_destroyWeak((id *)&self->_iconImageCache);
  objc_destroyWeak((id *)&self->_listLayoutProvider);
  objc_destroyWeak((id *)&self->_rootFolder);
  objc_destroyWeak((id *)&self->_iconModel);
  objc_destroyWeak((id *)&self->_iconViewProvider);
}

@end
