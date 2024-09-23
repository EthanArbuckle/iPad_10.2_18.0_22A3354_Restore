@implementation _UIAlertControllerInterfaceActionGroupView

- (_UIAlertControllerInterfaceActionGroupView)initWithAlertController:(id)a3 actionGroup:(id)a4 actionHandlerInvocationDelegate:(id)a5
{
  id v8;
  _UIAlertControllerInterfaceActionGroupView *v9;
  _UIAlertControllerInterfaceActionGroupView *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIAlertControllerInterfaceActionGroupView;
  v9 = -[UIInterfaceActionGroupView initWithActionGroup:actionHandlerInvocationDelegate:](&v12, sel_initWithActionGroup_actionHandlerInvocationDelegate_, a4, a5);
  v10 = v9;
  if (v9)
    -[_UIAlertControllerInterfaceActionGroupView setAlertController:](v9, "setAlertController:", v8);

  return v10;
}

- (id)_alertController
{
  return objc_loadWeakRetained((id *)&self->_alertController);
}

- (id)defaultVisualStyleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  -[_UIAlertControllerInterfaceActionGroupView _alertController](self, "_alertController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_visualStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "interfaceActionVisualStyle");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIAlertControllerInterfaceActionGroupView;
    -[UIInterfaceActionGroupView defaultVisualStyleForTraitCollection:presentationStyle:](&v12, sel_defaultVisualStyleForTraitCollection_presentationStyle_, v6, a4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (BOOL)_shouldShowSeparatorAboveActionsSequenceView
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerInterfaceActionGroupView;
  v3 = -[UIInterfaceActionGroupView _shouldShowSeparatorAboveActionsSequenceView](&v5, sel__shouldShowSeparatorAboveActionsSequenceView);
  if (v3)
    LOBYTE(v3) = -[_UIAlertControllerInterfaceActionGroupView scrollableHeaderViewHasRealContent](self, "scrollableHeaderViewHasRealContent");
  return v3;
}

- (BOOL)_shouldInstallContentGuideConstraints
{
  return 0;
}

- (UIAlertController)alertController
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_alertController);
}

- (void)setAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_alertController, a3);
}

- (BOOL)scrollableHeaderViewHasRealContent
{
  return self->_scrollableHeaderViewHasRealContent;
}

- (void)setScrollableHeaderViewHasRealContent:(BOOL)a3
{
  self->_scrollableHeaderViewHasRealContent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertController);
}

@end
