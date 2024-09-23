@implementation TransitDirectionsBadgesStepView

- (void)_createSubviews
{
  TransitArtworkListView *v3;
  TransitArtworkListView *artworkListView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsBadgesStepView;
  -[TransitDirectionsStepView _createSubviews](&v5, "_createSubviews");
  v3 = -[TransitArtworkListView initWithFrame:]([TransitArtworkListView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  artworkListView = self->_artworkListView;
  self->_artworkListView = v3;

  -[TransitArtworkListView setTranslatesAutoresizingMaskIntoConstraints:](self->_artworkListView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TransitArtworkListView setSeparatorStyle:](self->_artworkListView, "setSeparatorStyle:", 1);
  -[TransitDirectionsBadgesStepView addSubview:](self, "addSubview:", self->_artworkListView);
}

- (id)_initialConstraints
{
  id v3;
  void *v4;
  TransitArtworkListView *artworkListView;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TransitDirectionsBadgesStepView;
  v3 = -[TransitDirectionsStepView _initialConstraints](&v12, "_initialConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  artworkListView = self->_artworkListView;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  LODWORD(v7) = 1148846080;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView _maps_constraintsEqualToEdgesOfLayoutGuide:priority:](artworkListView, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v6, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topConstraint"));
  objc_msgSend(v9, "setConstant:", 6.0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allConstraints"));
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  return v4;
}

- (void)configureWithItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TransitDirectionsBadgesStepView;
  -[TransitDirectionsStepView configureWithItem:](&v7, "configureWithItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "badges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTransitStepBadge _maps_artworkListFromStepBadges:](GEOTransitStepBadge, "_maps_artworkListFromStepBadges:", v5));
  -[TransitArtworkListView setArtworkData:](self->_artworkListView, "setArtworkData:", v6);

}

- (double)bottomSpacerHeight
{
  return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkListView, 0);
}

@end
