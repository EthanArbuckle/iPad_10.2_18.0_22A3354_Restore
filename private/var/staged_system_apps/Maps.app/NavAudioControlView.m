@implementation NavAudioControlView

- (NavAudioControlView)initWithDelegate:(id)a3
{
  id v4;
  NavAudioControlView *v5;
  NavAudioControlView *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NavAudioControlView;
  v5 = -[NavAudioControlView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NavAudioControlView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", v9);

    objc_storeWeak((id *)&v6->_delegate, v4);
    -[NavAudioControlView _setup](v6, "_setup");
  }

  return v6;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[NavAudioControlView collapsedDimension](self, "collapsedDimension");
  v4 = v3;
  if (-[NavAudioControlView isExpanded](self, "isExpanded"))
    -[NavAudioControlView expandedHeight](self, "expandedHeight");
  else
    -[NavAudioControlView collapsedDimension](self, "collapsedDimension");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)collapsedDimension
{
  return 60.0;
}

- (double)fullHeight
{
  return 188.0;
}

- (double)highlightWidth
{
  double v2;

  -[NavAudioControlView collapsedDimension](self, "collapsedDimension");
  return v2 + -6.0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  NavAudioControlView *v8;
  NavAudioControlView *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double Height;
  NSArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  NavAudioControlView *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  CGRect v29;
  CGRect v30;
  CGRect v31;

  y = a3.y;
  x = a3.x;
  v27.receiver = self;
  v27.super_class = (Class)NavAudioControlView;
  v7 = -[NavAudioControlView hitTest:withEvent:](&v27, "hitTest:withEvent:", a4);
  v8 = (NavAudioControlView *)objc_claimAutoreleasedReturnValue(v7);
  if (v8 == self)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView containerView](self, "containerView"));
    objc_msgSend(v10, "convertPoint:fromView:", self, x, y);
    v12 = v11;

    if (v12 <= 0.0)
    {
      v9 = (NavAudioControlView *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_buttons, "firstObject"));
      goto LABEL_17;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView containerView](self, "containerView"));
    objc_msgSend(v13, "frame");
    Height = CGRectGetHeight(v29);

    if (v12 >= Height)
    {
      v9 = (NavAudioControlView *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_buttons, "lastObject"));
      goto LABEL_17;
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = self->_buttons;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v20, "frame", (_QWORD)v23);
          if (v12 <= CGRectGetMaxY(v30))
          {
            objc_msgSend(v20, "frame");
            if (v12 >= CGRectGetMinY(v31))
            {
              v21 = v20;

              goto LABEL_18;
            }
          }
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v17)
          continue;
        break;
      }
    }

  }
  v9 = v8;
LABEL_17:
  v21 = v9;
LABEL_18:

  return v21;
}

- (void)_setup
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double height;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  UIView *v14;
  UIView *maps_maskView;
  double v16;
  double v17;
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
  UIView *v31;
  UIView *containerView;
  UIView *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSLayoutConstraint *v38;
  NSLayoutConstraint *containerViewTopConstraint;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  UIView *v48;
  UIView *highlightView;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  NSLayoutConstraint *v56;
  NSLayoutConstraint *highlightViewTopConstraint;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  id location;

  -[NavAudioControlView collapsedDimension](self, "collapsedDimension");
  v4 = v3 * 0.5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView layer](self, "layer"));
  objc_msgSend(v5, "setCornerRadius:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView layer](self, "layer"));
  LODWORD(v7) = 1045220557;
  objc_msgSend(v6, "setShadowOpacity:", v7);

  height = CGSizeZero.height;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView layer](self, "layer"));
  objc_msgSend(v9, "setShadowOffset:", CGSizeZero.width, height);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView layer](self, "layer"));
  objc_msgSend(v10, "setShadowRadius:", 1.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView layer](self, "layer"));
  objc_msgSend(v11, "setShadowPathIsBounds:", 1);

  objc_initWeak(&location, self);
  v65[1] = 3221225472;
  v65[2] = sub_1009CC0C8;
  v65[3] = &unk_1011DE808;
  v65[0] = _NSConcreteStackBlock;
  objc_copyWeak(&v66, &location);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EventTap eventTapWithHandler:](EventTap, "eventTapWithHandler:", v65));
  -[NavAudioControlView setEventTap:](self, "setEventTap:", v12);

  v13 = objc_opt_new(NSMutableArray);
  v14 = objc_opt_new(UIView);
  maps_maskView = self->_maps_maskView;
  self->_maps_maskView = v14;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_maps_maskView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setClipsToBounds:](self->_maps_maskView, "setClipsToBounds:", 1);
  -[NavAudioControlView collapsedDimension](self, "collapsedDimension");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_maps_maskView, "layer"));
  objc_msgSend(v18, "setCornerRadius:", v17 * 0.5);

  -[UIView setAccessibilityIdentifier:](self->_maps_maskView, "setAccessibilityIdentifier:", CFSTR("NavAudioControlMaskView"));
  -[NavAudioControlView addSubview:](self, "addSubview:", self->_maps_maskView);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_maps_maskView, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView leadingAnchor](self, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  -[NSMutableArray addObject:](v13, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_maps_maskView, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView trailingAnchor](self, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  -[NSMutableArray addObject:](v13, "addObject:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_maps_maskView, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView topAnchor](self, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  -[NSMutableArray addObject:](v13, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_maps_maskView, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView bottomAnchor](self, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
  -[NSMutableArray addObject:](v13, "addObject:", v30);

  v31 = objc_opt_new(UIView);
  containerView = self->_containerView;
  self->_containerView = v31;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAccessibilityIdentifier:](self->_containerView, "setAccessibilityIdentifier:", CFSTR("NavAudioControlContainerView"));
  -[UIView addSubview:](self->_maps_maskView, "addSubview:", self->_containerView);
  v33 = self->_containerView;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView createBackgroundView](self, "createBackgroundView"));
  objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v33, "addSubview:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "_maps_constraintsForCenteringInView:", v33));
  -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView topAnchor](self, "topAnchor"));
  v38 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
  containerViewTopConstraint = self->_containerViewTopConstraint;
  self->_containerViewTopConstraint = v38;

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView leadingAnchor](self, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));
  -[NSMutableArray addObject:](v13, "addObject:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView trailingAnchor](self, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));
  -[NSMutableArray addObject:](v13, "addObject:", v45);

  -[NSMutableArray addObject:](v13, "addObject:", self->_containerViewTopConstraint);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_containerView, "heightAnchor"));
  -[NavAudioControlView fullHeight](self, "fullHeight");
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToConstant:"));
  -[NSMutableArray addObject:](v13, "addObject:", v47);

  v48 = objc_opt_new(UIView);
  highlightView = self->_highlightView;
  self->_highlightView = v48;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_highlightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
  -[UIView setBackgroundColor:](self->_highlightView, "setBackgroundColor:", v50);

  -[NavAudioControlView highlightWidth](self, "highlightWidth");
  v52 = v51;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_highlightView, "layer"));
  objc_msgSend(v53, "setCornerRadius:", v52 * 0.5);

  -[UIView addSubview:](v33, "addSubview:", self->_highlightView);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_highlightView, "topAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v33, "topAnchor"));
  v56 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v55));
  highlightViewTopConstraint = self->_highlightViewTopConstraint;
  self->_highlightViewTopConstraint = v56;

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_highlightView, "widthAnchor"));
  -[NavAudioControlView highlightWidth](self, "highlightWidth");
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToConstant:"));
  -[NSMutableArray addObject:](v13, "addObject:", v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_highlightView, "centerXAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v33, "centerXAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v61));
  -[NSMutableArray addObject:](v13, "addObject:", v62);

  -[NSMutableArray addObject:](v13, "addObject:", self->_highlightViewTopConstraint);
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_highlightView, "heightAnchor"));
  -[NavAudioControlView highlightWidth](self, "highlightWidth");
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToConstant:"));
  -[NSMutableArray addObject:](v13, "addObject:", v64);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);
  -[NavAudioControlView _updateContent](self, "_updateContent");

  objc_destroyWeak(&v66);
  objc_destroyWeak(&location);
}

- (void)didMoveToWindow
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavAudioControlView;
  -[NavAudioControlView didMoveToWindow](&v7, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView window](self, "window"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___EventSourceHandler);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView window](self, "window"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView eventTap](self, "eventTap"));
    objc_msgSend(v5, "_maps_registerEventTap:", v6);

  }
}

- (id)createBackgroundView
{
  UIView *v2;
  void *v3;

  v2 = objc_opt_new(UIView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
  -[UIView setBackgroundColor:](v2, "setBackgroundColor:", v3);

  return v2;
}

- (id)createButton
{
  return objc_opt_new(UIButton);
}

- (void)_updateButtons
{
  NSMutableArray *v3;
  double leading;
  double bottom;
  double trailing;
  void *i;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  NSArray *buttons;
  NSMutableArray *v31;
  id obj;
  uint64_t v33;
  NSMutableArray *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  -[NSArray makeObjectsPerformSelector:](self->_buttons, "makeObjectsPerformSelector:", "removeFromSuperview");
  v3 = objc_opt_new(NSMutableArray);
  v34 = objc_opt_new(NSMutableArray);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v35)
  {
    v33 = *(_QWORD *)v37;
    leading = NSDirectionalEdgeInsetsZero.leading;
    bottom = NSDirectionalEdgeInsetsZero.bottom;
    trailing = NSDirectionalEdgeInsetsZero.trailing;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(obj);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "unsignedIntegerValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration borderlessButtonConfiguration](UIButtonConfiguration, "borderlessButtonConfiguration"));
        objc_msgSend(v9, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, leading, bottom, trailing);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView preferredSymbolConfigurationForImage](self, "preferredSymbolConfigurationForImage"));
        objc_msgSend(v9, "setPreferredSymbolConfigurationForImage:", v10);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView _imageForAudioType:](self, "_imageForAudioType:", v8));
        objc_msgSend(v9, "setImage:", v11);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView createButton](self, "createButton"));
        -[NSMutableArray addObject:](v34, "addObject:", v12);
        objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v12, "setTag:", v8);
        objc_msgSend(v12, "setConfiguration:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "traitOverrides"));
        objc_msgSend(v13, "setLayoutDirection:", 0);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView _accessibilityTextForAudioType:](self, "_accessibilityTextForAudioType:", v8));
        objc_msgSend(v12, "setAccessibilityLabel:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView _accessibilityIdenfifierPrefixForAudioType:](self, "_accessibilityIdenfifierPrefixForAudioType:", v8));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("Button")));
        objc_msgSend(v12, "setAccessibilityIdentifier:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView _accessibilityUserInputLabelsForAudioType:](self, "_accessibilityUserInputLabelsForAudioType:", v8));
        objc_msgSend(v12, "setAccessibilityUserInputLabels:", v17);

        objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "_pressedAudioTypeButton:", 64);
        -[UIView addSubview:](self->_containerView, "addSubview:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
        -[NSMutableArray addObject:](v3, "addObject:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
        -[NSMutableArray addObject:](v3, "addObject:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
        -[NavAudioControlView containerTopPositionWhenCollapsedForAudioType:](self, "containerTopPositionWhenCollapsedForAudioType:", v8);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -v26));
        -[NSMutableArray addObject:](v3, "addObject:", v27);

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "heightAnchor"));
        -[NavAudioControlView collapsedDimension](self, "collapsedDimension");
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToConstant:"));
        -[NSMutableArray addObject:](v3, "addObject:", v29);

      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v35);
  }

  buttons = self->_buttons;
  self->_buttons = &v34->super;
  v31 = v34;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);
}

- (id)preferredSymbolConfigurationForImage
{
  return +[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 5, 22.0);
}

- (id)_imageForAudioType:(unint64_t)a3
{
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (a3 == 2)
  {
    v3 = CFSTR("speaker.slash.fill");
  }
  else
  {
    if (a3 == 1)
    {
      v4 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("AudioAlertsOnly")));
      goto LABEL_8;
    }
    if (a3)
    {
      v5 = 0;
      goto LABEL_10;
    }
    v3 = CFSTR("speaker.wave.2.fill");
  }
  v4 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v3));
LABEL_8:
  v5 = (void *)v4;
LABEL_10:
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageFlippedForRightToLeftLayoutDirection"));

  return v6;
}

- (id)_accessibilityIdenfifierPrefixForAudioType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("AllGuidance");
  if (a3 == 1)
    v3 = CFSTR("AlertsOnly");
  if (a3 == 2)
    return CFSTR("NoGuidance");
  else
    return (id)v3;
}

- (id)_accessibilityTextForAudioType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 2uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[Audio] No guidance");
      goto LABEL_7;
    case 1uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[Audio] Alerts only");
      goto LABEL_7;
    case 0uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[Audio] All guidance");
LABEL_7:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

      break;
  }
  return v3;
}

- (id)_accessibilityUserInputLabelsForAudioType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];

  switch(a3)
  {
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Audio] No guidance"), CFSTR("localized string not found"), 0));
      v10[0] = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CarPlay_Mute"), CFSTR("localized string not found"), 0));
      v10[1] = v6;
      v7 = v10;
      goto LABEL_7;
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Audio] Alerts only"), CFSTR("localized string not found"), 0));
      v11[0] = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Alert"), CFSTR("localized string not found"), 0));
      v11[1] = v6;
      v7 = v11;
      goto LABEL_7;
    case 0uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Audio] All guidance"), CFSTR("localized string not found"), 0));
      v12[0] = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CarPlay_Speaker"), CFSTR("localized string not found"), 0));
      v12[1] = v6;
      v7 = v12;
LABEL_7:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));

      return v8;
  }
  return 0;
}

- (void)_pressedAudioTypeButton:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
  v5 = objc_msgSend(v4, "count");

  if ((unint64_t)v5 >= 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
    v7 = objc_msgSend(v6, "count");

    if (v7 == (id)2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_currentAudioType));
      v11 = objc_msgSend(v9, "isEqual:", v10);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
      v13 = v12;
      if (v11)
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
      else
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
      v16 = v14;
      -[NavAudioControlView _selectAudioType:](self, "_selectAudioType:", objc_msgSend(v14, "unsignedIntegerValue"));

      -[NavAudioControlView _animateContentUpdate](self, "_animateContentUpdate");
    }
    else
    {
      if (-[NavAudioControlView isExpanded](self, "isExpanded"))
      {
        v15 = objc_msgSend(v17, "tag");
        if ((id)self->_currentAudioType != v15)
          -[NavAudioControlView _selectAudioType:](self, "_selectAudioType:", v15);
      }
      -[NavAudioControlView setExpanded:](self, "setExpanded:", -[NavAudioControlView isExpanded](self, "isExpanded") ^ 1);
    }
  }

}

- (void)_selectAudioType:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  NavAudioControlView *v7;
  NavAudioControlView *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  unint64_t currentAudioType;
  void *v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  unint64_t v21;

  v5 = sub_100432E6C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v19 = v14;
    v20 = 2048;
    v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Changing audioType to %lu", buf, 0x16u);

  }
  self->_currentAudioType = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView delegate](self, "delegate"));
  objc_msgSend(v15, "audioControlView:didSelectAudioType:", self, self->_currentAudioType);

  currentAudioType = self->_currentAudioType;
  if (currentAudioType <= 2)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", dword_100E3CE00[currentAudioType], -[NavAudioControlView analyticsTarget](self, "analyticsTarget"), 0);
  +[MapsAnalyticStateProvider updateSettingsInformation](MapsAnalyticStateProvider, "updateSettingsInformation");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector"));
  objc_msgSend(v17, "updateAudioPreferences");

}

- (void)setExpanded:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  NavAudioControlView *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 expanded;
  GCDTimer *timer;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;

  if (self->_expanded != a3)
  {
    v3 = a3;
    v5 = sub_100432E6C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    expanded = self->_expanded;
    *(_DWORD *)buf = 138543874;
    v17 = v13;
    v18 = 1024;
    v19 = expanded;
    v20 = 1024;
    v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Changing expansion from %d to %d", buf, 0x18u);

LABEL_9:
    self->_expanded = v3;
    -[NavAudioControlView _animateContentUpdate](self, "_animateContentUpdate");
    if (v3)
    {
      -[NavAudioControlView _rescheduleCollapse](self, "_rescheduleCollapse");
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 139, -[NavAudioControlView analyticsTarget](self, "analyticsTarget"), 0);
    }
    else
    {
      timer = self->_timer;
      self->_timer = 0;

    }
  }
}

- (void)_rescheduleCollapse
{
  id v3;
  GCDTimer *v4;
  GCDTimer *timer;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009CD070;
  v6[3] = &unk_1011AE190;
  objc_copyWeak(&v7, &location);
  v4 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v6, 5.0));
  timer = self->_timer;
  self->_timer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_animateContentUpdate
{
  SpringGroupAnimation *v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = objc_alloc_init(SpringGroupAnimation);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1009CD1DC;
  v9[3] = &unk_1011AC860;
  v9[4] = self;
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009CD224;
  v8[3] = &unk_1011AC860;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009CD280;
  v7[3] = &unk_1011AE8F8;
  -[GroupAnimation addPreparation:animations:completion:](v3, "addPreparation:animations:completion:", v9, v8, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "audioControlView:willChangeSizeWithAnimation:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView delegate](self, "delegate"));
    objc_msgSend(v6, "audioControlView:willChangeSizeWithAnimation:", self, v3);

  }
  -[SpringGroupAnimation runWithDuration:delay:options:mass:stiffness:damping:initialVelocity:](v3, "runWithDuration:delay:options:mass:stiffness:damping:initialVelocity:", 6, 1.0, 0.0, 3.0, 1000.0, 500.0, 0.0);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self);

}

- (double)expandedHeight
{
  void *v3;
  id v4;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
  v4 = objc_msgSend(v3, "count");

  if (v4 == (id)3)
  {
    -[NavAudioControlView fullHeight](self, "fullHeight");
  }
  else if (v4 == (id)2)
  {
    return 122.0;
  }
  else if (v4 == (id)1)
  {
    -[NavAudioControlView collapsedDimension](self, "collapsedDimension");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (void)setAvailableAudioTypes:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  NSArray *v8;
  NSArray *availableAudioTypes;
  id v10;
  NSObject *v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  unint64_t v16;

  v4 = a3;
  v5 = self->_availableAudioTypes;
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = (NSArray *)objc_msgSend((id)v6, "copy");
      availableAudioTypes = self->_availableAudioTypes;
      self->_availableAudioTypes = v8;

      v10 = sub_100432E6C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v15 = 138543362;
        v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Available audio types changed to %{public}@", (uint8_t *)&v15, 0xCu);
      }

      -[NavAudioControlView setExpanded:](self, "setExpanded:", 0);
      -[NavAudioControlView _updateButtons](self, "_updateButtons");
      -[NavAudioControlView containerTopPositionWhenCollapsedForAudioType:](self, "containerTopPositionWhenCollapsedForAudioType:", self->_currentAudioType);
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView containerViewTopConstraint](self, "containerViewTopConstraint"));
      objc_msgSend(v14, "setConstant:", v13);

      -[NavAudioControlView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }

}

- (void)setCurrentAudioType:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  unint64_t currentAudioType;
  double v8;
  double v9;
  void *v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;

  if (self->_currentAudioType != a3)
  {
    v5 = sub_100432E6C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      currentAudioType = self->_currentAudioType;
      v11 = 134218240;
      v12 = currentAudioType;
      v13 = 2048;
      v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Changing audio type from %lu to %lu", (uint8_t *)&v11, 0x16u);
    }

    self->_currentAudioType = a3;
    -[NavAudioControlView setExpanded:](self, "setExpanded:", 0);
    -[NavAudioControlView containerTopPositionWhenCollapsedForAudioType:](self, "containerTopPositionWhenCollapsedForAudioType:", a3);
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView containerViewTopConstraint](self, "containerViewTopConstraint"));
    objc_msgSend(v10, "setConstant:", v9);

  }
}

- (double)containerTopPositionWhenCollapsedForAudioType:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  double result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  result = -62.0;
  if (v6 != (id)1)
    result = 0.0;
  if (v6 == (id)2)
    return -128.0;
  return result;
}

- (double)highlightTopPosition
{
  void *v3;
  void *v4;
  id v5;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView availableAudioTypes](self, "availableAudioTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_currentAudioType));
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  result = 65.0;
  if (v5 != (id)1)
    result = 3.0;
  if (v5 == (id)2)
    return 131.0;
  return result;
}

- (void)_updateContent
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  v3 = 0.0;
  if (!-[NavAudioControlView isExpanded](self, "isExpanded"))
  {
    -[NavAudioControlView containerTopPositionWhenCollapsedForAudioType:](self, "containerTopPositionWhenCollapsedForAudioType:", self->_currentAudioType);
    v3 = v4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView containerViewTopConstraint](self, "containerViewTopConstraint"));
  objc_msgSend(v5, "setConstant:", v3);

  -[NavAudioControlView highlightTopPosition](self, "highlightTopPosition");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView highlightViewTopConstraint](self, "highlightViewTopConstraint"));
  objc_msgSend(v8, "setConstant:", v7);

  if (-[NavAudioControlView isExpanded](self, "isExpanded"))
    v9 = 1.0;
  else
    v9 = 0.0;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NavAudioControlView highlightView](self, "highlightView"));
  objc_msgSend(v10, "setAlpha:", v9);

}

- (void)_handleEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  if (objc_msgSend(v4, "type"))
  {
    if (objc_msgSend(v4, "type") == (id)7 && self->_timer)
      -[NavAudioControlView _rescheduleCollapse](self, "_rescheduleCollapse");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView window](self, "window", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "touchesForWindow:", v5));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "type") == (id)1 && self->_timer)
          {
            -[NavAudioControlView _rescheduleCollapse](self, "_rescheduleCollapse");
LABEL_18:

            goto LABEL_19;
          }
          if (objc_msgSend(v11, "phase") != (id)3)
            goto LABEL_18;
          objc_msgSend(v11, "locationInView:", self);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavAudioControlView hitTest:withEvent:](self, "hitTest:withEvent:", v4));

          if (v12)
            goto LABEL_18;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    -[NavAudioControlView setExpanded:](self, "setExpanded:", 0);
  }
LABEL_19:

}

+ (unint64_t)navAudioTypeForGuidanceLevel:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v7;
  NSObject *v8;
  uint8_t v9[16];
  uint64_t v10;
  uint64_t v11;

  if (a3 == -1)
  {
    v10 = v3;
    v11 = v4;
    v7 = sub_100432E6C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Invalid guidance level \"NoOverride\" in NavAudioControlView.", v9, 2u);
    }

    return 2;
  }
  else
  {
    v5 = 2;
    if (a3 == 1)
      v5 = 1;
    if (a3 == 2)
      return 0;
    else
      return v5;
  }
}

- (int)analyticsTarget
{
  return 505;
}

- (NavAudioControlViewDelegate)delegate
{
  return (NavAudioControlViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)availableAudioTypes
{
  return self->_availableAudioTypes;
}

- (unint64_t)currentAudioType
{
  return self->_currentAudioType;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (EventTap)eventTap
{
  return self->_eventTap;
}

- (void)setEventTap:(id)a3
{
  objc_storeStrong((id *)&self->_eventTap, a3);
}

- (UIView)maps_maskView
{
  return self->_maps_maskView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (NSLayoutConstraint)containerViewTopConstraint
{
  return self->_containerViewTopConstraint;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (NSLayoutConstraint)highlightViewTopConstraint
{
  return self->_highlightViewTopConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_containerViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_maps_maskView, 0);
  objc_storeStrong((id *)&self->_eventTap, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_availableAudioTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
