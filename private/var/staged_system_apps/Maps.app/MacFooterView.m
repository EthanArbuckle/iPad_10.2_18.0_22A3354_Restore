@implementation MacFooterView

- (MacFooterView)initWithRightButtonType:(int64_t)a3
{
  return -[MacFooterView initWithRightButtonType:hasBlur:](self, "initWithRightButtonType:hasBlur:", a3, 1);
}

- (MacFooterView)initWithNoBlurRightSideButtonsOfType:(int64_t)a3
{
  return -[MacFooterView initWithRightButtonType:hasBlur:](self, "initWithRightButtonType:hasBlur:", a3, 0);
}

- (MacFooterView)initWithRightButtonType:(int64_t)a3 hasBlur:(BOOL)a4
{
  _BOOL4 v4;
  char v5;
  double y;
  double width;
  double height;
  MacFooterView *result;
  MacFooterView *v10;
  MacFooterView *v11;
  void *v12;
  MacFooterView *v13;
  UIView *v14;
  UIView *accessoryView;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char **v27;
  id v28;
  id v29;
  id v30;
  UIView *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  id v48;
  void *v49;
  void *v50;
  NSArray *v51;
  NSArray *actionButtons;
  void *v53;
  void *v54;
  MacFooterView *v55;
  MacFooterView *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  void *v63;
  _QWORD v64[3];
  _BYTE v65[128];

  v4 = a4;
  v5 = a3;
  v62.receiver = self;
  v62.super_class = (Class)MacFooterView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result = -[MacFooterView initWithFrame:](&v62, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (!result)
    return result;
  v56 = result;
  v10 = result;
  v11 = v10;
  if (v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
    -[MacFooterView addSubview:](v11, "addSubview:", v12);
    v57 = v12;
    v13 = (MacFooterView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentView"));

  }
  else
  {
    v57 = 0;
    v13 = v10;
  }
  v14 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  accessoryView = v11->_accessoryView;
  v11->_accessoryView = v14;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11->_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v16) = 1132068864;
  -[UIView setContentHuggingPriority:forAxis:](v11->_accessoryView, "setContentHuggingPriority:forAxis:", 0, v16);
  LODWORD(v17) = 1132068864;
  -[UIView setContentCompressionResistancePriority:forAxis:](v11->_accessoryView, "setContentCompressionResistancePriority:forAxis:", 0, v17);
  -[MacFooterView addSubview:](v13, "addSubview:", v11->_accessoryView);
  v18 = objc_alloc_init((Class)NSMutableArray);
  if ((v5 & 0x1D) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView _basicButtonSetupAddedToContentView:](v11, "_basicButtonSetupAddedToContentView:", v13));
    objc_msgSend(v19, "setRole:", 1);
    -[MacFooterView setRightButton:](v11, "setRightButton:", v19);
    if ((v5 & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = v20;
      v22 = CFSTR("Add");
    }
    else if ((v5 & 4) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = v20;
      v22 = CFSTR("Submit");
    }
    else
    {
      if ((v5 & 0x18) == 0)
      {
LABEL_13:
        objc_msgSend(v19, "addTarget:action:forControlEvents:", v11, "_rightButtonTapped:", 64);
        objc_msgSend(v18, "addObject:", v19);

        goto LABEL_14;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = v20;
      v22 = CFSTR("Done");
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", v22, CFSTR("localized string not found"), 0));
    objc_msgSend(v19, "setTitle:forState:", v23, 0);

    goto LABEL_13;
  }
LABEL_14:
  if ((v5 & 2) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView _basicButtonSetupAddedToContentView:](v11, "_basicButtonSetupAddedToContentView:", v13));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Back"), CFSTR("localized string not found"), 0));
    objc_msgSend(v24, "setTitle:forState:", v26, 0);
    v27 = &selRef__backButtonTapped_;
    goto LABEL_18;
  }
  if ((v5 & 8) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView _basicButtonSetupAddedToContentView:](v11, "_basicButtonSetupAddedToContentView:", v13));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
    objc_msgSend(v24, "setTitle:forState:", v26, 0);
    v27 = &selRef__leftButtonTapped_;
LABEL_18:

    objc_msgSend(v24, "addTarget:action:forControlEvents:", v11, *v27, 64);
    objc_msgSend(v18, "addObject:", v24);

  }
  v28 = objc_alloc((Class)MUSizeLayout);
  +[MUSizeLayout useIntrinsicContentSize](MUSizeLayout, "useIntrinsicContentSize");
  v29 = objc_msgSend(v28, "initWithItem:size:", v11);
  v30 = objc_alloc((Class)MUSizeLayout);
  v31 = v11->_accessoryView;
  +[MUSizeLayout useIntrinsicContentSize](MUSizeLayout, "useIntrinsicContentSize");
  v32 = objc_msgSend(v30, "initWithItem:size:", v31);
  v55 = v13;
  v33 = objc_msgSend(objc_alloc((Class)MUStackLayout), "initWithContainer:axis:", v13, 0);
  objc_msgSend(v33, "addArrangedLayoutItem:", v11->_accessoryView);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "reverseObjectEnumerator"));
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(v33, "addArrangedLayoutItem:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i));
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v36);
  }

  objc_msgSend(v33, "setDistribution:", 0);
  objc_msgSend(v33, "setDistributionBoundsContent:", 1);
  objc_msgSend(v33, "setAlignment:", 2);
  objc_msgSend(v33, "setInsets:", 0.0, 16.0, 0.0, 16.0);
  objc_msgSend(v33, "setSpacing:", 20.0);
  v54 = v29;
  v64[0] = v29;
  v64[1] = v32;
  v64[2] = v33;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 3));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v39));

  v41 = v57;
  if (v57)
  {
    v42 = objc_msgSend(objc_alloc((Class)MUEdgeLayout), "initWithItem:container:", v57, v11);
    objc_msgSend(v40, "addObject:", v42);

  }
  v43 = v18;
  if (objc_msgSend(v18, "count") == (id)2)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", 0));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "widthAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", 1));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "widthAnchor"));
    LODWORD(v47) = 1140457472;
    v48 = v32;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:priority:", v46, 0.0, v47));
    v63 = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));

    v32 = v48;
    v41 = v57;

  }
  else
  {
    v50 = &__NSArray0__struct;
  }
  +[NSLayoutConstraint _mapsui_activateLayouts:constraints:](NSLayoutConstraint, "_mapsui_activateLayouts:constraints:", v40, v50);
  v51 = (NSArray *)objc_msgSend(v43, "copy");
  actionButtons = v11->_actionButtons;
  v11->_actionButtons = v51;

  return v56;
}

- (void)setRightButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_rightButtonEnabled = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MacFooterView rightButton](self, "rightButton"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (id)_basicButtonSetupAddedToContentView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  objc_msgSend(v3, "addSubview:", v4);

  LODWORD(v5) = 1148846080;
  objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  return v4;
}

- (void)_leftButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MacFooterView delegate](self, "delegate", a3));
  objc_msgSend(v4, "macFooterViewLeftButtonTapped:", self);

}

- (void)_rightButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MacFooterView delegate](self, "delegate", a3));
  objc_msgSend(v4, "macFooterViewRightButtonTapped:", self);

}

- (void)_backButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MacFooterView delegate](self, "delegate", a3));
  objc_msgSend(v4, "macFooterViewBackButtonTapped:", self);

}

- (void)willBeginSubmissionWithProgress:(id)a3
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_actionButtons;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "setEnabled:", 0, (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)submissionFinishedWithError:(id)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_actionButtons;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView rightButton](self, "rightButton", (_QWORD)v13));

        if (v9 == v10)
        {
          v11 = -[MacFooterView rightButtonEnabled](self, "rightButtonEnabled");
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView rightButton](self, "rightButton"));
          objc_msgSend(v12, "setEnabled:", v11);

        }
        else
        {
          objc_msgSend(v9, "setEnabled:", 1);
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (MacFooterViewDelegate)delegate
{
  return (MacFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightButton, a3);
}

- (BOOL)rightButtonEnabled
{
  return self->_rightButtonEnabled;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionButtons, 0);
}

@end
