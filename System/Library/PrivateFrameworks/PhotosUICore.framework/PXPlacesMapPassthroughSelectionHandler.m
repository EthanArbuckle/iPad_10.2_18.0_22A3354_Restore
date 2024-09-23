@implementation PXPlacesMapPassthroughSelectionHandler

- (id)selectedGeotaggablesForRenderable:(id)a3 mapView:(id)a4
{
  return (id)objc_msgSend(a3, "geotaggables");
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
