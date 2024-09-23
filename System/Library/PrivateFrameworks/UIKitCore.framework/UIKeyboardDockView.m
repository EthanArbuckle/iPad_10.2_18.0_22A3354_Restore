@implementation UIKeyboardDockView

- (CGSize)intrinsicContentSize
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGSize result;

  v2 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  v3 = -1.0;
  if (!v2)
    v3 = 75.0;
  v4 = 150.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  __int128 v76;
  double v77;
  double v78;
  __int128 v79;
  double v80;
  double v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;

  v84.receiver = self;
  v84.super_class = (Class)UIKeyboardDockView;
  -[UIView layoutSubviews](&v84, sel_layoutSubviews);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForPreferenceKey:", CFSTR("KeyboardDockItemHitAreaReductionPercent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 1.0;
  if (_os_feature_enabled_impl())
  {
    if (v4)
    {
      objc_msgSend(v4, "doubleValue");
      v5 = v6 / 100.0;
    }
    else
    {
      v5 = 0.9;
    }
  }
  -[UIView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v82 = 0u;
  v83 = 0u;
  v76 = 0u;
  v79 = 0u;
  v11 = (void *)objc_opt_class();
  if (v11)
  {
    objc_msgSend(v11, "_itemFramesForBoundingSize:", v8, v10);
  }
  else
  {
    v82 = 0u;
    v83 = 0u;
    v76 = 0u;
    v79 = 0u;
  }
  -[UIKeyboardDockView leftDockItem](self, "leftDockItem", v76, v79);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIKeyboardDockView leftDockItem](self, "leftDockItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "button");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentMode:", 4);

    v15 = _UIKBGetDockItemTouchPaddingForCurrentDevice();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[UIKeyboardDockView leftDockItem](self, "leftDockItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "button");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setImageEdgeInsets:", v15, v17, v19, v21);

    -[UIKeyboardDockView leftDockItem](self, "leftDockItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "image");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "baselineOffsetFromBottom");
    v27 = v78 + v26;

    -[UIKeyboardDockView leftDockItem](self, "leftDockItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "button");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", v77, v27, v80, v81);

    -[UIKeyboardDockView leftDockItem](self, "leftDockItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "button");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTapActionRegion:", v80 - v5 * (v80 + -12.49376), 0.0, v5 * (v80 + -12.49376), v81 + -6.11907);

  }
  -[UIKeyboardDockView rightDockItem](self, "rightDockItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[UIKeyboardDockView rightDockItem](self, "rightDockItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "button");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setContentMode:", 4);

    v35 = _UIKBGetDockItemTouchPaddingForCurrentDevice();
    v37 = v36;
    v39 = v38;
    v41 = v40;
    -[UIKeyboardDockView rightDockItem](self, "rightDockItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "button");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setImageEdgeInsets:", v35, v37, v39, v41);

    v44 = *(double *)&v82;
    -[UIKeyboardDockView rightDockItem](self, "rightDockItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "image");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "baselineOffsetFromBottom");
    v48 = *((double *)&v82 + 1) + v47;

    -[UIKeyboardDockView rightDockItem](self, "rightDockItem");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "identifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("keyboardkeyboard"));

    if (v51)
      v44 = *(double *)&v82 + -5.0;
    -[UIKeyboardDockView rightDockItem](self, "rightDockItem");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "button");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setFrame:", v44, v48, v83);

    -[UIKeyboardDockView rightDockItem](self, "rightDockItem");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "button");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setTapActionRegion:", 0.0, 0.0, v5 * (*(double *)&v83 + -12.49376), *((double *)&v83 + 1) + -6.11907);

  }
  -[UIKeyboardDockView centerDockItem](self, "centerDockItem");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[UIKeyboardDockView centerDockItem](self, "centerDockItem");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "button");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setContentMode:", 4);

    v59 = _UIKBGetDockItemTouchPaddingForCurrentDevice();
    v61 = v60;
    v63 = v62;
    v65 = v64;
    -[UIKeyboardDockView centerDockItem](self, "centerDockItem");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "button");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setImageEdgeInsets:", v59, v61, v63, v65);

    -[UIKeyboardDockView centerDockItem](self, "centerDockItem");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "image");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "baselineOffsetFromBottom");
    v71 = *((double *)&v82 + 1) + v70;

    -[UIKeyboardDockView centerDockItem](self, "centerDockItem");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "button");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setFrame:", floor((v8 - *(double *)&v83) * 0.5), v71, v83);

    -[UIKeyboardDockView centerDockItem](self, "centerDockItem");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "button");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setTapActionRegion:", 0.0, 0.0, *(double *)&v83 + -12.49376, *((double *)&v83 + 1) + -6.11907);

  }
}

- (UIKeyboardDockItem)rightDockItem
{
  return self->_rightDockItem;
}

- (UIKeyboardDockItem)leftDockItem
{
  return self->_leftDockItem;
}

- (UIKeyboardDockItem)centerDockItem
{
  return self->_centerDockItem;
}

+ ($35570C6CB20FD1065279CABE7A6FABE9)_itemFramesForBoundingSize:(SEL)a3
{
  double width;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  $35570C6CB20FD1065279CABE7A6FABE9 *result;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double height;
  double v44;

  height = a4.height;
  width = a4.width;
  if ((unint64_t)(objc_msgSend(a2, "_currentInterfaceOrientation") - 3) >= 2)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferencesActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "handBias");

    v7 = 33.0;
  }
  else
  {
    v6 = 0;
    v7 = 30.0;
  }
  v42 = v7;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_nativePointsPerMillimeter");
  v12 = v11;

  v44 = width;
  v13 = width + -320.0;
  v14 = v12 * 7.04351612;
  v15 = v12 * 7.04351612;
  if (v6 == 1)
  {
    UIRoundToScale(v13, 0.0);
    v15 = v16 + 22.0;
  }
  v41 = v15;
  v17 = MillimeterSizeToPointSize();
  v19 = v18;
  v20 = _UIKBGetDockItemTouchPaddingForCurrentDevice();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  if (v6 == 2)
  {
    UIRoundToScale(v13, 0.0);
    v14 = v27 + 22.0;
  }
  v40 = v20 + height - v19 - v42;
  v28 = v17 - (v22 + v26);
  v29 = v19 - (v20 + v24);
  v30 = MillimeterSizeToPointSize();
  v32 = v31;
  v33 = height - v31 - v42;
  v35 = _UIKBGetDockItemTouchPaddingForCurrentDevice();
  v38 = v30 - (v36 + v37);
  retstr->var0.origin.x = v41 - v28 * 0.5;
  retstr->var0.origin.y = v40;
  retstr->var0.size.width = v28;
  retstr->var0.size.height = v29;
  retstr->var1.origin.x = v44 - v38 * 0.5 - v14;
  retstr->var1.origin.y = v35 + v33;
  retstr->var1.size.width = v38;
  retstr->var1.size.height = v32 - (v35 + v39);
  return result;
}

+ (int64_t)_currentInterfaceOrientation
{
  void *v2;
  void *v3;
  uint64_t v4;
  int64_t v5;

  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "interfaceOrientation");
  else
    v4 = objc_msgSend((id)UIApp, "activeInterfaceOrientation");
  v5 = v4;

  return v5;
}

- (void)setRightDockItem:(id)a3
{
  UIKeyboardDockItem **p_rightDockItem;
  void *v6;
  id v7;

  p_rightDockItem = &self->_rightDockItem;
  v7 = a3;
  if (!-[UIKeyboardDockItem isEqual:](*p_rightDockItem, "isEqual:"))
  {
    -[UIKeyboardDockItem button](*p_rightDockItem, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    objc_storeStrong((id *)&self->_rightDockItem, a3);
    -[UIKeyboardDockView _configureDockItem:](self, "_configureDockItem:", v7);
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIKeyboardDockView)initWithFrame:(CGRect)a3
{
  UIKeyboardDockView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardDockView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__didReceiveHandBiasChangeNotification_, CFSTR("UIKeyboardHandBiasDidChangeNotification"), 0);

  }
  return v3;
}

- (void)setLeftDockItem:(id)a3
{
  UIKeyboardDockItem **p_leftDockItem;
  void *v6;
  id v7;

  p_leftDockItem = &self->_leftDockItem;
  v7 = a3;
  if (!-[UIKeyboardDockItem isEqual:](*p_leftDockItem, "isEqual:"))
  {
    -[UIKeyboardDockItem button](*p_leftDockItem, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    objc_storeStrong((id *)&self->_leftDockItem, a3);
    -[UIKeyboardDockView _configureDockItem:](self, "_configureDockItem:", v7);
  }

}

- (void)setCenterDockItem:(id)a3
{
  UIKeyboardDockItem **p_centerDockItem;
  void *v6;
  id v7;

  p_centerDockItem = &self->_centerDockItem;
  v7 = a3;
  if (!-[UIKeyboardDockItem isEqual:](*p_centerDockItem, "isEqual:"))
  {
    -[UIKeyboardDockItem button](*p_centerDockItem, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    objc_storeStrong((id *)&self->_centerDockItem, a3);
    -[UIKeyboardDockView _configureDockItem:](self, "_configureDockItem:", v7);
  }

}

- (void)_configureDockItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__dockItemButtonWasTapped_withEvent_, 0xFFFFFFFFLL);

  objc_msgSend(v4, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView addSubview:](self, "addSubview:", v6);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardHandBiasDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardDockView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerDockItem, 0);
  objc_storeStrong((id *)&self->_rightDockItem, 0);
  objc_storeStrong((id *)&self->_leftDockItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)dockViewHomeGestureExclusionZones
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  objc_msgSend(a1, "_itemFramesForBoundingSize:", v5, v7);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", (unsigned __int128)0, (unsigned __int128)0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", (unsigned __int128)0, (unsigned __int128)0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_dockItemButtonWasTapped:(id)a3 withEvent:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[UIKeyboardDockView _dockItemWithButton:](self, "_dockItemWithButton:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UIKeyboardDockView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIKeyboardDockView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "keyboardDockView:didPressDockItem:withEvent:", self, v6, v9);

    }
  }

}

- (id)_dockItemWithButton:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  -[UIKeyboardDockView leftDockItem](self, "leftDockItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "button");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[UIKeyboardDockView leftDockItem](self, "leftDockItem");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11 = (void *)v12;
    goto LABEL_9;
  }
  -[UIKeyboardDockView rightDockItem](self, "rightDockItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "button");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    -[UIKeyboardDockView rightDockItem](self, "rightDockItem");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[UIKeyboardDockView centerDockItem](self, "centerDockItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "button");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v4)
  {
    -[UIKeyboardDockView centerDockItem](self, "centerDockItem");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (id)_keyboardLayoutView
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isDescendantOfView:", v3);

  if (v4)
  {
    objc_msgSend(v2, "_layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_keyboardLongPressInteractionRegions
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double MaxX;
  double MinX;
  void *v13;
  void *v14;
  __int128 v16;
  CGRect v17;
  __int128 v18;
  CGRect v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  memset(&v19, 0, sizeof(v19));
  v16 = 0u;
  v18 = 0u;
  v7 = (void *)objc_opt_class();
  if (v7)
  {
    objc_msgSend(v7, "_itemFramesForBoundingSize:", v4, v6);
  }
  else
  {
    memset(&v19, 0, sizeof(v19));
    v16 = 0u;
    v18 = 0u;
  }
  -[UIView _rootInputWindowController](self, "_rootInputWindowController", v16, v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_inputViewPadding");
  v10 = v9;

  MaxX = CGRectGetMaxX(v17);
  MinX = CGRectGetMinX(v19);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", MaxX, 0.0, MinX - CGRectGetMaxX(v17), v6 + v10 * 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (UIKeyboardDockViewDelegate)delegate
{
  return (UIKeyboardDockViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end
