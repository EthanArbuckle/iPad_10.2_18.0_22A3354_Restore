@implementation SiriUIMapTemplateView

- (SiriUIMapTemplateView)initWithDataSource:(id)a3
{
  SiriUIMapTemplateView *v3;
  MKMapView *v4;
  MKMapView *mapView;
  id v6;
  uint64_t v7;
  MKPinAnnotationView *pinAnnotationView;
  uint64_t v9;
  UILabel *footnoteDescriptorLabel;
  uint64_t v11;
  UILabel *footnoteLabel;
  id v13;
  uint64_t v14;
  UIButton *mapButton;
  uint64_t v16;
  UITapGestureRecognizer *tapRecognizer;
  CLGeocoder *v18;
  CLGeocoder *geocoder;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SiriUIMapTemplateView;
  v3 = -[SiriUIBaseTemplateView initWithDataSource:](&v21, sel_initWithDataSource_, a3);
  if (v3)
  {
    v4 = (MKMapView *)objc_alloc_init(MEMORY[0x24BDDB130]);
    mapView = v3->_mapView;
    v3->_mapView = v4;

    -[SiriUIMapTemplateView addSubview:](v3, "addSubview:", v3->_mapView);
    v6 = objc_alloc_init(MEMORY[0x24BDDB168]);
    objc_msgSend(v6, "setRepresentation:", 2);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDDB150]), "initWithAnnotation:reuseIdentifier:", v6, CFSTR("SiriUIMapTemplateViewPinAnnotationViewReuseIdentifier"));
    pinAnnotationView = v3->_pinAnnotationView;
    v3->_pinAnnotationView = (MKPinAnnotationView *)v7;

    -[SiriUIMapTemplateView addSubview:](v3, "addSubview:", v3->_pinAnnotationView);
    -[SiriUIMapTemplateView _configuredFootnoteDescriptorLabel](v3, "_configuredFootnoteDescriptorLabel");
    v9 = objc_claimAutoreleasedReturnValue();
    footnoteDescriptorLabel = v3->_footnoteDescriptorLabel;
    v3->_footnoteDescriptorLabel = (UILabel *)v9;

    -[SiriUIMapTemplateView addSubview:](v3, "addSubview:", v3->_footnoteDescriptorLabel);
    -[SiriUIMapTemplateView _configuredFootnoteLabel](v3, "_configuredFootnoteLabel");
    v11 = objc_claimAutoreleasedReturnValue();
    footnoteLabel = v3->_footnoteLabel;
    v3->_footnoteLabel = (UILabel *)v11;

    -[SiriUIMapTemplateView addSubview:](v3, "addSubview:", v3->_footnoteLabel);
    v13 = objc_alloc(MEMORY[0x24BDF6880]);
    v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    mapButton = v3->_mapButton;
    v3->_mapButton = (UIButton *)v14;

    -[SiriUIMapTemplateView addSubview:](v3, "addSubview:", v3->_mapButton);
    -[UIButton addTarget:action:forControlEvents:](v3->_mapButton, "addTarget:action:forControlEvents:", v3, sel__mapButtonPressed_, 64);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v3, sel__handleTapGesture_);
    tapRecognizer = v3->_tapRecognizer;
    v3->_tapRecognizer = (UITapGestureRecognizer *)v16;

    -[SiriUIMapTemplateView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tapRecognizer);
    v18 = (CLGeocoder *)objc_alloc_init(MEMORY[0x24BDBFA68]);
    geocoder = v3->_geocoder;
    v3->_geocoder = v18;

    -[SiriUIMapTemplateView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[SiriUIMapTemplateView reloadData](v3, "reloadData");

  }
  return v3;
}

- (void)reloadData
{
  MKMapView *mapView;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  MKPinAnnotationView *pinAnnotationView;
  void *v11;
  void *v12;
  void *v13;
  UILabel *footnoteDescriptorLabel;
  void *v15;
  UILabel *footnoteLabel;
  void *v17;
  id v18;

  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapView setDelegate:](self->_mapView, "setDelegate:", 0);
  mapView = self->_mapView;
  -[MKMapView annotations](mapView, "annotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView removeAnnotations:](mapView, "removeAnnotations:", v4);

  objc_msgSend(v18, "CLLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinate");
  v7 = v6;
  v9 = v8;

  -[MKMapView setRegion:animated:](self->_mapView, "setRegion:animated:", 1, v7, v9, 0.005, 0.005);
  -[MKMapView setDelegate:](self->_mapView, "setDelegate:", self);
  pinAnnotationView = self->_pinAnnotationView;
  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pinColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[MKPinAnnotationView setPinTintColor:](pinAnnotationView, "setPinTintColor:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "redColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPinAnnotationView setPinTintColor:](pinAnnotationView, "setPinTintColor:", v13);

  }
  footnoteDescriptorLabel = self->_footnoteDescriptorLabel;
  objc_msgSend(v18, "footnoteDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](footnoteDescriptorLabel, "setText:", v15);

  footnoteLabel = self->_footnoteLabel;
  objc_msgSend(v18, "footnote");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](footnoteLabel, "setText:", v17);

  -[SiriUIMapTemplateView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SiriUIMapTemplateView setNeedsLayout](self, "setNeedsLayout");
    v5 = obj;
  }

}

- (double)desiredHeight
{
  void *v2;
  _BOOL4 v3;

  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mapSizeValue") == 0;

  return dbl_217697EB0[v3];
}

- (void)layoutSubviews
{
  double v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  _BOOL8 v13;
  MKPinAnnotationView *pinAnnotationView;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double height;
  double width;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[SiriUIMapTemplateView bounds](self, "bounds");
  height = v29.size.height;
  width = v29.size.width;
  v3 = CGRectGetWidth(v29);
  v4 = -[SiriUIMapTemplateView semanticContentAttribute](self, "semanticContentAttribute");
  -[SiriUIBaseTemplateView templatedSuperview](self, "templatedSuperview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "templatedContentMargins");
  v7 = v6;

  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mapSizeValue");

  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "interactive");

  -[MKMapView setDelegate:](self->_mapView, "setDelegate:", 0);
  v12 = dbl_217697EC0[v9 != 1];
  -[MKMapView setFrame:](self->_mapView, "setFrame:", 0.0, 0.0, v3, v12);
  -[MKMapView setScrollEnabled:](self->_mapView, "setScrollEnabled:", v11);
  -[MKMapView setZoomEnabled:](self->_mapView, "setZoomEnabled:", v11);
  if ((_DWORD)v11)
    -[UIButton removeFromSuperview](self->_mapButton, "removeFromSuperview");
  else
    -[SiriUIMapTemplateView addSubview:](self, "addSubview:", self->_mapButton);
  v13 = v9 != 1;
  -[UIButton setFrame:](self->_mapButton, "setFrame:", 0.0, 0.0, v3, v12);
  pinAnnotationView = self->_pinAnnotationView;
  -[MKPinAnnotationView frame](pinAnnotationView, "frame");
  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v30.size.width = v3;
  v30.size.height = v12;
  CGRectGetMidX(v30);
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = v3;
  v31.size.height = v12;
  CGRectGetMidY(v31);
  UIRectCenteredAboutPoint();
  -[MKPinAnnotationView setFrame:](pinAnnotationView, "setFrame:");
  -[UILabel setHidden:](self->_footnoteDescriptorLabel, "setHidden:", v13);
  -[UILabel setHidden:](self->_footnoteLabel, "setHidden:", v13);
  v16 = height;
  v15 = width;
  -[UILabel sizeThatFits:](self->_footnoteDescriptorLabel, "sizeThatFits:", width, height);
  v19 = v18;
  v20 = v3 - v18;
  v21 = v20 - v7;
  if (v4 == 4)
    v22 = v20 - v7;
  else
    v22 = v7;
  -[UILabel setFrame:](self->_footnoteDescriptorLabel, "setFrame:", v22, 0.0, v19, v17, *(_QWORD *)&height, *(_QWORD *)&width);
  -[UILabel _setLastLineBaselineFrameOriginY:](self->_footnoteDescriptorLabel, "_setLastLineBaselineFrameOriginY:", 308.0);
  -[UILabel sizeThatFits:](self->_footnoteLabel, "sizeThatFits:", v15, v16);
  v25 = v24;
  v26 = v21 + -10.0 - v24;
  if (v4 != 4)
    v26 = v7 + v19 + 10.0;
  -[UILabel setFrame:](self->_footnoteLabel, "setFrame:", v26, 0.0, v25, v23);
  -[UILabel _setLastLineBaselineFrameOriginY:](self->_footnoteLabel, "_setLastLineBaselineFrameOriginY:", 308.0);
  -[MKMapView setDelegate:](self->_mapView, "setDelegate:", self);
}

- (void)prepareForDismissal
{
  -[CLGeocoder cancelGeocode](self->_geocoder, "cancelGeocode");
  -[SiriUIMapTemplateView _notifyDelegateOfLocationUpdateIfNeededWithPlacemark:](self, "_notifyDelegateOfLocationUpdateIfNeededWithPlacemark:", self->_currentPlacemark);
}

- (void)_notifyDelegateOfLocationUpdateIfNeededWithPlacemark:(id)a3
{
  id v4;
  void *v5;

  if (self->_needsToNotifyDelegateOfLocationUpdate)
  {
    v4 = a3;
    -[SiriUIMapTemplateView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapTemplateView:didModifyPlacemark:", self, v4);

    self->_needsToNotifyDelegateOfLocationUpdate = 0;
  }
}

- (id)_configuredFootnoteDescriptorLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[SiriUIMapTemplateView _configuredLabel](self, "_configuredLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(MEMORY[0x24BDF6950], "siriui_platterSemiTransparentTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v4);

  return v2;
}

- (id)_configuredFootnoteLabel
{
  void *v2;
  void *v3;

  -[SiriUIMapTemplateView _configuredLabel](self, "_configuredLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

- (id)_configuredLabel
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDF6B68]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BDF6950], "siriui_platterTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

  return v3;
}

- (void)_mapButtonPressed:(id)a3
{
  id v4;

  -[SiriUIMapTemplateView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapTemplateViewDidSelectMap:", self);

}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  CLPlacemark *v9;
  CLPlacemark *currentPlacemark;
  CLGeocoder *geocoder;
  id v12;
  _QWORD v13[4];
  id v14;
  SiriUIMapTemplateView *v15;
  id v16;
  id location;

  v5 = a3;
  self->_needsToNotifyDelegateOfLocationUpdate = 1;
  -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", v6, v7);
  v9 = (CLPlacemark *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFAC8]), "initWithLocation:addressDictionary:region:areasOfInterest:", v8, 0, 0, 0);
  currentPlacemark = self->_currentPlacemark;
  self->_currentPlacemark = v9;

  objc_initWeak(&location, self);
  geocoder = self->_geocoder;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke;
  v13[3] = &unk_24D7D9930;
  v12 = v8;
  v14 = v12;
  objc_copyWeak(&v16, &location);
  v15 = self;
  -[CLGeocoder reverseGeocodeLocation:completionHandler:](geocoder, "reverseGeocodeLocation:completionHandler:", v12, v13);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *WeakRetained;
  id *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke_cold_1(a1, (uint64_t)v6, v7);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (v5 && WeakRetained)
  {
    objc_msgSend(v5, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v9[59];
    v9[59] = (id)v10;

    objc_msgSend(v9, "_notifyDelegateOfLocationUpdateIfNeededWithPlacemark:", v9[59]);
    objc_msgSend(v9, "_configuredFootnoteLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_configuredFootnoteDescriptorLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9[59], "name");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v14, "siriUILocalizedStringForKey:", CFSTR("MAP_TEMPLATE_LOCATION_DESCRIPTOR"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9[59], "postalAddress");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc_init(MEMORY[0x24BDBAD98]);
      objc_msgSend(v19, "stringFromPostalAddress:", v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "siriUILocalizedStringForKey:", CFSTR("MAP_TEMPLATE_ADDRESS_DESCRIPTOR"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v12, "setText:", v16);
    objc_msgSend(v9[56], "frame");
    objc_msgSend(v12, "setFrame:");
    objc_msgSend(v12, "sizeToFit");
    objc_msgSend(v12, "setAlpha:", 0.0);
    objc_msgSend(v13, "setText:", v17);
    objc_msgSend(v9[55], "frame");
    objc_msgSend(v13, "setFrame:");
    objc_msgSend(v13, "sizeToFit");
    objc_msgSend(v13, "setAlpha:", 0.0);
    objc_msgSend(v9, "addSubview:", v12);
    objc_msgSend(v9, "addSubview:", v13);
    v20 = MEMORY[0x24BDAC760];
    v21 = (void *)MEMORY[0x24BDF6F90];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke_22;
    v27[3] = &unk_24D7D9540;
    v27[4] = v9;
    v28 = v12;
    v29 = v13;
    v24[0] = v20;
    v24[1] = 3221225472;
    v24[2] = __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke_2;
    v24[3] = &unk_24D7D9908;
    v24[4] = v9;
    v25 = v28;
    v26 = v29;
    v22 = v29;
    v23 = v28;
    objc_msgSend(v21, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v27, v24, 0.5, 0.0, 1.0, 0.5);

  }
}

uint64_t __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke_22(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
}

void __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "removeFromSuperview");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 448), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 440), *(id *)(a1 + 48));
}

- (void)_handleTapGesture:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriUIMapTemplateView _handleTapGesture:]";
    _os_log_impl(&dword_21764F000, v3, OS_LOG_TYPE_DEFAULT, "%s Ignoring tap", (uint8_t *)&v4, 0xCu);
  }
}

- (SiriUIMapTemplateViewDelegate)delegate
{
  return (SiriUIMapTemplateViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_currentPlacemark, 0);
  objc_storeStrong((id *)&self->_mapButton, 0);
  objc_storeStrong((id *)&self->_pinAnnotationView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_footnoteDescriptorLabel, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

void __57__SiriUIMapTemplateView_mapView_regionDidChangeAnimated___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315651;
  v5 = "-[SiriUIMapTemplateView mapView:regionDidChangeAnimated:]_block_invoke";
  v6 = 2113;
  v7 = v3;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_21764F000, log, OS_LOG_TYPE_ERROR, "%s Error reverse-geocoding location %{private}@, %{public}@", (uint8_t *)&v4, 0x20u);
}

@end
