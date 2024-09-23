@implementation FeatureDiscoveryTableViewCell

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

- (FeatureDiscoveryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  FeatureDiscoveryTableViewCell *v4;
  FeatureDiscoveryTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  FeatureDiscoveryView *v9;
  void *v10;
  FeatureDiscoveryView *v11;
  FeatureDiscoveryView *featureDiscoveryView;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FeatureDiscoveryTableViewCell;
  v4 = -[FeatureDiscoveryTableViewCell initWithStyle:reuseIdentifier:](&v15, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[FeatureDiscoveryTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[FeatureDiscoveryTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v8, "setBackgroundColor:", v7);

    v9 = [FeatureDiscoveryView alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v10, "bounds");
    v11 = -[FeatureDiscoveryView initWithFrame:](v9, "initWithFrame:");
    featureDiscoveryView = v5->_featureDiscoveryView;
    v5->_featureDiscoveryView = v11;

    -[FeatureDiscoveryView setTranslatesAutoresizingMaskIntoConstraints:](v5->_featureDiscoveryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v13, "addSubview:", v5->_featureDiscoveryView);

    -[FeatureDiscoveryTableViewCell _updateFeatureDiscoveryViewConstraints](v5, "_updateFeatureDiscoveryViewConstraints");
  }
  return v5;
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(FeatureDiscoveryTableViewCell);
  return NSStringFromClass(v2);
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryTableViewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryTableViewCell traitCollection](self, "traitCollection"));
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[FeatureDiscoveryView _constraintsForFeatureDiscoveryView:centeredInContentView:withIdiom:context:](FeatureDiscoveryView, "_constraintsForFeatureDiscoveryView:centeredInContentView:withIdiom:context:", featureDiscoveryView, v4, objc_msgSend(v5, "userInterfaceIdiom"), self->_context));
  featureDiscoveryViewConstraints = self->_featureDiscoveryViewConstraints;
  self->_featureDiscoveryViewConstraints = v6;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_featureDiscoveryViewConstraints);
}

- (void)setContext:(unint64_t)a3
{
  if (self->_context != a3)
    -[FeatureDiscoveryTableViewCell _updateFeatureDiscoveryViewConstraints](self, "_updateFeatureDiscoveryViewConstraints");
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
