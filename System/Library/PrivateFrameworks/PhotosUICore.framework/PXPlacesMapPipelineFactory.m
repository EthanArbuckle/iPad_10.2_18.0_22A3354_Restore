@implementation PXPlacesMapPipelineFactory

+ (id)pinPipelineForDataSource:(id)a3
{
  id v3;
  PXPlacesMapGeometricClusterLayout *v4;
  PXPlacesMapInPlaceUpdatePlan *v5;
  PXPlacesMapPinRenderer *v6;
  PXPlacesMapPassthroughSelectionHandler *v7;
  PXPlacesMapPipeline *v8;

  v3 = a3;
  v4 = -[PXPlacesMapLayout initWithDataSource:]([PXPlacesMapGeometricClusterLayout alloc], "initWithDataSource:", v3);

  v5 = objc_alloc_init(PXPlacesMapInPlaceUpdatePlan);
  v6 = objc_alloc_init(PXPlacesMapPinRenderer);
  v7 = objc_alloc_init(PXPlacesMapPassthroughSelectionHandler);
  v8 = -[PXPlacesMapPipeline initWithLayout:updatePlan:renderer:selectionHandler:]([PXPlacesMapPipeline alloc], "initWithLayout:updatePlan:renderer:selectionHandler:", v4, v5, v6, v7);

  return v8;
}

+ (id)thumbnailPipelineForDataSource:(id)a3 extendedTraitCollection:(id)a4 geotaggableInfo:(id)a5 popoverImageType:(int64_t)a6 popoverImageOptions:(unint64_t)a7 countLabelStyle:(int64_t)a8 thumbnailCurationDelegate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  PXPlacesMapThumbnailClusterLayout *v24;
  PXPlacesMapInPlaceUpdatePlan *v25;
  PXPlacesMapThumbnailRenderer *v26;
  PXPlacesMapPassthroughSelectionHandler *v27;
  PXPlacesMapPipeline *v28;

  v15 = a9;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  +[PXPlacesPopoverImageFactory sharedInstance](PXPlacesPopoverImageFactory, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "backgroundImageSizeForType:usingTraitCollection:", a6, 0);
  v21 = v20;
  v23 = v22;

  v24 = -[PXPlacesMapLayout initWithDataSource:]([PXPlacesMapThumbnailClusterLayout alloc], "initWithDataSource:", v18);
  -[PXPlacesMapThumbnailClusterLayout setHorizontalClusteringDistancePixels:](v24, "setHorizontalClusteringDistancePixels:", v21);
  -[PXPlacesMapThumbnailClusterLayout setVerticalClusteringDistancePixels:](v24, "setVerticalClusteringDistancePixels:", v23);
  v25 = objc_alloc_init(PXPlacesMapInPlaceUpdatePlan);
  v26 = -[PXPlacesMapThumbnailRenderer initWithTraitCollection:informationDelegate:popoverImageType:popoverImageOptions:countLabelStyle:thumbnailCurationDelegate:]([PXPlacesMapThumbnailRenderer alloc], "initWithTraitCollection:informationDelegate:popoverImageType:popoverImageOptions:countLabelStyle:thumbnailCurationDelegate:", v17, v16, a6, a7, a8, v15);

  v27 = objc_alloc_init(PXPlacesMapPassthroughSelectionHandler);
  v28 = -[PXPlacesMapPipeline initWithLayout:updatePlan:renderer:selectionHandler:]([PXPlacesMapPipeline alloc], "initWithLayout:updatePlan:renderer:selectionHandler:", v24, v25, v26, v27);

  return v28;
}

@end
