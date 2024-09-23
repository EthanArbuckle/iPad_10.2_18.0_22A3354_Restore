@implementation DirectionsStepCollectionViewCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

+ (Class)stepViewClass
{
  return (Class)objc_opt_class(DirectionsStepView, a2);
}

- (DirectionsStepCollectionViewCell)initWithFrame:(CGRect)a3
{
  DirectionsStepCollectionViewCell *v3;
  DirectionsStepCollectionViewCell *v4;
  id v5;
  void *v6;
  DirectionsStepView *v7;
  DirectionsStepView *stepView;
  void *v9;
  DirectionsStepView *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSLayoutConstraint *heightConstraint;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)DirectionsStepCollectionViewCell;
  v3 = -[DirectionsStepCollectionViewCell initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DirectionsStepCollectionViewCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("DirectionsStepCell"));
    v5 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(v4), "stepViewClass"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v6, "bounds");
    v7 = (DirectionsStepView *)objc_msgSend(v5, "initWithFrame:");
    stepView = v4->_stepView;
    v4->_stepView = v7;

    -[DirectionsStepView setTranslatesAutoresizingMaskIntoConstraints:](v4->_stepView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DirectionsStepView setAccessibilityIdentifier:](v4->_stepView, "setAccessibilityIdentifier:", CFSTR("DirectionsStep"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v9, "addSubview:", v4->_stepView);

    v10 = v4->_stepView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepCollectionViewCell contentView](v4, "contentView"));
    LODWORD(v12) = 1148846080;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView _maps_constraintsEqualToEdgesOfView:priority:](v10, "_maps_constraintsEqualToEdgesOfView:priority:", v11, v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView heightAnchor](v4->_stepView, "heightAnchor"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 0.0));
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v16;

    +[RoutingAppearanceManager configureBackgroundViewForStepCell:](RoutingAppearanceManager, "configureBackgroundViewForStepCell:", v4);
  }
  return v4;
}

- (void)updateTheme
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DirectionsStepCollectionViewCell;
  -[MapsThemeCollectionViewListCell updateTheme](&v10, "updateTheme");
  if (sub_1002A8AA0(self) != 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepCollectionViewCell backgroundView](self, "backgroundView"));
    v4 = objc_opt_class(DirectionsTableViewCellBackgroundView);
    isKindOfClass = objc_opt_isKindOfClass(v3, v4);

    if ((isKindOfClass & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepCollectionViewCell backgroundView](self, "backgroundView"));
      objc_msgSend(v6, "setHighlightedColor:", -[DirectionsStepCollectionViewCell isSelectedRow](self, "isSelectedRow"));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepCollectionViewCell theme](self, "theme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableViewCellHighlightedOverlayColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepCollectionViewCell selectedBackgroundView](self, "selectedBackgroundView"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

  }
}

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  $8452678F12DBC466148836A9D382CAFC *result;

  result = ($8452678F12DBC466148836A9D382CAFC *)objc_msgSend(a2, "stepViewClass");
  if (result)
    return ($8452678F12DBC466148836A9D382CAFC *)-[$8452678F12DBC466148836A9D382CAFC cellMetricsForIdiom:](result, "cellMetricsForIdiom:", a4);
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return result;
}

+ (unint64_t)signViewIconSize
{
  return (unint64_t)objc_msgSend(objc_msgSend(a1, "stepViewClass"), "signViewIconSize");
}

+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6
{
  id v10;
  id v11;
  double v12;
  double v13;

  v10 = a5;
  v11 = a4;
  objc_msgSend(objc_msgSend(a1, "stepViewClass"), "heightForWidth:route:step:idiom:", v11, v10, a6, a3);
  v13 = v12;

  return v13;
}

- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7
{
  _BOOL8 v8;
  id v12;
  void *v13;
  double Width;
  void *v15;
  id v16;
  CGRect v17;

  v8 = a6;
  v12 = a4;
  v16 = a3;
  v13 = (void *)objc_opt_class(self);
  -[DirectionsStepView bounds](self->_stepView, "bounds");
  Width = CGRectGetWidth(v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepCollectionViewCell traitCollection](self, "traitCollection"));
  objc_msgSend(v13, "heightForWidth:route:step:idiom:", v16, v12, objc_msgSend(v15, "userInterfaceIdiom"), Width);
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");

  -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 1);
  -[DirectionsStepView setRoute:step:stepIndex:alignToLeftEdgeIfNoManeuverSign:size:](self->_stepView, "setRoute:step:stepIndex:alignToLeftEdgeIfNoManeuverSign:size:", v16, v12, a5, v8, a7);

}

- (void)setIsDimmedStep:(BOOL)a3
{
  -[DirectionsStepView setIsDimmedStep:](self->_stepView, "setIsDimmedStep:", a3);
}

- (void)setIsSelectedRow:(BOOL)a3
{
  -[DirectionsStepView setIsSelectedRow:](self->_stepView, "setIsSelectedRow:", a3);
}

- (BOOL)isSelectedRow
{
  return -[DirectionsStepView isSelectedRow](self->_stepView, "isSelectedRow");
}

- (void)setTrailingView:(id)a3
{
  -[DirectionsStepView setTrailingView:](self->_stepView, "setTrailingView:", a3);
}

- (UIView)trailingView
{
  return -[DirectionsStepView trailingView](self->_stepView, "trailingView");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_stepView, 0);
}

@end
