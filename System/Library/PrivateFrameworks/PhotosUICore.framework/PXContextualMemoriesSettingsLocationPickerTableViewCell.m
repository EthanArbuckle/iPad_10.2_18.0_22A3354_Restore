@implementation PXContextualMemoriesSettingsLocationPickerTableViewCell

- (PXContextualMemoriesSettingsLocationPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXContextualMemoriesSettingsLocationPickerTableViewCell *v4;
  PXContextualMemoriesSettingsLocationPickerTableViewCell *v5;
  PXPlacesMapView *v6;
  void *v7;
  uint64_t v8;
  PXPlacesMapView *mapView;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXContextualMemoriesSettingsLocationPickerTableViewCell;
  v4 = -[PXContextualMemoriesSettingsLocationPickerTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PXContextualMemoriesSettingsLocationPickerTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = [PXPlacesMapView alloc];
    -[PXContextualMemoriesSettingsLocationPickerTableViewCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = -[PXPlacesMapView initWithFrame:](v6, "initWithFrame:");
    mapView = v5->_mapView;
    v5->_mapView = (PXPlacesMapView *)v8;

    -[PXPlacesMapView setAutoresizingMask:](v5->_mapView, "setAutoresizingMask:", 18);
    -[PXPlacesMapView setShowsUserLocation:](v5->_mapView, "setShowsUserLocation:", 1);
    -[PXContextualMemoriesSettingsLocationPickerTableViewCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v5->_mapView);

  }
  return v5;
}

- (PXPlacesMapView)mapView
{
  return self->_mapView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
