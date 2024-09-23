@implementation _UIButtonBarSpacerLayout

- (void)_configure
{
  UIView *spacer;
  UIView *v4;
  UIView *v5;
  id *p_equalSize;
  BOOL v7;
  double v8;
  double v9;
  NSLayoutConstraint *requestedSize;
  double v11;
  NSLayoutConstraint *minimumSize;
  uint64_t v13;
  id v14;
  int v15;
  uint64_t v16;
  id v17;
  double v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *v21;
  double v22;
  id v23;

  spacer = self->_spacer;
  if (!spacer)
  {
    v4 = objc_alloc_init(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = self->_spacer;
    self->_spacer = v4;

    spacer = self->_spacer;
  }
  -[UIView widthAnchor](spacer, "widthAnchor");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_flexible)
  {
    p_equalSize = (id *)&self->_equalSize;
    if (self->_equalSize)
    {
      v7 = 0;
      goto LABEL_15;
    }
    -[_UIButtonBarLayoutMetricsData flexibleSpaceGuide](self->super._layoutMetrics, "flexibleSpaceGuide");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *p_equalSize;
    *p_equalSize = (id)v16;

    v7 = 0;
    v15 = 1143111680;
  }
  else
  {
    -[UIBarButtonItem _width](self->_item, "_width");
    if (v8 >= 0.0)
      v9 = v8;
    else
      v9 = 0.0;
    v7 = v9 <= 0.0;
    p_equalSize = (id *)&self->_requestedSize;
    requestedSize = self->_requestedSize;
    if (requestedSize)
    {
      -[NSLayoutConstraint constant](requestedSize, "constant");
      if (v11 != v9)
      {
        -[NSLayoutConstraint setActive:](self->_minimumSize, "setActive:", 0);
        minimumSize = self->_minimumSize;
        self->_minimumSize = 0;

      }
    }
    objc_msgSend(*p_equalSize, "setActive:", 0);
    objc_msgSend(v23, "constraintEqualToConstant:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *p_equalSize;
    *p_equalSize = (id)v13;
    v15 = 1143930880;
  }

  LODWORD(v18) = v15;
  objc_msgSend(*p_equalSize, "setPriority:", v18);
LABEL_15:
  if (!self->_minimumSize)
  {
    -[_UIButtonBarLayoutMetricsData minimumSpaceGuide](self->super._layoutMetrics, "minimumSpaceGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v23, "constraintEqualToAnchor:multiplier:", v19, 1.0);
    else
      objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:multiplier:", v19, 1.0);
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v21 = self->_minimumSize;
    self->_minimumSize = v20;

    LODWORD(v22) = 1144750080;
    -[NSLayoutConstraint setPriority:](self->_minimumSize, "setPriority:", v22);
  }
  -[NSLayoutConstraint setIdentifier:](self->_requestedSize, "setIdentifier:", CFSTR("UIButtonBar.requestedSize"));
  -[NSLayoutConstraint setIdentifier:](self->_equalSize, "setIdentifier:", CFSTR("UIButtonBar.equalSize"));
  -[NSLayoutConstraint setIdentifier:](self->_minimumSize, "setIdentifier:", CFSTR("UIButtonBar.minimumSize"));

}

+ (int64_t)typeOfSpacerBetweenLayout:(id)a3 andLayout:(id)a4
{
  return _UIButtonBarLayoutSpacerTypeForLayouts(a3, a4);
}

- (double)minimumLayoutWidthGivenMinimumSpaceWidth:(double)a3
{
  UIBarButtonItem *item;
  double result;

  item = self->_item;
  if (item)
    -[UIBarButtonItem _width](item, "_width");
  else
    result = 0.0;
  if (result < a3)
    return a3;
  return result;
}

- (void)_addLayoutViews:(id)a3
{
  objc_msgSend(a3, "addObject:", self->_spacer);
}

- (void)_addConstraintsToActivate:(id)a3 toDeactivate:(id)a4
{
  id v6;
  UIBarButtonItem *item;
  BOOL v8;
  void *v9;
  NSLayoutConstraint *requestedSize;
  void *v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  v6 = a4;
  item = self->_item;
  if (!self->_flexible)
  {
    -[UIBarButtonItem _width](item, "_width");
    if (v12 >= 0.0)
      v13 = v12;
    else
      v13 = 0.0;
    -[NSLayoutConstraint setConstant:](self->_requestedSize, "setConstant:", v13);
    requestedSize = self->_requestedSize;
    if (v13 <= 0.0)
      v11 = v6;
    else
      v11 = v14;
    goto LABEL_10;
  }
  v8 = -[UIBarButtonItem _wantsThreeUp](item, "_wantsThreeUp");
  v9 = v14;
  if (!v8)
  {
    requestedSize = self->_equalSize;
    v11 = v14;
LABEL_10:
    objc_msgSend(v11, "addObject:", requestedSize);
    v9 = v14;
  }
  objc_msgSend(v9, "addObject:", self->_minimumSize);

}

+ (id)spacerForLayoutMetrics:(id)a3 betweenLayout:(id)a4 andLayout:(id)a5
{
  id v8;
  _QWORD *v9;

  v8 = a3;
  if (_UIButtonBarLayoutSpacerTypeForLayouts(a4, a5))
  {
    v9 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithLayoutMetrics:barButtonItem:", v8, 0);
    v9[9] = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_UIButtonBarSpacerLayout)initWithLayoutMetrics:(id)a3 barButtonItem:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UIButtonBarSpacerLayout *v10;
  _UIButtonBarSpacerLayout *v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "isSpaceItem") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarLayout.m"), 260, CFSTR("Spacer layouts can only manage nil bar button items, or a system item that is a spacer type"));

  }
  v14.receiver = self;
  v14.super_class = (Class)_UIButtonBarSpacerLayout;
  v10 = -[_UIButtonBarLayout initWithLayoutMetrics:](&v14, sel_initWithLayoutMetrics_, v7);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_item, a4);
    v11->_flexible = objc_msgSend(v9, "systemItem") == 5;
    v11->_spacerType = 1;
  }

  return v11;
}

- (BOOL)suppressSpacing
{
  return 1;
}

+ (id)_updateSpacer:(id)a3 layoutMetrics:(id)a4 spacerType:(int64_t)a5
{
  _QWORD *v8;
  _QWORD *v9;
  id v10;

  v8 = a3;
  v9 = v8;
  if (!v8)
  {
    v10 = a4;
    v9 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithLayoutMetrics:", v10);

  }
  v9[9] = a5;

  return v9;
}

- (_UIButtonBarSpacerLayout)initWithLayoutMetrics:(id)a3
{
  return -[_UIButtonBarSpacerLayout initWithLayoutMetrics:barButtonItem:](self, "initWithLayoutMetrics:barButtonItem:", a3, 0);
}

- (BOOL)isSpaceLayout
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_equalSize, 0);
  objc_storeStrong((id *)&self->_minimumSize, 0);
  objc_storeStrong((id *)&self->_requestedSize, 0);
  objc_storeStrong((id *)&self->_spacer, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (id)barButtonItem
{
  return self->_item;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIButtonBarSpacerLayout;
  -[_UIButtonBarLayout description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_flexible)
    v5 = CFSTR(" flexibleSpace");
  else
    v5 = CFSTR(" space");
  objc_msgSend(v4, "appendString:", v5);
  if (self->_item)
    objc_msgSend(v4, "appendFormat:", CFSTR(" item=%p"), self->_item);
  objc_msgSend(v4, "appendFormat:", CFSTR(" view=%p requestedSize=%p equalSize=%p minimumSize=%p"), self->_spacer, self->_requestedSize, self->_equalSize, self->_minimumSize);
  return v4;
}

- (int64_t)spacerType
{
  return self->_spacerType;
}

@end
