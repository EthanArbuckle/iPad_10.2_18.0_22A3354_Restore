@implementation PXPlacesMapPinRenderer

- (int64_t)annotationType
{
  return 0;
}

- (UIEdgeInsets)minimumEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 20.0;
  v3 = 10.0;
  v4 = 5.0;
  v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)supportsMoveAnimations
{
  return 1;
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
  -[PXPlacesMapPinRenderer pipelineComponentProvider](self, "pipelineComponentProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "renderer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapPointAnnotation setRenderer:](v8, "setRenderer:", v10);

  -[PXPlacesMapPinRenderer pipelineComponentProvider](self, "pipelineComponentProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectionHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapPointAnnotation setSelectionHandler:](v8, "setSelectionHandler:", v12);

  -[PXPlacesMapPointAnnotation setGeotaggables:](v8, "setGeotaggables:", v7);
  return v8;
}

- (id)viewForAnnotation:(id)a3 andMapView:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableAnnotationViewWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "setAnnotation:", v5);
  else
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC18B0]), "initWithAnnotation:reuseIdentifier:", v5, v8);

  return v9;
}

- (PXPlacesMapPipelineComponentProvider)pipelineComponentProvider
{
  return (PXPlacesMapPipelineComponentProvider *)objc_loadWeakRetained((id *)&self->pipelineComponentProvider);
}

- (void)setPipelineComponentProvider:(id)a3
{
  objc_storeWeak((id *)&self->pipelineComponentProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->pipelineComponentProvider);
}

@end
