@implementation RAPDirectionsTableViewCell

- (RAPDirectionsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPDirectionsTableViewCell *v4;
  RAPDirectionsTableViewCell *v5;
  void *v6;
  DirectionsTableViewCellBackgroundView *v7;
  DirectionsTableViewCellBackgroundView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RAPDirectionsTableViewCell;
  v4 = -[DirectionsStepTableViewCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsTableViewCell backgroundView](v4, "backgroundView"));

    if (!v6)
    {
      v7 = [DirectionsTableViewCellBackgroundView alloc];
      -[RAPDirectionsTableViewCell bounds](v5, "bounds");
      v8 = -[DirectionsTableViewCellBackgroundView initWithFrame:](v7, "initWithFrame:");
      -[RAPDirectionsTableViewCell setBackgroundView:](v5, "setBackgroundView:", v8);

    }
  }
  return v5;
}

- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7
{
  _BOOL8 v8;
  id v12;
  GEOComposedRoute *v13;
  void *v14;
  id v15;
  void *v16;
  GEOComposedRoute *v17;
  objc_super v18;

  v8 = a6;
  v12 = a3;
  v13 = (GEOComposedRoute *)a4;
  v14 = *(void **)(&self->super._alignSeparatorWithLeadingText + 1);
  *(_QWORD *)(&self->super._alignSeparatorWithLeadingText + 1) = v12;
  v15 = v12;

  v16 = *(GEOComposedRoute **)((char *)&self->_route + 1);
  *(GEOComposedRoute **)((char *)&self->_route + 1) = v13;
  v17 = v13;

  v18.receiver = self;
  v18.super_class = (Class)RAPDirectionsTableViewCell;
  -[DirectionsStepTableViewCell setRoute:step:stepIndex:alignToLeftEdgeIfNoManeuverSign:size:](&v18, "setRoute:step:stepIndex:alignToLeftEdgeIfNoManeuverSign:size:", v15, v17, a5, v8, a7);

}

- (void)updateHeightForWidth:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  GEOComposedRouteStep *v13;
  void *v14;
  void *v15;
  GEOComposedRouteStep *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = (void *)objc_opt_class(self);
  v6 = *(_QWORD *)(&self->super._alignSeparatorWithLeadingText + 1);
  v7 = *(uint64_t *)((char *)&self->_route + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsTableViewCell traitCollection](self, "traitCollection"));
  objc_msgSend(v5, "heightForWidth:route:step:idiom:", v6, v7, objc_msgSend(v8, "userInterfaceIdiom"), a3);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsTableViewCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
  v13 = (GEOComposedRouteStep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:", v10));

  if (*(GEOComposedRouteStep **)((char *)&self->_step + 1))
  {
    v19 = *(uint64_t *)((char *)&self->_step + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v14);

    v15 = *(GEOComposedRouteStep **)((char *)&self->_step + 1);
  }
  else
  {
    v15 = 0;
  }
  *(GEOComposedRouteStep **)((char *)&self->_step + 1) = v13;
  v16 = v13;

  v18 = *(uint64_t *)((char *)&self->_step + 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_step + 1), 0);
  objc_storeStrong((id *)((char *)&self->_route + 1), 0);
  objc_storeStrong((id *)(&self->super._alignSeparatorWithLeadingText + 1), 0);
}

@end
