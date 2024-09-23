@implementation PhotoViewerToolbarController

- (PhotoViewerToolbarController)initWithMapItem:(id)a3
{
  id v5;
  PhotoViewerToolbarController *v6;
  PhotoViewerToolbarController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PhotoViewerToolbarController;
  v6 = -[PhotoViewerToolbarController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapItem, a3);

  return v7;
}

- (void)_addPhotoTapped
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PhotoViewerToolbarController delegate](self, "delegate"));
  objc_msgSend(v3, "photoViewerToolbarControllerTappedAddPhoto:", self);

}

- (void)_leftButtonTapped
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PhotoViewerToolbarController delegate](self, "delegate"));
  objc_msgSend(v3, "photoViewerToolbarControllerTappedLeft:", self);

}

- (void)_rightButtonTapped
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PhotoViewerToolbarController delegate](self, "delegate"));
  objc_msgSend(v3, "photoViewerToolbarControllerTappedRight:", self);

}

- (void)_morePhotosButtonTapped
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PhotoViewerToolbarController delegate](self, "delegate"));
  objc_msgSend(v3, "photoViewerToolbarControllerTappedMorePhotos:", self);

}

- (BOOL)shouldEnableReportAnIssue
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotoViewerToolbarController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "photoViewerToolbarControllerGetCurrentPhoto:", self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attribution"));

  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _mapkit_preferredFirstPhotoVendor](self->_mapItem, "_mapkit_preferredFirstPhotoVendor"));
  v6 = +[MKPOIEnrichmentAvailibility shouldShowReportAnIssueOnPhotoGalleryForMapItem:photoAttribution:](MKPOIEnrichmentAvailibility, "shouldShowReportAnIssueOnPhotoGalleryForMapItem:photoAttribution:", self->_mapItem, v5);

  return v6;
}

- (BOOL)shouldShowAddPhotoButton
{
  MKMapItem *mapItem;
  void *v3;
  unsigned __int8 v4;

  mapItem = self->_mapItem;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _mapkit_preferredFirstPhotoVendor](mapItem, "_mapkit_preferredFirstPhotoVendor"));
  v4 = +[MKPOIEnrichmentAvailibility shouldShowAddPhotoButtonsOnSingleFullScreenPhotoViewerForMapItem:photoAttribution:](MKPOIEnrichmentAvailibility, "shouldShowAddPhotoButtonsOnSingleFullScreenPhotoViewerForMapItem:photoAttribution:", mapItem, v3);

  return v4;
}

- (BOOL)shouldShowPhotoThumbnailFeed
{
  unsigned int v3;

  v3 = +[MKPOIEnrichmentAvailibility shouldShowMorePhotosGalleryForMapItem:](MKPOIEnrichmentAvailibility, "shouldShowMorePhotosGalleryForMapItem:", self->_mapItem);
  if (v3)
    LOBYTE(v3) = !-[PhotoViewerToolbarController shouldSuppressPhotoGrid](self, "shouldSuppressPhotoGrid");
  return v3;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (PhotoViewerToolbarControllerActionHandling)delegate
{
  return (PhotoViewerToolbarControllerActionHandling *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldSuppressPhotoGrid
{
  return self->_suppressPhotoGrid;
}

- (void)setSuppressPhotoGrid:(BOOL)a3
{
  self->_suppressPhotoGrid = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rapLayoutManger, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
