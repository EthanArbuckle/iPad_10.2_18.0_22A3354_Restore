@implementation TransitRoutePickingNoMoreRoutesCell

- (TransitRoutePickingNoMoreRoutesCell)init
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  TransitRoutePickingNoMoreRoutesCell *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[RoutePickingCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, v5);

  return v6;
}

- (void)_createSubviews
{
  void *v3;
  void *v4;
  _MKUILabel *v5;
  _MKUILabel *noMoreRoutesLabel;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TransitRoutePickingNoMoreRoutesCell;
  -[RoutePickingCell _createSubviews](&v10, "_createSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TransitRoutePicking_NoMoreRoutes"), CFSTR("localized string not found"), 0));

  v5 = (_MKUILabel *)objc_msgSend(objc_alloc((Class)_MKUILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  noMoreRoutesLabel = self->_noMoreRoutesLabel;
  self->_noMoreRoutesLabel = v5;

  -[_MKUILabel setText:](self->_noMoreRoutesLabel, "setText:", v4);
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_noMoreRoutesLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRoutePickingNoMoreRoutesCell contentView](self, "contentView"));
  objc_msgSend(v7, "addSubview:", self->_noMoreRoutesLabel);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleSubhead, 0));
  -[_MKUILabel setFont:](self->_noMoreRoutesLabel, "setFont:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[_MKUILabel setTextColor:](self->_noMoreRoutesLabel, "setTextColor:", v9);

}

- (id)_autolayoutConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *labelToTopConstraint;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TransitRoutePickingNoMoreRoutesCell;
  v3 = -[RoutePickingCell _autolayoutConstraints](&v20, "_autolayoutConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel leadingAnchor](self->_noMoreRoutesLabel, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRoutePickingNoMoreRoutesCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  objc_msgSend(v4, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRoutePickingNoMoreRoutesCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel lastBaselineAnchor](self->_noMoreRoutesLabel, "lastBaselineAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 8.0));
  objc_msgSend(v4, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel firstBaselineAnchor](self->_noMoreRoutesLabel, "firstBaselineAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRoutePickingNoMoreRoutesCell contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  labelToTopConstraint = self->_labelToTopConstraint;
  self->_labelToTopConstraint = v16;

  objc_msgSend(v4, "addObject:", self->_labelToTopConstraint);
  -[TransitRoutePickingNoMoreRoutesCell _updateConstraintValues](self, "_updateConstraintValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v18, "addObserver:selector:name:object:", self, "_contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)TransitRoutePickingNoMoreRoutesCell;
  -[TransitRoutePickingNoMoreRoutesCell dealloc](&v4, "dealloc");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitRoutePickingNoMoreRoutesCell;
  -[TransitRoutePickingNoMoreRoutesCell didMoveToWindow](&v3, "didMoveToWindow");
  -[TransitRoutePickingNoMoreRoutesCell _updateConstraintValues](self, "_updateConstraintValues");
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleSubhead, 0));
  -[_MKUILabel setFont:](self->_noMoreRoutesLabel, "setFont:", v4);

  -[TransitRoutePickingNoMoreRoutesCell _updateConstraintValues](self, "_updateConstraintValues");
}

- (void)_updateConstraintValues
{
  uint64_t v3;
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[_MKUILabel font](self->_noMoreRoutesLabel, "font"));
  objc_msgSend(v5, "_scaledValueForValue:", 28.0);
  -[NSLayoutConstraint setConstant:](self->_labelToTopConstraint, "setConstant:", UIRoundToViewScale(self, v3, v4));

}

- (void)setSeparatorStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitRoutePickingNoMoreRoutesCell;
  -[TransitRoutePickingNoMoreRoutesCell setSeparatorStyle:](&v3, "setSeparatorStyle:", 0);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransitRoutePickingNoMoreRoutesCell;
  -[TransitRoutePickingNoMoreRoutesCell setHighlighted:animated:](&v4, "setHighlighted:animated:", 0, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelToTopConstraint, 0);
  objc_storeStrong((id *)&self->_noMoreRoutesLabel, 0);
}

@end
