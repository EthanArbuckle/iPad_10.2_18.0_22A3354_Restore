@implementation SBHStackConfigurationInteraction

- (SBHStackConfigurationInteraction)initWithConfiguration:(id)a3 iconView:(id)a4 iconViewProvider:(id)a5 listLayoutProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBHStackConfigurationInteraction *v15;
  SBHStackConfigurationInteraction *v16;
  void *v17;
  uint64_t v18;
  SBHWidgetSettings *widgetSettings;
  SBHViewControllerTransition *v20;
  SBHViewControllerTransition *transition;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SBHStackConfigurationInteraction;
  v15 = -[SBHStackConfigurationInteraction init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configuration, a3);
    objc_storeStrong((id *)&v16->_iconView, a4);
    objc_storeWeak((id *)&v16->_iconViewProvider, v13);
    objc_storeStrong((id *)&v16->_listLayoutProvider, a6);
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "widgetSettings");
    v18 = objc_claimAutoreleasedReturnValue();
    widgetSettings = v16->_widgetSettings;
    v16->_widgetSettings = (SBHWidgetSettings *)v18;

    v20 = objc_alloc_init(SBHViewControllerTransition);
    transition = v16->_transition;
    v16->_transition = v20;

    -[SBHViewControllerTransition setDelegate:](v16->_transition, "setDelegate:", v16);
  }

  return v16;
}

- (void)setPresenter:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_presenter, obj);
    -[SBHStackConfigurationInteraction configurationViewController](self, "configurationViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPresenter:", obj);

  }
}

- (void)beginConfiguration
{
  id v2;

  -[SBHStackConfigurationInteraction transition](self, "transition");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progressToEndStateWithAnimation:", 1);

}

- (void)popConfiguration
{
  void *v3;
  id v4;

  -[SBHStackConfigurationInteraction configurationViewController](self, "configurationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentConfiguringIconView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v4, "popConfigurationCard");
  else
    -[SBHStackConfigurationInteraction _endConfigurationAnimated:](self, "_endConfigurationAnimated:", 1);

}

- (void)endConfiguration
{
  void *v3;
  void *v4;

  -[SBHStackConfigurationInteraction configurationViewController](self, "configurationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentConfiguringIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissConfigurationCardImmediately");

  -[SBHStackConfigurationInteraction _endConfigurationAnimated:](self, "_endConfigurationAnimated:", 1);
}

- (void)endConfigurationImmediately
{
  void *v3;
  void *v4;

  -[SBHStackConfigurationInteraction configurationViewController](self, "configurationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentConfiguringIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissConfigurationCardImmediately");

  -[SBHStackConfigurationInteraction _endConfigurationAnimated:](self, "_endConfigurationAnimated:", 0);
}

- (void)_endConfigurationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[SBHStackConfigurationInteraction configurationViewController](self, "configurationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willDismiss");

  -[SBHStackConfigurationInteraction containerViewController](self, "containerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  -[SBHStackConfigurationInteraction transition](self, "transition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "returnToBeginningStateWithAnimation:", v3);

}

- (void)prepareTransition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SBHStackConfigurationViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBHStackConfigurationViewController *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SBHStackConfigurationViewController *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  SBHStackConfigurationViewController *v32;

  v30 = a3;
  -[SBHStackConfigurationInteraction delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerViewControllerForConfigurationInteraction:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationInteraction setContainerViewController:](self, "setContainerViewController:", v5);
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "containerViewForConfigurationInteraction:", self);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  -[SBHStackConfigurationInteraction setContainerView:](self, "setContainerView:", v6);
  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = [SBHStackConfigurationViewController alloc];
  -[SBHStackConfigurationInteraction configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationInteraction iconView](self, "iconView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationInteraction iconViewProvider](self, "iconViewProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationInteraction listLayoutProvider](self, "listLayoutProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SBHStackConfigurationViewController initWithConfiguration:iconView:iconViewProvider:listLayoutProvider:showsAddButton:showsDoneButton:](v16, "initWithConfiguration:iconView:iconViewProvider:listLayoutProvider:showsAddButton:showsDoneButton:", v17, v18, v19, v20, -[SBHStackConfigurationInteraction showsAddButton](self, "showsAddButton"), -[SBHStackConfigurationInteraction showsDoneButton](self, "showsDoneButton"));

  -[SBHStackConfigurationInteraction presenter](self, "presenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationViewController setPresenter:](v21, "setPresenter:", v22);

  -[SBHStackConfigurationViewController setDelegate:](v21, "setDelegate:", self);
  -[SBHStackConfigurationInteraction setConfigurationViewController:](self, "setConfigurationViewController:", v21);
  -[SBHStackConfigurationInteraction _contentBoundingFrame](self, "_contentBoundingFrame");
  -[SBHStackConfigurationViewController setContentBoundingFrame:](v21, "setContentBoundingFrame:");
  -[SBHStackConfigurationInteraction iconView](self, "iconView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHighlighted:", 0);
  objc_msgSend(v23, "setPaused:forReason:", 1, 4);
  objc_msgSend(v23, "addObserver:", self);
  objc_msgSend(v23, "effectiveIconImageStyleConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationViewController setOverrideIconImageStyleConfiguration:](v21, "setOverrideIconImageStyleConfiguration:", v24);
  v25 = (void *)*MEMORY[0x1E0DC4730];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __54__SBHStackConfigurationInteraction_prepareTransition___block_invoke;
  v31[3] = &unk_1E8D84C50;
  v26 = v21;
  v32 = v26;
  objc_msgSend(v25, "_performBlockAfterCATransactionCommits:", v31);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel__folderExpansionAnimationWillBegin_, CFSTR("SBIconZoomExpansionAnimationWillBeginNotification"), 0);
  objc_msgSend(v5, "bs_addChildViewController:withSuperview:", v26, v6);
  -[SBHStackConfigurationViewController view](v26, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v9, v11, v13, v15);
  objc_msgSend(v28, "layoutIfNeeded");
  if (objc_msgSend(v5, "shouldAutomaticallyForwardAppearanceMethods")
    && objc_msgSend(v5, "bs_isAppearingOrAppeared")
    && (-[SBHStackConfigurationViewController bs_isAppearingOrAppeared](v26, "bs_isAppearingOrAppeared") & 1) == 0)
  {
    -[SBHStackConfigurationViewController bs_endAppearanceTransition:](v26, "bs_endAppearanceTransition:", 1);
  }
  -[SBHStackConfigurationViewController animationCoordinator](v26, "animationCoordinator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setUserInfo:", v29);

}

uint64_t __54__SBHStackConfigurationInteraction_prepareTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOverrideIconImageStyleConfiguration:", 0);
}

- (id)animatorForTransition:(id)a3
{
  _BOOL4 IsReduceMotionEnabled;
  __objc2_class **v4;

  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v4 = off_1E8D81C18;
  if (!IsReduceMotionEnabled)
    v4 = off_1E8D81BF8;
  return objc_alloc_init(*v4);
}

- (void)transitionWillProgressToEndState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  -[SBHStackConfigurationInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "configurationInteractionWillBegin:", self);
  -[SBHStackConfigurationInteraction appearanceDelegate](self, "appearanceDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationInteraction configurationViewController](self, "configurationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stackConfigurationViewControllerWillAppear:", v6);

  -[SBHStackConfigurationInteraction _handleTransitionWillProgressToEndState:](self, "_handleTransitionWillProgressToEndState:", 1);
  SBLogTelemetrySignposts();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_STACK_EXPAND", " enableTelemetry=YES ", v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("SBHStackConfigurationWillPresentNotification"), self);

}

- (void)transitionDidProgressToEndState:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  SBLogTelemetrySignposts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_STACK_EXPAND", " enableTelemetry=YES ", v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("SBHStackConfigurationDidPresentNotification"), self);

  -[SBHStackConfigurationInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "configurationInteractionDidBegin:", self);
  -[SBHStackConfigurationInteraction appearanceDelegate](self, "appearanceDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationInteraction configurationViewController](self, "configurationViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stackConfigurationViewControllerDidAppear:", v8);

}

- (void)transitionWillReturnToBeginningState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  -[SBHStackConfigurationInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "configurationInteractionWillEnd:", self);
  -[SBHStackConfigurationInteraction appearanceDelegate](self, "appearanceDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationInteraction configurationViewController](self, "configurationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stackConfigurationViewControllerWillDisappear:", v6);

  -[SBHStackConfigurationInteraction _handleTransitionWillProgressToEndState:](self, "_handleTransitionWillProgressToEndState:", 0);
  SBLogTelemetrySignposts();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_STACK_COLLAPSE", " enableTelemetry=YES ", v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("SBHStackConfigurationWillDismissNotification"), self);

}

- (void)transitionDidReturnToBeginningState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v4 = a3;
  SBLogTelemetrySignposts();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_STACK_COLLAPSE", " enableTelemetry=YES ", v15, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_defaultPPTNotificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBHStackConfigurationDidDismissNotification"), self);

  -[SBHStackConfigurationInteraction configurationViewController](self, "configurationViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_removeChildViewController:", v7);

  objc_msgSend(v4, "setUserInfo:", 0);
  -[SBHStackConfigurationInteraction setContainerView:](self, "setContainerView:", 0);
  -[SBHStackConfigurationInteraction setContainerViewController:](self, "setContainerViewController:", 0);
  -[SBHStackConfigurationInteraction setConfigurationViewController:](self, "setConfigurationViewController:", 0);
  -[SBHStackConfigurationInteraction iconView](self, "iconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPaused:forReason:", 0, 4);
  objc_msgSend(v9, "removeObserver:", self);
  objc_msgSend(v9, "customIconImageViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHidden:", 0);
  objc_msgSend(v11, "setAlpha:", 1.0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("SBIconZoomExpansionAnimationWillBeginNotification"), 0);
  -[SBHStackConfigurationInteraction delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "configurationInteractionDidEnd:", self);
  -[SBHStackConfigurationInteraction appearanceDelegate](self, "appearanceDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stackConfigurationViewControllerDidDisappear:", v7);

}

- (void)stackConfigurationViewController:(id)a3 didCommitStackConfiguration:(id)a4
{
  id v5;

  -[SBHStackConfigurationInteraction setConfiguration:](self, "setConfiguration:", a4);
  -[SBHStackConfigurationInteraction delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "configurationInteractionDidCommit:", self);

}

- (BOOL)stackConfigurationViewController:(id)a3 allowsRemovalOfIconDataSource:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "stackConfigurationInteraction:allowsRemovalOfIconDataSource:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (id)stackConfigurationViewController:(id)a3 draggedIconForIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stackConfigurationInteraction:draggedIconForIdentifier:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)stackConfigurationViewController:(id)a3 isConsumingDropSession:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stackConfigurationInteraction:isConsumingDropSession:", self, v5);

}

- (void)stackConfigurationViewController:(id)a3 didRemoveSuggestedWidgetIcon:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stackConfigurationInteraction:noteDidRemoveSuggestedWidgetIcon:", self, v5);

}

- (void)stackConfigurationViewControllerRequestsPresentAddWidgetSheet:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stackConfigurationInteraction:requestsPresentAddWidgetSheetFromPresenter:", self, v4);

}

- (void)stackConfigurationViewControllerWillAnimateWidgetInsertion:(id)a3
{
  id v4;

  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stackConfigurationInteractionWillAnimateWidgetInsertion:", self);

}

- (id)stackConfigurationViewController:(id)a3 dragPreviewForIconView:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stackConfigurationInteraction:dragPreviewForIconView:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)stackConfigurationViewController:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "stackConfigurationInteraction:targetedDragPreviewForIconView:item:session:previewParameters:", self, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)windowForIconDragPreviewsForStackConfigurationViewController:(id)a3 forWindowScene:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowForIconDragPreviewsForStackConfigurationInteraction:forWindowScene:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)stackConfigurationViewController:(id)a3 dragsSupportSystemDragsForIconView:(id)a4
{
  id v5;
  void *v6;
  char v7;
  BOOL v8;

  v5 = a4;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "stackConfigurationInteraction:dragsSupportSystemDragsForIconView:", self, v5);
  else
    v7 = objc_msgSend(v5, "dragsSupportSystemDragsByDefault");
  v8 = v7;

  return v8;
}

- (void)stackConfigurationViewController:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = a6;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "stackConfigurationInteraction:iconView:willAnimateDragLiftWithAnimator:session:", self, v12, v9, v10);

}

- (void)stackConfigurationViewController:(id)a3 iconView:(id)a4 dragLiftAnimationDidChangeDirection:(int64_t)a5
{
  void *v7;
  id v8;

  v8 = a4;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "stackConfigurationInteraction:iconView:dragLiftAnimationDidChangeDirection:", self, v8, a5);

}

- (id)stackConfigurationViewController:(id)a3 promoteSuggestedWidget:(id)a4 withinStack:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stackConfigurationInteraction:promoteSuggestedWidget:withinStack:", self, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)stackConfigurationViewController:(id)a3 iconContentScaleForGridSizeClass:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a4;
  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "stackConfigurationInteraction:iconContentScaleForGridSizeClass:", self, v5);
    v7 = v8;
  }

  return v7;
}

- (void)stackConfigurationViewControllerDoneButtonTapped:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "stackConfigurationDoneButtonTapped:", self);
      v5 = v7;
    }
  }

}

- (int64_t)stackConfigurationViewControllerIconViewComponentBackgroundViewType:(id)a3
{
  void *v4;
  int64_t v5;

  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "stackConfigurationInteractionIconViewComponentBackgroundViewType:", self);
  else
    v5 = 4;

  return v5;
}

- (void)stackConfigurationViewControllerDidReceiveUserTouch:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "stackConfigurationInteractionDidReceiveUserTouch:", self);
      v5 = v7;
    }
  }

}

- (BOOL)stackConfigurationViewControllerShouldDisallowLabelArea:(id)a3
{
  void *v4;
  char v5;

  -[SBHStackConfigurationInteraction stackConfigurationDelegate](self, "stackConfigurationDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "stackConfigurationInteractionShouldDisallowLabelArea:", self);
  else
    v5 = 0;

  return v5;
}

- (void)iconViewSizeDidChange:(id)a3
{
  void *v4;
  uint64_t v5;

  -[SBHStackConfigurationInteraction transition](self, "transition", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "targetEndpoint");

  if (!v5)
    -[SBHStackConfigurationInteraction endConfigurationImmediately](self, "endConfigurationImmediately");
}

- (CGRect)_sourceContentFrame
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[SBHStackConfigurationInteraction iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationInteraction containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconImageFrame");
  objc_msgSend(v3, "convertRect:toView:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_contentBoundingFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  double v45;
  CGFloat rect;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect result;

  v59 = *MEMORY[0x1E0C80C00];
  -[SBHStackConfigurationInteraction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationInteraction _sourceContentFrame](self, "_sourceContentFrame");
  -[SBHStackConfigurationInteraction containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBHStackConfigurationInteraction iconView](self, "iconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  v16 = v12;
  v49 = v6;
  v50 = v10;
  v47 = v12;
  v48 = v8;
  if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "contentBoundingRectForConfigurationInteraction:", self);
    -[SBHStackConfigurationInteraction listLayoutProvider](self, "listLayoutProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutForIconLocation:", CFSTR("SBIconLocationTodayView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "icon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "gridSizeClass");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    SBHIconListLayoutIconImageInfoForGridSizeClass(v18, CFSTR("SBHIconGridSizeClassMedium"));
    SBHIconListLayoutIconImageInfoForGridSizeClass(v18, v20);
    -[SBHStackConfigurationInteraction _padApertureOutsetFromWidgetWithGridSize:](self, "_padApertureOutsetFromWidgetWithGridSize:", v20);
    UIEdgeInsetsMakeWithEdges();
    -[SBHWidgetSettings stackConfigurationContentHeightRatio](self->_widgetSettings, "stackConfigurationContentHeightRatio");
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    objc_msgSend(v13, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupTodayView"), v21);

    if ((_DWORD)v19)
    {
      v44 = 0;
      UIRectCenteredXInRectScale();
    }
    else
    {
      -[SBHWidgetSettings configurationFractionBetweenSourceAndContainerX](self->_widgetSettings, "configurationFractionBetweenSourceAndContainerX");
      -[SBHWidgetSettings configurationFractionBetweenSourceAndContainerY](self->_widgetSettings, "configurationFractionBetweenSourceAndContainerY");
      UIRectGetCenter();
      UIRectCenteredAboutPointScale();
    }
    v8 = v23;
    v10 = v24;
    v16 = v25;
    v26 = fmax(v22, 0.0);
    if (v50 - v24 <= v26)
      v6 = v50 - v24;
    else
      v6 = v26;

  }
  v45 = v12 + v16 * 0.1;
  rect = v8;
  UIRectContainInRect();
  x = v60.origin.x;
  y = v60.origin.y;
  width = v60.size.width;
  height = v60.size.height;
  if (CGRectIsEmpty(v60))
  {
    SBLogIcon();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      v61.origin.x = v6;
      v61.origin.y = rect;
      v61.size.width = v10;
      v61.size.height = v16;
      NSStringFromCGRect(v61);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v62.origin.x = v6;
      v62.origin.y = -(v16 * 0.1);
      v62.size.width = v10;
      v62.size.height = v45;
      NSStringFromCGRect(v62);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v63.origin.y = v48;
      v63.origin.x = v49;
      v63.size.width = v50;
      v63.size.height = v47;
      NSStringFromCGRect(v63);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v52 = v41;
      v53 = 2114;
      v54 = v42;
      v55 = 2114;
      v56 = v43;
      v57 = 2114;
      v58 = v4;
      _os_log_fault_impl(&dword_1CFEF3000, v31, OS_LOG_TYPE_FAULT, "Stack Configuration target content frame is empty with preferredContentRect(%{public}@), allowableRect(%{public}@), containerBounds(%{public}@), containerView(%{public}@).", buf, 0x2Au);

    }
    if (v13)
      objc_msgSend(v13, "window");
    else
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds", v44);
    x = v33;
    y = v34;
    width = v35;
    height = v36;

  }
  v37 = x;
  v38 = y;
  v39 = width;
  v40 = height;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (double)_padApertureOutsetFromWidgetWithGridSize:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  double v5;

  v3 = (__CFString *)a3;
  v4 = v3;
  v5 = 23.0;
  if (CFSTR("SBHIconGridSizeClassMedium") != v3 && (-[__CFString isEqualToString:](v3, "isEqualToString:") & 1) == 0)
  {
    if (CFSTR("SBHIconGridSizeClassLarge") == v4
      || (-[__CFString isEqualToString:](v4, "isEqualToString:") & 1) != 0
      || CFSTR("SBHIconGridSizeClassExtraLarge") == v4
      || (-[__CFString isEqualToString:](v4, "isEqualToString:") & 1) != 0
      || CFSTR("SBHIconGridSizeClassNewsLargeTall") == v4)
    {
      v5 = 38.0;
    }
    else if (-[__CFString isEqualToString:](v4, "isEqualToString:"))
    {
      v5 = 38.0;
    }
    else
    {
      v5 = 15.0;
    }
  }

  return v5;
}

- (void)_handleTransitionWillProgressToEndState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  -[SBHStackConfigurationInteraction configurationViewController](self, "configurationViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_setHitTestingDisabled:", v3 ^ 1);

  if (!v3)
  {
    objc_msgSend(v12, "visiblyActiveDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHStackConfigurationInteraction iconView](self, "iconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v7, "icon");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setActiveDataSource:", v6);
      objc_msgSend(v8, "customIconImageViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layoutIfNeeded");

    }
    else
    {
      objc_msgSend(v7, "setHidden:", 1);
    }

  }
  objc_msgSend(v12, "setEditingIcons:", v3);

}

- (SBHStackConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SBLeafIconDataSource)configuredDataSource
{
  return self->_configuredDataSource;
}

- (SBHWidgetSheetViewControllerPresenter)presenter
{
  return (SBHWidgetSheetViewControllerPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (SBHIconViewConfigurationInteractionDelegate)delegate
{
  return (SBHIconViewConfigurationInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBHStackConfigurationInteractionDelegate)stackConfigurationDelegate
{
  return (SBHStackConfigurationInteractionDelegate *)objc_loadWeakRetained((id *)&self->_stackConfigurationDelegate);
}

- (void)setStackConfigurationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stackConfigurationDelegate, a3);
}

- (SBHStackConfigurationViewControllerAppearanceDelegate)appearanceDelegate
{
  return (SBHStackConfigurationViewControllerAppearanceDelegate *)objc_loadWeakRetained((id *)&self->_appearanceDelegate);
}

- (void)setAppearanceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appearanceDelegate, a3);
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  self->_showsDoneButton = a3;
}

- (BOOL)showsAddButton
{
  return self->_showsAddButton;
}

- (void)setShowsAddButton:(BOOL)a3
{
  self->_showsAddButton = a3;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (SBHViewControllerTransition)transition
{
  return self->_transition;
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewController, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (SBHStackConfigurationViewController)configurationViewController
{
  return self->_configurationViewController;
}

- (void)setConfigurationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_configurationViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationViewController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_destroyWeak((id *)&self->_stackConfigurationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_configuredDataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
