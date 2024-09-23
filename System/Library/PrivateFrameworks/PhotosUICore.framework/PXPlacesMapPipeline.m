@implementation PXPlacesMapPipeline

- (PXPlacesMapPipeline)initWithLayout:(id)a3 updatePlan:(id)a4 renderer:(id)a5 selectionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PXPlacesMapPipeline *v15;
  PXPlacesMapPipeline *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXPlacesMapPipeline;
  v15 = -[PXPlacesMapPipeline init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_layout, a3);
    objc_storeStrong((id *)&v16->_updatePlan, a4);
    objc_storeStrong((id *)&v16->_renderer, a5);
    objc_storeStrong((id *)&v16->_selectionHandler, a6);
    -[PXPlacesMapLayout setPipelineComponentProvider:](v16->_layout, "setPipelineComponentProvider:", v16);
    -[PXPlacesMapUpdatePlan setPipelineComponentProvider:](v16->_updatePlan, "setPipelineComponentProvider:", v16);
    -[PXPlacesMapRenderer setPipelineComponentProvider:](v16->_renderer, "setPipelineComponentProvider:", v16);
    -[PXPlacesMapSelectionHandler setPipelineComponentProvider:](v16->_selectionHandler, "setPipelineComponentProvider:", v16);
  }

  return v16;
}

- (PXPlacesGeotaggedItemDataSource)dataSource
{
  return -[PXPlacesMapLayout dataSource](self->_layout, "dataSource");
}

- (id)executeWithUpdatedViewPort:(id)a3 andDataSourceChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[PXPlacesMapPipeline layout](self, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutForViewPort:andDataSourceChange:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPlacesMapPipeline updatePlan](self, "updatePlan");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultForNewLayoutResult:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)executeRemoval
{
  void *v3;
  void *v4;
  void *v5;

  -[PXPlacesMapPipeline updatePlan](self, "updatePlan");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removalPlanResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPlacesMapPipeline updatePlan](self, "updatePlan");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reset");

  return v4;
}

- (PXPlacesMapLayout)layout
{
  return (PXPlacesMapLayout *)objc_getProperty(self, a2, 8, 1);
}

- (PXPlacesMapUpdatePlan)updatePlan
{
  return (PXPlacesMapUpdatePlan *)objc_getProperty(self, a2, 16, 1);
}

- (PXPlacesMapRenderer)renderer
{
  return (PXPlacesMapRenderer *)objc_getProperty(self, a2, 24, 1);
}

- (PXPlacesMapSelectionHandler)selectionHandler
{
  return (PXPlacesMapSelectionHandler *)objc_getProperty(self, a2, 32, 1);
}

- (PXPlacesImageCache)imageCache
{
  return (PXPlacesImageCache *)objc_getProperty(self, a2, 40, 1);
}

- (void)setImageCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_updatePlan, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
