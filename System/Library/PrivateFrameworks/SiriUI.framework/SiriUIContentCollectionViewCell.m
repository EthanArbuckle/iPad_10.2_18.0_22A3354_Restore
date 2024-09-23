@implementation SiriUIContentCollectionViewCell

- (SiriUIContentCollectionViewCell)initWithFrame:(CGRect)a3
{
  SiriUIContentCollectionViewCell *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SiriUIKeyline *keyline;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  UIImageView *chevronView;
  double v16;
  void *v17;
  UIImageView *v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  NSMutableArray *subviewConstraints;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SiriUIContentCollectionViewCell;
  v3 = -[SiriUIClearBackgroundCell initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v5, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_highlightColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    -[SiriUIContentCollectionViewCell setSelectedBackgroundView:](v3, "setSelectedBackgroundView:", v5);
    v3->_keylineType = 1;
    +[SiriUIKeyline keylineWithKeylineType:](SiriUIKeyline, "keylineWithKeylineType:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
    keyline = v3->_keyline;
    v3->_keyline = (SiriUIKeyline *)v7;

    -[SiriUIKeyline setTranslatesAutoresizingMaskIntoConstraints:](v3->_keyline, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SiriUIContentCollectionViewCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_keyline);

    objc_msgSend(MEMORY[0x24BDF6AC8], "siriui_semiTransparentChevronImageAndAllowNaturalLayout:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend((id)objc_opt_class(), "chevronBlendEffectEnabled");
    v12 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v13 = v10;
    if (v11)
    {
      objc_msgSend(v10, "imageWithRenderingMode:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v12, "initWithImage:", v13);
    chevronView = v3->_chevronView;
    v3->_chevronView = (UIImageView *)v14;

    if (v11)
    -[UIImageView setSemanticContentAttribute:](v3->_chevronView, "setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute());
    LODWORD(v16) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_chevronView, "setContentHuggingPriority:forAxis:", 0, v16);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_chevronView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setHidden:](v3->_chevronView, "setHidden:", 1);
    -[SiriUIContentCollectionViewCell contentView](v3, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v3->_chevronView);

    if (v11)
    {
      v18 = v3->_chevronView;
      objc_msgSend(MEMORY[0x24BDF6950], "siriui_blendEffectColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v18, "setTintColor:", v19);

      -[UIImageView siriui_setBlendEffectEnabled:](v3->_chevronView, "siriui_setBlendEffectEnabled:", 1);
    }
    objc_msgSend((id)objc_opt_class(), "defaultInsets");
    v3->_textAndAccessoryInsets.top = v20;
    v3->_textAndAccessoryInsets.left = v21;
    v3->_textAndAccessoryInsets.bottom = v22;
    v3->_textAndAccessoryInsets.right = v23;
    v3->_verticalAlignment = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    subviewConstraints = v3->_subviewConstraints;
    v3->_subviewConstraints = (NSMutableArray *)v24;

  }
  return v3;
}

- (void)setKeylineType:(int64_t)a3
{
  if (self->_keylineType != a3)
  {
    self->_keylineType = a3;
    -[SiriUIKeyline setKeylineType:](self->_keyline, "setKeylineType:");
    -[SiriUIContentCollectionViewCell setNeedsUpdateSubviewConstraints](self, "setNeedsUpdateSubviewConstraints");
  }
}

- (void)setKeylineCustomBackgroundColor:(id)a3
{
  -[SiriUIKeyline setCustomBackgroundColor:](self->_keyline, "setCustomBackgroundColor:", a3);
}

- (UIColor)keylineCustomBackgroundColor
{
  return -[SiriUIKeyline customBackgroundColor](self->_keyline, "customBackgroundColor");
}

- (void)_updateSubviewConstraints
{
  NSMutableArray *subviewConstraints;
  void *v4;
  UIView *accessoryView;
  UILabel *v6;
  double horizontal;
  double v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  UILabel *textLabel;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SiriUIKeyline *keyline;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  UIImageView *v33;
  double v34;
  int *v35;
  int64_t verticalAlignment;
  NSMutableArray *v37;
  void *v38;
  void *v39;
  double top;
  double v41;
  void *v42;
  UIImageView *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  UILabel *v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_subviewConstraints, "count"))
  {
    -[SiriUIContentCollectionViewCell removeConstraints:](self, "removeConstraints:", self->_subviewConstraints);
    -[NSMutableArray removeAllObjects](self->_subviewConstraints, "removeAllObjects");
  }
  if (self->_textLabel && self->_accessoryView)
  {
    subviewConstraints = self->_subviewConstraints;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", 1.0, -15.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](subviewConstraints, "addObject:", v4);

  }
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    v6 = accessoryView;
  }
  else
  {
    v6 = self->_textLabel;
    if (!v6)
      goto LABEL_15;
  }
  horizontal = 0.0;
  if (v6 == (UILabel *)self->_accessoryView)
    horizontal = self->_accessoryOffset.horizontal;
  v8 = horizontal + self->_textAndAccessoryInsets.right;
  v9 = self->_subviewConstraints;
  v10 = (void *)MEMORY[0x24BDD1628];
  if (self->_hasChevron)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 6, 0, self->_chevronView, 5, 1.0, -v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v9, "addObject:", v11);
  }
  else
  {
    -[SiriUIContentCollectionViewCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 6, 0, v11, 6, 1.0, -v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v9, "addObject:", v12);

  }
LABEL_15:
  textLabel = self->_textLabel;
  if (textLabel)
  {
    v14 = self->_subviewConstraints;
    v15 = (void *)MEMORY[0x24BDD1628];
    -[SiriUIContentCollectionViewCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", textLabel, 5, 0, v16, 5, 1.0, self->_textAndAccessoryInsets.left + self->_textOffset.horizontal);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v14, "addObject:", v17);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (self->_chevronView)
    objc_msgSend(v18, "addObject:");
  if (self->_textLabel)
    objc_msgSend(v19, "addObject:");
  v50 = v6;
  if (self->_accessoryView)
    objc_msgSend(v19, "addObject:");
  keyline = self->_keyline;
  if (keyline)
  {
    v21 = self->_subviewConstraints;
    v22 = (void *)MEMORY[0x24BDD1628];
    -[SiriUIContentCollectionViewCell contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", keyline, 4, 0, v23, 4, 1.0, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v21, "addObject:", v24);

    v25 = self->_subviewConstraints;
    v26 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("_keyline"), self->_keyline, 0, v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[_keyline]|"), 0, 0, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v25, "addObjectsFromArray:", v28);

  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v19;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v53 != v31)
          objc_enumerationMutation(obj);
        v33 = *(UIImageView **)(*((_QWORD *)&v52 + 1) + 8 * i);
        if (v33 == (UIImageView *)self->_accessoryView)
        {
          v35 = &OBJC_IVAR___SiriUIContentCollectionViewCell__accessoryOffset;
        }
        else if (v33 == (UIImageView *)self->_textLabel)
        {
          v35 = &OBJC_IVAR___SiriUIContentCollectionViewCell__textOffset;
        }
        else
        {
          v34 = 0.0;
          if (v33 != self->_chevronView)
            goto LABEL_37;
          v35 = &OBJC_IVAR___SiriUIContentCollectionViewCell__chevronOffset;
        }
        v34 = *(double *)((char *)&self->super.super.super.super.super._responderFlags + *v35);
LABEL_37:
        verticalAlignment = self->_verticalAlignment;
        if (verticalAlignment)
        {
          if (verticalAlignment != 1)
            continue;
          v37 = self->_subviewConstraints;
          v38 = (void *)MEMORY[0x24BDD1628];
          -[SiriUIContentCollectionViewCell contentView](self, "contentView");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          top = v34 + self->_textAndAccessoryInsets.top;
          v41 = 1.0;
          v42 = v38;
          v43 = v33;
          v44 = 3;
          v45 = v39;
          v46 = 3;
        }
        else
        {
          v37 = self->_subviewConstraints;
          v47 = (void *)MEMORY[0x24BDD1628];
          -[SiriUIContentCollectionViewCell contentView](self, "contentView");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          top = self->_textAndAccessoryInsets.top;
          v41 = 1.0;
          v42 = v47;
          v43 = v33;
          v44 = 10;
          v45 = v39;
          v46 = 10;
        }
        objc_msgSend(v42, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, v44, 0, v45, v46, v41, top);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v37, "addObject:", v48);

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v30);
  }

  -[SiriUIContentCollectionViewCell contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addConstraints:", self->_subviewConstraints);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  UIImageView *chevronView;
  void *v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SiriUIContentCollectionViewCell;
  -[SiriUIContentCollectionViewCell updateConstraints](&v9, sel_updateConstraints);
  if (!self->_hasSetupStaticSubviewConstraints)
  {
    if (self->_chevronView)
    {
      -[SiriUIContentCollectionViewCell contentView](self, "contentView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x24BDD1628];
      chevronView = self->_chevronView;
      -[SiriUIContentCollectionViewCell contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "defaultInsets");
      objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", chevronView, 6, 0, v6, 6, 1.0, -v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addConstraint:", v8);

    }
    self->_hasSetupStaticSubviewConstraints = 1;
  }
  if (!self->_hasSetUpSubviewConstraints)
  {
    -[SiriUIContentCollectionViewCell _updateSubviewConstraints](self, "_updateSubviewConstraints");
    self->_hasSetUpSubviewConstraints = 1;
  }
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
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double Height;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[UIView recursive_setSemanticContentAttribute:](self, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute());
  v34.receiver = self;
  v34.super_class = (Class)SiriUIContentCollectionViewCell;
  -[SiriUIContentCollectionViewCell layoutSubviews](&v34, sel_layoutSubviews);
  -[SiriUIContentCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v30 = v5;
  v31 = v3;
  v6 = v5;
  v8 = v7;
  v32 = v7;
  v33 = v9;
  v10 = v9;
  v11 = *MEMORY[0x24BDBEFB0];
  v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[SiriUIKeyline sizeThatFits:](self->_keyline, "sizeThatFits:", v7, v9);
  v14 = v13;
  v16 = v15;
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  Height = CGRectGetHeight(v35);
  v36.origin.x = v11;
  v36.origin.y = v12;
  v36.size.width = v14;
  v36.size.height = v16;
  v18 = Height - CGRectGetHeight(v36);
  -[SiriUIContentCollectionViewCell bounds](self, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v37.origin.x = v11;
  v37.origin.y = v18;
  v37.size.width = v14;
  v37.size.height = v16;
  v27 = v22 - CGRectGetHeight(v37);
  v38.origin.x = v11;
  v38.origin.y = v18;
  v38.size.width = v14;
  v38.size.height = v16;
  v28 = v26 + CGRectGetHeight(v38);
  -[SiriUIContentCollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v20, v27, v24, v28);

  -[UIView setFrame:](self->_customView, "setFrame:", v31 + self->_customViewEdgeInsets.left, v30 + self->_customViewEdgeInsets.top, v32 - (self->_customViewEdgeInsets.left + self->_customViewEdgeInsets.right), v33 - (self->_customViewEdgeInsets.top + self->_customViewEdgeInsets.bottom));
}

- (void)setCustomView:(id)a3
{
  UIView *v5;
  UIView *customView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  customView = self->_customView;
  v8 = v5;
  if (customView != v5)
  {
    -[UIView removeFromSuperview](customView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customView, a3);
    -[SiriUIContentCollectionViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[SiriUIContentCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView **p_accessoryView;
  UIView *accessoryView;
  void *v8;
  UIView *v9;
  void *v10;
  double v11;
  void *v12;
  UIView *v13;
  void *v14;
  double v15;
  void *v16;
  UIView *v17;

  v5 = (UIView *)a3;
  p_accessoryView = &self->_accessoryView;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    v17 = v5;
    -[UIView removeFromSuperview](accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    if (*p_accessoryView)
    {
      -[SiriUIContentCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_accessoryView);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v9 = *p_accessoryView;
      v10 = (void *)MEMORY[0x24BDD1628];
      -[UIView frame](*p_accessoryView, "frame");
      objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 7, 0, 0, 0, 1.0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v9, "addConstraint:", v12);

      v13 = *p_accessoryView;
      v14 = (void *)MEMORY[0x24BDD1628];
      -[UIView frame](v13, "frame");
      objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 8, 0, 0, 0, 1.0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addConstraint:](v13, "addConstraint:", v16);

    }
    -[SiriUIContentCollectionViewCell setNeedsUpdateSubviewConstraints](self, "setNeedsUpdateSubviewConstraints");
    v5 = v17;
  }

}

- (void)setVerticalAlignment:(int64_t)a3
{
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    -[SiriUIContentCollectionViewCell setNeedsUpdateSubviewConstraints](self, "setNeedsUpdateSubviewConstraints");
  }
}

- (void)setTextLabel:(id)a3
{
  UILabel *v5;
  UILabel **p_textLabel;
  UILabel *textLabel;
  void *v8;
  UILabel *v9;

  v5 = (UILabel *)a3;
  p_textLabel = &self->_textLabel;
  textLabel = self->_textLabel;
  if (textLabel != v5)
  {
    v9 = v5;
    -[UILabel removeFromSuperview](textLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_textLabel, a3);
    if (*p_textLabel)
    {
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](*p_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SiriUIContentCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_textLabel);

    }
    -[SiriUIContentCollectionViewCell setNeedsUpdateSubviewConstraints](self, "setNeedsUpdateSubviewConstraints");
    v5 = v9;
  }

}

- (void)setTextOffset:(UIOffset)a3
{
  if (a3.horizontal != self->_textOffset.horizontal || a3.vertical != self->_textOffset.vertical)
  {
    self->_textOffset = a3;
    -[SiriUIContentCollectionViewCell setNeedsUpdateSubviewConstraints](self, "setNeedsUpdateSubviewConstraints");
  }
}

- (void)setAccessoryOffset:(UIOffset)a3
{
  if (a3.horizontal != self->_accessoryOffset.horizontal || a3.vertical != self->_accessoryOffset.vertical)
  {
    self->_accessoryOffset = a3;
    -[SiriUIContentCollectionViewCell setNeedsUpdateSubviewConstraints](self, "setNeedsUpdateSubviewConstraints");
  }
}

- (void)setHasChevron:(BOOL)a3
{
  if (self->_hasChevron != a3)
  {
    self->_hasChevron = a3;
    -[SiriUIContentCollectionViewCell setNeedsUpdateSubviewConstraints](self, "setNeedsUpdateSubviewConstraints");
    -[UIImageView setHidden:](self->_chevronView, "setHidden:", !self->_hasChevron);
  }
}

+ (UIEdgeInsets)defaultInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = ceil(16.0);
  if (v3 >= 2.0)
    v5 = 16.0;
  else
    v5 = v4;
  if (v3 >= 2.0)
    v6 = 16.0;
  else
    v6 = v4;

  v7 = 0.0;
  v8 = 0.0;
  v9 = v5;
  v10 = v6;
  result.right = v10;
  result.bottom = v8;
  result.left = v9;
  result.top = v7;
  return result;
}

+ (double)chevronTrailingMargin
{
  double v2;

  objc_msgSend(a1, "defaultInsets");
  return v2 + 16.0;
}

+ (BOOL)chevronBlendEffectEnabled
{
  return 0;
}

- (double)chevronTrailingMargin
{
  double result;

  if (!self->_hasChevron)
    return 0.0;
  objc_msgSend((id)objc_opt_class(), "chevronTrailingMargin");
  return result;
}

- (void)setNeedsUpdateSubviewConstraints
{
  self->_hasSetUpSubviewConstraints = 0;
  -[SiriUIContentCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

+ (id)reuseIdentifier
{
  objc_class *v2;
  void *v3;
  void *v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("ReuseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)prepareForReuse
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  UIOffset v7;
  UIView *accessoryView;
  UILabel *textLabel;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SiriUIKeyline *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)SiriUIContentCollectionViewCell;
  -[SiriUIContentCollectionViewCell prepareForReuse](&v21, sel_prepareForReuse);
  self->_verticalAlignment = 0;
  objc_msgSend((id)objc_opt_class(), "defaultInsets");
  self->_textAndAccessoryInsets.top = v3;
  self->_textAndAccessoryInsets.left = v4;
  self->_textAndAccessoryInsets.bottom = v5;
  self->_textAndAccessoryInsets.right = v6;
  v7 = (UIOffset)*MEMORY[0x24BDF7BF0];
  self->_textOffset = (UIOffset)*MEMORY[0x24BDF7BF0];
  self->_accessoryOffset = v7;
  -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;

  -[SiriUIContentCollectionViewCell removeConstraints:](self, "removeConstraints:", self->_subviewConstraints);
  -[SiriUIContentCollectionViewCell setNeedsUpdateSubviewConstraints](self, "setNeedsUpdateSubviewConstraints");
  -[UILabel removeFromSuperview](self->_textLabel, "removeFromSuperview");
  textLabel = self->_textLabel;
  self->_textLabel = 0;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SiriUIContentCollectionViewCell contentView](self, "contentView", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(SiriUIKeyline **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if (v16 != self->_keyline && v16 != (SiriUIKeyline *)self->_chevronView)
          -[SiriUIKeyline removeFromSuperview](v16, "removeFromSuperview");
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v13);
  }

}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (UIEdgeInsets)textAndAccessoryInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textAndAccessoryInsets.top;
  left = self->_textAndAccessoryInsets.left;
  bottom = self->_textAndAccessoryInsets.bottom;
  right = self->_textAndAccessoryInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextAndAccessoryInsets:(UIEdgeInsets)a3
{
  self->_textAndAccessoryInsets = a3;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UIView)customView
{
  return self->_customView;
}

- (UIEdgeInsets)customViewEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_customViewEdgeInsets.top;
  left = self->_customViewEdgeInsets.left;
  bottom = self->_customViewEdgeInsets.bottom;
  right = self->_customViewEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCustomViewEdgeInsets:(UIEdgeInsets)a3
{
  self->_customViewEdgeInsets = a3;
}

- (UIOffset)textOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_textOffset.horizontal;
  vertical = self->_textOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (UIOffset)accessoryOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_accessoryOffset.horizontal;
  vertical = self->_accessoryOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (UIOffset)chevronOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_chevronOffset.horizontal;
  vertical = self->_chevronOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setChevronOffset:(UIOffset)a3
{
  self->_chevronOffset = a3;
}

- (SiriUIKeyline)keyline
{
  return self->_keyline;
}

- (int64_t)keylineType
{
  return self->_keylineType;
}

- (BOOL)hasChevron
{
  return self->_hasChevron;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_subviewConstraints, 0);
  objc_storeStrong((id *)&self->rightChevronWidthConstraint, 0);
  objc_storeStrong((id *)&self->leftChevronWidthConstraint, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_keyline, 0);
}

@end
