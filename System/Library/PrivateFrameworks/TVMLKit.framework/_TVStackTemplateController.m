@implementation _TVStackTemplateController

- (_TVStackTemplateController)init
{
  _TVStackTemplateController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVStackTemplateController;
  result = -[_TVStackTemplateController init](&v3, sel_init);
  if (result)
    result->_showcaseFactor = NAN;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVTemplateFeaturesManager featuresManagerForAppDocument:](TVTemplateFeaturesManager, "featuresManagerForAppDocument:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "popContext:forFeature:", self, &unk_2557D3360);
  v6.receiver = self;
  v6.super_class = (Class)_TVStackTemplateController;
  -[_TVStackCommonTemplateController dealloc](&v6, sel_dealloc);
}

- (id)viewControllers
{
  return self->_viewControllers;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  NSIndexPath **p_lastFocusedIndexPath;
  NSIndexPath *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSIndexPath *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  objc_super v26;
  uint8_t buf[4];
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_TVStackTemplateController;
  -[_TVStackCommonTemplateController didUpdateFocusInContext:withAnimationCoordinator:](&v26, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  p_lastFocusedIndexPath = &self->_lastFocusedIndexPath;
  v8 = self->_lastFocusedIndexPath;
  objc_msgSend(v6, "nextFocusedView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isDescendantOfView:", v10);

  if (v11)
  {
    objc_msgSend(v6, "nextFocusedView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      do
      {
        objc_msgSend(v12, "superview");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVStackCommonTemplateController collectionView](self, "collectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v14)
          break;
        objc_msgSend(v12, "superview");
        v15 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v15;
      }
      while (v15);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    -[_TVStackCommonTemplateController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "indexPathForCell:", v12);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = (NSIndexPath *)v17;
    goto LABEL_9;
  }
  -[_TVStackCommonTemplateController focusedSupplementaryViewController](self, "focusedSupplementaryViewController");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v16 = (void *)v18;
    v12 = v8;
    v8 = 0;
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  objc_msgSend(v6, "nextFocusedView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackTemplateController tabBarController](self, "tabBarController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "tabBar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v22, "isDescendantOfView:", v24);

  if ((v25 & 1) != 0)
  {
    v12 = v8;
    v8 = 0;
    goto LABEL_10;
  }
LABEL_11:
  objc_storeStrong((id *)p_lastFocusedIndexPath, v8);
  v19 = (id)TVMLKitLogObject;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = *p_lastFocusedIndexPath;
    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSIndexPath section](v20, "section"));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = CFSTR("-");
    }
    *(_DWORD *)buf = 138412290;
    v28 = v21;
    _os_log_impl(&dword_222D98000, v19, OS_LOG_TYPE_INFO, "LFIP: from focus context: %@", buf, 0xCu);
    if (v20)

  }
}

- (void)viewDidLoad
{
  _TVNeedsMoreContentEvaluator *v3;
  void *v4;
  _TVNeedsMoreContentEvaluator *v5;
  _TVNeedsMoreContentEvaluator *needsMoreContentEvaluator;
  _TVNeedsMoreContentEvaluator *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSIndexPath *lastFocusedIndexPath;
  uint64_t v13;
  NSIndexPath *v14;
  NSIndexPath *v15;
  NSObject *v16;
  NSIndexPath *v17;
  __CFString *v18;
  NSIndexPath *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  uint8_t buf[24];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)_TVStackTemplateController;
  -[_TVStackTemplateController viewDidLoad](&v35, sel_viewDidLoad);
  v3 = [_TVNeedsMoreContentEvaluator alloc];
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_TVNeedsMoreContentEvaluator initWithScrollView:axis:](v3, "initWithScrollView:axis:", v4, 2);
  needsMoreContentEvaluator = self->_needsMoreContentEvaluator;
  self->_needsMoreContentEvaluator = v5;

  v7 = self->_needsMoreContentEvaluator;
  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVNeedsMoreContentEvaluator setViewElement:](v7, "setViewElement:", v8);

  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVTemplateFeaturesManager featuresManagerForAppDocument:](TVTemplateFeaturesManager, "featuresManagerForAppDocument:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pushContext:forFeature:", self, &unk_2557D3360);
  -[_TVStackTemplateController didUpdateSupplementarySectionInfo](self, "didUpdateSupplementarySectionInfo");
  -[_TVStackTemplateController _buildStackSections](self, "_buildStackSections");
  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  if (lastFocusedIndexPath)
  {
    v13 = -[IKChangeSet newIndexForOldIndex:](self->_filteredChangeSet, "newIndexForOldIndex:", -[NSIndexPath section](lastFocusedIndexPath, "section"));
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v13);
      v14 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    }
    v15 = self->_lastFocusedIndexPath;
    self->_lastFocusedIndexPath = v14;

    v16 = (id)TVMLKitLogObject;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = self->_lastFocusedIndexPath;
      if (v17)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSIndexPath section](self->_lastFocusedIndexPath, "section"));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = CFSTR("-");
      }
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_222D98000, v16, OS_LOG_TYPE_INFO, "LFIP: from view load: %@", buf, 0xCu);
      if (v17)

    }
    v19 = self->_lastFocusedIndexPath;
    if (v19)
    {
      v20 = -[NSIndexPath section](v19, "section");
      if (v20 < -[NSArray count](self->_stackSections, "count"))
      {
        -[_TVStackCommonTemplateController collectionView](self, "collectionView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "contentOffset");
        *(_QWORD *)buf = v22;
        *(_QWORD *)&buf[8] = v23;

        -[NSArray objectAtIndex:](self->_stackSections, "objectAtIndex:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVStackTemplateController _adjustedContentOffsetForRowIndex:targetContentOffset:](self, "_adjustedContentOffsetForRowIndex:targetContentOffset:", objc_msgSend(v24, "firstItemRowIndex"), buf);
        -[_TVStackCommonTemplateController collectionView](self, "collectionView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "contentSize");
        v27 = v26;
        v29 = v28;
        v30 = MEMORY[0x24BDBF148];
        v31 = *MEMORY[0x24BDBF148];

        if (v27 == v31 && v29 == *(double *)(v30 + 8))
        {
          -[_TVStackCommonTemplateController collectionView](self, "collectionView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "layoutBelowIfNeeded");

        }
        -[_TVStackCommonTemplateController collectionView](self, "collectionView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setContentOffset:", *(_OWORD *)buf);

      }
    }
  }
  if (-[_TVStackCommonTemplateController _isBackdropNeeded](self, "_isBackdropNeeded"))
  {
    -[_TVStackCommonTemplateController stackWrappingView](self, "stackWrappingView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBackdropMaskFactor:", 1.0);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVStackTemplateController;
  -[_TVStackTemplateController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[_TVStackCommonTemplateController stackWrappingView](self, "stackWrappingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldAdjustForTabBarSafeAreaInsets:", -[_TVStackTemplateController shouldAdjustForTabBarSafeAreaInsets](self, "shouldAdjustForTabBarSafeAreaInsets"));

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_TVStackTemplateController;
  -[_TVBgImageLoadingViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[_TVStackTemplateController _invalidateSectionMetricsIfNeeded](self, "_invalidateSectionMetricsIfNeeded");
  if (-[NSArray count](self->_stackSections, "count"))
  {
    -[_TVStackTemplateController scrollStopForShowcaseTransition](self, "scrollStopForShowcaseTransition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[_TVStackTemplateController _offsetToScrollStop:](self, "_offsetToScrollStop:", v3);
      v5 = v4;
      -[_TVStackCommonTemplateController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentInset");
      v8 = v5 + v7;

    }
    else
    {
      v8 = 0.0;
    }

  }
  else
  {
    v8 = 0.0;
  }
  -[_TVStackCommonTemplateController _flowLayout](self, "_flowLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowcaseHeight:", v8);

  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x24BDE57D8];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51___TVStackTemplateController_viewDidLayoutSubviews__block_invoke;
  v11[3] = &unk_24EB854F8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "setCompletionBlock:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVStackTemplateController;
  -[_TVStackCommonTemplateController traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, a3);
}

- (void)setShowcaseInset:(double)a3
{
  if (self->_showcaseInset != a3)
  {
    self->_showcaseInset = a3;
    if (-[_TVStackTemplateController isViewLoaded](self, "isViewLoaded"))
    {
      -[_TVStackTemplateController didUpdateSupplementarySectionInfo](self, "didUpdateSupplementarySectionInfo");
      -[_TVStackTemplateController _buildStackSections](self, "_buildStackSections");
    }
  }
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (void)updateCollectionViewControllersAndForceReload:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSIndexPath *lastFocusedIndexPath;
  __CFString *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSIndexPath **p_lastFocusedIndexPath;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSIndexPath *v34;
  NSIndexPath *v35;
  __CFString *v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  _TVNeedsMoreContentEvaluator *needsMoreContentEvaluator;
  void *v46;
  void *v47;
  _BOOL4 v48;
  NSUInteger v49;
  _QWORD v50[5];
  _QWORD v51[5];
  id v52;
  id v53;
  void (**v54)(_QWORD);
  uint64_t *v55;
  id obj;
  id v57;
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[24];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  -[_TVStackCommonTemplateController collectionListElement](self, "collectionListElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    -[_TVStackCommonTemplateController viewElement](self, "viewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "updateType"))
    {
      v7 = objc_msgSend(v5, "updateType");

      if (!v7)
        goto LABEL_55;
    }
    else
    {

    }
  }
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v59 = (id *)&v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__12;
  v62 = __Block_byref_object_dispose__12;
  v63 = 0;
  v49 = -[NSArray count](self->_stackRows, "count");
  -[_TVStackCommonTemplateController collectionListElement](self, "collectionListElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v59 + 5;
  obj = v59[5];
  v57 = 0;
  -[_TVStackTemplateController _updateWithCollectionListElement:commits:autoHighlightIndexPath:](self, "_updateWithCollectionListElement:commits:autoHighlightIndexPath:", v9, &v57, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void (**)(_QWORD))v57;
  objc_storeStrong(v10, obj);

  -[_TVStackTemplateController scrollStopForShowcaseTransition](self, "scrollStopForShowcaseTransition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_requiresShowcasing = v13 != 0;

  if (!-[_TVStackTemplateController isViewLoaded](self, "isViewLoaded"))
  {
    v12[2](v12);
    objc_storeStrong((id *)&self->_lastFocusedIndexPath, v59[5]);
    v19 = (id)TVMLKitLogObject;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      lastFocusedIndexPath = self->_lastFocusedIndexPath;
      if (lastFocusedIndexPath)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSIndexPath section](self->_lastFocusedIndexPath, "section"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = CFSTR("-");
      }
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v21;
      _os_log_impl(&dword_222D98000, v19, OS_LOG_TYPE_INFO, "LFIP: from auto highlight w/o view: %@", buf, 0xCu);
      if (lastFocusedIndexPath)

    }
    goto LABEL_53;
  }
  objc_msgSend(v5, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("animationsEnabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v5, "attributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("animationsEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (!v11)
      goto LABEL_18;
  }
  else
  {
    v18 = 1;
    if (!v11)
    {
LABEL_18:
      v12[2](v12);
      -[_TVStackTemplateController _buildStackSections](self, "_buildStackSections");
      v23 = v59[5];
      if (v23)
      {
        v24 = -[IKChangeSet newIndexForOldIndex:](self->_filteredChangeSet, "newIndexForOldIndex:", objc_msgSend(v23, "section"));
        if (v24 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v25 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_storeStrong(v59 + 5, v25);
        if (v24 != 0x7FFFFFFFFFFFFFFFLL)

      }
      v26 = v59[5];
      p_lastFocusedIndexPath = &self->_lastFocusedIndexPath;
      if (v26)
      {
        objc_storeStrong((id *)&self->_lastFocusedIndexPath, v26);
        v28 = (id)TVMLKitLogObject;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = -[NSIndexPath section](*p_lastFocusedIndexPath, "section");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v29;
          _os_log_impl(&dword_222D98000, v28, OS_LOG_TYPE_INFO, "LFIP: from auto highlight w/o changeset: %ld", buf, 0xCu);
        }
      }
      else
      {
        if (!*p_lastFocusedIndexPath)
          goto LABEL_44;
        v30 = -[NSArray count](self->_viewControllers, "count");
        v31 = -[NSIndexPath section](*p_lastFocusedIndexPath, "section");
        if (v30 < 1)
        {
          v33 = 0;
        }
        else
        {
          if (v31 >= v30 - 1)
            v32 = v30 - 1;
          else
            v32 = v31;
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v32);
          v33 = objc_claimAutoreleasedReturnValue();
        }
        v34 = *p_lastFocusedIndexPath;
        *p_lastFocusedIndexPath = (NSIndexPath *)v33;

        v28 = (id)TVMLKitLogObject;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v35 = *p_lastFocusedIndexPath;
          if (*p_lastFocusedIndexPath)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSIndexPath section](*p_lastFocusedIndexPath, "section"));
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v36 = CFSTR("-");
          }
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v36;
          _os_log_impl(&dword_222D98000, v28, OS_LOG_TYPE_INFO, "LFIP: from update w/o changeset: %@", buf, 0xCu);
          if (v35)

        }
      }

LABEL_44:
      if (*p_lastFocusedIndexPath)
      {
        v37 = -[NSIndexPath section](*p_lastFocusedIndexPath, "section");
        if (v37 < -[NSArray count](self->_stackSections, "count"))
        {
          -[_TVStackCommonTemplateController collectionView](self, "collectionView");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "contentOffset");
          *(_QWORD *)buf = v39;
          *(_QWORD *)&buf[8] = v40;

          -[NSArray objectAtIndex:](self->_stackSections, "objectAtIndex:", v37);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVStackTemplateController _adjustedContentOffsetForRowIndex:targetContentOffset:](self, "_adjustedContentOffsetForRowIndex:targetContentOffset:", objc_msgSend(v41, "firstItemRowIndex"), buf);
          -[_TVStackCommonTemplateController collectionView](self, "collectionView");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setContentOffset:", *(_OWORD *)buf);

        }
      }
      self->_shouldInvalidateMetrics = 0;
      objc_msgSend(v8, "reloadData");
      goto LABEL_48;
    }
  }
  if (a3 || !v18 || !-[NSArray count](self->_viewControllers, "count"))
    goto LABEL_18;
  v22 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke;
  v51[3] = &unk_24EB88C88;
  v54 = v12;
  v51[4] = self;
  v52 = v11;
  v55 = &v58;
  v53 = v8;
  v50[0] = v22;
  v50[1] = 3221225472;
  v50[2] = __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke_3;
  v50[3] = &unk_24EB85A38;
  v50[4] = self;
  objc_msgSend(v53, "performBatchUpdates:completion:", v51, v50);

LABEL_48:
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "tv_isFocusOnNonOwnedCell");

  if ((v44 & 1) == 0)
    -[_TVStackTemplateController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  needsMoreContentEvaluator = self->_needsMoreContentEvaluator;
  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVNeedsMoreContentEvaluator setViewElement:](needsMoreContentEvaluator, "setViewElement:", v46);

  if (-[NSArray count](self->_stackRows, "count") == v49)
  {
    -[_TVStackCommonTemplateController collectionListElement](self, "collectionListElement");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (unint64_t)objc_msgSend(v47, "updateType") > 2;

    if (!v48)
      goto LABEL_54;
  }
  -[_TVNeedsMoreContentEvaluator reset](self->_needsMoreContentEvaluator, "reset");
  -[_TVStackTemplateController view](self, "view");
  v19 = objc_claimAutoreleasedReturnValue();
  -[NSObject setNeedsLayout](v19, "setNeedsLayout");
LABEL_53:

LABEL_54:
  -[_TVStackTemplateController _configureBackgroundTintView](self, "_configureBackgroundTintView");

  _Block_object_dispose(&v58, 8);
LABEL_55:

}

- (int64_t)numberOfCollections
{
  return -[NSArray count](self->_stackSections, "count");
}

- (void)didUpdateSupplementarySectionInfo
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  _QWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[_TVStackTemplateController isViewLoaded](self, "isViewLoaded"))
  {
    -[_TVStackCommonTemplateController supplementaryViewControllers](self, "supplementaryViewControllers");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v17 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v7, "tv_associatedIKViewElement");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "style");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "tv_transition");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("dissolve"));

          if (v11)
            v12 = 2;
          else
            v12 = 0;
          -[_TVStackTemplateController showcaseInset](self, "showcaseInset");
          v15[0] = 0;
          v15[1] = v12;
          v15[2] = v13;
          objc_msgSend(v7, "tv_setShowcaseConfig:", v15);

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v4);
    }

  }
}

- (void)updateBackgroundAndBackdrop
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 requiresShowcasing;
  void *v7;
  char v8;
  int64_t v9;
  id v10;
  objc_super v11;

  -[_TVStackCommonTemplateController bgImgElement](self, "bgImgElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tv_imageTreatment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("blurOverlay")))
  {

    goto LABEL_6;
  }
  requiresShowcasing = self->_requiresShowcasing;

  if (!requiresShowcasing)
  {
LABEL_6:
    v11.receiver = self;
    v11.super_class = (Class)_TVStackTemplateController;
    -[_TVStackCommonTemplateController updateBackgroundAndBackdrop](&v11, sel_updateBackgroundAndBackdrop);
    return;
  }
  -[_TVStackCommonTemplateController stackWrappingView](self, "stackWrappingView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVStackCommonTemplateController mediaPlayer](self, "mediaPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPlaying");

  if ((v8 & 1) != 0)
  {
    v9 = 4009;
  }
  else if (-[_TVStackCommonTemplateController _backgroundImageRequiresBlur](self, "_backgroundImageRequiresBlur"))
  {
    v9 = 0x8000000000000000;
  }
  else
  {
    v9 = -[_TVStackCommonTemplateController _blurEffectStyle](self, "_blurEffectStyle");
  }
  objc_msgSend(v10, "setBackdropBlurEffectStyle:", v9);
  objc_msgSend(v10, "setBackdropInitialPeek:", 540.0);
  objc_msgSend(v10, "setBackdropPeekGradient:", 270.0);

}

- (void)updateBackgroundAndBackdropMaskFactor
{
  id v3;
  objc_super v4;

  if (self->_requiresShowcasing)
  {
    -[_TVStackTemplateController showcaseFactor](self, "showcaseFactor");
    -[_TVStackCommonTemplateController stackWrappingView](self, "stackWrappingView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[_TVStackTemplateController showcaseFactor](self, "showcaseFactor");
    objc_msgSend(v3, "setBackdropMaskFactor:");

  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_TVStackTemplateController;
    -[_TVStackCommonTemplateController updateBackgroundAndBackdropMaskFactor](&v4, sel_updateBackgroundAndBackdropMaskFactor);
  }
}

- (BOOL)shouldAdjustForTabBarSafeAreaInsets
{
  return 0;
}

- (id)scrollStopForShowcaseTransition
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "edgeFlagForStyle:", CFSTR("tv-scrollable-bounds-inset"));

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setSectionIndex:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v6, "setEdge:", 0);
    -[_TVStackTemplateController _scrollableBoundsInset](self, "_scrollableBoundsInset");
    objc_msgSend(v6, "setOffset:");
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)scrollStopForEnteringSectionAtIndex:(int64_t)a3 fromEdge:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  NSArray *viewControllers;
  id v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  viewControllers = self->_viewControllers;
  v5 = a3;
  v6 = -[NSArray count](viewControllers, "count");
  v9.receiver = self;
  v9.super_class = (Class)_TVStackTemplateController;
  v7 = -[_TVStackCommonTemplateController numberOfSectionsInCollectionView:](&v9, sel_numberOfSectionsInCollectionView_, v5);

  return (int64_t)v7 + v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  objc_super v9;

  v6 = a3;
  if (-[NSArray count](self->_viewControllers, "count") <= a4)
  {
    v9.receiver = self;
    v9.super_class = (Class)_TVStackTemplateController;
    v7 = -[_TVStackCommonTemplateController collectionView:numberOfItemsInSection:](&v9, sel_collectionView_numberOfItemsInSection_, v6, a4);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 >= -[NSArray count](self->_viewControllers, "count"))
  {
    v24.receiver = self;
    v24.super_class = (Class)_TVStackTemplateController;
    -[_TVStackCommonTemplateController collectionView:cellForItemAtIndexPath:](&v24, sel_collectionView_cellForItemAtIndexPath_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_TVStackCommonTemplateController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TVStackViewCollectionCellIdentifier"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", objc_msgSend(v7, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    objc_msgSend(v12, "setFrame:");
    objc_msgSend(v11, "tv_associatedIKViewElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("markBackgroundSegment"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "style");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tv_backgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 && (v16 & 1) == 0)
    {
      objc_msgSend(v13, "style");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "tv_backgroundColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "color");
      v22 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v22;
    }
    objc_msgSend(v10, "setBackgroundColor:", v17);

    objc_msgSend(v10, "setViewController:", v11);
  }

  return v10;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  void *v4;
  NSIndexPath *lastFocusedIndexPath;
  NSIndexPath *v6;
  NSObject *v7;
  __CFString *v8;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[_TVStackCommonTemplateController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "tv_isFocusOnNonOwnedCell") & 1) != 0)
    lastFocusedIndexPath = 0;
  else
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
  v6 = lastFocusedIndexPath;

  v7 = (id)TVMLKitLogObject;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSIndexPath section](v6, "section"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("-");
    }
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_222D98000, v7, OS_LOG_TYPE_INFO, "LFIP: returned: %@", (uint8_t *)&v10, 0xCu);
    if (v6)

  }
  return v6;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  UIViewController *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  UIViewController *v28;
  id v29;
  objc_super v30;
  _QWORD v31[2];
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v31[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "section");
  if (v11 >= -[NSArray count](self->_viewControllers, "count"))
  {
    v30.receiver = self;
    v30.super_class = (Class)_TVStackTemplateController;
    -[_TVStackCommonTemplateController collectionView:willDisplayCell:forItemAtIndexPath:](&v30, sel_collectionView_willDisplayCell_forItemAtIndexPath_, v8, v9, v10);
  }
  else
  {
    objc_msgSend(v9, "viewController");
    v12 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[_TVStackTemplateController childViewControllers](self, "childViewControllers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v12);

      if ((v14 & 1) == 0)
      {
        -[_TVStackTemplateController addChildViewController:](self, "addChildViewController:", v12);
        -[UIViewController didMoveToParentViewController:](v12, "didMoveToParentViewController:", self);
        -[NSMutableArray removeObject:](self->_preloadQueue, "removeObject:", v12);
        if (v12 == self->_backdropTintViewController)
          -[_TVStackTemplateController _updateBackgroundTintView](self, "_updateBackgroundTintView");
        v24 = MEMORY[0x24BDAC760];
        v25 = 3221225472;
        v26 = __80___TVStackTemplateController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
        v27 = &unk_24EB848C0;
        v28 = v12;
        v29 = v9;
        dispatch_async(MEMORY[0x24BDAC9B8], &v24);

      }
    }
    -[_TVStackCommonTemplateController collectionView](self, "collectionView", v24, v25, v26, v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionViewLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "layoutAttributesForItemAtIndexPath:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v33 = CGRectIntegral(v32);
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
    objc_msgSend(v17, "frame");
    v36 = CGRectIntegral(v34);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    if (!CGRectEqualToRect(v35, v36))
    {
      v22 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
      v31[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "invalidateItemsAtIndexPaths:", v23);

      objc_msgSend(v16, "invalidateLayoutWithContext:", v22);
    }

  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "section");
  if (v11 >= -[NSArray count](self->_viewControllers, "count"))
  {
    v16.receiver = self;
    v16.super_class = (Class)_TVStackTemplateController;
    -[_TVStackCommonTemplateController collectionView:willDisplayCell:forItemAtIndexPath:](&v16, sel_collectionView_willDisplayCell_forItemAtIndexPath_, v8, v9, v10);
  }
  else
  {
    objc_msgSend(v9, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[_TVStackTemplateController childViewControllers](self, "childViewControllers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "containsObject:", v12) & 1) != 0)
      {
        objc_msgSend(v12, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isDescendantOfView:", v9);

        if (v15)
        {
          objc_msgSend(v12, "willMoveToParentViewController:", 0);
          objc_msgSend(v12, "removeFromParentViewController");
        }
      }
      else
      {

      }
    }

  }
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  NSIndexPath *lastFocusedIndexPath;
  unint64_t v6;
  void *v7;
  NSIndexPath *v8;
  double x;
  double y;
  CGPoint v11;
  CGPoint result;

  v11 = a4;
  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  if (lastFocusedIndexPath)
  {
    v6 = -[NSIndexPath section](lastFocusedIndexPath, "section", a3);
    if (v6 < -[NSArray count](self->_stackSections, "count"))
    {
      -[NSArray objectAtIndex:](self->_stackSections, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVStackTemplateController _adjustedContentOffsetForRowIndex:targetContentOffset:](self, "_adjustedContentOffsetForRowIndex:targetContentOffset:", objc_msgSend(v7, "firstItemRowIndex"), &v11);

    }
    v8 = self->_lastFocusedIndexPath;
    self->_lastFocusedIndexPath = 0;

  }
  x = v11.x;
  y = v11.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForSectionAtIndex:(int64_t)a5
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  int v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  CGSize result;

  v32 = *MEMORY[0x24BDAC8D0];
  -[_TVStackTemplateController view](self, "view", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionHeight");
  v12 = v11;

  if (self->_requiresShowcasing)
  {
    -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "showcaseSectionHeight");
    v15 = v14;

    -[_TVStackCommonTemplateController _flowLayout](self, "_flowLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "showcaseFactor");
    v12 = v15 + (1.0 - v17) * (v12 - v15);

  }
  if (v9 < 0.0 || v12 < 0.0)
  {
    -[_TVStackTemplateController viewControllers](self, "viewControllers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tv_associatedIKViewElement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR))
    {
      v24 = v21;
      objc_msgSend(v20, "debugDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 134218498;
      v27 = v9;
      v28 = 2048;
      v29 = v12;
      v30 = 2112;
      v31 = v25;
      _os_log_error_impl(&dword_222D98000, v24, OS_LOG_TYPE_ERROR, "StackLayout: invalid cell size: {%lf, %lf} for: %@", (uint8_t *)&v26, 0x20u);

    }
  }
  v22 = v9;
  v23 = v12;
  result.height = v23;
  result.width = v22;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v7;
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
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UIEdgeInsets result;

  -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", a5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionSpacing");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  if (self->_requiresShowcasing)
  {
    -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "showcaseSectionSpacing");
    v18 = v17;
    v20 = v19;

    -[_TVStackCommonTemplateController _flowLayout](self, "_flowLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "showcaseFactor");
    v9 = v18 + (1.0 - v22) * (v9 - v18);

    -[_TVStackCommonTemplateController _flowLayout](self, "_flowLayout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "showcaseFactor");
    v13 = v20 + (1.0 - v24) * (v13 - v20);

  }
  v25 = v9;
  v26 = v11;
  v27 = v13;
  v28 = v15;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (void)collectionView:(id)a3 showcaseFactorDidChangeForLayout:(id)a4
{
  void *v5;
  double v6;
  double v7;
  void *v8;

  -[_TVStackCommonTemplateController _flowLayout](self, "_flowLayout", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showcaseFactor");
  v7 = v6;

  if (self->_showcaseFactor != v7)
  {
    self->_showcaseFactor = v7;
    -[_TVStackTemplateController _scheduleNextPreloadConditional](self, "_scheduleNextPreloadConditional");
    -[_TVStackCommonTemplateController observableEventController](self, "observableEventController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dispatchEvent:sender:withUserInfo:", CFSTR("TVShowcaseFactorDidChangeEvent"), self, 0);

    -[_TVStackTemplateController showcaseFactorDidChange](self, "showcaseFactorDidChange");
  }
}

- (id)tabBarObservedScrollView
{
  void *v2;
  void *v3;

  -[_TVStackCommonTemplateController stackWrappingView](self, "stackWrappingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVStackTemplateController;
  -[_TVStackCommonTemplateController scrollViewDidScroll:](&v4, sel_scrollViewDidScroll_, a3);
  -[_TVNeedsMoreContentEvaluator evaluateForState:](self->_needsMoreContentEvaluator, "evaluateForState:", 2);
  -[_TVStackTemplateController _updateBackgroundTintViewEffects](self, "_updateBackgroundTintViewEffects");
}

- (void)_scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *lastFocusedIndexPath;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSIndexPath *v13;
  __CFString *v14;
  int v15;
  __CFString *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  objc_msgSend(v5, "setContentOffset:animated:", v3, 0.0, -v6);
  -[_TVStackCommonTemplateController _flowLayout](self, "_flowLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v7, "invalidationContextForBoundsChange:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateLayoutWithContext:", v8);

  if (objc_msgSend(v5, "numberOfSections") < 1 || objc_msgSend(v5, "numberOfItemsInSection:", 0) < 1)
  {
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
    self->_lastFocusedIndexPath = 0;
  }
  else
  {
    -[_TVStackTemplateController viewControllers](self, "viewControllers");
    lastFocusedIndexPath = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(lastFocusedIndexPath, "count");
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_storeStrong((id *)&self->_lastFocusedIndexPath, v11);
    if (v10)

  }
  v12 = (id)TVMLKitLogObject;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = self->_lastFocusedIndexPath;
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSIndexPath section](v13, "section"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = CFSTR("-");
    }
    v15 = 138412290;
    v16 = v14;
    _os_log_impl(&dword_222D98000, v12, OS_LOG_TYPE_INFO, "LFIP: from scroll to top: %@", (uint8_t *)&v15, 0xCu);
    if (v13)

  }
}

- (id)_updateWithCollectionListElement:(id)a3 commits:(id *)a4 autoHighlightIndexPath:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSMutableArray *preloadQueue;
  void *v56;
  NSMutableArray *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  NSArray *v62;
  void *v63;
  id v64;
  id v66;
  NSArray *v69;
  id v70;
  NSArray *v71;
  id v72;
  id v73;
  void *v74;
  _TVStackTemplateController *v75;
  _QWORD v76[4];
  NSArray *v77;
  _TVStackTemplateController *v78;
  void *v79;
  _QWORD v80[5];
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  NSArray *v97;
  _TVStackTemplateController *v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v72 = a3;
  v75 = self;
  v71 = self->_unfilteredViewControllers;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "unfilteredChildrenChangeSet");
  v73 = (id)objc_claimAutoreleasedReturnValue();
  if (v73 && v71)
  {
    objc_msgSend(v6, "addObjectsFromArray:", v71);
    objc_msgSend(v73, "removedIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v11;

    v74 = v21;
    objc_msgSend(v6, "objectsAtIndexes:", v21);
    v69 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    objc_msgSend(v73, "movedIndexesByNewIndex");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v106 != v25)
            objc_enumerationMutation(v23);
          objc_msgSend(v74, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i), "integerValue"));
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
      }
      while (v24);
    }

    objc_msgSend(v6, "removeObjectsAtIndexes:", v74);
    objc_msgSend(v73, "addedIndexes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
      v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    v31 = v30;

    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    objc_msgSend(v73, "movedIndexesByNewIndex");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v102;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v102 != v35)
            objc_enumerationMutation(v33);
          objc_msgSend(v31, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * j), "integerValue"));
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
      }
      while (v34);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = MEMORY[0x24BDAC760];
    v93[1] = 3221225472;
    v93[2] = __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_2;
    v93[3] = &unk_24EB88CF0;
    v38 = v72;
    v94 = v38;
    v39 = v73;
    v95 = v39;
    v66 = v37;
    v96 = v66;
    v100 = &__block_literal_global_47;
    v97 = v71;
    v98 = v75;
    v70 = v7;
    v99 = v70;
    objc_msgSend(v31, "enumerateIndexesUsingBlock:", v93);
    objc_msgSend(v6, "insertObjects:atIndexes:", v66, v31);
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    objc_msgSend(v39, "updatedIndexesByNewIndex");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "allKeys");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v89, v110, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v90;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v90 != v43)
            objc_enumerationMutation(v41);
          v45 = objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * k), "integerValue", v66);
          objc_msgSend(v38, "unfilteredChildren");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectAtIndexedSubscript:", v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "objectAtIndexedSubscript:", v45);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke((uint64_t)v48, v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = -[_TVStackCommonTemplateController viewControllerWithElement:layout:existingController:](v75, "viewControllerWithElement:layout:existingController:", v47, v49, v48);

        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v89, v110, 16);
      }
      while (v42);
    }

  }
  else
  {
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    objc_msgSend(v72, "unfilteredChildren");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v85, v109, 16);
    v14 = v13;
    if (v13)
    {
      v15 = *(_QWORD *)v86;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v86 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v16);
          __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke(v13, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVStackCommonTemplateController viewControllerWithElement:layout:existingController:](v75, "viewControllerWithElement:layout:existingController:", v17, v18, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v6, "addObject:", v19);
          }
          else
          {
            v20 = (void *)objc_opt_new();
            objc_msgSend(v6, "addObject:", v20);

          }
          ++v16;
        }
        while (v14 != v16);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v85, v109, 16);
        v14 = v13;
      }
      while (v13);
    }

    v70 = v6;
    v69 = v71;
  }
  -[_TVStackCommonTemplateController viewElement](v75, "viewElement", v66);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "attributes");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("preloading"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53 && !objc_msgSend(v53, "BOOLValue"))
  {
    -[NSMutableArray removeAllObjects](v75->_preloadQueue, "removeAllObjects");
  }
  else
  {
    if (!v75->_preloadQueue)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v54 = objc_claimAutoreleasedReturnValue();
      preloadQueue = v75->_preloadQueue;
      v75->_preloadQueue = (NSMutableArray *)v54;

    }
    if (-[NSArray count](v69, "count"))
      -[NSMutableArray removeObjectsInArray:](v75->_preloadQueue, "removeObjectsInArray:", v69);
    objc_msgSend(v70, "indexesOfObjectsPassingTest:", &__block_literal_global_124);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v75->_preloadQueue;
    objc_msgSend(v70, "objectsAtIndexes:", v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v57, "addObjectsFromArray:", v58);

  }
  -[_TVStackTemplateController _scheduleNextPreloadConditional](v75, "_scheduleNextPreloadConditional");
  if (a5)
  {
    v81 = 0;
    v82 = &v81;
    v83 = 0x2020000000;
    v84 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v72, "unfilteredChildren");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_4;
    v80[3] = &unk_24EB88D58;
    v80[4] = &v81;
    objc_msgSend(v59, "enumerateObjectsUsingBlock:", v80);

    if (v82[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      *a5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0);
      v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v60;

    }
    _Block_object_dispose(&v81, 8);
  }
  v76[0] = MEMORY[0x24BDAC760];
  v76[1] = 3221225472;
  v76[2] = __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_5;
  v76[3] = &unk_24EB865E0;
  v77 = v69;
  v78 = v75;
  v79 = v6;
  v61 = v6;
  v62 = v69;
  *a4 = (id)MEMORY[0x22767F470](v76);
  v63 = v79;
  v64 = v73;

  return v64;
}

- (void)_scheduleNextPreloadConditional
{
  double v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_flags._preloadingScheduled && -[NSMutableArray count](self->_preloadQueue, "count"))
  {
    -[_TVStackTemplateController showcaseFactor](self, "showcaseFactor");
    -[_TVStackTemplateController showcaseFactor](self, "showcaseFactor");
    if (v3 != 1.0)
    {
      self->_flags._preloadingScheduled = 1;
      objc_initWeak(&location, self);
      v4 = dispatch_time(0, 500000000);
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __61___TVStackTemplateController__scheduleNextPreloadConditional__block_invoke;
      v5[3] = &unk_24EB854F8;
      objc_copyWeak(&v6, &location);
      dispatch_after(v4, MEMORY[0x24BDAC9B8], v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_preloadNext
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[NSMutableArray firstObject](self->_preloadQueue, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_preloadQueue, "removeObjectAtIndex:", 0);
    -[_TVStackCommonTemplateController viewElement](self, "viewElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tv_adjustedWindowSize");
    v6 = v5;
    v8 = v7;

    objc_msgSend(v9, "preloadCellsInRect:", 0.0, 0.0, v6, v8);
    -[_TVStackTemplateController _scheduleNextPreloadConditional](self, "_scheduleNextPreloadConditional");
  }

}

- (void)_adjustedContentOffsetForRowIndex:(int64_t)a3 targetContentOffset:(CGPoint *)a4
{
  void *v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double contentHeight;
  CGFloat x;
  int64_t v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _BOOL4 v34;
  _BOOL4 v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _BOOL4 v49;
  double v50;
  uint64_t v51;
  _BOOL4 v52;
  double v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  _BOOL4 requiresShowcasing;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  int v65;
  int v66;
  double v67;
  _BOOL4 v68;
  int64_t v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  CGPoint *v82;
  void *v83;
  void *v84;
  CGFloat v85;
  uint64_t v86;
  double v87;
  _BOOL4 v88;
  CGFloat y;
  double v90;
  CGFloat v91;
  double v92;
  CGPoint *v93;
  double v94;
  double v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  uint64_t v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;

  -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tv_isFocusOnNonOwnedCell");

  if ((v9 & 1) != 0)
    goto LABEL_99;
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  objc_msgSend(v10, "contentInset");
  v14 = v13;
  v16 = v15;
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentOffset");
  v90 = v18;

  contentHeight = self->_contentHeight;
  x = a4->x;
  y = a4->y;
  v21 = a3 - 1;
  v93 = a4;
  if (a3 < 1)
  {
    v23 = 0.0;
  }
  else
  {
    v22 = 0;
    v23 = 0.0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "rowMetrics");
        v26 = *((double *)&v138 + 1);
      }
      else
      {
        v141 = 0u;
        v142 = 0u;
        v139 = 0u;
        v140 = 0u;
        v26 = 0.0;
        v138 = 0u;
      }
      v23 = v23 + v26;

      ++v22;
    }
    while (a3 != v22);
  }
  -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", a3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    objc_msgSend(v27, "rowMetrics");
    v29 = *((_QWORD *)&v133 + 1);
  }
  else
  {
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v133 = 0u;
    v29 = 0;
  }
  v86 = v29;
  v30 = v16 + contentHeight;

  if (-[NSArray count](self->_stackSections, "count"))
  {
    v31 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", v31, v86);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "firstRowIndex") <= a3)
      {
        v33 = objc_msgSend(v32, "firstRowIndex");
        if (objc_msgSend(v32, "rowCount") + v33 > a3)
          break;
      }

      if (++v31 >= -[NSArray count](self->_stackSections, "count"))
        goto LABEL_18;
    }
    if ((objc_msgSend(v7, "isBounded") & 1) != 0)
    {
      v34 = 1;
      v35 = 1;
    }
    else
    {
      v34 = objc_msgSend(v32, "firstRowIndex") == a3;
      v36 = objc_msgSend(v32, "firstRowIndex");
      v35 = v36 + objc_msgSend(v32, "rowCount") - 1 == a3;
    }
    v88 = v35;

  }
  else
  {
LABEL_18:
    v34 = 0;
    v88 = 0;
    v31 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v92 = -v14;
  v37 = v30 - v12;
  v132 = 0;
  v130 = 0u;
  v131 = 0u;
  v91 = x;
  if (v7)
  {
    objc_msgSend(v7, "rowMetrics");
    *(_QWORD *)&v131 = *((_QWORD *)&v125 + 1);
    *((_QWORD *)&v131 + 1) = a3;
    v132 = 1;
    objc_msgSend(v7, "rowMetrics");
    objc_msgSend(v7, "rowMetrics");
    objc_msgSend(v7, "rowMetrics");
    v38 = *((double *)&v120 + 1) - (*(double *)&v116 + *((double *)&v111 + 1));
    objc_msgSend(v7, "rowMetrics");
    v39 = *(double *)&v106;
  }
  else
  {
    v128 = 0uLL;
    v129 = 0uLL;
    v126 = 0uLL;
    v127 = 0uLL;
    v124 = 0uLL;
    v125 = 0uLL;
    v120 = 0uLL;
    v121 = 0uLL;
    v122 = 0uLL;
    v123 = 0uLL;
    v115 = 0uLL;
    v116 = 0uLL;
    v117 = 0uLL;
    v118 = 0uLL;
    v119 = 0uLL;
    v113 = 0uLL;
    v114 = 0uLL;
    v111 = 0uLL;
    v112 = 0uLL;
    v109 = 0uLL;
    v110 = 0uLL;
    v107 = 0uLL;
    v108 = 0uLL;
    v105 = 0uLL;
    v106 = 0uLL;
    v39 = 0.0;
    v38 = 0.0;
    *((_QWORD *)&v131 + 1) = a3;
    v132 = 1;
  }
  v40 = 0;
  v41 = fmax(v92, v37);
  v42 = v23 + v39 + v38 * 0.5;
  v43 = v42 - v90;
  v44 = v12 * 0.5;
  v45 = v93->y;
  if (v45 != v92 && v45 != v41)
  {
    v40 = 1;
    if (v45 == v90 && v14 + v45 <= v23)
    {
      v46 = v12 + v45 - v16;
      if (v7)
      {
        v47 = v41;
        objc_msgSend(v7, "rowMetrics");
        v41 = v47;
        v48 = *((double *)&v100 + 1);
      }
      else
      {
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v100 = 0u;
        v48 = 0.0;
      }
      v40 = v46 < v23 + v48;
    }
  }
  if (v34 && v43 >= v44)
  {
    v49 = v42 - v90 < v12 * 0.5;
    v50 = v41;
    v51 = 0;
LABEL_42:
    v53 = y;
    -[_TVStackTemplateController scrollStopForEnteringSectionAtIndex:fromEdge:](self, "scrollStopForEnteringSectionAtIndex:fromEdge:", v31, v51, v86);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  v52 = v43 < v44 && v88;
  v49 = v42 - v90 < v12 * 0.5;
  v50 = v41;
  if (v52)
  {
    v51 = 1;
    goto LABEL_42;
  }
  v54 = 0;
  v53 = y;
LABEL_44:
  if (v54)
    v55 = 0;
  else
    v55 = v40;
  if (!v55)
    goto LABEL_55;
  -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", v31);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v56, "firstRowIndex") != a3)
  {

    goto LABEL_59;
  }
  requiresShowcasing = self->_requiresShowcasing;

  if (requiresShowcasing)
  {
    while (v31-- >= 1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", v31);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "showcaseSectionHeight");
      v61 = v60;

      if (v61 > 1.0)
        goto LABEL_59;
    }
    -[_TVStackTemplateController scrollStopForShowcaseTransition](self, "scrollStopForShowcaseTransition");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_55:
    if (v54)
    {
      -[_TVStackTemplateController _offsetToScrollStop:](self, "_offsetToScrollStop:", v54);
      v63 = 0.0;
      if (v62 > v42)
        v63 = v12;
      v53 = fmax(v92, fmin(v50, v62 - v63));

      goto LABEL_88;
    }
  }
LABEL_59:
  if (!v40)
    goto LABEL_88;
  if (!objc_msgSend(v7, "isHosted"))
    goto LABEL_88;
  v53 = -v14;
  if (!-[_TVStackTemplateController _didExtendContentForPeekMetrics:above:initial:](self, "_didExtendContentForPeekMetrics:above:initial:", &v130, 1, 1))goto LABEL_88;
  v53 = v50;
  if (!-[_TVStackTemplateController _didExtendContentForPeekMetrics:above:initial:](self, "_didExtendContentForPeekMetrics:above:initial:", &v130, 0, 1))goto LABEL_88;
  v64 = floor((v12 - *(double *)&v131) * 0.5);
  if (v64 > 45.0)
  {
    v65 = 0;
    v66 = v49;
    while (1)
    {
      v97 = v130;
      v98 = v131;
      v99 = v132;
      if (-[_TVStackTemplateController _didExtendContentForPeekMetrics:above:initial:](self, "_didExtendContentForPeekMetrics:above:initial:", &v97, (v66 ^ 1) & 1, 0, v86)&& (v67 = floor((v12 - *(double *)&v98) * 0.5), v67 >= 45.0))
      {
        v130 = v97;
        v131 = v98;
        v132 = v99;
        v64 = v67;
      }
      else
      {
        v68 = v64 <= *(double *)&v130;
        if (v64 > *((double *)&v130 + 1))
          v68 = 0;
        if (((v68 | v65) & 1) != 0)
          break;
        v65 = 1;
        v66 ^= 1u;
        v67 = v64;
      }
      if (v67 <= 45.0)
        goto LABEL_75;
    }
  }
  v67 = v64;
LABEL_75:
  v69 = *((_QWORD *)&v131 + 1);
  v70 = v23;
  if (v21 > *((uint64_t *)&v131 + 1))
  {
    v70 = v23;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", v21, v86);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v71;
      if (v71)
      {
        objc_msgSend(v71, "rowMetrics");
        v73 = *((double *)&v96 + 1);
      }
      else
      {
        v73 = 0.0;
        v96 = 0u;
      }
      v70 = v70 - v73;

      --v21;
    }
    while (v21 > v69);
  }
  v74 = *(double *)&v130;
  -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", v69, v86);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75;
  if (v74 > 0.0)
  {
    if (v75)
    {
      objc_msgSend(v75, "rowMetrics");
      v77 = v95;
      goto LABEL_87;
    }
LABEL_86:
    v77 = 0.0;
    goto LABEL_87;
  }
  if (!v75)
    goto LABEL_86;
  objc_msgSend(v75, "rowMetrics");
  v77 = v94;
LABEL_87:

  v53 = fmin(fmax(v92, v70 - v77 - v67), v50);
LABEL_88:
  -[_TVStackTemplateController _scrollableBoundsInset](self, "_scrollableBoundsInset", v86);
  v79 = v78;
  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "style");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v81, "edgeFlagForStyle:", CFSTR("tv-scrollable-bounds-inset")) & 1) != 0 && v53 < v12 - v14)
  {

    v82 = v93;
    if (v12 - v14 + -45.0 >= v23 + v87)
      v53 = -v14;
  }
  else
  {

    v82 = v93;
  }
  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "style");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v84, "edgeFlagForStyle:", CFSTR("tv-scrollable-bounds-inset")) & 4) != 0
    && v12 + v53 > v12 + v50 - v79)
  {

    v85 = v91;
    if (v50 + 45.0 <= v23)
      v53 = v50;
  }
  else
  {

    v85 = v91;
  }
  v82->x = v85;
  v82->y = v53;

LABEL_99:
}

- (UIEdgeInsets)_scrollableBoundsInset
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tv_scrollableBoundsInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (BOOL)_didExtendContentForPeekMetrics:(id *)a3 above:(BOOL)a4 initial:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v8;
  NSUInteger location;
  void *v10;
  void *v11;
  double v12;
  char v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v23;

  v23 = a5;
  v5 = a4;
  if (a4)
    v8 = -1;
  else
    v8 = 1;
  location = a3->var3.location;
  if (!a4)
    location = location + a3->var3.length - 1;
  -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", location);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = 0.0;
  if (!v23)
  {
    if (v10)
      objc_msgSend(v10, "rowMetrics");
    v12 = 0.0 - 0.0;
  }
  v13 = 0;
  v14 = location + v8;
  if (v14 >= 0)
  {
    v15 = -v14;
    while (v14 < -[NSArray count](self->_stackRows, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
        objc_msgSend(v16, "rowMetrics");
      v18 = a3->var3.location;
      if (v5)
      {
        v19 = v15 + a3->var3.length + v18;
        a3->var3.location = v14;
      }
      else
      {
        v19 = v14 - v18 + 1;
      }
      a3->var3.length = v19;
      if (!v23
        || !objc_msgSend(v11, "isBounded")
        || (v20 = objc_msgSend(v11, "sectionIndex"), v20 != objc_msgSend(v17, "sectionIndex")))
      {
        a3->var2 = a3->var2 + v12 + 0.0;
        v21 = 8;
        if (v5)
          v21 = 0;
        *(double *)((char *)&a3->var0 + v21) = 0.0 - (0.0 + 0.0);

        v13 = 1;
        break;
      }
      a3->var2 = a3->var2 + v12 + 0.0;
      v13 = 1;
      v12 = 0.0;

      v14 += v8;
      v15 -= v8;
      if (v14 < 0)
        break;
    }
  }

  return v13 & 1;
}

- (double)_maxViewWidth
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tv_adjustedWindowSize");
  v5 = v4;

  return v5;
}

- (void)_invalidateSectionMetricsIfNeeded
{
  void *v3;
  void *v4;
  _TVStackViewFlowLayoutInvalidationContext *v5;

  if (self->_shouldInvalidateMetrics)
  {
    self->_shouldInvalidateMetrics = 0;
    v5 = objc_alloc_init(_TVStackViewFlowLayoutInvalidationContext);
    -[_TVStackViewFlowLayoutInvalidationContext setInvalidateSectionMetrics:](v5, "setInvalidateSectionMetrics:", 1);
    -[_TVStackCommonTemplateController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collectionViewLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateLayoutWithContext:", v5);

    -[_TVStackTemplateController _updateBackgroundTintView](self, "_updateBackgroundTintView");
  }
}

- (void)_buildStackSections
{
  BOOL requiresShowcasing;
  uint64_t v4;
  uint64_t v5;
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  IKChangeSet *v19;
  IKChangeSet *filteredChangeSet;
  NSArray *v21;
  NSArray *viewControllers;
  _TVStackRow *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSArray *v28;
  id v29;
  id v30;
  double v31;
  double v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  char *v54;
  double *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  NSArray *stackSections;
  uint64_t v64;
  NSArray *stackRows;
  void *v66;
  id v67;
  id v68;
  _TVStackRow *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSArray *v74;
  _TVStackTemplateController *v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  _BOOL4 v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  id v87;
  _TVStackTemplateController *v88;
  id v89;
  id v90;
  _OWORD v91[5];
  _QWORD v92[5];
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  BOOL v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  requiresShowcasing = self->_requiresShowcasing;
  v79 = requiresShowcasing;
  -[_TVStackTemplateController _maxViewWidth](self, "_maxViewWidth");
  v5 = v4;
  v6 = self->_unfilteredViewControllers;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (2 * -[NSArray count](v6, "count")) | 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v6, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v6, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v6, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = MEMORY[0x24BDAC760];
  v92[1] = 3221225472;
  v92[2] = __49___TVStackTemplateController__buildStackSections__block_invoke;
  v92[3] = &unk_24EB88D80;
  v92[4] = self;
  v99 = v5;
  v106 = requiresShowcasing;
  v13 = v11;
  v93 = v13;
  v14 = v12;
  v94 = v14;
  v15 = v9;
  v95 = v15;
  v100 = 1;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0;
  v16 = v8;
  v96 = v16;
  v17 = v7;
  v97 = v17;
  v18 = v10;
  v98 = v18;
  v74 = v6;
  -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v92);
  v70 = v18;
  v19 = (IKChangeSet *)objc_msgSend(objc_alloc(MEMORY[0x24BE51968]), "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, v18, 0, 0);
  filteredChangeSet = self->_filteredChangeSet;
  self->_filteredChangeSet = v19;

  v72 = v15;
  v21 = (NSArray *)objc_msgSend(v15, "copy");
  viewControllers = self->_viewControllers;
  v75 = self;
  self->_viewControllers = v21;

  v23 = objc_alloc_init(_TVStackRow);
  memset((char *)v91 + 8, 0, 72);
  *(_QWORD *)&v91[0] = 1;
  -[_TVStackRow setRowMetrics:](v23, "setRowMetrics:", v91);
  v69 = v23;
  objc_msgSend(v16, "addObject:", v23);
  v73 = v13;
  +[TVMLUtilities rowSpacingMetricsForRowMetrics:](TVMLUtilities, "rowSpacingMetricsForRowMetrics:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  v71 = v14;
  if (v79)
  {
    +[TVMLUtilities rowSpacingMetricsForRowMetrics:forShowcase:](TVMLUtilities, "rowSpacingMetricsForRowMetrics:forShowcase:", v14, 1);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = v24;
  }
  v27 = v26;
  v28 = self->_viewControllers;
  v85[0] = MEMORY[0x24BDAC760];
  v85[1] = 3221225472;
  v85[2] = __49___TVStackTemplateController__buildStackSections__block_invoke_2;
  v85[3] = &unk_24EB88DA8;
  v29 = v17;
  v86 = v29;
  v30 = v16;
  v87 = v30;
  v88 = self;
  v68 = v25;
  v89 = v68;
  v67 = v27;
  v90 = v67;
  -[NSArray enumerateObjectsUsingBlock:](v28, "enumerateObjectsUsingBlock:", v85);
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "bounds");
  v32 = v31;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v33 = v29;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v81, v107, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v82;
    v37 = 0.0;
    v76 = *(_QWORD *)v82;
    v77 = v33;
    do
    {
      v38 = 0;
      v78 = v35;
      do
      {
        if (*(_QWORD *)v82 != v36)
          objc_enumerationMutation(v33);
        v39 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v38);
        v40 = objc_msgSend(v39, "firstRowIndex");
        v80 = v39;
        v41 = objc_msgSend(v39, "rowCount");
        if (v41 >= 2)
        {
          v42 = v41;
          objc_msgSend(v30, "objectAtIndexedSubscript:", v40);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isBounded");

          if (v44)
          {
            objc_msgSend(v80, "sectionHeight");
            v46 = v45;
            v47 = v40 - 1;
            v48 = -1;
            do
            {
              v49 = v48;
              if (v48 >= 0)
                v50 = v42 - 1;
              else
                v50 = 0;
              v51 = v50 + v47;
              do
              {
                if ((v51 & 0x8000000000000000) != 0 || v51 >= objc_msgSend(v30, "count"))
                  break;
                memset(v91, 0, sizeof(v91));
                objc_msgSend(v30, "objectAtIndexedSubscript:", v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v52;
                if (v52)
                  objc_msgSend(v52, "rowMetrics");
                else
                  memset(v91, 0, sizeof(v91));

                v54 = (char *)&v91[1] + 8;
                if (v49 >= 0)
                  v54 = (char *)&v91[1];
                v51 += v49;
                v55 = *(_QWORD *)&v91[0] == 1 ? (double *)((char *)v91 + 8) : (double *)v54;
                v46 = v46 + *v55;
              }
              while (*(_QWORD *)&v91[0] == 1);
              v48 = v49 + 2;
              v47 += 2;
            }
            while (v49 < 0);
            v36 = v76;
            v33 = v77;
            v35 = v78;
            if ((v32 - v46) * 0.5 < 45.0)
            {
              do
              {
                objc_msgSend(v30, "objectAtIndexedSubscript:", v40);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "setBounded:", 0);

                ++v40;
                --v42;
              }
              while (v42);
            }
          }
        }
        objc_msgSend(v80, "sectionSpacing");
        v58 = v57;
        objc_msgSend(v80, "sectionHeight");
        v60 = v58 + v59;
        objc_msgSend(v80, "sectionSpacing");
        v37 = v37 + v60 + v61;
        ++v38;
      }
      while (v38 != v35);
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v81, v107, 16);
    }
    while (v35);
  }
  else
  {
    v37 = 0.0;
  }

  v75->_shouldInvalidateMetrics = !-[NSArray isEqualToArray:](v75->_stackRows, "isEqualToArray:", v30);
  v75->_contentHeight = v37;
  v62 = objc_msgSend(v33, "copy");
  stackSections = v75->_stackSections;
  v75->_stackSections = (NSArray *)v62;

  v64 = objc_msgSend(v30, "copy");
  stackRows = v75->_stackRows;
  v75->_stackRows = (NSArray *)v64;

  -[_TVStackTemplateController didUpdateSectionInfo](v75, "didUpdateSectionInfo");
  -[_TVStackTemplateController _configureBackgroundTintView](v75, "_configureBackgroundTintView");

}

- (void)_updateFirstItemRowIndexes
{
  NSArray *viewControllers;
  uint64_t v4;
  _QWORD v5[6];

  -[_TVStackTemplateController _maxViewWidth](self, "_maxViewWidth");
  viewControllers = self->_viewControllers;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56___TVStackTemplateController__updateFirstItemRowIndexes__block_invoke;
  v5[3] = &unk_24EB85880;
  v5[5] = v4;
  v5[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](viewControllers, "enumerateObjectsUsingBlock:", v5);
}

- (double)_offsetToScrollStop:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double contentHeight;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  v4 = a3;
  if (objc_msgSend(v4, "sectionIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_TVStackCommonTemplateController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentInset");
    v7 = v6;
    v9 = v8;

    if (objc_msgSend(v4, "edge"))
      contentHeight = self->_contentHeight;
    else
      contentHeight = 0.0;
    v19 = objc_msgSend(v4, "edge");
    v20 = -v9;
    if (!v19)
      v20 = v7;
    v21 = contentHeight - v20;
    objc_msgSend(v4, "offset");
    v23 = v22 + v21;
  }
  else
  {
    if (objc_msgSend(v4, "sectionIndex") < 1)
    {
      v12 = 0.0;
    }
    else
    {
      v11 = 0;
      v12 = 0.0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sectionSpacing");
        v15 = v14;
        objc_msgSend(v13, "sectionHeight");
        v17 = v15 + v16;
        objc_msgSend(v13, "sectionSpacing");
        v12 = v12 + v17 + v18;

        ++v11;
      }
      while (v11 < objc_msgSend(v4, "sectionIndex"));
    }
    -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", objc_msgSend(v4, "sectionIndex"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sectionSpacing");
    v26 = v25;
    if (objc_msgSend(v4, "edge") == 1)
    {
      objc_msgSend(v24, "sectionHeight");
      v28 = v27;
      if (v24)
      {
        objc_msgSend(v24, "compoundRowMetrics");
        v29 = *((double *)&v40 + 1);
      }
      else
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v39 = 0u;
        v29 = 0.0;
      }
      v30 = v28 - v29;
    }
    else if (v24)
    {
      objc_msgSend(v24, "compoundRowMetrics");
      v30 = *(double *)&v35;
    }
    else
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
      v30 = 0.0;
    }
    v31 = v26 + v30;
    objc_msgSend(v4, "offset", v34, v35, v36, v37, v38, v39, v40, v41, v42, v43);
    v23 = v12 + v31 + v32;

  }
  return v23;
}

- (void)_configureBackgroundTintView
{
  UIViewController **p_backdropTintViewController;
  UIViewController *backdropTintViewController;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  UIView *v16;
  UIView *backdropTintView;
  void *v18;
  UIView *v19;
  void *v20;
  void *v21;
  void *v22;
  id *location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  p_backdropTintViewController = &self->_backdropTintViewController;
  backdropTintViewController = self->_backdropTintViewController;
  self->_backdropTintViewController = 0;

  if (-[NSArray count](self->_viewControllers, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = self->_viewControllers;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      location = (id *)p_backdropTintViewController;
      v8 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v10, "tv_associatedIKViewElement", location);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "attributes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("markBackgroundSegment"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "BOOLValue");

          if (v14)
          {
            p_backdropTintViewController = (UIViewController **)location;
            objc_storeStrong(location, v10);
            goto LABEL_13;
          }

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v7)
          continue;
        break;
      }
      v11 = 0;
      p_backdropTintViewController = (UIViewController **)location;
    }
    else
    {
      v11 = 0;
    }
LABEL_13:

    if (*p_backdropTintViewController)
    {
      if (self->_backdropTintView)
      {
        -[_TVStackTemplateController _updateBackgroundTintView](self, "_updateBackgroundTintView");
      }
      else
      {
        v15 = objc_alloc(MEMORY[0x24BDF6F90]);
        v16 = (UIView *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        backdropTintView = self->_backdropTintView;
        self->_backdropTintView = v16;

        -[UIView setAutoresizingMask:](self->_backdropTintView, "setAutoresizingMask:", 50);
        -[UIView setUserInteractionEnabled:](self->_backdropTintView, "setUserInteractionEnabled:", 0);
        if (-[_TVStackTemplateController isViewLoaded](self, "isViewLoaded"))
        {
          -[_TVStackCommonTemplateController collectionView](self, "collectionView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "insertSubview:atIndex:", self->_backdropTintView, 0);

        }
      }
      v19 = self->_backdropTintView;
      objc_msgSend(v11, "style");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "tv_backgroundColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "color");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v22);

    }
    else
    {
      -[_TVStackTemplateController _updateBackgroundTintView](self, "_updateBackgroundTintView");
    }

  }
}

- (void)_updateBackgroundTintView
{
  NSUInteger v3;
  UIViewController *backdropTintViewController;
  UIView *backdropTintView;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  UIView *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  UIView *v21;

  if (self->_backdropTintViewController)
  {
    v3 = -[NSArray indexOfObject:](self->_viewControllers, "indexOfObject:");
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UIView removeFromSuperview](self->_backdropTintView, "removeFromSuperview");
      backdropTintViewController = self->_backdropTintViewController;
      self->_backdropTintViewController = 0;

      backdropTintView = self->_backdropTintView;
      self->_backdropTintView = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v3);
      v21 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[_TVStackCommonTemplateController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      v8 = v7;
      v10 = v9;

      -[_TVStackCommonTemplateController collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layoutAttributesForItemAtIndexPath:", v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "frame");
      v14 = v13;
      -[_TVStackTemplateController _maxContentSize](self, "_maxContentSize");
      -[UIView setFrame:](self->_backdropTintView, "setFrame:", v8, v14, v10, fmax(v15 - v14, 0.0));
      v16 = self->_backdropTintView;
      if (v16)
      {
        -[_TVStackCommonTemplateController collectionView](self, "collectionView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[UIView isDescendantOfView:](v16, "isDescendantOfView:", v17);

        if (!v18)
        {
          -[_TVStackCommonTemplateController collectionView](self, "collectionView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "insertSubview:atIndex:", self->_backdropTintView, 0);

        }
      }
      -[_TVStackCommonTemplateController collectionView](self, "collectionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sendSubviewToBack:", self->_backdropTintView);

      -[_TVStackTemplateController _updateBackgroundTintViewEffects](self, "_updateBackgroundTintViewEffects");
      backdropTintView = v21;
    }
  }
  else
  {
    -[UIView removeFromSuperview](self->_backdropTintView, "removeFromSuperview");
    backdropTintView = self->_backdropTintView;
    self->_backdropTintView = 0;
  }

}

- (void)_updateBackgroundTintViewEffects
{
  UIView *backdropTintView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;

  backdropTintView = self->_backdropTintView;
  if (backdropTintView)
  {
    -[UIView frame](backdropTintView, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    -[_TVStackTemplateController _maxContentSize](self, "_maxContentSize");
    v11 = v10;
    -[UIView frame](self->_backdropTintView, "frame");
    v13 = fmax(v11 - v12, 0.0);
    if (v13 > 0.0)
    {
      -[_TVStackCommonTemplateController collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contentSize");
      v16 = v15;
      -[_TVStackCommonTemplateController collectionView](self, "collectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v19 = v16 - v18;
      -[_TVStackCommonTemplateController collectionView](self, "collectionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "contentInset");
      v22 = v19 - v21;

      -[_TVStackCommonTemplateController collectionView](self, "collectionView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contentOffset");
      v25 = v24;

      if (v25 > v22)
      {
        -[_TVStackCommonTemplateController collectionView](self, "collectionView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "contentOffset");
        v13 = v13 + v27 - v22;

      }
    }
    -[UIView setFrame:](self->_backdropTintView, "setFrame:", v5, v7, v9, v13);
  }
}

- (CGSize)_maxContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;

  -[_TVStackTemplateController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  if (v5 < v8)
    v5 = v8;
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentSize");
  v11 = v10;

  -[_TVStackTemplateController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;

  if (v11 >= v14)
    v15 = v11;
  else
    v15 = v14;
  v16 = v5;
  result.height = v15;
  result.width = v16;
  return result;
}

- (double)showcaseInset
{
  return self->_showcaseInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropTintView, 0);
  objc_storeStrong((id *)&self->_backdropTintViewController, 0);
  objc_storeStrong((id *)&self->_needsMoreContentEvaluator, 0);
  objc_storeStrong((id *)&self->_lastFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_stackRows, 0);
  objc_storeStrong((id *)&self->_stackSections, 0);
  objc_storeStrong((id *)&self->_preloadQueue, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_filteredChangeSet, 0);
  objc_storeStrong((id *)&self->_unfilteredViewControllers, 0);
}

@end
