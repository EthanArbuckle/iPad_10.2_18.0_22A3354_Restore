@implementation SiriUILegacyCardSectionViewController

- (id)_interaction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CRKCardSectionViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "card");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)cardSectionClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

- (void)setDelegate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  SiriUISnippetViewController *v7;
  SiriUISnippetViewController *snippetViewController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SiriUILegacyCardSectionViewController;
  -[CRKCardSectionViewController setDelegate:](&v9, sel_setDelegate_, a3);
  -[SiriUILegacyCardSectionViewController _interaction](self, "_interaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SiriUISnippetManager sharedInstance](SiriUISnippetManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_snippet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snippetViewControllerForSnippet:", v6);
  v7 = (SiriUISnippetViewController *)objc_claimAutoreleasedReturnValue();
  snippetViewController = self->_snippetViewController;
  self->_snippetViewController = v7;

  -[CRKCardSectionViewController setLoading:](self, "setLoading:", -[SiriUISnippetViewController isLoading](self->_snippetViewController, "isLoading"));
  if (-[SiriUILegacyCardSectionViewController isViewLoaded](self, "isViewLoaded"))
    -[SiriUILegacyCardSectionViewController _loadCardSectionView](self, "_loadCardSectionView");

}

- (void)_loadCardSectionView
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "_snippet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315650;
  v6 = "-[SiriUILegacyCardSectionViewController _loadCardSectionView]";
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_21764F000, v3, OS_LOG_TYPE_ERROR, "%s #cards No snippet view controller for snippet: %@, interaction: %@", (uint8_t *)&v5, 0x20u);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriUILegacyCardSectionViewController;
  -[CRKCardSectionViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SiriUILegacyCardSectionViewController _updateContentSize](self, "_updateContentSize");
}

- (BOOL)_shouldAttemptToConnectToRemoteViewController
{
  return 0;
}

- (void)_updateContentSize
{
  double v3;
  double v4;
  char v5;
  SiriUISnippetViewController *snippetViewController;
  double v7;
  id v8;

  -[SiriUILegacyCardSectionViewController siriViewControllerExpectedWidth:](self, "siriViewControllerExpectedWidth:", self->_snippetViewController);
  v4 = v3;
  v5 = objc_opt_respondsToSelector();
  -[SiriUILegacyCardSectionViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  snippetViewController = self->_snippetViewController;
  if ((v5 & 1) != 0)
    -[SiriUISnippetViewController desiredHeightForWidth:](snippetViewController, "desiredHeightForWidth:", v4);
  else
    -[SiriUIBaseSnippetViewController desiredHeight](snippetViewController, "desiredHeight");
  objc_msgSend(v8, "setContentSize:", v4, v7);

}

- (id)_createReusableViewIfNeededWithClass:(Class)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = [a3 alloc];
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setSnippetViewController:", self->_snippetViewController);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)siriSnippetViewController:(id)a3 pushSirilandSnippets:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriSnippetViewController:pushSirilandSnippets:", v7, v5);

}

- (void)siriSnippetViewControllerViewDidLoad:(id)a3
{
  -[CRKCardSectionViewController _finishLoadingViewIfNecessary](self, "_finishLoadingViewIfNecessary", a3);
  -[SiriUILegacyCardSectionViewController _updateContentSize](self, "_updateContentSize");
}

- (void)siriSnippetViewController:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  id v10;

  v5 = a5;
  v6 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "siriSnippetViewController:setStatusBarHidden:animated:", v9, v6, v5);

}

- (void)siriSnippetViewController:(id)a3 shouldPresentPicker:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "siriSnippetViewController:shouldPresentPicker:completion:", v10, v8, v7);

}

- (void)siriSnippetViewController:(id)a3 didShowGuideStartDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "siriSnippetViewController:didShowGuideStartDate:endDate:", v10, v8, v7);

}

- (BOOL)siriSnippetViewControllerIsVisible:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "siriSnippetViewControllerIsVisible:", v6);

  return v7;
}

- (void)siriSnippetViewController:(id)a3 requestPasscodeUnlockWithCompletion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriSnippetViewController:requestPasscodeUnlockWithCompletion:", v7, v5);

}

- (void)siriSnippetViewControllerWillBecomeFirstResponder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriSnippetViewControllerWillBecomeFirstResponder:", v5);

}

- (unint64_t)siriDeviceLockStateForSnippetViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "siriDeviceLockStateForSnippetViewController:", v6);

  return v7;
}

- (id)siriEnabledAppListForSiriViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriEnabledAppListForSiriViewController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)siriSnippetViewController:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  id v11;

  v6 = a5;
  v7 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3, a4, a5, a6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "siriSnippetViewController:setStatusBarHidden:animated:", v10, v7, v6);

}

- (void)siriViewControllerViewDidAppear:(id)a3 isTopLevelViewController:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriViewControllerViewDidAppear:isTopLevelViewController:", v5, 0);

}

- (void)siriViewControllerViewDidDisappear:(id)a3 isTopLevelViewController:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriViewControllerViewDidDisappear:isTopLevelViewController:", v5, 0);

}

- (double)boundingWidthForSnippetViewController:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[SiriUILegacyCardSectionViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  return v5;
}

- (void)siriViewController:(id)a3 performAceCommands:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriViewController:performAceCommands:", v7, v5);

}

- (void)siriViewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "siriViewController:performAceCommands:completion:", v10, v8, v7);

}

- (void)siriViewController:(id)a3 openURL:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "siriViewController:openURL:completion:", v10, v8, v7);

}

- (id)siriViewController:(id)a3 domainObjectForIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "siriViewController:domainObjectForIdentifier:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315906;
    v15 = "-[SiriUILegacyCardSectionViewController siriViewController:domainObjectForIdentifier:]";
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_21764F000, v12, OS_LOG_TYPE_DEFAULT, "%s #cards Retrieving a domain object for a legacy snippet view controller:\n    Siri view controller: %@\n    Identifier: %@\n    Domain object: %@", (uint8_t *)&v14, 0x2Au);
  }

  return v11;
}

- (void)siriViewController:(id)a3 setDomainObject:(id)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315906;
    v16 = "-[SiriUILegacyCardSectionViewController siriViewController:setDomainObject:forIdentifier:]";
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_21764F000, v11, OS_LOG_TYPE_DEFAULT, "%s #cards Storing a domain object on behalf of a legacy snippet view controller:\n    Siri view controller: %@\n    Domain object: %@\n    Identifier: %@", (uint8_t *)&v15, 0x2Au);
  }
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "siriViewController:setDomainObject:forIdentifier:", v14, v9, v10);

}

- (id)siriViewControllerEffectiveBundleForCoreLocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriViewControllerEffectiveBundleForCoreLocation:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)siriViewControllerExpectedWidth:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriViewControllerExpectedWidth:", v6);
  v8 = v7;

  return v8;
}

- (CGSize)siriViewControllerVisibleContentArea:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriViewControllerVisibleContentArea:", v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)siriViewControllerHeightDidChange:(id)a3
{
  id v4;

  -[SiriUILegacyCardSectionViewController _updateContentSize](self, "_updateContentSize", a3);
  -[CRKCardSectionViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSectionViewControllerBoundsDidChange:", self);

}

- (void)siriViewController:(id)a3 setContentOffset:(double)a4
{
  void *v6;
  void *v7;
  id v8;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriViewController:setContentOffset:", v7, a4);

}

- (id)siriViewController:(id)a3 filteredDisambiguationListItems:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriViewController:filteredDisambiguationListItems:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)siriViewController:(id)a3 disambiguationItemForListItem:(id)a4 disambiguationKey:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "siriViewController:disambiguationItemForListItem:disambiguationKey:", v11, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)siriViewController:(id)a3 listItemToPickInAutodisambiguationForListItems:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriViewController:listItemToPickInAutodisambiguationForListItems:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)siriViewController:(id)a3 addSelectionResponse:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriViewController:addSelectionResponse:", v7, v5);

}

- (void)cancelRequestForSiriSnippetViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequestForSiriSnippetViewController:", v5);

}

- (id)persistentDataStoreForSiriViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentDataStoreForSiriViewController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)siriSnippetViewController:(id)a3 setStatusViewHidden:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriSnippetViewController:setStatusViewHidden:", v8, v4);

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "siriSnippetViewController:setTypeToSiriViewHidden:", v12, v4);

  }
}

- (void)siriViewController:(id)a3 didHideVibrantView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriViewController:didHideVibrantView:", v7, v5);

}

- (id)updatedUserUtteranceForSiriViewController:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updatedUserUtteranceForSiriViewController:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (double)statusBarHeightForSiriViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarHeightForSiriViewController:", v4);
  v8 = v7;

  return v8;
}

- (void)siriViewController:(id)a3 speakText:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_privateDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "siriViewController:speakText:completion:", v10, v8, v7);

}

- (void)siriSnippetViewController:(id)a3 willPresentViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_privateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriSnippetViewController:willPresentViewController:", v7, v5);

}

- (void)siriSnippetViewController:(id)a3 didPresentViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_privateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriSnippetViewController:didPresentViewController:", v7, v5);

}

- (void)siriSnippetViewController:(id)a3 willDismissViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_privateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriSnippetViewController:willDismissViewController:", v7, v5);

}

- (void)siriSnippetViewController:(id)a3 didDismissViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_privateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriSnippetViewController:didDismissViewController:", v7, v5);

}

- (void)siriSnippetViewController:(id)a3 didRequestKeyboardWithVisibility:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_privateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriSnippetViewController:didRequestKeyboardWithVisibility:", v7, v4);

}

- (void)cancelSpeakingForSiriViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_privateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelSpeakingForSiriViewController:", v5);

}

- (void)removeSiriViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeSiriViewController:", v4);

}

- (BOOL)siriViewControllerShouldPreventUserInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "siriViewControllerShouldPreventUserInteraction:", v6);

  return v7;
}

- (void)siriViewControllerWillBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_privateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewControllerWillBeginEditing:", v5);

}

- (void)siriViewControllerDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_privateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewControllerDidEndEditing:", v5);

}

- (void)siriViewController:(id)a3 startCorrectedSpeechRequestWithText:(id)a4 correctionIdentifier:(id)a5 userSelectionResults:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_privateDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "siriViewController:startCorrectedSpeechRequestWithText:correctionIdentifier:userSelectionResults:", v13, v11, v10, v9);

}

- (void)siriViewControllerRequestTearDownEditingViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_privateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewControllerRequestTearDownEditingViewController:", v5);

}

- (id)localeForSiriViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSectionViewController containingSnippetViewController](self, "containingSnippetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeForSiriViewController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)additionalSpeechInterpretationsForSiriViewController:(id)a3
{
  return 0;
}

- (UIEdgeInsets)siriViewControllerBackgroundInsets:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x24BDF7718];
  v4 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v6 = *(double *)(MEMORY[0x24BDF7718] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (SiriUISnippetViewController)backingSnippetViewController
{
  return self->_snippetViewController;
}

- (SiriUISnippetViewController)containingSnippetViewController
{
  return (SiriUISnippetViewController *)objc_loadWeakRetained((id *)&self->_containingSnippetViewController);
}

- (void)setContainingSnippetViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containingSnippetViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingSnippetViewController);
  objc_storeStrong((id *)&self->_snippetViewController, 0);
}

@end
