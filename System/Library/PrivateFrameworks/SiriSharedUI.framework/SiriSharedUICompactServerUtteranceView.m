@implementation SiriSharedUICompactServerUtteranceView

- (SiriSharedUICompactServerUtteranceView)initWithContentInsets:(UIEdgeInsets)a3 delegate:(id)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  SiriSharedUICompactServerUtteranceView *v14;
  SiriSharedUICompactServerUtteranceView *v15;
  SiriSharedUIStandardView *v16;
  UIView *labelsContainerView;
  SiriSharedUIDeviceMotionEffectView *v18;
  SiriSharedUIDeviceMotionEffectView *deviceMotionEffectView;
  objc_super v21;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SiriSharedUICompactServerUtteranceView;
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = -[SiriSharedUICompactServerUtteranceView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v11, v12, v13);
  v15 = v14;
  if (v14)
  {
    v14->_contentInsets.top = top;
    v14->_contentInsets.left = left;
    v14->_contentInsets.bottom = bottom;
    v14->_contentInsets.right = right;
    objc_storeWeak((id *)&v14->_delegate, v9);
    v16 = -[SiriSharedUIStandardView initWithFrame:]([SiriSharedUIStandardView alloc], "initWithFrame:", v10, v11, v12, v13);
    labelsContainerView = v15->_labelsContainerView;
    v15->_labelsContainerView = &v16->super;

    -[SiriSharedUICompactServerUtteranceView addSubview:](v15, "addSubview:", v15->_labelsContainerView);
    v18 = objc_alloc_init(SiriSharedUIDeviceMotionEffectView);
    deviceMotionEffectView = v15->_deviceMotionEffectView;
    v15->_deviceMotionEffectView = v18;

    -[SiriSharedUICompactServerUtteranceView addSubview:](v15, "addSubview:", v15->_deviceMotionEffectView);
  }

  return v15;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setUtterances:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  NSMutableArray *v20;
  NSMutableArray *serverLabels;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  NSMapTable *v36;
  NSMapTable *emojiLabels;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIView subviews](self->_labelsContainerView, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v12, "removeFromSuperview");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v12, "assistantUtteranceView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "serverUtteranceView:utteranceViewDidDisappear:", self, v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v9);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[NSMapTable objectEnumerator](self->_emojiLabels, "objectEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "removeFromSuperview");
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v17);
  }
  v39 = v7;

  -[NSMapTable removeAllObjects](self->_emojiLabels, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  serverLabels = self->_serverLabels;
  self->_serverLabels = v20;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v22 = v4;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
        objc_msgSend(v27, "text");
        v28 = objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = (void *)v28;
          objc_msgSend(v27, "text");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isEqualToString:", &stru_1EA89F868);

          if ((v31 & 1) == 0)
          {
            -[SiriSharedUICompactServerUtteranceView _createLabelForUtterance:](self, "_createLabelForUtterance:", v27);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView addSubview:](self->_labelsContainerView, "addSubview:", v32);
            -[NSMutableArray addObject:](self->_serverLabels, "addObject:", v32);
            v33 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v33, "serverUtteranceView:utteranceViewDidAppear:", self, v27);

            -[SiriSharedUICompactServerUtteranceView _textForLabel:](self, "_textForLabel:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            +[SiriSharedUIUtilities substringRangesContainingEmojiInString:](SiriSharedUIUtilities, "substringRangesContainingEmojiInString:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v35, "count"))
            {
              if (!self->_emojiLabels)
              {
                objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
                v36 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
                emojiLabels = self->_emojiLabels;
                self->_emojiLabels = v36;

              }
              -[SiriSharedUICompactServerUtteranceView _createEmojiLabelForString:containingEmojisAtRanges:](self, "_createEmojiLabelForString:containingEmojisAtRanges:", v34, v35);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[SiriSharedUICompactServerUtteranceView addSubview:](self, "addSubview:", v38);
              -[NSMapTable setObject:forKey:](self->_emojiLabels, "setObject:forKey:", v38, v32);

            }
          }
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v24);
  }

  -[SiriSharedUIDeviceMotionEffectView viewWillBeUpdated](self->_deviceMotionEffectView, "viewWillBeUpdated");
  -[SiriSharedUICompactServerUtteranceView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)isMultiLine
{
  return self->_isMultiLine;
}

- (void)setIsInAmbient:(BOOL)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_isInAmbient != a3)
  {
    self->_isInAmbient = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_serverLabels;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
          -[SiriSharedUICompactServerUtteranceView _fontForUtteranceLabel](self, "_fontForUtteranceLabel", (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setFont:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  self->_isInAmbientInteractivity = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_serverLabels;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[SiriSharedUICompactServerUtteranceView _fontForUtteranceLabel](self, "_fontForUtteranceLabel", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFont:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  double top;
  double bottom;
  double v10;
  NSMutableArray *serverLabels;
  double v12;
  void *v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[9];
  uint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView subviews](self->_labelsContainerView, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v27 = 0x2020000000;
    v23 = 0x2020000000;
    top = self->_contentInsets.top;
    bottom = self->_contentInsets.bottom;
    v10 = width - self->_contentInsets.left - self->_contentInsets.right;
    v25 = 0;
    v26 = (double *)&v25;
    v28 = 0;
    v21 = 0;
    v22 = (double *)&v21;
    v24 = 0;
    serverLabels = self->_serverLabels;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__SiriSharedUICompactServerUtteranceView_sizeThatFits___block_invoke;
    v20[3] = &unk_1EA89CFC8;
    *(double *)&v20[7] = v10;
    *(double *)&v20[8] = height - top - bottom;
    v20[5] = &v25;
    v20[6] = &v21;
    v20[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](serverLabels, "enumerateObjectsUsingBlock:", v20);
    v12 = v22[3];
    -[SiriSharedUICompactServerUtteranceView _fontForUtteranceLabel](self, "_fontForUtteranceLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactServerUtteranceView _lineHeightForFont:](self, "_lineHeightForFont:", v13);
    v15 = vabdd_f64(v12, v14);

    if (v15 <= 1.0)
    {
      self->_isMultiLine = 0;
      v16 = v26;
      v10 = v26[3];
    }
    else
    {
      self->_isMultiLine = 1;
      v16 = v26;
      v26[3] = v10;
    }
    v16[3] = self->_contentInsets.left + self->_contentInsets.right + v10;
    v17 = self->_contentInsets.top + self->_contentInsets.bottom + v22[3];
    v22[3] = v17;
    if (v16[3] < width)
      width = v16[3];
    if (v17 < height)
      height = v17;
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    width = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v18 = width;
  v19 = height;
  result.height = v19;
  result.width = v18;
  return result;
}

double __55__SiriSharedUICompactServerUtteranceView_sizeThatFits___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  float v6;
  double v7;
  uint64_t v8;
  double v9;
  double result;
  uint64_t v11;
  double v12;

  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(double *)(v5 + 24);
  *(float *)&v7 = v7;
  *(double *)(v5 + 24) = fmaxf(v6, *(float *)&v7);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = v9 + *(double *)(v8 + 24);
  *(double *)(v8 + 24) = result;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_scaledSpacingBetweenLabels");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    result = v12 + *(double *)(v11 + 24);
    *(double *)(v11 + 24) = result;
  }
  return result;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UIEdgeInsets *p_contentInsets;
  double left;
  double top;
  double v10;
  double v11;
  double v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  char v38;
  UIView *labelsContainerView;
  double v40;
  double v41;
  double right;
  double v43;
  double bottom;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v52 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)SiriSharedUICompactServerUtteranceView;
  -[SiriSharedUICompactServerUtteranceView layoutSubviews](&v50, sel_layoutSubviews);
  -[SiriSharedUICompactServerUtteranceView bounds](self, "bounds");
  x = v53.origin.x;
  y = v53.origin.y;
  width = v53.size.width;
  height = v53.size.height;
  if (CGRectIsEmpty(v53))
    p_contentInsets = (UIEdgeInsets *)MEMORY[0x1E0DC49E8];
  else
    p_contentInsets = &self->_contentInsets;
  left = p_contentInsets->left;
  right = p_contentInsets->right;
  bottom = p_contentInsets->bottom;
  top = p_contentInsets->top;
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  v10 = left + CGRectGetMinX(v54);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  v11 = top + CGRectGetMinY(v55);
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  v12 = CGRectGetWidth(v56) - (right + left);
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  v40 = v11;
  v41 = v10;
  v45 = CGRectGetHeight(v57) - (bottom + top);
  -[UIView setFrame:](self->_labelsContainerView, "setFrame:", v10, v11, v12);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v13 = self->_serverLabels;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *MEMORY[0x1E0C9D538];
    v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v18 = *(_QWORD *)v47;
    v43 = v12;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v47 != v18)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v20, "sizeThatFits:", v12, v45);
        v22 = v21;
        objc_msgSend(v20, "setFrame:", v16, v17, v12, v21);
        -[SiriSharedUICompactServerUtteranceView _scaledSpacingBetweenLabels](self, "_scaledSpacingBetweenLabels");
        v24 = v23;
        -[NSMapTable objectForKey:](self->_emojiLabels, "objectForKey:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          -[UIView superview](self->_labelsContainerView, "superview");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "convertRect:fromView:", self->_labelsContainerView, v16, v17, v12, v22);
          v27 = v16;
          v29 = v28;
          v31 = v30;
          v33 = v32;
          v35 = v34;

          v36 = v29;
          v16 = v27;
          v12 = v43;
          objc_msgSend(v25, "setFrame:", v36, v31, v33, v35);
        }
        v17 = v17 + v22 + v24;

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v15);
  }

  -[SiriSharedUIDeviceMotionEffectView setFrame:](self->_deviceMotionEffectView, "setFrame:", v41, v40, v12, v45);
  -[UIView subviews](self->_labelsContainerView, "subviews");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v37, "count"))
  {

    goto LABEL_17;
  }
  v38 = AFDeviceSupportsSystemAssistantExperience();

  if ((v38 & 1) != 0)
  {
LABEL_17:
    labelsContainerView = 0;
    goto LABEL_18;
  }
  labelsContainerView = self->_labelsContainerView;
LABEL_18:
  -[SiriSharedUIDeviceMotionEffectView updateMaskingForView:](self->_deviceMotionEffectView, "updateMaskingForView:", labelsContainerView);
}

- (id)_createLabelForUtterance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[SiriSharedUICompactServerUtteranceView _createLabel](self, "_createLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactServerUtteranceView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parserSpeakableObjectProviderForServerUtterance:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DA7A58];
  objc_msgSend(v4, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parsedUtteranceFromText:context:spekableObjectProviding:", v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriSharedUICompactServerUtteranceView _setTextForLabel:text:](self, "_setTextForLabel:text:", v5, v11);
  objc_msgSend(v4, "dialogIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v12);

  objc_msgSend(v5, "setAssistantUtteranceView:", v4);
  return v5;
}

- (id)_createEmojiLabelForString:(id)a3 containingEmojisAtRanges:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SiriSharedUICompactServerUtteranceView _createLabel](self, "_createLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC1140];
  v30[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v10;
  v30[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(v8, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v6;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v6, v12);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v18);
        objc_msgSend(v8, "textColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "rangeValue");
        objc_msgSend(v13, "addAttribute:value:range:", v9, v20, v21, v22);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  objc_msgSend(v8, "setAttributedText:", v13);
  return v8;
}

- (id)_createLabel
{
  SiriSharedUICompactServerUtteranceLabel *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(SiriSharedUICompactServerUtteranceLabel);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactServerUtteranceLabel setTextColor:](v3, "setTextColor:", v4);

  -[SiriSharedUICompactServerUtteranceView _fontForUtteranceLabel](self, "_fontForUtteranceLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactServerUtteranceLabel setFont:](v3, "setFont:", v5);

  -[SiriSharedUICompactServerUtteranceLabel setNumberOfLines:](v3, "setNumberOfLines:", 0);
  SiriSharedUIRecursiveSetSemanticContentAttribute(v3, -[SiriSharedUICompactServerUtteranceView semanticContentAttribute](self, "semanticContentAttribute"));
  return v3;
}

- (double)_scaledSpacingBetweenLabels
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "sirisharedui_serverUtteranceFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactServerUtteranceView _lineHeightForFont:](self, "_lineHeightForFont:", v3);
  v5 = v4;

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SiriSharedUIDeviceMotionEffectView invalidate](self->_deviceMotionEffectView, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUICompactServerUtteranceView;
  -[SiriSharedUICompactServerUtteranceView dealloc](&v3, sel_dealloc);
}

- (id)_textForLabel:(id)a3
{
  return (id)objc_msgSend(a3, "text");
}

- (void)_setTextForLabel:(id)a3 text:(id)a4
{
  objc_msgSend(a3, "setText:", a4);
}

- (double)_lineHeightForFont:(id)a3
{
  double result;

  objc_msgSend(a3, "lineHeight");
  return result;
}

- (id)_fontForUtteranceLabel
{
  id v3;
  id v4;
  void *v5;

  v3 = (id)*MEMORY[0x1E0DC4A88];
  if (self->_isInAmbient && !self->_isInAmbientInteractivity)
  {
    v4 = (id)*MEMORY[0x1E0DC4AE8];

    v3 = v4;
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", v3, 1280);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SiriSharedUICompactServerUtteranceViewDelegate)delegate
{
  return (SiriSharedUICompactServerUtteranceViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (SiriSharedUIDeviceMotionEffectView)deviceMotionEffectView
{
  return self->_deviceMotionEffectView;
}

- (UIView)labelsContainerView
{
  return self->_labelsContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsContainerView, 0);
  objc_storeStrong((id *)&self->_deviceMotionEffectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_emojiLabels, 0);
  objc_storeStrong((id *)&self->_serverLabels, 0);
}

@end
