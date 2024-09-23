@implementation MultilineStackView

- (MultilineStackView)initWithHorizontalArrangement:(unint64_t)a3 verticalArrangement:(unint64_t)a4
{
  MultilineStackView *v6;
  MultilineStackView *v7;
  NSMutableArray *v8;
  NSMutableArray *arrangedSubviews;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MultilineStackView;
  v6 = -[MultilineStackView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    v6->_horizontalArrangement = a3;
    v6->_verticalArrangement = a4;
    v8 = objc_opt_new(NSMutableArray);
    arrangedSubviews = v7->_arrangedSubviews;
    v7->_arrangedSubviews = v8;

  }
  return v7;
}

- (void)setInterItemHorizontalPadding:(double)a3
{
  if (vabdd_f64(self->_interItemHorizontalPadding, a3) >= 2.22044605e-16)
  {
    self->_interItemHorizontalPadding = a3;
    -[MultilineStackView invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setInterItemVerticalPadding:(double)a3
{
  if (vabdd_f64(self->_interItemVerticalPadding, a3) >= 2.22044605e-16)
  {
    self->_interItemVerticalPadding = a3;
    -[MultilineStackView invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    -[MultilineStackView invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setCalculatedHeight:(double)a3
{
  if (vabdd_f64(self->_calculatedHeight, a3) > 2.22044605e-16)
  {
    self->_calculatedHeight = a3;
    -[MultilineStackView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (NSArray)arrangedSubviews
{
  return (NSArray *)self->_arrangedSubviews;
}

- (void)setArrangedSubviews:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *arrangedSubviews;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = (NSMutableArray *)objc_msgSend(v4, "mutableCopy");
  arrangedSubviews = self->_arrangedSubviews;
  self->_arrangedSubviews = v5;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "setTranslatesAutoresizingMaskIntoConstraints:", 0, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  -[MultilineStackView _computeLayout](self, "_computeLayout");
}

- (void)addArrangedSubview:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_arrangedSubviews, "containsObject:") & 1) == 0)
  {
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NSMutableArray addObject:](self->_arrangedSubviews, "addObject:", v4);
    -[MultilineStackView _computeLayout](self, "_computeLayout");
  }

}

- (void)insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[NSMutableArray removeObject:](self->_arrangedSubviews, "removeObject:", v6);
  -[NSMutableArray insertObject:atIndex:](self->_arrangedSubviews, "insertObject:atIndex:", v6, a4);

  -[MultilineStackView _computeLayout](self, "_computeLayout");
}

- (void)removeArrangedSubview:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_arrangedSubviews, "containsObject:"))
  {
    -[NSMutableArray removeObject:](self->_arrangedSubviews, "removeObject:", v4);
    -[MultilineStackView _computeLayout](self, "_computeLayout");
  }

}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MultilineStackView;
  -[MultilineStackView setBounds:](&v4, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MultilineStackView _computeLayoutIfNeeded](self, "_computeLayoutIfNeeded");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MultilineStackView;
  -[MultilineStackView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MultilineStackView _computeLayoutIfNeeded](self, "_computeLayoutIfNeeded");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MultilineStackView;
  -[MultilineStackView traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[MultilineStackView _computeLayout](self, "_computeLayout");
}

- (CGSize)intrinsicContentSize
{
  double Width;
  double calculatedHeight;
  CGSize result;
  CGRect v6;

  -[MultilineStackView frame](self, "frame");
  Width = CGRectGetWidth(v6);
  calculatedHeight = self->_calculatedHeight;
  result.height = calculatedHeight;
  result.width = Width;
  return result;
}

- (void)_computeLayoutIfNeeded
{
  NSNumber *computedWidth;
  double v4;
  double v5;
  double v6;

  computedWidth = self->_computedWidth;
  if (!computedWidth
    || (-[NSNumber cgFloatValue](computedWidth, "cgFloatValue"),
        v5 = v4,
        -[MultilineStackView frame](self, "frame"),
        vabdd_f64(v5, v6) > 2.22044605e-16))
  {
    -[MultilineStackView _computeLayout](self, "_computeLayout");
  }
}

- (BOOL)_justifiedLayoutWouldCrushWhenAddingView:(id)a3 toRowViews:(id)a4 availableRowWidth:(double)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  double v18;
  double v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v8 = a3;
  v9 = a4;
  v10 = (double)(unint64_t)objc_msgSend(v9, "count");
  -[MultilineStackView interItemHorizontalPadding](self, "interItemHorizontalPadding");
  v22 = 0u;
  v23 = 0u;
  v12 = (a5 - v10 * v11) / (double)((unint64_t)objc_msgSend(v9, "count") + 1);
  v24 = 0u;
  v25 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "_maps_intrinsicContentSize", (_QWORD)v22);
        if (v18 > v12)
        {

          v20 = 1;
          goto LABEL_11;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v15)
        continue;
      break;
    }
  }

  objc_msgSend(v8, "_maps_intrinsicContentSize");
  v20 = v19 > v12;
LABEL_11:

  return v20;
}

- (void)_prepareSubviewsForReuse:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "removeFromSuperview");
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraints"));
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {
          v11 = 0;
          do
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraints"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v11));

            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
            v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("MapsWidthConstraint"));

            if (v15)
              objc_msgSend(v8, "removeConstraint:", v13);
            else
              ++v11;

            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraints"));
            v17 = objc_msgSend(v16, "count");

          }
          while (v11 < (unint64_t)v17);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

- (void)_computeLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSMutableArray *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  id v18;
  char *v19;
  uint64_t v20;
  double v21;
  double v22;
  void *i;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unsigned int v31;
  double v32;
  id v33;
  int v34;
  void *v35;
  double (**v36)(_QWORD, _QWORD, double);
  void *v37;
  id v38;
  uint64_t v39;
  double v40;
  NSNumber *v41;
  NSNumber *computedWidth;
  void *v43;
  double (**v44)(_QWORD, _QWORD, double);
  void *v45;
  id v46;
  NSMutableArray *v47;
  NSNumber *v48;
  NSNumber *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *j;
  void *v56;
  id v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  NSMutableArray *v62;
  NSMutableArray *obj;
  char *obja;
  double v65;
  _QWORD v66[5];
  _QWORD v67[6];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[5];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView subviews](self, "subviews"));
  -[MultilineStackView _prepareSubviewsForReuse:](self, "_prepareSubviewsForReuse:", v3);

  -[MultilineStackView _prepareSubviewsForReuse:](self, "_prepareSubviewsForReuse:", self->_arrangedSubviews);
  -[MultilineStackView frame](self, "frame");
  v5 = v4;
  -[MultilineStackView edgeInsets](self, "edgeInsets");
  v7 = v5 - v6;
  -[MultilineStackView edgeInsets](self, "edgeInsets");
  v9 = v7 - v8;
  if (v7 - v8 <= 2.22044605e-16)
  {
    v41 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5));
    computedWidth = self->_computedWidth;
    self->_computedWidth = v41;

    -[MultilineStackView setCalculatedHeight:](self, "setCalculatedHeight:", 0.0);
  }
  else
  {
    v60 = v5;
    -[MultilineStackView edgeInsets](self, "edgeInsets");
    v11 = v10;
    -[MultilineStackView edgeInsets](self, "edgeInsets");
    v65 = v11 + v12;
    v13 = objc_opt_new(NSMutableArray);
    v62 = objc_opt_new(NSMutableArray);
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView topAnchor](self, "topAnchor"));
    -[MultilineStackView edgeInsets](self, "edgeInsets");
    v16 = v15;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = self->_arrangedSubviews;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v74;
      v21 = 0.0;
      v22 = 0.0;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v74 != v20)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
          v72[0] = _NSConcreteStackBlock;
          v72[1] = 3221225472;
          v72[2] = sub_100217BC8;
          v72[3] = &unk_1011AC860;
          v72[4] = v24;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v72);
          objc_msgSend(v24, "_maps_intrinsicContentSize");
          v27 = v26;
          v28 = v25;
          if (v21 < v25)
            v21 = v25;
          if (-[NSMutableArray count](v13, "count"))
          {
            -[MultilineStackView interItemHorizontalPadding](self, "interItemHorizontalPadding");
            v30 = v29;
          }
          else
          {
            v30 = 0.0;
          }
          if ((id)-[MultilineStackView horizontalArrangement](self, "horizontalArrangement") == (id)3)
            v31 = -[MultilineStackView _justifiedLayoutWouldCrushWhenAddingView:toRowViews:availableRowWidth:](self, "_justifiedLayoutWouldCrushWhenAddingView:toRowViews:availableRowWidth:", v24, v13, v9);
          else
            v31 = 0;
          v32 = v22 + v27 + v30;
          v33 = -[NSMutableArray count](v13, "count");
          if (v32 >= v9)
            v34 = 1;
          else
            v34 = v31;
          if (v33 && v34)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView rowHeightBlock](self, "rowHeightBlock"));

            if (v35)
            {
              v36 = (double (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue(-[MultilineStackView rowHeightBlock](self, "rowHeightBlock"));
              v21 = ((double (**)(_QWORD, NSMutableArray *, double))v36)[2](v36, v13, v21);

            }
            v65 = v65 + v21;
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView _appendRowViewWithViews:topAnchor:topInset:rowContentWidth:availableRowWidth:rowHeight:constraints:](self, "_appendRowViewWithViews:topAnchor:topInset:rowContentWidth:availableRowWidth:rowHeight:constraints:", v13, v14, v62, v16, v22, v9, v21));
            ++v19;
            v38 = -[NSMutableArray copy](v13, "copy");
            objc_msgSend(v61, "setObject:forKey:", v38, v37);

            -[NSMutableArray removeAllObjects](v13, "removeAllObjects");
            v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bottomAnchor"));

            -[MultilineStackView interItemVerticalPadding](self, "interItemVerticalPadding");
            v16 = v40;
            -[NSMutableArray addObject:](v13, "addObject:", v24);

            v14 = (void *)v39;
            v21 = v28;
            v22 = v27;
          }
          else
          {
            -[NSMutableArray addObject:](v13, "addObject:", v24);
            v22 = v32;
          }
        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
      }
      while (v18);
    }
    else
    {
      v19 = 0;
      v21 = 0.0;
      v22 = 0.0;
    }

    if (-[NSMutableArray count](v13, "count"))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView rowHeightBlock](self, "rowHeightBlock"));

      if (v43)
      {
        v44 = (double (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue(-[MultilineStackView rowHeightBlock](self, "rowHeightBlock"));
        v21 = ((double (**)(_QWORD, NSMutableArray *, double))v44)[2](v44, v13, v21);

      }
      v65 = v65 + v21;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView _appendRowViewWithViews:topAnchor:topInset:rowContentWidth:availableRowWidth:rowHeight:constraints:](self, "_appendRowViewWithViews:topAnchor:topInset:rowContentWidth:availableRowWidth:rowHeight:constraints:", v13, v14, v62, v16, v22, v9, v21));
      v46 = -[NSMutableArray copy](v13, "copy");
      objc_msgSend(v61, "setObject:forKey:", v46, v45);

      v47 = v62;
      ++v19;

    }
    else
    {
      v47 = v62;
    }
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v47);
    v48 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v60));
    v49 = self->_computedWidth;
    self->_computedWidth = v48;

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView customizationBlock](self, "customizationBlock"));
    if (v50)
    {
      obja = v19;
      v71 = 0u;
      v69 = 0u;
      v70 = 0u;
      v68 = 0u;
      v51 = v61;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v53; j = (char *)j + 1)
          {
            if (*(_QWORD *)v69 != v54)
              objc_enumerationMutation(v51);
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j)));
            v57 = objc_msgSend(v56, "count");
            v67[0] = _NSConcreteStackBlock;
            v67[1] = 3221225472;
            v67[2] = sub_100217BD0;
            v67[3] = &unk_1011AC8F8;
            v67[4] = self;
            v67[5] = v57;
            objc_msgSend(v56, "enumerateObjectsUsingBlock:", v67);

          }
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
        }
        while (v53);
      }

      v47 = v62;
      v19 = obja;
    }
    if (v19)
    {
      -[MultilineStackView interItemVerticalPadding](self, "interItemVerticalPadding");
      v59 = v65 + (double)(unint64_t)(v19 - 1) * v58;
    }
    else
    {
      v59 = v65;
    }
    -[MultilineStackView setCalculatedHeight:](self, "setCalculatedHeight:", v59);
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100217C38;
    v66[3] = &unk_1011AC860;
    v66[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v66);

  }
}

- (id)_appendRowViewWithViews:(id)a3 topAnchor:(id)a4 topInset:(double)a5 rowContentWidth:(double)a6 availableRowWidth:(double)a7 rowHeight:(double)a8 constraints:(id)a9
{
  id v16;
  id v17;
  id v18;
  UIView *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v16 = a3;
  v17 = a9;
  v18 = a4;
  v19 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MultilineStackView addSubview:](self, "addSubview:", v19);
  switch(-[MultilineStackView horizontalArrangement](self, "horizontalArrangement"))
  {
    case 0uLL:
      -[MultilineStackView _computeLeadingRowWithViews:rowView:constraints:](self, "_computeLeadingRowWithViews:rowView:constraints:", v16, v19, v17);
      break;
    case 1uLL:
      -[MultilineStackView _computeTrailingRowWithViews:rowView:constraints:](self, "_computeTrailingRowWithViews:rowView:constraints:", v16, v19, v17);
      break;
    case 2uLL:
      -[MultilineStackView _computeMaximumRowWithViews:interItemSpace:rowView:constraints:](self, "_computeMaximumRowWithViews:interItemSpace:rowView:constraints:", v16, v19, v17, (a7 - a6) / (double)((unint64_t)objc_msgSend(v16, "count") - 1));
      break;
    case 3uLL:
      v20 = (double)((unint64_t)objc_msgSend(v16, "count") - 1);
      -[MultilineStackView interItemHorizontalPadding](self, "interItemHorizontalPadding");
      -[MultilineStackView _computeJustifiedRowWithViews:itemWidth:rowView:constraints:](self, "_computeJustifiedRowWithViews:itemWidth:rowView:constraints:", v16, v19, v17, (a7 - v20 * v21) / (double)(unint64_t)objc_msgSend(v16, "count"));
      break;
    default:
      break;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v19, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView leadingAnchor](self, "leadingAnchor"));
  -[MultilineStackView edgeInsets](self, "edgeInsets");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, v24));
  objc_msgSend(v17, "addObject:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v19, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MultilineStackView trailingAnchor](self, "trailingAnchor"));
  -[MultilineStackView edgeInsets](self, "edgeInsets");
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, v28));
  objc_msgSend(v17, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v19, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v18, a5));

  objc_msgSend(v17, "addObject:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v19, "heightAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToConstant:", a8));
  objc_msgSend(v17, "addObject:", v33);

  return v19;
}

- (void)_computeLeadingRowWithViews:(id)a3 rowView:(id)a4 constraints:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BYTE *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  if (objc_msgSend(v25, "count"))
  {
    v11 = 0;
    v12 = 0.0;
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", v11));
      objc_msgSend(v8, "addSubview:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v10, v12));
      objc_msgSend(v9, "addObject:", v15);

      if (-[MultilineStackView verticalArrangement](self, "verticalArrangement"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerYAnchor"));
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
      }
      v18 = (void *)v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
      objc_msgSend(v9, "addObject:", v19);

      if (v11 == (char *)objc_msgSend(v25, "count") - 1)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:", v21));
        objc_msgSend(v9, "addObject:", v22);

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));

      -[MultilineStackView interItemHorizontalPadding](self, "interItemHorizontalPadding");
      v12 = v24;

      ++v11;
      v10 = v23;
    }
    while (v11 < objc_msgSend(v25, "count"));
  }
  else
  {
    v23 = v10;
  }

}

- (void)_computeTrailingRowWithViews:(id)a3 rowView:(id)a4 constraints:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  MultilineStackView *v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  _QWORD v24[5];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10021827C;
  v24[4] = sub_10021828C;
  v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reverseObjectEnumerator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100218294;
  v16[3] = &unk_1011AC920;
  v13 = v9;
  v17 = v13;
  v14 = v10;
  v21 = v24;
  v22 = v23;
  v18 = v14;
  v19 = self;
  v15 = v8;
  v20 = v15;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);

}

- (void)_computeMaximumRowWithViews:(id)a3 interItemSpace:(double)a4 rowView:(id)a5 constraints:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;

  v42 = a3;
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(v42, "count");
  v13 = v42;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "firstObject"));
    objc_msgSend(v10, "addSubview:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    objc_msgSend(v11, "addObject:", v17);

    if (-[MultilineStackView verticalArrangement](self, "verticalArrangement"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    }
    v20 = (void *)v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    objc_msgSend(v11, "addObject:", v21);

    v13 = v42;
  }
  v22 = objc_msgSend(v13, "count");
  v23 = v42;
  if ((unint64_t)v22 >= 2)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "lastObject"));
    objc_msgSend(v10, "addSubview:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    objc_msgSend(v11, "addObject:", v27);

    if (-[MultilineStackView verticalArrangement](self, "verticalArrangement"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "centerYAnchor"));
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    }
    v30 = (void *)v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    objc_msgSend(v11, "addObject:", v31);

    v23 = v42;
  }
  if ((unint64_t)objc_msgSend(v23, "count") >= 3)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "firstObject"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));

    if ((char *)objc_msgSend(v42, "count") - 3 <= (char *)0xFFFFFFFFFFFFFFFDLL)
    {
      v34 = 1;
      do
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", v34));
        objc_msgSend(v10, "addSubview:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v33, a4));
        objc_msgSend(v11, "addObject:", v37);

        if (-[MultilineStackView verticalArrangement](self, "verticalArrangement"))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "centerYAnchor"));
          v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
        }
        else
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
          v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
        }
        v40 = (void *)v39;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
        objc_msgSend(v11, "addObject:", v41);

        ++v34;
      }
      while ((char *)v34 < (char *)objc_msgSend(v42, "count") - 1);
    }

  }
}

- (void)_computeJustifiedRowWithViews:(id)a3 itemWidth:(double)a4 rowView:(id)a5 constraints:(id)a6
{
  id v10;
  id v11;
  void *v12;
  _BYTE *v13;
  double v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  MultilineStackView *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  id v34;

  v34 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  if (objc_msgSend(v34, "count"))
  {
    v13 = 0;
    v14 = 0.0;
    v15 = CFSTR("MapsWidthConstraint");
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", v13));
      objc_msgSend(v10, "addSubview:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v12, v14));
      objc_msgSend(v11, "addObject:", v18);

      if (-[MultilineStackView verticalArrangement](self, "verticalArrangement"))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
      }
      v21 = (void *)v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
      objc_msgSend(v11, "addObject:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "widthAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", a4));

      objc_msgSend(v24, "setIdentifier:", v15);
      objc_msgSend(v11, "addObject:", v24);
      if (v13 == (char *)objc_msgSend(v34, "count") - 1)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
        v33 = v12;
        v27 = v10;
        v28 = self;
        v29 = v15;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
        objc_msgSend(v11, "addObject:", v30);

        v15 = v29;
        self = v28;
        v10 = v27;
        v12 = v33;

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));

      -[MultilineStackView interItemHorizontalPadding](self, "interItemHorizontalPadding");
      v14 = v32;

      ++v13;
      v12 = v31;
    }
    while (v13 < objc_msgSend(v34, "count"));
  }
  else
  {
    v31 = v12;
  }

}

- (unint64_t)horizontalArrangement
{
  return self->_horizontalArrangement;
}

- (unint64_t)verticalArrangement
{
  return self->_verticalArrangement;
}

- (double)interItemHorizontalPadding
{
  return self->_interItemHorizontalPadding;
}

- (double)interItemVerticalPadding
{
  return self->_interItemVerticalPadding;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)customizationBlock
{
  return self->_customizationBlock;
}

- (void)setCustomizationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)rowHeightBlock
{
  return self->_rowHeightBlock;
}

- (void)setRowHeightBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)calculatedHeight
{
  return self->_calculatedHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rowHeightBlock, 0);
  objc_storeStrong(&self->_customizationBlock, 0);
  objc_storeStrong((id *)&self->_arrangedSubviews, 0);
  objc_storeStrong((id *)&self->_computedWidth, 0);
}

@end
