@implementation PXPlacesMapPointAnnotation

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; %lu geotaggables>"),
                       objc_opt_class(),
                       self,
                       -[NSOrderedSet count](self->geotaggables, "count"));
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->coordinate.latitude;
  longitude = self->coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->coordinate = a3;
}

- (PXPlacesMapRenderer)renderer
{
  return (PXPlacesMapRenderer *)objc_loadWeakRetained((id *)&self->renderer);
}

- (void)setRenderer:(id)a3
{
  objc_storeWeak((id *)&self->renderer, a3);
}

- (PXPlacesMapSelectionHandler)selectionHandler
{
  return (PXPlacesMapSelectionHandler *)objc_loadWeakRetained((id *)&self->selectionHandler);
}

- (void)setSelectionHandler:(id)a3
{
  objc_storeWeak((id *)&self->selectionHandler, a3);
}

- (NSOrderedSet)geotaggables
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGeotaggables:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)index
{
  return self->index;
}

- (void)setIndex:(int64_t)a3
{
  self->index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->geotaggables, 0);
  objc_destroyWeak((id *)&self->selectionHandler);
  objc_destroyWeak((id *)&self->renderer);
}

@end
