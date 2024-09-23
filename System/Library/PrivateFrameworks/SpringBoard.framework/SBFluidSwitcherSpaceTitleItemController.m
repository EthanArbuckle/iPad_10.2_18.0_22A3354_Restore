@implementation SBFluidSwitcherSpaceTitleItemController

- (void)setMultiWindowIndicatorRoleMask:(unint64_t)a3
{
  if (self->_multiWindowIndicatorRoleMask != a3)
  {
    self->_multiWindowIndicatorRoleMask = a3;
    -[SBFluidSwitcherSpaceTitleItemController _performUpdateHandler](self, "_performUpdateHandler");
  }
}

- (BOOL)isChamoisWindowingEnabled
{
  return self->_isChamoisWindowingEnabled;
}

- (void)setUpdateHandler:(id)a3
{
  void *v4;
  id updateHandler;

  if (self->_updateHandler != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    updateHandler = self->_updateHandler;
    self->_updateHandler = v4;

    -[SBFluidSwitcherSpaceTitleItemController _performUpdateHandler](self, "_performUpdateHandler");
  }
}

- (void)setUseDarkLabels:(BOOL)a3
{
  if (self->_useDarkLabels != a3)
  {
    self->_useDarkLabels = a3;
    -[SBFluidSwitcherSpaceTitleItemController _performUpdateHandler](self, "_performUpdateHandler");
  }
}

- (SBFluidSwitcherSpaceTitleItemController)initWithAppLayout:(id)a3 applicationSceneHandleProvider:(id)a4 displayIdentity:(id)a5 showCanvasTitles:(BOOL)a6 isChamoisWindowingEnabled:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v14;
  unint64_t v15;
  unint64_t v16;
  SBFluidSwitcherSpaceTitleItemController *v17;
  SBFluidSwitcherSpaceTitleItemController *v18;
  id *p_appLayout;
  uint64_t v20;
  NSArray *displayItems;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  SBFluidSwitcherSpaceTitleItemController *v43;
  NSMutableDictionary *displayItemToSceneHandle;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSMutableDictionary *v49;
  void *v51;
  id v52;
  void *v53;
  NSArray *v54;
  unint64_t v55;
  FBSDisplayIdentity **p_displayIdentity;
  SBFluidSwitcherSpaceTitleItemController *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  _BYTE v63[128];
  uint64_t v64;

  v7 = a7;
  v8 = a6;
  v64 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (unint64_t)a4;
  v16 = (unint64_t)a5;
  v53 = (void *)v16;
  if (v15 | v16 && (!v15 || !v16))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherSpaceTitleItemController.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(applicationSceneHandleProvider == nil && displayIdentity == nil) || (applicationSceneHandleProvider != nil && displayIdentity != nil)"));

  }
  v62.receiver = self;
  v62.super_class = (Class)SBFluidSwitcherSpaceTitleItemController;
  v17 = -[SBFluidSwitcherSpaceTitleItemController init](&v62, sel_init);
  v57 = v17;
  if (v17)
  {
    v18 = v17;
    p_appLayout = (id *)&v17->_appLayout;
    objc_storeStrong((id *)&v17->_appLayout, a3);
    p_displayIdentity = &v18->_displayIdentity;
    objc_storeStrong((id *)&v18->_displayIdentity, a5);
    v18->_isChamoisWindowingEnabled = v7;
    if (v7)
    {
      -[SBAppLayout allItems](v18->_appLayout, "allItems");
      v20 = objc_claimAutoreleasedReturnValue();
      displayItems = v18->_displayItems;
      v18->_displayItems = (NSArray *)v20;
    }
    else
    {
      displayItems = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      objc_msgSend(*p_appLayout, "itemForLayoutRole:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        -[NSArray addObject:](displayItems, "addObject:", v22);
      objc_msgSend(*p_appLayout, "itemForLayoutRole:", 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        -[NSArray addObject:](displayItems, "addObject:", v23);
      v24 = -[NSArray copy](displayItems, "copy");
      v25 = v57->_displayItems;
      v57->_displayItems = (NSArray *)v24;

    }
    if (v8)
    {
      v52 = v14;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v26 = v57->_displayItems;
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v59;
        v54 = v26;
        v55 = v15;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v59 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            if (!objc_msgSend(v31, "type"))
            {
              objc_msgSend(v31, "bundleIdentifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32)
              {
                +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "applicationWithBundleIdentifier:", v32);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v34, "info");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "supportsMultiwindow");

                if (v36)
                {
                  objc_msgSend(v31, "uniqueIdentifier");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v15, "sceneIdentityForApplication:uniqueIdentifier:", v34, v37);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v38)
                  {
                    +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v34, v38, *p_displayIdentity);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = objc_opt_class();
                    objc_msgSend((id)v15, "fetchOrCreateApplicationSceneHandleForRequest:", v39);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    SBSafeCast(v40, v41);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v42)
                    {
                      v43 = v57;
                      displayItemToSceneHandle = v57->_displayItemToSceneHandle;
                      if (!displayItemToSceneHandle)
                      {
                        v45 = objc_alloc(MEMORY[0x1E0C99E08]);
                        v46 = -[NSArray count](v57->_displayItems, "count");
                        v47 = v45;
                        v43 = v57;
                        v48 = objc_msgSend(v47, "initWithCapacity:", v46);
                        v49 = v57->_displayItemToSceneHandle;
                        v57->_displayItemToSceneHandle = (NSMutableDictionary *)v48;

                        displayItemToSceneHandle = v57->_displayItemToSceneHandle;
                      }
                      -[NSMutableDictionary setObject:forKey:](displayItemToSceneHandle, "setObject:forKey:", v42, v31);
                      objc_msgSend(v42, "addObserver:", v43);
                    }

                    v26 = v54;
                    v15 = v55;
                  }

                }
              }

            }
          }
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        }
        while (v28);
      }

      v14 = v52;
    }
    -[SBFluidSwitcherSpaceTitleItemController _updateDisplayItemIcons](v57, "_updateDisplayItemIcons");
  }

  return v57;
}

- (void)_updateDisplayItemIcons
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *displayItemToIcon;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self->_displayItems;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_displayItemToIcon, "objectForKey:", v8, (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFluidSwitcherSpaceTitleItemController _iconForDisplayItem:](self, "_iconForDisplayItem:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 != v9 && (objc_msgSend(v10, "isEqual:", v9) & 1) == 0)
        {
          objc_msgSend(v9, "removeObserver:", self);
          displayItemToIcon = self->_displayItemToIcon;
          if (v11)
          {
            if (!displayItemToIcon)
            {
              v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](self->_displayItems, "count"));
              v14 = self->_displayItemToIcon;
              self->_displayItemToIcon = v13;

              displayItemToIcon = self->_displayItemToIcon;
            }
            -[NSMutableDictionary setObject:forKey:](displayItemToIcon, "setObject:forKey:", v11, v8);
            objc_msgSend(v11, "addObserver:", self);
            -[SBFluidSwitcherSpaceTitleItemController _loadIconForDisplayItem:](self, "_loadIconForDisplayItem:", v8);
          }
          else
          {
            -[NSMutableDictionary removeObjectForKey:](displayItemToIcon, "removeObjectForKey:", v8);
            if (!-[NSMutableDictionary count](self->_displayItemToIcon, "count"))
            {
              v15 = self->_displayItemToIcon;
              self->_displayItemToIcon = 0;

            }
          }
        }

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

- (void)_loadIconForDisplayItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(id *);
  void *v15;
  id v16;
  id v17;
  id v18;
  SBFluidSwitcherSpaceTitleItemController *v19;
  id v20;
  id v21;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_displayItemToIcon, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appSwitcherHeaderIconImageCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFluidSwitcherSpaceTitleItemController _iconImageAppearance](self, "_iconImageAppearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageForIcon:imageAppearance:options:", v5, v8, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if (objc_msgSend(v5, "isApplicationIcon"))
      {
        v10 = v5;
        objc_msgSend(v7, "genericImage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __67__SBFluidSwitcherSpaceTitleItemController__loadIconForDisplayItem___block_invoke;
        v15 = &unk_1E8EBFF88;
        v16 = v7;
        v17 = v10;
        v18 = v8;
        v19 = self;
        v20 = v4;
        v21 = v17;
        v11 = (id)objc_msgSend(v16, "cacheImageForIcon:imageAppearance:options:completionHandler:", v17, v18, 0, &v12);

        if (!v9)
          goto LABEL_8;
      }
      else
      {
        objc_msgSend(v7, "imageForIcon:imageAppearance:options:", v5, v8, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
LABEL_8:

          goto LABEL_9;
        }
      }
    }
    -[SBFluidSwitcherSpaceTitleItemController _performUpdateHandler](self, "_performUpdateHandler", v12, v13, v14, v15);

    goto LABEL_8;
  }
LABEL_9:

}

- (void)_performUpdateHandler
{
  void (**updateHandler)(id, SBFluidSwitcherSpaceTitleItemController *, id);
  id v4;

  if (!self->_invalidated)
  {
    updateHandler = (void (**)(id, SBFluidSwitcherSpaceTitleItemController *, id))self->_updateHandler;
    if (updateHandler)
    {
      -[SBFluidSwitcherSpaceTitleItemController _computeHeaderItems](self, "_computeHeaderItems");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      updateHandler[2](updateHandler, self, v4);

    }
  }
}

- (id)_iconForDisplayItem:(id)a3
{
  id v3;
  void *v4;
  SBInCallPresentationScreenSharingIcon *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 5)
    objc_msgSend(v3, "webClipIdentifier");
  else
    objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.InCallService")))
    {
      v5 = objc_alloc_init(SBInCallPresentationScreenSharingIcon);
    }
    else
    {
      +[SBIconController sharedInstance](SBIconController, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "model");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "expectedIconForDisplayIdentifier:createIfNecessary:", v4, 1);
      v5 = (SBInCallPresentationScreenSharingIcon *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_computeHeaderItems
{
  SBFluidSwitcherSpaceTitleItemController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __objc2_class **v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SBFluidSwitcherSpaceTitleItemController *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __objc2_class **v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v2 = self;
  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_displayItems;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v27;
    v7 = off_1E8E96000;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(objc_alloc(v7[34]), "initWithDisplayItem:", v9);
        if (objc_msgSend(v9, "type") == 6)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHELF_PLUS_CONTROL_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setTitleText:", v12);
        }
        else
        {
          -[NSMutableDictionary objectForKey:](v2->_displayItemToIcon, "objectForKey:", v9);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "displayNameForLocation:", CFSTR("SBIconLocationAppSwitcher"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setTitleText:", v13);

          -[NSMutableDictionary objectForKey:](v2->_displayItemToSceneHandle, "objectForKey:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sceneTitle");
          v15 = v2;
          v16 = v5;
          v17 = v4;
          v18 = v6;
          v19 = v7;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setSubtitleText:", v20);

          v7 = v19;
          v6 = v18;
          v4 = v17;
          v5 = v16;
          v2 = v15;
          v11 = v25;

          -[SBFluidSwitcherSpaceTitleItemController _iconImageForDisplayItem:](v2, "_iconImageForDisplayItem:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setImage:", v12);
        }

        if (v2->_useDarkLabels)
          objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        else
          objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTitleTextColor:", v21);

        if (v2->_useDarkLabels)
          v22 = 1;
        else
          v22 = 2;
        objc_msgSend(v10, "setSubtitleInterfaceStyle:", v22);
        objc_msgSend(v10, "setShowsMultiWindowIndicator:", SBLayoutRoleMaskContainsRole(v2->_multiWindowIndicatorRoleMask, -[SBAppLayout layoutRoleForItem:](v2->_appLayout, "layoutRoleForItem:", v9)));
        if (!v5)
          v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v2->_displayItems, "count"));
        objc_msgSend(v5, "addObject:", v10);

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_displayItemToSceneHandle, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeObserver:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherSpaceTitleItemController;
  -[SBFluidSwitcherSpaceTitleItemController dealloc](&v8, sel_dealloc);
}

- (void)invalidate
{
  self->_invalidated = 1;
}

- (void)iconImageDidUpdate:(id)a3
{
  id v4;
  NSMutableDictionary *displayItemToIcon;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, uint64_t, _BYTE *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__120;
  v17 = __Block_byref_object_dispose__120;
  v18 = 0;
  displayItemToIcon = self->_displayItemToIcon;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __62__SBFluidSwitcherSpaceTitleItemController_iconImageDidUpdate___block_invoke;
  v10 = &unk_1E8EBFF60;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](displayItemToIcon, "enumerateKeysAndObjectsUsingBlock:", &v7);
  if (v14[5])
    -[SBFluidSwitcherSpaceTitleItemController _loadIconForDisplayItem:](self, "_loadIconForDisplayItem:", v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
}

void __62__SBFluidSwitcherSpaceTitleItemController_iconImageDidUpdate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    -[SBFluidSwitcherSpaceTitleItemController _performUpdateHandler](self, "_performUpdateHandler");
  }
}

- (id)_iconImageAppearance
{
  void *v2;
  void *v3;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __67__SBFluidSwitcherSpaceTitleItemController__loadIconForDisplayItem___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[8];
  v6 = a1[9];
  BSDispatchMain();

}

void __67__SBFluidSwitcherSpaceTitleItemController__loadIconForDisplayItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  BOOL v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "imageForIcon:imageAppearance:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "objectForKey:", *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 72));

  if (v3)
    v4 = v5 == 0;
  else
    v4 = 1;
  if (!v4)
    objc_msgSend(*(id *)(a1 + 56), "_performUpdateHandler");

}

- (id)_iconImageForDisplayItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appSwitcherHeaderIconImageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFluidSwitcherSpaceTitleItemController _iconImageAppearance](self, "_iconImageAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_displayItemToIcon, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "imageForIcon:imageAppearance:options:", v8, v7, 0);
  else
    objc_msgSend(v6, "genericImageWithImageAppearance:options:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isUsingDarkLabels
{
  return self->_useDarkLabels;
}

- (unint64_t)multiWindowIndicatorRoleMask
{
  return self->_multiWindowIndicatorRoleMask;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_displayItemToSceneHandle, 0);
  objc_storeStrong((id *)&self->_displayItemToIcon, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
