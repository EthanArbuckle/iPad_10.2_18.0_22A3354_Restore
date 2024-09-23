@implementation PXPlacesMapLayout

- (PXPlacesMapLayout)initWithDataSource:(id)a3
{
  id v5;
  PXPlacesMapLayout *v6;
  PXPlacesMapLayout *v7;

  v5 = a3;
  v6 = -[PXPlacesMapLayout init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (id)layoutForViewPort:(id)a3 andDataSourceChange:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXPlacesMapLayoutResultImpl *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  PXPlacesMapLayoutItemImpl *v27;
  PXPlacesMapLayoutItemImpl *v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapLayout.m"), 36, CFSTR("-[PXPlacesMapSimpleLayout layout] viewPort cannot be nil"));

  }
  -[PXPlacesMapLayout dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapLayout.m"), 37, CFSTR("-[PXPlacesMapSimpleLayout layout] dataSource cannot be nil"));

  }
  v10 = objc_alloc_init(PXPlacesMapLayoutResultImpl);
  objc_msgSend(v7, "mapRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[PXPlacesMapLayout dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "findItemsInMapRect:", v12, v14, v16, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v33;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v25);
        v27 = [PXPlacesMapLayoutItemImpl alloc];
        objc_msgSend(v26, "coordinate", (_QWORD)v32);
        v28 = -[PXPlacesMapLayoutItemImpl initWithCoordinate:](v27, "initWithCoordinate:");
        -[PXPlacesMapLayoutItemImpl addGeotaggable:](v28, "addGeotaggable:", v26);
        -[PXPlacesMapLayoutResultImpl addItem:](v10, "addItem:", v28);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v23);
  }

  return v10;
}

- (id)layoutItemForGeotaggable:(id)a3
{
  return 0;
}

- (PXPlacesGeotaggedItemDataSource)dataSource
{
  return (PXPlacesGeotaggedItemDataSource *)objc_getProperty(self, a2, 8, 1);
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
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
