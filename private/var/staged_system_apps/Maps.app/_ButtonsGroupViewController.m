@implementation _ButtonsGroupViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_ButtonsGroupViewController)initWithFloatingButtonItems:(id)a3
{
  return -[_ButtonsGroupViewController initWithFloatingButtonItems:visualEffectDisabled:](self, "initWithFloatingButtonItems:visualEffectDisabled:", a3, 0);
}

- (_ButtonsGroupViewController)initWithFloatingButtonItems:(id)a3 visualEffectDisabled:(BOOL)a4
{
  id v6;
  _ButtonsGroupViewController *v7;
  UIStackView *v8;
  UIStackView *stackView;
  NSArray *v10;
  NSArray *floatingButtonItems;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_ButtonsGroupViewController;
  v7 = -[_ButtonsGroupViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  if (v7)
  {
    v8 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    stackView = v7->_stackView;
    v7->_stackView = v8;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v7->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7->_visualEffectDisabled = a4;
    v10 = (NSArray *)objc_msgSend(v6, "copy");
    floatingButtonItems = v7->_floatingButtonItems;
    v7->_floatingButtonItems = v10;

    -[_ButtonsGroupViewController refreshControls](v7, "refreshControls");
  }

  return v7;
}

- (void)loadView
{
  CardView *v3;
  CardView *cardview;
  CardView *v5;

  v3 = -[CardView initAllowingBlurredForButton:]([CardView alloc], "initAllowingBlurredForButton:", !self->_visualEffectDisabled);
  -[CardView setLayoutStyle:](v3, "setLayoutStyle:", 6);
  -[CardView setBlurGroupName:](v3, "setBlurGroupName:", self->_blurGroupName);
  cardview = self->_cardview;
  self->_cardview = v3;
  v5 = v3;

  -[_ButtonsGroupViewController setView:](self, "setView:", self->_cardview);
  -[_ButtonsGroupViewController applyBorderAndShadow](self, "applyBorderAndShadow");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[4];

  v32.receiver = self;
  v32.super_class = (Class)_ButtonsGroupViewController;
  -[_ButtonsGroupViewController viewDidLoad](&v32, "viewDidLoad");
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ButtonsGroupViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screen"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
    objc_msgSend(v7, "nativeScale");
    v9 = v8;

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v6, "nativeScale");
    v9 = v10;
  }

  v11 = 1.0;
  if (v9 > 0.0)
    v11 = 1.0 / v9;
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", v11);

  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  LODWORD(v12) = 1148829696;
  -[UIStackView setContentHuggingPriority:forAxis:](self->_stackView, "setContentHuggingPriority:forAxis:", 0, v12);
  LODWORD(v13) = 1148829696;
  -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_stackView, "setContentCompressionResistancePriority:forAxis:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CardView contentView](self->_cardview, "contentView"));
  objc_msgSend(v14, "addSubview:", self->_stackView);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_stackView, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[_ButtonsGroupViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v33[0] = v28;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_stackView, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[_ButtonsGroupViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v33[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_stackView, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_ButtonsGroupViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v33[2] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_stackView, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_ButtonsGroupViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  v33[3] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

}

- (void)applyBorderAndShadow
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ButtonsGroupViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v3, "userInterfaceStyle");

  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0799999982)));
  v4 = objc_msgSend(v15, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](self->_cardview, "layer"));
  objc_msgSend(v5, "setBorderColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](self->_cardview, "layer"));
  objc_msgSend(v6, "setCornerRadius:", 8.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](self->_cardview, "layer"));
  objc_msgSend(v7, "setBorderWidth:", 0.5);

  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0799999982)));
  v9 = objc_msgSend(v8, "CGColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](self->_cardview, "layer"));
  objc_msgSend(v10, "setShadowColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](self->_cardview, "layer"));
  LODWORD(v12) = *(_DWORD *)"\nף=";
  objc_msgSend(v11, "setShadowOpacity:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](self->_cardview, "layer"));
  objc_msgSend(v13, "setShadowOffset:", 0.0, -2.0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CardView layer](self->_cardview, "layer"));
  objc_msgSend(v14, "setShadowPathIsBounds:", 1);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_ButtonsGroupViewController;
  v4 = a3;
  -[MapsThemeViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ButtonsGroupViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[_ButtonsGroupViewController applyBorderAndShadow](self, "applyBorderAndShadow");
}

- (void)setBlurGroupName:(id)a3
{
  NSString *v4;
  NSString *blurGroupName;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  blurGroupName = self->_blurGroupName;
  self->_blurGroupName = v4;

  -[CardView setBlurGroupName:](self->_cardview, "setBlurGroupName:", v6);
}

- (BOOL)hasShownControls
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_floatingButtonItems;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "button", (_QWORD)v9));
        v7 = v6;
        if (v6 && (objc_msgSend(v6, "isHidden") & 1) == 0)
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }

      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)hasVisibleControls
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_floatingButtonItems;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "button", (_QWORD)v10));
        v7 = v6;
        if (v6)
        {
          objc_msgSend(v6, "alpha");
          if (v8 > 0.0)
          {

            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }

      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (void)hideNonVisibleControls:(int64_t)a3
{
  -[_ButtonsGroupViewController _enumerateButtonsWithControls:usingBlock:](self, "_enumerateButtonsWithControls:usingBlock:", a3, &stru_1011E98C8);
}

- (void)setVisibleControls:(int64_t)a3
{
  -[_ButtonsGroupViewController _enumerateButtonsWithControls:usingBlock:](self, "_enumerateButtonsWithControls:usingBlock:", a3, &stru_1011E98E8);
}

- (void)showVisibleControls:(int64_t)a3
{
  -[_ButtonsGroupViewController _enumerateButtonsWithControls:usingBlock:](self, "_enumerateButtonsWithControls:usingBlock:", a3, &stru_1011E9908);
}

- (void)_enumerateButtonsWithControls:(int64_t)a3 usingBlock:(id)a4
{
  void (**v5)(id, void *, void *, _BOOL8, _QWORD);
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  char *v15;
  BOOL v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  id v20;
  NSArray *obj;
  _ButtonsGroupViewController *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = (void (**)(id, void *, void *, _BOOL8, _QWORD))a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = self;
  obj = self->_floatingButtonItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "button"));
        if (v12)
        {
          v13 = (unint64_t)objc_msgSend(v11, "option");
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](v23->_stackView, "arrangedSubviews"));
          v15 = (char *)objc_msgSend(v14, "indexOfObject:", v12);

          if (v15)
            v16 = v15 == (char *)0x7FFFFFFFFFFFFFFFLL;
          else
            v16 = 1;
          if (v16)
          {
            v19 = 0;
          }
          else
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](v23->_stackView, "arrangedSubviews"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v15 - 1));

            if (!(v8 & 1 | (v19 == 0)))
              objc_msgSend(v19, "setAlpha:", 0.0);
          }
          v17 = (v13 & a3) != 0;
          v5[2](v5, v12, v19, v17, v8 & 1);
          v8 |= v17;

        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v7 = v20;
    }
    while (v20);
  }

}

- (void)refreshControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSArray *floatingButtonItems;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011E9928));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));
  v7 = objc_msgSend(v6, "mutableCopy");

  floatingButtonItems = self->_floatingButtonItems;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100C36ED0;
  v11[3] = &unk_1011E9950;
  v12 = v3;
  v13 = v7;
  v9 = v7;
  v10 = v3;
  -[NSArray enumerateObjectsUsingBlock:](floatingButtonItems, "enumerateObjectsUsingBlock:", v11);
  -[UIStackView _maps_setArrangedSubviews:](self->_stackView, "_maps_setArrangedSubviews:", v10);

}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (NSArray)floatingButtonItems
{
  return self->_floatingButtonItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingButtonItems, 0);
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_cardview, 0);
}

@end
