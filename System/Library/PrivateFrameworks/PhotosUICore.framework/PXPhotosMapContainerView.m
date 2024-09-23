@implementation PXPhotosMapContainerView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosMapContainerView;
  -[PXPhotosMapContainerView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXPhotosMapContainerView bounds](self, "bounds");
  -[MKMapView setFrame:](self->_bodyView, "setFrame:");
}

- (void)setBodyView:(id)a3
{
  MKMapView *v5;
  MKMapView **p_bodyView;
  MKMapView *bodyView;
  MKMapView *v8;

  v5 = (MKMapView *)a3;
  p_bodyView = &self->_bodyView;
  bodyView = self->_bodyView;
  if (bodyView != v5)
  {
    v8 = v5;
    -[MKMapView removeFromSuperview](bodyView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bodyView, a3);
    if (*p_bodyView)
    {
      -[PXPhotosMapContainerView addSubview:](self, "addSubview:");
      -[PXPhotosMapContainerView sendSubviewToBack:](self, "sendSubviewToBack:", *p_bodyView);
    }
    -[PXPhotosMapContainerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setMapOptionsView:(id)a3
{
  PXMapOptionsView *v5;
  PXMapOptionsView **p_mapOptionsView;
  PXMapOptionsView *mapOptionsView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v5 = (PXMapOptionsView *)a3;
  p_mapOptionsView = &self->_mapOptionsView;
  mapOptionsView = self->_mapOptionsView;
  if (mapOptionsView != v5)
  {
    -[PXMapOptionsView removeFromSuperview](mapOptionsView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_mapOptionsView, a3);
    if (*p_mapOptionsView)
    {
      -[PXPhotosMapContainerView addSubview:](self, "addSubview:");
      -[PXMapOptionsView setTranslatesAutoresizingMaskIntoConstraints:](*p_mapOptionsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v19 = (void *)MEMORY[0x1E0CB3718];
      -[PXMapOptionsView topAnchor](*p_mapOptionsView, "topAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosMapContainerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 8.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v22;
      -[PXMapOptionsView trailingAnchor](*p_mapOptionsView, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosMapContainerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:constant:", v18, -8.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v17;
      -[PXMapOptionsView leadingAnchor](*p_mapOptionsView, "leadingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosMapContainerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v10, 8.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v11;
      -[PXMapOptionsView bottomAnchor](*p_mapOptionsView, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosMapContainerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintLessThanOrEqualToAnchor:constant:", v14, -8.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "activateConstraints:", v16);

    }
  }

}

- (void)updateWithConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  PXMapOptionsView *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosMapContainerView setBodyView:](self, "setBodyView:", v4);

  -[PXPhotosMapContainerView mapOptionsView](self, "mapOptionsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v15, "mapView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXMapOptionsView initWithMapView:]([PXMapOptionsView alloc], "initWithMapView:", v6);
    -[PXPhotosMapContainerView setMapOptionsView:](self, "setMapOptionsView:", v7);

  }
  objc_msgSend(v15, "mapOptionsViewDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosMapContainerView mapOptionsView](self, "mapOptionsView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", v8);

  -[PXPhotosMapContainerView mapOptionsView](self, "mapOptionsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPerspectiveButtonState:animated:", objc_msgSend(v15, "perspectiveButtonState"), 1);

  v11 = objc_msgSend(v15, "mapStyle");
  -[PXPhotosMapContainerView mapOptionsView](self, "mapOptionsView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMapStyle:", v11);

  v13 = objc_msgSend(v15, "enableUserTrackingButton");
  -[PXPhotosMapContainerView mapOptionsView](self, "mapOptionsView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnableUserTrackingButton:", v13);

}

- (MKMapView)bodyView
{
  return self->_bodyView;
}

- (PXMapOptionsView)mapOptionsView
{
  return self->_mapOptionsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapOptionsView, 0);
  objc_storeStrong((id *)&self->_bodyView, 0);
}

@end
