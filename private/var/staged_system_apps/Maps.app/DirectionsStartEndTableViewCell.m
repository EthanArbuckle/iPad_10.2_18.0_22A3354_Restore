@implementation DirectionsStartEndTableViewCell

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

- (DirectionsStartEndTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DirectionsStartEndTableViewCell *v4;
  DirectionsStartEndTableViewCell *v5;
  id v6;
  void *v7;
  DirectionsStartEndContentView *v8;
  DirectionsStartEndContentView *startEndView;
  void *v10;
  DirectionsStartEndContentView *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)DirectionsStartEndTableViewCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v17, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[DirectionsStartEndTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("DirectionsStartEndCell"));
    v6 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(v5), "startEndViewClass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v7, "bounds");
    v8 = (DirectionsStartEndContentView *)objc_msgSend(v6, "initWithFrame:");
    startEndView = v5->_startEndView;
    v5->_startEndView = v8;

    -[DirectionsStartEndContentView setTranslatesAutoresizingMaskIntoConstraints:](v5->_startEndView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v10, "addSubview:", v5->_startEndView);

    v11 = v5->_startEndView;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndTableViewCell contentView](v5, "contentView"));
    LODWORD(v13) = 1148846080;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndContentView _maps_constraintsEqualToEdgesOfView:priority:](v11, "_maps_constraintsEqualToEdgesOfView:priority:", v12, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DirectionsStartEndTableViewCell;
  -[DirectionsStartEndTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[DirectionsStartEndContentView prepareForReuse](self->_startEndView, "prepareForReuse");
}

- (void)setAlignSeparatorWithLeadingText:(BOOL)a3
{
  id v4;

  if (self->_alignSeparatorWithLeadingText != a3)
  {
    self->_alignSeparatorWithLeadingText = a3;
    v4 = -[DirectionsStartEndTableViewCell separatorStyle](self, "separatorStyle");
    -[DirectionsStartEndTableViewCell setSeparatorStyle:](self, "setSeparatorStyle:", ((uint64_t)-[DirectionsStartEndTableViewCell separatorStyle](self, "separatorStyle") + 1) % 3);
    -[DirectionsStartEndTableViewCell setSeparatorStyle:](self, "setSeparatorStyle:", v4);
  }
}

- (CGRect)_separatorFrame
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  void *v15;
  double MaxX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  v24.receiver = self;
  v24.super_class = (Class)DirectionsStartEndTableViewCell;
  -[DirectionsStartEndTableViewCell _separatorFrame](&v24, "_separatorFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[DirectionsStartEndTableViewCell alignSeparatorWithLeadingText](self, "alignSeparatorWithLeadingText"))
  {
    v23 = 0u;
    v11 = (void *)objc_opt_class(self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndTableViewCell traitCollection](self, "traitCollection", (unsigned __int128)0, (unsigned __int128)0));
    v13 = objc_msgSend(v12, "userInterfaceIdiom");
    if (v11)
      objc_msgSend(v11, "cellMetricsForIdiom:", v13);
    else
      v23 = 0u;

    v14 = *(double *)&v23 + *((double *)&v23 + 1) + 0.0;
    if (+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[DirectionsStartEndTableViewCell semanticContentAttribute](self, "semanticContentAttribute")))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndTableViewCell contentView](self, "contentView"));
      objc_msgSend(v15, "bounds");
      MaxX = CGRectGetMaxX(v25);
      v26.origin.x = v4;
      v26.origin.y = v6;
      v26.size.width = v8;
      v26.size.height = v10;
      v17 = MaxX - CGRectGetMaxX(v26);

      v18 = v14 - v17;
    }
    else
    {
      v27.origin.x = v4;
      v27.origin.y = v6;
      v27.size.width = v8;
      v27.size.height = v10;
      v18 = v14 - CGRectGetMinX(v27);
      v4 = v4 + v18;
    }
    v8 = v8 - v18;
  }
  v19 = v4;
  v20 = v6;
  v21 = v8;
  v22 = v10;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)configureForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6
{
  -[DirectionsStartEndContentView configureForWaypoint:route:selectedVehicle:displayedInRoutePlanning:](self->_startEndView, "configureForWaypoint:route:selectedVehicle:displayedInRoutePlanning:", a3, a4, a5, a6);
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

- (BOOL)alignSeparatorWithLeadingText
{
  return self->_alignSeparatorWithLeadingText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startEndView, 0);
}

@end
