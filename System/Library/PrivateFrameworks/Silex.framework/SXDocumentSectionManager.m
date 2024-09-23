@implementation SXDocumentSectionManager

- (SXDocumentSectionManager)initWithSectionHosting:(id)a3 viewport:(id)a4 appStateMonitor:(id)a5
{
  id v8;
  id v9;
  id v10;
  SXDocumentSectionManager *v11;
  SXDocumentSectionManager *v12;
  uint64_t v13;
  NSMutableDictionary *blueprints;
  uint64_t v15;
  NSMutableSet *visibleViewControllers;
  char v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)SXDocumentSectionManager;
  v11 = -[SXDocumentSectionManager init](&v31, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_hosting, v8);
    objc_storeStrong((id *)&v12->_viewport, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    blueprints = v12->_blueprints;
    v12->_blueprints = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    visibleViewControllers = v12->_visibleViewControllers;
    v12->_visibleViewControllers = (NSMutableSet *)v15;

    objc_msgSend(v9, "addViewportChangeListener:forOptions:", v12, 28);
    objc_initWeak(&location, v12);
    v17 = objc_opt_respondsToSelector();
    v18 = MEMORY[0x24BDAC760];
    if ((v17 & 1) != 0)
    {
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke;
      v28[3] = &unk_24D6873B8;
      objc_copyWeak(&v29, &location);
      objc_msgSend(v10, "performOnApplicationWindowDidBecomeForeground:", v28);
      objc_destroyWeak(&v29);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v26[0] = v18;
      v26[1] = 3221225472;
      v26[2] = __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_2;
      v26[3] = &unk_24D6873B8;
      objc_copyWeak(&v27, &location);
      objc_msgSend(v10, "performOnApplicationWillEnterForeground:", v26);
      objc_destroyWeak(&v27);
    }
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_3;
    v24[3] = &unk_24D6873B8;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v10, "performOnApplicationDidBecomeActive:", v24);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v22[0] = v18;
      v22[1] = 3221225472;
      v22[2] = __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_4;
      v22[3] = &unk_24D6873B8;
      objc_copyWeak(&v23, &location);
      objc_msgSend(v10, "performOnApplicationWindowDidBecomeBackground:", v22);
      objc_destroyWeak(&v23);
    }
    v20[0] = v18;
    v20[1] = 3221225472;
    v20[2] = __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_5;
    v20[3] = &unk_24D6873B8;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v10, "performOnApplicationDidEnterBackground:", v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateViewControllerVisibility");

}

void __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateViewControllerVisibility");

}

void __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateViewControllerVisibility");

}

void __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endImpressions");

}

void __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endImpressions");

}

- (void)applySectionBlueprint:(id)a3 identifier:(id)a4 offset:(CGPoint)a5 size:(CGSize)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
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
  uint64_t v63;

  height = a6.height;
  width = a6.width;
  y = a5.y;
  x = a5.x;
  v63 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  -[SXDocumentSectionManager blueprints](self, "blueprints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v52 = v15;
  objc_msgSend(v15, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v58;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v58 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v20);
        objc_msgSend(v12, "items");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "containsObject:", v21);

        if ((v23 & 1) == 0)
        {
          objc_msgSend(v21, "sectionItemViewController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "willMoveToParentViewController:", 0);
          objc_msgSend(v24, "view");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "removeFromSuperview");

          objc_msgSend(v24, "removeFromParentViewController");
        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    }
    while (v18);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v12, "items");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v54;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v54 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v30);
        -[SXDocumentSectionManager viewController](self, "viewController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "traitCollection");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sectionItemHeightForSize:traitCollection:", v33, width, height);
        v35 = v34;

        objc_msgSend(v31, "sectionItemViewController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "parentViewController");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXDocumentSectionManager viewController](self, "viewController");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37 != v38)
        {
          objc_msgSend(v36, "view");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "superview");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            objc_msgSend(v36, "willMoveToParentViewController:", 0);
            objc_msgSend(v36, "view");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "removeFromSuperview");

            objc_msgSend(v36, "removeFromParentViewController");
          }
          -[SXDocumentSectionManager viewController](self, "viewController");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addChildViewController:", v36);

          -[SXDocumentSectionManager view](self, "view");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "view");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addSubview:", v44);

          -[SXDocumentSectionManager viewController](self, "viewController");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "didMoveToParentViewController:", v45);

        }
        -[SXDocumentSectionManager view](self, "view");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "view");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "bringSubviewToFront:", v47);

        objc_msgSend(v36, "view");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setFrameUsingCenterAndBounds:", x, y, width, v35);

        objc_msgSend(v36, "view");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setNeedsLayout");

        objc_msgSend(v36, "view");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setHidden:", 0);

        y = y + v35;
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v28);
  }

  if (v12)
  {
    -[SXDocumentSectionManager blueprints](self, "blueprints");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKey:", v12, v13);

  }
  -[SXDocumentSectionManager updateViewControllerVisibility](self, "updateViewControllerVisibility");

}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  -[SXDocumentSectionManager updateViewControllerVisibility](self, "updateViewControllerVisibility");
  if (a4 - 1 <= 1)
  {
    v6 = objc_msgSend(v7, "appearState");
    if (v6 == 3 || !v6)
      -[SXDocumentSectionManager endImpressions](self, "endImpressions");
  }
  if (a4 == 1)
  {
    if (objc_msgSend(v7, "appearState") == 2)
      -[SXDocumentSectionManager performAppearanceTransitionForVisibleViewControllers](self, "performAppearanceTransitionForVisibleViewControllers");
  }
  else if (a4 == 3 && !objc_msgSend(v7, "appearState"))
  {
    -[SXDocumentSectionManager performDisappearanceTransitionForVisibleViewControllers](self, "performDisappearanceTransitionForVisibleViewControllers");
  }

}

- (void)updateViewControllerVisibility
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  _BOOL4 v30;
  void *v31;
  int v32;
  void *v33;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;
  CGRect v52;

  v50 = *MEMORY[0x24BDAC8D0];
  -[SXDocumentSectionManager viewport](self, "viewport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "appearState") - 1;

  if (v4 <= 1)
  {
    -[SXDocumentSectionManager hosting](self, "hosting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sectionHostingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[SXDocumentSectionManager blueprints](self, "blueprints");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (!v37)
      goto LABEL_24;
    v36 = *(_QWORD *)v45;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v45 != v36)
          objc_enumerationMutation(obj);
        v39 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v7);
        -[SXDocumentSectionManager blueprints](self, "blueprints");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = v10;
        objc_msgSend(v10, "items");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v41;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v41 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v15), "sectionItemViewController");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "bounds");
              v18 = v17;
              v20 = v19;
              v22 = v21;
              v24 = v23;
              objc_msgSend(v16, "view");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "frame");
              v52.origin.x = v26;
              v52.origin.y = v27;
              v52.size.width = v28;
              v52.size.height = v29;
              v51.origin.x = v18;
              v51.origin.y = v20;
              v51.size.width = v22;
              v51.size.height = v24;
              v30 = CGRectIntersectsRect(v51, v52);

              -[SXDocumentSectionManager visibleViewControllers](self, "visibleViewControllers");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "containsObject:", v16);

              if (v30)
              {
                if ((v32 & 1) != 0)
                  goto LABEL_18;
                objc_msgSend(v16, "beginAppearanceTransition:animated:", 1, 0);
                objc_msgSend(v16, "endAppearanceTransition");
                -[SXDocumentSectionManager visibleViewControllers](self, "visibleViewControllers");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "addObject:", v16);
              }
              else
              {
                if (!v32)
                  goto LABEL_18;
                objc_msgSend(v16, "beginAppearanceTransition:animated:", 0, 0);
                objc_msgSend(v16, "endAppearanceTransition");
                -[SXDocumentSectionManager visibleViewControllers](self, "visibleViewControllers");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "removeObject:", v16);
              }

LABEL_18:
              if (objc_msgSend(v16, "conformsToProtocol:", &unk_254F92088))
              {
                v34 = v16;
                objc_msgSend(v6, "bounds");
                objc_msgSend(v34, "updateDocumentSectionImpressionForView:visibleRect:", v6);

              }
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          }
          while (v13);
        }

        v7 = v39 + 1;
      }
      while (v39 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (!v37)
      {
LABEL_24:

        return;
      }
    }
  }
}

- (void)performDisappearanceTransitionForVisibleViewControllers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SXDocumentSectionManager visibleViewControllers](self, "visibleViewControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "beginAppearanceTransition:animated:", 0, 0);
        objc_msgSend(v7, "endAppearanceTransition");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)performAppearanceTransitionForVisibleViewControllers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SXDocumentSectionManager visibleViewControllers](self, "visibleViewControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "beginAppearanceTransition:animated:", 1, 0);
        objc_msgSend(v7, "endAppearanceTransition");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)endImpressions
{
  uint64_t i;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id obj;
  uint64_t v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SXDocumentSectionManager blueprints](self, "blueprints");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v3 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[SXDocumentSectionManager blueprints](self, "blueprints");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v5, "items");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v20 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              objc_msgSend(v11, "sectionItemViewController");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "conformsToProtocol:", &unk_254F92088);

              if (v13)
              {
                objc_msgSend(v11, "sectionItemViewController");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "endDocumentSectionImpression");

              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v8);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }

}

- (double)heightForBlueprint:(id)a3 canvasSize:(CGSize)a4 traitCollection:(id)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  height = a4.height;
  width = a4.width;
  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a3, "items", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "sectionItemHeightForSize:traitCollection:", v8, width, height);
        v13 = v13 + v15;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (id)viewController
{
  void *v2;
  void *v3;

  -[SXDocumentSectionManager hosting](self, "hosting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionHostingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)view
{
  void *v2;
  void *v3;

  -[SXDocumentSectionManager hosting](self, "hosting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionHostingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SXDocumentSectionHosting)hosting
{
  return (SXDocumentSectionHosting *)objc_loadWeakRetained((id *)&self->_hosting);
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (NSMutableDictionary)blueprints
{
  return self->_blueprints;
}

- (NSMutableSet)visibleViewControllers
{
  return self->_visibleViewControllers;
}

- (TFMultiDelegate)multiScrollDelegate
{
  return self->_multiScrollDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiScrollDelegate, 0);
  objc_storeStrong((id *)&self->_visibleViewControllers, 0);
  objc_storeStrong((id *)&self->_blueprints, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_destroyWeak((id *)&self->_hosting);
}

@end
