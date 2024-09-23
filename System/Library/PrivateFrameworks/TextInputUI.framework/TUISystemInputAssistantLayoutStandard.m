@implementation TUISystemInputAssistantLayoutStandard

- (void)setRightSplitWidth:(double)a3
{
  self->_leftSplitWidth = a3;
}

- (void)setLeftSplitWidth:(double)a3
{
  *(double *)&self->_isSplit = a3;
}

- (void)setIsSplit:(BOOL)a3
{
  *(&self->super._usesUnifiedButtonBar + 1) = a3;
}

- (void)layoutViewSet:(id)a3 inBounds:(CGRect)a4 forAssistantView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  id v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a3;
  v11 = a5;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  if (!CGRectIsEmpty(v17))
  {
    v12 = objc_msgSend(v11, "showsButtonBarItemsInline") ^ 1;
    objc_msgSend(v16, "leftButtonBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", v12);

    objc_msgSend(v16, "rightButtonBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", v12);

    objc_msgSend(v11, "centerViewWidth");
    if (v15 <= 0.0)
      -[TUISystemInputAssistantLayoutStandard _layoutViewSet:forFlexibleCenterViewInBounds:forAssistantView:](self, "_layoutViewSet:forFlexibleCenterViewInBounds:forAssistantView:", v16, v11, x, y, width, height);
    else
      -[TUISystemInputAssistantLayoutStandard _layoutViewSet:forFixedCenterViewWidth:inBounds:forAssistantView:](self, "_layoutViewSet:forFixedCenterViewWidth:inBounds:forAssistantView:", v16, v11);
  }

}

- (void)configureButtonBarsInViewSet:(id)a3 forApplicationAssistantItem:(id)a4 withSystemAssistantItem:(id)a5 withAssistantView:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(void *, void *, void *, void *);
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD aBlock[4];
  id v31;

  v10 = a3;
  v11 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __140__TUISystemInputAssistantLayoutStandard_configureButtonBarsInViewSet_forApplicationAssistantItem_withSystemAssistantItem_withAssistantView___block_invoke;
  aBlock[3] = &unk_1E24FB3A0;
  v12 = v11;
  v31 = v12;
  v13 = a5;
  v14 = a4;
  v15 = (void (**)(void *, void *, void *, void *))_Block_copy(aBlock);
  -[TUISystemInputAssistantLayout _buttonBarGroupSetForApplicationAssistantItem:withSystemInputAssistantItem:forAssistantView:](self, "_buttonBarGroupSetForApplicationAssistantItem:withSystemInputAssistantItem:forAssistantView:", v14, v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v12, "showsCenterView") ^ 1;
  objc_msgSend(v10, "centerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", v17);

  if (-[TUISystemInputAssistantLayout usesUnifiedButtonBar](self, "usesUnifiedButtonBar"))
  {
    objc_msgSend(v10, "unifiedButtonBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unifiedButtonGroups");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setButtonGroups:", v20);
  }
  else
  {
    objc_msgSend(v10, "leftButtonBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "effectiveUserInterfaceLayoutDirection");

    if (v22 == 1)
    {
      objc_msgSend(v10, "rightButtonBar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "leadingButtonGroups");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "leadingSeparators");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v23, v24, v25);

      objc_msgSend(v10, "leftButtonBar");
    }
    else
    {
      objc_msgSend(v10, "leftButtonBar");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "leadingButtonGroups");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "leadingSeparators");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v26, v27, v28);

      objc_msgSend(v10, "rightButtonBar");
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingButtonGroups");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingSeparators");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v19, v20, v29);

  }
}

void __140__TUISystemInputAssistantLayoutStandard_configureButtonBarsInViewSet_forApplicationAssistantItem_withSystemAssistantItem_withAssistantView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(v9, "setButtonGroups:animated:", v8, objc_msgSend(v6, "isTransitioning"));

  objc_msgSend(v9, "setSeparatorGroups:", v7);
}

- (void)_layoutViewSet:(id)a3 forFixedCenterViewWidth:(double)a4 inBounds:(CGRect)a5 forAssistantView:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double MaxX;
  double MinX;
  BOOL v30;
  void *v31;
  void *v32;
  double v33;
  double dx;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v35 = a3;
  v13 = a6;
  objc_msgSend(v35, "viewSetContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "translatesAutoresizingMaskIntoConstraints");

  if (v15)
  {
    objc_msgSend(v35, "viewSetContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    objc_msgSend(v16, "setFrame:");

  }
  else
  {
    objc_msgSend(v13, "resetContainerConstraints");
  }
  v17 = width - a4;
  if (((a4 > 0.0) & objc_msgSend(v13, "showsCenterView")) != 0)
    v18 = width - a4;
  else
    v18 = width;
  if (-[TUISystemInputAssistantLayoutStandard isSplit](self, "isSplit"))
  {
    -[TUISystemInputAssistantLayoutStandard leftSplitWidth](self, "leftSplitWidth");
    dx = v19;
    -[TUISystemInputAssistantLayoutStandard rightSplitWidth](self, "rightSplitWidth");
    v21 = v20;
  }
  else
  {
    v21 = v18 * 0.5;
    dx = v21;
  }
  v22 = objc_msgSend(v13, "showsCenterView");
  if (a4 <= 0.0)
  {
    v23 = height;
    v24 = width;
  }
  else
  {
    v23 = height;
    v24 = width;
    if (v22)
    {
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      v37 = CGRectInset(v36, v17 * 0.5, 0.0);
      x = v37.origin.x;
      y = v37.origin.y;
      v24 = v37.size.width;
      v23 = v37.size.height;
    }
  }
  if (objc_msgSend(v13, "showsButtonBarItemsInline"))
  {
    objc_msgSend(v35, "leftButtonBar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", 0.0, 0.0, dx, height);

    if (objc_msgSend(v13, "showsCenterView"))
    {
      objc_msgSend(v35, "leftButtonBar");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frame");
      v33 = v21;
      v27 = height;
      MaxX = CGRectGetMaxX(v38);
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = v24;
      v39.size.height = v23;
      MinX = CGRectGetMinX(v39);

      v30 = MaxX <= MinX;
      height = v27;
      v21 = v33;
      if (!v30)
      {
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = v24;
        v40.size.height = v23;
        v41 = CGRectInset(v40, dx, 0.0);
        x = v41.origin.x;
        y = v41.origin.y;
        v24 = v41.size.width;
        v23 = v41.size.height;
      }
    }
    objc_msgSend(v35, "rightButtonBar");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", width - v21, 0.0, v21, height);

  }
  objc_msgSend(v35, "centerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", x, y, v24, v23);

}

- (void)_layoutViewSet:(id)a3 forFlexibleCenterViewInBounds:(CGRect)a4 forAssistantView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  CGRect v28;
  CGRect v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v27 = a3;
  v10 = a5;
  objc_msgSend(v27, "viewSetContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "translatesAutoresizingMaskIntoConstraints");

  if (v12)
  {
    objc_msgSend(v27, "viewSetContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    objc_msgSend(v13, "setFrame:");

  }
  else
  {
    objc_msgSend(v10, "resetContainerConstraints");
  }
  v14 = objc_msgSend(v10, "showsButtonBarItemsInline");

  if (v14)
  {
    objc_msgSend(v27, "leftButtonBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "intrinsicContentSize");
    v17 = v16;

    objc_msgSend(v27, "rightButtonBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "intrinsicContentSize");
    v20 = v19;

    v21 = v17 + v20;
    if (width > 0.0 && v21 > width)
    {
      v17 = v17 * (width / v21);
      v20 = v20 * (width / v21);
      v21 = v20 + v17;
    }
    objc_msgSend(v27, "leftButtonBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    y = 0.0;
    objc_msgSend(v22, "setFrame:", 0.0, 0.0, v17, height);

    objc_msgSend(v27, "leftButtonBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    x = CGRectGetWidth(v28) + 0.0;

    width = width - v21;
    v29.origin.y = 0.0;
    v29.origin.x = x;
    v29.size.width = width;
    v29.size.height = height;
    v24 = x + CGRectGetWidth(v29);
    objc_msgSend(v27, "rightButtonBar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v24, 0.0, v20, height);

  }
  objc_msgSend(v27, "centerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", x, y, width, height);

}

- (unint64_t)currentRectEdge
{
  return 4;
}

- (BOOL)isSplit
{
  return *(&self->super._usesUnifiedButtonBar + 1);
}

- (double)leftSplitWidth
{
  return *(double *)&self->_isSplit;
}

- (double)rightSplitWidth
{
  return self->_leftSplitWidth;
}

@end
