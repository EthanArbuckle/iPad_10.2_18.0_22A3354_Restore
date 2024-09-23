@implementation WFLocationParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v5;
  WFLocationPickerViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  WFLocationPickerViewController *v26;

  v5 = a4;
  v6 = [WFLocationPickerViewController alloc];
  -[WFModuleSummaryEditor initialState](self, "initialState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[WFLocationPickerViewController initWithPickerType:value:](v6, "initWithPickerType:value:", 0, v8);

  -[WFLocationPickerViewController setDelegate:](v26, "setDelegate:", self);
  -[WFModuleSummaryEditor parameter](self, "parameter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationPickerViewController setAllowsPickingCurrentLocation:](v26, "setAllowsPickingCurrentLocation:", objc_msgSend(v9, "allowsCurrentLocation"));

  -[WFModuleSummaryEditor parameter](self, "parameter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationPickerViewController setAllowsTextOnlyLocation:](v26, "setAllowsTextOnlyLocation:", objc_msgSend(v10, "allowsTextOnlyLocations"));

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v26);
  objc_msgSend(v11, "setModalPresentationStyle:", 7);
  objc_msgSend(v11, "popoverPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  objc_msgSend(v5, "sourceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "popoverPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSourceView:", v13);

  objc_msgSend(v5, "sourceRect");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v11, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSourceRect:", v16, v18, v20, v22);

  objc_msgSend(v11, "popoverPresentationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "wf_forcePresentationInPresenterSceneIfNeeded");

  objc_msgSend(v5, "sourceViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "presentViewController:animated:completion:", v11, 1, 0);
  objc_storeWeak((id *)&self->_presentedViewController, v11);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFLocationParameterSummaryEditor *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __71__WFLocationParameterSummaryEditor_cancelEditingWithCompletionHandler___block_invoke;
  v5[3] = &unk_24EE25B28;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFLocationParameterSummaryEditor;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFModuleSummaryEditor cancelEditingWithCompletionHandler:](&v4, sel_cancelEditingWithCompletionHandler_, v5);

}

- (void)locationPicker:(id)a3 didFinishWithValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a4)
  {
    v6 = a4;
    -[WFModuleSummaryEditor parameter](self, "parameter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "singleStateClass")), "initWithValue:", v6);

  }
  -[WFModuleSummaryEditor commitState:](self, "commitState:", a4);
  objc_msgSend(v9, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  -[WFModuleSummaryEditor completeEditing](self, "completeEditing");
}

- (void)locationPickerDidCancel:(id)a3
{
  void *v4;

  objc_msgSend(a3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[WFModuleSummaryEditor completeEditing](self, "completeEditing");
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4;
  void *v5;
  char v6;
  int64_t v7;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "wf_isWidgetConfigurationExtensionBundle");

  if ((v6 & 1) != 0)
  {
    v7 = 2;
  }
  else if (objc_msgSend(v4, "horizontalSizeClass") == 1)
  {
    v7 = 2;
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (UIViewController)presentedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentedViewController);
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentedViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedViewController);
}

void __71__WFLocationParameterSummaryEditor_cancelEditingWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  return 0;
}

@end
