@implementation SPUISearchViewController

- (BOOL)sectionShouldBeExpanded:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  char v8;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE84AE8]))
  {
    objc_msgSend(v3, "results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "renderHorizontallyWithOtherResultsInCategory");

    if (!v7)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend((id)objc_opt_class(), "spotlightUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "BOOLForKey:", CFSTR("SpotlightZKWExpanded"));
  }
  else
  {
    v8 = 0;
  }

LABEL_7:
  return v8;
}

- (BOOL)isInStateRestoration
{
  void *v2;
  char v3;

  objc_msgSend((id)objc_opt_class(), "spotlightUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("RestorationCurrentState"));

  return v3;
}

+ (id)spotlightUserDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
}

- (BOOL)hasContentInSearchField
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[SPUISearchViewController currentQuery](self, "currentQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchEntity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6 != 0;

  }
  return v4;
}

- (NSString)currentQuery
{
  void *v2;
  void *v3;

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateFocusResult:cardSection:focusIsOnFirstResult:", v7, v6, objc_msgSend(v8, "isHighlighting"));

}

- (void)willUpdateFromResultsWithHighlightedResult:(id)a3 viewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double Height;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  CGRect v32;
  CGRect v33;

  v31 = a4;
  v6 = a3;
  if (-[SPUISearchViewController hasContentInSearchField](self, "hasContentInSearchField")
    && (-[SPUIViewController searchResultViewController](self, "searchResultViewController"),
        v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == v31))
  {
    -[SPUIViewController searchResultViewController](self, "searchResultViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v15 = CGRectEqualToRect(v32, *MEMORY[0x24BDBF090]);

    if (v15)
    {
      -[SPUISearchViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frame");
      v18 = v17;
      v20 = v19;
      v22 = v21;

      -[SPUISearchViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "tlks_screen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");
      Height = CGRectGetHeight(v33);

      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setFrame:", v18, v20, v22, Height);

      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "layoutBelowIfNeeded");

    }
    if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow")
      && objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode"))
    {
      -[SPUISearchViewController invalidateWindowExpansionTimer](self, "invalidateWindowExpansionTimer");
      if (-[SPUISearchViewController currentQueryIdMatchesResultInGeneralModel](self, "currentQueryIdMatchesResultInGeneralModel"))
      {
        -[SPUISearchViewController scheduleWindowExpansionWithInterval:](self, "scheduleWindowExpansionWithInterval:", 0.5);
      }
    }
    else
    {
      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIViewController activateViewController:animate:](self, "activateViewController:animate:", v30, 0);

    }
  }
  else
  {
    -[SPUISearchViewController windowExpansionTimer](self, "windowExpansionTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    -[SPUISearchViewController setWindowExpansionTimer:](self, "setWindowExpansionTimer:", 0);
  }
  objc_msgSend(MEMORY[0x24BE85288], "cardForRenderingResult:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cardSections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateFocusResult:cardSection:focusIsOnFirstResult:", v6, v12, 1);

}

- (NSTimer)windowExpansionTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setWindowExpansionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUISearchViewController;
  -[SPUISearchViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SPUISearchViewController updatePlatterMode](self, "updatePlatterMode");
}

- (void)didUpdateActiveViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SPUISearchViewController;
  -[SPUIViewController didUpdateActiveViewController](&v9, sel_didUpdateActiveViewController);
  -[SPUISearchViewController updateResponderChainIfNeeded](self, "updateResponderChainIfNeeded");
  v3 = (void *)MEMORY[0x24BEBD5D8];
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusSystemForEnvironment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestFocusUpdateToEnvironment:", v8);

}

- (void)didUpdateContentScrolledOffScreenStatus:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v5 = a3;
  -[SPUISearchViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
  {
    -[SPUISearchViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showSeparator:animated:", objc_msgSend(v8, "navigationMode") != 0, 0);

  }
  else
  {
    objc_msgSend(v9, "showSeparator:animated:", v5, v4);
  }

}

- (void)resultsViewController:(id)a3 didChangeContentSize:(CGSize)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v7 = a3;
  -[SPUIViewController activeViewController](self, "activeViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[SPUISearchViewController sizingDelegate](self, "sizingDelegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v10, "didInvalidateSizeAnimated:", 1);
    }
    else
    {
      -[SPUISearchViewController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didInvalidateSizeAnimated:", objc_msgSend(v9, "navigationMode") == 5);

    }
  }
}

- (SPUISearchViewControllerSizingDelegate)sizingDelegate
{
  return (SPUISearchViewControllerSizingDelegate *)objc_loadWeakRetained((id *)&self->_sizingDelegate);
}

- (id)createAdditionalHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDelegate:", self);
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLegibilitySettings:", v5);

  -[SPUISearchViewController allHeaderViews](self, "allHeaderViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v3);

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = objc_claimAutoreleasedReturnValue();

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tokens");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 >= 2)
  {
    v14 = MEMORY[0x24BEB0818];
    v15 = *(NSObject **)(MEMORY[0x24BEB0818] + 8);
    if (!v15)
    {
      SPUIInitLogging();
      v15 = *(NSObject **)(v14 + 8);
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SPUISearchViewController createAdditionalHeaderView].cold.1();
  }
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "searchField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tokens");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = objc_claimAutoreleasedReturnValue();

  if (v9 | v19)
    objc_msgSend((id)objc_opt_class(), "_updateHeaderView:fromText:fromToken:", v3, v9, v19);

  return v3;
}

- (void)searchViewWillPresentFromSource:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  double v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  id v51;
  SPUIResultsViewController *v52;
  void *v53;
  SPUIResultsViewController *v54;
  void *v55;
  void *v56;
  void *v57;
  SPUIResultsViewController *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  NSObject *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  SPUISearchViewController *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  unint64_t v98;
  _QWORD v99[4];
  id v100;
  _QWORD v101[5];
  id v102;
  _QWORD v103[5];
  SPUIResultsViewController *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  id v109;
  uint8_t buf[8];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  v5 = MEMORY[0x24BEB0818];
  v6 = *(void **)(MEMORY[0x24BEB0818] + 32);
  if (!v6)
  {
    SPUIInitLogging();
    v6 = *(void **)(v5 + 32);
  }
  v7 = v6;
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22E078000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "bringUp", (const char *)&unk_22E0A3E97, buf, 2u);
  }

  v8 = *(void **)(v5 + 40);
  if (!v8)
  {
    SPUIInitLogging();
    v8 = *(void **)(v5 + 40);
  }
  v9 = v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E078000, v9, OS_LOG_TYPE_DEFAULT, "bringUp start", buf, 2u);
  }

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "searchField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelectionGrabbersHiddenSafe:", a3 != 5);

  LOBYTE(v10) = -[SPUISearchViewController isInStateRestoration](self, "isInStateRestoration");
  -[SPUISearchViewController setIsInStateRestoration:](self, "setIsInStateRestoration:", 1);
  if ((v10 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x24BE85288];
    -[SPUISearchViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v12, "deviceIsAuthenticatedForView:", v11);

    if ((_DWORD)v12)
    {
      -[SPUISearchViewController restorationData](self, "restorationData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, &v109);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v109;
      if (v14 && objc_msgSend(v13, "length"))
      {
        v15 = *(NSObject **)(v5 + 40);
        if (!v15)
        {
          SPUIInitLogging();
          v15 = *(NSObject **)(v5 + 40);
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[SPUISearchViewController searchViewWillPresentFromSource:].cold.1((uint64_t)v14, v15);
      }
      -[SPUISearchViewController timeAtDismissal](self, "timeAtDismissal");
      if (v16 == 0.0)
        objc_msgSend(v11, "timeAtDismissal");
      -[SPUISearchViewController setTimeAtDismissal:](self, "setTimeAtDismissal:");
      v17 = -[SPUISearchViewController checkClearTimer](self, "checkClearTimer");
      if (v14 || v17)
      {
LABEL_48:

        goto LABEL_49;
      }
      v97 = v13;
      objc_msgSend(v11, "searchViewContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "searchString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = a3;
      if (objc_msgSend(v19, "length"))
      {

      }
      else
      {
        objc_msgSend(v11, "searchViewContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "searchEntity");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          objc_msgSend(v11, "viewControllerContexts");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "count");

          if (!v41)
          {
LABEL_31:
            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            objc_msgSend(v11, "viewControllerContexts");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
            if (v46)
            {
              v47 = v46;
              v48 = *(_QWORD *)v106;
              do
              {
                for (i = 0; i != v47; ++i)
                {
                  if (*(_QWORD *)v106 != v48)
                    objc_enumerationMutation(v45);
                  v50 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v51 = v50;
                    v52 = [SPUIResultsViewController alloc];
                    objc_msgSend(v51, "searchEntity");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    v54 = -[SPUIResultsViewController initWithSearchModel:searchEntity:](v52, "initWithSearchModel:searchEntity:", 0, v53);

                    -[SPUIResultsViewController setRestorationContext:](v54, "setRestorationContext:", v51);
                    -[SPUISearchViewController searchHeader](self, "searchHeader");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "searchField");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SearchUIResultsViewController setSearchField:](v54, "setSearchField:", v56);

                    v57 = (void *)MEMORY[0x24BEBDB00];
                    v103[0] = MEMORY[0x24BDAC760];
                    v103[1] = 3221225472;
                    v103[2] = __60__SPUISearchViewController_searchViewWillPresentFromSource___block_invoke;
                    v103[3] = &unk_24F9D6078;
                    v103[4] = self;
                    v104 = v54;
                    v58 = v54;
                    objc_msgSend(v57, "performWithoutAnimation:", v103);
                    -[SearchUIResultsViewController setFeedbackListener:](v58, "setFeedbackListener:", self);
                    -[SearchUIResultsViewController setCommandDelegate:](v58, "setCommandDelegate:", self);

                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      continue;
                    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE85238]), "initWithCard:feedbackListener:", 0, self);
                    objc_msgSend(v59, "setCommandDelegate:", self);
                    if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
                    {
                      objc_msgSend(v59, "setTextField:", 0);
                    }
                    else
                    {
                      -[SPUISearchViewController searchHeader](self, "searchHeader");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v60, "searchField");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v59, "setTextField:", v61);

                    }
                    -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "setShouldUseInsetRoundedSections:", objc_msgSend(v62, "shouldUseInsetRoundedSections"));

                    objc_msgSend(v59, "setRestorationContext:", v50);
                    v63 = (void *)MEMORY[0x24BEBDB00];
                    v101[0] = MEMORY[0x24BDAC760];
                    v101[1] = 3221225472;
                    v101[2] = __60__SPUISearchViewController_searchViewWillPresentFromSource___block_invoke_2;
                    v101[3] = &unk_24F9D6078;
                    v101[4] = self;
                    v102 = v59;
                    v51 = v59;
                    objc_msgSend(v63, "performWithoutAnimation:", v101);

                  }
                }
                v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
              }
              while (v47);
            }

            -[SPUISearchViewController navigationController](self, "navigationController");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "view");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "layoutIfNeeded");

            -[SPUISearchViewController searchHeader](self, "searchHeader");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "searchField");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "detokenizeIfNeededAndSearch:", 0);

            v68 = objc_msgSend(v11, "wantsGo");
            v5 = MEMORY[0x24BEB0818];
            v13 = v97;
            a3 = v98;
            v14 = 0;
            if (v68)
            {
              -[SPUISearchViewController searchHeader](self, "searchHeader");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "searchField");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "setReturnKeyType:", 1);

              +[SPUITextField updateBlueButton](SPUITextField, "updateBlueButton");
            }
            goto LABEL_48;
          }
          +[SPUISearchModel sharedFullZWKInstance](SPUISearchModel, "sharedFullZWKInstance");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "updateWithQueryContext:", 0);
          objc_msgSend(v38, "queryTask");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "query");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "queryIdent");
          -[SPUISearchViewController searchHeader](self, "searchHeader");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setQueryId:", v43);

LABEL_30:
          goto LABEL_31;
        }
      }
      -[SPUIViewController activeViewController](self, "activeViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 != v23)
      {
        -[SPUIViewController searchResultViewController](self, "searchResultViewController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPUIViewController activateViewController:animate:](self, "activateViewController:animate:", v24, 0);

        objc_msgSend(v11, "searchViewContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "searchString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPUIViewController searchResultViewController](self, "searchResultViewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setQueryString:", v26);

        -[SPUISearchViewController searchHeader](self, "searchHeader");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "searchViewContext");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "searchString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "searchViewContext");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "searchEntity");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "restoreSearchText:searchEntity:", v30, v32);

        objc_msgSend(v11, "searchViewContext");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "searchString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPUISearchViewController setQueryOnDismissal:](self, "setQueryOnDismissal:", v34);

      }
      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sections");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "count");

      if (v37)
        goto LABEL_31;
      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "searchViewContext");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setRestorationContext:", v39);
      goto LABEL_30;
    }
  }
LABEL_49:
  -[SPUISearchViewController setIsInStateRestoration:](self, "setIsInStateRestoration:", 0);
  +[SPUIFeedbackManager feedbackListener](SPUIFeedbackManager, "feedbackListener");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "updateParsecEnabled");

  -[SPUISearchViewController setTimeAtDismissal:](self, "setTimeAtDismissal:", 0.0);
  -[SPUISearchViewController setClearQueryOnDismissal:](self, "setClearQueryOnDismissal:", 0);
  -[SPUISearchViewController showVerticalScrollIndicators:](self, "showVerticalScrollIndicators:", 0);
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 <= 7 && ((1 << a3) & 0xE2) != 0)
  {
    v73 = 1;
  }
  else
  {
    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v11, "isFirstResponder");
  }
  objc_msgSend(v72, "showCancelButton:animated:", v73, 0);
  if (a3 > 7 || ((1 << a3) & 0xE2) == 0)

  -[SPUISearchViewController setPresentationMode:](self, "setPresentationMode:", a3);
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setHidden:", 0);

  -[SPUISearchViewController updatePlatterMode](self, "updatePlatterMode");
  -[SPUISearchViewController navigationController](self, "navigationController");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "updateFooterViewsIfNecessary");

  if (!-[SPUISearchViewController hasContentInSearchField](self, "hasContentInSearchField"))
  {
    v76 = *(void **)(v5 + 40);
    if (!v76)
    {
      SPUIInitLogging();
      v76 = *(void **)(v5 + 40);
    }
    v77 = v76;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E078000, v77, OS_LOG_TYPE_DEFAULT, "field is empty", buf, 2u);
    }

    -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "sections");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "count");

    if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow")
      && (-[SPUISearchViewController navigationController](self, "navigationController"),
          v81 = (void *)objc_claimAutoreleasedReturnValue(),
          v82 = objc_msgSend(v81, "navigationMode"),
          v81,
          !v82)
      || v80)
    {
      -[SPUISearchViewController searchHeader](self, "searchHeader");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "updateFocusResult:cardSection:focusIsOnFirstResult:", 0, 0, 1);
    }
    else
    {
      -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "refreshResultsWithContext:allowPartialUpdates:", 0, 1);

      -[SPUISearchViewController searchHeader](self, "searchHeader");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setQueryId:", v85);
    }

    v86 = *(void **)(v5 + 40);
    if (!v86)
    {
      SPUIInitLogging();
      v86 = *(void **)(v5 + 40);
    }
    v87 = v86;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E078000, v87, OS_LOG_TYPE_DEFAULT, "activating zkw", buf, 2u);
    }

    -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIViewController activateViewController:animate:](self, "activateViewController:animate:", v88, 0);

    if (+[SPUISearchFirstTimeViewController needsDisplay](SPUISearchFirstTimeViewController, "needsDisplay"))
    {
      v89 = *(NSObject **)(v5 + 40);
      if (!v89)
      {
        SPUIInitLogging();
        v89 = *(NSObject **)(v5 + 40);
      }
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E078000, v89, OS_LOG_TYPE_DEFAULT, "trying to activate FTE", buf, 2u);
      }
      -[SPUISearchViewController activateFirstTimeExperienceViewIfNecessary](self, "activateFirstTimeExperienceViewIfNecessary");
    }
  }
  if (-[SPUISearchViewController expandPlatterOnAppear](self, "expandPlatterOnAppear"))
    -[SPUISearchViewController expandWindowIfNeeded](self, "expandWindowIfNeeded");
  if (-[SPUISearchViewController presentationMode](self, "presentationMode") == 5)
  {
    -[SPUISearchViewController navigationController](self, "navigationController");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "topViewController");
    v91 = (SPUISearchViewController *)objc_claimAutoreleasedReturnValue();

    if (v91 == self)
    {
      -[SPUIViewController activeViewController](self, "activeViewController");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      if (v92 == v94)
      {
        -[SPUIViewController searchResultViewController](self, "searchResultViewController");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v93 = 0;
      }

    }
    else
    {
      -[SPUISearchViewController navigationController](self, "navigationController");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "topViewController");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v93, "view");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setAlpha:", 0.0);

      objc_msgSend(v93, "scrollAndSelectLastSelectedIndexPath");
      v96 = (void *)MEMORY[0x24BE85288];
      v99[0] = MEMORY[0x24BDAC760];
      v99[1] = 3221225472;
      v99[2] = __60__SPUISearchViewController_searchViewWillPresentFromSource___block_invoke_310;
      v99[3] = &unk_24F9D5CC8;
      v100 = v93;
      objc_msgSend(v96, "performAnimatableChanges:", v99);

    }
  }
}

- (void)setTimeAtDismissal:(double)a3
{
  self->_timeAtDismissal = a3;
}

- (void)setIsInStateRestoration:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "spotlightUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("RestorationCurrentState"));

}

- (void)updatePlatterMode
{
  void *v3;
  SPUISearchViewController *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[SPUISearchViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (SPUISearchViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
    goto LABEL_20;
  -[SPUISearchViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "navigationMode");

  -[SPUIViewController activeViewController](self, "activeViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {

    goto LABEL_9;
  }
  v9 = -[SPUISearchViewController presentationMode](self, "presentationMode");

  if (v9 != 6)
  {
LABEL_9:
    -[SPUIViewController activeViewController](self, "activeViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
    {
      v6 = 5;
    }
    else
    {
      -[SPUIViewController activeViewController](self, "activeViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {
        v6 = 1;
      }
      else
      {
        -[SPUIViewController activeViewController](self, "activeViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPUISearchViewController firstTimeExperienceViewController](self, "firstTimeExperienceViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 == v15)
          v6 = 2;
      }
    }
    goto LABEL_17;
  }
  if (+[SPUISearchFirstTimeViewController needsDisplay](SPUISearchFirstTimeViewController, "needsDisplay"))
  {
    if (+[SPUISearchFirstTimeViewController useZKWFTE](SPUISearchFirstTimeViewController, "useZKWFTE"))
      v6 = 5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
LABEL_17:
  if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
  {
    -[SPUISearchViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "showSeparator:animated:", v6 != 0, 0);
  }
  -[SPUISearchViewController navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNavigationMode:", v6);

LABEL_20:
  -[SPUISearchViewController updateResponderChainIfNeeded](self, "updateResponderChainIfNeeded");
}

- (void)updateResponderChainIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  -[SPUISearchViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[SPUIViewController activeViewController](self, "activeViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 == (void *)v5)
  {

  }
  else
  {
    v6 = (void *)v5;
    -[SPUIViewController activeViewController](self, "activeViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIViewController searchResultViewController](self, "searchResultViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
      goto LABEL_6;
  }
  -[SPUIViewController activeViewController](self, "activeViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "responderForKeyboardInput");
  v10 = objc_claimAutoreleasedReturnValue();

  v21 = (id)v10;
LABEL_6:
  -[SPUISearchViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SPUISearchViewController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "responderForKeyboardInput");
    v16 = objc_claimAutoreleasedReturnValue();

    v21 = (id)v16;
  }
  v17 = v21;
  if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
  {
    -[SPUISearchViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "navigationMode");

    if (v19)
      v17 = v21;
    else
      v17 = 0;
  }
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setResponderForKeyboardInput:", v17);

}

- (SPUISearchHeader)searchHeader
{
  return (SPUISearchHeader *)objc_getProperty(self, a2, 1024, 1);
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)showVerticalScrollIndicators:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", v3);

  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsVerticalScrollIndicator:", v3);

}

- (BOOL)checkClearTimer
{
  double v3;
  double Current;
  double v5;

  -[SPUISearchViewController timeAtDismissal](self, "timeAtDismissal");
  if (v3 == 0.0)
    return 0;
  Current = CFAbsoluteTimeGetCurrent();
  -[SPUISearchViewController timeAtDismissal](self, "timeAtDismissal");
  if (Current - v5 <= 480.0)
    return 0;
  -[SPUISearchViewController clearTimerExpired](self, "clearTimerExpired");
  return 1;
}

- (double)timeAtDismissal
{
  return self->_timeAtDismissal;
}

void __40__SPUISearchViewController_refreshTrial__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BEB4BB8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refresh");

  objc_msgSend(MEMORY[0x24BEB4BB8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "zkwOverrideValue");

  if (v4 == 1)
  {
    v5 = 0;
  }
  else
  {
    if (v4 != 2)
      return;
    v5 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "setExpansionValueForZKW:", v5);
}

- (void)willUpdateActiveViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPUISearchViewController;
  -[SPUIViewController willUpdateActiveViewController](&v3, sel_willUpdateActiveViewController);
  -[SPUISearchViewController updatePlatterMode](self, "updatePlatterMode");
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (void)setClearQueryOnDismissal:(BOOL)a3
{
  self->_clearQueryOnDismissal = a3;
}

- (NSData)restorationData
{
  return self->_restorationData;
}

- (BOOL)expandPlatterOnAppear
{
  return self->_expandPlatterOnAppear;
}

- (NSMutableSet)allHeaderViews
{
  return (NSMutableSet *)objc_getProperty(self, a2, 1032, 1);
}

- (id)currentQueryContext
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SPUISearchViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[SPUISearchViewController hasContentInSearchField](self, "hasContentInSearchField"))
      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
    else
      -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
  }
  objc_msgSend(v4, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)didBeginEditing
{
  void *v3;
  id v4;

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showCancelButton:animated:", 1, 1);

  -[SPUIViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchFieldDidFocus");

}

- (void)setFooterViewsForProactive:(id)a3 forResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFooterView:", v7);

  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFooterView:", v6);

}

- (double)distanceToTopOfAppIcons
{
  void *v2;
  double v3;
  double v4;

  -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distanceToTopOfAppIcons");
  v4 = v3;

  return v4;
}

- (SPUISearchViewController)init
{
  SPUISearchViewController *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SPUIProactiveResultsViewController *v18;
  void *v19;
  SPUIProactiveResultsViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  _QWORD v57[6];

  v57[4] = *MEMORY[0x24BDAC8D0];
  v55.receiver = self;
  v55.super_class = (Class)SPUISearchViewController;
  v2 = -[SPUIViewController init](&v55, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, -1);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("factorFetchQueue", v4);
    -[SPUISearchViewController setFactorsFetchingQueue:](v2, "setFactorsFetchingQueue:", v5);

    -[SPUISearchViewController refreshTrial](v2, "refreshTrial");
    v6 = (void *)objc_opt_new();
    -[SPUISearchViewController setView:](v2, "setView:", v6);

    v7 = (void *)objc_opt_new();
    -[SPUISearchViewController setAppIntentsQueryHelper:](v2, "setAppIntentsQueryHelper:", v7);

    v8 = (void *)MEMORY[0x24BEB0820];
    -[SPUISearchViewController appIntentsQueryHelper](v2, "appIntentsQueryHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB0820], "queryHelperKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerDependency:forKey:", v9, v10);

    v11 = (void *)MEMORY[0x24BEB0820];
    objc_msgSend(MEMORY[0x24BEB0820], "presentationHelperKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerDependency:forKey:", v2, v12);

    -[SPUISearchViewController setTimeAtDismissal:](v2, "setTimeAtDismissal:", 0.0);
    -[SPUISearchViewController view](v2, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsGroupOpacity:", 0);

    v15 = (void *)objc_opt_new();
    -[SPUISearchViewController setAllHeaderViews:](v2, "setAllHeaderViews:", v15);

    -[SPUIViewController searchResultViewController](v2, "searchResultViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCommandDelegate:", v2);

    -[SPUIViewController searchResultViewController](v2, "searchResultViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowHighlightingWhenInactive:", 1);

    v18 = [SPUIProactiveResultsViewController alloc];
    +[SPUISearchModel sharedFullZWKInstance](SPUISearchModel, "sharedFullZWKInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SPUIProactiveResultsViewController initWithSearchModel:searchEntity:](v18, "initWithSearchModel:searchEntity:", v19, 0);
    -[SPUISearchViewController setProactiveResultViewController:](v2, "setProactiveResultViewController:", v20);

    -[SPUISearchViewController proactiveResultViewController](v2, "proactiveResultViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", v2);

    -[SPUISearchViewController proactiveResultViewController](v2, "proactiveResultViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFeedbackListener:", v2);

    -[SPUISearchViewController proactiveResultViewController](v2, "proactiveResultViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCommandDelegate:", v2);

    -[SPUISearchViewController proactiveResultViewController](v2, "proactiveResultViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setShouldMonitorScrollingPastBottomOfContent:", 1);

    -[SPUISearchViewController createAdditionalHeaderView](v2, "createAdditionalHeaderView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchViewController setSearchHeader:](v2, "setSearchHeader:", v25);

    -[SPUISearchViewController searchHeader](v2, "searchHeader");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "searchField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchViewController proactiveResultViewController](v2, "proactiveResultViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSearchField:", v27);

    -[SPUISearchViewController searchHeader](v2, "searchHeader");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "searchField");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIViewController searchResultViewController](v2, "searchResultViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setSearchField:", v30);

    v32 = (void *)MEMORY[0x24BEB0820];
    -[SPUISearchViewController searchHeader](v2, "searchHeader");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "searchField");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "annotateSearchField:", v34);

    -[SPUISearchViewController proactiveResultViewController](v2, "proactiveResultViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIViewController activateViewController:animate:](v2, "activateViewController:animate:", v35, 0);

    objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3E0], 0, sel_escapeKeyCommand);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3E8], 0, sel_spotlight_leftArrowPressed);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setWantsPriorityOverSystemBehavior:", 1);
    objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3F0], 0, sel_spotlight_rightArrowPressed);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setWantsPriorityOverSystemBehavior:", 1);
    objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("b"), 0x100000, sel_performWebSearch);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v36;
    v57[1] = v37;
    v57[2] = v38;
    v57[3] = v39;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 4);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v52;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v52 != v43)
            objc_enumerationMutation(v40);
          -[SPUISearchViewController addKeyCommand:](v2, "addKeyCommand:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v44++), (_QWORD)v51);
        }
        while (v42 != v44);
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v42);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObserver:selector:name:object:", v2, sel_checkClearTimer, *MEMORY[0x24BEBE008], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObserver:selector:name:object:", v2, sel_spotlightDidBackground, *MEMORY[0x24BEBDF98], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObserver:selector:name:object:", v2, sel_dragInitiated, *MEMORY[0x24BE85298], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObserver:selector:name:object:", v2, sel_appIconDragged, *MEMORY[0x24BE85290], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)lockStateChanged_0, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, CFNotificationSuspensionBehaviorDrop);
    objc_msgSend(MEMORY[0x24BE85288], "prewarmApplicationLibrary");

  }
  return v2;
}

- (SPUIProactiveResultsViewController)proactiveResultViewController
{
  return (SPUIProactiveResultsViewController *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setTopBlurView:(id)a3
{
  objc_storeWeak((id *)&self->_topBlurView, a3);
}

- (void)setSearchHeader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (void)setProactiveResultViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (void)setFactorsFetchingQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (void)setAllHeaderViews:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (void)refreshTrial
{
  NSObject *v3;
  _QWORD block[5];

  -[SPUISearchViewController factorsFetchingQueue](self, "factorsFetchingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SPUISearchViewController_refreshTrial__block_invoke;
  block[3] = &unk_24F9D5CC8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (OS_dispatch_queue)factorsFetchingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setSizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sizingDelegate, a3);
}

- (void)setAdditionalKeyboardHeight:(double)a3
{
  void *v5;
  id v6;

  -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdditionalKeyboardHeight:", a3);

  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAdditionalKeyboardHeight:", a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)searchViewDidPresentFromSource:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  -[SPUIViewController searchResultViewController](self, "searchResultViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didPresentToResumeSearch:", 1);

  -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didPresentToResumeSearch:", 0);

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectionGrabbersHiddenSafe:", 0);

  if (-[SPUISearchViewController presentationMode](self, "presentationMode") != 5)
  {
    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "focusSearchFieldAndSelectAll:withReason:", -[SPUISearchViewController queryIdSameAsInvokeQueryIdentifier](self, "queryIdSameAsInvokeQueryIdentifier"), 1);

  }
  -[SPUISearchViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 1.0);

  -[SPUISearchViewController showVerticalScrollIndicators:](self, "showVerticalScrollIndicators:", 1);
  -[SPUISearchViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v13 = MEMORY[0x24BEB0818];
  if ((isKindOfClass & 1) != 0)
  {
    v14 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
    if (!v14)
    {
      SPUIInitLogging();
      v14 = *(NSObject **)(v13 + 40);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[SPUISearchViewController searchViewDidPresentFromSource:].cold.1();
    v15 = v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "_didFinishDismissal");

  }
  -[SPUISearchViewController topBlurView](self, "topBlurView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 1.0);

  dispatch_after(0, MEMORY[0x24BDAC9B8], &__block_literal_global_3);
  v17 = *(NSObject **)(v13 + 40);
  if (!v17)
  {
    SPUIInitLogging();
    v17 = *(NSObject **)(v13 + 40);
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E078000, v17, OS_LOG_TYPE_DEFAULT, "bringUp end", buf, 2u);
  }
  kdebug_trace();
  v18 = *(NSObject **)(v13 + 32);
  if (!v18)
  {
    SPUIInitLogging();
    v18 = *(NSObject **)(v13 + 32);
  }
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_22E078000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "bringUp", " enableTelemetry=YES ", v19, 2u);
  }

}

- (UIView)topBlurView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_topBlurView);
}

- (BOOL)queryIdSameAsInvokeQueryIdentifier
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[SPUISearchViewController queryOnDismissal](self, "queryOnDismissal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchViewController currentQuery](self, "currentQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[SPUISearchViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (unint64_t)objc_msgSend(v7, "count") > 1;

  }
  return v5;
}

- (NSString)queryOnDismissal
{
  return (NSString *)objc_getProperty(self, a2, 1096, 1);
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  SPUITestingHelper *v8;
  void *v9;
  int v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  +[SPUISearchFirstTimeViewController dismissForever](SPUISearchFirstTimeViewController, "dismissForever");
  v8 = -[SPUITestingHelper initWithSearchViewController:]([SPUITestingHelper alloc], "initWithSearchViewController:", self);
  -[SPUISearchViewController setTestingHelper:](self, "setTestingHelper:", v8);

  -[SPUISearchViewController testingHelper](self, "testingHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canPerformTest:", v6);

  if (v10)
  {
    -[SPUISearchViewController testingHelper](self, "testingHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performTest:options:completion:", v6, v7, 0);

  }
  return v10;
}

- (SPUITestingHelper)testingHelper
{
  return (SPUITestingHelper *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setTestingHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (void)resultsDidBecomeVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "goTakeoverResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGoTakeoverResult:", v6);

  +[SPUIFeedbackManager feedbackListener](SPUIFeedbackManager, "feedbackListener");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultsDidBecomeVisible:", v4);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v8;
  void *v9;
  char v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  if (sel_spotlight_leftArrowPressed == a3 || sel_spotlight_rightArrowPressed == a3)
  {
    objc_msgSend(MEMORY[0x24BEBD5D8], "focusSystemForEnvironment:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "focusedItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v10 = objc_msgSend(v9, "_allowsHorizontalFocusMovement");
LABEL_13:
    v11 = v10 ^ 1;
    goto LABEL_18;
  }
  if (sel_escapeKeyCommand == a3)
  {
    -[SPUISearchViewController searchTextField](self, "searchTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasMarkedText");
    goto LABEL_13;
  }
  if (sel_performWebSearch == a3)
  {
    -[SPUISearchViewController searchTextField](self, "searchTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      -[SPUISearchViewController searchTextField](self, "searchTextField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "tokens");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "count") == 0;

    }
    else
    {
      v11 = 0;
    }

    goto LABEL_18;
  }
  v16.receiver = self;
  v16.super_class = (Class)SPUISearchViewController;
  v11 = -[SPUISearchViewController canPerformAction:withSender:](&v16, sel_canPerformAction_withSender_, a3, v6);
LABEL_19:

  return v11;
}

- (id)searchTextField
{
  void *v2;
  void *v3;

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)escapeKeyCommand
{
  id v2;

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusSearchFieldAndSelectAll:withReason:", 1, 3);

}

- (void)spotlight_leftArrowPressed
{
  id v2;

  -[SPUISearchViewController searchTextField](self, "searchTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promoteCompletionIfPossibleAndMoveForward:", 0);

}

- (void)spotlight_rightArrowPressed
{
  id v2;

  -[SPUISearchViewController searchTextField](self, "searchTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promoteCompletionIfPossibleAndMoveForward:", 1);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobile.keybagd.lock_status"), 0);
  v6.receiver = self;
  v6.super_class = (Class)SPUISearchViewController;
  -[SPUISearchViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)canPerformCommand:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  if (-[SPUISearchViewController isQueryCommand:](self, "isQueryCommand:", v4))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)performCommand:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SPUIResultsViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[SPUISearchViewController isQueryCommand:](self, "isQueryCommand:", v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "entityType") == 3)
    {
      v5 = v4;
      v6 = (void *)objc_opt_new();
      v7 = objc_alloc(MEMORY[0x24BEB0280]);
      objc_msgSend(v5, "tokenString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithSearchString:", v8);

      v10 = (void *)MEMORY[0x24BEB0840];
      -[SPUISearchViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDeviceAuthenticationState:", objc_msgSend(v10, "deviceAuthenticationStateForView:", v11));

      objc_msgSend(v9, "setWhyQuery:", 8);
      -[SPUISearchViewController searchHeader](self, "searchHeader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addInputMethodInformationToQueryContext:", v9);

      objc_msgSend(MEMORY[0x24BEB0278], "searchEntityWithCommand:fromSuggestion:", v5, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v33[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSearchEntities:", v14);

      objc_msgSend(v9, "setAllowInternet:", 1);
      v15 = -[SPUIResultsViewController initWithSearchModel:searchEntity:]([SPUIResultsViewController alloc], "initWithSearchModel:searchEntity:", v6, v13);
      -[SPUISearchViewController searchHeader](self, "searchHeader");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "searchField");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIResultsViewController setSearchField:](v15, "setSearchField:", v17);

      -[SearchUIResultsViewController setFeedbackListener:](v15, "setFeedbackListener:", self);
      -[SearchUIResultsViewController setCommandDelegate:](v15, "setCommandDelegate:", self);
      objc_msgSend(v9, "displayedText");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIResultsViewController setQueryString:](v15, "setQueryString:", v18);

      -[SPUISearchViewController navigationController](self, "navigationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIResultsViewController setBackgroundColorDelegate:](v15, "setBackgroundColorDelegate:", v19);

      -[SPUIResultsViewController setUseLoadingView:](v15, "setUseLoadingView:", 1);
      objc_msgSend(v6, "updateWithQueryContext:", v9);
      -[SPUISearchViewController showViewController:sender:](self, "showViewController:sender:", v15, 0);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "searchString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

        if (!v24)
        {
          -[SPUISearchViewController clearSearchResultsAndFetchZKW:](self, "clearSearchResultsAndFetchZKW:", 1);
          goto LABEL_11;
        }
      }
      -[SPUISearchViewController searchHeader](self, "searchHeader");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "updateWithCommand:", v4);

      -[SPUISearchViewController searchHeader](self, "searchHeader");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "searchEntity");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setSearchEntity:", v27);

      -[SPUISearchViewController navigationController](self, "navigationController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (id)objc_msgSend(v29, "popToRootViewControllerAnimated:", 1);

      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIViewController activateViewController:animate:](self, "activateViewController:animate:", v31, 1);

      -[SPUISearchViewController navigationController](self, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateBackgroundColorWithViewControllerToBeShown:", v32);

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "setSource:", 0);
      objc_msgSend(v4, "utteranceText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setUtteranceText:", v21);

      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "activateWithContext:", v20);

    }
  }
LABEL_11:

}

- (BOOL)isQueryCommand:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (NSString)lastSearchString
{
  void *v2;
  void *v3;

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastSearchText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (UISearchToken)lastSearchToken
{
  void *v2;
  void *v3;

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastSearchToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISearchToken *)v3;
}

- (void)updateHeaderViewsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SPUISearchViewController allHeaderViews](self, "allHeaderViews", 0);
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
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)dragInitiated
{
  if (-[SPUISearchViewController presentationMode](self, "presentationMode") == 6)
    -[SPUISearchViewController cancelButtonPressed](self, "cancelButtonPressed");
}

- (void)appIconDragged
{
  if (-[SPUISearchViewController presentationMode](self, "presentationMode") == 2
    || -[SPUISearchViewController presentationMode](self, "presentationMode") == 1
    || -[SPUISearchViewController presentationMode](self, "presentationMode") == 8)
  {
    -[SPUISearchViewController cancelButtonPressed](self, "cancelButtonPressed");
  }
}

- (void)didEngageResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isLocalApplicationResult") & 1) != 0)
  {
    -[SPUISearchViewController windowExpansionTimer](self, "windowExpansionTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchViewController setClearQueryOnDismissal:](self, "setClearQueryOnDismissal:", objc_msgSend(v5, "isValid"));

  }
  else
  {
    -[SPUISearchViewController setClearQueryOnDismissal:](self, "setClearQueryOnDismissal:", 0);
  }
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isReturnKeyPressedInGoMode");

  if (v7)
    objc_msgSend(v9, "setTriggerEvent:", 1);
  +[SPUIFeedbackManager feedbackListener](SPUIFeedbackManager, "feedbackListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didEngageResult:", v9);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)setLegibilitySettings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLegibilitySettings:", v4);

}

- (void)performTestSearchWithQuery:(id)a3 event:(unint64_t)a4 queryKind:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performTestSearchWithQuery:event:queryKind:", v8, a4, a5);

}

uint64_t __60__SPUISearchViewController_searchViewWillPresentFromSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __60__SPUISearchViewController_searchViewWillPresentFromSource___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(_QWORD *)(a1 + 40), 0);
}

void __60__SPUISearchViewController_searchViewWillPresentFromSource___block_invoke_310(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)searchViewDidUpdatePresentationProgress:(double)a3
{
  int v4;
  id v5;

  if (a3 >= 1.0)
  {
    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focusSearchFieldAndSelectAll:withReason:", -[SPUISearchViewController queryIdSameAsInvokeQueryIdentifier](self, "queryIdSameAsInvokeQueryIdentifier"), 0);
  }
  else
  {
    if (a3 >= 0.5)
      return;
    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isFirstResponder"))
    {
      v4 = objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow");

      if (!v4)
        return;
      -[SPUISearchViewController searchHeader](self, "searchHeader");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unfocusSearchFieldWithReason:", 0);
    }
  }

}

- (void)purgeMemory
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purgeMemory");

  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithResultSections:", MEMORY[0x24BDBD1A8]);

  +[SPUISearchModel sharedGeneralInstance](SPUISearchModel, "sharedGeneralInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeMemory");

  +[SPUISearchModel sharedFullZWKInstance](SPUISearchModel, "sharedFullZWKInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "purgeMemory");

}

void __59__SPUISearchViewController_searchViewDidPresentFromSource___block_invoke()
{
  uint64_t v0;
  NSObject *v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  v0 = MEMORY[0x24BEB0818];
  v1 = *(NSObject **)(MEMORY[0x24BEB0818] + 32);
  if (!v1)
  {
    SPUIInitLogging();
    v1 = *(NSObject **)(v0 + 32);
  }
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22E078000, v1, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "finalPrewarm", (const char *)&unk_22E0A3E97, buf, 2u);
  }
  +[SPUISearchModel sharedGeneralInstance](SPUISearchModel, "sharedGeneralInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activate");

  objc_msgSend(MEMORY[0x24BEB0840], "prewarmVisionForImageDerivedColors");
  v3 = *(NSObject **)(v0 + 32);
  if (!v3)
  {
    SPUIInitLogging();
    v3 = *(NSObject **)(v0 + 32);
  }
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_22E078000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "finalPrewarm", " enableTelemetry=YES ", v4, 2u);
  }
}

- (void)sendPresentationFeedback
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[SPUISearchViewController presentationMode](self, "presentationMode");
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "queryId");
  -[SPUISearchViewController currentQuery](self, "currentQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE85288];
  -[SPUISearchViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPUIFeedbackManager didAppearFromSource:withQueryId:queryString:deviceIsAuthenticated:](SPUIFeedbackManager, "didAppearFromSource:withQueryId:queryString:deviceIsAuthenticated:", v3, v4, v5, objc_msgSend(v6, "deviceIsAuthenticatedForView:", v7));

}

- (void)searchViewWillDismissWithReason:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  -[SPUIViewController searchResultViewController](self, "searchResultViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willDismiss");

  -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willDismiss");

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectionGrabbersHiddenSafe:", 1);

  kdebug_trace();
  v8 = MEMORY[0x24BEB0818];
  v9 = *(NSObject **)(MEMORY[0x24BEB0818] + 32);
  if (!v9)
  {
    SPUIInitLogging();
    v9 = *(NSObject **)(v8 + 32);
  }
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22E078000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "dismiss", (const char *)&unk_22E0A3E97, buf, 2u);
  }
  v10 = *(NSObject **)(v8 + 40);
  if (!v10)
  {
    SPUIInitLogging();
    v10 = *(NSObject **)(v8 + 40);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_22E078000, v10, OS_LOG_TYPE_DEFAULT, "dismiss start", v18, 2u);
  }
  if (-[SPUISearchViewController presentationMode](self, "presentationMode") != 1
    && -[SPUISearchViewController presentationMode](self, "presentationMode") != 5
    && -[SPUISearchViewController presentationMode](self, "presentationMode") != 7)
  {
    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "showCancelButton:animated:", 0, 1);

  }
  -[SPUIViewController activeViewController](self, "activeViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SPUIViewController activeViewController](self, "activeViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, 0);

    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPUIFeedbackManager cardViewDidDisappearWithEvent:withQueryId:](SPUIFeedbackManager, "cardViewDidDisappearWithEvent:withQueryId:", 5, objc_msgSend(v15, "queryId"));

  }
  -[SPUISearchViewController showVerticalScrollIndicators:](self, "showVerticalScrollIndicators:", 0);
  if ((objc_msgSend(MEMORY[0x24BEB0808], "pageDotInvokeEnabled") & 1) == 0)
  {
    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unfocusSearchFieldWithReason:", 1);

  }
  -[SPUISearchViewController topBlurView](self, "topBlurView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", 0.0);

  -[SPUISearchViewController setTimeAtDismissal:](self, "setTimeAtDismissal:", CFAbsoluteTimeGetCurrent());
}

- (void)clearTimerExpired
{
  NSObject *v3;
  os_log_type_t v4;
  uint8_t v5[16];

  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE84B00] ^ 1;
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22E078000, v3, v4, "Clear timer expired", v5, 2u);
  }

  -[SPUISearchViewController clearSearchResultsAndFetchZKW:](self, "clearSearchResultsAndFetchZKW:", 0);
}

- (BOOL)currentQueryIdMatchesResultInGeneralModel
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "queryId");
  +[SPUISearchModel sharedGeneralInstance](SPUISearchModelGeneral, "sharedGeneralInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v3 == objc_msgSend(v8, "queryId");

  return v3;
}

- (void)highlightResultAfterUnmarkingText
{
  id v2;

  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightResultAfterUnmarkingText");

}

- (void)returnKeyPressed
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[SPUISearchViewController currentQuery](self, "currentQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    +[SPUISearchModel sharedGeneralInstance](SPUISearchModelGeneral, "sharedGeneralInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "queryInProgress");

    if (v6)
    {
      v7 = objc_initWeak(&location, self);
      v8 = -[SPUISearchViewController currentQueryIdMatchesResultInGeneralModel](self, "currentQueryIdMatchesResultInGeneralModel");

      v9 = objc_loadWeakRetained(&location);
      v10 = v9;
      if (v8)
      {
        objc_msgSend(v9, "performReturnKeyPressAndExpandWidowIfNeeded");

      }
      else
      {
        objc_msgSend(v9, "searchResultViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __44__SPUISearchViewController_returnKeyPressed__block_invoke;
        v13[3] = &unk_24F9D5EE8;
        objc_copyWeak(&v14, &location);
        objc_msgSend(v11, "setViewDidUpdateHandler:", v13);

        objc_destroyWeak(&v14);
      }
      objc_destroyWeak(&location);
    }
    else
    {
      -[SPUISearchViewController performReturnKeyPressAndExpandWidowIfNeeded](self, "performReturnKeyPressAndExpandWidowIfNeeded");
    }
  }
  else if (-[SPUISearchViewController presentationMode](self, "presentationMode") != 6
         || (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow") & 1) == 0)
  {
    -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "performReturnKeyPressAction");

  }
}

void __44__SPUISearchViewController_returnKeyPressed__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  void *v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "currentQueryIdMatchesResultInGeneralModel");

  if (v3)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "searchResultViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setViewDidUpdateHandler:", 0);

    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "performReturnKeyPressAndExpandWidowIfNeeded");

  }
}

- (void)backButtonPressed
{
  id v2;
  id v3;

  -[SPUISearchViewController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (void)performWebSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSearchString:", v5);

  objc_msgSend(MEMORY[0x24BE85248], "handlerForCommand:environment:", v7, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeWithTriggerEvent:", 1);

}

- (void)performReturnKeyPressAndExpandWidowIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[SPUISearchViewController windowExpansionTimer](self, "windowExpansionTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[SPUIViewController activeViewController](self, "activeViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIViewController searchResultViewController](self, "searchResultViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v6)
    {
      -[SPUISearchViewController invalidateWindowExpansionTimer](self, "invalidateWindowExpansionTimer");
      -[SPUISearchViewController searchHeader](self, "searchHeader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "completionResultIsPotentiallyPunchout");

      if (v8)
      {
        -[SPUISearchViewController scheduleWindowExpansionWithInterval:](self, "scheduleWindowExpansionWithInterval:", 0.5);
        -[SPUISearchViewController setExpandPlatterOnAppear:](self, "setExpandPlatterOnAppear:", 1);
      }
      else
      {
        -[SPUISearchViewController expandWindowIfNeeded](self, "expandWindowIfNeeded");
      }
    }
  }
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "returnKeyType");

  if (v11 == 6)
  {
    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "commitSearch");
  }
  else
  {
    -[SPUIViewController searchResultViewController](self, "searchResultViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "performReturnKeyPressAction");
  }

}

- (void)invalidateWindowExpansionTimer
{
  void *v3;

  -[SPUISearchViewController windowExpansionTimer](self, "windowExpansionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SPUISearchViewController setWindowExpansionTimer:](self, "setWindowExpansionTimer:", 0);
}

- (void)removeCompletionAndHighlightAsTyped:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;
  id v7;

  v3 = a3;
  -[SPUIViewController activeViewController](self, "activeViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SPUIViewController activeViewController](self, "activeViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeCompletionAndHighlightAsTyped:", v3);

  }
}

- (void)clearSearchResultsAndFetchZKW:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeMemory");

  -[SPUISearchViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "popToRootViewControllerAnimated:", 0);

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearSearchFieldWhyQuery:allowZKW:", 9, v3);

}

- (void)searchViewDidDismissWithReason:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPUIFeedbackManager didDisappearWithReason:withQueryId:](SPUIFeedbackManager, "didDisappearWithReason:withQueryId:", a3, objc_msgSend(v5, "queryId"));

  if (-[SPUISearchViewController clearQueryOnDismissal](self, "clearQueryOnDismissal"))
  {
    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearSearchFieldWhyQuery:allowZKW:", 0, 0);

  }
  +[SPUISearchModel sharedGeneralInstance](SPUISearchModel, "sharedGeneralInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deactivate");

  -[SPUISearchViewController refreshTrial](self, "refreshTrial");
  -[SPUISearchViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNavigationMode:", 0);

  -[SPUISearchViewController updateResponderChainIfNeeded](self, "updateResponderChainIfNeeded");
  if ((objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow") & 1) == 0)
  {
    v9 = objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled") ^ 1;
    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", v9);

  }
  -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIViewController activateViewController:animate:](self, "activateViewController:animate:", v11, 0);

  -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateWithResultSections:", MEMORY[0x24BDBD1A8]);

  -[SPUISearchViewController currentQuery](self, "currentQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchViewController setQueryOnDismissal:](self, "setQueryOnDismissal:", v13);

  v14 = MEMORY[0x24BEB0818];
  v15 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
  if (!v15)
  {
    SPUIInitLogging();
    v15 = *(NSObject **)(v14 + 40);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E078000, v15, OS_LOG_TYPE_DEFAULT, "dismiss end", buf, 2u);
  }
  kdebug_trace();
  v16 = *(NSObject **)(v14 + 32);
  if (!v16)
  {
    SPUIInitLogging();
    v16 = *(NSObject **)(v14 + 32);
  }
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_22E078000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "dismiss", " enableTelemetry=YES ", v17, 2u);
  }
}

- (void)spotlightDidBackground
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = -[SPUISearchViewController feedbackBackgroundTaskIdentifier](self, "feedbackBackgroundTaskIdentifier");
  if (v3 == *MEMORY[0x24BEBE030])
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__SPUISearchViewController_spotlightDidBackground__block_invoke;
    v7[3] = &unk_24F9D5CC8;
    v7[4] = self;
    -[SPUISearchViewController setFeedbackBackgroundTaskIdentifier:](self, "setFeedbackBackgroundTaskIdentifier:", objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Send Feedback"), v7));

    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __50__SPUISearchViewController_spotlightDidBackground__block_invoke_319;
    v6[3] = &unk_24F9D5CC8;
    v6[4] = self;
    +[SPUIFeedbackManager flushFeedbackWithCompletion:](SPUIFeedbackManager, "flushFeedbackWithCompletion:", v6);
  }
}

uint64_t __50__SPUISearchViewController_spotlightDidBackground__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "feedbackBackgroundTaskIdentifier");
  if (v2 != *MEMORY[0x24BEBE030])
  {
    SPLogForSPLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __50__SPUISearchViewController_spotlightDidBackground__block_invoke_cold_1();

  }
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTaskIfNeeded");
}

uint64_t __50__SPUISearchViewController_spotlightDidBackground__block_invoke_319(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTaskIfNeeded");
}

- (void)endBackgroundTaskIfNeeded
{
  unint64_t v3;
  _QWORD v4[5];

  v3 = -[SPUISearchViewController feedbackBackgroundTaskIdentifier](self, "feedbackBackgroundTaskIdentifier");
  if (v3 != *MEMORY[0x24BEBE030])
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __53__SPUISearchViewController_endBackgroundTaskIfNeeded__block_invoke;
    v4[3] = &unk_24F9D5CC8;
    v4[4] = self;
    objc_msgSend(MEMORY[0x24BE85288], "dispatchMainIfNecessary:", v4);
  }
}

uint64_t __53__SPUISearchViewController_endBackgroundTaskIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "feedbackBackgroundTaskIdentifier"));

  return objc_msgSend(*(id *)(a1 + 32), "setFeedbackBackgroundTaskIdentifier:", *MEMORY[0x24BEBE030]);
}

- (void)didScrollPastBottomOfContent
{
  id v2;

  -[SPUIViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissSearchViewWithReason:", 3);

}

- (void)setExpansionValueForZKW:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "spotlightUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("SpotlightZKWExpanded"));

}

- (void)didChangeExpansionStateForSection:(id)a3 expanded:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a4;
  v10 = a3;
  objc_msgSend(v10, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE84AE8]) & 1) != 0)
  {
    objc_msgSend(v10, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "renderHorizontallyWithOtherResultsInCategory");

    if (v9)
      -[SPUISearchViewController setExpansionValueForZKW:](self, "setExpansionValueForZKW:", v4);
  }
  else
  {

  }
}

- (void)activateFirstTimeExperienceViewIfNecessary
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint8_t buf[16];

  if (+[SPUISearchFirstTimeViewController needsDisplay](SPUISearchFirstTimeViewController, "needsDisplay"))
  {
    if (+[SPUISearchFirstTimeViewController useZKWFTE](SPUISearchFirstTimeViewController, "useZKWFTE"))
    {
      if (!-[SPUISearchViewController hasContentInSearchField](self, "hasContentInSearchField"))
      {
        v3 = MEMORY[0x24BEB0818];
        v4 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
        if (!v4)
        {
          SPUIInitLogging();
          v4 = *(NSObject **)(v3 + 40);
        }
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22E078000, v4, OS_LOG_TYPE_DEFAULT, "FTE incremented count", buf, 2u);
        }
        +[SPUISearchFirstTimeViewController incrementViewCount](SPUISearchFirstTimeViewController, "incrementViewCount");
      }
    }
    else
    {
      v10 = MEMORY[0x24BEB0818];
      v11 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
      if (!v11)
      {
        SPUIInitLogging();
        v11 = *(NSObject **)(v10 + 40);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E078000, v11, OS_LOG_TYPE_DEFAULT, "[FTE] FTE needs display", buf, 2u);
      }
      -[SPUISearchViewController firstTimeExperienceViewController](self, "firstTimeExperienceViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = *(NSObject **)(v10 + 40);
      if (v12)
      {
        if (!v13)
        {
          SPUIInitLogging();
          v13 = *(NSObject **)(v10 + 40);
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22E078000, v13, OS_LOG_TYPE_DEFAULT, "[FTE] presenting cached FTE view controller", buf, 2u);
        }
        -[SPUISearchViewController activateFirstTimeExperienceViewAnimate:](self, "activateFirstTimeExperienceViewAnimate:", 0);
      }
      else
      {
        if (!v13)
        {
          SPUIInitLogging();
          v13 = *(NSObject **)(v10 + 40);
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22E078000, v13, OS_LOG_TYPE_DEFAULT, "[FTE] retrieving FTE - call from UI", buf, 2u);
        }
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __70__SPUISearchViewController_activateFirstTimeExperienceViewIfNecessary__block_invoke;
        v14[3] = &unk_24F9D6310;
        v14[4] = self;
        +[SPUISearchModel retrieveFirstTimeExperienceTextWithReply:](SPUISearchModel, "retrieveFirstTimeExperienceTextWithReply:", v14);
      }
    }
  }
  else
  {
    -[SPUIViewController activeViewController](self, "activeViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchViewController firstTimeExperienceViewController](self, "firstTimeExperienceViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      v7 = MEMORY[0x24BEB0818];
      v8 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
      if (!v8)
      {
        SPUIInitLogging();
        v8 = *(NSObject **)(v7 + 40);
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E078000, v8, OS_LOG_TYPE_DEFAULT, "Doesnt need FTE enabling search view", buf, 2u);
      }
      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIViewController activateViewController:animate:](self, "activateViewController:animate:", v9, 0);

    }
  }
}

void __70__SPUISearchViewController_activateFirstTimeExperienceViewIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("FTE_STRING"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FTE_LEARN_MORE_LINK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FTE_CONTINUE_LINK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FTE_DOMAINS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "length");
  v9 = MEMORY[0x24BEB0818];
  v10 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
  if (v8)
  {
    if (!v10)
    {
      SPUIInitLogging();
      v10 = *(NSObject **)(v9 + 40);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E078000, v10, OS_LOG_TYPE_DEFAULT, "[FTE] got parameter values in UI", buf, 2u);
    }
    v11 = (void *)MEMORY[0x24BE85288];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __70__SPUISearchViewController_activateFirstTimeExperienceViewIfNecessary__block_invoke_335;
    v12[3] = &unk_24F9D62E8;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v7;
    v14 = v4;
    v15 = v5;
    v16 = v6;
    objc_msgSend(v11, "dispatchMainIfNecessary:", v12);

  }
  else
  {
    if (!v10)
    {
      SPUIInitLogging();
      v10 = *(NSObject **)(v9 + 40);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __70__SPUISearchViewController_activateFirstTimeExperienceViewIfNecessary__block_invoke_cold_1();
  }

}

uint64_t __70__SPUISearchViewController_activateFirstTimeExperienceViewIfNecessary__block_invoke_335(uint64_t a1)
{
  void *v2;
  SPUISearchFirstTimeViewController *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "firstTimeExperienceViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = -[SPUISearchFirstTimeViewController initWithDomains:explanationText:learnMoreText:continueButtonTitle:]([SPUISearchFirstTimeViewController alloc], "initWithDomains:explanationText:learnMoreText:continueButtonTitle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "setFirstTimeExperienceViewController:", v3);

    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "firstTimeExperienceViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v4);

  }
  return objc_msgSend(*(id *)(a1 + 32), "activateFirstTimeExperienceViewAnimate:", 1);
}

- (void)activateFirstTimeExperienceViewAnimate:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = a3;
  if (-[SPUISearchViewController hasContentInSearchField](self, "hasContentInSearchField"))
  {
    v5 = MEMORY[0x24BEB0818];
    v6 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
    if (!v6)
    {
      SPUIInitLogging();
      v6 = *(NSObject **)(v5 + 40);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_22E078000, v6, OS_LOG_TYPE_DEFAULT, "[FTE] query was present, so did not show FTE", v11, 2u);
    }
  }
  else
  {
    -[SPUISearchViewController firstTimeExperienceViewController](self, "firstTimeExperienceViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIViewController activateViewController:animate:](self, "activateViewController:animate:", v7, v3);

    v8 = MEMORY[0x24BEB0818];
    v9 = *(NSObject **)(MEMORY[0x24BEB0818] + 40);
    if (!v9)
    {
      SPUIInitLogging();
      v9 = *(NSObject **)(v8 + 40);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E078000, v9, OS_LOG_TYPE_DEFAULT, "[FTE] displaying FTE view", buf, 2u);
    }
    if (-[SPUISearchViewController _appearState](self, "_appearState") == 2
      || -[SPUISearchViewController _appearState](self, "_appearState") == 1)
    {
      -[SPUISearchViewController firstTimeExperienceViewController](self, "firstTimeExperienceViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateViewCount");

    }
  }
}

- (void)firstTimeExperienceContinueButtonPressed
{
  void *v3;
  id v4;

  +[SPUISearchFirstTimeViewController dismissForever](SPUISearchFirstTimeViewController, "dismissForever");
  -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIViewController activateViewController:animate:](self, "activateViewController:animate:", v3, 1);

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusSearchFieldAndSelectAll:withReason:", 1, 4);

}

+ (BOOL)shouldShowAsTypedSuggestion
{
  if (shouldShowAsTypedSuggestion_onceToken != -1)
    dispatch_once(&shouldShowAsTypedSuggestion_onceToken, &__block_literal_global_338);
  return objc_msgSend((id)shouldShowAsTypedSuggestion_defaults, "BOOLForKey:", CFSTR("disableAsTypedSuggestion")) ^ 1;
}

void __55__SPUISearchViewController_shouldShowAsTypedSuggestion__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
  v1 = (void *)shouldShowAsTypedSuggestion_defaults;
  shouldShowAsTypedSuggestion_defaults = v0;

}

+ (void)_updateHeaderView:(id)a3 fromText:(id)a4 fromToken:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  if (a5)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(a5, "representedObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPUISearchHeader tokenFromSearchEntity:](SPUISearchHeader, "tokenFromSearchEntity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "searchField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateTextRange:", v6);

    objc_msgSend(v7, "searchField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateToken:", v9);

  }
  else
  {
    v12 = a4;
    v13 = a3;
    objc_msgSend(v13, "searchField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateTextRange:", v12);

    objc_msgSend(v13, "searchField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateToken:", 0);
  }

  objc_msgSend(a3, "clearLastSearchedText");
}

- (void)queryContextDidChange:(id)a3 fromSearchHeader:(id)a4 allowZKW:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  _BOOL4 v63;
  void *v64;
  id v65;
  SPUISearchViewController *v66;
  int v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  SPUISearchViewController *v71;
  id v72;
  id v73;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[SPUISearchViewController invalidateWindowExpansionTimer](self, "invalidateWindowExpansionTimer");
  -[SPUISearchViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 >= 2)
  {
    -[SPUIViewController searchResultViewController](self, "searchResultViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSections:", MEMORY[0x24BDBD1A8]);

    -[SPUISearchViewController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "popToRootViewControllerAnimated:", 0);

  }
  objc_msgSend(v8, "searchEntities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (!v17)
  {
    objc_msgSend(v8, "searchEntities");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIViewController searchResultViewController](self, "searchResultViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSearchEntity:", v19);

    -[SPUISearchViewController navigationController](self, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
    else
      -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateBackgroundColorWithViewControllerToBeShown:", v23);

  }
  objc_msgSend(v8, "searchString");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchEntities");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  objc_msgSend(v9, "searchField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "text");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "searchField");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "tokens");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (v30 >= 2)
  {
    v31 = MEMORY[0x24BEB0818];
    v32 = *(NSObject **)(MEMORY[0x24BEB0818] + 8);
    if (!v32)
    {
      SPUIInitLogging();
      v32 = *(NSObject **)(v31 + 8);
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[SPUISearchViewController createAdditionalHeaderView].cold.1();
  }
  -[SPUISearchViewController appIntentsQueryHelper](self, "appIntentsQueryHelper");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "updateSearchString:completionHandler:", v27, &__block_literal_global_344);

  objc_msgSend(v9, "searchField");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "tokens");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  +[SPUISearchModel sharedGeneralInstance](SPUISearchModel, "sharedGeneralInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchViewController setLastQueryWasAuthenticated:](self, "setLastQueryWasAuthenticated:", objc_msgSend(v8, "deviceAuthenticationState") == 0);
  v38 = v68;
  if (objc_msgSend(v68, "length"))
    v39 = 1;
  else
    v39 = v5;
  v67 = v39;
  if ((v39 & 1) != 0)
  {
    if (objc_msgSend(v68, "length") | v25)
    {
      objc_msgSend(v8, "setAllowInternet:", -[SPUISearchViewController allowInternet](self, "allowInternet"));
      objc_msgSend(v37, "updateWithQueryContext:", v8);
      goto LABEL_22;
    }
    -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIViewController activateViewController:animate:](self, "activateViewController:animate:", v42, 0);

    -[SPUISearchViewController proactiveResultViewController](self, "proactiveResultViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "refreshResultsWithContext:allowPartialUpdates:", v8, 0);
    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v44 = v37;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setQueryId:", v43);

    v37 = v44;
  }
  else
  {
    +[SPUISearchModel sharedGeneralInstance](SPUISearchModel, "sharedGeneralInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "clear");

    +[SPUISearchModel sharedFullZWKInstance](SPUISearchModel, "sharedFullZWKInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "clear");
  }

LABEL_22:
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __76__SPUISearchViewController_queryContextDidChange_fromSearchHeader_allowZKW___block_invoke_2;
  v69[3] = &unk_24F9D6378;
  v46 = v9;
  v70 = v46;
  v71 = self;
  v47 = v27;
  v72 = v47;
  v48 = v36;
  v73 = v48;
  -[SPUISearchViewController updateHeaderViewsWithBlock:](self, "updateHeaderViewsWithBlock:", v69);
  objc_msgSend(v8, "displayedText");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setQueryString:", v49);

  v51 = objc_msgSend(v8, "queryKind");
  if (+[SPUISearchViewController shouldShowAsTypedSuggestion](SPUISearchViewController, "shouldShowAsTypedSuggestion"))
  {
    v63 = (unint64_t)(v51 - 1) < 2;
    -[SPUIViewController searchResultViewController](self, "searchResultViewController");
    v66 = self;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchString");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchEntities");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "firstObject");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchViewController searchHeader](v66, "searchHeader");
    v65 = v46;
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v47;
    v57 = objc_msgSend(v55, "queryId");
    objc_msgSend(v8, "keyboardLanguage");
    v58 = v48;
    v59 = v37;
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v57;
    v47 = v56;
    objc_msgSend(v52, "searchUpdatedWithString:tokenEntity:queryId:wantsCompletions:keyboardLanguage:", v53, v54, v61, v63, v60);

    v37 = v59;
    v48 = v58;

    v46 = v65;
    v38 = v68;

    self = v66;
  }
  if (v67)
  {
    -[SPUISearchViewController navigationController](self, "navigationController");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "updateFooterViewsIfNecessary");

    -[SPUISearchViewController activateFirstTimeExperienceViewIfNecessary](self, "activateFirstTimeExperienceViewIfNecessary");
  }

}

void __76__SPUISearchViewController_queryContextDidChange_fromSearchHeader_allowZKW___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;

  if ((void *)a1[4] != a2)
  {
    v3 = a2;
    objc_msgSend((id)objc_opt_class(), "_updateHeaderView:fromText:fromToken:", v3, a1[6], a1[7]);

  }
}

- (BOOL)optOutOfGoButton
{
  void *v2;
  char v3;

  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "optOutOfGoButton");

  return v3;
}

- (double)contentHeight
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;

  -[SPUIViewController activeViewController](self, "activeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[SPUIViewController activeViewController](self, "activeViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "contentSize");
    v8 = v7;
LABEL_5:

    return v8;
  }
  -[SPUISearchViewController firstTimeExperienceViewController](self, "firstTimeExperienceViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0.0;
  if (v6 == v9)
  {
    -[SPUISearchViewController firstTimeExperienceViewController](self, "firstTimeExperienceViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idealContentHeight");
    v8 = v10;
    goto LABEL_5;
  }
  return v8;
}

- (void)scheduleWindowExpansionWithInterval:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_expandWindowIfNeeded, 0, 0, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchViewController setWindowExpansionTimer:](self, "setWindowExpansionTimer:", v4);

  -[SPUISearchViewController windowExpansionTimer](self, "windowExpansionTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTolerance:", 0.1);

}

- (void)expandWindowIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[SPUISearchViewController hasContentInSearchField](self, "hasContentInSearchField"))
  {
    -[SPUIViewController activeViewController](self, "activeViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIViewController searchResultViewController](self, "searchResultViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v4)
    {
      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invalidateContentHeight");

      -[SPUIViewController searchResultViewController](self, "searchResultViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIViewController activateViewController:animate:](self, "activateViewController:animate:", v6, 0);

      -[SPUISearchViewController setExpandPlatterOnAppear:](self, "setExpandPlatterOnAppear:", 0);
    }
  }
}

- (id)firstResultIgnoringSuggestionsIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[SPUISearchModel sharedGeneralInstance](SPUISearchModelGeneral, "sharedGeneralInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)allowInternet
{
  _BOOL4 v3;

  if (!+[SPUISearchFirstTimeViewController needsDisplay](SPUISearchFirstTimeViewController, "needsDisplay")|| (v3 = +[SPUISearchFirstTimeViewController hasBeenDisplayed](SPUISearchFirstTimeViewController, "hasBeenDisplayed")))
  {
    LOBYTE(v3) = !-[SPUISearchViewController internetOverrideForPPT](self, "internetOverrideForPPT");
  }
  return v3;
}

- (void)cancelButtonPressed
{
  id v2;

  -[SPUIViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissSearchViewWithReason:", 1);

}

- (void)didBeginScrollingResults
{
  id v2;

  +[SPUISearchModel sharedGeneralInstance](SPUISearchModel, "sharedGeneralInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setForceStableResults:", 1);

}

- (id)searchViewRestorationContext
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  SPUISearchViewController *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[SPUIViewController activeViewController](self, "activeViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 != (void *)v5)
  {
    v6 = (void *)v5;
    v7 = 0;
    v8 = 0;
LABEL_5:
    v26 = (void *)v7;

    goto LABEL_6;
  }
  -[SPUIViewController searchResultViewController](self, "searchResultViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sections");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SPUIViewController searchResultViewController](self, "searchResultViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "restorationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SPUISearchViewController lastSearchString](self, "lastSearchString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSearchString:", v11);

    -[SPUISearchViewController searchHeader](self, "searchHeader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchEntity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSearchEntity:", v6);
    goto LABEL_5;
  }
  v26 = 0;
  v8 = 0;
LABEL_6:
  v27 = v3;
  objc_msgSend(v3, "setSearchViewContext:", v8);
  v12 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[SPUISearchViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewControllers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(SPUISearchViewController **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (v19 != self)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[SPUISearchViewController restorationContext](v19, "restorationContext");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "sections");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

            if (!v22)
              goto LABEL_18;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            -[SPUISearchViewController restorationContext](v19, "restorationContext");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v12, "addObject:", v20);
LABEL_18:

          continue;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v16);
  }

  objc_msgSend(v27, "setViewControllerContexts:", v12);
  objc_msgSend(v27, "setSearchViewContext:", v8);
  -[SPUISearchViewController timeAtDismissal](self, "timeAtDismissal");
  objc_msgSend(v27, "setTimeAtDismissal:");
  -[SPUISearchViewController searchHeader](self, "searchHeader");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "searchField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWantsGo:", objc_msgSend(v24, "returnKeyType") == 1);

  return v27;
}

- (BOOL)spotlightIsVisible
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[SPUISearchViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(v4, "activationState"))
      v5 = objc_msgSend(v4, "activationState") == 1;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)presentSpotlight
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEB0B30]);
  objc_msgSend(v2, "requestSpotlightActivation");

}

- (void)setRestorationData:(id)a3
{
  objc_storeStrong((id *)&self->_restorationData, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SPUISearchFirstTimeViewController)firstTimeExperienceViewController
{
  return (SPUISearchFirstTimeViewController *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setFirstTimeExperienceViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (BOOL)internetOverrideForPPT
{
  return self->_internetOverrideForPPT;
}

- (void)setInternetOverrideForPPT:(BOOL)a3
{
  self->_internetOverrideForPPT = a3;
}

- (BOOL)lastQueryWasAuthenticated
{
  return self->_lastQueryWasAuthenticated;
}

- (void)setLastQueryWasAuthenticated:(BOOL)a3
{
  self->_lastQueryWasAuthenticated = a3;
}

- (BOOL)clearQueryOnDismissal
{
  return self->_clearQueryOnDismissal;
}

- (void)setExpandPlatterOnAppear:(BOOL)a3
{
  self->_expandPlatterOnAppear = a3;
}

- (unint64_t)feedbackBackgroundTaskIdentifier
{
  return self->_feedbackBackgroundTaskIdentifier;
}

- (void)setFeedbackBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_feedbackBackgroundTaskIdentifier = a3;
}

- (void)setQueryOnDismissal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (SUIAppIntentsQueryHelper)appIntentsQueryHelper
{
  return self->_appIntentsQueryHelper;
}

- (void)setAppIntentsQueryHelper:(id)a3
{
  objc_storeStrong((id *)&self->_appIntentsQueryHelper, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sizingDelegate);
  objc_storeStrong((id *)&self->_appIntentsQueryHelper, 0);
  objc_storeStrong((id *)&self->_factorsFetchingQueue, 0);
  objc_storeStrong((id *)&self->_queryOnDismissal, 0);
  objc_storeStrong((id *)&self->_windowExpansionTimer, 0);
  objc_storeStrong((id *)&self->_testingHelper, 0);
  objc_storeStrong((id *)&self->_proactiveResultViewController, 0);
  objc_storeStrong((id *)&self->_firstTimeExperienceViewController, 0);
  objc_storeStrong((id *)&self->_allHeaderViews, 0);
  objc_storeStrong((id *)&self->_searchHeader, 0);
  objc_destroyWeak((id *)&self->_topBlurView);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_restorationData, 0);
}

- (void)createAdditionalHeaderView
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E078000, v0, v1, "more than one search token was found in the search header when we only support one at a time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)searchViewWillPresentFromSource:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22E078000, a2, OS_LOG_TYPE_ERROR, "Failed to unpack restoration with error %@", (uint8_t *)&v2, 0xCu);
}

- (void)searchViewDidPresentFromSource:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_22E078000, v0, OS_LOG_TYPE_FAULT, "StoreKit didnt dismiss", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __50__SPUISearchViewController_spotlightDidBackground__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E078000, v0, v1, "Feedback failed to send in time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__SPUISearchViewController_activateFirstTimeExperienceViewIfNecessary__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E078000, v0, v1, "[FTE] Got nil length parameters", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
