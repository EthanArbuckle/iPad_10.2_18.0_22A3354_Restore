@implementation PXPlacesSnapshotOptions

- (PXPlacesSnapshotOptions)init
{
  PXPlacesSnapshotOptions *result;
  __int128 v3;
  $2AEA816EAF9616B0E64737FB4BB06332 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPlacesSnapshotOptions;
  result = -[PXPlacesSnapshotOptions init](&v5, sel_init);
  if (result)
  {
    result->_visibleDistance = 10000.0;
    *(_WORD *)&result->_showsPointLabels = 1;
    v3 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&result->_additionalInsets.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&result->_additionalInsets.bottom = v3;
    result->_popoverImageType = 2;
    v4 = *($2AEA816EAF9616B0E64737FB4BB06332 *)(MEMORY[0x1E0CC1568] + 16);
    result->_region.center = (CLLocationCoordinate2D)*MEMORY[0x1E0CC1568];
    result->_region.span = v4;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;
  CGSize v33;
  UIEdgeInsets v34;

  v32.receiver = self;
  v32.super_class = (Class)PXPlacesSnapshotOptions;
  -[PXPlacesSnapshotOptions description](&v32, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[PXPlacesSnapshotOptions extendedTraitCollection](self, "extendedTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("\nExtended Trait Collection: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[PXPlacesSnapshotOptions geotaggableInformationDelegate](self, "geotaggableInformationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("\nGeotaggable Info Delegate: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[PXPlacesSnapshotOptions queue](self, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("\nQueue: %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[PXPlacesSnapshotOptions cacheDirectoryPath](self, "cacheDirectoryPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("\nCache Directory Path: %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[PXPlacesSnapshotOptions visibleDistance](self, "visibleDistance");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("\nVisible Distance: %f"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v19);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nSnapshot Map Type: %ld"), -[PXPlacesSnapshotOptions snapshotMapType](self, "snapshotMapType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v20);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nImage Popover Type: %ld"), -[PXPlacesSnapshotOptions popoverImageType](self, "popoverImageType"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v21);

  v22 = (void *)MEMORY[0x1E0CB3940];
  -[PXPlacesSnapshotOptions viewSize](self, "viewSize");
  NSStringFromCGSize(v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("\nView Size: %@"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v24);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nShould Skip Placeholder: %d"), -[PXPlacesSnapshotOptions shouldSkipPlaceholder](self, "shouldSkipPlaceholder"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v25);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nShows Point Labels: %d"), -[PXPlacesSnapshotOptions showsPointLabels](self, "showsPointLabels"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v26);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nShould Render Thumbnail For No Location: %d"), -[PXPlacesSnapshotOptions shouldRenderThumbnailForNoLocation](self, "shouldRenderThumbnailForNoLocation"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v27);

  v28 = (void *)MEMORY[0x1E0CB3940];
  -[PXPlacesSnapshotOptions additionalInsets](self, "additionalInsets");
  NSStringFromUIEdgeInsets(v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("\nAdditional Insets: %@"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v30);

  return v4;
}

- (PKExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (void)setExtendedTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_extendedTraitCollection, a3);
}

- (PXPlacesMapGeotaggableInfoDelegate)geotaggableInformationDelegate
{
  return self->_geotaggableInformationDelegate;
}

- (void)setGeotaggableInformationDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_geotaggableInformationDelegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)cacheDirectoryPath
{
  return self->_cacheDirectoryPath;
}

- (void)setCacheDirectoryPath:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDirectoryPath, a3);
}

- (double)visibleDistance
{
  return self->_visibleDistance;
}

- (void)setVisibleDistance:(double)a3
{
  self->_visibleDistance = a3;
}

- (unint64_t)snapshotMapType
{
  return self->_snapshotMapType;
}

- (void)setSnapshotMapType:(unint64_t)a3
{
  self->_snapshotMapType = a3;
}

- (int64_t)popoverImageType
{
  return self->_popoverImageType;
}

- (void)setPopoverImageType:(int64_t)a3
{
  self->_popoverImageType = a3;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

- (BOOL)shouldSkipPlaceholder
{
  return self->_shouldSkipPlaceholder;
}

- (void)setShouldSkipPlaceholder:(BOOL)a3
{
  self->_shouldSkipPlaceholder = a3;
}

- (BOOL)showsPointLabels
{
  return self->_showsPointLabels;
}

- (void)setShowsPointLabels:(BOOL)a3
{
  self->_showsPointLabels = a3;
}

- (BOOL)shouldRenderThumbnailForNoLocation
{
  return self->_shouldRenderThumbnailForNoLocation;
}

- (void)setShouldRenderThumbnailForNoLocation:(BOOL)a3
{
  self->_shouldRenderThumbnailForNoLocation = a3;
}

- (UIEdgeInsets)additionalInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalInsets.top;
  left = self->_additionalInsets.left;
  bottom = self->_additionalInsets.bottom;
  right = self->_additionalInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setAdditionalInsets:(UIEdgeInsets)a3
{
  self->_additionalInsets = a3;
}

- ($FF1229205817863B52D17A627F035FCE)region
{
  return self;
}

- (void)setRegion:(id *)a3
{
  CLLocationDegrees v3;
  CLLocationDegrees v4;
  double v5;
  double v6;

  self->_region.center.latitude = v3;
  self->_region.center.longitude = v4;
  self->_region.span.latitudeDelta = v5;
  self->_region.span.longitudeDelta = v6;
}

- (PXPlacesMapThumbnailCurationDelegate)mapThumbnailCurationDelegate
{
  return (PXPlacesMapThumbnailCurationDelegate *)objc_loadWeakRetained((id *)&self->_mapThumbnailCurationDelegate);
}

- (void)setMapThumbnailCurationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mapThumbnailCurationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapThumbnailCurationDelegate);
  objc_storeStrong((id *)&self->_cacheDirectoryPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_geotaggableInformationDelegate, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
}

@end
