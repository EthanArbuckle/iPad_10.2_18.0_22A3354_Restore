@implementation WFEditorViewController

- (WFEditorViewController)initWithWorkflow:(id)a3
{
  id v5;
  WFEditorViewController *v6;
  WFEditorViewController *v7;
  WFEditorHostingViewController *v8;
  WFEditorHostingViewController *hostingViewController;
  WFEditorViewController *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFEditorViewController;
  v6 = -[WFEditorViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workflow, a3);
    v8 = -[WFEditorHostingViewController initWithWorkflow:]([WFEditorHostingViewController alloc], "initWithWorkflow:", v5);
    hostingViewController = v7->_hostingViewController;
    v7->_hostingViewController = v8;

    -[WFEditorHostingViewController setDelegate:](v7->_hostingViewController, "setDelegate:", v7);
    v10 = v7;
  }

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_opt_new();
  -[WFEditorViewController setView:](self, "setView:", v3);

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[WFEditorViewController auxiliaryViewPresenter](self, "auxiliaryViewPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAuxiliaryViewPresenter:", v4);

  -[WFEditorViewController addChildViewController:](self, "addChildViewController:", v18);
  -[WFEditorViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v18, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  objc_msgSend(v18, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  -[WFEditorViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  objc_msgSend(v18, "didMoveToParentViewController:", self);
}

- (BOOL)isRunning
{
  void *v2;
  char v3;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  return v3;
}

- (BOOL)isEditable
{
  void *v2;
  char v3;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditable");

  return v3;
}

- (void)setEditable:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsEditable:", v3);

}

- (BOOL)canShowEmptyState
{
  void *v2;
  char v3;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowEmptyState");

  return v3;
}

- (void)setCanShowEmptyState:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanShowEmptyState:", v3);

}

- (BOOL)canShowInputAction
{
  void *v2;
  char v3;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowInputAction");

  return v3;
}

- (void)setCanShowInputAction:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanShowInputAction:", v3);

}

- (Class)triggerInputType
{
  void *v2;
  void *v3;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerInputType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (void)setTriggerInputType:(Class)a3
{
  id v4;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTriggerInputType:", a3);

}

- (HMHome)home
{
  void *v2;
  void *v3;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v3;
}

- (void)setHome:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHome:", v4);

}

- (double)actionCanvasWidth
{
  void *v2;
  double v3;
  double v4;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionCanvasWidth");
  v4 = v3;

  return v4;
}

- (WFContextualActionSuggester)actionSuggester
{
  void *v2;
  void *v3;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionSuggester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFContextualActionSuggester *)v3;
}

- (void)runWithSource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runWithSource:", v4);

}

- (void)stop
{
  id v2;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (void)stopPickingVariables
{
  id v2;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopPickingVariables");

}

- (void)appendAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendAction:selectionAware:", v4, 1);

}

- (void)scrollToAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollToAction:", v4);

}

- (void)showActionError:(id)a3 for:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showActionError:for:", v7, v6);

}

- (void)performScrollingTest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performScrollingTest:", v4);

}

- (void)reportSuggestionSessionEnded
{
  id v2;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportSuggestionSessionEnded");

}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[WFEditorViewController hostingViewController](self, "hostingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentScrollViewForEdge:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)editorHostingViewController:(id)a3 didChangeRunningState:(BOOL)a4 fractionCompleted:(double)a5 isWaiting:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v10;

  v6 = a6;
  v8 = a4;
  -[WFEditorViewController delegate](self, "delegate", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "editorViewController:didChangeRunningState:fractionCompleted:isWaiting:", self, v8, v6, a5);

}

- (void)editorHostingViewControllerDidFinishRunning:(id)a3 cancelled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[WFEditorViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editorViewControllerDidFinishRunning:cancelled:", self, v4);

}

- (void)editorHostingViewController:(id)a3 didChangeVariablePickingState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[WFEditorViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editorViewController:didChangeVariablePickingState:", self, v4);

}

- (void)actionsDidChangeInEditorHostingViewController:(id)a3
{
  id v4;

  -[WFEditorViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionsDidChangeInEditorViewController:", self);

}

- (WFEditorViewControllerDelegate)delegate
{
  return (WFEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFEditorAuxiliaryViewPresenter)auxiliaryViewPresenter
{
  return (WFEditorAuxiliaryViewPresenter *)objc_loadWeakRetained((id *)&self->_auxiliaryViewPresenter);
}

- (void)setAuxiliaryViewPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_auxiliaryViewPresenter, a3);
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (WFEditorHostingViewController)hostingViewController
{
  return self->_hostingViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingViewController, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_destroyWeak((id *)&self->_auxiliaryViewPresenter);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
