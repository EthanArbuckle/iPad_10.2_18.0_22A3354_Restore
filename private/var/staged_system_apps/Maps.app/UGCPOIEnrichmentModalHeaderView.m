@implementation UGCPOIEnrichmentModalHeaderView

- (UGCPOIEnrichmentModalHeaderView)initWithFrame:(CGRect)a3
{
  UGCPOIEnrichmentModalHeaderView *v3;
  UGCPOIEnrichmentModalHeaderView *v4;
  uint64_t v5;
  ModalCardHeaderConfiguration *headerConfiguration;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UGCPOIEnrichmentModalHeaderView;
  v3 = -[UGCPOIEnrichmentModalHeaderView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UGCPOIEnrichmentModalHeaderView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("UGCPOIEnrichmentModalHeader"));
    v5 = objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration"));
    headerConfiguration = v4->_headerConfiguration;
    v4->_headerConfiguration = (ModalCardHeaderConfiguration *)v5;

    -[UGCPOIEnrichmentModalHeaderView _setupSubviews](v4, "_setupSubviews");
    -[UGCPOIEnrichmentModalHeaderView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupSubviews
{
  MapsThemeButton *v3;
  MapsThemeButton *leadingButton;
  MapsThemeButton *v5;
  MapsThemeButton *trailingButton;
  UGCPOIEnrichmentHeaderView *v7;
  UGCPOIEnrichmentHeaderView *poiIconView;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  UIProgressView *v15;
  UIProgressView *progressView;
  id v17;
  uint64_t v18;

  v3 = (MapsThemeButton *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderView createModalBarButtonItem](ModalCardHeaderView, "createModalBarButtonItem"));
  leadingButton = self->_leadingButton;
  self->_leadingButton = v3;

  -[MapsThemeButton setAccessibilityIdentifier:](self->_leadingButton, "setAccessibilityIdentifier:", CFSTR("LeadingButton"));
  v5 = (MapsThemeButton *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderView createModalBarButtonItem](ModalCardHeaderView, "createModalBarButtonItem"));
  trailingButton = self->_trailingButton;
  self->_trailingButton = v5;

  -[MapsThemeButton setAccessibilityIdentifier:](self->_trailingButton, "setAccessibilityIdentifier:", CFSTR("TrailingButton"));
  v7 = -[UGCPOIEnrichmentHeaderView initWithFrame:]([UGCPOIEnrichmentHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  poiIconView = self->_poiIconView;
  self->_poiIconView = v7;

  -[UGCPOIEnrichmentHeaderView setHideSummaryText:](self->_poiIconView, "setHideSummaryText:", 1);
  LODWORD(v9) = 1148829696;
  -[MapsThemeButton setContentCompressionResistancePriority:forAxis:](self->_leadingButton, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  LODWORD(v10) = 1148829696;
  -[MapsThemeButton setContentHuggingPriority:forAxis:](self->_leadingButton, "setContentHuggingPriority:forAxis:", 0, v10);
  LODWORD(v11) = 1148813312;
  -[MapsThemeButton setContentCompressionResistancePriority:forAxis:](self->_trailingButton, "setContentCompressionResistancePriority:forAxis:", 0, v11);
  LODWORD(v12) = 1148813312;
  v13 = -[MapsThemeButton setContentHuggingPriority:forAxis:](self->_trailingButton, "setContentHuggingPriority:forAxis:", 0, v12);
  if ((MapsFeature_IsEnabled_SydneyARP(v13, v14) & 1) == 0)
  {
    v15 = (UIProgressView *)objc_msgSend(objc_alloc((Class)UIProgressView), "initWithProgressViewStyle:", 1);
    progressView = self->_progressView;
    self->_progressView = v15;

  }
  -[UGCPOIEnrichmentModalHeaderView _updateSizeForCurrentConfiguration](self, "_updateSizeForCurrentConfiguration");
  -[UGCPOIEnrichmentModalHeaderView addSubview:](self, "addSubview:", self->_leadingButton);
  -[UGCPOIEnrichmentModalHeaderView addSubview:](self, "addSubview:", self->_trailingButton);
  v17 = -[UGCPOIEnrichmentModalHeaderView addSubview:](self, "addSubview:", self->_poiIconView);
  if ((MapsFeature_IsEnabled_SydneyARP(v17, v18) & 1) == 0)
    -[UGCPOIEnrichmentModalHeaderView addSubview:](self, "addSubview:", self->_progressView);
}

- (void)_updateSizeForCurrentConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](self->_leadingButton, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderConfiguration leadingButtonFontProvider](self->_headerConfiguration, "leadingButtonFontProvider"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v3, v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](self->_trailingButton, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderConfiguration trailingButtonFontProvider](self->_headerConfiguration, "trailingButtonFontProvider"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v6, v5);

}

- (void)_setupConstraints
{
  id v3;
  UGCPOIEnrichmentHeaderView *poiIconView;
  void *v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[3];

  v3 = objc_msgSend(objc_alloc((Class)MUCompositionalStackLayoutGroup), "initWithAxis:", 0);
  poiIconView = self->_poiIconView;
  v15[0] = self->_leadingButton;
  v15[1] = poiIconView;
  v15[2] = self->_trailingButton;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
  objc_msgSend(v3, "setArrangedLayoutItems:", v5);

  objc_msgSend(v3, "setAlignment:", 1);
  objc_msgSend(v3, "setAlignmentBoundsContent:", 1);
  LODWORD(v6) = 1112276992;
  objc_msgSend(v3, "setAlignmentFittingSizePriority:", v6);
  objc_msgSend(v3, "setInsets:", 0.0, 16.0, 0.0, 16.0);
  objc_msgSend(v3, "setSpacing:", 16.0);
  objc_msgSend(v3, "setPadding:forArrangedLayoutItem:", self->_leadingButton, 14.0, 0.0, 0.0, 0.0);
  objc_msgSend(v3, "setPadding:forArrangedLayoutItem:", self->_trailingButton, 14.0, 0.0, 0.0, 0.0);
  v7 = objc_msgSend(objc_alloc((Class)MUCompositionalStackLayoutGroup), "initWithAxis:", 1);
  v14 = v3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  objc_msgSend(v7, "setArrangedLayoutItems:", v8);

  if ((MapsFeature_IsEnabled_SydneyARP(v9, v10) & 1) == 0)
    objc_msgSend(v7, "addArrangedLayoutItem:", self->_progressView);
  v11 = objc_msgSend(objc_alloc((Class)MUCompositionalStackLayout), "initWithContainer:group:", self, v7);
  v13 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v12);

}

- (void)setMapItem:(id)a3
{
  -[UGCPOIEnrichmentHeaderView setMapItem:](self->_poiIconView, "setMapItem:", a3);
}

- (MKMapItem)mapItem
{
  return -[UGCPOIEnrichmentHeaderView mapItem](self->_poiIconView, "mapItem");
}

- (void)setObservedProgress:(id)a3
{
  -[UIProgressView setObservedProgress:](self->_progressView, "setObservedProgress:", a3);
}

- (NSProgress)observedProgress
{
  return -[UIProgressView observedProgress](self->_progressView, "observedProgress");
}

- (void)setProgress:(float)a3
{
  -[UIProgressView setProgress:](self->_progressView, "setProgress:");
}

- (float)progress
{
  float result;

  -[UIProgressView progress](self->_progressView, "progress");
  return result;
}

- (MapsThemeButton)leadingButton
{
  return self->_leadingButton;
}

- (MapsThemeButton)trailingButton
{
  return self->_trailingButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_headerConfiguration, 0);
  objc_storeStrong((id *)&self->_poiIconView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
