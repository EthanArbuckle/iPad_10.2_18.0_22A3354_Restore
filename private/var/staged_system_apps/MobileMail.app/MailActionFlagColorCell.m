@implementation MailActionFlagColorCell

+ (id)reusableIdentifier
{
  return CFSTR("MailActionFlagColorCellIdentifier");
}

- (MailActionFlagColorCell)initWithFrame:(CGRect)a3
{
  MailActionFlagColorCell *v3;
  MailActionFlagColorCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailActionFlagColorCell;
  v3 = -[MailActionVerticalGroupedCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MailActionFlagColorCell _setupViews](v3, "_setupViews");
  return v4;
}

- (NSArray)buttons
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell buttonPairs](self, "buttonPairs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ef_map:", &stru_10051D1C8));

  return (NSArray *)v3;
}

- (void)_setupViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell _flagColorButtons](self, "_flagColorButtons"));
  -[MailActionFlagColorCell setButtonPairs:](self, "setButtonPairs:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIStackView mf_equalSpacingHorizontalStackView](UIStackView, "mf_equalSpacingHorizontalStackView"));
  objc_msgSend(v5, "setAlignment:", 3);
  objc_msgSend(v3, "addSubview:", v5);
  if (+[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 10))
  {
    v6 = objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", self);
    objc_msgSend(v5, "addInteraction:", v6);

  }
  -[MailActionFlagColorCell setStackView:](self, "setStackView:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell buttons](self, "buttons"));
  v32 = objc_msgSend(v7, "mutableCopy");

  v8 = objc_opt_new(NSMutableArray);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell imageView](self, "imageView"));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v32;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v32);
        objc_msgSend(v5, "addArrangedSubview:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "widthAnchor"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", 28.0));
        -[NSMutableArray addObject:](v8, "addObject:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "widthAnchor"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "heightAnchor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
        -[NSMutableArray addObject:](v8, "addObject:", v18);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v10);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutMarginsGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  objc_msgSend(v3, "layoutMargins");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, v23));
  -[NSMutableArray addObject:](v8, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerXAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerXAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  -[NSMutableArray addObject:](v8, "addObject:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerYAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
  -[NSMutableArray addObject:](v8, "addObject:", v31);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);
}

- (id)_flagColorButtons
{
  id v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[5];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A9290;
  v7[3] = &unk_10051D1F0;
  v7[4] = self;
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 8));
  v8 = v2;
  v3 = objc_retainBlock(v7);
  v4 = MFImageGlyphFlagColor;
  ((void (*)(_QWORD *, _QWORD, uint64_t))v3[2])(v3, MFImageGlyphFlagColor, 1);
  ((void (*)(_QWORD *, uint64_t, _QWORD))v3[2])(v3, v4, 0);
  ((void (*)(_QWORD *, uint64_t, uint64_t))v3[2])(v3, v4, 5);
  ((void (*)(_QWORD *, uint64_t, uint64_t))v3[2])(v3, v4, 4);
  ((void (*)(_QWORD *, uint64_t, uint64_t))v3[2])(v3, v4, 2);
  ((void (*)(_QWORD *, uint64_t, uint64_t))v3[2])(v3, v4, 3);
  ((void (*)(_QWORD *, uint64_t, uint64_t))v3[2])(v3, v4, 6);
  v5 = v2;

  return v5;
}

- (void)_buttonTapped:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  size_t v11;
  _DWORD __b[162];
  int v13[2];
  int v14;
  pid_t v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell buttons](self, "buttons"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(_QWORD *)v13 = 0xE00000001;
    v14 = 1;
    v15 = getpid();
    v11 = 648;
    if (!sysctl(v13, 4u, __b, &v11, 0, 0) && (__b[8] & 0x800) != 0)
    {
      __debugbreak();
      JUMPOUT(0x1000A9460);
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell delegate](self, "delegate"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell buttonPairs](self, "buttonPairs"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v6));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "first"));

      objc_msgSend(v7, "mailActionFlagColorCell:didTapOnFlagColor:", self, v10);
    }

  }
}

- (void)selectColor:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell buttonPairs](self, "buttonPairs", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        if (v5)
        {
          v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "first"));
          v11 = objc_msgSend(v3, "isEqualToNumber:", v5);
        }
        else
        {
          v11 = 0;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "second"));
        objc_msgSend(v12, "setSelected:", v11);

        if (v5)
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (id)titleLabel
{
  return 0;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell pointerRegions](self, "pointerRegions"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A97E0;
  v11[3] = &unk_10051D218;
  v8 = v6;
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_firstObjectPassingTest:", v11));

  return v9;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell pointerRegions](self, "pointerRegions"));
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell _arrangedSubviewsRespectingLayoutDirection](self, "_arrangedSubviewsRespectingLayoutDirection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell targetedPreviewForView:](self, "targetedPreviewForView:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerLiftEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v11, 0));

  return v12;
}

- (id)targetedPreviewForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "targetedPreviewContainer"));

  if (v6)
  {
    UIRectGetCenter(objc_msgSend(v4, "bounds"));
    objc_msgSend(v4, "convertPoint:toView:", v6);
    v9 = objc_msgSend(objc_alloc((Class)UIPreviewTarget), "initWithContainer:center:", v6, v7, v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_alloc_init((Class)UIPreviewParameters);
  if (v9)
    v11 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:parameters:target:", v4, v10, v9);
  else
    v11 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:parameters:", v4, v10);
  v12 = v11;

  return v12;
}

- (NSArray)pointerRegions
{
  NSArray *pointerRegions;
  void *v4;
  double Width;
  void *v6;
  double Height;
  void *v8;
  id v9;
  uint64_t v10;
  double v11;
  void *i;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  uint64_t v18;
  double MaxX;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  double v25;
  double v26;
  void *v27;
  CGFloat v28;
  void *v29;
  NSArray *v30;
  NSArray *v31;
  void *v33;
  void *v34;
  MailActionFlagColorCell *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  pointerRegions = self->_pointerRegions;
  if (!pointerRegions)
  {
    v35 = self;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell stackView](self, "stackView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell _arrangedSubviewsRespectingLayoutDirection](v35, "_arrangedSubviewsRespectingLayoutDirection"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell stackView](v35, "stackView"));
    objc_msgSend(v4, "frame");
    Width = CGRectGetWidth(v46);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell stackView](v35, "stackView"));
    objc_msgSend(v6, "frame");
    Height = CGRectGetHeight(v47);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "arrangedSubviews"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v41;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i), "frame");
          v11 = v11 + CGRectGetWidth(v48);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
    }

    v13 = objc_msgSend(v34, "count");
    v14 = objc_alloc_init((Class)NSMutableArray);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v15 = v34;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v16)
    {
      v17 = (Width - v11) / (double)((unint64_t)v13 - 1);
      v18 = *(_QWORD *)v37;
      MaxX = 0.0;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
          if (v21 == v22)
          {

LABEL_20:
            v25 = v17 * 0.5;
            goto LABEL_21;
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
          v24 = v21 == v23;

          v25 = v17;
          if (v24)
            goto LABEL_20;
LABEL_21:
          objc_msgSend(v21, "frame");
          v26 = CGRectGetWidth(v49);
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FlagColor-%lu"), objc_msgSend(v14, "count")));
          v28 = v25 + v26;
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v27, MaxX, 0.0, v28, Height));
          objc_msgSend(v14, "addObject:", v29);
          v50.origin.y = 0.0;
          v50.origin.x = MaxX;
          v50.size.width = v28;
          v50.size.height = Height;
          MaxX = CGRectGetMaxX(v50);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v16);
    }

    v30 = (NSArray *)objc_msgSend(v14, "copy");
    v31 = v35->_pointerRegions;
    v35->_pointerRegions = v30;

    pointerRegions = v35->_pointerRegions;
  }
  return pointerRegions;
}

- (id)_arrangedSubviewsRespectingLayoutDirection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell stackView](self, "stackView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrangedSubviews"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionFlagColorCell traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "layoutDirection");

  if (v6 == (id)1)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_reverse"));

    v4 = (void *)v7;
  }
  return v4;
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MailActionFlagColorCell;
  -[MailActionFlagColorCell updateConstraints](&v3, "updateConstraints");
  -[MailActionFlagColorCell setPointerRegions:](self, "setPointerRegions:", 0);
}

- (MailActionFlagColorCellDelegate)delegate
{
  return (MailActionFlagColorCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)buttonPairs
{
  return self->_buttonPairs;
}

- (void)setButtonPairs:(id)a3
{
  objc_storeStrong((id *)&self->_buttonPairs, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void)setPointerRegions:(id)a3
{
  objc_storeStrong((id *)&self->_pointerRegions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerRegions, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_buttonPairs, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
