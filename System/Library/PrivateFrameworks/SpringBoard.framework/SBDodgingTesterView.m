@implementation SBDodgingTesterView

- (SBDodgingTesterView)initWithName:(id)a3 color:(id)a4 controller:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  SBDodgingTesterView *v15;
  SBDodgingTesterView *v16;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSMutableSet *ignoringItems;
  uint64_t v21;
  UILabel *titleLabel;
  UILabel *v23;
  void *v24;
  uint64_t v25;
  UILabel *resolvedValuesLabel;
  UILabel *v27;
  void *v28;
  uint64_t v29;
  UIView *resizeView;
  uint64_t v31;
  UITableView *otherItemsTable;
  uint64_t v33;
  UIPanGestureRecognizer *moveGesture;
  uint64_t v35;
  UIPanGestureRecognizer *resizeGesture;
  void *v37;
  void *v38;
  uint64_t v39;
  SBDodgingItem *item;
  objc_super v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v42.receiver = self;
  v42.super_class = (Class)SBDodgingTesterView;
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v15 = -[SBDodgingTesterView initWithFrame:](&v42, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v12, v13, v14);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_controller, v10);
    v17 = objc_msgSend(v8, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v17;

    objc_storeStrong((id *)&v16->_color, a4);
    v19 = objc_opt_new();
    ignoringItems = v16->_ignoringItems;
    v16->_ignoringItems = (NSMutableSet *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v11, v12, v13, v14);
    titleLabel = v16->_titleLabel;
    v16->_titleLabel = (UILabel *)v21;

    v23 = v16->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 22.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v23, "setFont:", v24);

    -[UILabel setTextAlignment:](v16->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v16->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[SBDodgingTesterView addSubview:](v16, "addSubview:", v16->_titleLabel);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v11, v12, v13, v14);
    resolvedValuesLabel = v16->_resolvedValuesLabel;
    v16->_resolvedValuesLabel = (UILabel *)v25;

    v27 = v16->_resolvedValuesLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 15.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v27, "setFont:", v28);

    -[UILabel setNumberOfLines:](v16->_resolvedValuesLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v16->_resolvedValuesLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[SBDodgingTesterView addSubview:](v16, "addSubview:", v16->_resolvedValuesLabel);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v11, v12, v13, v14);
    resizeView = v16->_resizeView;
    v16->_resizeView = (UIView *)v29;

    -[SBDodgingTesterView addSubview:](v16, "addSubview:", v16->_resizeView);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA58]), "initWithFrame:style:", 0, v11, v12, v13, v14);
    otherItemsTable = v16->_otherItemsTable;
    v16->_otherItemsTable = (UITableView *)v31;

    -[UITableView setDelegate:](v16->_otherItemsTable, "setDelegate:", v16);
    -[UITableView setDataSource:](v16->_otherItemsTable, "setDataSource:", v16);
    -[SBDodgingTesterView addSubview:](v16, "addSubview:", v16->_otherItemsTable);
    -[SBDodgingTesterView _setCornerRadius:](v16, "_setCornerRadius:", 7.0);
    -[SBDodgingTesterView setClipsToBounds:](v16, "setClipsToBounds:", 1);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", v16, sel__handleMoveGesture_);
    moveGesture = v16->_moveGesture;
    v16->_moveGesture = (UIPanGestureRecognizer *)v33;

    -[SBDodgingTesterView addGestureRecognizer:](v16, "addGestureRecognizer:", v16->_moveGesture);
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", v16, sel__handleResizeGesture_);
    resizeGesture = v16->_resizeGesture;
    v16->_resizeGesture = (UIPanGestureRecognizer *)v35;

    -[UIView addGestureRecognizer:](v16->_resizeView, "addGestureRecognizer:", v16->_resizeGesture);
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v16, sel__handleDeleteGesture_);
    -[SBDodgingTesterView addGestureRecognizer:](v16, "addGestureRecognizer:", v37);
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v16, sel__handleChangeAnchorGesture_);
    objc_msgSend(v38, "setNumberOfTapsRequired:", 2);
    -[SBDodgingTesterView addGestureRecognizer:](v16, "addGestureRecognizer:", v38);
    v16->_preferredSize = (CGSize)xmmword_1D0E8A030;
    v16->_preferredCenter = (CGPoint)*MEMORY[0x1E0C9D538];
    objc_msgSend(v10, "addItemWithIdentifier:view:initialCenter:initialSize:delegate:", v8, v16, v16, 10.0, -250.0, v16->_preferredSize.width, v16->_preferredSize.height);
    v39 = objc_claimAutoreleasedReturnValue();
    item = v16->_item;
    v16->_item = (SBDodgingItem *)v39;

  }
  return v16;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_otherIdentifiers, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ident"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("ident"));
  -[NSArray objectAtIndex:](self->_otherIdentifiers, "objectAtIndex:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  if (-[NSMutableSet containsObject:](self->_ignoringItems, "containsObject:", v8))
    v11 = 3;
  else
    v11 = 0;
  objc_msgSend(v7, "setAccessoryType:", v11);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSArray *otherIdentifiers;
  uint64_t v9;
  int v10;
  NSMutableSet *ignoringItems;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  otherIdentifiers = self->_otherIdentifiers;
  v9 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](otherIdentifiers, "objectAtIndex:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[NSMutableSet containsObject:](self->_ignoringItems, "containsObject:");
  ignoringItems = self->_ignoringItems;
  if (v10)
    -[NSMutableSet removeObject:](ignoringItems, "removeObject:", v13);
  else
    -[NSMutableSet addObject:](ignoringItems, "addObject:", v13);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadSections:withRowAnimation:", v12, 100);

  -[SBDodgingItem setNeedsUpdateAnimated:](self->_item, "setNeedsUpdateAnimated:", 1);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *resolvedValuesLabel;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UILabel *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  UITableView *otherItemsTable;
  double v32;
  double v33;
  double v34;
  UILabel *titleLabel;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  UILabel *v40;
  void *v41;
  void *v42;
  void *v43;
  UIView *resizeView;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  UIColor *v58;

  -[SBDodgingTesterView _updateResolvedValuesLabel](self, "_updateResolvedValuesLabel");
  -[SBDodgingTesterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v3, v5);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, 10.0, v4, v7);
  resolvedValuesLabel = self->_resolvedValuesLabel;
  -[UILabel bounds](self->_titleLabel, "bounds");
  v10 = v6 - v9;
  -[UILabel bounds](self->_titleLabel, "bounds");
  -[UILabel sizeThatFits:](resolvedValuesLabel, "sizeThatFits:", v4 + -10.0, v10 - v11 + -15.0);
  v13 = v12;
  v14 = self->_resolvedValuesLabel;
  -[UILabel bounds](self->_titleLabel, "bounds");
  v16 = v15;
  -[UILabel bounds](self->_titleLabel, "bounds");
  -[UILabel setFrame:](v14, "setFrame:", 5.0, v16 + v17 + 15.0, v4 + -10.0, v13);
  switch(self->_corner)
  {
    case 0uLL:
      -[UIView setFrame:](self->_resizeView, "setFrame:", v4 + -30.0, v6 + -30.0, 30.0, 30.0);
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CEA390];
      v20 = 24.0;
      goto LABEL_5;
    case 1uLL:
      -[UIView setFrame:](self->_resizeView, "setFrame:", 0.0, v6 + -30.0, 30.0, 30.0);
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CEA390];
      v22 = 24.0;
      goto LABEL_7;
    case 2uLL:
      -[UIView setFrame:](self->_resizeView, "setFrame:", v4 + -30.0, 0.0, 30.0, 30.0);
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CEA390];
      v20 = 0.0;
LABEL_5:
      objc_msgSend(v19, "bezierPathWithRect:", 0.0, v20, 30.0, 6.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CEA390];
      v25 = 24.0;
      goto LABEL_8;
    case 3uLL:
      -[UIView setFrame:](self->_resizeView, "setFrame:", 0.0, 0.0, 30.0, 30.0);
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CEA390];
      v22 = 0.0;
LABEL_7:
      objc_msgSend(v21, "bezierPathWithRect:", 0.0, v22, 30.0, 6.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CEA390];
      v25 = 0.0;
LABEL_8:
      objc_msgSend(v24, "bezierPathWithRect:", v25, 0.0, 6.0, 30.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "appendPath:", v26);

      v27 = objc_retainAutorelease(v23);
      objc_msgSend(v18, "setPath:", objc_msgSend(v27, "CGPath"));
      -[UIView layer](self->_resizeView, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setMask:", v18);

      break;
    default:
      break;
  }
  -[UITableView sizeThatFits:](self->_otherItemsTable, "sizeThatFits:", v4, v6);
  v30 = v29;
  otherItemsTable = self->_otherItemsTable;
  -[UILabel frame](self->_resolvedValuesLabel, "frame");
  v33 = v32;
  -[UILabel frame](self->_resolvedValuesLabel, "frame");
  -[UITableView setFrame:](otherItemsTable, "setFrame:", 0.0, v33 + v34 + 5.0, v4, v30);
  titleLabel = self->_titleLabel;
  v36 = (void *)MEMORY[0x1E0CEA478];
  v58 = self->_color;
  objc_msgSend(v36, "blackColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "colorWithAlphaComponent:", 0.15);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor _colorBlendedWithColor:](v58, "_colorBlendedWithColor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](titleLabel, "setTextColor:", v39);

  v40 = self->_resolvedValuesLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "colorWithAlphaComponent:", 0.65);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor _colorBlendedWithColor:](v58, "_colorBlendedWithColor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v40, "setTextColor:", v43);

  resizeView = self->_resizeView;
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "colorWithAlphaComponent:", 0.15);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor _colorBlendedWithColor:](v58, "_colorBlendedWithColor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](resizeView, "setBackgroundColor:", v47);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "colorWithAlphaComponent:", 0.85);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor _colorBlendedWithColor:](v58, "_colorBlendedWithColor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDodgingTesterView setBackgroundColor:](self, "setBackgroundColor:", v50);

  -[UILabel setText:](self->_titleLabel, "setText:", self->_name);
  -[SBDodgingTesterView layer](self, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (self->_stashed)
    v53 = 5.0;
  else
    v53 = 0.0;
  objc_msgSend(v51, "setBorderWidth:", v53);

  -[SBDodgingTesterView layer](self, "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "colorWithAlphaComponent:", 0.25);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor _colorBlendedWithColor:](v58, "_colorBlendedWithColor:", v56);
  v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v54, "setBorderColor:", objc_msgSend(v57, "CGColor"));

  -[UIView setHidden:](self->_resizeView, "setHidden:", self->_stashed);
}

- (void)_updateResolvedValuesLabel
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = (id)objc_opt_new();
  x = self->_preferredCenter.x;
  y = self->_preferredCenter.y;
  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  -[SBDodgingTesterView bounds](self, "bounds");
  v8 = v7;
  -[SBDodgingTesterView bounds](self, "bounds");
  objc_msgSend(v10, "appendFormat:", CFSTR("preferredCenter: %0.1f,%0.1f\npreferredSize: %0.1f,%0.1f\nsize: %0.1f,%0.1f"), *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height, v8, v9);
  objc_msgSend(v10, "appendFormat:", CFSTR("\n\ndouble tap to stash; hold to remove"));
  objc_msgSend(v10, "appendFormat:", CFSTR("\nignore these:"));
  -[UILabel setText:](self->_resolvedValuesLabel, "setText:", v10);

}

- (void)_handleMoveGesture:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  SBDodgingItem *item;
  uint64_t v25;
  _QWORD v26[5];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[SBDodgingItem center](self->_item, "center");
    self->_initialMoveCenter.x = v5;
    self->_initialMoveCenter.y = v6;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __42__SBDodgingTesterView__handleMoveGesture___block_invoke;
    v26[3] = &unk_1E8E9DED8;
    v26[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 4, v26, 0, 0.25, 0.0);
  }
  objc_msgSend(v4, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocityInView:", v8);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v4, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v14);
  v16 = v15;
  v18 = v17;

  v19 = v16 + self->_initialMoveCenter.x;
  v20 = v18 + self->_initialMoveCenter.y;
  v21 = objc_msgSend(v4, "state");
  v22 = v19 + v10 * 0.1;
  v23 = v20 + v12 * 0.1;
  if (v21 != 3)
  {
    v22 = v19;
    v23 = v20;
  }
  self->_preferredCenter.x = v22;
  self->_preferredCenter.y = v23;
  item = self->_item;
  v25 = objc_msgSend(v4, "state");

  -[SBDodgingItem setNeedsUpdateAnimated:](item, "setNeedsUpdateAnimated:", v25 == 3);
}

uint64_t __42__SBDodgingTesterView__handleMoveGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", 0.0);
}

- (void)_handleResizeGesture:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  SBDodgingItem *item;
  uint64_t v20;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  -[UIView frame](self->_resizeView, "frame");
  UIRectGetCenter();
  v10 = v9;
  v12 = v11;
  -[SBDodgingTesterView frame](self, "frame");
  v15 = v6 - v10;
  v16 = v8 - v12;
  switch(self->_corner)
  {
    case 0uLL:
      v13 = v15 + v13;
      v14 = v16 + v14;
      break;
    case 1uLL:
      v13 = v13 - v15;
      v14 = v16 + v14;
      break;
    case 2uLL:
      v13 = v15 + v13;
      v14 = v14 - v16;
      break;
    case 3uLL:
      v13 = v13 - v15;
      v14 = v14 - v16;
      break;
    default:
      break;
  }
  self->_preferredSize.width = v13;
  self->_preferredSize.height = v14;
  UIRectGetCenter();
  self->_preferredCenter.x = v17;
  self->_preferredCenter.y = v18;
  item = self->_item;
  v20 = objc_msgSend(v4, "state");

  -[SBDodgingItem setNeedsUpdateAnimated:](item, "setNeedsUpdateAnimated:", v20 == 3);
}

- (void)_handleDeleteGesture:(id)a3
{
  id v4;
  SBDodgingItem *item;

  v4 = -[SBDodgingItem invalidate](self->_item, "invalidate", a3);
  item = self->_item;
  self->_item = 0;

}

- (void)_handleChangeAnchorGesture:(id)a3
{
  self->_stashed ^= 1u;
  -[SBDodgingTesterView setNeedsLayout](self, "setNeedsLayout", a3);
  -[SBDodgingItem setNeedsUpdateAnimated:](self->_item, "setNeedsUpdateAnimated:", 1);
}

- (id)dodgingResolver:(id)a3 preferenceForDodgingItem:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  SBDodgingItemPreference *v7;
  double x;
  uint64_t v9;
  _BOOL8 v12;

  v5 = -[UIPanGestureRecognizer state](self->_moveGesture, "state", a3, a4);
  v6 = -[UIPanGestureRecognizer state](self->_resizeGesture, "state");
  v7 = [SBDodgingItemPreference alloc];
  if (self->_stashed)
  {
    x = 0.0;
    v9 = 2;
  }
  else
  {
    x = self->_preferredCenter.x;
    v9 = 3;
  }
  v12 = (unint64_t)(v5 - 1) < 2 || v6 == 1 || v6 == 2;
  return -[SBDodgingItemPreference initWithPreferredSize:preferredCenter:updateInteractively:dodgingAxisMask:minimumSize:canBePositionedOutsideContainerBounds:excludedDodgingIdentifiers:](v7, "initWithPreferredSize:preferredCenter:updateInteractively:dodgingAxisMask:minimumSize:canBePositionedOutsideContainerBounds:excludedDodgingIdentifiers:", v12, v9, self->_stashed, self->_ignoringItems, self->_preferredSize.width, self->_preferredSize.height, x, self->_preferredCenter.y, 100.0, 100.0);
}

- (void)dodgingResolver:(id)a3 dodgingItemDidChange:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v16;
  UITableView *otherItemsTable;
  void *v18;
  id obj;

  v5 = a4;
  -[SBDodgingTesterView setNeedsLayout](self, "setNeedsLayout");
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "containerSize");
  SBRectWithSize();
  UIRectGetCenter();
  if (v7 < v10 && v9 < v11)
  {
    v16 = 0;
    goto LABEL_21;
  }
  if (v7 >= v10 && v9 < v11)
  {
    v16 = 1;
    goto LABEL_21;
  }
  if (v7 < v10 && v9 >= v11)
  {
    v16 = 2;
LABEL_21:
    self->_corner = v16;
    goto LABEL_22;
  }
  if (v7 >= v10 && v9 >= v11)
  {
    v16 = 3;
    goto LABEL_21;
  }
LABEL_22:
  objc_msgSend(v5, "otherDodgingIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();

  if ((BSEqualArrays() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_otherIdentifiers, obj);
    otherItemsTable = self->_otherItemsTable;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView reloadSections:withRowAnimation:](otherItemsTable, "reloadSections:withRowAnimation:", v18, 100);

    -[SBDodgingTesterView setNeedsLayout](self, "setNeedsLayout");
  }
  if (!-[UIPanGestureRecognizer state](self->_moveGesture, "state"))
    -[SBDodgingTesterView layoutIfNeeded](self, "layoutIfNeeded");

}

- (void)dodgingResolver:(id)a3 dodgingItemDidSettle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v9[5];

  v5 = -[UIPanGestureRecognizer state](self->_moveGesture, "state", a3, a4);
  v6 = -[UIPanGestureRecognizer state](self->_resizeGesture, "state");
  if ((unint64_t)(v5 - 1) >= 2 && v6 != 1 && v6 != 2)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__SBDodgingTesterView_dodgingResolver_dodgingItemDidSettle___block_invoke;
    v9[3] = &unk_1E8E9DED8;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 4, v9, 0, 0.25, 0.0);
  }
}

uint64_t __60__SBDodgingTesterView_dodgingResolver_dodgingItemDidSettle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", 1.0);
}

- (SBDodgingItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (SBDodgingResolverViewController)controller
{
  return (SBDodgingResolverViewController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (CGPoint)preferredCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_preferredCenter.x;
  y = self->_preferredCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreferredCenter:(CGPoint)a3
{
  self->_preferredCenter = a3;
}

- (NSMutableSet)ignoringItems
{
  return self->_ignoringItems;
}

- (void)setIgnoringItems:(id)a3
{
  objc_storeStrong((id *)&self->_ignoringItems, a3);
}

- (unint64_t)corner
{
  return self->_corner;
}

- (void)setCorner:(unint64_t)a3
{
  self->_corner = a3;
}

- (BOOL)stashed
{
  return self->_stashed;
}

- (void)setStashed:(BOOL)a3
{
  self->_stashed = a3;
}

- (UIPanGestureRecognizer)moveGesture
{
  return self->_moveGesture;
}

- (void)setMoveGesture:(id)a3
{
  objc_storeStrong((id *)&self->_moveGesture, a3);
}

- (CGPoint)initialMoveCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialMoveCenter.x;
  y = self->_initialMoveCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialMoveCenter:(CGPoint)a3
{
  self->_initialMoveCenter = a3;
}

- (UIPanGestureRecognizer)resizeGesture
{
  return self->_resizeGesture;
}

- (void)setResizeGesture:(id)a3
{
  objc_storeStrong((id *)&self->_resizeGesture, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)resolvedValuesLabel
{
  return self->_resolvedValuesLabel;
}

- (void)setResolvedValuesLabel:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedValuesLabel, a3);
}

- (UIView)resizeView
{
  return self->_resizeView;
}

- (void)setResizeView:(id)a3
{
  objc_storeStrong((id *)&self->_resizeView, a3);
}

- (NSArray)otherIdentifiers
{
  return self->_otherIdentifiers;
}

- (void)setOtherIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_otherIdentifiers, a3);
}

- (UITableView)otherItemsTable
{
  return self->_otherItemsTable;
}

- (void)setOtherItemsTable:(id)a3
{
  objc_storeStrong((id *)&self->_otherItemsTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherItemsTable, 0);
  objc_storeStrong((id *)&self->_otherIdentifiers, 0);
  objc_storeStrong((id *)&self->_resizeView, 0);
  objc_storeStrong((id *)&self->_resolvedValuesLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_resizeGesture, 0);
  objc_storeStrong((id *)&self->_moveGesture, 0);
  objc_storeStrong((id *)&self->_ignoringItems, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
