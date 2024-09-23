@implementation RoutePlanningRefinementBarView

- (RoutePlanningRefinementBarView)initWithDelegate:(id)a3 refinements:(id)a4
{
  id v6;
  id v7;
  double y;
  double width;
  double height;
  RoutePlanningRefinementBarView *v11;
  RoutePlanningRefinementBarView *v12;
  NSArray *v13;
  NSArray *refinements;
  UIScrollView *v15;
  UIScrollView *scrollView;
  UIView *v17;
  UIView *containerView;
  double v19;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  objc_super v55;
  _QWORD v56[10];

  v6 = a3;
  v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)RoutePlanningRefinementBarView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[RoutePlanningRefinementBarView initWithFrame:](&v55, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v6);
    v13 = (NSArray *)objc_msgSend(v7, "copy");
    refinements = v12->_refinements;
    v12->_refinements = v13;

    v15 = (UIScrollView *)objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v53 = v7;
    scrollView = v12->_scrollView;
    v12->_scrollView = v15;

    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v12->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v12->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v12->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[RoutePlanningRefinementBarView addSubview:](v12, "addSubview:", v12->_scrollView);
    v17 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v54 = v6;
    containerView = v12->_containerView;
    v12->_containerView = v17;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v19) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v12->_containerView, "setContentHuggingPriority:forAxis:", 1, v19);
    -[UIScrollView addSubview:](v12->_scrollView, "addSubview:", v12->_containerView);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](v12->_scrollView, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView leadingAnchor](v12, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
    v56[0] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](v12->_scrollView, "trailingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView trailingAnchor](v12, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
    v56[1] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](v12->_scrollView, "topAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView topAnchor](v12, "topAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
    v56[2] = v44;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](v12->_scrollView, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView bottomAnchor](v12, "bottomAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
    v56[3] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v12->_containerView, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](v12->_scrollView, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
    v56[4] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v12->_containerView, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](v12->_scrollView, "trailingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
    v56[5] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v12->_containerView, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](v12->_scrollView, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v56[6] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v12->_containerView, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](v12->_scrollView, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v20));
    v56[7] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v12->_containerView, "widthAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView widthAnchor](v12->_scrollView, "widthAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v23));
    v56[8] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v12->_containerView, "heightAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView heightAnchor](v12->_scrollView, "heightAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    v56[9] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

    v7 = v53;
    v6 = v54;

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v29, "addObserver:selector:name:object:", v12, "_contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

    -[RoutePlanningRefinementBarView setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", CFSTR("RoutePlanningRefinementBar"));
    -[RoutePlanningRefinementBarView _applyRefinements](v12, "_applyRefinements");
  }

  return v12;
}

- (CGSize)intrinsicContentSize
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  void *i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  CGSize result;

  if (-[NSArray count](self->_buttons, "count"))
  {
    if (-[NSArray count](self->_buttons, "count"))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v3 = self->_buttons;
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v15;
        v7 = 34.0;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(_QWORD *)v15 != v6)
              objc_enumerationMutation(v3);
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "textLabel", (_QWORD)v14));
            objc_msgSend(v9, "sizeThatFits:", 1.79769313e308, 100.0);
            v11 = ceil(v10);

            if (v11 + 6.0 + 6.0 > v7)
              v7 = v11 + 6.0 + 6.0;
          }
          v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v5);
      }
      else
      {
        v7 = 34.0;
      }

    }
    else
    {
      v7 = 34.0;
    }
  }
  else
  {
    v7 = 0.0;
  }
  v12 = UIViewNoIntrinsicMetric;
  v13 = v7;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setRefinements:(id)a3
{
  NSArray *v4;
  NSArray *refinements;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  refinements = self->_refinements;
  self->_refinements = v4;

  -[RoutePlanningRefinementBarView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[RoutePlanningRefinementBarView _applyRefinements](self, "_applyRefinements");
}

- (void)resetScrollPosition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_buttons, "firstObject"));
  -[RoutePlanningRefinementBarView _targetContentOffsetForView:](self, "_targetContentOffsetForView:", v3);
  v5 = v4;
  v7 = v6;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView scrollView](self, "scrollView"));
  objc_msgSend(v8, "setContentOffset:", v5, v7);

}

- (void)_applyRefinements
{
  NSArray *buttonConstraints;
  NSArray *buttons;
  id v5;
  id v6;
  id v7;
  id v8;
  _BYTE *v9;
  int64_t v10;
  void *v11;
  id v12;
  unint64_t v13;
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
  objc_class *v28;
  void *v29;
  NSArray *v30;
  NSArray *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  RoutePlanningRefinementBarView *v38;

  if (self->_buttonConstraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    buttonConstraints = self->_buttonConstraints;
    self->_buttonConstraints = 0;

  }
  v34 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView refinements](self, "refinements"));
  v32 = 8;
  buttons = self->_buttons;
  if (buttons)
    v5 = -[NSArray mutableCopy](buttons, "mutableCopy");
  else
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v34, "count"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100B12748;
  v36[3] = &unk_1011E2AF0;
  v6 = v5;
  v37 = v6;
  v38 = self;
  objc_msgSend(v34, "enumerateObjectsUsingBlock:", v36);
  v7 = objc_msgSend(v6, "count");
  if (v7 > objc_msgSend(v34, "count"))
  {
    v8 = objc_msgSend(v34, "count");
    v9 = objc_msgSend(v6, "count");
    v10 = v9 - (_BYTE *)objc_msgSend(v34, "count");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v8, v10));
    objc_msgSend(v6, "enumerateObjectsAtIndexes:options:usingBlock:", v11, 0, &stru_1011E2B30);

    objc_msgSend(v6, "removeObjectsInRange:", v8, v10);
  }
  v12 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v6, "count"))
  {
    v13 = 0;
    v14 = 0;
    do
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v13, v32));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
      if (v13)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 8.0));
        objc_msgSend(v12, "addObject:", v18);
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView containerView](self, "containerView"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 16.0));
        objc_msgSend(v12, "addObject:", v19);

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView containerView](self, "containerView"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "centerYAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
      objc_msgSend(v12, "addObject:", v23);

      ++v13;
      v14 = v15;
    }
    while (v13 < (unint64_t)objc_msgSend(v6, "count"));
    if (v15)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView containerView](self, "containerView"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:constant:", v26, -16.0));
      objc_msgSend(v12, "addObject:", v27);

    }
  }
  v28 = (objc_class *)objc_msgSend(v6, "copy", v32);
  v29 = *(Class *)((char *)&self->super.super.super.isa + v33);
  *(Class *)((char *)&self->super.super.super.isa + v33) = v28;

  v30 = (NSArray *)objc_msgSend(v12, "copy");
  v31 = self->_buttonConstraints;
  self->_buttonConstraints = v30;

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100B12888;
  v35[3] = &unk_1011AC860;
  v35[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v35);

}

- (void)_buttonMenuTriggered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "refinement"));
  objc_msgSend(v5, "_resetForMenuPresentation");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "refinement"));

  objc_msgSend(v7, "pressedRefinementModel:", v6);
}

- (void)_touchUpInsideButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "showsMenuAsPrimaryAction") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "refinement"));
    objc_msgSend(v4, "selectedRefinementModel:", v5);

  }
}

- (CGPoint)_targetContentOffsetForView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double x;
  double v8;
  CGFloat y;
  void *v10;
  unsigned int v11;
  void *v12;
  double Width;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "frame");
    x = v6;
    y = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView scrollView](self, "scrollView"));
    v11 = objc_msgSend(v10, "_mapkit_isRTL");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView scrollView](self, "scrollView"));
      objc_msgSend(v12, "bounds");
      Width = CGRectGetWidth(v21);
      objc_msgSend(v5, "bounds");
      v14 = Width - CGRectGetWidth(v22);
      v15 = 0.0;
      if (v14 >= 0.0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView scrollView](self, "scrollView"));
        objc_msgSend(v16, "bounds");
        v17 = CGRectGetWidth(v23);
        objc_msgSend(v5, "bounds");
        v15 = v17 - CGRectGetWidth(v24);

      }
      x = x - v15;
    }
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }

  v18 = x;
  v19 = y;
  result.y = v19;
  result.x = v18;
  return result;
}

- (RoutePlanningRefinementDelegate)delegate
{
  return (RoutePlanningRefinementDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)refinements
{
  return self->_refinements;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_refinements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end
