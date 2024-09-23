@implementation SBIconVisibilityService

- (id)iconStateDisplayIdentifiers
{
  NSSet *v3;

  -[NSLock lock](self->_iconStateDisplayIdentifiersLock, "lock");
  v3 = self->_iconStateDisplayIdentifiers;
  -[NSLock unlock](self->_iconStateDisplayIdentifiersLock, "unlock");
  return v3;
}

- (SBIconVisibilityService)initWithIconModel:(id)a3
{
  id v5;
  SBIconVisibilityService *v6;
  NSLock *v7;
  NSLock *iconStateDisplayIdentifiersLock;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBIconVisibilityService;
  v6 = -[SBIconVisibilityService init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    iconStateDisplayIdentifiersLock = v6->_iconStateDisplayIdentifiersLock;
    v6->_iconStateDisplayIdentifiersLock = v7;

    objc_storeStrong((id *)&v6->_iconModel, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__visibleIdentifiersChanged_, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__visibleIdentifiersChanged_, *MEMORY[0x1E0DAAA10], v5);
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__visibleIdentifiersChanged_, *MEMORY[0x1E0DAAA00], v5);
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__visibleIdentifiersChanged_, *MEMORY[0x1E0DAAA20], v5);
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__visibleIdentifiersChanged_, *MEMORY[0x1E0DAAA08], v5);
    -[SBIconVisibilityService _visibleIdentifiersChanged:](v6, "_visibleIdentifiersChanged:", 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBIconVisibilityService;
  -[SBIconVisibilityService dealloc](&v4, sel_dealloc);
}

- (void)_visibleIdentifiersChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBIconVisibilityService *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SBIconVisibilityService__visibleIdentifiersChanged___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __54__SBIconVisibilityService__visibleIdentifiersChanged___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  id v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(CFSTR("SBInstalledApplicationsDidChangeNotification"), "isEqualToString:", v2);
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if ((v3 & 1) == 0)
    {
      objc_msgSend(v4, "object");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(*(_QWORD *)(a1 + 40) + 8);

      if (v5 != v6)
        goto LABEL_61;
    }
  }
  v7 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(a1 + 40), "iconStateDisplayIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithSet:", v8);

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)*MEMORY[0x1E0DAAA10], "isEqualToString:", v2))
  {
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0DAABD0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v70 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          if (objc_msgSend(v17, "isApplicationIcon") && objc_msgSend(v17, "hasApplication"))
          {
            objc_msgSend(v17, "applicationBundleID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
      }
      while (v14);
    }

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v19 = v11;
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0DAABC8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v66 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
          if (objc_msgSend(v25, "isApplicationIcon"))
          {
            objc_msgSend(v25, "applicationBundleID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "removeObject:", v26);

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      }
      while (v22);
    }

    v11 = v19;
    goto LABEL_58;
  }
  if (v3)
  {
    v51 = v9;
    v27 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v11, "objectForKey:", CFSTR("SBInstalledApplicationsAddedBundleIDs"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initWithSet:", v28);

    v52 = v11;
    objc_msgSend(v11, "objectForKey:", CFSTR("SBInstalledApplicationsReplacedBundleIDs"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "unionSet:", v30);

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v29;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v62;
      v34 = MEMORY[0x1E0C809B0];
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v62 != v33)
            objc_enumerationMutation(obj);
          v36 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k);
          v37 = *(_QWORD *)(a1 + 40);
          v38 = *(void **)(v37 + 8);
          v58[0] = v34;
          v58[1] = 3221225472;
          v58[2] = __54__SBIconVisibilityService__visibleIdentifiersChanged___block_invoke_2;
          v58[3] = &unk_1E8EADF20;
          v58[4] = v37;
          v59 = v10;
          v60 = v36;
          objc_msgSend(v38, "enumerateApplicationIconsForBundleIdentifier:usingBlock:", v36, v58);

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
      }
      while (v32);
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v52, "objectForKey:", CFSTR("SBInstalledApplicationsRemovedBundleIDs"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v55;
      do
      {
        for (m = 0; m != v41; ++m)
        {
          if (*(_QWORD *)v55 != v42)
            objc_enumerationMutation(v39);
          v44 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * m);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "expectedIconForDisplayIdentifier:", v44, v51);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isIconVisible:", v45) & 1) == 0)
            objc_msgSend(v10, "removeObject:", v44);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
      }
      while (v41);
    }

    v9 = v51;
    v11 = v52;
    goto LABEL_58;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0DAAA00], "isEqualToString:", v2))
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0DAABC0]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!objc_msgSend(v46, "isApplicationIcon") || (objc_msgSend(v46, "hasApplication") & 1) == 0)
      && !objc_msgSend(v46, "isBookmarkIcon")
      || !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isIconVisible:", v46))
    {
      goto LABEL_57;
    }
    objc_msgSend(v46, "leafIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v47);
LABEL_53:

    goto LABEL_57;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0DAAA20], "isEqualToString:", v2))
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0DAABC0]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v46, "isApplicationIcon") & 1) == 0 && !objc_msgSend(v46, "isBookmarkIcon"))
      goto LABEL_57;
    objc_msgSend(v46, "leafIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v47);
    goto LABEL_53;
  }
  if ((objc_msgSend((id)*MEMORY[0x1E0DAAA08], "isEqualToString:", v2) & 1) == 0 && *(_QWORD *)(a1 + 32))
    goto LABEL_58;
  objc_msgSend(v10, "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "visibleIconIdentifiers");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v46);
LABEL_57:

LABEL_58:
  if ((objc_msgSend(v10, "isEqual:", v9, v51) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "lock");
    v48 = objc_msgSend(v10, "copy");
    v49 = *(_QWORD *)(a1 + 40);
    v50 = *(void **)(v49 + 24);
    *(_QWORD *)(v49 + 24) = v48;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "unlock");
    notify_post("com.apple.springboard.display-identifiers.changed");
  }

LABEL_61:
}

uint64_t __54__SBIconVisibilityService__visibleIdentifiersChanged___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isIconVisible:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 48));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconStateDisplayIdentifiers, 0);
  objc_storeStrong((id *)&self->_iconStateDisplayIdentifiersLock, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
}

@end
