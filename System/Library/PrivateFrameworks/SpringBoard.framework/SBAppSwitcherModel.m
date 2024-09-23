@implementation SBAppSwitcherModel

- (id)appLayoutsForBundleIdentifier:(id)a3 includingHiddenAppLayouts:(BOOL)a4
{
  return -[SBRecentAppLayouts recentsForBundleIdentifier:includingHiddenAppLayouts:](self->_recents, "recentsForBundleIdentifier:includingHiddenAppLayouts:", a3, a4);
}

- (id)_recentAppLayoutsController
{
  return self->_recents;
}

- (id)recentDisplayItemsForBundleIdentifier:(id)a3 includingHiddenAppLayouts:(BOOL)a4
{
  return -[SBRecentAppLayouts recentDisplayItemsForBundleIdentifier:includingHiddenAppLayouts:](self->_recents, "recentDisplayItemsForBundleIdentifier:includingHiddenAppLayouts:", a3, a4);
}

void __75__SBAppSwitcherModel_initWithIconController_applicationController_recents___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recentsIncludingHiddenAppLayouts:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("SBRecentAppLayoutsDidInsertAtIndexesKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__SBAppSwitcherModel_initWithIconController_applicationController_recents___block_invoke_2;
  v12[3] = &unk_1E8EAD918;
  v13 = v6;
  v14 = WeakRetained;
  v9 = WeakRetained;
  v11 = v6;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v12);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("SBAppSwitcherModelDidChangeNotification"), v9);

}

- (id)appLayoutsIncludingHiddenAppLayouts:(BOOL)a3
{
  return -[SBRecentAppLayouts recentsIncludingHiddenAppLayouts:](self->_recents, "recentsIncludingHiddenAppLayouts:", a3);
}

void __47__SBAppSwitcherModel__warmUpIconsForAppLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expectedIconForDisplayIdentifier:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isApplicationIcon"))
    v6 = (id)objc_msgSend(*(id *)(a1 + 40), "cacheImageForIcon:compatibleWithTraitCollection:options:completionHandler:", v7, *(_QWORD *)(a1 + 48), 0, 0);

}

void __75__SBAppSwitcherModel_initWithIconController_applicationController_recents___block_invoke_2(uint64_t a1, unint64_t a2)
{
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "count") > a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isHidden") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "_warmUpIconsForAppLayout:", v4);

  }
}

- (void)_warmUpIconsForAppLayout:(id)a3
{
  SBIconController *iconController;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  iconController = self->_iconController;
  v5 = a3;
  -[SBIconController model](iconController, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController appSwitcherHeaderIconImageCache](self->_iconController, "appSwitcherHeaderIconImageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconController homeScreenViewController](self->_iconController, "homeScreenViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__SBAppSwitcherModel__warmUpIconsForAppLayout___block_invoke;
  v13[3] = &unk_1E8EA4E00;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v5, "enumerate:", v13);

}

- (void)noteDisplayItemLayoutAttributesMapChangedForAppLayout:(id)a3 displayOrdinal:(int64_t)a4
{
  -[SBRecentAppLayouts noteDisplayItemLayoutAttributesMapChangedForAppLayout:displayOrdinal:](self->_recents, "noteDisplayItemLayoutAttributesMapChangedForAppLayout:displayOrdinal:", a3, a4);
}

- (void)addToFront:(id)a3
{
  -[SBRecentAppLayouts addToFront:](self->_recents, "addToFront:", a3);
}

- (id)recentAppLayouts:(id)a3 willAddAppLayout:(id)a4 replacingAppLayouts:(id)a5 removingAppLayouts:(id)a6
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;
  void *v15;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "appSwitcherModel:willAddAppLayout:replacingAppLayouts:removingAppLayouts:", self, v9, v10, v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v9;
  }
  v15 = v14;

  return v15;
}

- (SBAppSwitcherModel)initWithIconController:(id)a3 applicationController:(id)a4 recents:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBAppSwitcherModel *v12;
  void *v13;
  void *v14;
  SBRecentAppLayouts *recents;
  uint64_t v16;
  id recentsChangedNotificationObserver;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBAppSwitcherModel;
  v12 = -[SBAppSwitcherModel init](&v22, sel_init);
  if (v12)
  {
    kdebug_trace();
    objc_storeStrong((id *)&v12->_recents, a5);
    -[SBRecentAppLayouts setDelegate:](v12->_recents, "setDelegate:", v12);
    objc_storeStrong((id *)&v12->_iconController, a3);
    -[SBRecentAppLayouts recentsIncludingHiddenAppLayouts:](v12->_recents, "recentsIncludingHiddenAppLayouts:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppSwitcherModel _warmUpIconsForRecentAppLayouts:](v12, "_warmUpIconsForRecentAppLayouts:", v13);

    objc_initWeak(&location, v12);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    recents = v12->_recents;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__SBAppSwitcherModel_initWithIconController_applicationController_recents___block_invoke;
    v19[3] = &unk_1E8EAD940;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", CFSTR("SBRecentAppLayoutsDidChangeNotification"), recents, 0, v19);
    v16 = objc_claimAutoreleasedReturnValue();
    recentsChangedNotificationObserver = v12->_recentsChangedNotificationObserver;
    v12->_recentsChangedNotificationObserver = (id)v16;

    kdebug_trace();
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (SBAppSwitcherModel)init
{
  void *v3;
  void *v4;
  SBRecentAppLayouts *v5;
  SBAppSwitcherModel *v6;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(SBRecentAppLayouts);
  v6 = -[SBAppSwitcherModel initWithIconController:applicationController:recents:](self, "initWithIconController:applicationController:recents:", v3, v4, v5);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_recentsChangedNotificationObserver);

  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherModel;
  -[SBAppSwitcherModel dealloc](&v4, sel_dealloc);
}

- (void)addAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  -[SBRecentAppLayouts addAppLayout:atIndex:](self->_recents, "addAppLayout:atIndex:", a3, a4);
}

- (void)addAppLayout:(id)a3 afterAppLayout:(id)a4
{
  -[SBRecentAppLayouts addAppLayout:afterAppLayout:](self->_recents, "addAppLayout:afterAppLayout:", a3, a4);
}

- (void)replaceAppLayout:(id)a3 withAppLayout:(id)a4
{
  -[SBRecentAppLayouts replaceAppLayout:withAppLayout:](self->_recents, "replaceAppLayout:withAppLayout:", a3, a4);
}

- (void)remove:(id)a3
{
  -[SBRecentAppLayouts remove:](self->_recents, "remove:", a3);
}

- (void)removeAppLayouts:(id)a3
{
  -[SBRecentAppLayouts removeAppLayouts:](self->_recents, "removeAppLayouts:", a3);
}

- (void)hide:(id)a3
{
  -[SBRecentAppLayouts hide:](self->_recents, "hide:", a3);
}

+ (NSString)appSwitcherHeaderIconImageDescriptorName
{
  id *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      v2 = (id *)MEMORY[0x1E0D3A888];
    else
      v2 = (id *)MEMORY[0x1E0D3A890];
    v6 = *v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");
    v5 = (id *)MEMORY[0x1E0D3A890];
    if (v4 == 1)
      v5 = (id *)MEMORY[0x1E0D3A888];
    v6 = *v5;

  }
  return (NSString *)v6;
}

- (void)_warmUpIconsForRecentAppLayouts:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "count");
  if (v4 >= 0xF)
    v5 = 15;
  else
    v5 = v4;
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherModel _warmUpIconsForAppLayout:](self, "_warmUpIconsForAppLayout:", v7);

    }
  }

}

- (void)modifyWithDropContext:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  int64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void (**v31)(void);
  void (**v32)(void);
  void (**v33)(void);
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  id v50;
  uint64_t *v51;
  _QWORD v52[5];
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  unint64_t v59;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDropRegion");
  v6 = objc_msgSend(v4, "currentDropAction");
  if ((SBSwitcherDropRegionWarrantsModelUpdate(v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppSwitcherModel.m"), 161, CFSTR("Unsupported drop region provided to modifyWithDropContext."));

  }
  objc_msgSend(v4, "draggingAppLayout", a2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "itemForLayoutRole:", objc_msgSend(v4, "draggingLayoutRole"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intersectingAppLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemForLayoutRole:", 1);
  v9 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v7;
  v10 = -[SBAppSwitcherModel indexOfDisplayItem:visible:](self, "indexOfDisplayItem:visible:", v7, 1);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", v44, self, CFSTR("SBAppSwitcherModel.m"), 172, CFSTR("Couldn't find the dragged app layout's index"));

  }
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v59 = -[SBAppSwitcherModel indexOfDisplayItem:visible:](self, "indexOfDisplayItem:visible:", v9, 1);
  if (v6 != 3 && v6 != 5 && v57[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", v44, self, CFSTR("SBAppSwitcherModel.m"), 178, CFSTR("Couldn't find the target app layout's index"));

  }
  -[SBAppSwitcherModel appLayoutsIncludingHiddenAppLayouts:](self, "appLayoutsIncludingHiddenAppLayouts:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isOrContainsAppLayout:", v8);

  v14 = (void *)v9;
  switch(v6)
  {
    case 1:
      if (objc_msgSend(v47, "isSplitConfiguration"))
      {
        objc_msgSend(v4, "remainingAppLayout");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBAppSwitcherModel replaceAppLayout:withAppLayout:](self, "replaceAppLayout:withAppLayout:", v47, v15);

      }
      else
      {
        -[SBAppSwitcherModel remove:](self, "remove:", v47);
      }
      objc_msgSend(v4, "finalTargetAppLayout");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherModel addAppLayout:atIndex:](self, "addAppLayout:atIndex:", v17, 0);
      goto LABEL_43;
    case 2:
      -[SBAppSwitcherModel remove:](self, "remove:", v47);
      objc_msgSend(v4, "finalTargetAppLayout");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherModel replaceAppLayout:withAppLayout:](self, "replaceAppLayout:withAppLayout:", v8, v17);
      if (!objc_msgSend(v8, "isSplitConfiguration"))
        goto LABEL_43;
      objc_msgSend(v4, "evictedAppLayout");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherModel addAppLayout:afterAppLayout:](self, "addAppLayout:afterAppLayout:", v20, v17);
      goto LABEL_42;
    case 3:
      -[SBAppSwitcherModel remove:](self, "remove:", v47);
      objc_msgSend(v4, "closestVisibleAppLayout");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "itemForLayoutRole:", 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      v22 = -[SBAppSwitcherModel indexOfDisplayItem:visible:](self, "indexOfDisplayItem:visible:", v17, 0);
      objc_msgSend(v4, "finalTargetAppLayout");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isSplitConfiguration"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v44, self, CFSTR("SBAppSwitcherModel.m"), 210, CFSTR("Expected full configuration layout"));

      }
      -[SBAppSwitcherModel addAppLayout:atIndex:](self, "addAppLayout:atIndex:", v20, v22);
      goto LABEL_42;
    case 4:
      objc_msgSend(v4, "finalTargetAppLayout");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherModel replaceAppLayout:withAppLayout:](self, "replaceAppLayout:withAppLayout:", v47, v17);
      goto LABEL_43;
    case 5:
      objc_msgSend(v4, "closestVisibleAppLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "itemForLayoutRole:", 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      v18 = -[SBAppSwitcherModel indexOfDisplayItem:visible:](self, "indexOfDisplayItem:visible:", v17, 0);
      objc_msgSend(v4, "remainingAppLayout");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherModel replaceAppLayout:withAppLayout:](self, "replaceAppLayout:withAppLayout:", v47, v19);

      objc_msgSend(v4, "finalTargetAppLayout");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (void *)v9;
      -[SBAppSwitcherModel addAppLayout:atIndex:](self, "addAppLayout:atIndex:", v20, v18);
      goto LABEL_42;
    case 6:
      objc_msgSend(v4, "evictedAppLayout");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", v44, self, CFSTR("SBAppSwitcherModel.m"), 308, CFSTR("Full -> Full shouldn't have an evicted layout"));

      }
      objc_msgSend(v4, "remainingAppLayout");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", v44, self, CFSTR("SBAppSwitcherModel.m"), 309, CFSTR("Full -> Full shouldn't have a remaining layout"));

      }
      -[SBAppSwitcherModel remove:](self, "remove:", v47);
      -[SBAppSwitcherModel remove:](self, "remove:", v8);
      if (v13
        && (objc_msgSend(v47, "isSplitConfiguration") & 1) == 0
        && (objc_msgSend(v8, "isSplitConfiguration") & 1) == 0)
      {
        --v57[3];
      }
      v25 = -[SBAppSwitcherModel _adjustedIndexForVisibleAppLayoutAtIndex:](self, "_adjustedIndexForVisibleAppLayoutAtIndex:", v57[3]);
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", v44, self, CFSTR("SBAppSwitcherModel.m"), 320, CFSTR("Failed to find the adjusted insertion index"));

      }
      objc_msgSend(v4, "finalTargetAppLayout");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherModel addAppLayout:atIndex:](self, "addAppLayout:atIndex:", v17, v25);
      goto LABEL_43;
    case 7:
      v26 = v57[3];
      objc_msgSend(v4, "finalTargetAppLayout");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v26;
      objc_msgSend(v4, "evictedAppLayout");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherModel remove:](self, "remove:", v47);
      -[SBAppSwitcherModel remove:](self, "remove:", v8);
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __44__SBAppSwitcherModel_modifyWithDropContext___block_invoke;
      v52[3] = &unk_1E8EA9150;
      v55 = &v56;
      v52[4] = self;
      v29 = v28;
      v53 = v29;
      v30 = v27;
      v54 = v30;
      v31 = (void (**)(void))MEMORY[0x1D17E5550](v52);
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __44__SBAppSwitcherModel_modifyWithDropContext___block_invoke_2;
      v48[3] = &unk_1E8EAD968;
      v48[4] = self;
      v51 = &v56;
      v17 = v30;
      v49 = v17;
      v20 = v29;
      v50 = v20;
      v32 = (void (**)(void))MEMORY[0x1D17E5550](v48);
      if (v45 <= v10)
      {
        v34 = objc_msgSend(v4, "intersectingAppLayoutIsOnFirstRow");
        v14 = (void *)v9;
      }
      else
      {
        v33 = v31;
        v14 = (void *)v9;
        if ((v13 & 1) != 0)
          goto LABEL_41;
        v34 = objc_msgSend(v4, "intersectingAppLayoutIsOnFirstRow");
      }
      if (v34)
        v33 = v32;
      else
        v33 = v31;
LABEL_41:
      v33[2]();

LABEL_42:
LABEL_43:

LABEL_44:
      _Block_object_dispose(&v56, 8);

      return;
    case 8:
      objc_msgSend(v4, "finalTargetAppLayout");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherModel replaceAppLayout:withAppLayout:](self, "replaceAppLayout:withAppLayout:", v8, v17);
      objc_msgSend(v4, "remainingAppLayout");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherModel replaceAppLayout:withAppLayout:](self, "replaceAppLayout:withAppLayout:", v47, v20);
      goto LABEL_42;
    case 9:
      objc_msgSend(v4, "finalTargetAppLayout");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "evictedAppLayout");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "remainingAppLayout");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAppSwitcherModel replaceAppLayout:withAppLayout:](self, "replaceAppLayout:withAppLayout:", v47, v35);
      -[SBAppSwitcherModel replaceAppLayout:withAppLayout:](self, "replaceAppLayout:withAppLayout:", v8, v17);
      -[SBAppSwitcherModel addAppLayout:afterAppLayout:](self, "addAppLayout:afterAppLayout:", v20, v17);

      goto LABEL_42;
    default:
      goto LABEL_44;
  }
}

uint64_t __44__SBAppSwitcherModel_modifyWithDropContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addAppLayout:atIndex:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_adjustedIndexForVisibleAppLayoutAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) - 1));
  return objc_msgSend(*(id *)(a1 + 32), "addAppLayout:atIndex:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "_adjustedIndexForVisibleAppLayoutAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)));
}

uint64_t __44__SBAppSwitcherModel_modifyWithDropContext___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addAppLayout:atIndex:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_adjustedIndexForVisibleAppLayoutAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)));
  return objc_msgSend(*(id *)(a1 + 32), "addAppLayout:atIndex:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "_adjustedIndexForVisibleAppLayoutAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 1));
}

- (unint64_t)indexOfDisplayItem:(id)a3 visible:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a4;
  v6 = a3;
  -[SBRecentAppLayouts recentsIncludingHiddenAppLayouts:](self->_recents, "recentsIncludingHiddenAppLayouts:", !v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__SBAppSwitcherModel_indexOfDisplayItem_visible___block_invoke;
  v11[3] = &unk_1E8EA8608;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __49__SBAppSwitcherModel_indexOfDisplayItem_visible___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)appLayoutContainingDisplayItem:(id)a3 includingHiddenAppLayouts:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBRecentAppLayouts recentsIncludingHiddenAppLayouts:](self->_recents, "recentsIncludingHiddenAppLayouts:", v4);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v11, "containsItem:", v6, (_QWORD)v13) & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (int64_t)_adjustedIndexForVisibleAppLayoutAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  -[SBAppSwitcherModel appLayoutsIncludingHiddenAppLayouts:](self, "appLayoutsIncludingHiddenAppLayouts:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherModel appLayoutsIncludingHiddenAppLayouts:](self, "appLayoutsIncludingHiddenAppLayouts:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") <= a3)
  {
    v9 = objc_msgSend(v5, "count");
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemForLayoutRole:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBAppSwitcherModel indexOfDisplayItem:visible:](self, "indexOfDisplayItem:visible:", v8, 0);

  }
  return v9;
}

- (id)bestLastDisplayItemLayoutAttributesMapForAppLayout:(id)a3 displayOrdinal:(int64_t)a4
{
  return -[SBRecentAppLayouts bestLastDisplayItemLayoutAttributesMapForAppLayout:displayOrdinal:](self->_recents, "bestLastDisplayItemLayoutAttributesMapForAppLayout:displayOrdinal:", a3, a4);
}

- (void)takeAppLayoutsSnapshot
{
  NSArray *v3;
  NSArray *appLayoutsSnapshot;

  -[SBRecentAppLayouts recentsIncludingHiddenAppLayouts:](self->_recents, "recentsIncludingHiddenAppLayouts:", 1);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  appLayoutsSnapshot = self->_appLayoutsSnapshot;
  self->_appLayoutsSnapshot = v3;

}

- (void)restoreAppLayoutsSnapshot
{
  -[SBRecentAppLayouts _ppt_setModel:](self->_recents, "_ppt_setModel:", self->_appLayoutsSnapshot);
}

- (void)clearAppLayoutsSnapshot
{
  NSArray *appLayoutsSnapshot;

  appLayoutsSnapshot = self->_appLayoutsSnapshot;
  self->_appLayoutsSnapshot = 0;

}

- (void)recentAppLayouts:(id)a3 didRemoveAppLayoutForFallingOffList:(id)a4
{
  SBAppSwitcherModelDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "appSwitcherModel:didRemoveAppLayoutForFallingOffList:", self, v6);

}

- (id)recentAppLayouts:(id)a3 willReplaceAppLayout:(id)a4 proposedReplacementAppLayout:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "appSwitcherModel:willReplaceAppLayout:proposedReplacementAppLayout:", self, v7, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v8;
  }
  v12 = v11;

  return v12;
}

- (SBAppSwitcherModelDelegate)delegate
{
  return (SBAppSwitcherModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appLayoutsSnapshot, 0);
  objc_storeStrong(&self->_recentsChangedNotificationObserver, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
}

@end
