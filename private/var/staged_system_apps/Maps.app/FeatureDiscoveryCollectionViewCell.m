@implementation FeatureDiscoveryCollectionViewCell

+ (double)estimatedHeightForContext:(unint64_t)a3
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  +[FeatureDiscoveryView _cellMetricsForIdiom:context:](FeatureDiscoveryView, "_cellMetricsForIdiom:context:", v5, a3);
  v7 = v6;
  v9 = v8;
  +[FeatureDiscoveryView estimatedHeight](FeatureDiscoveryView, "estimatedHeight");
  return v9 + v7 + v10;
}

- (FeatureDiscoveryCollectionViewCell)initWithFrame:(CGRect)a3
{
  FeatureDiscoveryCollectionViewCell *v3;
  void *v4;
  void *v5;
  void *v6;
  FeatureDiscoveryView *v7;
  void *v8;
  FeatureDiscoveryView *v9;
  FeatureDiscoveryView *featureDiscoveryView;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FeatureDiscoveryCollectionViewCell;
  v3 = -[MapsThemeCollectionViewCell initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[FeatureDiscoveryCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v7 = [FeatureDiscoveryView alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v8, "bounds");
    v9 = -[FeatureDiscoveryView initWithFrame:](v7, "initWithFrame:");
    featureDiscoveryView = v3->_featureDiscoveryView;
    v3->_featureDiscoveryView = v9;

    -[FeatureDiscoveryView setTranslatesAutoresizingMaskIntoConstraints:](v3->_featureDiscoveryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v11, "addSubview:", v3->_featureDiscoveryView);

    -[FeatureDiscoveryCollectionViewCell _updateFeatureDiscoveryViewConstraints](v3, "_updateFeatureDiscoveryViewConstraints");
  }
  return v3;
}

- (void)_updateFeatureDiscoveryViewConstraints
{
  FeatureDiscoveryView *featureDiscoveryView;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *featureDiscoveryViewConstraints;

  if (self->_featureDiscoveryViewConstraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  featureDiscoveryView = self->_featureDiscoveryView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryCollectionViewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryCollectionViewCell traitCollection](self, "traitCollection"));
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[FeatureDiscoveryView _constraintsForFeatureDiscoveryView:centeredInContentView:withIdiom:context:](FeatureDiscoveryView, "_constraintsForFeatureDiscoveryView:centeredInContentView:withIdiom:context:", featureDiscoveryView, v4, objc_msgSend(v5, "userInterfaceIdiom"), self->_context));
  featureDiscoveryViewConstraints = self->_featureDiscoveryViewConstraints;
  self->_featureDiscoveryViewConstraints = v6;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_featureDiscoveryViewConstraints);
}

- (void)setContext:(unint64_t)a3
{
  if (self->_context != a3)
  {
    self->_context = a3;
    -[FeatureDiscoveryCollectionViewCell _updateFeatureDiscoveryViewConstraints](self, "_updateFeatureDiscoveryViewConstraints");
  }
}

- (FeatureDiscoveryView)featureDiscoveryView
{
  return self->_featureDiscoveryView;
}

- (unint64_t)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDiscoveryView, 0);
  objc_storeStrong((id *)&self->_featureDiscoveryViewConstraints, 0);
}

@end
