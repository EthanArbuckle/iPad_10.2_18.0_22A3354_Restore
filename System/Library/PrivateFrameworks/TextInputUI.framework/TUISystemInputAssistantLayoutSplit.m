@implementation TUISystemInputAssistantLayoutSplit

- (TUISystemInputAssistantLayoutSplit)init
{
  TUISystemInputAssistantLayoutSplit *v2;
  TUISystemInputAssistantLayoutSplit *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUISystemInputAssistantLayoutSplit;
  v2 = -[TUISystemInputAssistantLayoutSplit init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TUISystemInputAssistantLayoutSplit setRightSplitWidth:](v2, "setRightSplitWidth:", 260.0);
    -[TUISystemInputAssistantLayoutSplit setLeftSplitWidth:](v3, "setLeftSplitWidth:", 260.0);
  }
  return v3;
}

- (BOOL)usesUnifiedButtonBar
{
  return 1;
}

- (void)configureButtonBarsInViewSet:(id)a3 forApplicationAssistantItem:(id)a4 withSystemAssistantItem:(id)a5 withAssistantView:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(v10, "showsCenterView") ^ 1;
  objc_msgSend(v13, "centerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", v14);

  -[TUISystemInputAssistantLayout _buttonBarGroupSetForApplicationAssistantItem:withSystemInputAssistantItem:forAssistantView:](self, "_buttonBarGroupSetForApplicationAssistantItem:withSystemInputAssistantItem:forAssistantView:", v12, v11, v10);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "rightButtonBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "unifiedButtonGroups");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setButtonGroups:", v17);

}

- (void)layoutViewSet:(id)a3 inBounds:(CGRect)a4 forAssistantView:(id)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  height = a4.size.height;
  width = a4.size.width;
  v8 = a3;
  objc_msgSend(v8, "leftButtonBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

  objc_msgSend(v8, "rightButtonBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 0);

  -[TUISystemInputAssistantLayoutSplit leftSplitWidth](self, "leftSplitWidth");
  v12 = v11;
  objc_msgSend(v8, "centerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", 0.0, 0.0, v12, height);

  -[TUISystemInputAssistantLayoutSplit rightSplitWidth](self, "rightSplitWidth");
  v15 = v14 + -50.0;
  objc_msgSend(v8, "rightButtonBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setButtonAlignment:", 2);

  objc_msgSend(v8, "rightButtonBar");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setFrame:", width - v15, 0.0, v15, height);
}

- (double)leftSplitWidth
{
  return self->_leftSplitWidth;
}

- (void)setLeftSplitWidth:(double)a3
{
  self->_leftSplitWidth = a3;
}

- (double)rightSplitWidth
{
  return self->_rightSplitWidth;
}

- (void)setRightSplitWidth:(double)a3
{
  self->_rightSplitWidth = a3;
}

@end
