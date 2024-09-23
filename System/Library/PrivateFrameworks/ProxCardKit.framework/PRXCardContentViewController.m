@implementation PRXCardContentViewController

- (PRXCardContentViewController)initWithContentView:(id)a3
{
  id v5;
  PRXCardContentViewController *v6;
  PRXCardContentViewController *v7;
  PRXCardContentView **p_contentView;
  PRXCardContentWrapperView *v9;
  PRXCardContentWrapperView *wrapperView;
  PRXCardContentViewController *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRXCardContentViewController;
  v6 = -[PRXCardContentViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    p_contentView = &v6->_contentView;
    objc_storeStrong((id *)&v6->_contentView, a3);
    -[PRXCardContentViewController _prxCommonInit](v7, "_prxCommonInit");
    if (*p_contentView)
    {
      v9 = -[PRXCardContentWrapperView initWithContentView:]([PRXCardContentWrapperView alloc], "initWithContentView:", *p_contentView);
      wrapperView = v7->_wrapperView;
      v7->_wrapperView = v9;

    }
    v11 = v7;
  }

  return v7;
}

- (void)_prxCommonInit
{
  NSArray *actions;
  PRXTransitioningController *v4;
  PRXTransitioningController *transitionController;

  actions = self->_actions;
  self->_actions = (NSArray *)MEMORY[0x24BDBD1A8];

  -[PRXCardContentViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 4);
  v4 = -[PRXTransitioningController initWithPullDismissalProvider:]([PRXTransitioningController alloc], "initWithPullDismissalProvider:", self);
  transitionController = self->_transitionController;
  self->_transitionController = v4;

  -[PRXCardContentViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", self->_transitionController);
  -[PRXCardContentViewController setDismissButtonAction:](self, "setDismissButtonAction:", 0);
}

- (PRXCardContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[PRXCardContentViewController initWithContentView:](self, "initWithContentView:", 0, a4);
}

+ (Class)contentViewClass
{
  return (Class)objc_opt_class();
}

- (PRXCardContentView)contentView
{
  -[PRXCardContentViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_contentView;
}

- (void)loadView
{
  void *v3;
  PRXCardContentView *v4;
  PRXCardContentView *contentView;
  PRXCardContentWrapperView *v6;
  PRXCardContentWrapperView *wrapperView;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "contentViewClass");
  if ((objc_msgSend(v3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDBCE88];
    v9 = *MEMORY[0x24BDBCA98];
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("-[%@ contentViewClass] must return a subclass of PRXCardContentView"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v14);
  }
  if (!self->_contentView)
  {
    v4 = (PRXCardContentView *)objc_msgSend(objc_alloc((Class)v3), "initWithCardStyle:", 0);
    contentView = self->_contentView;
    self->_contentView = v4;

    v6 = -[PRXCardContentWrapperView initWithContentView:]([PRXCardContentWrapperView alloc], "initWithContentView:", self->_contentView);
    wrapperView = self->_wrapperView;
    self->_wrapperView = v6;

  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)MEMORY[0x24BDBCE88];
    v16 = *MEMORY[0x24BDBCA98];
    v17 = (void *)MEMORY[0x24BDD17C8];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@'s contentView must be a %@"), v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v21, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v22);
  }
  -[PRXCardContentViewController setView:](self, "setView:", self->_wrapperView);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXCardContentViewController;
  -[PRXCardContentViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PRXCardContentViewController _updateTitleLabel](self, "_updateTitleLabel");
  -[PRXCardContentViewController _updateSubtitleLabel](self, "_updateSubtitleLabel");
  -[PRXCardContentViewController _updateDismisalControls](self, "_updateDismisalControls");
  -[PRXCardContentViewController _updateActionButtons](self, "_updateActionButtons");
}

- (void)updatePreferredContentSizeForCardWidth:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[PRXCardContentViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateTitleTextViewExclusionPathsForCardWidth:", a3);

  -[PRXCardContentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1148846080;
  LODWORD(v8) = 1112014848;
  objc_msgSend(v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v7, v8);
  v10 = v9;
  v12 = v11;

  -[PRXCardContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v12);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  CGFloat Width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)PRXCardContentViewController;
  -[PRXCardContentViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  if (!self->_transitioningSize)
  {
    -[PRXCardContentViewController contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentView bounds](self->_contentView, "bounds");
    objc_msgSend(v3, "updateTitleTextViewExclusionPathsForCardWidth:", CGRectGetWidth(v16));

    -[PRXCardContentViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentView bounds](self->_contentView, "bounds");
    Width = CGRectGetWidth(v17);
    LODWORD(v6) = 1148846080;
    LODWORD(v7) = 1112014848;
    objc_msgSend(v4, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v6, v7);
    v9 = v8;
    v11 = v10;

    -[PRXCardContentViewController preferredContentSize](self, "preferredContentSize");
    if (v9 != v13 || v11 != v12)
      -[PRXCardContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, v11);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)PRXCardContentViewController;
  v7 = a4;
  -[PRXCardContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  self->_transitioningSize = 1;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __83__PRXCardContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_24CC31EC0;
  v9[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v9);

  -[PRXCardContentViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateTitleTextViewExclusionPathsForCardWidth:", width);

}

uint64_t __83__PRXCardContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 976) = 0;
  return result;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  -[PRXCardContentWrapperView setContentOffset:animated:](self->_wrapperView, "setContentOffset:animated:", a4, a3.x, a3.y);
}

- (void)setTitle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRXCardContentViewController;
  -[PRXCardContentViewController setTitle:](&v4, sel_setTitle_, a3);
  -[PRXCardContentViewController _updateTitleLabel](self, "_updateTitleLabel");
}

- (void)_updateTitleLabel
{
  uint64_t v3;
  PRXCardContentView *contentView;
  void *v5;
  uint64_t v6;
  id v7;

  if (-[PRXCardContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PRXCardContentViewController title](self, "title");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "length");
    contentView = self->_contentView;
    if (v3)
    {
      -[PRXCardContentView titleTextView](contentView, "titleTextView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[PRXTextView textViewWithStyle:](PRXTextView, "textViewWithStyle:", 0);
        v6 = objc_claimAutoreleasedReturnValue();

        -[PRXCardContentView setTitleView:](self->_contentView, "setTitleView:", v6);
        v5 = (void *)v6;
      }
      objc_msgSend(v5, "setTitleText:", v7);

    }
    else
    {
      -[PRXCardContentView setTitleView:](contentView, "setTitleView:", 0);
    }
    -[PRXCardContentWrapperView setTitle:](self->_wrapperView, "setTitle:", v7);

  }
}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  subtitle = self->_subtitle;
  if (subtitle != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](subtitle, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_subtitle;
      self->_subtitle = v7;

      if (v10)
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v10);
      else
        v9 = 0;
      -[PRXCardContentViewController setAttributedSubtitle:](self, "setAttributedSubtitle:", v9);

      v4 = v10;
    }
  }

}

- (void)_updateSubtitleLabel
{
  NSUInteger v3;
  PRXCardContentView *contentView;
  void *v5;
  id v6;
  id v7;

  if (-[PRXCardContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = -[NSAttributedString length](self->_attributedSubtitle, "length");
    contentView = self->_contentView;
    if (v3)
    {
      -[PRXCardContentView subtitleLabel](contentView, "subtitleLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        +[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 1);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        -[PRXCardContentView setSubtitleLabel:](self->_contentView, "setSubtitleLabel:", v6);
        v5 = v6;
      }
      v7 = v5;
      objc_msgSend(v5, "setAttributedText:", self->_attributedSubtitle);

    }
    else
    {
      -[PRXCardContentView setSubtitleLabel:](contentView, "setSubtitleLabel:", 0);
    }
  }
}

- (void)setAttributedSubtitle:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedSubtitle;
  char v6;
  NSAttributedString *v7;
  NSAttributedString *v8;
  NSAttributedString *v9;

  v4 = (NSAttributedString *)a3;
  attributedSubtitle = self->_attributedSubtitle;
  if (attributedSubtitle != v4)
  {
    v9 = v4;
    v6 = -[NSAttributedString isEqual:](attributedSubtitle, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSAttributedString *)-[NSAttributedString copy](v9, "copy");
      v8 = self->_attributedSubtitle;
      self->_attributedSubtitle = v7;

      -[PRXCardContentViewController _updateSubtitleLabel](self, "_updateSubtitleLabel");
      v4 = v9;
    }
  }

}

- (void)setBottomTrayTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *bottomTrayTitle;
  id v7;

  v4 = a3;
  -[PRXCardContentViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v5 = (NSString *)objc_msgSend(v4, "copy");
  bottomTrayTitle = self->_bottomTrayTitle;
  self->_bottomTrayTitle = v5;

  -[PRXCardContentWrapperView bottomTray](self->_wrapperView, "bottomTray");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v4);

}

- (UIImageView)bottomTrayImageView
{
  void *v2;
  void *v3;

  -[PRXCardContentWrapperView bottomTray](self->_wrapperView, "bottomTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImageView *)v3;
}

- (void)setBottomTrayImageView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRXCardContentViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[PRXCardContentWrapperView bottomTray](self->_wrapperView, "bottomTray");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageView:", v4);

}

- (void)scrollToBottom
{
  void *v3;

  -[PRXCardContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[PRXCardContentWrapperView scrollToBottom](self->_wrapperView, "scrollToBottom");
  self->_shouldAutoScrollToBottom = 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRXCardContentViewController;
  -[PRXCardContentViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  if (self->_shouldAutoScrollToBottom)
    -[PRXCardContentViewController scrollToBottom](self, "scrollToBottom");
}

- (void)setDismissalType:(unint64_t)a3
{
  if (self->_dismissalType != a3)
  {
    self->_dismissalType = a3;
    -[PRXCardContentViewController _updateDismisalControls](self, "_updateDismisalControls");
  }
}

- (void)setDismissButtonAction:(id)a3
{
  PRXAction *v4;
  PRXAction *v5;
  PRXAction *dismissButtonAction;
  void *v7;
  PRXAction *v8;

  v4 = (PRXAction *)a3;
  if (!v4 || self->_dismissButtonAction != v4)
  {
    v8 = v4;
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      +[PRXAction defaultDismissalActionForViewController:](PRXAction, "defaultDismissalActionForViewController:", self);
      v5 = (PRXAction *)objc_claimAutoreleasedReturnValue();
    }
    dismissButtonAction = self->_dismissButtonAction;
    self->_dismissButtonAction = v5;

    -[PRXCardContentView dismissButton](self->_contentView, "dismissButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXAction setButton:](self->_dismissButtonAction, "setButton:", v7);

    v4 = v8;
  }

}

- (void)_updateDismisalControls
{
  id v3;

  if (-[PRXCardContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    if ((self->_dismissalType & 1) != 0)
    {
      +[PRXButton buttonWithProximityType:](PRXButton, "buttonWithProximityType:", 2);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[PRXAction setButton:](self->_dismissButtonAction, "setButton:", v3);
      -[PRXCardContentView setDismissButton:](self->_contentView, "setDismissButton:", v3);

    }
    else
    {
      -[PRXCardContentView setDismissButton:](self->_contentView, "setDismissButton:", 0);
    }
  }
}

- (id)dismissalConfirmationActionWithTitle:(id)a3 message:(id)a4 confirmButtonTitle:(id)a5 cancelButtonTitle:(id)a6
{
  return +[PRXAction dismissalConfirmationActionForViewController:withTitle:message:confirmButtonTitle:cancelButtonTitle:](PRXAction, "dismissalConfirmationActionForViewController:withTitle:message:confirmButtonTitle:cancelButtonTitle:", self, a3, a4, a5, a6);
}

- (id)addAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSArray *v9;
  NSArray *actions;

  v4 = a3;
  v5 = (void *)-[NSArray mutableCopy](self->_actions, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "addObject:", v4);
  v9 = (NSArray *)objc_msgSend(v8, "copy");
  actions = self->_actions;
  self->_actions = v9;

  -[PRXCardContentViewController _updateActionButtons](self, "_updateActionButtons");
  return v4;
}

- (void)removeAction:(id)a3
{
  NSArray *actions;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  id v11;

  actions = self->_actions;
  v5 = a3;
  v6 = (void *)-[NSArray mutableCopy](actions, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;

  objc_msgSend(v11, "removeObject:", v5);
  v9 = (NSArray *)objc_msgSend(v11, "copy");
  v10 = self->_actions;
  self->_actions = v9;

  -[PRXCardContentViewController _updateActionButtons](self, "_updateActionButtons");
}

- (void)_updateActionButtons
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[PRXCardContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_actions, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_actions;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          +[PRXButton buttonWithProximityType:usesLegacyStyling:](PRXButton, "buttonWithProximityType:usesLegacyStyling:", objc_msgSend(v9, "style", (_QWORD)v12) != 1, objc_msgSend(v9, "usesLegacyStyling"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setButton:", v10);
          objc_msgSend(v3, "addObject:", v10);

        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    -[PRXCardContentWrapperView bottomTray](self->_wrapperView, "bottomTray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActionButtons:", v3);

  }
}

- (void)showActivityIndicatorWithStatus:(id)a3
{
  PRXActivityStatusView *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PRXCardContentViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (objc_msgSend(v10, "length"))
  {
    v4 = objc_alloc_init(PRXActivityStatusView);
    -[PRXActivityStatusView statusLabel](v4, "statusLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v10);

    -[PRXActivityStatusView activityIndicator](v4, "activityIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startAnimating");

  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BDF67D0]);
    if (-[PRXCardContentViewController cardStyle](self, "cardStyle") == 1)
      v8 = 100;
    else
      v8 = 101;
    v4 = (PRXActivityStatusView *)objc_msgSend(v7, "initWithActivityIndicatorStyle:", v8);
    -[PRXActivityStatusView startAnimating](v4, "startAnimating");
  }
  -[PRXCardContentWrapperView bottomTray](self->_wrapperView, "bottomTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActivityIndicator:", v4);

}

- (void)hideActivityIndicator
{
  id v2;

  -[PRXCardContentWrapperView bottomTray](self->_wrapperView, "bottomTray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActivityIndicator:", 0);

}

- (PRXAction)infoButtonAction
{
  return -[PRXCardContentWrapperView infoButtonAction](self->_wrapperView, "infoButtonAction");
}

- (void)setInfoButtonAction:(id)a3
{
  id v4;

  v4 = a3;
  -[PRXCardContentViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[PRXCardContentWrapperView setInfoButtonAction:](self->_wrapperView, "setInfoButtonAction:", v4);

}

- (PRXButton)infoButton
{
  void *v2;
  void *v3;

  -[PRXCardContentWrapperView infoButtonAction](self->_wrapperView, "infoButtonAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRXButton *)v3;
}

- (id)bottomTray
{
  -[PRXCardContentViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return -[PRXCardContentWrapperView bottomTray](self->_wrapperView, "bottomTray");
}

- (void)removeBottomTray
{
  -[PRXCardContentWrapperView removeBottomTray](self->_wrapperView, "removeBottomTray");
}

- (int64_t)cardStyle
{
  return -[PRXCardContentView cardStyle](self->_contentView, "cardStyle");
}

- (BOOL)allowsPullToDismiss
{
  return (LOBYTE(self->_dismissalType) >> 1) & 1;
}

- (void)setTransitioningSize:(BOOL)a3
{
  self->_transitioningSize = a3;
}

- (PRXPullDismissalInteractionDriver)pullDismissalInteractionDriver
{
  return self->_pullDismissalInteractionDriver;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (NSString)bottomTrayTitle
{
  return self->_bottomTrayTitle;
}

- (unint64_t)dismissalType
{
  return self->_dismissalType;
}

- (PRXAction)dismissButtonAction
{
  return self->_dismissButtonAction;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_dismissButtonAction, 0);
  objc_storeStrong((id *)&self->_bottomTrayTitle, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_pullDismissalInteractionDriver, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
}

@end
