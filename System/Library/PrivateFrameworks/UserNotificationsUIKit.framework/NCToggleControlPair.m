@implementation NCToggleControlPair

- (NCToggleControlPair)initWithLeadingToggleControl:(id)a3 trailingToggleControl:(id)a4
{
  id v6;
  id v7;
  NCToggleControlPair *v8;
  uint64_t v9;
  NSArray *toggleControls;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NCToggleControlPair;
  v8 = -[NCToggleControlPair init](&v12, sel_init);
  if (v8)
  {
    v13[0] = v6;
    v13[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v9 = objc_claimAutoreleasedReturnValue();
    toggleControls = v8->_toggleControls;
    v8->_toggleControls = (NSArray *)v9;

    objc_msgSend(v7, "setExpanded:", objc_msgSend(v6, "isExpanded") ^ 1);
    -[NCToggleControlPair addSubview:](v8, "addSubview:", v6);
    -[NCToggleControlPair addSubview:](v8, "addSubview:", v7);
    objc_msgSend(v6, "_setManagingPair:", v8);
    objc_msgSend(v7, "_setManagingPair:", v8);
  }

  return v8;
}

- (void)setLeadingControlExpanded:(BOOL)a3 animated:(BOOL)a4
{
  int v4;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v4 = a3;
  -[NCToggleControlPair _leadingToggleControl](self, "_leadingToggleControl", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCToggleControlPair _trailingToggleControl](self, "_trailingToggleControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isExpanded") != v4)
  {
    v8 = (void *)objc_opt_class();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__NCToggleControlPair_setLeadingControlExpanded_animated___block_invoke;
    v9[3] = &unk_1E8D1E360;
    v10 = v6;
    v12 = v4;
    v11 = v7;
    objc_msgSend(v8, "performWithDefaultExpansionAnimation:completion:", v9, 0);

  }
}

uint64_t __58__NCToggleControlPair_setLeadingControlExpanded_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setExpanded:", *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "setExpanded:", *(_BYTE *)(a1 + 48) == 0);
}

- (void)setClearAllText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NCToggleControlPair _leadingToggleControl](self, "_leadingToggleControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClearAllText:", v4);

  -[NCToggleControlPair _trailingToggleControl](self, "_trailingToggleControl");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClearAllText:", v4);

}

- (NSString)clearAllText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[NCToggleControlPair _leadingToggleControl](self, "_leadingToggleControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearAllText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[NCToggleControlPair _trailingToggleControl](self, "_trailingToggleControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearAllText");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  CGSize result;

  -[NCToggleControlPair _leadingToggleControl](self, "_leadingToggleControl", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NCToggleControlPair _leadingToggleControl](self, "_leadingToggleControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_cachedEffectiveMaxUnexpandedSize");

  }
  else
  {
    +[NCToggleControl effectiveHeight:](NCToggleControl, "effectiveHeight:", -[NCToggleControlPair adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
  }

  -[NCToggleControlPair _trailingToggleControl](self, "_trailingToggleControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NCToggleControlPair _trailingToggleControl](self, "_trailingToggleControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_cachedEffectiveMaxExpandedSize");

  }
  else
  {
    _MaxToggleControlSize(1, -[NCToggleControlPair adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
  }

  -[NCToggleControlPair _effectiveInterControlPadding](self, "_effectiveInterControlPadding");
  _NCMainScreenScale();
  UISizeRoundToScale();
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double Width;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v35.receiver = self;
  v35.super_class = (Class)NCToggleControlPair;
  -[NCToggleControlPair layoutSubviews](&v35, sel_layoutSubviews);
  -[NCToggleControlPair bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[NCToggleControlPair _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[NCToggleControlPair _leadingToggleControl](self, "_leadingToggleControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_effectiveExpandedSize");
  BSRectWithSize();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v32 = v4;
  if (v11)
  {
    v36.origin.x = v4;
    v36.origin.y = v6;
    v36.size.width = v8;
    v36.size.height = v10;
    Width = CGRectGetWidth(v36);
    v37.origin.x = v14;
    v37.origin.y = v16;
    v37.size.width = v18;
    v37.size.height = v20;
    v14 = Width - CGRectGetWidth(v37);
  }
  objc_msgSend(v12, "setFrame:", v14, v16, v18, v20, *(_QWORD *)&v32, *(_QWORD *)&v6);
  -[NCToggleControlPair _trailingToggleControl](self, "_trailingToggleControl");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_effectiveExpandedSize");
  BSRectWithSize();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  if ((v11 & 1) == 0)
  {
    v38.origin.x = v33;
    v38.origin.y = v34;
    v38.size.width = v8;
    v38.size.height = v10;
    v31 = CGRectGetWidth(v38);
    v39.origin.x = v24;
    v39.origin.y = v26;
    v39.size.width = v28;
    v39.size.height = v30;
    v24 = v31 - CGRectGetWidth(v39);
  }
  objc_msgSend(v22, "setFrame:", v24, v26, v28, v30);

}

- (BOOL)adjustsFontForContentSizeCategory
{
  void *v3;
  void *v4;
  char v5;

  -[NCToggleControlPair _leadingToggleControl](self, "_leadingToggleControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "adjustsFontForContentSizeCategory"))
  {
    -[NCToggleControlPair _trailingToggleControl](self, "_trailingToggleControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "adjustsFontForContentSizeCategory");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v5 = -[NCToggleControlPair adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_toggleControls;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setAdjustsFontForContentSizeCategory:", v3, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (v5 != -[NCToggleControlPair adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
    -[NCToggleControlPair adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
}

- (BOOL)adjustForContentSizeCategoryChange
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_toggleControls;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "adjustForContentSizeCategoryChange", (_QWORD)v10);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);

    if ((v6 & 1) != 0)
    {
      -[NCToggleControlPair setNeedsLayout](self, "setNeedsLayout");
      return 1;
    }
  }
  else
  {

  }
  return 0;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v4;
  NSString *v5;
  NSString *materialGroupNameBase;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString isEqualToString:](self->_materialGroupNameBase, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    materialGroupNameBase = self->_materialGroupNameBase;
    self->_materialGroupNameBase = v5;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_toggleControls;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setMaterialGroupNameBase:", self->_materialGroupNameBase, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (id)_leadingToggleControl
{
  return -[NSArray firstObject](self->_toggleControls, "firstObject");
}

- (id)_trailingToggleControl
{
  return -[NSArray lastObject](self->_toggleControls, "lastObject");
}

- (double)_effectiveValueForMinValue:(double)a3 withFont:(id)a4
{
  double result;

  objc_msgSend(a4, "_scaledValueForValue:");
  if (result <= a3)
    return a3;
  return result;
}

- (double)_effectiveInterControlPadding
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAX;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v4);

  if (IsAX)
    v6 = 3.0;
  else
    v6 = 8.0;
  -[NCToggleControlPair _leadingToggleControl](self, "_leadingToggleControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_labelFont:", -[NCToggleControlPair adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCToggleControlPair _effectiveValueForMinValue:withFont:](self, "_effectiveValueForMinValue:withFont:", v8, v6);
  v10 = v9;

  return v10;
}

- (void)_handleTouchUpInside:(id)a3 withEvent:(id)a4
{
  id v5;
  _BOOL8 v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "_wasExpandedPriorToControlEvent") & 1) == 0)
  {
    -[NCToggleControlPair _leadingToggleControl](self, "_leadingToggleControl");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5 == v7;

    -[NCToggleControlPair setLeadingControlExpanded:animated:](self, "setLeadingControlExpanded:animated:", v6, 1);
  }

}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (NSArray)toggleControls
{
  return self->_toggleControls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleControls, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
}

@end
