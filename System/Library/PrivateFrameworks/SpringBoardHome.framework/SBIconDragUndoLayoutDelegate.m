@implementation SBIconDragUndoLayoutDelegate

- (SBIconDragUndoLayoutDelegate)initWithPreModificationInfo:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  SBIconDragUndoLayoutDelegate *v28;
  SBIconDragUndoLayoutDelegate *v29;
  void *v31;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  _QWORD v48[2];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "rootFolderController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dockListView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleListViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalIconsPerListView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v3;
  objc_msgSend(v3, "originalScreenLocationsPerIcon");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v4;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v58;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v58 != v34)
          objc_enumerationMutation(obj);
        v37 = v5;
        v6 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v5);
        objc_msgSend(v35, "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "icons");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v47 = v7;
        v9 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v54;
          v44 = *(_QWORD *)v54;
          v45 = v8;
          do
          {
            v12 = 0;
            v46 = v10;
            do
            {
              if (*(_QWORD *)v54 != v11)
                objc_enumerationMutation(v47);
              v13 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v12);
              if ((objc_msgSend(v8, "containsObject:", v13) & 1) == 0)
              {
                v51 = 0u;
                v52 = 0u;
                v49 = 0u;
                v50 = 0u;
                v14 = obj;
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
                if (v15)
                {
                  v16 = v15;
                  v17 = *(_QWORD *)v50;
                  while (2)
                  {
                    for (i = 0; i != v16; ++i)
                    {
                      if (*(_QWORD *)v50 != v17)
                        objc_enumerationMutation(v14);
                      v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                      if (v19 != v6)
                      {
                        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "model");
                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                        v21 = objc_msgSend(v20, "directlyContainsIcon:", v13);

                        if (v21)
                        {
                          objc_msgSend(v41, "objectForKey:", v13);
                          v22 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v40, "setObject:forKey:", v22, v13);
                          objc_msgSend(v19, "centerForIcon:", v13);
                          objc_msgSend(v19, "convertPoint:toView:", 0);
                          v48[0] = v23;
                          v48[1] = v24;
                          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v48, "{CGPoint=dd}");
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v39, "setObject:forKey:", v25, v13);

                          if (v19 == v42)
                            objc_msgSend(v38, "addObject:", v13);

                          goto LABEL_25;
                        }
                      }
                    }
                    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
                    if (v16)
                      continue;
                    break;
                  }
                }
LABEL_25:

                v11 = v44;
                v8 = v45;
                v10 = v46;
              }
              ++v12;
            }
            while (v12 != v10);
            v10 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
          }
          while (v10);
        }

        v5 = v37 + 1;
      }
      while (v37 + 1 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v36);
  }

  if (objc_msgSend(v40, "count"))
  {
    v27 = v38;
    v26 = v39;
    v28 = -[SBIconDragUndoLayoutDelegate initWithOriginalIconScreenLocations:destinationIconScreenLocations:iconsAtHigherZLevel:](self, "initWithOriginalIconScreenLocations:destinationIconScreenLocations:iconsAtHigherZLevel:", v40, v39, v38);
    v29 = v28;
  }
  else
  {
    v29 = 0;
    v28 = self;
    v27 = v38;
    v26 = v39;
  }

  return v29;
}

- (SBIconDragUndoLayoutDelegate)initWithOriginalIconScreenLocations:(id)a3 destinationIconScreenLocations:(id)a4 iconsAtHigherZLevel:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBIconDragUndoLayoutDelegate *v11;
  uint64_t v12;
  NSMapTable *originalIconScreenLocations;
  uint64_t v14;
  NSMapTable *destinationIconScreenLocations;
  uint64_t v16;
  NSSet *iconsAtHigherZLevel;
  void *v18;
  uint64_t v19;
  SBHIconEditingSettings *iconEditingSettings;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBIconDragUndoLayoutDelegate;
  v11 = -[SBIconDragUndoLayoutDelegate init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    originalIconScreenLocations = v11->_originalIconScreenLocations;
    v11->_originalIconScreenLocations = (NSMapTable *)v12;

    v14 = objc_msgSend(v9, "copy");
    destinationIconScreenLocations = v11->_destinationIconScreenLocations;
    v11->_destinationIconScreenLocations = (NSMapTable *)v14;

    v16 = objc_msgSend(v10, "copy");
    iconsAtHigherZLevel = v11->_iconsAtHigherZLevel;
    v11->_iconsAtHigherZLevel = (NSSet *)v16;

    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "iconEditingSettings");
    v19 = objc_claimAutoreleasedReturnValue();
    iconEditingSettings = v11->_iconEditingSettings;
    v11->_iconEditingSettings = (SBHIconEditingSettings *)v19;

  }
  return v11;
}

- (id)iconListView:(id)a3 animatorForLayingOutIconView:(id)a4 proposedAnimator:(id)a5
{
  SBIconDragUndoLayoutDelegate *v7;
  void *v8;
  void *v9;
  SBIconDragUndoLayoutDelegate *v10;
  SBIconDragUndoLayoutDelegate *v11;

  v7 = (SBIconDragUndoLayoutDelegate *)a5;
  objc_msgSend(a4, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_originalIconScreenLocations, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = self;
  else
    v10 = v7;
  v11 = v10;

  return v11;
}

- (id)iconListView:(id)a3 animatorForRemovingIcons:(id)a4 proposedAnimator:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  SBIconDragUndoLayoutDelegate *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[NSMapTable objectForKey:](self->_originalIconScreenLocations, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = self;

          goto LABEL_11;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }

  v15 = (SBIconDragUndoLayoutDelegate *)v8;
LABEL_11:

  return v15;
}

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  unint64_t var7;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  NSMutableArray *iconViewsHiddenForRemovalAnimation;
  NSMutableArray *v22;
  NSMutableArray *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  CGPoint var0;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  SBIconCoordinate var4;
  __int128 v32;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "icon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragUndoLayoutDelegate iconsAtHigherZLevel](self, "iconsAtHigherZLevel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v13);

  if ((v15 & 1) != 0)
  {
    -[NSMapTable objectForKey:](self->_originalIconScreenLocations, "objectForKey:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "CGPointValue");
    objc_msgSend(v10, "convertPoint:fromView:", 0);
    objc_msgSend(v11, "setCenter:");
    objc_msgSend(v11, "setHidden:", 0);
    objc_msgSend(v11, "setAlpha:", 1.0);
    var7 = a5->var7;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __115__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
    v24[3] = &unk_1E8D88918;
    v25 = v11;
    v18 = *(_OWORD *)&a5->var2.continuousCornerRadius;
    v29 = *(_OWORD *)&a5->var2.size.height;
    v30 = v18;
    v19 = *(_OWORD *)&a5->var5;
    var4 = a5->var4;
    v32 = v19;
    v20 = *(_OWORD *)&a5->var1;
    var0 = a5->var0;
    v28 = v20;
    v26 = v12;
    -[SBIconDragUndoLayoutDelegate animateWithOptions:animations:completion:](self, "animateWithOptions:animations:completion:", var7, v24, 0);

  }
  else
  {
    iconViewsHiddenForRemovalAnimation = self->_iconViewsHiddenForRemovalAnimation;
    if (!iconViewsHiddenForRemovalAnimation)
    {
      v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = self->_iconViewsHiddenForRemovalAnimation;
      self->_iconViewsHiddenForRemovalAnimation = v22;

      iconViewsHiddenForRemovalAnimation = self->_iconViewsHiddenForRemovalAnimation;
    }
    -[NSMutableArray addObject:](iconViewsHiddenForRemovalAnimation, "addObject:", v11);
    objc_msgSend(v11, "setHidden:", 1);
  }

}

uint64_t __115__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setIconContentScale:", *(double *)(a1 + 64));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t (*__ptr32 *v12)();
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  NSObject *group;
  id v31;
  _QWORD block[5];
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  _QWORD v36[5];
  NSObject *v37;
  _QWORD v38[7];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v8 = a4;
  v9 = a5;
  group = dispatch_group_create();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  v12 = &off_1D0190000;
  if (v11)
  {
    v13 = v11;
    v29 = v9;
    v14 = 0;
    v15 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v17, "icon");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](self->_originalIconScreenLocations, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[SBIconDragUndoLayoutDelegate iconsAtHigherZLevel](self, "iconsAtHigherZLevel");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "containsObject:", v18);

          if ((v21 & 1) != 0)
          {
            objc_msgSend(v17, "setHidden:", 1);
          }
          else
          {
            -[NSMapTable objectForKey:](self->_destinationIconScreenLocations, "objectForKey:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "CGPointValue");
            objc_msgSend(v31, "convertPoint:fromView:", 0);
            v24 = v23;
            v26 = v25;
            dispatch_group_enter(group);
            v38[0] = MEMORY[0x1E0C809B0];
            v38[1] = 3221225472;
            v38[2] = __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke;
            v38[3] = &unk_1E8D886D8;
            v38[4] = v17;
            v38[5] = v24;
            v38[6] = v26;
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_2;
            v36[3] = &unk_1E8D853D8;
            v36[4] = v17;
            v37 = group;
            -[SBIconDragUndoLayoutDelegate animateWithOptions:animations:completion:](self, "animateWithOptions:animations:completion:", 0, v38, v36);

          }
        }
        else
        {
          if (!v14)
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v14, "addObject:", v17);
        }

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v13);

    if (!v14)
    {
      v9 = v29;
      v12 = &off_1D0190000;
      goto LABEL_20;
    }
    dispatch_group_enter(group);
    -[SBIconDragUndoLayoutDelegate defaultRemovalAnimator](self, "defaultRemovalAnimator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_3;
    v34[3] = &unk_1E8D84C50;
    v35 = group;
    objc_msgSend(v27, "iconListView:wantsAnimatedRemovalForIconViews:completionHandler:", v31, v14, v34);

    v9 = v29;
    v12 = &off_1D0190000;
  }
  else
  {
    v14 = 0;
    v27 = v10;
  }

LABEL_20:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = *((_QWORD *)v12 + 254);
  block[2] = __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_4;
  block[3] = &unk_1E8D84D28;
  block[4] = self;
  v33 = v9;
  v28 = v9;
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

}

uint64_t __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "setHidden:", 0, (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)animateWithOptions:(unint64_t)a3 animations:(id)a4 completion:(id)a5
{
  id v8;
  SBHIconEditingSettings *iconEditingSettings;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a4;
  iconEditingSettings = self->_iconEditingSettings;
  v10 = a5;
  -[SBHIconEditingSettings defaultSpringDuration](iconEditingSettings, "defaultSpringDuration");
  v12 = v11;
  -[SBHIconEditingSettings defaultSpringDampingRatio](self->_iconEditingSettings, "defaultSpringDampingRatio");
  v14 = v13;
  v15 = (void *)MEMORY[0x1E0DC3F10];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__SBIconDragUndoLayoutDelegate_animateWithOptions_animations_completion___block_invoke;
  v17[3] = &unk_1E8D859C0;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v15, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", a3, v17, v10, v12, 0.0, v14, 0.0);

}

void __73__SBIconDragUndoLayoutDelegate_animateWithOptions_animations_completion___block_invoke(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  double v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  CAFrameRateRange v11;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v11.minimum;
  maximum = v11.maximum;
  preferred = v11.preferred;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SBIconDragUndoLayoutDelegate_animateWithOptions_animations_completion___block_invoke_2;
  v9[3] = &unk_1E8D859C0;
  v10 = *(id *)(a1 + 32);
  *(float *)&v6 = minimum;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114131, v9, v6, v7, v8);

}

uint64_t __73__SBIconDragUndoLayoutDelegate_animateWithOptions_animations_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSMapTable)originalIconScreenLocations
{
  return self->_originalIconScreenLocations;
}

- (NSMapTable)destinationIconScreenLocations
{
  return self->_destinationIconScreenLocations;
}

- (NSSet)iconsAtHigherZLevel
{
  return self->_iconsAtHigherZLevel;
}

- (SBIconListLayoutAnimating)defaultRemovalAnimator
{
  return self->_defaultRemovalAnimator;
}

- (void)setDefaultRemovalAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_defaultRemovalAnimator, a3);
}

- (SBHIconEditingSettings)iconEditingSettings
{
  return self->_iconEditingSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_storeStrong((id *)&self->_defaultRemovalAnimator, 0);
  objc_storeStrong((id *)&self->_iconsAtHigherZLevel, 0);
  objc_storeStrong((id *)&self->_destinationIconScreenLocations, 0);
  objc_storeStrong((id *)&self->_originalIconScreenLocations, 0);
  objc_storeStrong((id *)&self->_iconViewsHiddenForRemovalAnimation, 0);
}

@end
