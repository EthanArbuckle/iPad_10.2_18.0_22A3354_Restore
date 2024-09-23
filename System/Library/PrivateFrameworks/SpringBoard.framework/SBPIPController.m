@implementation SBPIPController

- (void)_visualizeKeyboardFrameIfNeeded
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UIView *keyboardInsetsVisualizerView;
  UIView *v28;
  UIView *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneManager);
  objc_msgSend(WeakRetained, "embeddedDisplayWindowScene");
  v33 = (id)objc_claimAutoreleasedReturnValue();

  if (-[SBPIPController isPictureInPictureWindowVisibleOnWindowScene:](self, "isPictureInPictureWindowVisibleOnWindowScene:", v33)&& (+[SBDefaults localDefaults](SBDefaults, "localDefaults"), v4 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "pipDefaults"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "visualizeKeyboardFrame"), v5, v4, v6))
  {
    objc_msgSend(MEMORY[0x1E0CEA828], "visiblePeripheralFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[SBPIPController _leadingWindowForWindowScene:](self, "_leadingWindowForWindowScene:", v33);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "screen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "coordinateSpace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "coordinateSpace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:toCoordinateSpace:", v18, v8, v10, v12, v14);
    v23 = v19;
    v24 = v20;
    v25 = v21;
    v26 = v22;
    keyboardInsetsVisualizerView = self->_keyboardInsetsVisualizerView;
    if (v15 && !keyboardInsetsVisualizerView)
    {
      v28 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v19, v20, v21, v22);
      v29 = self->_keyboardInsetsVisualizerView;
      self->_keyboardInsetsVisualizerView = v28;

      -[UIView setUserInteractionEnabled:](self->_keyboardInsetsVisualizerView, "setUserInteractionEnabled:", 0);
      -[UIView layer](self->_keyboardInsetsVisualizerView, "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v30, "setBorderColor:", objc_msgSend(v31, "CGColor"));

      -[UIView layer](self->_keyboardInsetsVisualizerView, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setBorderWidth:", 5.0);

      objc_msgSend(v15, "addSubview:", self->_keyboardInsetsVisualizerView);
      keyboardInsetsVisualizerView = self->_keyboardInsetsVisualizerView;
    }
    -[UIView setFrame:](keyboardInsetsVisualizerView, "setFrame:", v23, v24, v25, v26);
    objc_msgSend(v15, "bringSubviewToFront:", self->_keyboardInsetsVisualizerView);

  }
  else
  {
    -[UIView removeFromSuperview](self->_keyboardInsetsVisualizerView, "removeFromSuperview");
    v15 = self->_keyboardInsetsVisualizerView;
    self->_keyboardInsetsVisualizerView = 0;
  }

}

- (BOOL)isPictureInPictureWindowVisibleOnWindowScene:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SBPIPController _shouldHideWindowScene:](self, "_shouldHideWindowScene:", v4))
  {
    if (v4)
    {
      -[SBPIPController _leadingWindowForWindowScene:](self, "_leadingWindowForWindowScene:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 != 0;

      goto LABEL_15;
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[SBPIPController _windowScenesDisplayingPIPContent](self, "_windowScenesDisplayingPIPContent", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          -[SBPIPController _leadingWindowForWindowScene:](self, "_leadingWindowForWindowScene:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {

            v5 = 1;
            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  v5 = 0;
LABEL_15:

  return v5;
}

- (id)_leadingWindowForWindowScene:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__118;
  v12 = __Block_byref_object_dispose__118;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SBPIPController__leadingWindowForWindowScene___block_invoke;
  v7[3] = &unk_1E8EBF280;
  v7[4] = &v8;
  -[SBPIPController _enumerateContextsForWindowScene:usingBlock:](self, "_enumerateContextsForWindowScene:usingBlock:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_enumerateContextsForWindowScene:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BYTE *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _BYTE *))a4;
  v19 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMapTable objectEnumerator](self->_containerViewControllerToContextMap, "objectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
      objc_msgSend(v13, "windowScene");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 == v6)
      {
        v7[2](v7, v13, &v19);
        if (v19)
          break;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_windowScenesDisplayingPIPContent
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_containerViewControllerToContextMap, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "windowScene");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (UIEdgeInsets)_updatePictureInPictureOverlayInsetsOnWindowScene:(id)a3 withCurrentLayoutState:(BOOL)a4 toHomeScreen:(BOOL)a5 toInterfaceOrientation:(int64_t)a6 shouldUpdate:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  void *v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  void *v36;
  void *v37;
  double v38;
  int v39;
  double v40;
  double v41;
  double v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  double v45;
  double v46;
  double v47;
  double v48;
  int v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  uint64_t i;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  NSMapTable *windowSceneToWindowMarginsMap;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  uint64_t v86;
  double v87;
  double v88;
  double v89;
  double v90;
  _BOOL4 v91;
  double v92;
  _QWORD v93[4];
  char v94;
  char v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  char v105;
  _BYTE v106[128];
  uint64_t v107;
  UIEdgeInsets result;

  v91 = a7;
  v7 = a5;
  v8 = a4;
  v107 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[NSMapTable objectForKey:](self->_windowSceneToWindowMarginsMap, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UIEdgeInsetsValue");
  v89 = v12;
  v90 = v13;
  v86 = v14;
  v88 = v15;

  v17 = *MEMORY[0x1E0CEB4B0];
  v16 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v18 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v19 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0;
  -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 1, v10, &v105);
  v92 = v19;
  v22 = v18;
  v23 = v16;
  v24 = v17;
  if (v105)
  {
    v25 = v21;
    objc_msgSend(v20, "homeScreenViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "orientation");
    v23 = 0.0;
    if ((unint64_t)(v27 - 3) >= 2)
      v22 = v25;
    else
      v22 = 0.0;
    if ((unint64_t)(v27 - 3) >= 2)
      v28 = 0.0;
    else
      v28 = v25;
    v92 = v28;

    v24 = 0.0;
  }
  objc_msgSend(v10, "switcherController", v86);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "unlockedEnvironmentMode");
  if ((objc_msgSend(v20, "isTodayOverlaySpotlightVisible") & 1) != 0)
  {
    v31 = 1;
  }
  else
  {
    objc_msgSend(v20, "searchPresenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v32, "isPresenting");

  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "userInterfaceIdiom");

  if ((v34 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v35 = 0;
    if (!v8)
    {
LABEL_14:
      if (objc_msgSend(v10, "isMainDisplayWindowScene"))
      {
        objc_msgSend(v20, "iconManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v36, "hasOpenFolderInLocation:", *MEMORY[0x1E0DAA9E8]) & 1) == 0)
        {
          objc_msgSend(v10, "floatingDockController");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "floatingDockHeight");
          if (v22 < v38)
            v22 = v38;

        }
      }
      goto LABEL_33;
    }
  }
  else
  {
    v39 = v31 ^ 1;
    if (self->_unlockedEnvironmentModeWhenKeyboardFocusChanged == v30)
      v39 = 0;
    v35 = v39 | v7;
    if (!v8)
      goto LABEL_14;
  }
  if (objc_msgSend(v29, "layoutContainsRole:", 1))
  {
    v104 = 0;
    -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 2, v10, &v104);
    if (v104)
      v22 = v40;
    else
      v22 = v18;
    v103 = 0;
    -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 3, v10, &v103);
    v42 = v41;
    v43 = objc_msgSend(v29, "layoutContainsRole:", 2);
    if (v103)
      v44 = v43;
    else
      v44 = 0;
    if ((v44 & (v22 < v42)) != 0)
      v22 = v42;
    v92 = v19;
    v23 = v16;
    v24 = v17;
  }
LABEL_33:
  v104 = 0;
  -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 4, v10, &v104);
  if (v22 >= v45)
    v46 = v22;
  else
    v46 = v45;
  if (v104)
    v47 = v46;
  else
    v47 = v22;
  v103 = 0;
  -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 5, v10, &v103, v46);
  if (v103)
    v49 = v35;
  else
    v49 = 1;
  if (v47 >= v48)
    v50 = v47;
  else
    v50 = v48;
  if (!v49)
    v47 = v50;
  v102 = 0;
  -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 6, v10, &v102);
  if (v24 >= v51)
    v51 = v24;
  if (v102)
    v24 = v51;
  v101 = 0;
  -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 7, v10, &v101);
  if (v47 >= v52)
    v53 = v47;
  else
    v53 = v52;
  if (v101)
    v54 = v53;
  else
    v54 = v47;
  v100 = 0;
  -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 8, v10, &v100, v53);
  if (v100)
  {
    v57 = v55;
    v58 = v56;
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    -[SBPIPController containerViewControllersOnWindowScene:](self, "containerViewControllersOnWindowScene:", v10);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v97;
      v63 = 1.79769313e308;
      v64 = v92;
      do
      {
        for (i = 0; i != v61; ++i)
        {
          if (*(_QWORD *)v97 != v62)
            objc_enumerationMutation(v59);
          objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "maximumAvailableVerticalPadding");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v66;
          if (v66)
            objc_msgSend(v66, "doubleValue");
          else
            v68 = 1.79769313e308;
          v69 = v68 - v57;
          if (v69 < v63)
            v63 = v69;

        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
      }
      while (v61);
    }
    else
    {
      v63 = 1.79769313e308;
      v64 = v92;
    }

    if (v58 >= v63)
      v70 = v63;
    else
      v70 = v58;
    if (v24 < v57)
      v24 = v57;
    if (v54 < v70)
      v54 = v70;
  }
  else
  {
    v64 = v92;
  }
  v95 = 0;
  -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 9, v10, &v95);
  if (v54 >= v71)
    v72 = v54;
  else
    v72 = v71;
  if (v95)
    v73 = v72;
  else
    v73 = v54;
  v94 = 0;
  -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 10, v10, &v94, v72);
  if (v94)
  {
    SBFEdgeInsetsRotateToInterfaceOrientation();
    UIEdgeInsetsMax();
    v24 = v74;
    v23 = v75;
    v73 = v76;
    v64 = v77;
  }
  if (v91)
  {
    v78 = v90;
    if (v90 != v23 || (v78 = v89, v89 != v24) || (v78 = v88, v88 != v64) || (v78 = v87, v87 != v73))
    {
      windowSceneToWindowMarginsMap = self->_windowSceneToWindowMarginsMap;
      *(double *)v93 = v24;
      *(double *)&v93[1] = v23;
      *(double *)&v93[2] = v73;
      *(double *)&v93[3] = v64;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v93, "{UIEdgeInsets=dddd}", v78);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](windowSceneToWindowMarginsMap, "setObject:forKey:", v80, v10);

      -[SBPIPController _leadingWindowForWindowScene:](self, "_leadingWindowForWindowScene:", v10);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (v81)
        -[SBPIPController _updateContainerViewControllersContentPaddingOnWindowScene:](self, "_updateContainerViewControllersContentPaddingOnWindowScene:", v10);
    }
  }

  v82 = v24;
  v83 = v23;
  v84 = v73;
  v85 = v64;
  result.right = v85;
  result.bottom = v84;
  result.left = v83;
  result.top = v82;
  return result;
}

- (UIEdgeInsets)_edgeInsetsForSource:(int64_t)a3 onWindowScene:(id)a4 exists:(BOOL *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  objc_msgSend(a4, "pictureInPictureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_sourceToEdgeInsets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = v10 != 0;
  objc_msgSend(v10, "UIEdgeInsetsValue");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  objc_msgSend(v10, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unlockedEnvironmentMode");
  objc_msgSend(v6, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBPIPController _acquirePIPStashAssertionIfNecessaryForTransitionContext:onWindowScene:](self, "_acquirePIPStashAssertionIfNecessaryForTransitionContext:onWindowScene:", v10, v9)&& v8 != 3)
  {
    -[SBPIPController _relinquishPIPStashAssertionIfNecessaryForTransitionContext:](self, "_relinquishPIPStashAssertionIfNecessaryForTransitionContext:", v10);
  }

}

- (BOOL)_acquirePIPStashAssertionIfNecessaryForTransitionContext:(id)a3 onWindowScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  id WeakRetained;
  _BOOL4 v16;
  _BOOL4 v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  _BOOL4 v24;
  char v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  unint64_t v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;

  v40 = a4;
  v6 = a3;
  objc_msgSend(v6, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromLayoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v7, "unlockedEnvironmentMode");
  v38 = objc_msgSend(v8, "unlockedEnvironmentMode");
  v37 = objc_msgSend(v7, "unlockedEnvironmentMode");
  v36 = objc_msgSend(v8, "unlockedEnvironmentMode");
  v9 = objc_msgSend(v7, "unlockedEnvironmentMode");
  v10 = objc_msgSend(v7, "isFloatingSwitcherVisible");
  v11 = objc_msgSend(v8, "unlockedEnvironmentMode");
  v12 = objc_msgSend(v8, "isFloatingSwitcherVisible");
  if (v11 == 2)
    v13 = 1;
  else
    v13 = v12;
  v35 = v13;
  if (v9 == 2)
    v14 = 1;
  else
    v14 = v10;
  v33 = v14;
  v34 = objc_msgSend(v7, "isMeaningfullyDifferentFromLayoutState:", v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionStashAssertion);
  v16 = -[SBPIPInteractionSettings shouldUnstashOnTransitionFromHomescreen](self->_interactionSettings, "shouldUnstashOnTransitionFromHomescreen");
  v17 = -[SBPIPInteractionSettings shouldUnstashOnTransitionFromSwitcher](self->_interactionSettings, "shouldUnstashOnTransitionFromSwitcher");
  v18 = objc_msgSend(WeakRetained, "behaviorOverrideReason") != 7 || v16;
  v19 = objc_msgSend(WeakRetained, "behaviorOverrideReason");
  v20 = objc_msgSend(WeakRetained, "behaviorOverrideReason");
  v21 = v19 != 4 || v17;
  v22 = v18 & v21;
  if (v20 == 8)
    v23 = 0;
  else
    v23 = v22;
  v24 = -[SBPIPController _shouldStashForTransitionContext:onWindowScene:](self, "_shouldStashForTransitionContext:onWindowScene:", v6, v40);

  if (!v24)
    goto LABEL_32;
  v32 = __PAIR64__(v23, v17);
  if (v38 == 1)
    v25 = 1;
  else
    v25 = v35;
  if ((v25 & 1) == 0
    && v39 == 1
    && -[SBPIPInteractionSettings shouldStashOnTransitionToHomescreen](self->_interactionSettings, "shouldStashOnTransitionToHomescreen")&& ((v23 | !v16) & 1) != 0)
  {
    v26 = 7;
LABEL_30:
    v27 = v40;
LABEL_37:
    objc_msgSend(WeakRetained, "invalidate");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E91CF3D0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPController _acquireStashAssertionForWindowScene:withReason:identifier:customAllowedEnvironmentModes:](self, "_acquireStashAssertionForWindowScene:withReason:identifier:customAllowedEnvironmentModes:", v27, v26, CFSTR("SBPIPSceneController"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_transitionStashAssertion, v30);

    v28 = 1;
    goto LABEL_38;
  }
  if (v36 == 3
    && v37 == 3
    && ((v34 ^ 1) & 1) == 0
    && -[SBPIPInteractionSettings shouldStashOnAppToAppTransitions](self->_interactionSettings, "shouldStashOnAppToAppTransitions"))
  {
    v26 = 8;
    goto LABEL_30;
  }
  if (((v35 | v33 ^ 1) & 1) != 0)
  {
LABEL_32:
    v28 = 0;
LABEL_33:
    v27 = v40;
    goto LABEL_38;
  }
  v28 = 0;
  if (!-[SBPIPInteractionSettings shouldStashOnTransitionToSwitcher](self->_interactionSettings, "shouldStashOnTransitionToSwitcher"))goto LABEL_33;
  v27 = v40;
  if (v32 != 1)
  {
    v26 = 4;
    goto LABEL_37;
  }
LABEL_38:

  return v28;
}

- (BOOL)_shouldStashForTransitionContext:(id)a3 onWindowScene:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__SBPIPController__shouldStashForTransitionContext_onWindowScene___block_invoke;
  v10[3] = &unk_1E8EBF0E0;
  v8 = v6;
  v11 = v8;
  v12 = &v13;
  -[SBPIPController _enumerateContextsForWindowScene:usingBlock:](self, "_enumerateContextsForWindowScene:usingBlock:", v7, v10);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

- (id)_allContainerViewControllers
{
  void *v2;
  void *v3;

  -[NSMapTable keyEnumerator](self->_containerViewControllerToContextMap, "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_msgSend(v6, "toLayoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "unlockedEnvironmentMode") == 3)
    -[SBPIPController _relinquishPIPStashAssertionIfNecessaryForTransitionContext:](self, "_relinquishPIPStashAssertionIfNecessaryForTransitionContext:", v6);

}

- (void)_relinquishPIPStashAssertionIfNecessaryForTransitionContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  int v11;
  int v12;
  id WeakRetained;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "toLayoutState");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromLayoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v17, "unlockedEnvironmentMode");
  v7 = objc_msgSend(v5, "unlockedEnvironmentMode");
  v8 = objc_msgSend(v17, "unlockedEnvironmentMode");
  v9 = objc_msgSend(v17, "isFloatingSwitcherVisible");
  v10 = objc_msgSend(v5, "unlockedEnvironmentMode");
  v11 = objc_msgSend(v5, "isFloatingSwitcherVisible");
  if (v10 == 2)
    v12 = 1;
  else
    v12 = v11;
  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionStashAssertion);
  v14 = WeakRetained;
  v15 = 0;
  if (v12 == 1 && v8 != 2 && (v9 & 1) == 0)
    v15 = objc_msgSend(WeakRetained, "behaviorOverrideReason") == 4
       && -[SBPIPInteractionSettings shouldUnstashOnTransitionFromSwitcher](self->_interactionSettings, "shouldUnstashOnTransitionFromSwitcher");
  v16 = 0;
  if (v7 == 1 && v6 != 1)
    v16 = objc_msgSend(v14, "behaviorOverrideReason") == 7
       && -[SBPIPInteractionSettings shouldUnstashOnTransitionFromHomescreen](self->_interactionSettings, "shouldUnstashOnTransitionFromHomescreen");
  if (v15 || v16)
  {
    objc_msgSend(v14, "invalidate");
    objc_storeWeak((id *)&self->_transitionStashAssertion, 0);
  }

}

- (void)_edgeInsetsDidChangeOnWindowScene:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;

  v4 = a3;
  if (SBWorkspaceIsSystemBootComplete())
  {
    if ((-[SBPIPControllerAdapter isStartingStoppingOrCancellingPictureInPictureForPIPController:](self->_adapter, "isStartingStoppingOrCancellingPictureInPictureForPIPController:", self) & 1) == 0)
    {
      -[SBPIPController _updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:](self, "_updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:", v4, 1, 0, objc_msgSend((id)SBApp, "activeInterfaceOrientation"), 1);
      -[SBPIPController _visualizeKeyboardFrameIfNeeded](self, "_visualizeKeyboardFrameIfNeeded");
    }
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  SBLogPIP();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SBPIPController _edgeInsetsDidChangeOnWindowScene:].cold.1(v5, v6);

}

- (NSArray)hostedAppSceneHandles
{
  void *v2;
  void *v3;

  -[SBPIPController _allContainerViewControllers](self, "_allContainerViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_compactMap:", &__block_literal_global_172_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)hasIdleTimerBehaviors
{
  return self->_hasIdleTimerBehaviors;
}

- (BOOL)_isPointInsidePictureInPictureContent:(CGPoint)a3 onWindowScene:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  BOOL v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SBPIPController _leadingWindowForWindowScene:](self, "_leadingWindowForWindowScene:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "coordinateSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v8, x, y);
    v11 = v10;
    v13 = v12;

    objc_msgSend(v8, "hitTest:withEvent:", 0, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isPresentingPictureInPictureRequiringMedusaKeyboard
{
  void *v2;
  char v3;

  -[SBPIPController _allContainerViewControllers](self, "_allContainerViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &__block_literal_global_174);

  return v3;
}

- (BOOL)shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4
{
  return -[SBPIPControllerAdapter shouldStartPictureInPictureForPIPController:applicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:](self->_adapter, "shouldStartPictureInPictureForPIPController:applicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:", self, *(_QWORD *)&a3, a4);
}

- (void)activityDidChangeForSensorActivityDataProvider:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *cameraInterruptionAssertions;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSMutableDictionary *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  __CFString *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  __CFString *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v6)
    {
      _SBFLoggingMethodProem();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@ needs to be invoked on the main thread!"), v7);

    }
  }
  v8 = -[SBPIPController isPictureInPictureWindowVisibleOnWindowScene:](self, "isPictureInPictureWindowVisibleOnWindowScene:", 0);
  v9 = CFSTR("[SensorActivity][PIPWindowHidden]");
  if (v8)
    v9 = CFSTR("[SensorActivity]");
  v43 = v9;
  objc_msgSend(v4, "activeCameraAndMicrophoneActivityAttributions");
  v10 = objc_claimAutoreleasedReturnValue();
  if (-[NSMutableDictionary count](self->_cameraInterruptionAssertions, "count"))
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allKeys](self->_cameraInterruptionAssertions, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  v41 = v4;
  objc_msgSend(v4, "activeCameraAndMicrophoneActivityAttributions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "minusSet:", v13);
  v39 = v13;
  v38 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v38, "minusSet:", v10);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (!objc_msgSend(v20, "sensor"))
        {
          objc_msgSend(v20, "activeEntityBundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_cameraInterruptionAssertions, "objectForKeyedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          SBLogPIP();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (v22)
          {
            if (v24)
            {
              *(_DWORD *)buf = 138543874;
              v54 = v43;
              v55 = 2114;
              v56 = v20;
              v57 = 2114;
              v58 = v21;
              _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ NOT interrupting PIP for camera activity: attribution[%{public}@] bundleIdentifier[%{public}@], as we were already tracking a sensorAttribution for that app", buf, 0x20u);
            }
          }
          else
          {
            if (v24)
            {
              *(_DWORD *)buf = 138543874;
              v54 = v43;
              v55 = 2114;
              v56 = v20;
              v57 = 2114;
              v58 = v21;
              _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Interrupting PIP for camera activity: attribution[%{public}@] bundleIdentifier[%{public}@]", buf, 0x20u);
            }

            if (!self->_cameraInterruptionAssertions)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
              v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
              cameraInterruptionAssertions = self->_cameraInterruptionAssertions;
              self->_cameraInterruptionAssertions = v25;

            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBPIPController-%@"), v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBPIPController _acquireInterruptionAssertionForReason:identifier:cameraSensorBundleIdentifier:](self, "_acquireInterruptionAssertionForReason:identifier:cameraSensorBundleIdentifier:", 1, v27, v21);
            v23 = objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cameraInterruptionAssertions, "setObject:forKeyedSubscript:", v23, v20);
              -[SBPIPController _suspendPIPForInterruptionAssertion:](self, "_suspendPIPForInterruptionAssertion:", v23);
            }
          }

        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v17);
  }
  v40 = (void *)v10;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v28 = v38;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_cameraInterruptionAssertions, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogPIP();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v33, "activeEntityBundleIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v54 = v43;
          v55 = 2114;
          v56 = v33;
          v57 = 2114;
          v58 = v36;
          _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing PIP interruption assertion for camera activity: attribution[%{public}@] bundleIdentifier[%{public}@]", buf, 0x20u);

        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cameraInterruptionAssertions, "setObject:forKeyedSubscript:", 0, v33);
        objc_msgSend(v34, "invalidate");

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v30);
  }

  if (!-[NSMutableDictionary count](self->_cameraInterruptionAssertions, "count"))
  {
    v37 = self->_cameraInterruptionAssertions;
    self->_cameraInterruptionAssertions = 0;

  }
}

- (void)invalidateIdleTimerBehaviors
{
  void *v3;
  int v4;
  SBIdleTimerCoordinatorHelper *idleTimerCoordinatorHelper;
  id v6;
  id v7;

  -[SBPIPController _allContainerViewControllers](self, "_allContainerViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bs_containsObjectPassingTest:", &__block_literal_global_223_1);

  if (self->_hasIdleTimerBehaviors != v4)
  {
    self->_hasIdleTimerBehaviors = v4;
    idleTimerCoordinatorHelper = self->_idleTimerCoordinatorHelper;
    if (v4)
      +[SBIdleTimerBehavior disabledBehavior](SBIdleTimerBehavior, "disabledBehavior");
    else
      +[SBIdleTimerBehavior autoLockBehavior](SBIdleTimerBehavior, "autoLockBehavior");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = -[SBIdleTimerCoordinatorHelper proposeIdleTimerBehavior:fromProvider:reason:](idleTimerCoordinatorHelper, "proposeIdleTimerBehavior:fromProvider:reason:");

  }
}

- (void)_cancelInterruptionDebouncingTimer
{
  SBPIPInterruptionDebouncingTimer *interruptionEndDebouncingTimer;
  void *v4;
  SBPIPInterruptionDebouncingTimer *v5;
  NSObject *v6;
  uint8_t v7[16];

  interruptionEndDebouncingTimer = self->_interruptionEndDebouncingTimer;
  if (interruptionEndDebouncingTimer)
  {
    -[SBPIPInterruptionDebouncingTimer debouncedAssertion](interruptionEndDebouncingTimer, "debouncedAssertion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPController endPIPInterruptionForAssertion:](self, "endPIPInterruptionForAssertion:", v4);

    -[BSAbsoluteMachTimer invalidate](self->_interruptionEndDebouncingTimer, "invalidate");
    v5 = self->_interruptionEndDebouncingTimer;
    self->_interruptionEndDebouncingTimer = 0;

    SBLogPIP();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[Assertions] PIP interruption debounce timer was canceled. Stop interrupting PIP for previously expired assertion.", v7, 2u);
    }

  }
}

- (void)keyboardFocusController:(id)a3 externalSceneDidAcquireFocus:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;

  v5 = (void *)SBApp;
  v6 = a4;
  objc_msgSend(v5, "windowSceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "windowSceneForSceneIdentifier:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v13;
  if (v13)
  {
    objc_msgSend(v13, "switcherController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      SBLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

      if (v12)
        NSLog(CFSTR("expected a switcherController!"));
    }
    self->_unlockedEnvironmentModeWhenKeyboardFocusChanged = objc_msgSend(v10, "unlockedEnvironmentMode");

    v9 = v13;
  }

}

void __75__SBPIPController_displayLayoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 264));
    objc_msgSend(*(id *)(a1 + 48), "displayConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "windowSceneForDisplayIdentity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_overrideInsetsOnWindowScene:forReason:identifier:", v5, CFSTR("FullScreenModalLayoutElement"), *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "invalidate");
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(v7 + 136);
  *(_QWORD *)(v7 + 136) = v6;

}

void __88__SBPIPController_initWithIdleTimerCoordinator_windowLevel_interactionSettings_adapter___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "displayLayoutMonitor:didUpdateDisplayLayout:withContext:", v11, v7, v8);

}

- (void)displayLayoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD block[4];
  id v34;
  SBPIPController *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  SBLogPIP();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v43 = v7;
    v44 = 2114;
    v45 = v8;
    v46 = 2114;
    v47 = v9;
    _os_log_debug_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEBUG, "[DisplayMonitor][Layout] layoutMonitor:%{public}@ didUpdateDisplayLayout:%{public}@ withContext:%{public}@", buf, 0x20u);
  }
  v30 = v7;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v27 = v8;
  objc_msgSend(v8, "elements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  v29 = v9;
  if (!v12)
  {
    v32 = 0;
    goto LABEL_25;
  }
  v13 = v12;
  v32 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v38;
  v16 = *MEMORY[0x1E0D22C78];
  v31 = *MEMORY[0x1E0DAB698];
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v38 != v15)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v17);
      if (objc_msgSend(v18, "isSpringBoardElement"))
      {
        v19 = objc_msgSend(v18, "level");
        objc_msgSend(v18, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "layoutRole");
        if (v19 >= v14)
        {
          v22 = v21;
          if (objc_msgSend(v18, "layoutRole") == 3)
          {
            if ((objc_msgSend(v20, "isEqualToString:", v16) & 1) != 0
              || (objc_msgSend(v20, "isEqualToString:", v31) & 1) != 0)
            {
              goto LABEL_10;
            }
            objc_msgSend(v18, "identifier");
            v23 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v19 <= v14 || (unint64_t)(v22 - 1) > 7 || ((0xC3u >> (v22 - 1)) & 1) == 0)
              goto LABEL_10;
            v23 = 0;
          }

          v32 = (void *)v23;
          v14 = v19;
        }
LABEL_10:

      }
      ++v17;
    }
    while (v13 != v17);
    v24 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    v13 = v24;
  }
  while (v24);
LABEL_25:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SBPIPController_displayLayoutMonitor_didUpdateDisplayLayout_withContext___block_invoke;
  block[3] = &unk_1E8E9E270;
  v34 = v32;
  v35 = self;
  v36 = v27;
  v25 = v27;
  v26 = v32;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (SBPIPController)initWithIdleTimerCoordinator:(id)a3 windowLevel:(double)a4 interactionSettings:(id)a5 adapter:(id)a6
{
  id v10;
  id v11;
  id v12;
  SBPIPController *v13;
  uint64_t v14;
  NSMapTable *containerViewControllerToContextMap;
  uint64_t v16;
  NSMutableSet *pictureInPictureMorphAnimatorControllers;
  NSMutableSet *v18;
  NSMutableSet *pictureInPictureWindowHiddenReasons;
  uint64_t v20;
  NSMapTable *windowSceneToWindowMarginsMap;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SBIdleTimerCoordinatorHelper *v26;
  SBIdleTimerCoordinatorHelper *idleTimerCoordinatorHelper;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  BSInvalidatable *keyboardFocusObserver;
  void *v34;
  uint64_t v35;
  FBSDisplayLayoutMonitor *displayLayoutMonitor;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  BSInvalidatable *stateCaptureInvalidatable;
  SBPIPController *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id location;
  objc_super v48;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v48.receiver = self;
  v48.super_class = (Class)SBPIPController;
  v13 = -[SBPIPController init](&v48, sel_init);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    containerViewControllerToContextMap = v13->_containerViewControllerToContextMap;
    v13->_containerViewControllerToContextMap = (NSMapTable *)v14;

    objc_storeStrong((id *)&v13->_interactionSettings, a5);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
    pictureInPictureMorphAnimatorControllers = v13->_pictureInPictureMorphAnimatorControllers;
    v13->_pictureInPictureMorphAnimatorControllers = (NSMutableSet *)v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pictureInPictureWindowHiddenReasons = v13->_pictureInPictureWindowHiddenReasons;
    v13->_pictureInPictureWindowHiddenReasons = v18;

    v13->_windowLevel = a4;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    windowSceneToWindowMarginsMap = v13->_windowSceneToWindowMarginsMap;
    v13->_windowSceneToWindowMarginsMap = (NSMapTable *)v20;

    -[SBPIPController _setAdapter:](v13, "_setAdapter:", v12);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v13, sel__lockStateDidChange_, CFSTR("SBAggregateLockStateDidChangeNotification"), 0);

    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:", v13);

    +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:", v13);

    objc_msgSend((id)SBApp, "sensorActivityDataProvider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:", v13);

    objc_storeWeak((id *)&v13->_idleTimerCoordinator, v10);
    v26 = -[SBIdleTimerCoordinatorHelper initWithSourceProvider:]([SBIdleTimerCoordinatorHelper alloc], "initWithSourceProvider:", v13);
    idleTimerCoordinatorHelper = v13->_idleTimerCoordinatorHelper;
    v13->_idleTimerCoordinatorHelper = v26;

    -[SBIdleTimerCoordinatorHelper setTargetCoordinator:](v13->_idleTimerCoordinatorHelper, "setTargetCoordinator:", v10);
    v13->_defaultToStashed = 0;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "userInterfaceIdiom");

    if ((v29 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "keyboardFocusController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addKeyboardFocusObserver:", v13);
      v32 = objc_claimAutoreleasedReturnValue();
      keyboardFocusObserver = v13->_keyboardFocusObserver;
      v13->_keyboardFocusObserver = (BSInvalidatable *)v32;

    }
    objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v13);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __88__SBPIPController_initWithIdleTimerCoordinator_windowLevel_interactionSettings_adapter___block_invoke;
    v45[3] = &unk_1E8EB1870;
    objc_copyWeak(&v46, &location);
    objc_msgSend(v34, "setTransitionHandler:", v45);
    objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v34);
    v35 = objc_claimAutoreleasedReturnValue();
    displayLayoutMonitor = v13->_displayLayoutMonitor;
    v13->_displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v35;

    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_layoutStateTransitionCoordinator");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:", v13);

    v39 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v44, &location);
    v43 = v13;
    BSLogAddStateCaptureBlockWithTitle();
    v40 = objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = v43->_stateCaptureInvalidatable;
    v43->_stateCaptureInvalidatable = (BSInvalidatable *)v40;

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);

  }
  return v13;
}

__CFString *__88__SBPIPController_initWithIdleTimerCoordinator_windowLevel_interactionSettings_adapter___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[9];
  _QWORD v23[11];

  v23[9] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v22[0] = CFSTR("window scenes");
    objc_msgSend(*(id *)(a1 + 32), "_windowScenesDisplayingPIPContent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __88__SBPIPController_initWithIdleTimerCoordinator_windowLevel_interactionSettings_adapter___block_invoke_3;
    v20[3] = &unk_1E8EBF048;
    v4 = WeakRetained;
    v21 = v4;
    objc_msgSend(v3, "bs_map:", v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v5;
    v22[1] = CFSTR("windowLevel");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)v4 + 4));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v6;
    v22[2] = CFSTR("window hidden reasons");
    if (objc_msgSend(*((id *)v4 + 10), "count"))
      v7 = (const __CFString *)*((_QWORD *)v4 + 10);
    else
      v7 = CFSTR("none");
    v23[2] = v7;
    v22[3] = CFSTR("fullscreen modal inset override assertion");
    v9 = *((_QWORD *)v4 + 17);
    if (v9)
    {
      objc_msgSend(*((id *)v4 + 17), "debugDescription");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("none");
    }
    v11 = CFSTR("yes");
    if (!*((_BYTE *)v4 + 40))
      v11 = CFSTR("no");
    v23[3] = v10;
    v23[4] = v11;
    v22[4] = CFSTR("has idle timer behaviors");
    v22[5] = CFSTR("morphAnimatorControllers");
    if (objc_msgSend(*((id *)v4 + 24), "count"))
      v12 = (const __CFString *)*((_QWORD *)v4 + 24);
    else
      v12 = CFSTR("none");
    v23[5] = v12;
    v22[6] = CFSTR("interruption assertions");
    v13 = objc_msgSend(*((id *)v4 + 14), "count");
    if (v13)
    {
      objc_msgSend(*((id *)v4 + 14), "allObjects");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = CFSTR("none");
    }
    v15 = (const __CFString *)*((_QWORD *)v4 + 20);
    if (!v15)
      v15 = CFSTR("none");
    v23[6] = v14;
    v23[7] = v15;
    v22[7] = CFSTR("interruption debouncing timer");
    v22[8] = CFSTR("active pip default stash state ");
    v16 = CFSTR("stashed");
    if (!*((_BYTE *)v4 + 168))
      v16 = CFSTR("normal");
    v23[8] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "description");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v13)
    if (v9)

  }
  else
  {
    v8 = &stru_1E8EC7EC0;
  }

  return v8;
}

id __88__SBPIPController_initWithIdleTimerCoordinator_windowLevel_interactionSettings_adapter___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "pictureInPictureManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_sourceToEdgeInsets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        SBStringFromPictureInPictureInsetsSource(objc_msgSend(v11, "integerValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString setObject:forKey:](v5, "setObject:forKey:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v8);
  }

  objc_msgSend(v24, "_windowLevelOverrideAssertionsForContentType:", 0);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKey:", v3);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_leadingWindowForWindowScene:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = CFSTR("window level overrides");
  v17 = CFSTR("none");
  if (-[__CFString count](v14, "count"))
    v18 = v14;
  else
    v18 = CFSTR("none");
  v30[0] = v18;
  v29[1] = CFSTR("insets for source");
  if (-[__CFString count](v5, "count"))
    v19 = v5;
  else
    v19 = CFSTR("none");
  v30[1] = v19;
  v29[2] = CFSTR("stash assertions");
  if (-[__CFString count](v15, "count"))
    v20 = v15;
  else
    v20 = CFSTR("none");
  v30[2] = v20;
  v29[3] = CFSTR("window level");
  if (v16)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "windowLevel");
    objc_msgSend(v21, "numberWithDouble:");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v30[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)

  return v22;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[FBSDisplayLayoutMonitor invalidate](self->_displayLayoutMonitor, "invalidate");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)-[NSMapTable copy](self->_containerViewControllerToContextMap, "copy");
  objc_msgSend(v3, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[SBPIPController removeContainerViewController:](self, "removeContainerViewController:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:", self);

  -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
  -[BSInvalidatable invalidate](self->_keyboardFocusObserver, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_interruptionEndDebouncingTimer, "invalidate");
  v12.receiver = self;
  v12.super_class = (Class)SBPIPController;
  -[SBPIPController dealloc](&v12, sel_dealloc);
}

- (int64_t)contentType
{
  return -[SBPIPControllerAdapter contentTypeForPIPController:](self->_adapter, "contentTypeForPIPController:", self);
}

- (void)_setAdapter:(id)a3
{
  SBPIPControllerAdapter *v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  SBPIPControllerAdapter *v17;

  v5 = (SBPIPControllerAdapter *)a3;
  if (self->_adapter != v5)
  {
    v17 = v5;
    *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 64;
    else
      v7 = 0;
    *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xBF | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 4;
    else
      v8 = 0;
    *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xFB | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 8;
    else
      v9 = 0;
    *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xF7 | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 16;
    else
      v10 = 0;
    *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xEF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 32;
    else
      v11 = 0;
    *((_BYTE *)self + 248) = *((_BYTE *)self + 248) & 0xDF | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 0x80;
    else
      v12 = 0;
    *((_BYTE *)self + 248) = v12 & 0x80 | *((_BYTE *)self + 248) & 0x7F;
    *((_BYTE *)self + 249) = *((_BYTE *)self + 249) & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 2;
    else
      v13 = 0;
    *((_BYTE *)self + 249) = *((_BYTE *)self + 249) & 0xFD | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 4;
    else
      v14 = 0;
    *((_BYTE *)self + 249) = *((_BYTE *)self + 249) & 0xFB | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 8;
    else
      v15 = 0;
    *((_BYTE *)self + 249) = *((_BYTE *)self + 249) & 0xF7 | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 16;
    else
      v16 = 0;
    *((_BYTE *)self + 249) = *((_BYTE *)self + 249) & 0xEF | v16;
    objc_storeStrong((id *)&self->_adapter, a3);
    -[SBPIPControllerAdapter setPIPController:](self->_adapter, "setPIPController:", self);
    v5 = v17;
  }

}

- (id)_contextForContainerViewController:(id)a3
{
  return -[SBPIPController _contextForContainerViewController:creatingWithWindowSceneIfNeeded:](self, "_contextForContainerViewController:creatingWithWindowSceneIfNeeded:", a3, 0);
}

- (id)_contextForContainerViewController:(id)a3 creatingWithWindowSceneIfNeeded:(id)a4
{
  id v7;
  id v8;
  SBPIPContentContext *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  -[NSMapTable objectForKey:](self->_containerViewControllerToContextMap, "objectForKey:", v7);
  v9 = (SBPIPContentContext *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (v8)
    {
      v9 = -[SBPIPContentContext initWithWindowScene:containerViewController:]([SBPIPContentContext alloc], "initWithWindowScene:containerViewController:", v8, v7);
      -[NSMapTable setObject:forKey:](self->_containerViewControllerToContextMap, "setObject:forKey:", v9, v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPController.m"), 334, CFSTR("Attempting to look up an unknown content context"));

      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_connectedWindowScenesIncludesExternalDisplay
{
  void *v2;
  char v3;

  -[NSHashTable allObjects](self->_connectedWindowScenes, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &__block_literal_global_373);

  return v3;
}

uint64_t __64__SBPIPController__connectedWindowScenesIncludesExternalDisplay__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMainDisplayWindowScene") ^ 1;
}

- (void)_registerForLockStateNotificationsForWindowScene:(id)a3
{
  uint64_t v4;
  NSHashTable *lockStateProviders;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  objc_msgSend(a3, "uiLockStateProvider");
  v4 = objc_claimAutoreleasedReturnValue();
  lockStateProviders = self->_lockStateProviders;
  v8 = (id)v4;
  if (!lockStateProviders)
  {
    v6 = (NSHashTable *)objc_opt_new();
    v7 = self->_lockStateProviders;
    self->_lockStateProviders = v6;

    v4 = (uint64_t)v8;
    lockStateProviders = self->_lockStateProviders;
  }
  if (!-[NSHashTable containsObject:](lockStateProviders, "containsObject:", v4))
  {
    -[NSHashTable addObject:](self->_lockStateProviders, "addObject:", v8);
    objc_msgSend(v8, "addLockStateObserver:", self);
  }

}

- (void)_unregisterForLockStateNotificationsForWindowScene:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uiLockStateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSHashTable containsObject:](self->_lockStateProviders, "containsObject:", v5))
  {
    if (-[NSHashTable containsObject:](self->_connectedWindowScenes, "containsObject:", v4))
    {
      SBLogPIP();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[Assertions] Unregistering from the window scene lock state provider notifications but the window scene is still connected.", buf, 2u);
      }

    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_connectedWindowScenes;
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "uiLockStateProvider", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == v5)
          {

            goto LABEL_16;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v9)
          continue;
        break;
      }
    }

    objc_msgSend(v5, "removeLockStateObserver:", self);
    -[NSHashTable removeObject:](self->_lockStateProviders, "removeObject:", v5);
  }
LABEL_16:

}

- (void)_windowSceneDidConnect:(id)a3
{
  NSHashTable *connectedWindowScenes;
  NSHashTable *v5;
  NSHashTable *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSHashTable containsObject:](self->_connectedWindowScenes, "containsObject:"))
  {
    connectedWindowScenes = self->_connectedWindowScenes;
    if (!connectedWindowScenes)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v6 = self->_connectedWindowScenes;
      self->_connectedWindowScenes = v5;

      connectedWindowScenes = self->_connectedWindowScenes;
    }
    -[NSHashTable addObject:](connectedWindowScenes, "addObject:", v8);
    -[SBPIPController _updateHyperregionComposers](self, "_updateHyperregionComposers");
    if (-[SBPIPController _connectedWindowScenesIncludesExternalDisplay](self, "_connectedWindowScenesIncludesExternalDisplay"))
    {
      objc_msgSend((id)SBApp, "externalDisplayService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:", self);

    }
    -[SBPIPController _registerForLockStateNotificationsForWindowScene:](self, "_registerForLockStateNotificationsForWindowScene:", v8);
    -[SBPIPController _refreshLockStateProviderInterruptionAssertions](self, "_refreshLockStateProviderInterruptionAssertions");
  }

}

- (void)_windowSceneDidDisconnect:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSHashTable *connectedWindowScenes;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSHashTable containsObject:](self->_connectedWindowScenes, "containsObject:", v4);
  if (v5)
  {
    -[NSHashTable removeObject:](self->_connectedWindowScenes, "removeObject:", v4);
    if (!-[NSHashTable count](self->_connectedWindowScenes, "count"))
    {
      connectedWindowScenes = self->_connectedWindowScenes;
      self->_connectedWindowScenes = 0;

    }
    -[SBPIPController _unregisterForLockStateNotificationsForWindowScene:](self, "_unregisterForLockStateNotificationsForWindowScene:", v4);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneManager);
  objc_msgSend(WeakRetained, "activeDisplayWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMapTable objectEnumerator](self->_containerViewControllerToContextMap, "objectEnumerator", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "windowScene");
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16 == v4)
          -[SBPIPController _moveContext:toWindowScene:](self, "_moveContext:toWindowScene:", v15, v8);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  -[NSMapTable removeObjectForKey:](self->_windowSceneToWindowMarginsMap, "removeObjectForKey:", v4);
  -[NSMapTable removeObjectForKey:](self->_windowSceneToStashAssertionsMap, "removeObjectForKey:", v4);
  -[NSMapTable removeObjectForKey:](self->_windowSceneToInsetAssertionMap, "removeObjectForKey:", v4);
  if (v5)
    -[SBPIPController _updateHyperregionComposers](self, "_updateHyperregionComposers");
  if (!-[SBPIPController _connectedWindowScenesIncludesExternalDisplay](self, "_connectedWindowScenesIncludesExternalDisplay"))
  {
    objc_msgSend((id)SBApp, "externalDisplayService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObserver:", self);

  }
}

- (void)_moveContext:(id)a3 toWindowScene:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  SBPIPController *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__SBPIPController__moveContext_toWindowScene___block_invoke;
  v10[3] = &unk_1E8E9E270;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[SBPIPController _performWithoutAnimation:](self, "_performWithoutAnimation:", v10);

}

void __46__SBPIPController__moveContext_toWindowScene___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a1[4], "containerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForTransitionToWindowScene:", a1[5]);

  objc_msgSend(a1[6], "_updateHyperregionComposers");
  objc_msgSend(a1[4], "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pictureInPictureManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "pictureInPictureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateZStackParticipantPreferencesWithReason:", CFSTR("PIP context moved to new scene"));
  objc_msgSend(a1[4], "setWindowScene:", a1[5]);
  objc_msgSend(a1[4], "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    ++*((_QWORD *)a1[6] + 32);
    objc_msgSend(v6, "setWindowScene:", a1[5]);
    objc_msgSend(a1[6], "_edgeInsetsDidChangeOnWindowScene:", a1[5]);
    objc_msgSend(a1[6], "updatePictureInPictureWindowLevelForWindowScene:", a1[5]);
    objc_msgSend(a1[6], "_minimumStashedPaddingDidChangeOnWindowScene:", a1[5]);
    objc_msgSend(a1[6], "_managePictureInPictureWindowVisibilityForWindowScene:animated:", a1[5], 0);
    --*((_QWORD *)a1[6] + 32);
    objc_msgSend(v5, "setNeedsUpdateZStackParticipantPreferencesWithReason:", CFSTR("PIP context moved to new scene"));
  }
  if ((BSEqualObjects() & 1) == 0)
    objc_msgSend(v10, "setNeedsUpdateZStackParticipantPreferencesWithReason:", CFSTR("PIP context moved to new scene"));
  objc_msgSend(a1[6], "_updateHyperregionComposers");
  objc_msgSend(v7, "setNeedsLayout");
  objc_msgSend(v7, "layoutIfNeeded");
  objc_msgSend(a1[4], "containerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interactionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finishTransitionToWindowScene:", a1[5]);

  objc_msgSend(a1[6], "_refreshLockStateProviderInterruptionAssertions");
}

- (void)_performWithoutAnimation:(id)a3
{
  id v3;
  int v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0CEABB0], "_isInRetargetableAnimationBlock");
  v5 = (void *)MEMORY[0x1E0CEABB0];
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__SBPIPController__performWithoutAnimation___block_invoke;
    v6[3] = &unk_1E8E9E8D0;
    v7 = v3;
    objc_msgSend(v5, "_performWithoutRetargetingAnimations:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v3);
  }

}

uint64_t __44__SBPIPController__performWithoutAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", *(_QWORD *)(a1 + 32));
}

- (void)_updateHyperregionComposers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMapTable objectEnumerator](self->_containerViewControllerToContextMap, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "containerViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "interactionController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v8, "containerViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSHashTable allObjects](self->_connectedWindowScenes, "allObjects");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setConnectedWindowScenes:", v12);

          objc_msgSend(v10, "reloadHyperregionComposerData");
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (id)_overrideInsetsOnWindowScene:(id)a3 forReason:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMapTable *windowSceneToInsetAssertionMap;
  NSMapTable *v12;
  NSMapTable *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  windowSceneToInsetAssertionMap = self->_windowSceneToInsetAssertionMap;
  if (!windowSceneToInsetAssertionMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v13 = self->_windowSceneToInsetAssertionMap;
    self->_windowSceneToInsetAssertionMap = v12;

    windowSceneToInsetAssertionMap = self->_windowSceneToInsetAssertionMap;
  }
  -[NSMapTable objectForKey:](windowSceneToInsetAssertionMap, "objectForKey:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_initWeak(&location, self);
    v15 = (void *)MEMORY[0x1E0D01718];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__SBPIPController__overrideInsetsOnWindowScene_forReason_identifier___block_invoke;
    v19[3] = &unk_1E8EBF0B8;
    objc_copyWeak(&v21, &location);
    v16 = v8;
    v20 = v16;
    objc_msgSend(v15, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("SBPIPControllerInsetOverrideAssertion"), v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_windowSceneToInsetAssertionMap, "setObject:forKey:", v14, v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v14, "acquireForReason:withContext:", v9, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPController _updateContainerViewControllersContentPaddingOnWindowScene:](self, "_updateContainerViewControllersContentPaddingOnWindowScene:", v8);

  return v17;
}

void __69__SBPIPController__overrideInsetsOnWindowScene_forReason_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateContainerViewControllersContentPaddingOnWindowScene:", *(_QWORD *)(a1 + 32));

}

void __66__SBPIPController__shouldStashForTransitionContext_onWindowScene___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "containerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "handleStashingForTransitionContext:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (BOOL)_hasStashAssertionForWindowScene:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_windowSceneToStashAssertionsMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)containerViewController:(id)a3 userDidUpdateStashState:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  SBPIPStashAssertion **p_transitionStashAssertion;
  id WeakRetained;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint8_t v23[16];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    -[SBPIPController _contextForContainerViewController:](self, "_contextForContainerViewController:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[SBPIPController _hasStashAssertionForWindowScene:](self, "_hasStashAssertionForWindowScene:", v9))
    {
      SBLogPIP();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[Assertions] No assertions found upon user stashing, starting resources usage reduction timer.", v23, 2u);
      }

      self->_defaultToStashed = 1;
      self->_isReducingResourcesUsage = 1;
      objc_msgSend(v7, "overrideResourcesUsageReductionTimeout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v7, "overrideResourcesUsageReductionTimeout");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

      }
      else
      {
        v14 = 30.0;
      }
      objc_msgSend(v7, "startResourcesUsageReductionAfterTimeout:", v14);
    }
  }
  else
  {
    self->_defaultToStashed = 0;
    self->_isReducingResourcesUsage = 0;
    objc_msgSend(v6, "stopResourcesUsageReduction");
    p_transitionStashAssertion = &self->_transitionStashAssertion;
    WeakRetained = objc_loadWeakRetained((id *)p_transitionStashAssertion);
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "invalidate");
      objc_storeWeak((id *)p_transitionStashAssertion, 0);
    }
  }

  +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentTestName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18
    && ((objc_msgSend(v18, "containsString:", CFSTR("PIP")) & 1) != 0
     || objc_msgSend(v18, "containsString:", CFSTR("PiP"))))
  {
    v19 = CFSTR("SBApplicationTestingPIPIsNoLongerStashed");
    if (v4)
      v19 = CFSTR("SBApplicationTestingPIPIsStashed");
    v20 = (void *)MEMORY[0x1E0CB37D0];
    v21 = v19;
    objc_msgSend(v20, "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postNotificationName:object:", v21, 0);

  }
}

- (void)containerViewControllerUserMayUpdateStashState:(id)a3
{
  if (self->_isReducingResourcesUsage)
    objc_msgSend(a3, "stopResourcesUsageReduction");
}

- (void)containerViewController:(id)a3 didFinishStartAnimationWithInitialInterfaceOrientation:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[SBPIPController _contextForContainerViewController:](self, "_contextForContainerViewController:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation");

  if (v7 != a4)
  {
    objc_msgSend(v9, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPController _updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:](self, "_updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:", v8, 1, 0, objc_msgSend((id)SBApp, "activeInterfaceOrientation"), 1);

  }
}

- (void)addContainerViewController:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "contentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPController containerViewControllerForContentViewController:](self, "containerViewControllerForContentViewController:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPController.m"), 786, CFSTR("call to addContainerViewController: for a containerViewController whose contentViewController is already contained by some other controller. Passed containerViewController: %@ Preexisting containerViewController: %@"), v7, v10);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneManager);
  objc_msgSend(v7, "scenePersistenceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "windowSceneForPersistentIdentifier:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "embeddedDisplayWindowScene");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "activeDisplayWindowScene");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (-[SBPIPController contentType](self, "contentType") == 1)
      v16 = (void *)v14;
    else
      v16 = (void *)v15;
    v13 = v16;
  }
  objc_msgSend(v13, "pictureInPictureManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_updateFloatingDockInsetsWithoutNotifyingControllers");

  if (!-[NSHashTable containsObject:](self->_connectedWindowScenes, "containsObject:", v13))
    -[SBPIPController _windowSceneDidConnect:](self, "_windowSceneDidConnect:", v13);
  if (!-[NSHashTable containsObject:](self->_connectedWindowScenes, "containsObject:", v14))
    -[SBPIPController _windowSceneDidConnect:](self, "_windowSceneDidConnect:", v14);
  if (-[SBPIPController contentType](self, "contentType") != 1
    && !-[NSHashTable containsObject:](self->_connectedWindowScenes, "containsObject:", v15))
  {
    -[SBPIPController _windowSceneDidConnect:](self, "_windowSceneDidConnect:", v15);
  }
  v40 = (void *)v15;
  v18 = -[SBPIPController _createNewWindowForContainerViewController:onWindowScene:](self, "_createNewWindowForContainerViewController:onWindowScene:", v7, v13);
  -[SBPIPController _contextForContainerViewController:](self, "_contextForContainerViewController:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "windowScene");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 != v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPController.m"), 814, CFSTR("Following -_createNewWindowForContainerViewController: we expect a non-nil context matching the provided window scene"));

  }
  objc_msgSend(v7, "addObserver:", self);
  -[NSHashTable allObjects](self->_connectedWindowScenes, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConnectedWindowScenes:", v21);

  -[SBPIPController _pictureInPictureWindowMarginsOnWindowScene:](self, "_pictureInPictureWindowMarginsOnWindowScene:", v13);
  objc_msgSend(v7, "setContentViewPadding:");
  objc_msgSend(v7, "setInteractionControllerEnabled:stashed:dataSource:", 0, -[SBPIPController _hasStashAssertionForWindowScene:](self, "_hasStashAssertionForWindowScene:", v13), v8);
  objc_msgSend(v7, "setInteractionObserver:", self);
  -[SBPIPController _minimumStashedPaddingDidChangeOnWindowScene:](self, "_minimumStashedPaddingDidChangeOnWindowScene:", v13);
  objc_msgSend(v7, "setInteractionsEnabled:", 1);
  -[SBPIPController _updateHyperregionComposers](self, "_updateHyperregionComposers");
  if ((*((_BYTE *)self + 248) & 1) != 0)
    -[SBPIPControllerAdapter pipController:didAddContainerViewController:](self->_adapter, "pipController:didAddContainerViewController:", self, v7);
  v41 = (void *)v14;
  v22 = objc_msgSend(v7, "processIdentifier");
  objc_msgSend(v7, "scenePersistenceIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPController pictureInPictureMorphAnimatorControllerForProcessIdentifier:scenePersistenceIdentifier:](self, "pictureInPictureMorphAnimatorControllerForProcessIdentifier:scenePersistenceIdentifier:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    objc_msgSend(v24, "setPictureInPictureContainerViewController:", v7);
  v25 = (void *)v10;
  if ((*((_BYTE *)self + 249) & 8) != 0
    && -[SBPIPControllerAdapter preventStashAssertionsForPIPController:](self->_adapter, "preventStashAssertionsForPIPController:", self))
  {
    v39 = v8;
    -[NSMapTable objectForKey:](self->_windowSceneToStashAssertionsMap, "objectForKey:", v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");

    self->_defaultToStashed = 0;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v43;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v43 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v32++), "invalidate");
        }
        while (v30 != v32);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v30);
    }

    v8 = v39;
  }
  -[SBPIPController invalidateIdleTimerBehaviors](self, "invalidateIdleTimerBehaviors");
  objc_msgSend(v7, "viewIfLoaded");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "window");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_sbWindowScene");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "pictureInPictureManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "setNeedsUpdateZStackParticipantPreferencesWithReason:", CFSTR("added container view controller"));
}

- (id)containerViewControllersOnWindowScene:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__SBPIPController_containerViewControllersOnWindowScene___block_invoke;
    v9[3] = &unk_1E8EBF108;
    v10 = v5;
    v6 = v5;
    -[SBPIPController _enumerateContextsForWindowScene:usingBlock:](self, "_enumerateContextsForWindowScene:usingBlock:", v4, v9);
    v7 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    -[SBPIPController _allContainerViewControllers](self, "_allContainerViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __57__SBPIPController_containerViewControllersOnWindowScene___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "containerViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __40__SBPIPController_hostedAppSceneHandles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hostedAppSceneHandle");
}

uint64_t __70__SBPIPController_isPresentingPictureInPictureRequiringMedusaKeyboard__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requiresMedusaKeyboard");
}

- (id)containerViewControllerForContentViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMapTable keyEnumerator](self->_containerViewControllerToContextMap, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "contentViewController");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeContainerViewController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogPIP();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      _SBFLoggingMethodProem();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@ needs to be invoked on the main thread!"), v9);

    }
  }
  -[SBPIPController _updateZStackIfNeededForDisappearingContainerViewController:](self, "_updateZStackIfNeededForDisappearingContainerViewController:", v4);
  -[NSMapTable objectForKey:](self->_containerViewControllerToContextMap, "objectForKey:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if ((*((_BYTE *)self + 248) & 2) != 0)
      -[SBPIPControllerAdapter pipController:willRemoveContainerViewController:](self->_adapter, "pipController:willRemoveContainerViewController:", self, v4);
    objc_msgSend(v4, "removeObserver:", self);
    objc_msgSend(v4, "setInteractionsEnabled:", 0);
    objc_msgSend(v4, "invalidate");
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);
    -[NSMapTable removeObjectForKey:](self->_containerViewControllerToContextMap, "removeObjectForKey:", v4);
    -[SBPIPController invalidateIdleTimerBehaviors](self, "invalidateIdleTimerBehaviors");
    objc_msgSend(v10, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPController _leadingWindowForWindowScene:](self, "_leadingWindowForWindowScene:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && (objc_msgSend(v13, "isHidden") & 1) == 0)
      -[SBPIPController _updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:](self, "_updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:", v12, 1, 0, objc_msgSend((id)SBApp, "activeInterfaceOrientation"), 1);

  }
}

- (void)_updateZStackIfNeededForDisappearingContainerViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  SBPIPController *v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sbWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pictureInPictureManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "shouldSuppressAssociatedElementsInSystemAperture"))
  {
    objc_msgSend(v4, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong((id *)&self->_bundleIDForAppRecentlyStoppingPIP, v9);
  v10 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SBPIPController__updateZStackIfNeededForDisappearingContainerViewController___block_invoke;
  block[3] = &unk_1E8E9E270;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);

}

uint64_t __79__SBPIPController__updateZStackIfNeededForDisappearingContainerViewController___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;

  result = BSEqualStrings();
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 184);
    *(_QWORD *)(v3 + 184) = 0;

    return objc_msgSend(*(id *)(a1 + 48), "setNeedsUpdateZStackParticipantPreferencesWithReason:", CFSTR("removed container view controller"));
  }
  return result;
}

- (void)prepareContainerViewControllerForHidingContentViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SBPIPController containerViewControllerForContentViewController:](self, "containerViewControllerForContentViewController:", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(objc_msgSend(v6, "floatingConfiguration") - 1) <= 1)
  {
    objc_msgSend(v6, "elementWithRole:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workspaceEntity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationSceneEntity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "application");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "isEqualToString:", v11) & 1) == 0)
    {
      -[SBPIPController _contextForContainerViewController:](self, "_contextForContainerViewController:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "windowScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBPIPController _setWindowsLevel:forWindowsOnWindowScene:](self, "_setWindowsLevel:forWindowsOnWindowScene:", v13, self->_windowLevel);
    }

  }
}

- (void)restoreContentViewController:(id)a3 appSceneEntity:(id)a4 morphAnimatorConfigurationBlock:(id)a5 completion:(id)a6
{
  id v11;
  void (**v12)(_QWORD, void *);
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  SEL v37;
  void (**v38)(_QWORD, void *);
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = (void (**)(_QWORD, void *))a5;
  v13 = a6;
  -[SBPIPController containerViewControllerForContentViewController:](self, "containerViewControllerForContentViewController:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v37 = a2;
    v38 = v12;
    v16 = objc_msgSend(v14, "processIdentifier");
    objc_msgSend(v11, "setFlag:forActivationSetting:", 1, 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SBPIPController contentType](self, "contentType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forActivationSetting:", v17, 57);

    +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sceneHandle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "currentConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createRequestWithOptions:displayConfiguration:", 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setOriginatingProcess:", v23);

    objc_msgSend(v22, "setSource:", 45);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __106__SBPIPController_restoreContentViewController_appSceneEntity_morphAnimatorConfigurationBlock_completion___block_invoke;
    v43[3] = &unk_1E8E9EE50;
    v24 = v11;
    v44 = v24;
    objc_msgSend(v22, "modifyApplicationContext:", v43);
    objc_msgSend(v24, "sceneHandle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "persistenceIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPController pictureInPictureMorphAnimatorControllerForProcessIdentifier:scenePersistenceIdentifier:](self, "pictureInPictureMorphAnimatorControllerForProcessIdentifier:scenePersistenceIdentifier:", v16, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v37, self, CFSTR("SBPIPController.m"), 978, CFSTR("An SBPIPMorphAnimatorController for pid %ui is already running, can't create new one."), v16);

    }
    objc_msgSend(v22, "uniqueID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sceneHandle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "persistenceIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBPIPController createAndRegisterPictureInPictureMorphAnimatorControllerWithTargetProcessIdentifier:uuid:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:gestureInitiated:direction:](self, "createAndRegisterPictureInPictureMorphAnimatorControllerWithTargetProcessIdentifier:uuid:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:gestureInitiated:direction:", v16, v28, v30, 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "setPictureInPictureContainerViewController:", v15);
    objc_msgSend(v15, "setInteractionsEnabled:", 0);
    objc_msgSend(v15, "acquireInterfaceOrientationLock");
    v12 = v38;
    v38[2](v38, v31);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __106__SBPIPController_restoreContentViewController_appSceneEntity_morphAnimatorConfigurationBlock_completion___block_invoke_2;
    v39[3] = &unk_1E8EA47F0;
    v40 = v15;
    v32 = v31;
    v41 = v32;
    v42 = v13;
    v33 = (id)objc_msgSend(v22, "addCompletionHandler:", v39);
    SBLogPIP();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v46 = v32;
      _os_log_impl(&dword_1D0540000, v34, OS_LOG_TYPE_DEFAULT, "morphAnimatorController will executeTransitionRequest %p", buf, 0xCu);
    }

    +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "executeTransitionRequest:", v22);

  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

uint64_t __106__SBPIPController_restoreContentViewController_appSceneEntity_morphAnimatorConfigurationBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActivatingEntity:", *(_QWORD *)(a1 + 32));
}

uint64_t __106__SBPIPController_restoreContentViewController_appSceneEntity_morphAnimatorConfigurationBlock_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  id *v6;
  NSObject *v7;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "relinquishInterfaceOrientationLock");
  SBLogPIP();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 40);
    v4 = objc_msgSend(v3, "hasCompletedSourceAnimations");
    v5 = objc_msgSend(*(id *)(a1 + 40), "hasCompletedTargetAnimations");
    v9 = 138543874;
    v10 = v3;
    v11 = 1024;
    v12 = v4;
    v13 = 1024;
    v14 = v5;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "morphAnimatorController %{public}@ hasCompletedSourceAnimations: %{BOOL}u hasCompletedTargetAnimations: %{BOOL}u", (uint8_t *)&v9, 0x18u);
  }

  v6 = (id *)(a1 + 40);
  if (!objc_msgSend(*(id *)(a1 + 40), "hasCompletedSourceAnimations")
    || (objc_msgSend(*v6, "hasCompletedTargetAnimations") & 1) == 0)
  {
    SBLogPIP();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __106__SBPIPController_restoreContentViewController_appSceneEntity_morphAnimatorConfigurationBlock_completion___block_invoke_2_cold_1((uint64_t *)(a1 + 40), v7);

    objc_msgSend(*v6, "cancel");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_refreshLockStateProviderInterruptionAssertions
{
  _BOOL4 v3;
  SBPIPInterruptionAssertion *lockedInterruptionAssertion;
  SBPIPInterruptionAssertion **p_lockedInterruptionAssertion;
  SBPIPInterruptionAssertion *v6;
  void *v7;
  SBPIPInterruptionAssertion *obj;

  v3 = -[SBPIPController _allWindowScenesLocked](self, "_allWindowScenesLocked");
  p_lockedInterruptionAssertion = &self->_lockedInterruptionAssertion;
  lockedInterruptionAssertion = self->_lockedInterruptionAssertion;
  if (!v3)
  {
    -[BSSimpleAssertion invalidate](lockedInterruptionAssertion, "invalidate");
    v6 = *p_lockedInterruptionAssertion;
    *p_lockedInterruptionAssertion = 0;
LABEL_7:

    return;
  }
  if (!lockedInterruptionAssertion)
  {
    SBStringForPIPBehaviorOverrideReason(2uLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPController _acquireInterruptionAssertionForReason:identifier:cameraSensorBundleIdentifier:](self, "_acquireInterruptionAssertionForReason:identifier:cameraSensorBundleIdentifier:", 2, v7, 0);
    obj = (SBPIPInterruptionAssertion *)objc_claimAutoreleasedReturnValue();

    v6 = obj;
    if (obj)
    {
      objc_storeStrong((id *)&self->_lockedInterruptionAssertion, obj);
      -[SBPIPController _suspendPIPForInterruptionAssertion:](self, "_suspendPIPForInterruptionAssertion:", obj);
      v6 = obj;
    }
    goto LABEL_7;
  }
}

- (void)lockStateProvider:(id)a3 didUpdateIsUILocked:(BOOL)a4
{
  if (a4)
    -[SBPIPController _didLockStateProviderLock:](self, "_didLockStateProviderLock:", a3);
  else
    -[SBPIPController _didLockStateProviderUnlock:](self, "_didLockStateProviderUnlock:", a3);
}

- (void)setPictureInPictureWindowsHidden:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[NSMutableSet containsObject:](self->_pictureInPictureWindowHiddenReasons, "containsObject:", v6);
  if (v4)
  {
    if ((v7 & 1) != 0)
      goto LABEL_15;
    -[NSMutableSet addObject:](self->_pictureInPictureWindowHiddenReasons, "addObject:", v6);
    if (-[NSMutableSet count](self->_pictureInPictureWindowHiddenReasons, "count") != 1)
      goto LABEL_15;
  }
  else
  {
    if (!v7)
      goto LABEL_15;
    -[NSMutableSet removeObject:](self->_pictureInPictureWindowHiddenReasons, "removeObject:", v6);
    if (-[NSMutableSet count](self->_pictureInPictureWindowHiddenReasons, "count"))
      goto LABEL_15;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBPIPController _windowScenesDisplayingPIPContent](self, "_windowScenesDisplayingPIPContent", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SBPIPController _managePictureInPictureWindowVisibilityForWindowScene:animated:](self, "_managePictureInPictureWindowVisibilityForWindowScene:animated:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), 1);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

LABEL_15:
}

- (id)acquireStashAssertionForWindowScene:(id)a3 withReason:(int64_t)a4 identifier:(id)a5
{
  return -[SBPIPController _acquireStashAssertionForWindowScene:withReason:identifier:customAllowedEnvironmentModes:](self, "_acquireStashAssertionForWindowScene:withReason:identifier:customAllowedEnvironmentModes:", a3, a4, a5, 0);
}

- (id)_acquireStashAssertionForWindowScene:(id)a3 withReason:(int64_t)a4 identifier:(id)a5 customAllowedEnvironmentModes:(id)a6
{
  id v10;
  id v11;
  id v12;
  SBPIPStashAssertion *v13;
  NSMapTable *windowSceneToStashAssertionsMap;
  NSMapTable *v15;
  NSMapTable *v16;
  void *v17;
  SBPIPStashAssertion *v18;
  id v19;
  id v20;
  SBPIPStashAssertion *v21;
  NSObject *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id location;
  uint8_t buf[4];
  SBPIPStashAssertion *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if ((*((_BYTE *)self + 249) & 8) != 0
    && (-[SBPIPControllerAdapter preventStashAssertionsForPIPController:](self->_adapter, "preventStashAssertionsForPIPController:", self) & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    windowSceneToStashAssertionsMap = self->_windowSceneToStashAssertionsMap;
    if (!windowSceneToStashAssertionsMap)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v15 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v16 = self->_windowSceneToStashAssertionsMap;
      self->_windowSceneToStashAssertionsMap = v15;

      windowSceneToStashAssertionsMap = self->_windowSceneToStashAssertionsMap;
    }
    -[NSMapTable objectForKey:](windowSceneToStashAssertionsMap, "objectForKey:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      -[NSMapTable setObject:forKey:](self->_windowSceneToStashAssertionsMap, "setObject:forKey:", v17, v10);
    }
    objc_initWeak(&location, self);
    v18 = [SBPIPStashAssertion alloc];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __108__SBPIPController__acquireStashAssertionForWindowScene_withReason_identifier_customAllowedEnvironmentModes___block_invoke;
    v24[3] = &unk_1E8EB2468;
    objc_copyWeak(&v27, &location);
    v24[4] = self;
    v19 = v17;
    v25 = v19;
    v20 = v10;
    v26 = v20;
    v21 = -[SBPIPEnvironmentDependentOverrideAssertion initWithReason:identifier:windowScene:invalidationBlock:](v18, "initWithReason:identifier:windowScene:invalidationBlock:", a4, v11, v20, v24);
    v13 = v21;
    if (v21)
    {
      if (v12)
        -[SBPIPEnvironmentDependentOverrideAssertion setAllowedEnvironmentModes:](v21, "setAllowedEnvironmentModes:", v12);
      objc_msgSend(v19, "addObject:", v13);
      -[SBPIPController _setContainersStashed:forWindowScene:](self, "_setContainersStashed:forWindowScene:", 1, v20);
      SBLogPIP();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v30 = v13;
        _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "[Assertions] Stash assertion was acquired: %{public}@. Stashing.", buf, 0xCu);
      }

    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return v13;
}

void __108__SBPIPController__acquireStashAssertionForWindowScene_withReason_identifier_customAllowedEnvironmentModes___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  unsigned __int8 *WeakRetained;
  _QWORD *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = *(_QWORD **)(a1 + 32);
    if ((__CFString *)v5[18] == v3)
      objc_msgSend(v5, "_cancelInterruptionDebouncingTimer");
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v3);
    SBLogPIP();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v3;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[Assertions] Stash assertion was invalidated: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    if ((objc_msgSend(WeakRetained, "_hasStashAssertionForWindowScene:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      SBLogPIP();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Assertions] No more stash assertions in place.", (uint8_t *)&v10, 2u);
      }

      objc_msgSend(WeakRetained, "_setContainersStashed:forWindowScene:", WeakRetained[168], *(_QWORD *)(a1 + 48));
      SBLogPIP();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        if (WeakRetained[168])
          v9 = CFSTR("stashed");
        else
          v9 = CFSTR("normal");
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[Assertions] Setting stash to: %{public}@", (uint8_t *)&v10, 0xCu);
      }

    }
  }

}

- (void)_invalidateInterruptionAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  NSUInteger v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  SBPIPStashAssertion *v10;
  SBPIPInterruptionDebouncingTimer *v11;
  SBPIPInterruptionDebouncingTimer *interruptionEndDebouncingTimer;
  SBPIPInterruptionDebouncingTimer *v13;
  id v14;
  SBPIPStashAssertion *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  SBPIPStashAssertion *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogPIP();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Assertions] Interruption assertion was invalidated: %{public}@", buf, 0xCu);
  }

  v6 = -[NSHashTable count](self->_interruptionAssertions, "count");
  SBLogPIP();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Assertions] Stop interrupting PIP for expired assertion.", buf, 2u);
    }

    -[SBPIPController endPIPInterruptionForAssertion:](self, "endPIPInterruptionForAssertion:", v4);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Assertions] No more interruption assertions in place.", buf, 2u);
    }

    if (self->_stashForInterruptionAssertion)
    {
      SBLogPIP();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[Assertions] Start PIP interruption debounce timer.", buf, 2u);
      }

      v10 = self->_stashForInterruptionAssertion;
      v11 = -[BSAbsoluteMachTimer initWithIdentifier:]([SBPIPInterruptionDebouncingTimer alloc], "initWithIdentifier:", CFSTR("SBPIPController.interruptionEndDebouncingTimer"));
      interruptionEndDebouncingTimer = self->_interruptionEndDebouncingTimer;
      self->_interruptionEndDebouncingTimer = v11;

      v13 = self->_interruptionEndDebouncingTimer;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __52__SBPIPController__invalidateInterruptionAssertion___block_invoke;
      v17[3] = &unk_1E8EBF190;
      v17[4] = self;
      v14 = v4;
      v18 = v14;
      v19 = v10;
      v15 = v10;
      -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v13, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v17, 2.0, 0.0);
      -[SBPIPInterruptionDebouncingTimer setDebouncedAssertion:](self->_interruptionEndDebouncingTimer, "setDebouncedAssertion:", v14);

    }
    else
    {
      -[SBPIPController endPIPInterruptionForAssertion:](self, "endPIPInterruptionForAssertion:", v4);
      SBLogPIP();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "[Assertions] If necessary, stop interrupting PIP immediately, since we don't have an interruption stash assertion.", buf, 2u);
      }

    }
  }

}

void __52__SBPIPController__invalidateInterruptionAssertion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  SBLogPIP();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[Assertions] PIP interruption debounce timer expired. Stop interrupting PIP for previously expired assertion.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endPIPInterruptionForAssertion:", *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count");
  v4 = *(_QWORD *)(a1 + 32);
  if (!v3 && *(_QWORD *)(a1 + 48) == *(_QWORD *)(v4 + 144))
  {
    SBLogPIP();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Assertions] Invalidate any stash-for-interruption assertion since no assertion is in place after interruption debouncing.", v10, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 144);
    *(_QWORD *)(v6 + 144) = 0;

    v4 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v4 + 160), "invalidate");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 160);
  *(_QWORD *)(v8 + 160) = 0;

}

- (void)_suspendPIPForInterruptionAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  SBPIPStashAssertion *v13;
  id v14;
  SBPIPStashAssertion *v15;
  SBPIPStashAssertion *stashForInterruptionAssertion;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  __CFString *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogPIP();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Assertions] Interrupting for assertion: %{public}@", buf, 0xCu);
  }

  if ((*((_BYTE *)self + 248) & 4) != 0)
    v6 = -[SBPIPControllerAdapter pipController:willBeginPIPInterruptionForAssertion:](self->_adapter, "pipController:willBeginPIPInterruptionForAssertion:", self, v4) ^ 1;
  else
    LOBYTE(v6) = 0;
  if (!self->_stashForInterruptionAssertion && (v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E91D20F0, &unk_1E91D2108, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPController _windowScenesDisplayingPIPContent](self, "_windowScenesDisplayingPIPContent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__SBPIPController__suspendPIPForInterruptionAssertion___block_invoke;
    v20[3] = &unk_1E8EBF1B8;
    v20[4] = self;
    v21 = CFSTR("SBPIPController");
    v11 = v7;
    v22 = v11;
    objc_msgSend(v9, "bs_compactMap:", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v13 = [SBPIPStashAssertion alloc];
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __55__SBPIPController__suspendPIPForInterruptionAssertion___block_invoke_2;
    v17[3] = &unk_1E8EAE2E0;
    v14 = v12;
    v18 = v14;
    objc_copyWeak(&v19, (id *)buf);
    v15 = -[SBPIPBehaviorOverrideAssertion initWithReason:identifier:invalidationBlock:](v13, "initWithReason:identifier:invalidationBlock:", 3, CFSTR("SBPIPController"), v17);
    stashForInterruptionAssertion = self->_stashForInterruptionAssertion;
    self->_stashForInterruptionAssertion = v15;

    -[SBPIPEnvironmentDependentOverrideAssertion setInvalidatesEarly:](self->_stashForInterruptionAssertion, "setInvalidatesEarly:", 1);
    objc_destroyWeak(&v19);

    objc_destroyWeak((id *)buf);
  }
  -[SBPIPController invalidateIdleTimerBehaviors](self, "invalidateIdleTimerBehaviors");
  -[SBPIPController _cancelInterruptionDebouncingTimer](self, "_cancelInterruptionDebouncingTimer");

}

uint64_t __55__SBPIPController__suspendPIPForInterruptionAssertion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_acquireStashAssertionForWindowScene:withReason:identifier:customAllowedEnvironmentModes:", a2, 3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __55__SBPIPController__suspendPIPForInterruptionAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "invalidate", (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 18) == v3)
  {
    *((_QWORD *)WeakRetained + 18) = 0;

  }
}

- (id)_acquireInterruptionAssertionForReason:(int64_t)a3 identifier:(id)a4 cameraSensorBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  NSHashTable *v10;
  NSHashTable *interruptionAssertions;
  SBPIPInterruptionAssertion *v12;
  SBPIPInterruptionAssertion *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  v8 = a4;
  v9 = a5;
  if (!self->_interruptionAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    interruptionAssertions = self->_interruptionAssertions;
    self->_interruptionAssertions = v10;

  }
  objc_initWeak(&location, self);
  v12 = [SBPIPInterruptionAssertion alloc];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __98__SBPIPController__acquireInterruptionAssertionForReason_identifier_cameraSensorBundleIdentifier___block_invoke;
  v18 = &unk_1E8EBF1E0;
  objc_copyWeak(&v19, &location);
  v13 = -[SBPIPBehaviorOverrideAssertion initWithReason:identifier:cameraSensorAttributionBundleIdentifier:invalidationBlock:](v12, "initWithReason:identifier:cameraSensorAttributionBundleIdentifier:invalidationBlock:", a3, v8, v9, &v15);
  if (v13)
    -[NSHashTable addObject:](self->_interruptionAssertions, "addObject:", v13, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

void __98__SBPIPController__acquireInterruptionAssertionForReason_identifier_cameraSensorBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[14], "removeObject:", v5);
    objc_msgSend(v4, "_invalidateInterruptionAssertion:", v5);
  }

}

- (BOOL)isStoppingOrCancellingPictureInPictureForApplicationWithBundleIdentifier:(id)a3 scenePersistenceIdentifier:(id)a4
{
  return -[SBPIPControllerAdapter isStoppingOrCancellingPictureForPIPController:applicationWithBundleIdentifier:scenePersistenceIdentifier:](self->_adapter, "isStoppingOrCancellingPictureForPIPController:applicationWithBundleIdentifier:scenePersistenceIdentifier:", self, a3, a4);
}

- (int64_t)tetheringModeForScenePersistenceIdentifier:(id)a3
{
  return -[SBPIPControllerAdapter tetheringModeForScenePersistenceIdentifier:](self->_adapter, "tetheringModeForScenePersistenceIdentifier:", a3);
}

- (void)startPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, void *);
  void *v25;
  SBPIPController *v26;
  id v27;
  id v28;
  id v29;

  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a6;
  if (-[SBPIPController shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:](self, "shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:", v8, v10))
  {
    +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applicationWithPid:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_bundleIDForAppAnimatingPIPStartInBackground, v14);
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneManager);
    objc_msgSend(WeakRetained, "windowSceneForPersistentIdentifier:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pictureInPictureManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setNeedsUpdateZStackParticipantPreferencesWithReason:", CFSTR("background PIP starting"));
    objc_msgSend(v17, "_updateFloatingDockInsetsWithoutNotifyingControllers");
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __148__SBPIPController_startPictureInPictureForApplicationWithProcessIdentifierEnteringBackground_scenePersistenceIdentifier_animated_completionHandler___block_invoke;
    v25 = &unk_1E8EBF208;
    v26 = self;
    v29 = v11;
    v18 = v14;
    v27 = v18;
    v19 = v17;
    v28 = v19;
    v20 = MEMORY[0x1D17E5550](&v22);
    v21 = (void *)v20;
    if ((*((_BYTE *)self + 248) & 0x10) != 0)
      -[SBPIPControllerAdapter pipController:didStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:animated:completionHandler:](self->_adapter, "pipController:didStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:animated:completionHandler:", self, v8, v10, v7, v20, v22, v23, v24, v25, v26, v27);
    else
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v20 + 16))(v20, 1, 0);

  }
}

uint64_t __148__SBPIPController_startPictureInPictureForApplicationWithProcessIdentifierEnteringBackground_scenePersistenceIdentifier_animated_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "invalidateIdleTimerBehaviors");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  if (BSEqualStrings())
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 176);
    *(_QWORD *)(v6 + 176) = 0;

  }
  return objc_msgSend(*(id *)(a1 + 48), "setNeedsUpdateZStackParticipantPreferencesWithReason:", CFSTR("background PIP started"));
}

- (void)cancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4
{
  if ((*((_BYTE *)self + 248) & 0x20) != 0)
    -[SBPIPControllerAdapter pipController:didCancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:](self->_adapter, "pipController:didCancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:", self, *(_QWORD *)&a3, a4);
}

- (void)endPIPInterruptionForAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogPIP();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "end interruption for %{public}@", (uint8_t *)&v6, 0xCu);
  }

  if ((*((_BYTE *)self + 248) & 8) != 0)
    -[SBPIPControllerAdapter pipController:willEndPIPInterruptionForAssertion:](self->_adapter, "pipController:willEndPIPInterruptionForAssertion:", self, v4);
  -[SBPIPController invalidateIdleTimerBehaviors](self, "invalidateIdleTimerBehaviors");

}

- (void)updatePictureInPictureWindowLevelForWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double windowLevel;
  void *v8;
  double v9;
  double v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "pictureInPictureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_windowLevelOverrideAssertionsForContentType:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    windowLevel = (double)(unint64_t)objc_msgSend(v6, "windowLevel");

  }
  else
  {
    windowLevel = self->_windowLevel;
  }
  -[SBPIPController _setWindowsLevel:forWindowsOnWindowScene:](self, "_setWindowsLevel:forWindowsOnWindowScene:", v4, windowLevel);
  -[SBPIPController _leadingWindowForWindowScene:](self, "_leadingWindowForWindowScene:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "windowLevel");
  v10 = v9;

  if (v10 != windowLevel && (*((_BYTE *)self + 249) & 2) != 0)
    -[SBPIPControllerAdapter windowLevelDidChangeForPIPController:](self->_adapter, "windowLevelDidChangeForPIPController:", self);

}

- (void)handleDestructionRequestForSceneHandles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMapTable keyEnumerator](self->_containerViewControllerToContextMap, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "hostedAppSceneHandle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "containsObject:", v12))
          objc_msgSend(v11, "handleDestructionRequestForSceneHandle:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)updateZStackParticipantPreferencesIfNeeded:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__118;
  v32 = __Block_byref_object_dispose__118;
  v33 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__SBPIPController_updateZStackParticipantPreferencesIfNeeded_windowScene___block_invoke;
  v27[3] = &unk_1E8EBF230;
  v27[4] = &v28;
  v8 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v27);
  v9 = objc_opt_class();
  v10 = v7;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  -[SBPIPController containerViewControllersOnWindowScene:](self, "containerViewControllersOnWindowScene:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v18, "shouldSuppressAssociatedElementsInSystemAperture", (_QWORD)v23))
        {
          objc_msgSend(v18, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v8[2](v8);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v19);

          }
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    }
    while (v15);
  }

  if (self->_bundleIDForAppRecentlyStoppingPIP)
  {
    v8[2](v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", self->_bundleIDForAppRecentlyStoppingPIP);

  }
  if (self->_bundleIDForAppAnimatingPIPStartInBackground)
  {
    v8[2](v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", self->_bundleIDForAppAnimatingPIPStartInBackground);

  }
  objc_msgSend((id)v29[5], "removeObject:", CFSTR("com.apple.InCallService"), (_QWORD)v23);
  objc_msgSend(v6, "setAssociatedBundleIdentifiersToSuppressInSystemAperture:", v29[5]);

  _Block_object_dispose(&v28, 8);
}

id __74__SBPIPController_updateZStackParticipantPreferencesIfNeeded_windowScene___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  return v2;
}

- (void)setEnhancedWindowingModeEnabled:(BOOL)a3 windowScene:(id)a4
{
  if ((*((_BYTE *)self + 249) & 0x10) != 0)
    -[SBPIPControllerAdapter pipController:didUpdateEnhancedWindowingModeEnabled:windowScene:](self->_adapter, "pipController:didUpdateEnhancedWindowingModeEnabled:windowScene:", self, a3, a4);
}

- (double)windowLevelForWindowScene:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[SBPIPController _leadingWindowForWindowScene:](self, "_leadingWindowForWindowScene:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowLevel");
  v5 = v4;

  return v5;
}

- (BOOL)hasCameraInterruptionForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NSMutableDictionary allKeys](self->_cameraInterruptionAssertions, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__SBPIPController_hasCameraInterruptionForBundleIdentifier___block_invoke;
  v9[3] = &unk_1E8EBF258;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v9);

  return v7;
}

uint64_t __60__SBPIPController_hasCameraInterruptionForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)hideContainersExcludingContainerForContentViewControllerAndTetheredOnes:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v4 = a4;
  v6 = a3;
  -[SBPIPController containerViewControllerForContentViewController:](self, "containerViewControllerForContentViewController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPController _contextForContainerViewController:](self, "_contextForContainerViewController:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "tetheringContainerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CEABB0];
    if (v4)
      v12 = 0.1;
    else
      v12 = 0.0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __100__SBPIPController_hideContainersExcludingContainerForContentViewControllerAndTetheredOnes_animated___block_invoke;
    v14[3] = &unk_1E8E9F108;
    v14[4] = self;
    v15 = v9;
    v16 = v6;
    v17 = v10;
    v13 = v10;
    objc_msgSend(v11, "animateWithDuration:animations:", v14, v12);

  }
}

void __100__SBPIPController_hideContainersExcludingContainerForContentViewControllerAndTetheredOnes_animated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "containerViewControllersOnWindowScene:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "contentViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 48);

        if (v8 != v9)
        {
          objc_msgSend(v7, "tetheringContainerViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            if (v7 == *(void **)(a1 + 56))
              continue;
            objc_msgSend(v7, "view");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setAlpha:", 0.0);
          }

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)bringTetheredContentToFrontOnWindowScene:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[4];

  v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v8[3] = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SBPIPController_bringTetheredContentToFrontOnWindowScene___block_invoke;
  v7[3] = &unk_1E8EBF280;
  v7[4] = v8;
  -[SBPIPController _enumerateContextsForWindowScene:usingBlock:](self, "_enumerateContextsForWindowScene:usingBlock:", v4, v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __60__SBPIPController_bringTetheredContentToFrontOnWindowScene___block_invoke_2;
  v6[3] = &unk_1E8EBF280;
  v6[4] = v8;
  -[SBPIPController _enumerateContextsForWindowScene:usingBlock:](self, "_enumerateContextsForWindowScene:usingBlock:", v4, v6);
  _Block_object_dispose(v8, 8);

}

void __60__SBPIPController_bringTetheredContentToFrontOnWindowScene___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  objc_msgSend(a2, "window");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowLevel");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = fmax(v3, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 24));

}

void __60__SBPIPController_bringTetheredContentToFrontOnWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "containerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isActivelyTethered"))
  {
    objc_msgSend(v5, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWindowLevel:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 0.01);

  }
}

- (void)showAllContentOnWindowScene:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CEABB0];
  if (v4)
    v8 = 0.33;
  else
    v8 = 0.0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__SBPIPController_showAllContentOnWindowScene_animated___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0, v10, 0, v8, 0.0);

}

uint64_t __56__SBPIPController_showAllContentOnWindowScene_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAlpha:forWindowsOnWindowScene:", *(_QWORD *)(a1 + 40), 1.0);
}

- (id)connectedWindowScenes
{
  return -[NSHashTable allObjects](self->_connectedWindowScenes, "allObjects");
}

- (BOOL)_allWindowScenesLocked
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_connectedWindowScenes;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "uiLockStateProvider", (_QWORD)v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isUILocked");

        if (!v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)movePIPContentToWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBPIPController connectedWindowScenes](self, "connectedWindowScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSMapTable objectEnumerator](self->_containerViewControllerToContextMap, "objectEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v11, "windowScene");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          if (v12 != v4)
            -[SBPIPController _moveContext:toWindowScene:](self, "_moveContext:toWindowScene:", v11, v4);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)_startPictureInPictureTestActionForApplicationWithBundleIdentifier:(id)a3
{
  if (*((char *)self + 248) < 0)
    -[SBPIPControllerAdapter pipController:willStartPictureInPictureTestActionForApplicationWithBundleIdentifier:](self->_adapter, "pipController:willStartPictureInPictureTestActionForApplicationWithBundleIdentifier:", self, a3);
}

- (void)_restorePictureInPictureForTestForApplicationWithBundleIdentifier:(id)a3
{
  if ((*((_BYTE *)self + 249) & 1) != 0)
    -[SBPIPControllerAdapter pipController:willRestorePictureInPictureForTestForApplicationWithBundleIdentifier:](self->_adapter, "pipController:willRestorePictureInPictureForTestForApplicationWithBundleIdentifier:", self, a3);
}

- (void)alertItemsController:(id)a3 didActivateAlertItem:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SBPIPController _windowScenesDisplayingPIPContent](self, "_windowScenesDisplayingPIPContent", a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[SBPIPController updatePictureInPictureWindowLevelForWindowScene:](self, "updatePictureInPictureWindowLevelForWindowScene:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)alertItemsController:(id)a3 didDeactivateAlertItem:(id)a4 forReason:(int)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBPIPController _windowScenesDisplayingPIPContent](self, "_windowScenesDisplayingPIPContent", a3, a4, *(_QWORD *)&a5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[SBPIPController updatePictureInPictureWindowLevelForWindowScene:](self, "updatePictureInPictureWindowLevelForWindowScene:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a4;
  v6 = objc_opt_class();
  v9 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v9;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  -[SBPIPController updatePictureInPictureWindowLevelForWindowScene:](self, "updatePictureInPictureWindowLevelForWindowScene:", v8);
}

- (void)assistantDidDisappear:(id)a3 windowScene:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a4;
  v6 = objc_opt_class();
  v9 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v9;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  -[SBPIPController updatePictureInPictureWindowLevelForWindowScene:](self, "updatePictureInPictureWindowLevelForWindowScene:", v8);
}

- (id)_createNewWindowForContainerViewController:(id)a3 onWindowScene:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  SBPictureInPictureWindow *v14;
  id v15;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogPIP();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (v11)
    {
      _SBFLoggingMethodProem();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@ needs to be invoked on the main thread!"), v12);

    }
  }
  -[SBPIPController _contextForContainerViewController:creatingWithWindowSceneIfNeeded:](self, "_contextForContainerViewController:creatingWithWindowSceneIfNeeded:", v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (SBPictureInPictureWindow *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v13, "windowScene");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 != v7)
      -[SBPIPController _moveContext:toWindowScene:](self, "_moveContext:toWindowScene:", v13, v7);
    v14 = -[SBPictureInPictureWindow initWithWindowScene:]([SBPictureInPictureWindow alloc], "initWithWindowScene:", v15);
    -[SBPictureInPictureWindow _setRoleHint:](v14, "_setRoleHint:", CFSTR("SBTraitsParticipantRolePictureInPicture"));
    -[SBPictureInPictureWindow setRootViewController:](v14, "setRootViewController:", v6);
    -[SBPictureInPictureWindow setOpaque:](v14, "setOpaque:", 0);
    objc_msgSend(v13, "setWindow:", v14);
    -[SBPIPController _edgeInsetsDidChangeOnWindowScene:](self, "_edgeInsetsDidChangeOnWindowScene:", v15);
    -[SBPIPController updatePictureInPictureWindowLevelForWindowScene:](self, "updatePictureInPictureWindowLevelForWindowScene:", v15);
    -[SBPIPController _managePictureInPictureWindowVisibilityForWindowScene:animated:](self, "_managePictureInPictureWindowVisibilityForWindowScene:animated:", v15, 0);
    -[SBPictureInPictureWindow setHidden:](v14, "setHidden:", 0);

  }
  return v13;
}

- (BOOL)_shouldHideWindowScene:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[NSMutableSet count](self->_pictureInPictureWindowHiddenReasons, "count");
  if (v5 != 1)
    goto LABEL_5;
  -[NSMutableSet anyObject](self->_pictureInPictureWindowHiddenReasons, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("SBLockScreenPictureInPictureHiddenReason")))
  {

LABEL_5:
    v8 = v5 != 0;
    goto LABEL_6;
  }
  objc_msgSend(v4, "uiLockStateProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUILocked");

LABEL_6:
  return v8;
}

- (void)_managePictureInPictureWindowVisibilityForWindowScene:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  double v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  char v16;
  _QWORD v17[5];
  id v18;
  BOOL v19;

  v4 = a4;
  v6 = a3;
  if (!-[NSMutableSet count](self->_pictureInPictureMorphAnimatorControllers, "count"))
  {
    -[SBPIPController _leadingWindowForWindowScene:](self, "_leadingWindowForWindowScene:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isHidden");

    v9 = -[SBPIPController _shouldHideWindowScene:](self, "_shouldHideWindowScene:", v6);
    v10 = !v9;
    if (!v9)
    {
      -[SBPIPController _setHidden:forWindowsOnWindowScene:](self, "_setHidden:forWindowsOnWindowScene:", 0, v6);
      if (v8)
      {
        if ((*((_BYTE *)self + 249) & 4) != 0)
          -[SBPIPControllerAdapter windowVisibilityDidChangeForPIPController:](self->_adapter, "windowVisibilityDidChangeForPIPController:", self);
      }
    }
    v11 = (void *)MEMORY[0x1E0CEABB0];
    if (v4)
      v12 = 0.2;
    else
      v12 = 0.0;
    v13 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __82__SBPIPController__managePictureInPictureWindowVisibilityForWindowScene_animated___block_invoke;
    v17[3] = &unk_1E8E9EE00;
    v19 = v10;
    v17[4] = self;
    v18 = v6;
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __82__SBPIPController__managePictureInPictureWindowVisibilityForWindowScene_animated___block_invoke_2;
    v14[3] = &unk_1E8EA8528;
    v14[4] = self;
    v15 = v18;
    v16 = v8;
    objc_msgSend(v11, "animateWithDuration:animations:completion:", v17, v14, v12);

  }
}

uint64_t __82__SBPIPController__managePictureInPictureWindowVisibilityForWindowScene_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 48))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "_setAlpha:forWindowsOnWindowScene:", *(_QWORD *)(a1 + 40), v1);
}

uint64_t __82__SBPIPController__managePictureInPictureWindowVisibilityForWindowScene_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_shouldHideWindowScene:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_setHidden:forWindowsOnWindowScene:", 1, *(_QWORD *)(a1 + 40));
    if (!*(_BYTE *)(a1 + 48))
    {
      v3 = *(_QWORD *)(a1 + 32);
      if ((*(_BYTE *)(v3 + 249) & 4) != 0)
        return objc_msgSend(*(id *)(v3 + 240), "windowVisibilityDidChangeForPIPController:");
    }
  }
  return result;
}

- (void)_setAlpha:(double)a3 forWindowsOnWindowScene:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__SBPIPController__setAlpha_forWindowsOnWindowScene___block_invoke;
  v4[3] = &__block_descriptor_40_e33_v24__0__SBPIPContentContext_8_B16l;
  *(double *)&v4[4] = a3;
  -[SBPIPController _enumerateContextsForWindowScene:usingBlock:](self, "_enumerateContextsForWindowScene:usingBlock:", a4, v4);
}

void __53__SBPIPController__setAlpha_forWindowsOnWindowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "window");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", *(double *)(a1 + 32));

}

- (void)_setHidden:(BOOL)a3 forWindowsOnWindowScene:(id)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SBPIPController__setHidden_forWindowsOnWindowScene___block_invoke;
  v4[3] = &__block_descriptor_33_e33_v24__0__SBPIPContentContext_8_B16l;
  v5 = a3;
  -[SBPIPController _enumerateContextsForWindowScene:usingBlock:](self, "_enumerateContextsForWindowScene:usingBlock:", a4, v4);
}

void __54__SBPIPController__setHidden_forWindowsOnWindowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "window");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", *(unsigned __int8 *)(a1 + 32));

}

- (void)_setWindowsLevel:(double)a3 forWindowsOnWindowScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;

  v6 = a4;
  -[NSMapTable objectEnumerator](self->_containerViewControllerToContextMap, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __60__SBPIPController__setWindowsLevel_forWindowsOnWindowScene___block_invoke;
  v20[3] = &unk_1E8EBF2E8;
  v18 = v6;
  v21 = v18;
  objc_msgSend(v8, "bs_filter:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingSelector:", sel_contentZOrderPriority);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    v13 = v12;
    for (i = 0; i != v13; ++i)
    {
      objc_msgSend(v11, "objectAtIndex:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWindowLevel:", a3 + (double)i * 0.01);

      objc_msgSend(v15, "containerViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      v19[1] = 3221225472;
      v19[2] = __60__SBPIPController__setWindowsLevel_forWindowsOnWindowScene___block_invoke_2;
      v19[3] = &__block_descriptor_40_e33_v16__0__SBSDisplayLayoutElement_8l;
      *(double *)&v19[4] = a3;
      objc_msgSend(v17, "updateDisplayLayoutElementWithBuilder:", v19);

    }
  }

}

BOOL __60__SBPIPController__setWindowsLevel_forWindowsOnWindowScene___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

uint64_t __60__SBPIPController__setWindowsLevel_forWindowsOnWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLevel:", (uint64_t)*(double *)(a1 + 32));
}

void __48__SBPIPController__leadingWindowForWindowScene___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "containerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActivelyTethered");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v10, "window");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a3 = 1;
  }

}

- (void)_setContainersStashed:(BOOL)a3 forWindowScene:(id)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SBPIPController__setContainersStashed_forWindowScene___block_invoke;
  v4[3] = &__block_descriptor_33_e33_v24__0__SBPIPContentContext_8_B16l;
  v5 = a3;
  -[SBPIPController _enumerateContextsForWindowScene:usingBlock:](self, "_enumerateContextsForWindowScene:usingBlock:", a4, v4);
}

void __56__SBPIPController__setContainersStashed_forWindowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "containerViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStashed:", *(unsigned __int8 *)(a1 + 32));

}

- (void)_lockStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("SBAggregateLockStateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "intValue"))
  {

  }
  else
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transientOverlayPresentationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasActivePresentation");

    if ((v7 & 1) == 0)
      -[SBPIPController setPictureInPictureWindowsHidden:forReason:](self, "setPictureInPictureWindowsHidden:forReason:", 0, CFSTR("SBLockScreenPictureInPictureHiddenReason"));
  }
}

- (id)createAndRegisterPictureInPictureMorphAnimatorControllerWithTargetProcessIdentifier:(int)a3 uuid:(id)a4 scenePersistenceIdentifier:(id)a5 appLayout:(id)a6 layoutRole:(int64_t)a7 appLayoutBoundingBox:(CGRect)a8 gestureInitiated:(BOOL)a9 direction:(int64_t)a10
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v18;
  SBWindowSceneManager **p_windowSceneManager;
  id v21;
  id v22;
  id v23;
  id WeakRetained;
  void *v25;
  SBPIPMorphAnimatorController *v26;
  uint64_t v28;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v18 = *(_QWORD *)&a3;
  p_windowSceneManager = &self->_windowSceneManager;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_windowSceneManager);
  objc_msgSend(WeakRetained, "windowSceneForPersistentIdentifier:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v28) = a9;
  v26 = -[SBPIPMorphAnimatorController initWithTargetProcessIdentifier:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:windowScene:direction:gestureInitiated:delegate:uuid:]([SBPIPMorphAnimatorController alloc], "initWithTargetProcessIdentifier:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:windowScene:direction:gestureInitiated:delegate:uuid:", v18, v22, v21, a7, v25, a10, x, y, width, height, v28, self, v23);

  -[SBPIPController _addPictureInPictureMorphAnimatorController:](self, "_addPictureInPictureMorphAnimatorController:", v26);
  return v26;
}

- (void)_addPictureInPictureMorphAnimatorController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "viewMorphAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[SBPIPController _setHidden:forWindowsOnWindowScene:](self, "_setHidden:forWindowsOnWindowScene:", 0, v6);
    -[NSMutableSet addObject:](self->_pictureInPictureMorphAnimatorControllers, "addObject:", v4);

  }
}

- (id)pictureInPictureMorphAnimatorControllerForProcessIdentifier:(int)a3 scenePersistenceIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__118;
  v19 = __Block_byref_object_dispose__118;
  v20 = 0;
  -[NSMutableSet allObjects](self->_pictureInPictureMorphAnimatorControllers, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__SBPIPController_pictureInPictureMorphAnimatorControllerForProcessIdentifier_scenePersistenceIdentifier___block_invoke;
  v11[3] = &unk_1E8EBF330;
  v14 = a3;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __106__SBPIPController_pictureInPictureMorphAnimatorControllerForProcessIdentifier_scenePersistenceIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "targetProcessIdentifier") == *(_DWORD *)(a1 + 48))
  {
    objc_msgSend(v9, "scenePersistenceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v8)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

- (void)_removePictureInPictureMorphAnimatorController:(id)a3
{
  NSMutableSet *pictureInPictureMorphAnimatorControllers;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    pictureInPictureMorphAnimatorControllers = self->_pictureInPictureMorphAnimatorControllers;
    v5 = a3;
    -[NSMutableSet removeObject:](pictureInPictureMorphAnimatorControllers, "removeObject:", v5);
    objc_msgSend(v5, "viewMorphAnimator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "windowScene");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[SBPIPController _managePictureInPictureWindowVisibilityForWindowScene:animated:](self, "_managePictureInPictureWindowVisibilityForWindowScene:animated:", v7, 1);
  }
}

- (void)_updateContainerViewControllersContentPaddingOnWindowScene:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[8];

  v8 = a3;
  if ((-[SBPIPControllerAdapter isStartingStoppingOrCancellingPictureInPictureForPIPController:](self->_adapter, "isStartingStoppingOrCancellingPictureInPictureForPIPController:", self) & 1) == 0)
  {
    -[SBPIPController _pictureInPictureWindowMarginsOnWindowScene:](self, "_pictureInPictureWindowMarginsOnWindowScene:", v8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__SBPIPController__updateContainerViewControllersContentPaddingOnWindowScene___block_invoke;
    v9[3] = &__block_descriptor_64_e33_v24__0__SBPIPContentContext_8_B16l;
    v9[4] = v4;
    v9[5] = v5;
    v9[6] = v6;
    v9[7] = v7;
    -[SBPIPController _enumerateContextsForWindowScene:usingBlock:](self, "_enumerateContextsForWindowScene:usingBlock:", v8, v9);
  }

}

void __78__SBPIPController__updateContainerViewControllersContentPaddingOnWindowScene___block_invoke(double *a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "containerViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentViewPadding:", a1[4], a1[5], a1[6], a1[7]);

}

- (UIEdgeInsets)_pictureInPictureWindowMarginsOnWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_windowSceneToInsetAssertionMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 5, v4, 0);
    -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 10, v4, 0);
    UIEdgeInsetsMax();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    -[NSMapTable objectForKey:](self->_windowSceneToWindowMarginsMap, "objectForKey:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UIEdgeInsetsValue");
    v9 = v17;
    v11 = v18;
    v13 = v19;
    v15 = v20;

  }
  v21 = v9;
  v22 = v11;
  v23 = v13;
  v24 = v15;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (BOOL)_isContentViewAlignedLeftWithPosition:(unint64_t)a3 orientation:(int64_t)a4
{
  BOOL v4;
  BOOL v5;
  BOOL v6;

  if (a3)
    v4 = a3 == 3;
  else
    v4 = 1;
  v5 = v4;
  v6 = a3 < 2;
  if (a4 != 1)
    v6 = 0;
  if (a4 != 3)
    v5 = v6;
  if (a4 == 4)
    return a3 - 1 < 2;
  else
    return v5;
}

- (BOOL)_isContentViewAlignedTopWithPosition:(unint64_t)a3 orientation:(int64_t)a4
{
  BOOL v4;
  BOOL v5;
  char v6;

  v4 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
  if (a3)
    v5 = a3 == 3;
  else
    v5 = 1;
  v6 = v5;
  if (a4 != 1)
    v6 = 0;
  if (a4 != 3)
    v4 = v6;
  if (a4 == 4)
    return a3 < 2;
  else
    return v4;
}

- (CGRect)homeScreenInitialPIPFrameForWindowScene:(id)a3 withContentViewSize:(CGSize)a4 position:(unint64_t)a5 padding:(double)a6 fromOrientation:(int64_t)a7 toOrientation:(int64_t)a8 shouldUpdate:(BOOL)a9 gestureInitiated:(BOOL)a10
{
  _BOOL4 v10;
  _BOOL8 v11;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double Height;
  double v31;
  double v32;
  int64_t v33;
  _BOOL4 v34;
  _BOOL4 v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double Width;
  double v46;
  NSObject *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  double v80;
  double v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  _BOOL4 v91;
  __int16 v92;
  _BOOL4 v93;
  __int16 v94;
  uint64_t v95;
  uint64_t v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  UIEdgeInsets v100;
  CGRect v101;
  CGRect result;

  v10 = a10;
  v11 = a9;
  v96 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  objc_msgSend(v17, "pictureInPictureManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_updateFloatingDockInsetsWithoutNotifyingControllers");

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "homeScreenViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPIPController _updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:](self, "_updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:", v17, 0, 1, objc_msgSend(v20, "interfaceOrientation"), v11);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v17, "statusBarManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "statusBarFrame");
  Height = CGRectGetHeight(v97);

  v31 = v26 + a6;
  v80 = v28 + a6;
  v81 = v24 + a6;
  v32 = fmax(v22 + a6, Height);
  if (BSFloatEqualToFloat())
    v33 = 1;
  else
    v33 = a7;
  v34 = -[SBPIPController _isContentViewAlignedLeftWithPosition:orientation:](self, "_isContentViewAlignedLeftWithPosition:orientation:", a5, v33);
  v35 = -[SBPIPController _isContentViewAlignedTopWithPosition:orientation:](self, "_isContentViewAlignedTopWithPosition:orientation:", a5, v33);
  objc_msgSend(v17, "screen");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;

  v98.origin.x = v38;
  v98.origin.y = v40;
  v98.size.width = v42;
  v98.size.height = v44;
  Width = CGRectGetWidth(v98);
  v99.origin.x = v38;
  v99.origin.y = v40;
  v99.size.width = v42;
  v99.size.height = v44;
  v46 = CGRectGetHeight(v99);
  SBLogPIP();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    v100.top = v32;
    v100.right = v80;
    v100.left = v81;
    v100.bottom = v31;
    NSStringFromUIEdgeInsets(v100);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    SBFStringForBSInterfaceOrientation();
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    SBFStringForBSInterfaceOrientation();
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    SBFStringForBSInterfaceOrientation();
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v101.origin.x = v38;
    v101.origin.y = v40;
    v101.size.width = v42;
    v101.size.height = v44;
    NSStringFromCGRect(v101);
    *(_DWORD *)buf = 138544898;
    v83 = v78;
    v84 = 2114;
    v85 = v77;
    v86 = 2114;
    v87 = v76;
    v88 = 2114;
    v89 = v70;
    v90 = 1024;
    v91 = v34;
    v92 = 1024;
    v93 = v35;
    v94 = 2114;
    v95 = objc_claimAutoreleasedReturnValue();
    v71 = (void *)v95;
    _os_log_debug_impl(&dword_1D0540000, v47, OS_LOG_TYPE_DEBUG, "-homeScreenInitialPIPFrameForWindowScene inputs: windowInsets[%{public}@] fromOrientation[%{public}@] toOrientation[%{public}@] orientation[%{public}@] isContentViewAlignedLeft[%{BOOL}u] isContentViewAlignedTop[%{BOOL}u] homeScreenbounds[%{public}@]", buf, 0x40u);

  }
  if (a8 == a7)
  {
    v49 = a4.width;
    v48 = a4.height;
LABEL_8:
    if (v34)
      v50 = v81;
    else
      v50 = Width - v49 - v80;
    if (v35)
      v51 = v32;
    else
      v51 = v46 - v48 - v31;
    goto LABEL_45;
  }
  v49 = a4.width;
  v48 = a4.height;
  v52 = a4.width * 0.5;
  v53 = a4.height * 0.5;
  if (v10)
  {
    if (a7 == 3)
    {
      v55 = v53 + v32;
      if (!v34)
        v55 = v42 - v31 - v53;
      v57 = v52 + v80;
      if (!v35)
        v57 = v44 - v81 - v52;
    }
    else
    {
      v54 = v42 - v80 - a4.width;
      if (v34)
        v54 = v81;
      v55 = v52 + v54;
      v56 = v44 - v31 - a4.height;
      if (v35)
        v56 = v32;
      v57 = v53 + v56;
      v58 = v53 + v31;
      if (!v34)
        v58 = v42 - v32 - v53;
      v59 = v52 + v81;
      if (!v35)
        v59 = v44 - v80 - v52;
      if (a7 == 4)
      {
        v55 = v58;
        v57 = v59;
      }
    }
    v50 = v55 - v52;
    v51 = v57 - v53;
  }
  else if (a7 == 3)
  {
    v64 = v52 - v53;
    v65 = Width - v52 - v53;
    v66 = v32 - v64;
    v67 = v46 - a4.height - v64 - v31;
    if (v34)
      v50 = v66;
    else
      v50 = v67;
    v68 = v65 - v81;
    v69 = v80 + v65 - (Width - a4.width);
    if (v35)
      v51 = v69;
    else
      v51 = v68;
  }
  else
  {
    if (a7 != 4)
      goto LABEL_8;
    v60 = v46 - v52 - v53;
    v61 = v53 - v52;
    v62 = v31 + v60 - (v46 - a4.height);
    v63 = v60 - v32;
    if (v34)
      v50 = v62;
    else
      v50 = v63;
    if (v35)
      v51 = v81 - v61;
    else
      v51 = Width - a4.width - v61 - v80;
  }
LABEL_45:

  v72 = v50;
  v73 = v51;
  v74 = v49;
  v75 = v48;
  result.size.height = v75;
  result.size.width = v74;
  result.origin.y = v73;
  result.origin.x = v72;
  return result;
}

- (id)anyContentViewPresentedOnWindowScene:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__118;
  v12 = __Block_byref_object_dispose__118;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SBPIPController_anyContentViewPresentedOnWindowScene___block_invoke;
  v7[3] = &unk_1E8EBF280;
  v7[4] = &v8;
  -[SBPIPController _enumerateContextsForWindowScene:usingBlock:](self, "_enumerateContextsForWindowScene:usingBlock:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __56__SBPIPController_anyContentViewPresentedOnWindowScene___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "containerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewIfLoaded");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a3 = 1;
}

- (void)_minimumStashedPaddingDidChangeOnWindowScene:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[8];

  v13 = a3;
  objc_msgSend(v13, "pictureInPictureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_minimumStashedPadding");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__SBPIPController__minimumStashedPaddingDidChangeOnWindowScene___block_invoke;
  v14[3] = &__block_descriptor_64_e33_v24__0__SBPIPContentContext_8_B16l;
  v14[4] = v6;
  v14[5] = v8;
  v14[6] = v10;
  v14[7] = v12;
  -[SBPIPController _enumerateContextsForWindowScene:usingBlock:](self, "_enumerateContextsForWindowScene:usingBlock:", v13, v14);

}

void __64__SBPIPController__minimumStashedPaddingDidChangeOnWindowScene___block_invoke(double *a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "containerViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStashedPadding:", a1[4], a1[5], a1[6], a1[7]);

}

- (void)containerViewControllerDidBeginInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  char v11;

  v9 = a3;
  if (!-[SBPIPController contentType](self, "contentType"))
  {
    objc_msgSend(v9, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClipsToBounds:", 0);
    objc_msgSend(v4, "_sbWindowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_fbsDisplayIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isContinuityDisplay");

    objc_msgSend((id)SBApp, "displayPortalManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__SBPIPController_containerViewControllerDidBeginInteraction___block_invoke;
    v10[3] = &__block_descriptor_33_e23_B16__0__SBWindowScene_8l;
    v11 = v7;
    objc_msgSend(v8, "createPortalsForSourceView:usingTraitsRole:onWindowScenesPassingTest:", v4, CFSTR("SBTraitsParticipantRolePictureInPicture"), v10);

  }
}

BOOL __62__SBPIPController_containerViewControllerDidBeginInteraction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a2, "_fbsDisplayIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isContinuityDisplay");

  return *(unsigned __int8 *)(a1 + 32) == v4;
}

- (void)containerViewControllerDidEndInteraction:(id)a3 targetWindowScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!-[SBPIPController contentType](self, "contentType"))
  {
    objc_msgSend(v11, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 1);
    objc_msgSend((id)SBApp, "displayPortalManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "destroyPortalsForSourceView:", v7);

    -[NSMapTable objectForKey:](self->_containerViewControllerToContextMap, "objectForKey:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 != v6)
      -[SBPIPController _moveContext:toWindowScene:](self, "_moveContext:toWindowScene:", v9, v6);

  }
}

- (id)dataSourceForMorphAnimatorController:(id)a3
{
  if ((*((_BYTE *)self + 248) & 0x40) == 0)
    return 0;
  -[SBPIPControllerAdapter pipController:morphAnimatorDataSourceForMorphAnimatorController:](self->_adapter, "pipController:morphAnimatorDataSourceForMorphAnimatorController:", self, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __47__SBPIPController_invalidateIdleTimerBehaviors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prefersIdleTimerDisabled");
}

- (BOOL)isHandlingContextWindowSceneUpdate
{
  return self->_inFlightWindowSceneUpdates != 0;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  if (self->_hasIdleTimerBehaviors)
    +[SBIdleTimerBehavior disabledBehavior](SBIdleTimerBehavior, "disabledBehavior", a3);
  else
    +[SBIdleTimerBehavior autoLockBehavior](SBIdleTimerBehavior, "autoLockBehavior", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SBWindowSceneManager)windowSceneManager
{
  return (SBWindowSceneManager *)objc_loadWeakRetained((id *)&self->_windowSceneManager);
}

- (void)setWindowSceneManager:(id)a3
{
  objc_storeWeak((id *)&self->_windowSceneManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowSceneManager);
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_keyboardFocusObserver, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_keyboardInsetsVisualizerView, 0);
  objc_storeStrong((id *)&self->_pictureInPictureMorphAnimatorControllers, 0);
  objc_storeStrong((id *)&self->_bundleIDForAppRecentlyStoppingPIP, 0);
  objc_storeStrong((id *)&self->_bundleIDForAppAnimatingPIPStartInBackground, 0);
  objc_storeStrong((id *)&self->_interruptionEndDebouncingTimer, 0);
  objc_destroyWeak((id *)&self->_transitionStashAssertion);
  objc_storeStrong((id *)&self->_stashForInterruptionAssertion, 0);
  objc_storeStrong((id *)&self->_fullscreenModalElementInsetOverrideAssertion, 0);
  objc_storeStrong((id *)&self->_lockedInterruptionAssertion, 0);
  objc_storeStrong((id *)&self->_cameraInterruptionAssertions, 0);
  objc_storeStrong((id *)&self->_interruptionAssertions, 0);
  objc_storeStrong((id *)&self->_windowSceneToStashAssertionsMap, 0);
  objc_storeStrong((id *)&self->_windowSceneToInsetAssertionMap, 0);
  objc_storeStrong((id *)&self->_windowSceneToWindowMarginsMap, 0);
  objc_storeStrong((id *)&self->_pictureInPictureWindowHiddenReasons, 0);
  objc_storeStrong((id *)&self->_lockStateProviders, 0);
  objc_storeStrong((id *)&self->_connectedWindowScenes, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_interactionSettings, 0);
  objc_storeStrong((id *)&self->_containerViewControllerToContextMap, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
}

void __106__SBPIPController_restoreContentViewController_appSceneEntity_morphAnimatorConfigurationBlock_completion___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Canceling %{public}@ because it failed to complete animation", (uint8_t *)&v3, 0xCu);
}

- (void)_edgeInsetsDidChangeOnWindowScene:(int)a1 .cold.1(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SBPIPController _edgeInsetsDidChangeOnWindowScene:]";
  v4 = 1024;
  v5 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "insets: %s ignoring update: %{BOOL}u", (uint8_t *)&v2, 0x12u);
}

@end
