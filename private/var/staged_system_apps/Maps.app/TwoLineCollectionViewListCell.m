@implementation TwoLineCollectionViewListCell

- (PersonalizedItem)personalizedItemForQuickActionMenu
{
  TwoLineCollectionViewListCell *v2;
  TwoLinesContentViewModel *v3;
  TwoLinesContentViewModel *v4;
  uint64_t (**v5)(_QWORD);

  v2 = self;
  v3 = -[TwoLineCollectionViewListCell viewModel](v2, "viewModel");
  v4 = v3;
  if (v3)
  {
    v5 = (uint64_t (**)(_QWORD))-[TwoLinesContentViewModel personalizedItemForQuickActionMenuCreator](v3, "personalizedItemForQuickActionMenuCreator");
    swift_unknownObjectRelease(v4);
    if (v5)
    {
      v4 = (TwoLinesContentViewModel *)(id)v5[2](v5);
      _Block_release(v5);
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

+ (double)cellHeight
{
  return UITableViewAutomaticDimension;
}

+ (double)estimatedCellHeight
{
  double result;

  +[UIFont _maps_bodyScaledValueForValue:](UIFont, "_maps_bodyScaledValueForValue:", 72.0);
  return result;
}

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

+ (BOOL)hasClearBackground
{
  return 1;
}

- (TwoLineCollectionViewListCell)initWithFrame:(CGRect)a3
{
  TwoLineCollectionViewListCell *v3;
  TwoLineCollectionViewListCell *v4;
  void *v5;
  id v6;
  TwoLinesContentView *v7;
  TwoLinesContentView *twoLinesContentView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *leadingContraint;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[4];

  v31.receiver = self;
  v31.super_class = (Class)TwoLineCollectionViewListCell;
  v3 = -[TwoLineCollectionViewListCell initWithFrame:](&v31, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend((id)objc_opt_class(v3), "hasClearBackground"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[TwoLineCollectionViewListCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

      v6 = objc_alloc_init((Class)UIView);
      -[TwoLineCollectionViewListCell setBackgroundView:](v4, "setBackgroundView:", v6);

    }
    v7 = -[TwoLinesContentView initWithFrame:]([TwoLinesContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    twoLinesContentView = v4->_twoLinesContentView;
    v4->_twoLinesContentView = v7;

    -[TwoLinesContentView setTranslatesAutoresizingMaskIntoConstraints:](v4->_twoLinesContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLineCollectionViewListCell contentView](v4, "contentView"));
    objc_msgSend(v9, "addSubview:", v4->_twoLinesContentView);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView leadingAnchor](v4->_twoLinesContentView, "leadingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLineCollectionViewListCell contentView](v4, "contentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    -[TwoLineCollectionViewListCell leadingPadding](v4, "leadingPadding");
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12));
    leadingContraint = v4->_leadingContraint;
    v4->_leadingContraint = (NSLayoutConstraint *)v13;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView topAnchor](v4->_twoLinesContentView, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLineCollectionViewListCell contentView](v4, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
    v32[0] = v27;
    v32[1] = v4->_leadingContraint;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView trailingAnchor](v4->_twoLinesContentView, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLineCollectionViewListCell contentView](v4, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -10.0));
    v32[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView bottomAnchor](v4->_twoLinesContentView, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLineCollectionViewListCell contentView](v4, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
    LODWORD(v22) = 1144750080;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:priority:", v21, 0.0, v22));
    v32[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    if (sub_1002A8AA0(v4) == 5)
      -[TwoLineCollectionViewListCell _maps_setCollectionViewCellBackgroundConfiguration](v4, "_maps_setCollectionViewCellBackgroundConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v25, "addObserver:selector:name:object:", v4, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  return sub_1002A8AA0(self) == 5;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TwoLineCollectionViewListCell;
  -[TwoLineCollectionViewListCell setSelected:](&v5, "setSelected:");
  -[TwoLinesContentView setIsParentCellSelected:](self->_twoLinesContentView, "setIsParentCellSelected:", v3);
}

- (double)leadingPadding
{
  double result;

  sub_1002A8AA0(self);
  -[TwoLineCollectionViewListCell setLeadingSpace:](self, "setLeadingSpace:", 16.0);
  -[TwoLineCollectionViewListCell leadingSpace](self, "leadingSpace");
  return result;
}

- (void)updateLeadingSpace:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_leadingSpace != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLineCollectionViewListCell leadingContraint](self, "leadingContraint"));
    objc_msgSend(v5, "setActive:", 0);

    self->_leadingSpace = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView leadingAnchor](self->_twoLinesContentView, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLineCollectionViewListCell contentView](self, "contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, a3));
    -[TwoLineCollectionViewListCell setLeadingContraint:](self, "setLeadingContraint:", v9);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[TwoLineCollectionViewListCell leadingContraint](self, "leadingContraint"));
    objc_msgSend(v10, "setActive:", 1);

  }
}

- (void)setViewModel:(id)a3
{
  TwoLinesContentViewModel *v5;
  TwoLinesContentViewModel *viewModel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TwoLinesContentViewModel *v11;

  v5 = (TwoLinesContentViewModel *)a3;
  viewModel = self->_viewModel;
  v11 = v5;
  if (viewModel != v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel observers](viewModel, "observers"));
    objc_msgSend(v7, "unregisterObserver:", self);

    objc_storeStrong((id *)&self->_viewModel, a3);
    -[TwoLinesContentView setViewModel:](self->_twoLinesContentView, "setViewModel:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel observers](self->_viewModel, "observers"));
    objc_msgSend(v8, "registerObserver:", self);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView viewModel](self->_twoLinesContentView, "viewModel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "axIdentifier"));
    -[TwoLineCollectionViewListCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v10);

    -[TwoLineCollectionViewListCell _updateAccessories](self, "_updateAccessories");
  }

}

- (void)_updateAccessories
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  TwoLineCollectionViewListCell *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel customAccessoryView](self->_viewModel, "customAccessoryView"));
  if (!v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel cellAccessories](self->_viewModel, "cellAccessories"));
    if (!objc_msgSend(v6, "count"))
    {
      -[TwoLineCollectionViewListCell setAccessories:](self, "setAccessories:", &__NSArray0__struct);
      goto LABEL_13;
    }
    v13 = objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel cellAccessories](self->_viewModel, "cellAccessories"));
    v7 = (void *)v13;
    if (v13)
      v12 = (void *)v13;
    else
      v12 = &__NSArray0__struct;
    v11 = self;
    goto LABEL_10;
  }
  v4 = objc_alloc((Class)UICellAccessoryCustomView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel customAccessoryView](self->_viewModel, "customAccessoryView"));
  v6 = objc_msgSend(v4, "initWithCustomView:placement:", v5, 1);

  objc_msgSend(v6, "setReservedLayoutWidth:", 0.0);
  v14 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLineCollectionViewListCell accessories](self, "accessories"));
  if (v8 == v7)
  {

    goto LABEL_12;
  }
  v9 = v8;
  v10 = objc_msgSend(v8, "isEqual:", v7);

  if ((v10 & 1) == 0)
  {
    v11 = self;
    v12 = v7;
LABEL_10:
    -[TwoLineCollectionViewListCell setAccessories:](v11, "setAccessories:", v12);
  }
LABEL_12:

LABEL_13:
}

- (TwoLinesContentViewModel)viewModel
{
  return self->_viewModel;
}

- (TwoLinesContentView)twoLinesContentView
{
  return self->_twoLinesContentView;
}

- (void)setTwoLinesContentView:(id)a3
{
  objc_storeStrong((id *)&self->_twoLinesContentView, a3);
}

- (NSLayoutConstraint)leadingContraint
{
  return self->_leadingContraint;
}

- (void)setLeadingContraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingContraint, a3);
}

- (double)leadingSpace
{
  return self->_leadingSpace;
}

- (void)setLeadingSpace:(double)a3
{
  self->_leadingSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingContraint, 0);
  objc_storeStrong((id *)&self->_twoLinesContentView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
