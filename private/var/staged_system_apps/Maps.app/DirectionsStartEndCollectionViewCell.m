@implementation DirectionsStartEndCollectionViewCell

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  $8452678F12DBC466148836A9D382CAFC *result;

  result = ($8452678F12DBC466148836A9D382CAFC *)objc_msgSend(a2, "startEndViewClass");
  if (result)
    return ($8452678F12DBC466148836A9D382CAFC *)-[$8452678F12DBC466148836A9D382CAFC cellMetricsForIdiom:](result, "cellMetricsForIdiom:", a4);
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return result;
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

+ (Class)startEndViewClass
{
  return (Class)objc_opt_class(DirectionsStartEndContentView, a2);
}

- (DirectionsStartEndCollectionViewCell)initWithFrame:(CGRect)a3
{
  DirectionsStartEndCollectionViewCell *v3;
  DirectionsStartEndCollectionViewCell *v4;
  id v5;
  void *v6;
  DirectionsStartEndContentView *v7;
  DirectionsStartEndContentView *startEndView;
  void *v9;
  DirectionsStartEndContentView *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSLayoutConstraint *heightConstraint;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)DirectionsStartEndCollectionViewCell;
  v3 = -[DirectionsStartEndCollectionViewCell initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DirectionsStartEndCollectionViewCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("DirectionsStartEndCell"));
    v5 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(v4), "startEndViewClass"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v6, "bounds");
    v7 = (DirectionsStartEndContentView *)objc_msgSend(v5, "initWithFrame:");
    startEndView = v4->_startEndView;
    v4->_startEndView = v7;

    -[DirectionsStartEndContentView setTranslatesAutoresizingMaskIntoConstraints:](v4->_startEndView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v9, "addSubview:", v4->_startEndView);

    v10 = v4->_startEndView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndCollectionViewCell contentView](v4, "contentView"));
    LODWORD(v12) = 1148846080;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndContentView _maps_constraintsEqualToEdgesOfView:priority:](v10, "_maps_constraintsEqualToEdgesOfView:priority:", v11, v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndContentView heightAnchor](v4->_startEndView, "heightAnchor"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 0.0));
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v16;

    +[RoutingAppearanceManager configureBackgroundViewForStepCell:](RoutingAppearanceManager, "configureBackgroundViewForStepCell:", v4);
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DirectionsStartEndCollectionViewCell;
  -[DirectionsStartEndCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[DirectionsStartEndContentView prepareForReuse](self->_startEndView, "prepareForReuse");
}

- (void)configureForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6
{
  _BOOL8 v6;
  DirectionsStartEndContentView *startEndView;
  id v11;
  id v12;
  id v13;
  CGRect v14;

  v6 = a6;
  startEndView = self->_startEndView;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[DirectionsStartEndContentView bounds](startEndView, "bounds");
  -[DirectionsStartEndCollectionViewCell heightForWaypoint:route:selectedVehicle:displayedInRoutePlanning:width:](self, "heightForWaypoint:route:selectedVehicle:displayedInRoutePlanning:width:", v13, v12, v11, v6, CGRectGetWidth(v14));
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");
  -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 1);
  -[DirectionsStartEndContentView configureForWaypoint:route:selectedVehicle:displayedInRoutePlanning:](self->_startEndView, "configureForWaypoint:route:selectedVehicle:displayedInRoutePlanning:", v13, v12, v11, v6);

}

- (double)heightForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6 width:(double)a7
{
  double result;

  -[DirectionsStartEndContentView heightForWaypoint:route:selectedVehicle:displayedInRoutePlanning:width:](self->_startEndView, "heightForWaypoint:route:selectedVehicle:displayedInRoutePlanning:width:", a3, a4, a5, a6, a7);
  return result;
}

- (void)setIsDimmedStep:(BOOL)a3
{
  -[DirectionsStartEndContentView setIsDimmedStep:](self->_startEndView, "setIsDimmedStep:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_startEndView, 0);
}

@end
