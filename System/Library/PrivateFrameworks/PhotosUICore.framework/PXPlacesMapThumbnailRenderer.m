@implementation PXPlacesMapThumbnailRenderer

- (PXPlacesMapThumbnailRenderer)initWithTraitCollection:(id)a3 informationDelegate:(id)a4 popoverImageType:(int64_t)a5 popoverImageOptions:(unint64_t)a6 countLabelStyle:(int64_t)a7 thumbnailCurationDelegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  PXPlacesMapThumbnailRenderer *v18;
  PXPlacesMapThumbnailRenderer *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id extendedTraitObserver;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id location;
  objc_super v31;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v31.receiver = self;
  v31.super_class = (Class)PXPlacesMapThumbnailRenderer;
  v18 = -[PXPlacesMapThumbnailRenderer init](&v31, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_extendedTraitCollection, a3);
    objc_storeStrong((id *)&v19->_informationDelegate, a4);
    v19->_popoverImageType = a5;
    v19->_imageOptions = a6;
    v19->_countLabelStyle = a7;
    objc_storeWeak((id *)&v19->_thumbnailCurationDelegate, v17);
    objc_initWeak(&location, v19);
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __155__PXPlacesMapThumbnailRenderer_initWithTraitCollection_informationDelegate_popoverImageType_popoverImageOptions_countLabelStyle_thumbnailCurationDelegate___block_invoke;
    v28 = &unk_1E51441D8;
    objc_copyWeak(&v29, &location);
    v20 = _Block_copy(&v25);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v25, v26, v27, v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserverForName:object:queue:usingBlock:", CFSTR("kPKExtendedTraitCollectionChangedNotification"), 0, 0, v20);
    v22 = objc_claimAutoreleasedReturnValue();
    extendedTraitObserver = v19->_extendedTraitObserver;
    v19->_extendedTraitObserver = (id)v22;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v19;
}

- (PXPlacesMapThumbnailRenderer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapThumbnailRenderer.m"), 72, CFSTR("%s is not available as initializer"), "-[PXPlacesMapThumbnailRenderer init]");

  abort();
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapThumbnailRenderer extendedTraitObserver](self, "extendedTraitObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  v5.receiver = self;
  v5.super_class = (Class)PXPlacesMapThumbnailRenderer;
  -[PXPlacesMapThumbnailRenderer dealloc](&v5, sel_dealloc);
}

- (int64_t)annotationType
{
  return 0;
}

- (UIEdgeInsets)minimumEdgeInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  +[PXPlacesPopoverImageFactory sharedInstance](PXPlacesPopoverImageFactory, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundImageSizeForType:usingTraitCollection:", 2, self->_extendedTraitCollection);
  v5 = v4;
  v7 = v6;

  v8 = v7 + 20.0;
  v9 = v5 * 0.5 + 20.0;
  v10 = 20.0;
  v11 = v9;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (BOOL)supportsMoveAnimations
{
  return 0;
}

- (id)annotationForGeotaggables:(id)a3 initialCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v7;
  PXPlacesMapPointAnnotation *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3;
  v8 = objc_alloc_init(PXPlacesMapPointAnnotation);
  -[PXPlacesMapPointAnnotation setCoordinate:](v8, "setCoordinate:", latitude, longitude);
  -[PXPlacesMapPointAnnotation setGeotaggables:](v8, "setGeotaggables:", v7);

  -[PXPlacesMapThumbnailRenderer pipelineComponentProvider](self, "pipelineComponentProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "renderer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapPointAnnotation setRenderer:](v8, "setRenderer:", v10);

  -[PXPlacesMapThumbnailRenderer pipelineComponentProvider](self, "pipelineComponentProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectionHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapPointAnnotation setSelectionHandler:](v8, "setSelectionHandler:", v12);

  return v8;
}

- (id)viewForAnnotation:(id)a3 andMapView:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  PXPlacesMapThumbnailAnnotationView *v10;
  void *v11;
  void *v12;
  PXPlacesMapThumbnailAnnotationView *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableAnnotationViewWithIdentifier:", v9);
  v10 = (PXPlacesMapThumbnailAnnotationView *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PXPlacesMapThumbnailAnnotationView setAnnotation:](v10, "setAnnotation:", v6);
  }
  else
  {
    -[PXPlacesMapThumbnailRenderer pipelineComponentProvider](self, "pipelineComponentProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [PXPlacesMapThumbnailAnnotationView alloc];
    -[PXPlacesMapThumbnailRenderer extendedTraitCollection](self, "extendedTraitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXPlacesMapThumbnailAnnotationView initWithAnnotation:reuseIdentifier:extendedTraitCollection:imageCache:countLabelStyle:](v13, "initWithAnnotation:reuseIdentifier:extendedTraitCollection:imageCache:countLabelStyle:", v6, v9, v14, v12, -[PXPlacesMapThumbnailRenderer countLabelStyle](self, "countLabelStyle"));

  }
  -[PXPlacesMapThumbnailRenderer thumbnailCurationDelegate](self, "thumbnailCurationDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapThumbnailAnnotationView setThumbnailCurationDelegate:](v10, "setThumbnailCurationDelegate:", v15);

  return v10;
}

- (void)imageForGeotaggable:(id)a3 ofSize:(CGSize)a4 networkAccessAllowed:(BOOL)a5 andCompletion:(id)a6
{
  _BOOL8 v7;
  double height;
  double width;
  id v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v7 = a5;
  height = a4.height;
  width = a4.width;
  v15 = a3;
  v11 = a6;
  -[PXPlacesMapThumbnailRenderer informationDelegate](self, "informationDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[PXPlacesMapThumbnailRenderer informationDelegate](self, "informationDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageForGeotaggable:ofSize:networkAccessAllowed:andCompletion:", v15, v7, v11, width, height);

  }
}

- (int64_t)popoverImageType
{
  return self->_popoverImageType;
}

- (PXPlacesMapPipelineComponentProvider)pipelineComponentProvider
{
  return (PXPlacesMapPipelineComponentProvider *)objc_loadWeakRetained((id *)&self->pipelineComponentProvider);
}

- (void)setPipelineComponentProvider:(id)a3
{
  objc_storeWeak((id *)&self->pipelineComponentProvider, a3);
}

- (unint64_t)imageOptions
{
  return self->_imageOptions;
}

- (PXPlacesMapGeotaggableInfoDelegate)informationDelegate
{
  return (PXPlacesMapGeotaggableInfoDelegate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInformationDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PKExtendedTraitCollection)extendedTraitCollection
{
  return (PKExtendedTraitCollection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExtendedTraitCollection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)extendedTraitObserver
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setExtendedTraitObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PXPlacesMapThumbnailCurationDelegate)thumbnailCurationDelegate
{
  return (PXPlacesMapThumbnailCurationDelegate *)objc_loadWeakRetained((id *)&self->_thumbnailCurationDelegate);
}

- (void)setThumbnailCurationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailCurationDelegate, a3);
}

- (int64_t)countLabelStyle
{
  return self->_countLabelStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailCurationDelegate);
  objc_storeStrong(&self->_extendedTraitObserver, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_informationDelegate, 0);
  objc_destroyWeak((id *)&self->pipelineComponentProvider);
}

void __155__PXPlacesMapThumbnailRenderer_initWithTraitCollection_informationDelegate_popoverImageType_popoverImageOptions_countLabelStyle_thumbnailCurationDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  id v5;

  objc_msgSend(a2, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kPKExtendedTraitCollectionKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setExtendedTraitCollection:", v3);

  }
}

@end
