@implementation WFParameterEditorHostingCell

- (WFParameterEditorHostingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFParameterEditorHostingCell *v4;
  WFParameterHostingView *v5;
  void *v6;
  WFParameterEditorHostingCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFParameterEditorHostingCell;
  v4 = -[WFParameterEditorHostingCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(WFParameterHostingView);
    -[WFParameterEditorHostingCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v5);

    -[WFParameterEditorHostingCell setModernHostingView:](v4, "setModernHostingView:", v5);
    v7 = v4;

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double x;
  double y;
  double width;
  double height;
  void *v16;
  void *v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)WFParameterEditorHostingCell;
  -[WFParameterEditorHostingCell layoutSubviews](&v18, sel_layoutSubviews);
  -[WFParameterEditorHostingCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  v20 = CGRectIntegral(v19);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  -[WFParameterEditorHostingCell modernHostingView](self, "modernHostingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", x, y, width, height);

  if (v9 != self->_lastWidth)
  {
    self->_lastWidth = v9;
    -[WFParameterEditorHostingCell delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "parameterEditorCellDidInvalidateSize:", self);

  }
}

- (void)setContainingViewController:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containingViewController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_containingViewController, obj);
    -[WFParameterEditorHostingCell updateContext](self, "updateContext");
  }

}

- (void)updateContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFParameterEditorHostingCell containingViewController](self, "containingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFParameterEditorHostingCell modernHostingView](self, "modernHostingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    -[WFParameterEditorHostingCell containingViewController](self, "containingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachToParentViewController:", v6);

  }
  else
  {
    objc_msgSend(v4, "detachFromParentViewController");
  }

  -[WFParameterEditorHostingCell reconfigureModernView](self, "reconfigureModernView");
}

- (void)updateModel:(id)a3
{
  WFParameterEditorModel *v5;
  WFParameterEditorModel *model;
  void *v7;
  void *v8;
  WFParameterEditorModel *v9;

  v5 = (WFParameterEditorModel *)a3;
  model = self->_model;
  v9 = v5;
  if (model != v5)
  {
    -[WFParameterEditorModel parameter](model, "parameter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeEventObserver:", self);

    objc_storeStrong((id *)&self->_model, a3);
    -[WFParameterEditorModel parameter](v9, "parameter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEventObserver:", self);

    -[WFParameterEditorHostingCell reconfigureModernView](self, "reconfigureModernView");
  }

}

- (void)reconfigureModernView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  -[WFParameterEditorHostingCell model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFParameterEditorHostingCell modernHostingView](self, "modernHostingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parameter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "becomeFirstResponder");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__WFParameterEditorHostingCell_reconfigureModernView__block_invoke;
    v8[3] = &unk_24EE24DB8;
    v8[4] = self;
    objc_msgSend(v4, "configureViewWithParameter:state:processing:shouldFocus:variableProvider:updateBlock:", v5, v6, 1, v7, 0, v8);

  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if (sel_isEqual(a3, sel_updatedParameterState_isUIUpdate_))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFParameterEditorHostingCell;
    v7 = -[WFParameterEditorHostingCell canPerformAction:withSender:](&v9, sel_canPerformAction_withSender_, a3, v6);
  }

  return v7;
}

- (void)updatedParameterState:(id)a3 isUIUpdate:(BOOL)a4
{
  id v6;
  void *v7;
  _QWORD block[5];

  v6 = a3;
  if (!a4)
  {
    -[WFParameterEditorHostingCell delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parameterEditorCell:didUpdateParameterState:", self, v6);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__WFParameterEditorHostingCell_updatedParameterState_isUIUpdate___block_invoke;
  block[3] = &unk_24EE25C70;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  width = a3.width;
  -[WFParameterEditorHostingCell contentView](self, "contentView", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  if (width >= v6)
  {
    -[WFParameterEditorHostingCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    width = v8;

  }
  -[WFParameterEditorHostingCell modernHostingView](self, "modernHostingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", width, 1.79769313e308);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFParameterEditorHostingCell;
  -[WFParameterEditorHostingCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[WFParameterEditorHostingCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[WFParameterEditorHostingCell updateContext](self, "updateContext");

}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4;

  -[WFParameterEditorHostingCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterEditorCellDidInvalidateSize:", self);

}

- (WFParameterEditorHostingCellDelegate)delegate
{
  return (WFParameterEditorHostingCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)containingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_containingViewController);
}

- (WFParameterEditorModel)model
{
  return self->_model;
}

- (WFParameterHostingView)modernHostingView
{
  return self->_modernHostingView;
}

- (void)setModernHostingView:(id)a3
{
  objc_storeStrong((id *)&self->_modernHostingView, a3);
}

- (double)lastWidth
{
  return self->_lastWidth;
}

- (void)setLastWidth:(double)a3
{
  self->_lastWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modernHostingView, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_containingViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

void __65__WFParameterEditorHostingCell_updatedParameterState_isUIUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parameterEditorCellDidInvalidateSize:", *(_QWORD *)(a1 + 32));

}

uint64_t __53__WFParameterEditorHostingCell_reconfigureModernView__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatedParameterState:isUIUpdate:", a2, a3);
}

@end
