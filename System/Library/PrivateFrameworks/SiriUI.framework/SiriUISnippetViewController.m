@implementation SiriUISnippetViewController

- (SiriUISnippetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SiriUISnippetViewController *v4;
  SiriUISnippetViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriUISnippetViewController;
  v4 = -[SiriUISnippetViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SiriUISnippetViewController setDefaultViewInsets:](v4, "setDefaultViewInsets:", 10.0, 8.0, 10.0, 8.0);
    -[SiriUISnippetViewController setWantsConfirmationInsets:](v5, "setWantsConfirmationInsets:", 1);
    -[SiriUISnippetViewController setShowHeaderChevron:](v5, "setShowHeaderChevron:", 1);
  }
  return v5;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void)setConfirmed:(BOOL)a3
{
  self->_confirmed = a3;
}

- (BOOL)removedAfterDialogProgresses
{
  return 0;
}

- (BOOL)isMemoryIntensive
{
  return 0;
}

- (BOOL)isIndicatingActivity
{
  return 0;
}

- (BOOL)logContentsIfApplicable
{
  return 0;
}

- (BOOL)shouldHidePriorViews
{
  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriUISnippetViewController;
  -[SiriUISnippetViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewControllerViewDidAppear:isTopLevelViewController:", self, 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriUISnippetViewController;
  -[SiriUISnippetViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewControllerViewDidDisappear:isTopLevelViewController:", self, 1);

}

- (void)_setVirgin:(BOOL)a3
{
  self->_virgin = a3;
}

- (int64_t)_pinAnimationType
{
  return 3;
}

- (int64_t)_insertionAnimation
{
  return 2;
}

- (int64_t)_replacementAnimation
{
  return 0;
}

- (BOOL)_hasConfirmationOrCancelledInsets
{
  BOOL v3;
  BOOL v4;
  BOOL v5;

  v3 = -[SiriUISnippetViewController _isProvisional](self, "_isProvisional");
  v4 = -[SiriUISnippetViewController _willAnimateConfirmation](self, "_willAnimateConfirmation");
  v5 = -[SiriUISnippetViewController wantsConfirmationInsets](self, "wantsConfirmationInsets");
  if (!v5 || v3 || v4)
    return v5 || v5 && !v3;
  else
    return -[SiriUISnippetViewController isCancelled](self, "isCancelled");
}

- (BOOL)_hasConfirmationButtons
{
  void *v2;
  _BOOL4 v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = -[SiriUISnippetViewController _hasConfirmationOrCancelledInsets](self, "_hasConfirmationOrCancelledInsets");
  if (v4)
  {
    -[SiriUIBaseSnippetViewController snippet](self, "snippet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "confirmationOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 1;
LABEL_6:

      return v6;
    }
  }
  -[SiriUISnippetViewController _previousConfirmationOptions](self, "_previousConfirmationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7 != 0;

  if (v4)
  {
    v5 = 0;
    goto LABEL_6;
  }
  return v6;
}

- (id)_privateDelegate
{
  void *v3;
  int v4;
  void *v5;

  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_254F2C080);

  if (v4)
  {
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)alternativeAceCommandsToPerformIfNotExposingViews
{
  return 0;
}

- (BOOL)wantsToManageBackgroundColor
{
  return 0;
}

- (void)setSubtitle:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BDD1458];
    v5 = a3;
    v6 = (id)objc_msgSend([v4 alloc], "initWithString:", v5);

  }
  else
  {
    v6 = 0;
  }
  -[SiriUISnippetViewController setAttributedSubtitle:](self, "setAttributedSubtitle:", v6);

}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  -[SiriUISnippetViewController attributedSubtitle](self, "attributedSubtitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setUserConfirmationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_userConfirmationEnabled != a3)
  {
    v3 = a3;
    self->_userConfirmationEnabled = a3;
    if (self->_footerView)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SiriUIReusableView confirmButton](self->_footerView, "confirmButton");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setEnabled:", v3);

      }
    }
  }
}

- (Class)headerViewClass
{
  void *v3;
  void *v4;

  -[SiriUISnippetViewController title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SiriUISnippetViewController attributedSubtitle](self, "attributedSubtitle");

    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (Class)footerViewClass
{
  -[SiriUISnippetViewController _hasConfirmationButtons](self, "_hasConfirmationButtons");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (Class)transparentHeaderViewClass
{
  return 0;
}

- (Class)transparentFooterViewClass
{
  return 0;
}

- (void)_cellDidLayoutSubviews
{
  if (self->_headerView)
    -[SiriUISnippetViewController configureReusableHeaderView:](self, "configureReusableHeaderView:");
  if (self->_footerView)
    -[SiriUISnippetViewController configureReusableFooterView:](self, "configureReusableFooterView:");
  if (self->_transparentHeaderView)
    -[SiriUISnippetViewController configureReusableTransparentHeaderView:](self, "configureReusableTransparentHeaderView:");
  if (self->_transparentFooterView)
    -[SiriUISnippetViewController configureReusableTransparentFooterView:](self, "configureReusableTransparentFooterView:");
}

- (void)configureReusableHeaderView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v11;
    -[SiriUISnippetViewController titleTextColor](self, "titleTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitleTextColor:", v5);

    -[SiriUISnippetViewController title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitleText:", v6);

    -[SiriUISnippetViewController titleBackgroundColor](self, "titleBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v7);

    objc_msgSend(v4, "headerAreaButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_headerTapped_, 64);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v11;
    -[SiriUISnippetViewController attributedSubtitle](self, "attributedSubtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedSubtitleText:", v10);

  }
}

- (void)configureReusableFooterView:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SiriUIReusableView *footerView;
  id v15;

  v15 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v15;
    -[SiriUISnippetViewController _previousConfirmationOptions](self, "_previousConfirmationOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SiriUISnippetViewController _previousConfirmationOptions](self, "_previousConfirmationOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setConfirmationOptions:", v8);

      objc_msgSend(v6, "setUserInteractionEnabled:", 0);
    }
    else
    {
      -[SiriUIBaseSnippetViewController snippet](self, "snippet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "confirmationOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setConfirmationOptions:", v10);

      objc_msgSend(v6, "cancelButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_cancelButtonTapped_, 64);

      objc_msgSend(v6, "confirmButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_confirmButtonTapped_, 64);

      objc_msgSend(v6, "confirmButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setEnabled:", self->_userConfirmationEnabled);

    }
    footerView = self->_footerView;
    self->_footerView = (SiriUIReusableView *)v6;

    v5 = v15;
  }

}

- (double)desiredHeightForHeaderView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[SiriUISnippetViewController _headerView](self, "_headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriViewControllerExpectedWidth:", self);
    v6 = v5;

    -[SiriUISnippetViewController defaultViewInsets](self, "defaultViewInsets");
    v8 = v7;
    -[SiriUISnippetViewController defaultViewInsets](self, "defaultViewInsets");
    v10 = v6 + v8 + v9;
    -[SiriUISnippetViewController configureReusableHeaderView:](self, "configureReusableHeaderView:", v3);
    objc_msgSend(v3, "desiredHeightForWidth:", v10);
  }
  else
  {
    -[objc_class defaultHeight](-[SiriUISnippetViewController headerViewClass](self, "headerViewClass"), "defaultHeight");
  }
  v12 = v11;

  return v12;
}

- (double)desiredHeightForFooterView
{
  double result;

  if (-[SiriUISnippetViewController isCancelled](self, "isCancelled")
    || -[SiriUISnippetViewController isConfirmed](self, "isConfirmed")
    || -[SiriUISnippetViewController _isAwaitingSuccessOrFailureEvent](self, "_isAwaitingSuccessOrFailureEvent"))
  {
    return 0.0;
  }
  -[objc_class defaultHeight](-[SiriUISnippetViewController footerViewClass](self, "footerViewClass"), "defaultHeight");
  return result;
}

- (double)desiredHeightForTransparentHeaderView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[SiriUISnippetViewController _transparentHeaderView](self, "_transparentHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriViewControllerExpectedWidth:", self);
    v6 = v5;

    -[SiriUISnippetViewController defaultViewInsets](self, "defaultViewInsets");
    v8 = v7;
    -[SiriUISnippetViewController defaultViewInsets](self, "defaultViewInsets");
    v10 = v6 + v8 + v9;
    -[SiriUISnippetViewController configureReusableTransparentHeaderView:](self, "configureReusableTransparentHeaderView:", v3);
    objc_msgSend(v3, "desiredHeightForWidth:", v10);
  }
  else
  {
    -[objc_class defaultHeight](-[SiriUISnippetViewController transparentHeaderViewClass](self, "transparentHeaderViewClass"), "defaultHeight");
  }
  v12 = v11;

  return v12;
}

- (double)desiredHeightForTransparentFooterView
{
  double result;

  -[objc_class defaultHeight](-[SiriUISnippetViewController transparentFooterViewClass](self, "transparentFooterViewClass"), "defaultHeight");
  return result;
}

- (id)_headerView
{
  SiriUIReusableView *headerView;
  SiriUIReusableView *v4;
  SiriUIReusableView *v5;

  headerView = self->_headerView;
  if (!headerView)
  {
    -[SiriUISnippetViewController _createReusableViewIfNeededWithClass:](self, "_createReusableViewIfNeededWithClass:", -[SiriUISnippetViewController headerViewClass](self, "headerViewClass"));
    v4 = (SiriUIReusableView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_headerView;
    self->_headerView = v4;

    headerView = self->_headerView;
  }
  return headerView;
}

- (id)_footerView
{
  SiriUIReusableView *footerView;
  SiriUIReusableView *v4;
  SiriUIReusableView *v5;

  footerView = self->_footerView;
  if (!footerView)
  {
    -[SiriUISnippetViewController _createReusableViewIfNeededWithClass:](self, "_createReusableViewIfNeededWithClass:", -[SiriUISnippetViewController footerViewClass](self, "footerViewClass"));
    v4 = (SiriUIReusableView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_footerView;
    self->_footerView = v4;

    footerView = self->_footerView;
  }
  return footerView;
}

- (id)_transparentHeaderView
{
  SiriUIReusableView *transparentHeaderView;
  SiriUIReusableView *v4;
  SiriUIReusableView *v5;

  transparentHeaderView = self->_transparentHeaderView;
  if (!transparentHeaderView)
  {
    -[SiriUISnippetViewController _createReusableViewIfNeededWithClass:](self, "_createReusableViewIfNeededWithClass:", -[SiriUISnippetViewController transparentHeaderViewClass](self, "transparentHeaderViewClass"));
    v4 = (SiriUIReusableView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_transparentHeaderView;
    self->_transparentHeaderView = v4;

    transparentHeaderView = self->_transparentHeaderView;
  }
  return transparentHeaderView;
}

- (id)_transparentFooterView
{
  SiriUIReusableView *transparentFooterView;
  SiriUIReusableView *v4;
  SiriUIReusableView *v5;

  transparentFooterView = self->_transparentFooterView;
  if (!transparentFooterView)
  {
    -[SiriUISnippetViewController _createReusableViewIfNeededWithClass:](self, "_createReusableViewIfNeededWithClass:", -[SiriUISnippetViewController transparentFooterViewClass](self, "transparentFooterViewClass"));
    v4 = (SiriUIReusableView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_transparentFooterView;
    self->_transparentFooterView = v4;

    transparentFooterView = self->_transparentFooterView;
  }
  return transparentFooterView;
}

- (id)_createReusableViewIfNeededWithClass:(Class)a3
{
  id v4;
  void *v5;

  v4 = [a3 alloc];
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setSnippetViewController:", self);
  return v5;
}

- (BOOL)isTransparent
{
  return (SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) == 0 && self->_isTransparent;
}

- (void)_snippetPunchOutButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUISnippetViewController snippetPunchOut](self, "snippetPunchOut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriViewController:performAceCommands:", self, v5);

}

- (void)headerTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[SiriUIBaseSnippetViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUISnippetViewController headerPunchOut](self, "headerPunchOut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewController:performAceCommands:", self, v6);

}

- (void)cancelButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SiriUIReusableView cancelButton](self->_footerView, "cancelButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[SiriUIReusableView confirmButton](self->_footerView, "confirmButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[SiriUISnippetViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[SiriUISnippetViewController willCancel](self, "willCancel");
  -[SiriUIBaseSnippetViewController instrumentationTurnIdentifier](self, "instrumentationTurnIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUISnippetViewController _instrumentConfirmationOptionInteractionWithPreviousTurn:](self, "_instrumentConfirmationOptionInteractionWithPreviousTurn:", v7);

  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriUIBaseSnippetViewController snippet](self, "snippet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "confirmationOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "denyCommands");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "siriViewController:performAceCommands:", self, v10);

}

- (void)confirmButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SiriUIReusableView cancelButton](self->_footerView, "cancelButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[SiriUIReusableView confirmButton](self->_footerView, "confirmButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[SiriUISnippetViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[SiriUISnippetViewController willConfirm](self, "willConfirm");
  -[SiriUIBaseSnippetViewController instrumentationTurnIdentifier](self, "instrumentationTurnIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUISnippetViewController _instrumentConfirmationOptionInteractionWithPreviousTurn:](self, "_instrumentConfirmationOptionInteractionWithPreviousTurn:", v7);

  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriUIBaseSnippetViewController snippet](self, "snippet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "confirmationOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "confirmCommands");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "siriViewController:performAceCommands:", self, v10);

}

- (void)confirmSnippet
{
  if (!self->_cancelled)
    -[SiriUISnippetViewController confirmButtonTapped:](self, "confirmButtonTapped:", 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriUISnippetViewController;
  -[SiriUISnippetViewController touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, a3, a4);
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userTouchedSnippet");

  }
}

- (void)_instrumentConfirmationOptionInteractionWithPreviousTurn:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE95C98]);
  -[SiriUIBaseSnippetViewController snippet](self, "snippet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "confirmationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setViewID:", v8);

  -[SiriUIBaseSnippetViewController snippet](self, "snippet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "confirmationOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSnippetClass:", v12);

  v13 = objc_alloc_init(MEMORY[0x24BE95B28]);
  objc_msgSend(v13, "setInvocationSource:", 11);
  objc_msgSend(v13, "setViewContainer:", v5);
  v14 = (void *)objc_msgSend(MEMORY[0x24BE090D0], "newTurnBasedContextWithPreviousTurnID:", v4);
  v15 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v14, "turnIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315650;
    v21 = "-[SiriUISnippetViewController _instrumentConfirmationOptionInteractionWithPreviousTurn:]";
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_21764F000, v16, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v20, 0x20u);

  }
  -[SiriUISnippetViewController _instrumentationManager](self, "_instrumentationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "storeCurrentInstrumentationTurnContext:", v14);

  -[SiriUISnippetViewController _instrumentationManager](self, "_instrumentationManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "emitInstrumentation:", v13);

}

- (id)_instrumentationManager
{
  return (id)objc_msgSend(MEMORY[0x24BEA8640], "sharedManager");
}

- (void)configureForConversationStorable:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[SiriUISnippetViewController _setVirgin:](self, "_setVirgin:", objc_msgSend(v4, "isVirgin"));
  v5 = objc_msgSend(v4, "presentationState");

  if (v5 == 2)
    -[SiriUISnippetViewController _setProvisional:](self, "_setProvisional:", 1);
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (UIColor)titleBackgroundColor
{
  return self->_titleBackgroundColor;
}

- (void)setTitleBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (void)setAttributedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (NSString)navigationTitle
{
  return self->_navigationTitle;
}

- (void)setNavigationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (NSArray)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (SAUIAppPunchOut)headerPunchOut
{
  return self->_headerPunchOut;
}

- (void)setHeaderPunchOut:(id)a3
{
  objc_storeStrong((id *)&self->_headerPunchOut, a3);
}

- (SAUIAppPunchOut)snippetPunchOut
{
  return self->_snippetPunchOut;
}

- (void)setSnippetPunchOut:(id)a3
{
  objc_storeStrong((id *)&self->_snippetPunchOut, a3);
}

- (UIEdgeInsets)defaultViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_defaultViewInsets.top;
  left = self->_defaultViewInsets.left;
  bottom = self->_defaultViewInsets.bottom;
  right = self->_defaultViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setDefaultViewInsets:(UIEdgeInsets)a3
{
  self->_defaultViewInsets = a3;
}

- (BOOL)wantsConfirmationInsets
{
  return self->_wantsConfirmationInsets;
}

- (void)setWantsConfirmationInsets:(BOOL)a3
{
  self->_wantsConfirmationInsets = a3;
}

- (BOOL)isFullPadWidth
{
  return self->_isFullPadWidth;
}

- (void)setIsFullPadWidth:(BOOL)a3
{
  self->_isFullPadWidth = a3;
}

- (void)setIsTransparent:(BOOL)a3
{
  self->_isTransparent = a3;
}

- (BOOL)isHint
{
  return self->_isHint;
}

- (void)setIsHint:(BOOL)a3
{
  self->_isHint = a3;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)isConfirmed
{
  return self->_confirmed;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (BOOL)isUserConfirmationEnabled
{
  return self->_userConfirmationEnabled;
}

- (UIView)containingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containingView);
}

- (void)setContainingView:(id)a3
{
  objc_storeWeak((id *)&self->_containingView, a3);
}

- (BOOL)isVirgin
{
  return self->_virgin;
}

- (BOOL)isNavigating
{
  return self->_navigating;
}

- (void)setNavigating:(BOOL)a3
{
  self->_navigating = a3;
}

- (int64_t)defaultKeylineType
{
  return self->_defaultKeylineType;
}

- (void)setDefaultKeylineType:(int64_t)a3
{
  self->_defaultKeylineType = a3;
}

- (BOOL)_willAnimateConfirmation
{
  return self->_willAnimateConfirmation;
}

- (void)_setWillAnimateConfirmation:(BOOL)a3
{
  self->_willAnimateConfirmation = a3;
}

- (BOOL)_willAnimateCancellation
{
  return self->_willAnimateCancellation;
}

- (void)_setWillAnimateCancellation:(BOOL)a3
{
  self->_willAnimateCancellation = a3;
}

- (SAUIConfirmationOptions)_previousConfirmationOptions
{
  return self->_previousConfirmationOptions;
}

- (void)_setPreviousConfirmationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_previousConfirmationOptions, a3);
}

- (BOOL)_isAwaitingSuccessOrFailureEvent
{
  return self->_awaitingSuccessOrFailureEvent;
}

- (void)_setAwaitingSuccessOrFailureEvent:(BOOL)a3
{
  self->_awaitingSuccessOrFailureEvent = a3;
}

- (BOOL)showHeaderChevron
{
  return self->_showHeaderChevron;
}

- (void)setShowHeaderChevron:(BOOL)a3
{
  self->_showHeaderChevron = a3;
}

- (BOOL)_isProvisional
{
  return self->_provisional;
}

- (void)_setProvisional:(BOOL)a3
{
  self->_provisional = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousConfirmationOptions, 0);
  objc_destroyWeak((id *)&self->_containingView);
  objc_storeStrong((id *)&self->_snippetPunchOut, 0);
  objc_storeStrong((id *)&self->_headerPunchOut, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_navigationTitle, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong((id *)&self->_titleBackgroundColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_transparentFooterView, 0);
  objc_storeStrong((id *)&self->_transparentHeaderView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
