@implementation SBFluidSwitcherModifierTimelineViewController

- (void)loadView
{
  NSMutableArray *v3;
  NSMutableArray *entryViews;
  id v5;
  SBFTouchPassThroughScrollView *v6;
  SBFTouchPassThroughScrollView *scrollView;
  UIButton *v8;
  UIButton *clearButton;
  void *v10;
  double v11;
  void *v12;
  UIButton *v13;
  UIButton *noiseLevelButton;
  void *v15;
  void *v16;
  UIButton *v17;
  UIButton *pauseButton;
  void *v19;
  void *v20;
  SBModifierTimelineDetailViewController *v21;
  SBModifierTimelineDetailViewController *detailViewController;
  UINavigationController *v23;
  UINavigationController *navigationController;
  void *v25;
  uint64_t v26;
  id v27;

  v27 = objc_alloc_init(MEMORY[0x1E0DA9F28]);
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  entryViews = self->_entryViews;
  self->_entryViews = v3;

  v5 = objc_alloc(MEMORY[0x1E0DA9F20]);
  v6 = (SBFTouchPassThroughScrollView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  scrollView = self->_scrollView;
  self->_scrollView = v6;

  -[SBFTouchPassThroughScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 1);
  -[SBFTouchPassThroughScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v27, "addSubview:", self->_scrollView);
  objc_msgSend(v27, "setClipsToBounds:", 0);
  -[SBFTouchPassThroughScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
  clearButton = self->_clearButton;
  self->_clearButton = v8;

  -[UIButton setTitle:forState:](self->_clearButton, "setTitle:forState:", CFSTR("Clear"), 0);
  -[UIButton addTarget:action:forControlEvents:](self->_clearButton, "addTarget:action:forControlEvents:", self, sel__reset_, 64);
  -[UIButton titleLabel](self->_clearButton, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CEB5D0];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 16.0, *MEMORY[0x1E0CEB5D0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v12);

  -[UIButton sizeToFit](self->_clearButton, "sizeToFit");
  objc_msgSend(v27, "addSubview:", self->_clearButton);
  self->_ignoreNoisyEvents = 1;
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v13 = (UIButton *)objc_claimAutoreleasedReturnValue();
  noiseLevelButton = self->_noiseLevelButton;
  self->_noiseLevelButton = v13;

  -[UIButton setTitle:forState:](self->_noiseLevelButton, "setTitle:forState:", CFSTR("Show All Events"), 0);
  -[UIButton addTarget:action:forControlEvents:](self->_noiseLevelButton, "addTarget:action:forControlEvents:", self, sel__toggleNoiseLevel_, 64);
  -[UIButton titleLabel](self->_noiseLevelButton, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 16.0, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v16);

  -[UIButton sizeToFit](self->_noiseLevelButton, "sizeToFit");
  objc_msgSend(v27, "addSubview:", self->_noiseLevelButton);
  self->_isPaused = 0;
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v17 = (UIButton *)objc_claimAutoreleasedReturnValue();
  pauseButton = self->_pauseButton;
  self->_pauseButton = v17;

  -[UIButton setTitle:forState:](self->_pauseButton, "setTitle:forState:", CFSTR("Pause"), 0);
  -[UIButton addTarget:action:forControlEvents:](self->_pauseButton, "addTarget:action:forControlEvents:", self, sel__togglePause_, 64);
  -[UIButton titleLabel](self->_pauseButton, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 16.0, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v20);

  -[UIButton sizeToFit](self->_pauseButton, "sizeToFit");
  objc_msgSend(v27, "addSubview:", self->_pauseButton);
  v21 = -[SBModifierTimelineDetailViewController initWithNibName:bundle:]([SBModifierTimelineDetailViewController alloc], "initWithNibName:bundle:", 0, 0);
  detailViewController = self->_detailViewController;
  self->_detailViewController = v21;

  v23 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", self->_detailViewController);
  navigationController = self->_navigationController;
  self->_navigationController = v23;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "userInterfaceIdiom");

  if ((v26 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[UINavigationController setModalPresentationStyle:](self->_navigationController, "setModalPresentationStyle:", 7);
  -[SBFluidSwitcherModifierTimelineViewController setView:](self, "setView:", v27);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherModifierTimelineViewController;
  -[SBFluidSwitcherModifierTimelineViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[SBFluidSwitcherModifierTimelineViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[SBFTouchPassThroughScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, 0.0, 0.0, v7 + -40.0);
}

- (void)addEntry:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  SBFTouchPassThroughScrollView *scrollView;
  double v20;
  SBFluidSwitcherModifierTimelineEntryView *v21;
  SBFluidSwitcherModifierTimelineEntryView *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  SBFTouchPassThroughScrollView *v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_isPaused)
  {
    if (-[NSMutableArray count](self->_entryViews, "count") == 150)
    {
      -[NSMutableArray firstObject](self->_entryViews, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");
      -[NSMutableArray removeObject:](self->_entryViews, "removeObject:", v5);
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v6 = self->_entryViews;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v37;
        v10 = 10.0;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v37 != v9)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v12, "frame", (_QWORD)v36);
            v14 = v13;
            objc_msgSend(v12, "frame");
            v16 = v15;
            objc_msgSend(v12, "frame");
            objc_msgSend(v12, "setFrame:", v10, v14, v16);
            objc_msgSend(v12, "frame");
            v10 = v17 + v18 + 10.0;
          }
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v8);
      }
      else
      {
        v10 = 10.0;
      }

      -[SBFTouchPassThroughScrollView setContentSize:](self->_scrollView, "setContentSize:", v10, 0.0);
      scrollView = self->_scrollView;
      -[SBFTouchPassThroughScrollView frame](scrollView, "frame");
      -[SBFTouchPassThroughScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 0, v10 - v20, 0.0);

    }
    v21 = [SBFluidSwitcherModifierTimelineEntryView alloc];
    v22 = -[SBFluidSwitcherModifierTimelineEntryView initWithFrame:entry:](v21, "initWithFrame:entry:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[SBFluidSwitcherModifierTimelineEntryView setDelegate:](v22, "setDelegate:", self);
    -[SBFTouchPassThroughScrollView addSubview:](self->_scrollView, "addSubview:", v22);
    -[SBFluidSwitcherModifierTimelineEntryView setNeedsLayout](v22, "setNeedsLayout");
    -[SBFluidSwitcherModifierTimelineEntryView layoutIfNeeded](v22, "layoutIfNeeded");
    v23 = 10.0;
    if (-[NSMutableArray count](self->_entryViews, "count"))
    {
      -[NSMutableArray lastObject](self->_entryViews, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "frame");
      v26 = v25;
      objc_msgSend(v24, "frame");
      v23 = v26 + v27 + 10.0;

    }
    -[SBFluidSwitcherModifierTimelineEntryView frame](v22, "frame", (_QWORD)v36);
    v29 = v28;
    -[SBFluidSwitcherModifierTimelineEntryView frame](v22, "frame");
    -[SBFluidSwitcherModifierTimelineEntryView setFrame:](v22, "setFrame:", v23, 35.0, v29);
    -[NSMutableArray addObject:](self->_entryViews, "addObject:", v22);
    -[SBFluidSwitcherModifierTimelineEntryView frame](v22, "frame");
    v30 = CGRectGetMaxX(v42) + 10.0;
    -[SBFTouchPassThroughScrollView setContentSize:](self->_scrollView, "setContentSize:", v30, 0.0);
    -[SBFluidSwitcherModifierTimelineViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "frame");
    v33 = v32;

    if (v30 > v33)
    {
      v34 = self->_scrollView;
      -[SBFTouchPassThroughScrollView frame](v34, "frame");
      -[SBFTouchPassThroughScrollView setContentOffset:animated:](v34, "setContentOffset:animated:", 1, v30 - v35, 0.0);
    }

  }
}

- (void)didSelectEntryView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  SBModifierTimelineDetailViewController *detailViewController;
  void *v11;
  SBModifierTimelineDetailViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = -[UINavigationController popToRootViewControllerAnimated:](self->_navigationController, "popToRootViewControllerAnimated:", 0);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[UINavigationController popoverPresentationController](self->_navigationController, "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSourceView:", v16);

    -[UINavigationController popoverPresentationController](self->_navigationController, "popoverPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    objc_msgSend(v8, "setSourceRect:", v9 * 0.5, 35.0, 1.0, 1.0);

    -[UINavigationController setPreferredContentSize:](self->_navigationController, "setPreferredContentSize:", 600.0, 1.79769313e308);
  }
  detailViewController = self->_detailViewController;
  objc_msgSend(v16, "entry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBModifierTimelineDetailViewController setEntry:](detailViewController, "setEntry:", v11);

  v12 = self->_detailViewController;
  objc_msgSend(v16, "entry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "eventSnapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBModifierTimelineDetailViewController setTitle:](v12, "setTitle:", v15);

  -[SBFluidSwitcherModifierTimelineViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_navigationController, 1, 0);
}

- (void)viewWillLayoutSubviews
{
  SBFTouchPassThroughScrollView *scrollView;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double MinY;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v19.receiver = self;
  v19.super_class = (Class)SBFluidSwitcherModifierTimelineViewController;
  -[SBFluidSwitcherModifierTimelineViewController viewWillLayoutSubviews](&v19, sel_viewWillLayoutSubviews);
  scrollView = self->_scrollView;
  -[SBFluidSwitcherModifierTimelineViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SBFTouchPassThroughScrollView setFrame:](scrollView, "setFrame:");

  -[UIButton frame](self->_clearButton, "frame");
  v6 = v5;
  -[UIButton frame](self->_clearButton, "frame");
  v8 = v7;
  -[UIButton setFrame:](self->_clearButton, "setFrame:", 10.0, 5.0, v6);
  v20.origin.x = 10.0;
  v20.origin.y = 5.0;
  v20.size.width = v6;
  v20.size.height = v8;
  v9 = CGRectGetMaxX(v20) + 20.0;
  v21.origin.x = 10.0;
  v21.origin.y = 5.0;
  v21.size.width = v6;
  v21.size.height = v8;
  MinY = CGRectGetMinY(v21);
  -[UIButton frame](self->_noiseLevelButton, "frame");
  v12 = v11;
  -[UIButton frame](self->_noiseLevelButton, "frame");
  v14 = v13;
  -[UIButton setFrame:](self->_noiseLevelButton, "setFrame:", v9, MinY, v12);
  v22.origin.x = v9;
  v22.origin.y = MinY;
  v22.size.width = v12;
  v22.size.height = v14;
  v15 = CGRectGetMaxX(v22) + 20.0;
  v23.origin.x = v9;
  v23.origin.y = MinY;
  v23.size.width = v12;
  v23.size.height = v14;
  v16 = CGRectGetMinY(v23);
  -[UIButton frame](self->_pauseButton, "frame");
  v18 = v17;
  -[UIButton frame](self->_pauseButton, "frame");
  -[UIButton setFrame:](self->_pauseButton, "setFrame:", v15, v16, v18);
}

- (void)_reset:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  v4 = self->_entryViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removeFromSuperview", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_entryViews, "removeAllObjects");
  -[SBFTouchPassThroughScrollView setContentSize:](self->_scrollView, "setContentSize:", 0.0, 0.0);
  -[SBFTouchPassThroughScrollView setContentOffset:](self->_scrollView, "setContentOffset:", 0.0, 0.0);
}

- (void)_toggleNoiseLevel:(id)a3
{
  _BOOL4 ignoreNoisyEvents;
  UIButton *noiseLevelButton;
  const __CFString *v6;
  id v7;

  ignoreNoisyEvents = self->_ignoreNoisyEvents;
  self->_ignoreNoisyEvents = !ignoreNoisyEvents;
  noiseLevelButton = self->_noiseLevelButton;
  if (ignoreNoisyEvents)
    v6 = CFSTR("Ignore Noisy Events");
  else
    v6 = CFSTR("Show All Events");
  -[UIButton setTitle:forState:](noiseLevelButton, "setTitle:forState:", v6, 0);
  -[UIButton sizeToFit](self->_noiseLevelButton, "sizeToFit");
  -[SBFluidSwitcherModifierTimelineViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)_togglePause:(id)a3
{
  _BOOL4 isPaused;
  UIButton *pauseButton;
  const __CFString *v6;
  id v7;

  isPaused = self->_isPaused;
  self->_isPaused = !isPaused;
  pauseButton = self->_pauseButton;
  if (isPaused)
    v6 = CFSTR("Pause");
  else
    v6 = CFSTR("Resume");
  -[UIButton setTitle:forState:](pauseButton, "setTitle:forState:", v6, 0);
  -[UIButton sizeToFit](self->_pauseButton, "sizeToFit");
  -[SBFluidSwitcherModifierTimelineViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (BOOL)ignoreNoisyEvents
{
  return self->_ignoreNoisyEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_pauseButton, 0);
  objc_storeStrong((id *)&self->_noiseLevelButton, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_entryViews, 0);
}

@end
