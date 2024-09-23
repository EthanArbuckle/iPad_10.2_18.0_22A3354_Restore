@implementation WFWidgetCell

- (WFWidgetCell)init
{
  WFFloatingViewConfiguration *v3;
  double v4;
  WFWidgetCell *v5;
  WFWidgetCell *v6;
  id v7;
  UITextView *v8;
  void *v9;
  void *v10;
  UITextView *nameView;
  UITextView *v12;
  UIImageView *v13;
  UIImageView *iconView;
  UIImageView *v15;
  WFWorkflowProgressView *v16;
  WFWorkflowProgressView *progressView;
  WFWorkflowProgressView *v18;
  void *v19;
  void *v20;
  WFWidgetCell *v21;
  objc_super v23;

  v3 = objc_alloc_init(WFFloatingViewConfiguration);
  LODWORD(v4) = 0;
  -[WFFloatingViewConfiguration setShadowOpacity:](v3, "setShadowOpacity:", v4);
  -[WFFloatingViewConfiguration setCornerRadius:](v3, "setCornerRadius:", 0.0);
  -[WFFloatingViewConfiguration setGradientDirection:](v3, "setGradientDirection:", 4);
  v23.receiver = self;
  v23.super_class = (Class)WFWidgetCell;
  v5 = -[WFFloatingView initWithConfiguration:](&v23, sel_initWithConfiguration_, v3);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_currentConfiguration, v3);
    -[WFWidgetCell setEnabled:](v6, "setEnabled:", 0);
    -[WFWidgetCell setExclusiveTouch:](v6, "setExclusiveTouch:", 1);
    v7 = objc_alloc(MEMORY[0x24BEBDA88]);
    v8 = (UITextView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[UITextView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
    -[UITextView setEditable:](v8, "setEditable:", 0);
    -[UITextView setSelectable:](v8, "setSelectable:", 0);
    -[UITextView textContainer](v8, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 4);

    -[UITextView layoutManager](v8, "layoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUsesDefaultHyphenation:", 1);

    -[UITextView setBackgroundColor:](v8, "setBackgroundColor:", 0);
    -[UITextView setClipsToBounds:](v8, "setClipsToBounds:", 1);
    -[WFWidgetCell addSubview:](v6, "addSubview:", v8);
    nameView = v6->_nameView;
    v6->_nameView = v8;
    v12 = v8;

    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    -[UIImageView setClipsToBounds:](v13, "setClipsToBounds:", 1);
    -[WFWidgetCell addSubview:](v6, "addSubview:", v13);
    iconView = v6->_iconView;
    v6->_iconView = v13;
    v15 = v13;

    v16 = objc_alloc_init(WFWorkflowProgressView);
    -[WFWorkflowProgressView setHidden:](v16, "setHidden:", 1);
    -[WFWidgetCell addSubview:](v6, "addSubview:", v16);
    progressView = v6->_progressView;
    v6->_progressView = v16;
    v18 = v16;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v6, sel_handleTap_);
    objc_msgSend(v19, "setNumberOfTouchesRequired:", 1);
    objc_msgSend(v19, "setNumberOfTapsRequired:", 1);
    -[WFWidgetCell addGestureRecognizer:](v6, "addGestureRecognizer:", v19);
    -[WFFloatingView setGradient:](v6, "setGradient:", 0);
    -[WFWidgetCell layer](v6, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAllowsGroupBlending:", 0);

    v21 = v6;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSProgress removeObserver:forKeyPath:context:](self->_progress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), WFProgressPercentageCompletedContext);
  -[NSProgress removeObserver:forKeyPath:context:](self->_progress, "removeObserver:forKeyPath:context:", self, CFSTR("userInfo.runningState"), WFProgressUserInfoContext);
  v3.receiver = self;
  v3.super_class = (Class)WFWidgetCell;
  -[WFWidgetCell dealloc](&v3, sel_dealloc);
}

- (BOOL)isRTL
{
  return -[WFWidgetCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
}

- (BOOL)isMultiline
{
  void *v2;
  NSString *v3;

  -[WFWidgetCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x24BEBE098]) == NSOrderedDescending;
  return (char)v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)WFWidgetCell;
  -[WFWidgetCell description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, runningState: %ld"), v4, -[WFWidgetCell runningState](self, "runningState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)workflowIdentifier
{
  return (NSString *)-[WFWorkflowDescriptor identifier](self->_workflowDescriptor, "identifier");
}

- (void)configureWithWorkflow:(id)a3 cornerRadius:(double)a4 widgetType:(int64_t)a5 family:(int64_t)a6 homeScreenTintColor:(id)a7
{
  id v13;
  void *v14;
  void *v15;
  double v16;
  int64_t v17;
  _BOOL8 v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;

  v41 = a3;
  v13 = a7;
  if (-[WFWidgetCell runningState](self, "runningState") == 1)
  {
    -[WFWidgetCell workflowDescriptor](self, "workflowDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqual:", v41))
    {
      -[WFWidgetCell currentConfiguration](self, "currentConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cornerRadius");
      if (v16 == a4)
      {
        v17 = -[WFWidgetCell lastKnownWidgetFamily](self, "lastKnownWidgetFamily");

        if (v17 == a6)
          goto LABEL_27;
        goto LABEL_8;
      }

    }
  }
LABEL_8:
  objc_storeStrong((id *)&self->_workflowDescriptor, a3);
  self->_lastKnownWidgetFamily = a6;
  self->_widgetType = a5;
  objc_storeStrong((id *)&self->_homeScreenTintColor, a7);
  v19 = a5 == 1 && a6 == 1;
  -[WFWidgetCell currentConfiguration](self, "currentConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAppliesCornerRadiusDuringTouchDownOnly:", v19);

  -[WFWidgetCell currentConfiguration](self, "currentConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cornerRadius");
  v23 = v22;

  if (v23 != a4)
  {
    -[WFWidgetCell currentConfiguration](self, "currentConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", a4);

    -[WFWidgetCell currentConfiguration](self, "currentConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFloatingView applyConfiguration:](self, "applyConfiguration:", v25);

  }
  -[WFWidgetCell resetProgressState](self, "resetProgressState");
  if (v41)
  {
    -[WFWidgetCell nameView](self, "nameView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetCell addSubview:](self, "addSubview:", v26);

    -[WFWidgetCell iconView](self, "iconView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetCell addSubview:](self, "addSubview:", v27);

    -[WFWidgetCell setEmptyStateBackgroundView:](self, "setEmptyStateBackgroundView:", 0);
    -[WFWidgetCell updateGradient](self, "updateGradient");
    objc_msgSend(v41, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetCell nameView](self, "nameView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v28);

    objc_msgSend(v41, "associatedAppBundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      goto LABEL_30;
    if (a6 == 1)
      objc_msgSend(MEMORY[0x24BEC1320], "largeGlyphSize");
    else
      objc_msgSend(MEMORY[0x24BEC1320], "smallGlyphSize");
    v33 = v31;
    v34 = v32;
    objc_msgSend(v41, "associatedAppBundleIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFApplicationIconProvider applicationIconImageForBundleIdentifier:size:](WFApplicationIconProvider, "applicationIconImageForBundleIdentifier:size:", v35, v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
LABEL_30:
      if (objc_msgSend(v41, "iconImage"))
      {
        v37 = objc_alloc(MEMORY[0x24BEBD640]);
        v38 = objc_msgSend(v41, "iconImage");
        objc_msgSend(v41, "iconImageScale");
        v39 = (void *)objc_msgSend(v37, "initWithCGImage:scale:orientation:", v38, 0);
        objc_msgSend(v39, "imageWithRenderingMode:", 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v36 = 0;
      }
    }
    -[WFWidgetCell iconView](self, "iconView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setImage:", v36);

    -[WFWidgetCell setEnabled:](self, "setEnabled:", 1);
    -[WFWidgetCell updateTextTint](self, "updateTextTint");
    -[WFWidgetCell setNeedsLayout](self, "setNeedsLayout");

  }
  else
  {
    -[WFWidgetCell resetToEmptyState](self, "resetToEmptyState");
  }
LABEL_27:

}

- (id)emptyCellGradient
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BEC14B0]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1398]), "initWithWhite:alpha:", 0.0, 0.1);
  v4 = (void *)objc_msgSend(v2, "initWithColor:", v3);

  return v4;
}

- (void)updateGradient
{
  WFWorkflowDescriptor *workflowDescriptor;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  workflowDescriptor = self->_workflowDescriptor;
  if (workflowDescriptor)
  {
    if (!self->_homeScreenTintColor)
    {
      -[WFWorkflowDescriptor backgroundColor](workflowDescriptor, "backgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "paletteGradient");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEC14B0]), "initWithColor:", self->_homeScreenTintColor);
  }
  else
  {
    -[WFWidgetCell emptyCellGradient](self, "emptyCellGradient");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:
  v7.receiver = self;
  v7.super_class = (Class)WFWidgetCell;
  -[WFFloatingView setGradient:](&v7, sel_setGradient_, v5);

}

- (void)updateTextTint
{
  void *v3;
  WFColor *homeScreenTintColor;
  double (**v5)(void *, void *);
  void *v6;
  double v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD aBlock[5];
  uint64_t v15;
  double v16;
  double v17;
  double v18;

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0.0;
  v18 = 0.0;
  v15 = 0;
  v16 = 0.0;
  homeScreenTintColor = self->_homeScreenTintColor;
  if (homeScreenTintColor
    && -[WFColor getRed:green:blue:alpha:](homeScreenTintColor, "getRed:green:blue:alpha:", &v18, &v17, &v16, &v15))
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __30__WFWidgetCell_updateTextTint__block_invoke;
    aBlock[3] = &__block_descriptor_40_e17_d16__0__UIColor_8l;
    *(double *)&aBlock[4] = v17 * (v17 * 0.7152) + v18 * 0.2126 * v18 + v16 * 0.0722 * v16;
    v5 = (double (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray2Color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5[2](v5, v6);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5[2](v5, v8);

    if (v7 > v9)
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray2Color");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v10;
  }
  -[WFWidgetCell nameView](self, "nameView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v3);

  -[WFWidgetCell iconView](self, "iconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v3);

  -[WFWidgetCell progressView](self, "progressView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v3);

}

- (void)setHomeScreenTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenTintColor, a3);
  -[WFWidgetCell updateGradient](self, "updateGradient");
  -[WFWidgetCell updateTextTint](self, "updateTextTint");
}

- (BOOL)touchIsInView:(id)a3 event:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;
  CGPoint v13;
  CGRect v14;

  v6 = a4;
  objc_msgSend(a3, "locationInView:", self);
  v8 = v7;
  v10 = v9;
  -[WFWidgetCell bounds](self, "bounds");
  v13.x = v8;
  v13.y = v10;
  if (CGRectContainsPoint(v14, v13))
    v11 = 1;
  else
    v11 = -[WFWidgetCell pointInside:withEvent:](self, "pointInside:withEvent:", v6, v8, v10);

  return v11;
}

- (BOOL)touchesContainNonIndirectTouch:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "type", (_QWORD)v8) != 1)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  _QWORD block[5];
  objc_super v8;

  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFWidgetCell;
  -[WFWidgetCell touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v6, a4);
  if (-[WFWidgetCell enabled](self, "enabled")
    && -[WFWidgetCell touchesContainNonIndirectTouch:](self, "touchesContainNonIndirectTouch:", v6))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__WFWidgetCell_touchesBegan_withEvent___block_invoke;
    block[3] = &unk_24C5ABB88;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _QWORD v12[5];
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WFWidgetCell;
  -[WFWidgetCell touchesMoved:withEvent:](&v18, sel_touchesMoved_withEvent_, v6, v7);
  if (-[WFWidgetCell enabled](self, "enabled")
    && -[WFWidgetCell touchesContainNonIndirectTouch:](self, "touchesContainNonIndirectTouch:", v6))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          if (-[WFWidgetCell touchIsInView:event:](self, "touchIsInView:event:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v7))
          {
            LOBYTE(v9) = 1;
            goto LABEL_13;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __39__WFWidgetCell_touchesMoved_withEvent___block_invoke;
    v12[3] = &unk_24C5AB970;
    v12[4] = self;
    v13 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFWidgetCell;
  -[WFWidgetCell touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3, a4);
  if (-[WFWidgetCell enabled](self, "enabled"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__WFWidgetCell_touchesEnded_withEvent___block_invoke;
    block[3] = &unk_24C5ABB88;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFWidgetCell;
  -[WFWidgetCell touchesCancelled:withEvent:](&v6, sel_touchesCancelled_withEvent_, a3, a4);
  if (-[WFWidgetCell enabled](self, "enabled"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__WFWidgetCell_touchesCancelled_withEvent___block_invoke;
    block[3] = &unk_24C5ABB88;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (void)resetToEmptyState
{
  WFWorkflowDescriptor *workflowDescriptor;
  int64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  workflowDescriptor = self->_workflowDescriptor;
  self->_workflowDescriptor = 0;

  v4 = -[WFWidgetCell widgetType](self, "widgetType");
  -[WFWidgetCell emptyStateBackgroundView](self, "emptyStateBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 1)
  {

    if (!v6)
    {
      v7 = objc_alloc(MEMORY[0x24BEBDB38]);
      v8 = (void *)MEMORY[0x24BEBDAF0];
      objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "effectForBlurEffect:style:", v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v7, "initWithEffect:", v10);
      -[WFWidgetCell setEmptyStateBackgroundView:](self, "setEmptyStateBackgroundView:", v11);

      -[WFWidgetCell emptyStateBackgroundView](self, "emptyStateBackgroundView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWidgetCell nameView](self, "nameView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", v14);

      -[WFWidgetCell emptyStateBackgroundView](self, "emptyStateBackgroundView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWidgetCell iconView](self, "iconView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", v17);

      -[WFWidgetCell bounds](self, "bounds");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      -[WFWidgetCell emptyStateBackgroundView](self, "emptyStateBackgroundView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

      -[WFWidgetCell emptyStateBackgroundView](self, "emptyStateBackgroundView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setAutoresizingMask:", 18);

      -[WFWidgetCell emptyStateBackgroundView](self, "emptyStateBackgroundView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWidgetCell addSubview:](self, "addSubview:", v28);

    }
    WFLocalizedString(CFSTR("No Shortcut"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetCell nameView](self, "nameView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", v29);

    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("app.2.stack.3d"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "imageWithRenderingMode:", 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetCell iconView](self, "iconView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setImage:", v32);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetCell nameView](self, "nameView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTextColor:", v34);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetCell iconView](self, "iconView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTintColor:", v36);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetCell progressView](self, "progressView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTintColor:", v38);

  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview");

    -[WFWidgetCell nameView](self, "nameView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setText:", 0);

    -[WFWidgetCell iconView](self, "iconView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setImage:", 0);
  }

  -[WFWidgetCell setEnabled:](self, "setEnabled:", v4 == 1);
  -[WFWidgetCell updateGradient](self, "updateGradient");
}

- (void)resetProgressState
{
  void *v3;
  void *v4;
  void *v5;
  NSProgress *progress;

  self->_runningState = 0;
  -[WFWidgetCell progressView](self, "progressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[WFWidgetCell progressView](self, "progressView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionToState:", 0);

  -[WFWidgetCell progressView](self, "progressView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reset");

  -[NSProgress removeObserver:forKeyPath:](self->_progress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
  -[NSProgress removeObserver:forKeyPath:](self->_progress, "removeObserver:forKeyPath:", self, CFSTR("userInfo.runningState"));
  progress = self->_progress;
  self->_progress = 0;

}

- (void)setEnabled:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_enabled != a3)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __27__WFWidgetCell_setEnabled___block_invoke;
    v5[3] = &unk_24C5AB970;
    v5[4] = self;
    v6 = a3;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 4, v5, 0, 0.200000003, 0.0);
    self->_enabled = a3;
  }
}

- (void)setRunningState:(int64_t)a3
{
  _QWORD v3[6];

  self->_runningState = a3;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __32__WFWidgetCell_setRunningState___block_invoke;
  v3[3] = &unk_24C5ABA38;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  double v18;
  double v19;
  double v20;
  _QWORD *v21;
  _QWORD *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  objc_super v102;
  _QWORD v103[2];

  v103[1] = *MEMORY[0x24BDAC8D0];
  v102.receiver = self;
  v102.super_class = (Class)WFWidgetCell;
  -[WFWidgetCell layoutSubviews](&v102, sel_layoutSubviews);
  -[WFWidgetCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WFWidgetCell window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  if (v13 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
  }
  else
  {
    -[WFWidgetCell window](self, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "screen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");

  }
  -[WFWidgetCell emptyStateBackgroundView](self, "emptyStateBackgroundView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v4, v6, v8, v10);

  v17 = -[WFWidgetCell isRTL](self, "isRTL");
  if (v8 == v10)
  {
    objc_msgSend(MEMORY[0x24BEC1320], "largeGlyphSize");
  }
  else if (v10 > 50.0)
  {
    objc_msgSend(MEMORY[0x24BEC1320], "smallGlyphSize");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC1320], "extraSmallGlyphSize");
  }
  v18 = 8.0;
  if (v10 > 60.0)
    v18 = 10.0;
  if (v10 <= 50.0)
    v18 = 6.0;
  if (v8 == v10)
    v19 = 16.0;
  else
    v19 = 10.0;
  if (v8 == v10)
    v20 = 16.0;
  else
    v20 = v18;
  if (v8 == v10)
    v21 = (_QWORD *)MEMORY[0x24BEBE220];
  else
    v21 = (_QWORD *)MEMORY[0x24BEBE1F0];
  if (v8 == v10)
    v22 = (_QWORD *)MEMORY[0x24BEBE090];
  else
    v22 = (_QWORD *)MEMORY[0x24BEBE078];
  v101 = v19;
  UIRectIntegralWithScale();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[WFWidgetCell iconView](self, "iconView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

  v100 = v20;
  UIRectIntegralWithScale();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[WFWidgetCell progressView](self, "progressView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithLegibilityWeight:", 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:", *v21, *v22, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetCell nameView](self, "nameView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFont:", v42);

  v44 = -[WFWidgetCell isMultiline](self, "isMultiline");
  -[WFWidgetCell nameView](self, "nameView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "textContainer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v8 == v10 || !v44)
  {
    if (v8 == v10)
      v76 = 2;
    else
      v76 = 1;
    objc_msgSend(v46, "setMaximumNumberOfLines:", v76);

    -[WFWidgetCell nameView](self, "nameView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "textContainer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setLineFragmentPadding:", 0.0);

    v79 = *MEMORY[0x24BEBE158];
    v80 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v81 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v82 = *(double *)(MEMORY[0x24BEBE158] + 24);
    -[WFWidgetCell nameView](self, "nameView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setTextContainerInset:", v79, v80, v81, v82);

    -[WFWidgetCell nameView](self, "nameView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "textContainer");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setExclusionPaths:", MEMORY[0x24BDBD1A8]);

    -[WFWidgetCell nameView](self, "nameView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "sizeThatFits:", v8 + v101 * -2.0, v10);

    objc_msgSend(v42, "lineHeight");
    objc_msgSend(v42, "lineHeight");
    if (v8 == v10)
      objc_msgSend(v42, "lineHeight");
    UIRectIntegralWithScale();
    v88 = v87;
    v90 = v89;
    v92 = v91;
    v94 = v93;
    -[WFWidgetCell nameView](self, "nameView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setFrame:", v88, v90, v92, v94);
  }
  else
  {
    objc_msgSend(v46, "setMaximumNumberOfLines:", 2);

    -[WFWidgetCell nameView](self, "nameView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "textContainer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setLineFragmentPadding:", 5.0);

    -[WFWidgetCell nameView](self, "nameView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "textContainer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "lineFragmentPadding");
    v53 = v101 - v52;

    -[WFWidgetCell nameView](self, "nameView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setTextContainerInset:", v100, v53, v100, v53);

    UIRectIntegralWithScale();
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v62 = v61;
    -[WFWidgetCell nameView](self, "nameView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setFrame:", v56, v58, v60, v62);

    v64 = (void *)MEMORY[0x24BEBD420];
    if (v17)
    {
      -[WFWidgetCell nameView](self, "nameView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "bounds");
      v67 = v66 - v101 * 2.0;
      -[WFWidgetCell iconView](self, "iconView");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "bounds");
      v70 = v67 - v69;
      -[WFWidgetCell iconView](self, "iconView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "bounds");
      v73 = v72 + v101 * 2.0;
      -[WFWidgetCell iconView](self, "iconView");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "bounds");
      objc_msgSend(v64, "bezierPathWithRect:", v70, 0.0, v73);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[WFWidgetCell iconView](self, "iconView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "bounds");
      v96 = v101 + v95;
      -[WFWidgetCell iconView](self, "iconView");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "bounds");
      objc_msgSend(v64, "bezierPathWithRect:", 0.0, 0.0, v96);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v103[0] = v75;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v103, 1);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetCell nameView](self, "nameView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "textContainer");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setExclusionPaths:", v97);

  }
}

- (void)setProgress:(id)a3
{
  id v5;
  double v6;
  NSProgress *progress;
  id v8;

  v5 = a3;
  if (v5)
  {
    v8 = v5;
    objc_msgSend(v5, "fractionCompleted");
    v5 = v8;
    if (v6 != 1.0)
    {
      progress = self->_progress;
      if (progress)
      {
        -[NSProgress removeObserver:forKeyPath:](progress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
        -[NSProgress removeObserver:forKeyPath:](self->_progress, "removeObserver:forKeyPath:", self, CFSTR("userInfo.runningState"));
      }
      objc_storeStrong((id *)&self->_progress, a3);
      objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, WFProgressPercentageCompletedContext);
      objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("userInfo.runningState"), 0, WFProgressUserInfoContext);
      v5 = v8;
    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)WFProgressPercentageCompletedContext == a6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__WFWidgetCell_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24C5ABB88;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else if ((void *)WFProgressUserInfoContext == a6)
  {
    -[WFWidgetCell progress](self, "progress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BEC1CD8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFWidgetCell setRunningState:](self, "setRunningState:", objc_msgSend(v15, "integerValue"));
  }

}

- (void)handleTap:(id)a3
{
  id v4;

  -[WFWidgetCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetCellWasTapped:", self);

}

- (WFWidgetCellDelegate)delegate
{
  return (WFWidgetCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (int64_t)runningState
{
  return self->_runningState;
}

- (BOOL)completingSuccessfully
{
  return self->_completingSuccessfully;
}

- (void)setCompletingSuccessfully:(BOOL)a3
{
  self->_completingSuccessfully = a3;
}

- (WFColor)homeScreenTintColor
{
  return self->_homeScreenTintColor;
}

- (int64_t)widgetType
{
  return self->_widgetType;
}

- (void)setWidgetType:(int64_t)a3
{
  self->_widgetType = a3;
}

- (int64_t)lastKnownWidgetFamily
{
  return self->_lastKnownWidgetFamily;
}

- (void)setLastKnownWidgetFamily:(int64_t)a3
{
  self->_lastKnownWidgetFamily = a3;
}

- (WFWorkflowDescriptor)workflowDescriptor
{
  return self->_workflowDescriptor;
}

- (WFFloatingViewConfiguration)currentConfiguration
{
  return self->_currentConfiguration;
}

- (void)setCurrentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_currentConfiguration, a3);
}

- (UITextView)nameView
{
  return self->_nameView;
}

- (void)setNameView:(id)a3
{
  objc_storeStrong((id *)&self->_nameView, a3);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (CGSize)iconViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconViewSize.width;
  height = self->_iconViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIconViewSize:(CGSize)a3
{
  self->_iconViewSize = a3;
}

- (WFWorkflowProgressView)progressView
{
  return self->_progressView;
}

- (NSTimer)clearCompletedTimer
{
  return self->_clearCompletedTimer;
}

- (void)setClearCompletedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_clearCompletedTimer, a3);
}

- (UIVisualEffectView)emptyStateBackgroundView
{
  return self->_emptyStateBackgroundView;
}

- (void)setEmptyStateBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_emptyStateBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyStateBackgroundView, 0);
  objc_storeStrong((id *)&self->_clearCompletedTimer, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_nameView, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_workflowDescriptor, 0);
  objc_storeStrong((id *)&self->_homeScreenTintColor, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __63__WFWidgetCell_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  BOOL v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fractionCompleted");
  v4 = v3;

  v5 = v4 > 0.0 && v4 < 1.0;
  if (v5 && objc_msgSend(*(id *)(a1 + 32), "runningState") != 1)
    objc_msgSend(*(id *)(a1 + 32), "setRunningState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "progressView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fractionCompleted");
  objc_msgSend(v7, "setFractionCompleted:");

}

void __32__WFWidgetCell_setRunningState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD aBlock[4];
  id v22;
  uint64_t v23;
  uint64_t v24;

  objc_msgSend(*(id *)(a1 + 32), "progressView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clearCompletedTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setClearCompletedTimer:", 0);
  if (!*(_QWORD *)(a1 + 40))
  {
    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__WFWidgetCell_setRunningState___block_invoke_2;
    aBlock[3] = &unk_24C5AB9C0;
    v9 = v2;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v22 = v9;
    v23 = v10;
    v24 = v11;
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(*(id *)(a1 + 32), "completingSuccessfully"))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 417) = 0;
      objc_msgSend(v9, "transitionToState:", 1);
      v13 = (void *)MEMORY[0x24BDBCF40];
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __32__WFWidgetCell_setRunningState___block_invoke_5;
      v19[3] = &unk_24C5AB9E8;
      v20 = v12;
      objc_msgSend(v13, "scheduledTimerWithTimeInterval:repeats:block:", 0, v19, 1.5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setClearCompletedTimer:", v14);

    }
    else
    {
      v12[2](v12);
    }

    v7 = v22;
    goto LABEL_9;
  }
  objc_msgSend(v2, "transitionToState:", 0);
  if (objc_msgSend(v2, "isHidden"))
  {
    objc_msgSend(v2, "setAlpha:", 0.0);
    objc_msgSend(v2, "setHidden:", 0);
    v4 = (void *)MEMORY[0x24BEBDB00];
    v5 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __32__WFWidgetCell_setRunningState___block_invoke_6;
    v17[3] = &unk_24C5ABB88;
    v18 = v2;
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __32__WFWidgetCell_setRunningState___block_invoke_7;
    v16[3] = &unk_24C5ABA10;
    v6 = *(_QWORD *)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v16[5] = v6;
    objc_msgSend(v4, "animateWithDuration:animations:completion:", v17, v16, 0.200000003);
    v7 = v18;
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "widgetCellDidTransitionToState:", *(_QWORD *)(a1 + 40));

LABEL_10:
}

void __32__WFWidgetCell_setRunningState___block_invoke_2(uint64_t a1)
{
  double v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  if (objc_msgSend(*(id *)(a1 + 32), "isHidden") && (objc_msgSend(*(id *)(a1 + 32), "alpha"), v2 <= 0.0))
  {
    objc_msgSend(*(id *)(a1 + 40), "resetProgressState");
  }
  else
  {
    v3 = MEMORY[0x24BDAC760];
    v4 = (void *)MEMORY[0x24BEBDB00];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __32__WFWidgetCell_setRunningState___block_invoke_3;
    v12[3] = &unk_24C5ABB88;
    v13 = *(id *)(a1 + 32);
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __32__WFWidgetCell_setRunningState___block_invoke_4;
    v8[3] = &unk_24C5AB998;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = v5;
    v10 = v6;
    v11 = v7;
    objc_msgSend(v4, "animateWithDuration:animations:completion:", v12, v8, 0.200000003);

  }
}

uint64_t __32__WFWidgetCell_setRunningState___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __32__WFWidgetCell_setRunningState___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __32__WFWidgetCell_setRunningState___block_invoke_7(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetCellDidTransitionToState:", *(_QWORD *)(a1 + 40));

}

uint64_t __32__WFWidgetCell_setRunningState___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __32__WFWidgetCell_setRunningState___block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetCellDidTransitionToState:", *(_QWORD *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 40), "resetProgressState");
}

uint64_t __27__WFWidgetCell_setEnabled___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.5;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

uint64_t __43__WFWidgetCell_touchesCancelled_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPressed:animated:", 0, 1);
}

uint64_t __39__WFWidgetCell_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPressed:animated:", 0, 1);
}

uint64_t __39__WFWidgetCell_touchesMoved_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPressed:animated:", *(unsigned __int8 *)(a1 + 40), 1);
}

uint64_t __39__WFWidgetCell_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPressed:animated:", 1, 1);
}

double __30__WFWidgetCell_updateTextTint__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  double result;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v11 = 0.0;
  v12 = 0.0;
  v9 = 0;
  v10 = 0.0;
  v3 = objc_msgSend(a2, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);
  result = 0.0;
  if (v3)
  {
    v5 = v11 * (v11 * 0.7152) + v12 * 0.2126 * v12 + v10 * 0.0722 * v10;
    v6 = *(double *)(a1 + 32);
    if (v5 >= v6)
      v7 = v11 * (v11 * 0.7152) + v12 * 0.2126 * v12 + v10 * 0.0722 * v10;
    else
      v7 = *(double *)(a1 + 32);
    v8 = v7 + 0.05;
    if (v5 >= v6)
      v5 = *(double *)(a1 + 32);
    return v8 / (v5 + 0.05);
  }
  return result;
}

@end
