@implementation SearchUIResultsViewController

- (id)contentScrollView
{
  void *v2;
  void *v3;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "majorScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SearchUIResultsCollectionViewController)resultsTableViewController
{
  return self->_resultsTableViewController;
}

- (NSArray)sections
{
  return self->_sections;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)footerView
{
  void *v2;
  void *v3;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (double)distanceToTopOfAppIcons
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerHeight");
  v4 = v3;
  +[SearchUITableViewCell distanceToTopOfAppIconsForMultiResultCell](SearchUITableViewCell, "distanceToTopOfAppIconsForMultiResultCell");
  v6 = v4 + v5;

  return v6;
}

- (void)didPresentToResumeSearch:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didPresentToResumeSearch:", v3);

}

- (void)setCommandDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCommandDelegate:", v4);

}

void __65__SearchUIResultsViewController_setShowsVerticalScrollIndicator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "resultsTableViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "majorScrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flashScrollIndicators");

  }
}

- (UISearchTextField)searchField
{
  void *v2;
  void *v3;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISearchTextField *)v3;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)SearchUIResultsViewController;
  -[SearchUIResultsViewController viewDidLayoutSubviews](&v23, sel_viewDidLayoutSubviews);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SearchUIResultsViewController childViewControllers](self, "childViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
        -[SearchUIResultsViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bounds");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        objc_msgSend(v8, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

}

- (SearchUIResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SearchUIResultsViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SearchUIResultsViewController;
  v4 = -[SearchUIResultsViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    -[SearchUIResultsViewController setView:](v4, "setView:", v5);

    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setInteractionDelegate:", v4);
    objc_msgSend(v6, "setSizingDelegate:", v4);
    -[SearchUIResultsViewController addChildViewController:](v4, "addChildViewController:", v6);
    -[SearchUIResultsViewController view](v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel_didTap);
    objc_msgSend(v9, "setDelegate:", v4);
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", v9);

    objc_msgSend(v6, "majorScrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "panGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requireGestureRecognizerToFail:", v12);

    -[SearchUIResultsViewController setResultsTableViewController:](v4, "setResultsTableViewController:", v6);
  }
  return v4;
}

- (void)setResultsTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_resultsTableViewController, a3);
}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[SearchUIResultsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldUseInsetRoundedSections:", v3);

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldUseInsetRoundedSections:", v3);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SearchUIResultsViewController navigationController](self, "navigationController", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v13, "setShouldUseInsetRoundedSections:", v3);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)contentSizeDidChange:(CGSize)a3 animated:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  void *v8;
  char v9;
  _QWORD v10[7];
  BOOL v11;

  height = a3.height;
  width = a3.width;
  -[SearchUIResultsViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__SearchUIResultsViewController_contentSizeDidChange_animated___block_invoke;
    v10[3] = &unk_1EA1F8640;
    v10[4] = self;
    *(CGFloat *)&v10[5] = width;
    *(CGFloat *)&v10[6] = height;
    v11 = a4;
    dispatch_async(MEMORY[0x1E0C80D38], v10);
  }
}

- (void)setRestorationContextClass:(Class)a3
{
  id v4;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRestorationContextClass:", a3);

}

- (void)setAdditionalKeyboardHeight:(double)a3
{
  id v4;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdditionalKeyboardHeight:", a3);

}

- (void)setFeedbackListener:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFeedbackListener:", v4);

}

- (void)setSearchField:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextField:", v4);

}

- (void)highlightResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "highlightResult:", v4);

}

void __63__SearchUIResultsViewController_contentSizeDidChange_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resultsViewController:didChangeContentSize:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SearchUIResultsViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SearchUIResultsViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didUpdateKeyboardFocusToResult:cardSection:", v10, v6);

  }
}

- (SearchUIResultsViewDelegate)delegate
{
  return (SearchUIResultsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setViewDidUpdateHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setViewDidUpdateHandler:", v4);

}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD block[5];

  v3 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "majorScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsVerticalScrollIndicator:", v3);

  if (v3)
  {
    v7 = dispatch_time(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__SearchUIResultsViewController_setShowsVerticalScrollIndicator___block_invoke;
    block[3] = &unk_1EA1F62F0;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);
  }
}

- (void)updateWithResultSections:(id)a3 resetScrollPoint:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v9;
  id v10;

  v5 = a5;
  v6 = a4;
  objc_storeStrong((id *)&self->_sections, a3);
  v9 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateWithResultSections:scrollToTop:animated:", v9, v6, v5);

}

- (void)setFooterView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFooterView:", v4);

}

- (void)setShouldMonitorScrollingPastBottomOfContent:(BOOL)a3
{
  self->_shouldMonitorScrollingPastBottomOfContent = a3;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResultsViewDelegate:", obj);

  }
}

- (void)restoreResultsIfNeeded
{
  id v2;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restoreResultsIfNeeded");

}

- (double)additionalKeyboardHeight
{
  void *v2;
  double v3;
  double v4;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalKeyboardHeight");
  v4 = v3;

  return v4;
}

- (void)didScrollPastBottomOfContent
{
  void *v3;
  char v4;
  id v5;

  -[SearchUIResultsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SearchUIResultsViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didScrollPastBottomOfContent");

  }
}

- (void)didBeginScrolling
{
  void *v3;
  char v4;
  id v5;

  -[SearchUIResultsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SearchUIResultsViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didBeginScrollingResults");

  }
}

- (void)didFocusOnCell:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "keyboardResultForFocus");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardCardSectionForFocus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIResultsViewController didUpdateKeyboardFocusToResult:cardSection:](self, "didUpdateKeyboardFocusToResult:cardSection:", v6, v5);
}

- (void)replaceResult:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceResult:withResult:", v7, v6);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  char v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "majorScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "majorScrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentSize");
  v14 = v10 > v13;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "majorScrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "majorScrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "contentSize");
    v21 = v20;
    objc_msgSend(v19, "sectionFooterHeight");
    if (v10 <= v21 - v22)
    {
      objc_msgSend(v19, "indexPathForRowAtPoint:", v8, v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v19, "cellForRowAtIndexPath:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v24, "isHidden");

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 1;
    }

  }
  return v14;
}

- (void)didTap
{
  void *v3;
  char v4;
  id v5;

  -[SearchUIResultsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SearchUIResultsViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didTapInEmptyRegion");

  }
}

- (SFFeedbackListener)feedbackListener
{
  void *v2;
  void *v3;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedbackListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFFeedbackListener *)v3;
}

- (SearchUICommandDelegate)commandDelegate
{
  void *v2;
  void *v3;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SearchUICommandDelegate *)v3;
}

- (void)setShouldHideResultsUnderKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldHideTableCellsUnderKeyboard:", v3);

}

- (BOOL)shouldHideResultsUnderKeyboard
{
  void *v2;
  char v3;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldHideTableCellsUnderKeyboard");

  return v3;
}

- (BOOL)shouldUseInsetRoundedSections
{
  void *v2;
  char v3;

  -[SearchUIResultsViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUseInsetRoundedSections");

  return v3;
}

- (void)setDragInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDragInteractionEnabled:", v3);

}

- (BOOL)dragInteractionEnabled
{
  void *v2;
  char v3;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dragInteractionEnabled");

  return v3;
}

- (void)setScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "majorScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (BOOL)scrollEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "majorScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScrollEnabled");

  return v4;
}

- (BOOL)showsVerticalScrollIndicator
{
  void *v2;
  void *v3;
  char v4;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "majorScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsVerticalScrollIndicator");

  return v4;
}

- (void)setShouldUseStandardSectionInsets:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldUseStandardSectionInsets:", v3);

}

- (BOOL)shouldUseStandardSectionInsets
{
  void *v2;
  char v3;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUseStandardSectionInsets");

  return v3;
}

- (void)updateWithResultSections:(id)a3
{
  -[SearchUIResultsViewController updateWithResultSections:resetScrollPoint:](self, "updateWithResultSections:resetScrollPoint:", a3, 1);
}

- (void)updateWithResultSections:(id)a3 resetScrollPoint:(BOOL)a4
{
  -[SearchUIResultsViewController updateWithResultSections:resetScrollPoint:animated:](self, "updateWithResultSections:resetScrollPoint:animated:", a3, a4, 0);
}

- (NSString)queryString
{
  void *v2;
  void *v3;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setQueryString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryString:", v4);

}

- (void)setSections:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SearchUICardViewController *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  SearchUICardViewController *v26;
  BOOL v27;
  SearchUICardViewController *v28;
  SearchUICardViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  SearchUIResultsViewController *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SearchUIResultsViewController updateWithResultSections:](self, "updateWithResultSections:", v4);
  if (-[SearchUIResultsViewController immediatelyShowCardForSingleResult](self, "immediatelyShowCardForSingleResult"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (!v6)
    {
      v8 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v7 = v6;
    v36 = self;
    v37 = v4;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v12, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("com.apple.lookup."));

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v12, "results");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v9 += objc_msgSend(v15, "count");

          if (v9 > 1)
          {
            v4 = v37;
            goto LABEL_31;
          }
          if (v9 == 1)
          {
            v16 = v12;

            v8 = v16;
            v9 = 1;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v7)
        continue;
      break;
    }

    v4 = v37;
    if (v8)
    {
      objc_msgSend(v8, "results");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUITableModel tableModelWithResult:](SearchUITableModel, "tableModelWithResult:", v18);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      v35 = objc_msgSend(v5, "numberOfSections");
      if (v35 >= 1)
      {
        v19 = 0;
        v20 = 0;
        do
        {
          v21 = objc_msgSend(v5, "numberOfRowsForSection:", v19);
          if (v21 >= 1)
          {
            v22 = v21;
            for (j = 0; j != v22; ++j)
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", j, v19);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "rowModelForIndexPath:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "nextCard");
              v26 = (SearchUICardViewController *)objc_claimAutoreleasedReturnValue();

              if (v26)
                v27 = v26 == v20;
              else
                v27 = 1;
              if (!v27)
              {
                v28 = v20;
                if (v20)
                  goto LABEL_28;
                v20 = v26;
              }

            }
          }
          ++v19;
        }
        while (v19 != v35);
        if (v20)
        {
          v29 = [SearchUICardViewController alloc];
          -[SearchUIResultsViewController feedbackListener](v36, "feedbackListener");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[SearchUICardViewController initWithCard:feedbackListener:](v29, "initWithCard:feedbackListener:", v20, v30);

          -[SearchUIResultsViewController addChildViewController:](v36, "addChildViewController:", v26);
          -[SearchUIResultsViewController view](v36, "view");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUICardViewController view](v26, "view");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addSubview:", v32);

          -[SearchUIResultsViewController resultsTableViewController](v36, "resultsTableViewController");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "view");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setHidden:", 1);

          v28 = v20;
          v4 = v37;
LABEL_28:

        }
      }
      goto LABEL_31;
    }
  }
LABEL_32:

}

- (double)contentHeightForWidth:(double)a3 maxHeight:(double)a4
{
  return 0.0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIResultsViewController;
  -[SearchUIResultsViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (-[SearchUIResultsViewController shouldMonitorScrollingPastBottomOfContent](self, "shouldMonitorScrollingPastBottomOfContent"))
  {
    -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollTableToTop");

  }
}

- (CGSize)contentSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewContentSize");
  v7 = v6;
  v9 = v8;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "numberOfSections");

  if (v12)
  {
    if (v7 == *MEMORY[0x1E0C9D820] && v9 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[SearchUIResultsViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      v7 = v15;

      v9 = 44.0;
    }
  }
  v16 = v7;
  v17 = v9;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setViewWillUpdateHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setViewWillUpdateHandler:", v4);

}

- (void)iterateIndexPaths:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iterateIndexPaths:", v4);

}

- (void)performScrollTestWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performScrollTestWithCompletion:", v4);

}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  return v3;
}

- (void)performScrollTestWithHandlerForFirstScrollCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performScrollTestWithHandlerForFirstScrollCompletion:completion:", v7, v6);

}

- (void)performRecapScrollTestWithTestName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performRecapScrollTestWithTestName:completion:", v7, v6);

}

- (void)tapAtIndexPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tapAtIndexPath:", v4);

}

- (CGRect)scrollToIndexPath:(id)a3
{
  id v4;
  void *v5;
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
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollToIndexPath:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)toggleShowMoreForSection:(unint64_t)a3
{
  id v4;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleShowMoreForSection:", a3);

}

- (void)purgeMemory
{
  id v2;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purgeMemory");

}

- (void)performReturnKeyPressAction
{
  id v2;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "returnKeyPressed");

}

- (void)willDismiss
{
  id v2;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willDismiss");

}

- (void)scrollAndSelectLastSelectedIndexPath
{
  id v2;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollAndSelectLastSelectedIndexPath");

}

- (void)setRestorationContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRestorationContext:", v4);

}

- (id)restorationContext
{
  void *v2;
  void *v3;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restorationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (Class)restorationContextClass
{
  void *v2;
  void *v3;

  -[SearchUIResultsViewController resultsTableViewController](self, "resultsTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restorationContextClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (id)viewDidUpdateHandler
{
  return self->viewDidUpdateHandler;
}

- (id)viewWillUpdateHandler
{
  return self->viewWillUpdateHandler;
}

- (BOOL)immediatelyShowCardForSingleResult
{
  return self->_immediatelyShowCardForSingleResult;
}

- (void)setImmediatelyShowCardForSingleResult:(BOOL)a3
{
  self->_immediatelyShowCardForSingleResult = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSString)previousSearchString
{
  return self->_previousSearchString;
}

- (void)setPreviousSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_previousSearchString, a3);
}

- (BOOL)shouldMonitorScrollingPastBottomOfContent
{
  return self->_shouldMonitorScrollingPastBottomOfContent;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previousSearchString, 0);
  objc_storeStrong((id *)&self->_resultsTableViewController, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong(&self->viewWillUpdateHandler, 0);
  objc_storeStrong(&self->viewDidUpdateHandler, 0);
}

@end
