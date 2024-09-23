@implementation SearchUICardViewController

- (SearchUICardViewController)init
{
  return -[SearchUICardViewController initWithCard:feedbackListener:](self, "initWithCard:feedbackListener:", 0, 0);
}

- (SearchUICardViewController)initWithCard:(id)a3 style:(unint64_t)a4 feedbackListener:(id)a5
{
  return -[SearchUICardViewController initWithCard:feedbackListener:](self, "initWithCard:feedbackListener:", a3, a5);
}

- (SearchUICardViewController)initWithCard:(id)a3 feedbackListener:(id)a4
{
  id v6;
  id v7;
  SearchUICardViewController *v8;
  SearchUICardViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SearchUICardViewController;
  v8 = -[SearchUICardViewController init](&v26, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SearchUICardViewController setLevel:](v8, "setLevel:", 1);
    v10 = (void *)objc_opt_new();
    -[SearchUICardViewController setView:](v9, "setView:", v10);

    v11 = (void *)objc_opt_new();
    -[SearchUICardViewController setTableViewController:](v9, "setTableViewController:", v11);

    -[SearchUICardViewController view](v9, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardViewController tableViewController](v9, "tableViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v14);

    -[SearchUICardViewController tableViewController](v9, "tableViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIAutoLayout constrainViewToContainer:](SearchUIAutoLayout, "constrainViewToContainer:", v16);

    -[SearchUICardViewController tableViewController](v9, "tableViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardViewController addChildViewController:](v9, "addChildViewController:", v17);

    v9->_shouldDrawBackgroundColor = 1;
    -[SearchUICardViewController setCard:](v9, "setCard:", v6);
    -[SearchUICardViewController setFeedbackListener:](v9, "setFeedbackListener:", v7);
    v18 = objc_alloc(MEMORY[0x1E0DC34F0]);
    +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("BACK_BUTTON_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithTitle:style:target:action:", v19, 0, 0, 0);
    -[SearchUICardViewController navigationItem](v9, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackBarButtonItem:", v20);

    -[SearchUICardViewController tableViewController](v9, "tableViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSizingDelegate:", v9);

    -[SearchUICardViewController tableViewController](v9, "tableViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scrollViewForSizing");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardViewController setContentScrollView:forEdge:](v9, "setContentScrollView:forEdge:", v24, 15);

  }
  return v9;
}

- (BOOL)shouldUseInsetRoundedSections
{
  void *v2;
  char v3;

  -[SearchUICardViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUseInsetRoundedSections");

  return v3;
}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SearchUICardViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldUseInsetRoundedSections:", v3);

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldUseInsetRoundedSections:", v3);

}

- (BOOL)rowSelectionAppearanceEnabled
{
  void *v2;
  char v3;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rowSelectionAppearanceEnabled");

  return v3;
}

- (void)setRowSelectionAppearanceEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRowSelectionAppearanceEnabled:", v3);

}

- (BOOL)isInPreviewPlatter
{
  void *v2;
  char v3;

  -[SearchUICardViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInPreviewPlatter");

  return v3;
}

- (void)setInPreviewPlatter:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SearchUICardViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInPreviewPlatter:", v3);

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInPreviewPlatter:", v3);

}

- (double)contentHeightForWidth:(double)a3
{
  return 0.0;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCardViewDelegate:", v4);

  if (v4)
  {
    -[SearchUICardViewController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SearchUICardViewController tableViewController](self, "tableViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tableModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        return;
      -[SearchUICardViewController tableViewController](self, "tableViewController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadViews");
    }

  }
}

- (SearchUICardViewDelegate)delegate
{
  void *v2;
  void *v3;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardViewDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SearchUICardViewDelegate *)v3;
}

- (void)setFeedbackListener:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFeedbackListener:", v4);

}

- (SFFeedbackListener)feedbackListener
{
  void *v2;
  void *v3;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedbackListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFFeedbackListener *)v3;
}

- (void)displayLoadingViewAfterDelay:(double)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SearchUICardViewController_displayLoadingViewAfterDelay___block_invoke;
  v5[3] = &unk_1EA1F85F0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardViewController setLoadingScreenTimer:](self, "setLoadingScreenTimer:", v4);

}

uint64_t __59__SearchUICardViewController_displayLoadingViewAfterDelay___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "prepareLoadingView");
  objc_msgSend(*(id *)(a1 + 32), "loadingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SearchUICardViewController_displayLoadingViewAfterDelay___block_invoke_2;
  v4[3] = &unk_1EA1F62F0;
  v4[4] = *(_QWORD *)(a1 + 32);
  return +[SearchUIUtilities performAnimatableChanges:animated:](SearchUIUtilities, "performAnimatableChanges:animated:", v4, 1);
}

void __59__SearchUICardViewController_displayLoadingViewAfterDelay___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "loadingView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)prepareLoadingView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SearchUICardViewController loadingView](self, "loadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    -[SearchUICardViewController setLoadingView:](self, "setLoadingView:", v4);

    -[SearchUICardViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardViewController loadingView](self, "loadingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    -[SearchUICardViewController loadingView](self, "loadingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v7);

  }
  -[SearchUICardViewController loadingView](self, "loadingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

  -[SearchUICardViewController loadingView](self, "loadingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  -[SearchUICardViewController loadingView](self, "loadingView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLoadingState:", 0);

}

- (void)cardViewDidAppear
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  -[SearchUICardViewController feedbackListener](self, "feedbackListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0D8C230]);
    -[SearchUICardViewController card](self, "card");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v5, "initWithCard:", v6);

    objc_msgSend(v8, "setLevel:", -[SearchUICardViewController level](self, "level"));
    -[SearchUICardViewController feedbackListener](self, "feedbackListener");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardViewDidAppear:", v8);

  }
}

- (id)searchUIBackgroundColor
{
  void *v2;
  void *v3;

  -[SearchUICardViewController card](self, "card");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setShouldDrawBackgroundColor:(BOOL)a3
{
  if (self->_shouldDrawBackgroundColor != a3)
  {
    self->_shouldDrawBackgroundColor = a3;
    -[SearchUICardViewController updateBackgroundColor](self, "updateBackgroundColor");
  }
}

- (void)updateBackgroundColor
{
  _BOOL4 v3;
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
  void *v14;
  void *v15;
  id v16;

  v3 = -[SearchUICardViewController shouldDrawBackgroundColor](self, "shouldDrawBackgroundColor");
  if (v3)
  {
    -[SearchUICardViewController searchUIBackgroundColor](self, "searchUIBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[SearchUICardViewController colorView](self, "colorView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        v6 = (void *)objc_opt_new();
        -[SearchUICardViewController setColorView:](self, "setColorView:", v6);

        -[SearchUICardViewController colorView](self, "colorView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDelegate:", self);

        -[SearchUICardViewController colorView](self, "colorView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setShowsPlaceholderPlatterView:", 0);

        -[SearchUICardViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUICardViewController colorView](self, "colorView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertSubview:atIndex:", v10, 0);

        -[SearchUICardViewController colorView](self, "colorView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v11);

      }
    }
    -[SearchUICardViewController colorView](self, "colorView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColor:", v4);

    -[SearchUICardViewController card](self, "card");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backgroundImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardViewController colorView](self, "colorView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundImage:", v14);

  }
  -[SearchUICardViewController colorView](self, "colorView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", !v3);

}

- (id)viewContainingContent
{
  void *v2;
  void *v3;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)_loadAndEnrichCardSectionsFromCard:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__SearchUICardViewController__loadAndEnrichCardSectionsFromCard_withCompletionHandler___block_invoke;
  v7[3] = &unk_1EA1F6B00;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "loadCardSectionsWithCompletionHandler:", v7);

}

void __87__SearchUICardViewController__loadAndEnrichCardSectionsFromCard_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "legs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 != 1)
  {

LABEL_5:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_6;
  }
  objc_msgSend(v7, "legs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(id *)(a1 + 32);
  v13 = v3;
  v12 = v11;
  GEOFetchOfflineMapsDownloadURLForSFFlightLeg();

LABEL_6:
}

void __87__SearchUICardViewController__loadAndEnrichCardSectionsFromCard_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
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
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  if (v16)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    v4 = (void *)MEMORY[0x1E0CB3940];
    +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("DOWNLOAD_MAP_ACTION_TITLE_FORMAT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "arrivalAirport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "city");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBundleIdentifier:", v10);

    objc_msgSend(v9, "setActionTarget:", CFSTR("download-map"));
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setPunchout:", v9);
    v12 = (void *)objc_opt_new();
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBundleIdentifier:", v13);

    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeadingText:", v15);

    objc_msgSend(v14, "setImage:", v12);
    objc_msgSend(v14, "setCommand:", v11);
    objc_msgSend(v14, "setImageIsRightAligned:", 1);
    objc_msgSend(v3, "addObject:", v14);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)setCard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  SearchUICardViewController *v15;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardViewController setTitle:](self, "setTitle:", v5);

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTableModel:", 0);

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCard:", v4);

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 0.0);

  -[SearchUICardViewController loadingView](self, "loadingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", 0.0);

  -[SearchUICardViewController colorView](self, "colorView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  if (v4)
  {
    -[SearchUICardViewController displayLoadingViewAfterDelay:](self, "displayLoadingViewAfterDelay:", 0.7);
    v12 = (void *)objc_opt_class();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __38__SearchUICardViewController_setCard___block_invoke;
    v13[3] = &unk_1EA1F65B0;
    v14 = v4;
    v15 = self;
    objc_msgSend(v12, "_loadAndEnrichCardSectionsFromCard:withCompletionHandler:", v14, v13);

  }
  else
  {
    -[SearchUICardViewController prepareLoadingView](self, "prepareLoadingView");
    -[SearchUICardViewController updateWithCardSections:](self, "updateWithCardSections:", 0);
  }

}

void __38__SearchUICardViewController_setCard___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__SearchUICardViewController_setCard___block_invoke_2;
  v7[3] = &unk_1EA1F6518;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v7);

}

void __38__SearchUICardViewController_setCard___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "card");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "updateBackgroundColor");
    objc_msgSend(*(id *)(a1 + 40), "updateTimerAndCardSections:", *(_QWORD *)(a1 + 48));
  }
}

- (SFCard)card
{
  void *v2;
  void *v3;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "card");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFCard *)v3;
}

- (void)updateTimerAndCardSections:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SearchUICardViewController loadingScreenTimer](self, "loadingScreenTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isValid"))
  {
    v5 = objc_msgSend(v7, "count");

    if (!v5)
      -[SearchUICardViewController prepareLoadingView](self, "prepareLoadingView");
  }
  else
  {

  }
  -[SearchUICardViewController loadingScreenTimer](self, "loadingScreenTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SearchUICardViewController setLoadingScreenTimer:](self, "setLoadingScreenTimer:", 0);
  -[SearchUICardViewController updateWithCardSections:](self, "updateWithCardSections:", v7);

}

- (BOOL)hasCustomViewControllersForCardSections
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SearchUICardViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v3 = 0;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SearchUICardViewController card](self, "card", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v3, "customViewControllerForCardSection:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {

LABEL_15:
          LOBYTE(v6) = 1;
          goto LABEL_16;
        }
        if (!+[SearchUICardSectionCreator viewClassForCardSection:horizontal:](SearchUICardSectionCreator, "viewClassForCardSection:horizontal:", v9, 0)&& !+[SnippetUIUtilities supportsConfigurationForCardSection:](SnippetUIUtilities, "supportsConfigurationForCardSection:", v9))
        {
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_16:

  return v6;
}

- (void)updateWithCardSections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  SearchUICardViewController *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  SearchUICardViewController *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  SearchUICardViewController *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  SearchUICardViewController *v34;

  v4 = a3;
  -[SearchUICardViewController card](self, "card");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITableModel tableModelWithCardSections:result:isInline:queryId:shouldCombine:](SearchUITableModel, "tableModelWithCardSections:result:isInline:queryId:shouldCombine:", v4, 0, 0, objc_msgSend(v5, "queryId"), -[SearchUICardViewController hasCustomViewControllersForCardSections](self, "hasCustomViewControllersForCardSections") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICardViewController loadingView](self, "loadingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLoadingState:", 1);

  v8 = objc_msgSend(v4, "count");
  if (v8)
  {
    -[SearchUICardViewController tableViewController](self, "tableViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTableModel:", v6);

    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __53__SearchUICardViewController_updateWithCardSections___block_invoke;
    v33 = &unk_1EA1F62F0;
    v34 = self;
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __53__SearchUICardViewController_updateWithCardSections___block_invoke_2;
    v28 = &unk_1EA1F62F0;
    v29 = self;
    v10 = &v30;
    v11 = &v25;
  }
  else
  {
    v19 = self;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __53__SearchUICardViewController_updateWithCardSections___block_invoke_3;
    v23 = &unk_1EA1F62F0;
    v24 = self;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __53__SearchUICardViewController_updateWithCardSections___block_invoke_4;
    v18 = &unk_1EA1F62F0;
    v10 = &v20;
    v11 = &v15;
  }
  +[SearchUIUtilities performAnimatableChanges:animated:completion:](SearchUIUtilities, "performAnimatableChanges:animated:completion:", v10, 1, v11, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34);
  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "snapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardViewController setHasFocusableElements:](self, "setHasFocusableElements:", -[SearchUICardViewController hasFocusableElementsInSnapshot:](self, "hasFocusableElementsInSnapshot:", v14));

}

void __53__SearchUICardViewController_updateWithCardSections___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "loadingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "tableViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

uint64_t __53__SearchUICardViewController_updateWithCardSections___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "loadingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "cardViewDidAppear");
}

void __53__SearchUICardViewController_updateWithCardSections___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "loadingView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __53__SearchUICardViewController_updateWithCardSections___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "loadingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLoadingState:", 2);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__SearchUICardViewController_updateWithCardSections___block_invoke_5;
  v4[3] = &unk_1EA1F62F0;
  v4[4] = *(_QWORD *)(a1 + 32);
  return +[SearchUIUtilities performAnimatableChanges:](SearchUIUtilities, "performAnimatableChanges:", v4);
}

void __53__SearchUICardViewController_updateWithCardSections___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "loadingView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (BOOL)hasFocusableElementsInSnapshot:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
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
  objc_msgSend(a3, "itemIdentifiers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isFocusable") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)topRowWillFillBackgroundWithContent
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rowWillFillBackgroundWithContentAtIndexPath:", v4);

  return v5;
}

- (void)setCommandDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCommandDelegate:", v4);

}

- (SearchUICommandDelegate)commandDelegate
{
  void *v2;
  void *v3;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SearchUICommandDelegate *)v3;
}

- (void)setTextField:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextField:", v4);

}

- (UITextField)textField
{
  void *v2;
  void *v3;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextField *)v3;
}

- (void)setScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewForSizing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollEnabled:", v3);

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollViewForSizing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setSafeAreaInsetsFrozen:", v3 ^ 1);

}

- (BOOL)scrollEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollViewForSizing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScrollEnabled");

  return v4;
}

- (BOOL)threeDTouchEnabled
{
  void *v2;
  char v3;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "threeDTouchEnabled");

  return v3;
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  -[SearchUICardViewController card](self, "card");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SearchUICardViewController shouldForceEnableThreeDTouch:](self, "shouldForceEnableThreeDTouch:", v7) | v3;
  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setThreeDTouchEnabled:", v5);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)contentSizeDidChange:(CGSize)a3 animated:(BOOL)a4
{
  double height;
  CGFloat width;
  void *v8;
  char v9;
  uint64_t v10;
  _QWORD v11[7];
  _QWORD block[7];
  BOOL v13;

  height = a3.height;
  width = a3.width;
  -[SearchUICardViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  v10 = MEMORY[0x1E0C809B0];
  if ((v9 & 1) != 0 && height != 0.0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SearchUICardViewController_contentSizeDidChange_animated___block_invoke;
    block[3] = &unk_1EA1F8640;
    block[4] = self;
    *(CGFloat *)&block[5] = width;
    *(double *)&block[6] = height;
    v13 = a4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if (-[SearchUICardViewController isInPreviewPlatter](self, "isInPreviewPlatter"))
  {
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __60__SearchUICardViewController_contentSizeDidChange_animated___block_invoke_2;
    v11[3] = &unk_1EA1F8668;
    v11[4] = self;
    *(CGFloat *)&v11[5] = width;
    *(double *)&v11[6] = height;
    dispatch_async(MEMORY[0x1E0C80D38], v11);
  }
}

void __60__SearchUICardViewController_contentSizeDidChange_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardViewController:preferredContentSizeDidChange:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));

}

uint64_t __60__SearchUICardViewController_contentSizeDidChange_animated___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];
  __int128 v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__SearchUICardViewController_contentSizeDidChange_animated___block_invoke_3;
  v2[3] = &unk_1EA1F8668;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 40);
  return +[SearchUIUtilities performAnimatableChanges:](SearchUIUtilities, "performAnimatableChanges:", v2);
}

uint64_t __60__SearchUICardViewController_contentSizeDidChange_animated___block_invoke_3(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  double v5;
  CGRect v7;

  objc_msgSend(*(id *)(a1 + 32), "initialPreviewPlatterHeight");
  if (v2 == 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    objc_msgSend(*(id *)(a1 + 32), "setInitialPreviewPlatterHeight:", CGRectGetHeight(v7));

  }
  objc_msgSend(*(id *)(a1 + 32), "initialPreviewPlatterHeight");
  v5 = *(double *)(a1 + 48);
  if (v4 < v5)
    v5 = v4;
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", 0.0, v5);
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGSize result;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewContentSize");
  if (v5 == *MEMORY[0x1E0C9D820] && v4 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[SearchUICardViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v9 = v13;
    v11 = 44.0;

  }
  else
  {
    -[SearchUICardViewController tableViewController](self, "tableViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionViewContentSize");
    v9 = v8;
    v11 = v10;

    if (v11 == 0.0 && objc_msgSend(MEMORY[0x1E0DBDA48], "isSiri"))
      v11 = 1.0;
  }
  if (-[SearchUICardViewController isInPreviewPlatter](self, "isInPreviewPlatter"))
  {
    v18.receiver = self;
    v18.super_class = (Class)SearchUICardViewController;
    -[SearchUICardViewController preferredContentSize](&v18, sel_preferredContentSize);
    v9 = v14;
    v11 = v15;
  }
  v16 = v9;
  v17 = v11;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setFooterView:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SearchUICardViewController tableViewController](self, "tableViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFooterView:", v7);

  }
}

- (void)scrollAndSelectLastSelectedIndexPath
{
  id v2;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollAndSelectLastSelectedIndexPath");

}

- (void)setRestorationContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRestorationContext:", v8);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "card");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardViewController setCard:](self, "setCard:", v5);

    -[SearchUICardViewController setLevel:](self, "setLevel:", objc_msgSend(v8, "level"));
    objc_msgSend(v8, "card");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SearchUICardViewController loadingView](self, "loadingView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

    }
  }

}

- (id)restorationContext
{
  void *v3;
  void *v4;
  void *v5;

  -[SearchUICardViewController tableViewController](self, "tableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restorationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setLevel:", -[SearchUICardViewController level](self, "level"));
  -[SearchUICardViewController card](self, "card");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCard:", v5);

  return v4;
}

- (BOOL)shouldForceEnableThreeDTouch:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a3, "cardSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v8, "forceEnable3DTouch") & 1) != 0)
        {
LABEL_21:
          v15 = 1;
          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          objc_msgSend(v9, "cardSections", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v18;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v18 != v13)
                  objc_enumerationMutation(v10);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "forceEnable3DTouch") & 1) != 0)
                {

                  goto LABEL_21;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
              if (v12)
                continue;
              break;
            }
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v15 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_23:

  return v15;
}

- (BOOL)shouldDrawBackgroundColor
{
  return self->_shouldDrawBackgroundColor;
}

- (BOOL)hasFocusableElements
{
  return self->_hasFocusableElements;
}

- (void)setHasFocusableElements:(BOOL)a3
{
  self->_hasFocusableElements = a3;
}

- (SearchUIBackgroundColorView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
  objc_storeStrong((id *)&self->_colorView, a3);
}

- (SearchUILoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (NSTimer)loadingScreenTimer
{
  return self->_loadingScreenTimer;
}

- (void)setLoadingScreenTimer:(id)a3
{
  objc_storeStrong((id *)&self->_loadingScreenTimer, a3);
}

- (double)initialPreviewPlatterHeight
{
  return self->_initialPreviewPlatterHeight;
}

- (void)setInitialPreviewPlatterHeight:(double)a3
{
  self->_initialPreviewPlatterHeight = a3;
}

- (SearchUICardCollectionViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewController, a3);
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_loadingScreenTimer, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
}

@end
