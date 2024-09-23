@implementation SearchHomeTipCollectionViewCell

- (SearchHomeTipCollectionViewCell)initWithFrame:(CGRect)a3
{
  SearchHomeTipCollectionViewCell *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SearchHomeTipView *v10;
  void *v11;
  SearchHomeTipView *v12;
  SearchHomeTipView *searchHomeTipView;
  void *v14;
  SearchHomeTipView *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SearchHomeTipCollectionViewCell;
  v3 = -[SearchHomeTipCollectionViewCell initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class(SearchHomeTipCollectionViewCell);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[SearchHomeTipCollectionViewCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[SearchHomeTipCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    v10 = [SearchHomeTipView alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v11, "bounds");
    v12 = -[SearchHomeTipView initWithFrame:](v10, "initWithFrame:");
    searchHomeTipView = v3->_searchHomeTipView;
    v3->_searchHomeTipView = v12;

    -[SearchHomeTipView setTranslatesAutoresizingMaskIntoConstraints:](v3->_searchHomeTipView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v14, "addSubview:", v3->_searchHomeTipView);

    v15 = v3->_searchHomeTipView;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipCollectionViewCell contentView](v3, "contentView"));
    LODWORD(v17) = 1148846080;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeTipView _maps_constraintsEqualToEdgesOfView:insets:priority:](v15, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v16, 0.0, 10.0, 0.0, 10.0, v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

  }
  return v3;
}

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (BOOL)canBecomeFirstResponder
{
  return sub_1002A8AA0(self) == 5;
}

- (SearchHomeTipView)searchHomeTipView
{
  return self->_searchHomeTipView;
}

- (void)setSearchHomeTipView:(id)a3
{
  objc_storeStrong((id *)&self->_searchHomeTipView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchHomeTipView, 0);
}

@end
