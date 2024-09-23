@implementation UIMultiColumnViewController

- (UIMultiColumnViewController)initWithNavController:(id)a3 viewControllers:(id)a4
{
  id v6;
  id v7;
  UIMultiColumnViewController *v8;
  uint64_t v9;
  NSArray *viewControllers;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  UINavigationController *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  UINavigationController *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)UIMultiColumnViewController;
  v8 = -[UIViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v26 = v7;
    v9 = objc_msgSend(v7, "copy");
    viewControllers = v8->_viewControllers;
    v8->_viewControllers = (NSArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSArray count](v8->_viewControllers, "count");
    if (v12 >= 2)
    {
      v13 = v12 - 1;
      do
      {
        v14 = [UINavigationController alloc];
        objc_msgSend(v6, "navigationBar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_class();
        objc_msgSend(v6, "toolbar");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[UINavigationController initWithNavigationBarClass:toolbarClass:](v14, "initWithNavigationBarClass:toolbarClass:", v16, objc_opt_class());

        objc_msgSend(v11, "addObject:", v18);
        --v13;
      }
      while (v13);
    }
    objc_storeStrong((id *)&v8->_navControllers, v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v11;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          -[UIViewController addChildViewController:](v8, "addChildViewController:", v24);
          objc_msgSend(v24, "didMoveToParentViewController:", v8);
          objc_msgSend(v19, "addObserver:selector:name:object:", v8, sel__navigationControllerChangedViewControllers_, 0x1E1712780, v24);
          objc_msgSend(v19, "addObserver:selector:name:object:", v8, sel__navigationControllerChangedViewControllers_, 0x1E17127A0, v24);
          objc_msgSend(v19, "addObserver:selector:name:object:", v8, sel__navigationControllerChangedViewControllers_, 0x1E17127C0, v24);
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v21);
    }

    v7 = v26;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 0x1E1712780;
  v6[1] = 0x1E17127A0;
  v6[2] = 0x1E17127C0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIMultiColumnViewController;
  -[UIViewController dealloc](&v5, sel_dealloc);
}

- (void)viewWillLayoutSubviews
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t lastColumnCount;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  unint64_t v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  NSMutableArray *borderViews;
  NSMutableArray *v46;
  NSMutableArray *v47;
  double v48;
  UIPanelBorderView *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t k;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  double v90;
  void *v91;
  _BOOL4 v92;
  void *v93;
  void *v94;
  void *v95;
  _QWORD v96[5];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD aBlock[4];
  id v110;
  _QWORD v111[6];
  objc_super v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;
  CGRect v117;

  v116 = *MEMORY[0x1E0C80C00];
  v112.receiver = self;
  v112.super_class = (Class)UIMultiColumnViewController;
  -[UIViewController viewWillLayoutSubviews](&v112, sel_viewWillLayoutSubviews);
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return;
  v6 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
  v7 = -[UIMultiColumnViewController _columnCountForPossibleStates:containerSize:](self, "_columnCountForPossibleStates:containerSize:", self->_possibleStatesAtLastUpdate, self->_containerSizeAtLastUpdate.width, self->_containerSizeAtLastUpdate.height);
  -[UIMultiColumnViewController navControllers](self, "navControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 < v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMultiColumnViewController.m"), 142, CFSTR("Not enough VCs for %lu columns"), v7);

  }
  lastColumnCount = self->_lastColumnCount;
  v11 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    if (v7 > lastColumnCount)
      goto LABEL_9;
  }
  else if (v7 != lastColumnCount)
  {
LABEL_9:
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __53__UIMultiColumnViewController_viewWillLayoutSubviews__block_invoke;
    v111[3] = &unk_1E16B1888;
    v111[4] = self;
    v111[5] = v7;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v111);
    goto LABEL_10;
  }
  if ((*(_BYTE *)&self->_mcvcFlags & 4) == 0)
    goto LABEL_9;
LABEL_10:
  v92 = v6;
  -[UIViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[UIViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "subviews");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (void *)objc_msgSend(v22, "copy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  aBlock[0] = v11;
  aBlock[1] = 3221225472;
  aBlock[2] = __53__UIMultiColumnViewController_viewWillLayoutSubviews__block_invoke_2;
  aBlock[3] = &unk_1E16C14A8;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v110 = v23;
  v24 = _Block_copy(aBlock);
  -[UIMultiColumnViewController _effectiveColumnWidths](self, "_effectiveColumnWidths");
  v94 = v24;
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    -[UIViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "_shouldReverseLayoutDirection");

    if (v7)
    {
      v27 = 0;
      if (v26)
        v28 = 0.0;
      else
        v28 = v18;
      do
      {
        objc_msgSend(v95, "objectAtIndexedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValue");
        v31 = v30;

        if (!v27)
        {
          -[UIMultiColumnViewController _unsafeAreaPaddingForFirstVisibleColumn](self, "_unsafeAreaPaddingForFirstVisibleColumn");
          v31 = v31 + v32;
        }
        if (v26)
          v33 = 0.0;
        else
          v33 = v31;
        v34 = v28 - v33;
        v35 = v14 + v34;
        v36 = -0.0;
        if (v26)
          v36 = v31;
        v28 = v36 + v34;
        -[UIMultiColumnViewController navControllers](self, "navControllers");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", v27);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(void *, void *, double, double, double, double))v24 + 2))(v24, v38, v35, v16, v31, v20);
        v39 = v27 + 1;
        if (v27 + 1 < v7)
        {
          -[UIViewController traitCollection](self, "traitCollection");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "displayScale");
          v42 = 1.0 / v41;

          if (v26)
            v43 = 0.0;
          else
            v43 = v42;
          if (v26)
            v44 = v42;
          else
            v44 = -0.0;
          borderViews = self->_borderViews;
          if (!borderViews)
          {
            v46 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v47 = self->_borderViews;
            self->_borderViews = v46;

            borderViews = self->_borderViews;
          }
          v48 = v28 - v43;
          if (v27 >= -[NSMutableArray count](borderViews, "count"))
          {
            v49 = -[UIPanelBorderView initWithFrame:]([UIPanelBorderView alloc], "initWithFrame:", v14 + v48, v16, v42, v20);
            -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            -[NSMutableArray addObject:](self->_borderViews, "addObject:", v49);
          }
          else
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_borderViews, "objectAtIndexedSubscript:", v27);
            v49 = (UIPanelBorderView *)objc_claimAutoreleasedReturnValue();
            -[UIView setFrame:](v49, "setFrame:", v14 + v48, v16, v42, v20);
          }
          -[UIViewController splitViewController](self, "splitViewController");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if (v50)
          {
            if (!objc_msgSend(v50, "_usesPanelImpl")
              || (objc_msgSend(v51, "configuration"),
                  v52 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v52, "borderColor"),
                  v53 = (void *)objc_claimAutoreleasedReturnValue(),
                  v52,
                  !v53))
            {
              objc_msgSend(v51, "view");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "backgroundColor");
              v53 = (void *)objc_claimAutoreleasedReturnValue();

            }
            -[UIView setBackgroundColor:](v49, "setBackgroundColor:", v53);

            v24 = v94;
          }
          v28 = v44 + v48;
          objc_msgSend(v23, "insertObject:atIndex:", v49, 0);

        }
        v27 = v39;
      }
      while (v7 != v39);
    }
  }
  else
  {
    -[UIMultiColumnViewController navControllers](self, "navControllers");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count");

    if (v56)
    {
      -[UIMultiColumnViewController navControllers](self, "navControllers");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIViewController view](self, "view");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "bounds");
      (*((void (**)(void *, void *))v24 + 2))(v24, v58);

    }
  }
  if (v92)
  {
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v60 = v93;
    v61 = v93;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v63; ++i)
        {
          if (*(_QWORD *)v106 != v64)
            objc_enumerationMutation(v61);
          v66 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
          if (objc_msgSend(v23, "indexOfObjectIdenticalTo:", v66) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v66, "frame");
            objc_msgSend(v66, "setFrame:", v14, v16);
          }
        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
      }
      while (v63);
    }

    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v67 = v23;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v102;
      do
      {
        for (j = 0; j != v69; ++j)
        {
          if (*(_QWORD *)v102 != v70)
            objc_enumerationMutation(v67);
          v72 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * j);
          -[UIViewController view](self, "view");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "addSubview:", v72);

        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
      }
      while (v69);
    }

  }
  else
  {
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v60 = v93;
    v74 = v93;
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v98;
      do
      {
        for (k = 0; k != v76; ++k)
        {
          if (*(_QWORD *)v98 != v77)
            objc_enumerationMutation(v74);
          v79 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * k);
          if (objc_msgSend(v23, "indexOfObjectIdenticalTo:", v79) == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v79, "removeFromSuperview");
        }
        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
      }
      while (v76);
    }

    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __53__UIMultiColumnViewController_viewWillLayoutSubviews__block_invoke_3;
    v96[3] = &unk_1E16B24A0;
    v96[4] = self;
    objc_msgSend(v23, "enumerateObjectsUsingBlock:", v96);
  }
  -[UIViewController view](self, "view");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "bounds");
  objc_msgSend(v80, "convertRect:toView:", 0);
  v83 = v82;
  v85 = v84;
  v87 = v86;
  v89 = v88;

  v117.origin.x = v83;
  v117.origin.y = v85;
  v117.size.width = v87;
  v117.size.height = v89;
  if (!CGRectEqualToRect(v117, self->_lastFrameInWindow))
  {
    self->_lastFrameInWindow.origin.x = v83;
    self->_lastFrameInWindow.origin.y = v85;
    self->_lastFrameInWindow.size.width = v87;
    self->_lastFrameInWindow.size.height = v89;
    -[UIMultiColumnViewController keyboardInset](self, "keyboardInset");
    if (v90 > 0.0)
      -[UIMultiColumnViewController _adjustNonOverlayScrollViewsForKeyboardInfo:](self, "_adjustNonOverlayScrollViewsForKeyboardInfo:", 0);
  }

}

uint64_t __53__UIMultiColumnViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_willShowColumnCount:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968) = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1000) |= 4u;
  return result;
}

void __53__UIMultiColumnViewController_viewWillLayoutSubviews__block_invoke_2(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPanelWrapperView wrapperViewForView:](UIPanelWrapperView, "wrapperViewForView:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_presentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((objc_msgSend(v13, "shouldRemovePresentersView") & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v12, 0);
      v15 = 1;
    }
    objc_msgSend(v14, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v16, v15);

    objc_msgSend(v12, "setFrame:", a3, a4, a5, a6);
    objc_msgSend(v22, "childModalViewController");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      do
      {
        objc_msgSend(v18, "presentationController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "shouldPresentInFullscreen");

        if (v20)
          break;
        objc_msgSend(v18, "_updateControlledViewsToFrame:", a3, a4, a5, a6);
        objc_msgSend(v18, "presentedViewController");
        v21 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v21;
      }
      while (v21);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v12, 0);
    objc_msgSend(v12, "setFrame:", a3, a4, a5, a6);
  }

}

void __53__UIMultiColumnViewController_viewWillLayoutSubviews__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v9);

  if (v7 != a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertSubview:atIndex:", v9, a3);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIMultiColumnViewController;
  -[UIViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[UIViewController splitViewController](self, "splitViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isCollapsed") & 1) == 0)
    {
      objc_msgSend(v6, "currentState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "leadingOverlapsMain");

      if ((v8 & 1) == 0)
        -[UIMultiColumnViewController _adjustNonOverlayScrollViewsForKeyboardInfo:](self, "_adjustNonOverlayScrollViewsForKeyboardInfo:", 0);
    }
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  CGSize v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIMultiColumnViewController;
  -[UIViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[UIMultiColumnViewController setKeyboardInset:](self, "setKeyboardInset:", 0.0);
  v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_lastFrameInWindow.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_lastFrameInWindow.size = v4;
}

- (id)childViewControllerForStatusBarStyle
{
  void *v2;
  void *v3;

  -[UIMultiColumnViewController navControllers](self, "navControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)title
{
  void *v2;
  void *v3;
  void *v4;

  -[UIMultiColumnViewController navControllers](self, "navControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)showViewController:(id)a3 sender:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (v17)
  {
    -[UIMultiColumnViewController viewControllers](self, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[UIMultiColumnViewController navControllers](self, "navControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v17)
    {
      objc_msgSend(v17, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v10)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v10, "_allowNestedNavigationControllers"))
      {
        -[UIMultiColumnViewController viewControllers](self, "viewControllers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        objc_msgSend(v12, "removeLastObject");
        objc_msgSend(v12, "addObject:", v17);
        -[UIMultiColumnViewController setViewControllers:](self, "setViewControllers:", v12);
        objc_msgSend(v8, "navigationController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v10)
        {
          objc_msgSend(v10, "viewControllers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "mutableCopy");

          objc_msgSend(v16, "replaceObjectAtIndex:withObject:", objc_msgSend(v16, "indexOfObjectIdenticalTo:", v8), v17);
          objc_msgSend(v10, "setViewControllers:animated:", v16, 0);

        }
        else
        {
          objc_msgSend(v10, "showViewController:sender:", v17, v6);
        }

        goto LABEL_11;
      }
    }
    objc_msgSend(v10, "showViewController:sender:", v17, v6);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_splitViewControllerWillCollapseOntoPrimaryViewController:(id)a3
{
  id v4;

  -[UIMultiColumnViewController _moveViewControllersForColumnCount:](self, "_moveViewControllersForColumnCount:", 1);
  *(_BYTE *)&self->_mcvcFlags &= ~4u;
  -[UIViewController _existingView](self, "_existingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)_collapseSecondaryViewController:(id)a3 forSplitViewController:(id)a4 withTransitionCoordinator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v8 = a3;
  -[UIMultiColumnViewController navControllers](self, "navControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "overrideTraitCollectionForChildViewController:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_class();
  objc_msgSend(v14, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_traitCollectionWithParentTraitCollection:overrideTraitCollection:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_unsafeParentWillTransitionToTraitCollection:withTransitionCoordinator:", v13, v7);
  objc_msgSend(v14, "pushViewController:animated:", v8, 0);

}

- (id)separateSecondaryViewControllerForSplitViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UIMultiColumnViewController navControllers](self, "navControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "separateSecondaryViewControllerForSplitViewController:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)columnWidths
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 != 1)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 320.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 320.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = v35;
    }
    else
    {
      -[UIViewController splitViewController](self, "splitViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_iPhoneShouldUseOverlayInCurrentEnvironment");

      if (v7)
        v8 = 375.0;
      else
        v8 = 320.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = v39;
    }
    goto LABEL_13;
  }
  -[UIViewController _existingView](self, "_existingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_screen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v16;

  objc_msgSend(v9, "_referenceBounds");
  if (v17 > 1210.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 320.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v10;
    v38[1] = &unk_1E1A95650;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = v38;
LABEL_13:
    objc_msgSend(v11, "arrayWithObjects:count:", v12, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_15;
  }
  v25 = v17;
  if (v17 <= 1112.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 320.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 320.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v30;
    v31 = (void *)MEMORY[0x1E0C99D20];
    v32 = v36;
LABEL_28:
    objc_msgSend(v31, "arrayWithObjects:count:", v32, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  if ((unint64_t)(-[UIViewController interfaceOrientation](self, "interfaceOrientation") - 3) > 1)
    goto LABEL_27;
  -[UIViewController splitViewController](self, "splitViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "viewIfLoaded");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  v29 = v28;

  if (v29 != v25)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 320.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 320.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v30;
    v31 = (void *)MEMORY[0x1E0C99D20];
    v32 = v37;
    goto LABEL_28;
  }
  v18 = &unk_1E1A93110;
LABEL_15:

  -[UIMultiColumnViewController viewControllers](self, "viewControllers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if ((unint64_t)(v20 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMultiColumnViewController.m"), 500, CFSTR("Unsupported number of columns"));

  }
  -[UIMultiColumnViewController viewControllers](self, "viewControllers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 == 1)
  {
    if (objc_msgSend(v18, "count") != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMultiColumnViewController.m"), 502, CFSTR("Computed incorrect column widths"));

    }
    objc_msgSend(v18, "subarrayWithRange:", 1, 1);
    v23 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v23;
  }
  return (NSArray *)v18;
}

- (void)requestColumnCount:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  double v9;
  double v10;
  UISlidingBarStateRequest *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v22;
  objc_class *v23;
  void *v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMultiColumnViewController.m"), 512, CFSTR("%@ currently only supports 1 or 2 columns."), v24);

  }
  if (-[UIMultiColumnViewController columnCount](self, "columnCount") != a3)
  {
    if (-[UIMultiColumnViewController _canShowColumnIndex:](self, "_canShowColumnIndex:", a3 - 1))
    {
      -[UIMultiColumnViewController _preferredContentSizes](self, "_preferredContentSizes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 - 1 >= objc_msgSend(v7, "count"))
      {
        v18 = qword_1ECD7AD40;
        if (!qword_1ECD7AD40)
        {
          v18 = __UILogCategoryGetNode("MultiColumnViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v18, (unint64_t *)&qword_1ECD7AD40);
        }
        v19 = *(NSObject **)(v18 + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = v19;
          *(_DWORD *)buf = 134218240;
          v26 = a3;
          v27 = 2048;
          v28 = objc_msgSend(v7, "count");
          _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Cannot show %li columns as there are only %li preferredContentSizes", buf, 0x16u);

        }
      }
      else
      {
        objc_msgSend(v7, "objectAtIndex:", a3 - 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "CGSizeValue");
        v10 = v9;

        v11 = objc_alloc_init(UISlidingBarStateRequest);
        -[UISlidingBarStateRequest setLeadingWidth:](v11, "setLeadingWidth:", v10);
        *(_BYTE *)&self->_mcvcFlags |= 8u;
        -[UIViewController splitViewController](self, "splitViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v4)
          objc_msgSend(v12, "_animateToRequest:", v11);
        else
          objc_msgSend(v12, "setStateRequest:", v11);

        *(_BYTE *)&self->_mcvcFlags &= ~8u;
        -[UIMultiColumnViewController _updateButtonsForColumnCount:animatingChange:](self, "_updateButtonsForColumnCount:animatingChange:", a3, v4);

      }
    }
    else
    {
      v14 = _MergedGlobals_9_1;
      if (!_MergedGlobals_9_1)
      {
        v14 = __UILogCategoryGetNode("MultiColumnViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v14, (unint64_t *)&_MergedGlobals_9_1);
      }
      v15 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        -[UIMultiColumnViewController _liveVCs](self, "_liveVCs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v26 = a3;
        v27 = 2048;
        v28 = objc_msgSend(v17, "count");
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Cannot show %li columns as there are only %li view controllers currently being displayed.", buf, 0x16u);

      }
    }
  }
}

- (unint64_t)columnCount
{
  if (self->_animatingTargetColumnCount)
    return self->_animatingTargetColumnCount;
  if (self->_lastColumnCount <= 1)
    return 1;
  return self->_lastColumnCount;
}

- (id)_preferredContentSizes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[UIMultiColumnViewController _effectiveColumnWidths](self, "_effectiveColumnWidths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (!v4)
    goto LABEL_8;
  v5 = v4;
  v6 = 0;
  while (-[UIMultiColumnViewController _canShowColumnIndex:](self, "_canShowColumnIndex:", v6))
  {
    if (v5 == ++v6)
    {
      v6 = v5;
      break;
    }
  }
  if (v6)
  {
    objc_msgSend(v3, "subarrayWithRange:", 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMultiColumnViewController _contentSizesForColumnWidths:](self, "_contentSizesForColumnWidths:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_8:
    v10.receiver = self;
    v10.super_class = (Class)UIMultiColumnViewController;
    -[UIViewController _preferredContentSizes](&v10, sel__preferredContentSizes);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_setAllowNestedNavigationControllers:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)UIMultiColumnViewController;
  -[UIViewController _setAllowNestedNavigationControllers:](&v14, sel__setAllowNestedNavigationControllers_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UIMultiColumnViewController navControllers](self, "navControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_setAllowNestedNavigationControllers:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (id)_navigationBarForDragAffordance
{
  void *v2;
  void *v3;
  void *v4;

  -[UIMultiColumnViewController navControllers](self, "navControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_navigationBarForDragAffordance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_navigationControllerChangedViewControllers:(id)a3
{
  id v4;

  if ((*(_BYTE *)&self->_mcvcFlags & 1) == 0)
  {
    -[UIViewController parentViewController](self, "parentViewController", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeDidChangeForChildContentContainer:", self);

  }
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets", a3);
  if (a4)
    *a4 = 1;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[UIViewController _existingView](self, "_existingView", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_shouldReverseLayoutDirection");

  -[UIViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  if (v9)
    v12 = v11;
  else
    v12 = v10;
  *a4 = v12;
  if (v9)
    v13 = v10;
  else
    v13 = v11;
  *a5 = v13;
}

- (void)_splitViewControllerDidUpdate:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  unint64_t v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(_QWORD);
  _QWORD aBlock[5];

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__UIMultiColumnViewController__splitViewControllerDidUpdate_withSize___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[UIViewController splitViewController](self, "splitViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "possibleStates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[UIMultiColumnViewController _columnCountForPossibleStates:containerSize:](self, "_columnCountForPossibleStates:containerSize:", v11, width, height);
  if (self->_possibleStatesAtLastUpdate)
    v13 = v12 != self->_lastColumnCount;
  else
    v13 = 1;
  self->_containerSizeAtLastUpdate.width = width;
  self->_containerSizeAtLastUpdate.height = height;
  objc_storeStrong((id *)&self->_possibleStatesAtLastUpdate, v11);
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __70__UIMultiColumnViewController__splitViewControllerDidUpdate_withSize___block_invoke_2;
    v17[3] = &unk_1E16B2F48;
    v17[4] = self;
    v18 = v9;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);

  }
  else
  {
    v9[2](v9);
  }
  if ((objc_msgSend(v7, "isCollapsed") & 1) != 0
    || (objc_msgSend(v7, "currentState"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "leadingOverlapsMain"),
        v14,
        v15))
  {
    -[UIMultiColumnViewController setKeyboardInset:](self, "setKeyboardInset:", 0.0);
  }
  if (v13)
  {
    -[UIViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNeedsLayout");

  }
}

uint64_t __70__UIMultiColumnViewController__splitViewControllerDidUpdate_withSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateButtonsForColumnCount:animatingChange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968), 0);
}

void __70__UIMultiColumnViewController__splitViewControllerDidUpdate_withSize___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "navControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "navigationBar");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "layoutIfNeeded");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)_sideBarImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("sidebar.leading"));
}

- (id)_splitViewControllerImageForDisplayModeButtonToShowPrimary:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;

  -[UIViewController splitViewController](self, "splitViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v6 = -[UIMultiColumnViewController sizeMightAllowMultipleColumns:](self, "sizeMightAllowMultipleColumns:");

  if (v6)
  {
    -[UIMultiColumnViewController _columnToggleButtonImage](self, "_columnToggleButtonImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[UIMultiColumnViewController _sideBarImage](self, "_sideBarImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIMultiColumnViewController _setColumnToggleButtonImage:](self, "_setColumnToggleButtonImage:", v8);

    }
    -[UIMultiColumnViewController _columnToggleButtonImage](self, "_columnToggleButtonImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_updateLayoutForStatusBarAndInterfaceOrientation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[UIViewController childViewControllers](self, "childViewControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_updateLayoutForStatusBarAndInterfaceOrientation");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_adjustNonOverlayScrollViewsForKeyboardInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIViewController parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIViewController _keyboardSceneDelegate](self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "verticalOverlapForView:usingKeyboardInfo:", v6, v4);
    v9 = v8;

    -[UIMultiColumnViewController keyboardInset](self, "keyboardInset");
    if (v9 != v10)
    {
      -[UIMultiColumnViewController setKeyboardInset:](self, "setKeyboardInset:", v9);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[UIMultiColumnViewController navControllers](self, "navControllers", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_DWORD **)(*((_QWORD *)&v19 + 1) + 8 * v15);
            if (v16)
            {
              if (((v16[92] >> 1) & 3u) - 1 <= 1)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "topViewController");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (v17)
                {
                  objc_msgSend(v16, "topViewController");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "_computeAndApplyScrollContentInsetDeltaForViewController:", v18);

                }
              }
            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

    }
  }

}

- (id)_effectiveColumnWidths
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIViewController splitViewController](self, "splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isCollapsed");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[UIMultiColumnViewController columnWidths](self, "columnWidths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reverseObjectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_possibleContentSizes
{
  void *v3;
  void *v4;

  -[UIMultiColumnViewController _effectiveColumnWidths](self, "_effectiveColumnWidths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[UIMultiColumnViewController _contentSizesForColumnWidths:](self, "_contentSizesForColumnWidths:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (double)_unsafeAreaPaddingForFirstVisibleColumn
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[UIViewController splitViewController](self, "splitViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "safeAreaInsets");
    v6 = v5;
    v8 = v7;
    if (objc_msgSend(v2, "_layoutPrimaryOnRight"))
      v6 = v8;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (id)_contentSizesForColumnWidths:(id)a3
{
  id v4;
  double v5;
  double v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;

  v4 = a3;
  -[UIViewController preferredContentSize](self, "preferredContentSize");
  v6 = v5;
  v7 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = 0;
    v10 = 0.0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v10 = v10 + v12;
      if (!v9)
      {
        -[UIMultiColumnViewController _unsafeAreaPaddingForFirstVisibleColumn](self, "_unsafeAreaPaddingForFirstVisibleColumn");
        v10 = v10 + v13;
      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v10, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v14);

      if (++v9 < v7)
      {
        -[UIViewController traitCollection](self, "traitCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "displayScale");
        v10 = v10 + 1.0 / v16;

      }
    }
    while (v7 != v9);
  }

  return v8;
}

- (id)_liveVCs
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[UIMultiColumnViewController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = v4 + 1;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  while (1)
  {
    v7 = v5 - 1;
    if (v5 == 1)
      break;
    v8 = v5 - 2;
    -[UIMultiColumnViewController viewControllers](self, "viewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v7;
    if (v11)
    {
      -[UIMultiColumnViewController viewControllers](self, "viewControllers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subarrayWithRange:", 0, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
  }
  return v6;
}

- (BOOL)_canShowColumnIndex:(unint64_t)a3
{
  void *v4;

  -[UIMultiColumnViewController _liveVCs](self, "_liveVCs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "count") > a3;

  return a3;
}

- (void)_willShowColumnCount:(unint64_t)a3
{
  unint64_t v5;
  id WeakRetained;

  -[UIMultiColumnViewController _updateButtonsForColumnCount:animatingChange:](self, "_updateButtonsForColumnCount:animatingChange:", a3, 0);
  -[UIMultiColumnViewController _moveViewControllersForColumnCount:](self, "_moveViewControllersForColumnCount:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (a3 <= 1)
      v5 = 1;
    else
      v5 = a3;
    objc_msgSend(WeakRetained, "multiColumnViewController:willShowColumns:", self, v5);
  }

}

- (void)_moveViewControllersForColumnCount:(unint64_t)a3
{
  char mcvcFlags;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  mcvcFlags = *(_BYTE *)&self->_mcvcFlags | 1;
  *(_BYTE *)&self->_mcvcFlags = mcvcFlags;
  if (a3 == 2)
  {
    -[UIMultiColumnViewController _liveVCs](self, "_liveVCs");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subarrayWithRange:", 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMultiColumnViewController navControllers](self, "navControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setViewControllers:animated:", v8, 0);

    -[UIMultiColumnViewController navControllers](self, "navControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setViewControllers:animated:", v7, 0);

    goto LABEL_5;
  }
  if (a3 == 1)
  {
    -[UIMultiColumnViewController _liveVCs](self, "_liveVCs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__UIMultiColumnViewController__moveViewControllersForColumnCount___block_invoke;
    v13[3] = &unk_1E16B1B50;
    v13[4] = self;
    v14 = v5;
    v6 = v5;
    +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v13);

LABEL_5:
    mcvcFlags = (char)self->_mcvcFlags;
  }
  *(_BYTE *)&self->_mcvcFlags = mcvcFlags & 0xFE;
}

void __66__UIMultiColumnViewController__moveViewControllersForColumnCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "navControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setViewControllers:animated:", MEMORY[0x1E0C9AA60], 0);

  objc_msgSend(*(id *)(a1 + 32), "navControllers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setViewControllers:animated:", *(_QWORD *)(a1 + 40), 0);

}

- (id)_addSecondColumnBarButton:(int64_t)a3 toNavItem:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v6 = a4;
  -[UIMultiColumnViewController _secondColumnBarButtonItem:createIfNecessary:](self, "_secondColumnBarButtonItem:createIfNecessary:", a3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftBarButtonItems");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  v12 = objc_msgSend(v11, "indexOfObjectIdenticalTo:", v7);
  if (v12)
  {
    v13 = v12;
    v14 = (void *)objc_msgSend(v11, "mutableCopy");
    v15 = v14;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v14, "removeObjectAtIndex:", v13);
    objc_msgSend(v15, "insertObject:atIndex:", v7, 0);
    objc_msgSend(v6, "setLeftBarButtonItems:", v15);

  }
  return v7;
}

- (id)_removeSecondColumnBarButton:(int64_t)a3 fromNavItem:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = a4;
  -[UIMultiColumnViewController _secondColumnBarButtonItem:createIfNecessary:](self, "_secondColumnBarButtonItem:createIfNecessary:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "leftBarButtonItems");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0C9AA60];
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    v12 = objc_msgSend(v11, "indexOfObjectIdenticalTo:", v7);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = v12;
      v14 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v14, "removeObjectAtIndex:", v13);
      objc_msgSend(v6, "setLeftBarButtonItems:", v14);

    }
  }

  return v7;
}

- (void)_updateButtonsForColumnCount:(unint64_t)a3 animatingChange:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t animatingTargetColumnCount;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  BOOL v30;

  if ((*(_BYTE *)&self->_mcvcFlags & 8) != 0)
    return;
  v4 = a4;
  if (a4)
  {
    self->_animatingTargetColumnCount = a3;
    *(_BYTE *)&self->_mcvcFlags |= 2u;
  }
  else
  {
    animatingTargetColumnCount = self->_animatingTargetColumnCount;
    if (animatingTargetColumnCount)
    {
      if (animatingTargetColumnCount != a3)
        goto LABEL_8;
      self->_animatingTargetColumnCount = 0;
    }
  }
  animatingTargetColumnCount = a3;
LABEL_8:
  -[UIMultiColumnViewController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[UIMultiColumnViewController viewControllers](self, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  -[UIMultiColumnViewController viewControllers](self, "viewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    v14 = 0;
  }
  else
  {
    -[UIMultiColumnViewController viewControllers](self, "viewControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (animatingTargetColumnCount <= 1)
  {
    v15 = -[UIMultiColumnViewController _removeSecondColumnBarButton:fromNavItem:](self, "_removeSecondColumnBarButton:fromNavItem:", 1, v10);
    if (!-[UIMultiColumnViewController _allowMultipleColumnsForPossibleStates:containerSize:](self, "_allowMultipleColumnsForPossibleStates:containerSize:", self->_possibleStatesAtLastUpdate, self->_containerSizeAtLastUpdate.width, self->_containerSizeAtLastUpdate.height))
    {
      if ((*(_BYTE *)&self->_mcvcFlags & 2) == 0)
        v22 = -[UIMultiColumnViewController _removeSecondColumnBarButton:fromNavItem:](self, "_removeSecondColumnBarButton:fromNavItem:", 0, v14);
      goto LABEL_29;
    }
    objc_msgSend(v10, "_removeBackButtonView");
    -[UIMultiColumnViewController _addSecondColumnBarButton:toNavItem:](self, "_addSecondColumnBarButton:toNavItem:", 0, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "hidesBackButton"))
      v17 = 0.0;
    else
      v17 = 1.0;
    objc_msgSend(v16, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlpha:", v17);

    goto LABEL_26;
  }
  if (animatingTargetColumnCount == 2)
  {
    -[UIMultiColumnViewController _addSecondColumnBarButton:toNavItem:](self, "_addSecondColumnBarButton:toNavItem:", 1, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hidesBackButton"))
      v19 = 0.0;
    else
      v19 = 1.0;
    objc_msgSend(v16, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", v19);

    if ((*(_BYTE *)&self->_mcvcFlags & 2) == 0)
      v21 = -[UIMultiColumnViewController _removeSecondColumnBarButton:fromNavItem:](self, "_removeSecondColumnBarButton:fromNavItem:", 0, v14);
LABEL_26:

  }
LABEL_29:
  if (v4)
  {
    objc_msgSend(v14, "leftBarButtonItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = 0.0;
      if (animatingTargetColumnCount != 1)
        v25 = 1.0;
      objc_msgSend(v24, "setAlpha:", v25);
      v26 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __76__UIMultiColumnViewController__updateButtonsForColumnCount_animatingChange___block_invoke;
      v28[3] = &unk_1E16B1B78;
      v29 = v24;
      v30 = animatingTargetColumnCount == 1;
      v27[0] = v26;
      v27[1] = 3221225472;
      v27[2] = __76__UIMultiColumnViewController__updateButtonsForColumnCount_animatingChange___block_invoke_2;
      v27[3] = &unk_1E16B3FD8;
      v27[4] = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v28, v27, 0.35);

    }
  }

}

uint64_t __76__UIMultiColumnViewController__updateButtonsForColumnCount_animatingChange___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", (double)*(unint64_t *)&a2);
}

uint64_t __76__UIMultiColumnViewController__updateButtonsForColumnCount_animatingChange___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1000) &= ~2u;
  return result;
}

- (BOOL)sizeMightAllowMultipleColumns:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  BOOL v7;

  width = a3.width;
  -[UIViewController splitViewController](self, "splitViewController", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_usesPanelImpl"))
  {
    -[UIViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom") == 1;

  }
  else
  {
    v7 = 0;
  }

  return width > 1210.0 && v7;
}

- (BOOL)_allowMultipleColumnsForPossibleStates:(id)a3 containerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  height = a4.height;
  width = a4.width;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (-[UIMultiColumnViewController sizeMightAllowMultipleColumns:](self, "sizeMightAllowMultipleColumns:", width, height))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          v13 = v11;
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "leadingWidth", (_QWORD)v16);
          if (v14 > 0.0)
          {
            v11 = v14;
            if (v13 != 0.0)
            {
              v11 = v13;
              if (v14 != v13)
              {
                LOBYTE(v9) = 1;
                goto LABEL_15;
              }
            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }
LABEL_15:

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)_columnCountForPossibleStates:(id)a3 containerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  height = a4.height;
  width = a4.width;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  v11 = -[UIMultiColumnViewController _allowMultipleColumnsForPossibleStates:containerSize:](self, "_allowMultipleColumnsForPossibleStates:containerSize:", v7, width, height);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[UIMultiColumnViewController _possibleContentSizes](self, "_possibleContentSizes", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (!-[UIMultiColumnViewController _canShowColumnIndex:](self, "_canShowColumnIndex:", v15 + i))
        {
          v15 += i;
          goto LABEL_17;
        }
        objc_msgSend(v18, "CGSizeValue");
        if (v19 >= v10 || !v11)
        {
          v15 += i + 1;
          goto LABEL_17;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v15 += i;
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_17:

  return v15;
}

- (id)_secondColumnBarButtonItem:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  UIBarButtonItem **p_hideSecondColumnBarButtonItem;
  UIBarButtonItem *hideSecondColumnBarButtonItem;
  BOOL v7;
  UIBarButtonItem *v8;
  void *v9;
  UIBarButtonItem *v10;
  BOOL v11;
  UIBarButtonItem *v12;
  void *v13;
  UIBarButtonItem *v14;
  UIBarButtonItem *v15;

  if (a3 == 1)
  {
    p_hideSecondColumnBarButtonItem = &self->_hideSecondColumnBarButtonItem;
    hideSecondColumnBarButtonItem = self->_hideSecondColumnBarButtonItem;
    if (hideSecondColumnBarButtonItem)
      v11 = 1;
    else
      v11 = !a4;
    if (v11)
      goto LABEL_14;
    v12 = [UIBarButtonItem alloc];
    -[UIMultiColumnViewController _sideBarImage](self, "_sideBarImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UIBarButtonItem initWithImage:style:target:action:](v12, "initWithImage:style:target:action:", v13, 0, self, sel__hideSecondColumn_);

    goto LABEL_13;
  }
  if (a3)
  {
    v15 = 0;
    return v15;
  }
  p_hideSecondColumnBarButtonItem = &self->_showSecondColumnBarButtonItem;
  hideSecondColumnBarButtonItem = self->_showSecondColumnBarButtonItem;
  if (hideSecondColumnBarButtonItem)
    v7 = 1;
  else
    v7 = !a4;
  if (!v7)
  {
    v8 = [UIBarButtonItem alloc];
    -[UIMultiColumnViewController _sideBarImage](self, "_sideBarImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UIBarButtonItem initWithImage:style:target:action:](v8, "initWithImage:style:target:action:", v9, 0, self, sel__showSecondColumn_);

    -[UIBarButtonItem _setActsAsFakeBackButton:](v10, "_setActsAsFakeBackButton:", 1);
LABEL_13:
    -[UIBarButtonItem setSpringLoaded:](v10, "setSpringLoaded:", 1);
    v14 = *p_hideSecondColumnBarButtonItem;
    *p_hideSecondColumnBarButtonItem = v10;

    hideSecondColumnBarButtonItem = *p_hideSecondColumnBarButtonItem;
  }
LABEL_14:
  v15 = hideSecondColumnBarButtonItem;
  return v15;
}

- (void)_showSecondColumn:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[UIMultiColumnViewController navControllers](self, "navControllers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isTransitioning");

  if ((v6 & 1) == 0)
    -[UIMultiColumnViewController requestColumnCount:animated:](self, "requestColumnCount:animated:", 2, 1);
}

- (void)_hideSecondColumn:(id)a3
{
  -[UIMultiColumnViewController requestColumnCount:animated:](self, "requestColumnCount:animated:", 1, 1);
}

- (id)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  const __CFString *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t j;
  const __CFString *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t k;
  uint64_t v27;
  const __CFString *v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t m;
  const __CFString *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)UIMultiColumnViewController;
  -[UIMultiColumnViewController description](&v52, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (os_variant_has_internal_diagnostics())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "appendFormat:", CFSTR(" delegate=%p vcs=["), WeakRetained);

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v7 = self->_viewControllers;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v49;
      v11 = 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v49 != v10)
            objc_enumerationMutation(v7);
          if ((v11 & 1) != 0)
            v13 = CFSTR("%p");
          else
            v13 = CFSTR(" %p");
          objc_msgSend(v4, "appendFormat:", v13, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          v11 = 0;
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        v11 = 0;
      }
      while (v9);
    }

    objc_msgSend(v4, "appendFormat:", CFSTR("] navs=["));
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v14 = self->_navControllers;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v45;
      v18 = 1;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v45 != v17)
            objc_enumerationMutation(v14);
          if ((v18 & 1) != 0)
            v20 = CFSTR("%p");
          else
            v20 = CFSTR(" %p");
          objc_msgSend(v4, "appendFormat:", v20, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
          v18 = 0;
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        v18 = 0;
      }
      while (v16);
    }

    objc_msgSend(v4, "appendFormat:", CFSTR("] colCount=%lu"), self->_lastColumnCount);
    if (-[NSArray count](self->_columnWidths, "count"))
    {
      objc_msgSend(v4, "appendFormat:", CFSTR(" colWidths=["));
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v21 = self->_columnWidths;
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v41;
        v25 = 1;
        do
        {
          for (k = 0; k != v23; ++k)
          {
            if (*(_QWORD *)v41 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * k), "doubleValue");
            if ((v25 & 1) != 0)
              v28 = CFSTR("%g");
            else
              v28 = CFSTR(" %g");
            objc_msgSend(v4, "appendFormat:", v28, v27);
            v25 = 0;
          }
          v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
          v25 = 0;
        }
        while (v23);
      }

      objc_msgSend(v4, "appendFormat:", CFSTR("]"));
    }
    if (-[NSArray count](self->_possibleStatesAtLastUpdate, "count"))
    {
      objc_msgSend(v4, "appendFormat:", CFSTR(" possibleStates=["));
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v29 = self->_possibleStatesAtLastUpdate;
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v37;
        v33 = 1;
        do
        {
          for (m = 0; m != v31; ++m)
          {
            if (*(_QWORD *)v37 != v32)
              objc_enumerationMutation(v29);
            if ((v33 & 1) != 0)
              v35 = CFSTR("%p");
            else
              v35 = CFSTR(" %p");
            objc_msgSend(v4, "appendFormat:", v35, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * m));
            v33 = 0;
          }
          v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
          v33 = 0;
        }
        while (v31);
      }

      objc_msgSend(v4, "appendFormat:", CFSTR("]"));
    }
  }
  return v4;
}

- (UIMultiColumnViewControllerDelegate)delegate
{
  return (UIMultiColumnViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllers, a3);
}

- (NSArray)navControllers
{
  return self->_navControllers;
}

- (void)setNavControllers:(id)a3
{
  objc_storeStrong((id *)&self->_navControllers, a3);
}

- (void)setColumnWidths:(id)a3
{
  objc_storeStrong((id *)&self->_columnWidths, a3);
}

- (double)keyboardInset
{
  return self->_keyboardInset;
}

- (void)setKeyboardInset:(double)a3
{
  self->_keyboardInset = a3;
}

- (UIImage)_columnToggleButtonImage
{
  return self->__columnToggleButtonImage;
}

- (void)_setColumnToggleButtonImage:(id)a3
{
  objc_storeStrong((id *)&self->__columnToggleButtonImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__columnToggleButtonImage, 0);
  objc_storeStrong((id *)&self->_columnWidths, 0);
  objc_storeStrong((id *)&self->_navControllers, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_possibleStatesAtLastUpdate, 0);
  objc_storeStrong((id *)&self->_borderViews, 0);
  objc_storeStrong((id *)&self->_hideSecondColumnBarButtonItem, 0);
  objc_storeStrong((id *)&self->_showSecondColumnBarButtonItem, 0);
}

@end
