@implementation DirectionsStepTableViewCell

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

- (DirectionsStepTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DirectionsStepTableViewCell *v4;
  DirectionsStepTableViewCell *v5;
  id v6;
  void *v7;
  DirectionsStepView *v8;
  DirectionsStepView *stepView;
  void *v10;
  DirectionsStepView *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)DirectionsStepTableViewCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v17, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[DirectionsStepTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("DirectionsStepCell"));
    v6 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(v5), "stepViewClass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v7, "bounds");
    v8 = (DirectionsStepView *)objc_msgSend(v6, "initWithFrame:");
    stepView = v5->_stepView;
    v5->_stepView = v8;

    -[DirectionsStepView setTranslatesAutoresizingMaskIntoConstraints:](v5->_stepView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DirectionsStepView setAccessibilityIdentifier:](v5->_stepView, "setAccessibilityIdentifier:", CFSTR("DirectionsStep"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v10, "addSubview:", v5->_stepView);

    v11 = v5->_stepView;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepTableViewCell contentView](v5, "contentView"));
    LODWORD(v13) = 1148846080;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepView _maps_constraintsEqualToEdgesOfView:priority:](v11, "_maps_constraintsEqualToEdgesOfView:priority:", v12, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  }
  return v5;
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
  v10.super_class = (Class)DirectionsStepTableViewCell;
  -[MapsThemeTableViewCell updateTheme](&v10, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepTableViewCell backgroundView](self, "backgroundView"));
  v4 = objc_opt_class(DirectionsTableViewCellBackgroundView);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepTableViewCell backgroundView](self, "backgroundView"));
    objc_msgSend(v6, "setHighlightedColor:", -[DirectionsStepTableViewCell isSelectedRow](self, "isSelectedRow"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepTableViewCell theme](self, "theme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableViewCellHighlightedOverlayColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepTableViewCell selectedBackgroundView](self, "selectedBackgroundView"));
  objc_msgSend(v9, "setBackgroundColor:", v8);

}

- (void)setAccessoryType:(int64_t)a3
{
  DirectionsStepView *stepView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DirectionsStepTableViewCell;
  -[DirectionsStepTableViewCell setAccessoryType:](&v5, "setAccessoryType:", a3);
  stepView = self->_stepView;
  -[DirectionsStepTableViewCell _trailingGuideToContentViewDistance](self, "_trailingGuideToContentViewDistance");
  -[DirectionsStepView _updateTrailingGuideToContentViewConstraintWithConstant:](stepView, "_updateTrailingGuideToContentViewConstraintWithConstant:");
}

- (double)_trailingGuideToContentViewDistance
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  double result;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepTableViewCell traitCollection](self, "traitCollection", (unsigned __int128)0));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  if (v3)
    objc_msgSend(v3, "cellMetricsForIdiom:", v5);

  v6 = -[DirectionsStepTableViewCell accessoryType](self, "accessoryType");
  result = 0.0;
  if (v6)
    return 0.0;
  return result;
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
  void *v14;
  double MaxX;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  v23.receiver = self;
  v23.super_class = (Class)DirectionsStepTableViewCell;
  -[DirectionsStepTableViewCell _separatorFrame](&v23, "_separatorFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[DirectionsStepTableViewCell alignSeparatorWithLeadingText](self, "alignSeparatorWithLeadingText"))
  {
    v22 = 0u;
    v11 = (void *)objc_opt_class(self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepTableViewCell traitCollection](self, "traitCollection", (unsigned __int128)0, (unsigned __int128)0));
    v13 = objc_msgSend(v12, "userInterfaceIdiom");
    if (v11)
      objc_msgSend(v11, "cellMetricsForIdiom:", v13);
    else
      v22 = 0u;

    if (+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[DirectionsStepTableViewCell semanticContentAttribute](self, "semanticContentAttribute")))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepTableViewCell contentView](self, "contentView"));
      objc_msgSend(v14, "bounds");
      MaxX = CGRectGetMaxX(v24);
      v25.origin.x = v4;
      v25.origin.y = v6;
      v25.size.width = v8;
      v25.size.height = v10;
      v16 = MaxX - CGRectGetMaxX(v25);

      v17 = *(double *)&v22 + *((double *)&v22 + 1) + 0.0 - v16;
    }
    else
    {
      v26.origin.x = v4;
      v26.origin.y = v6;
      v26.size.width = v8;
      v26.size.height = v10;
      v17 = *(double *)&v22 + *((double *)&v22 + 1) + 0.0 - CGRectGetMinX(v26);
      v4 = v4 + v17;
    }
    v8 = v8 - v17;
  }
  v18 = v4;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
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
  -[DirectionsStepView setRoute:step:stepIndex:alignToLeftEdgeIfNoManeuverSign:size:](self->_stepView, "setRoute:step:stepIndex:alignToLeftEdgeIfNoManeuverSign:size:", a3, a4, a5, a6, a7);
}

- (void)setIsDimmedStep:(BOOL)a3
{
  -[DirectionsStepView setIsDimmedStep:](self->_stepView, "setIsDimmedStep:", a3);
}

- (void)setAlignSeparatorWithLeadingText:(BOOL)a3
{
  id v4;

  if (self->_alignSeparatorWithLeadingText != a3)
  {
    self->_alignSeparatorWithLeadingText = a3;
    v4 = -[DirectionsStepTableViewCell separatorStyle](self, "separatorStyle");
    -[DirectionsStepTableViewCell setSeparatorStyle:](self, "setSeparatorStyle:", ((uint64_t)-[DirectionsStepTableViewCell separatorStyle](self, "separatorStyle") + 1) % 3);
    -[DirectionsStepTableViewCell setSeparatorStyle:](self, "setSeparatorStyle:", v4);
  }
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

- (BOOL)alignSeparatorWithLeadingText
{
  return self->_alignSeparatorWithLeadingText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepView, 0);
}

@end
