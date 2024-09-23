@implementation PXPlacesMapController

- (PXPlacesMapController)init
{
  char *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  dispatch_queue_t v10;
  void *v11;
  dispatch_queue_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  PXPlacesImageCache *v20;
  void *v21;
  __int128 v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PXPlacesMapController;
  v2 = -[PXPlacesMapController init](&v24, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    v4 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 5, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("dataSourcesQueue", v7);
    v9 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v8;

    v10 = dispatch_queue_create("pipelinesQueue", v7);
    v11 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v10;

    v12 = dispatch_queue_create("executionContextQueue", v7);
    v13 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v12;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v14;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v16;

    *(_OWORD *)(v2 + 152) = *MEMORY[0x1E0C9E500];
    v18 = *(_OWORD *)(MEMORY[0x1E0CC1568] + 16);
    *(_OWORD *)(v2 + 168) = *MEMORY[0x1E0CC1568];
    *(_OWORD *)(v2 + 184) = v18;
    v19 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)(v2 + 200) = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)(v2 + 216) = v19;
    v20 = objc_alloc_init(PXPlacesImageCache);
    v21 = (void *)*((_QWORD *)v2 + 17);
    *((_QWORD *)v2 + 17) = v20;

    v22 = *(_OWORD *)(MEMORY[0x1E0CC1648] + 16);
    *(_OWORD *)(v2 + 232) = *MEMORY[0x1E0CC1648];
    *(_OWORD *)(v2 + 248) = v22;

  }
  return (PXPlacesMapController *)v2;
}

- (void)dealloc
{
  NSObject *dataSourcesQueue;
  objc_super v4;
  _QWORD block[5];

  dataSourcesQueue = self->_dataSourcesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PXPlacesMapController_dealloc__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_sync(dataSourcesQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)PXPlacesMapController;
  -[PXPlacesMapController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  PXPlacesMapView *v3;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  MKMapPoint v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  PXPlacesMapView *mapView;
  CLLocationCoordinate2D v24;
  CLLocationCoordinate2D v25;

  v3 = objc_alloc_init(PXPlacesMapView);
  -[PXPlacesMapView setMapViewDelegate:](v3, "setMapViewDelegate:", self);
  -[PXPlacesMapController initialCenterCoordinate](self, "initialCenterCoordinate");
  latitude = v24.latitude;
  longitude = v24.longitude;
  if (CLLocationCoordinate2DIsValid(v24))
  {
    v25.latitude = latitude;
    v25.longitude = longitude;
    v6 = MKMapPointForCoordinate(v25);
    -[PXPlacesMapController _ensureMinimumSize:](self, "_ensureMinimumSize:", v6.x, v6.y, 1.0, 1.0);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[PXPlacesMapController initialEdgePadding](self, "initialEdgePadding");
    -[PXPlacesMapView setVisibleMapRect:edgePadding:animated:](v3, "setVisibleMapRect:edgePadding:animated:", 0, v8, v10, v12, v14, v15, v16, v17, v18);
  }
  else
  {
    -[PXPlacesMapController initialCoordinateRegion](self, "initialCoordinateRegion");
    if (v20 >= -180.0
      && v20 <= 180.0
      && v19 >= -90.0
      && v19 <= 90.0
      && v21 >= 0.0
      && v21 <= 180.0
      && v22 >= 0.0
      && v22 <= 360.0)
    {
      -[PXPlacesMapController initialCoordinateRegion](self, "initialCoordinateRegion");
      -[PXPlacesMapView setRegion:](v3, "setRegion:");
    }
  }
  mapView = self->_mapView;
  self->_mapView = v3;

}

- (PXPlacesMapView)mapView
{
  PXPlacesMapView *mapView;

  mapView = self->_mapView;
  if (!mapView)
  {
    -[PXPlacesMapController loadView](self, "loadView");
    mapView = self->_mapView;
  }
  return mapView;
}

- (id)createTrackingBarButtonItem
{
  void *v2;
  void *v3;

  -[PXPlacesMapController mapView](self, "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC19D8]), "initWithMapView:", v2);

  return v3;
}

- (void)addPipeline:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *dataSourcesQueue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  -[PXPlacesMapController cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageCache:", v5);

  objc_msgSend(v4, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dataSourcesQueue = self->_dataSourcesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PXPlacesMapController_addPipeline___block_invoke;
  block[3] = &unk_1E51457C8;
  block[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_sync(dataSourcesQueue, block);
  -[PXPlacesMapController _updateMapWithDataSource:dataSourceChange:completion:](self, "_updateMapWithDataSource:dataSourceChange:completion:", v9, 0, 0);

}

- (void)removeDataSource:(id)a3
{
  id v4;
  NSObject *dataSourcesQueue;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  size_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  dispatch_queue_t v24;
  id v25;
  uint64_t *v26;
  _QWORD block[5];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__75950;
  v34 = __Block_byref_object_dispose__75951;
  v35 = 0;
  dataSourcesQueue = self->_dataSourcesQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PXPlacesMapController_removeDataSource___block_invoke;
  block[3] = &unk_1E513FD98;
  v29 = &v30;
  block[4] = self;
  v7 = v4;
  v28 = v7;
  dispatch_sync(dataSourcesQueue, block);
  v8 = (void *)v31[5];
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, -1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("map update plan results", v10);
    v12 = objc_msgSend((id)v31[5], "count");
    dispatch_get_global_queue(25, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __42__PXPlacesMapController_removeDataSource___block_invoke_2;
    v23[3] = &unk_1E5121F00;
    v26 = &v30;
    v23[4] = self;
    v24 = v11;
    v14 = v9;
    v25 = v14;
    v15 = v11;
    dispatch_apply(v12, v13, v23);

    v21[0] = v6;
    v21[1] = 3221225472;
    v21[2] = __42__PXPlacesMapController_removeDataSource___block_invoke_5;
    v21[3] = &unk_1E5148D08;
    v21[4] = self;
    v22 = v14;
    v16 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], v21);

  }
  objc_msgSend(v7, "setDelegate:", 0);
  v17 = self->_dataSourcesQueue;
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __42__PXPlacesMapController_removeDataSource___block_invoke_6;
  v19[3] = &unk_1E5148D08;
  v19[4] = self;
  v20 = v7;
  v18 = v7;
  dispatch_sync(v17, v19);

  _Block_object_dispose(&v30, 8);
}

- (void)removePipeline:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *dataSourcesQueue;
  id v9;
  NSObject *pipelinesQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);
  void *v15;
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD v19[5];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD block[5];
  id v29;

  v4 = a3;
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PXPlacesMapController_removePipeline___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v7 = v4;
  v29 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__75950;
  v22[4] = __Block_byref_object_dispose__75951;
  v23 = 0;
  dataSourcesQueue = self->_dataSourcesQueue;
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __40__PXPlacesMapController_removePipeline___block_invoke_2;
  v19[3] = &unk_1E513FD98;
  v21 = v22;
  v19[4] = self;
  v9 = v5;
  v20 = v9;
  dispatch_sync(dataSourcesQueue, v19);
  pipelinesQueue = self->_pipelinesQueue;
  v12 = v6;
  v13 = 3221225472;
  v14 = __40__PXPlacesMapController_removePipeline___block_invoke_3;
  v15 = &unk_1E51401A8;
  v17 = v22;
  v11 = v7;
  v16 = v11;
  v18 = &v24;
  dispatch_sync(pipelinesQueue, &v12);
  if (*((_BYTE *)v25 + 24))
    -[PXPlacesMapController removeDataSource:](self, "removeDataSource:", v9, v12, v13, v14, v15);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

}

- (void)suspendPipelines
{
  self->_pipelineExecutionAllowed = 0;
}

- (void)resumePipelines:(id)a3
{
  self->_pipelineExecutionAllowed = 1;
  -[PXPlacesMapController _updateMapWithAllDataSources:](self, "_updateMapWithAllDataSources:", a3);
}

- (void)runPipelines
{
  -[PXPlacesMapController _updateMapWithAllDataSources:](self, "_updateMapWithAllDataSources:", 0);
}

- (id)visibleGeotaggableFromDataSource:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapController.m"), 452, CFSTR("-[PXPlacesMapController getViewableGeotags] dataSource cannot be nil"));

  }
  -[PXPlacesMapController mapView](self, "mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visibleMapRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v5, "findItemsInMapRect:", v8, v10, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)focusOnGeotaggablesFromPipeline:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  char v10;

  v4 = a4;
  v6 = a3;
  v10 = 0;
  -[PXPlacesMapController _mapRectForGeotaggablesFromPipeline:fitAdjusted:](self, "_mapRectForGeotaggablesFromPipeline:fitAdjusted:", v6, &v10);
  if (v8 != *MEMORY[0x1E0CC1648] || v7 != *(double *)(MEMORY[0x1E0CC1648] + 8))
  {
    if (v10)
      -[PXPlacesMapController _setVisibleMapRect:edgePadding:animated:](self, "_setVisibleMapRect:edgePadding:animated:", v4);
    else
      -[PXPlacesMapController setVisibleMapRect:forPipeline:animated:](self, "setVisibleMapRect:forPipeline:animated:", v6, v4);
  }

}

- (void)focusOnGeotaggablesFromPipelineImmediately:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  char v24;

  v4 = a3;
  v24 = 0;
  -[PXPlacesMapController _mapRectForGeotaggablesFromPipeline:fitAdjusted:](self, "_mapRectForGeotaggablesFromPipeline:fitAdjusted:", v4, &v24);
  v9 = v8;
  v10 = v5;
  if (v8 != *MEMORY[0x1E0CC1648] || v5 != *(double *)(MEMORY[0x1E0CC1648] + 8))
  {
    v12 = v6;
    v13 = v7;
    if (v24)
    {
      v14 = *MEMORY[0x1E0DC49E8];
      v15 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v17 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v16 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    }
    else
    {
      objc_msgSend(v4, "renderer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "minimumEdgeInsets");
      v14 = v19;
      v15 = v20;
      v17 = v21;
      v16 = v22;

    }
    -[PXPlacesMapController mapView](self, "mapView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setVisibleMapRect:edgePadding:animated:", 0, v9, v10, v12, v13, v14, v15, v17, v16);

  }
}

- ($FACAC4C914AA3357BF58EDB133E9B698)_mapRectForGeotaggablesFromPipeline:(id)a3 fitAdjusted:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  $FACAC4C914AA3357BF58EDB133E9B698 result;

  v6 = a3;
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "renderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPlacesMapController mapView](self, "mapView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  -[PXPlacesMapController mapRectForGeotaggablesFromDataSource:renderer:mapViewSize:fitAdjusted:](self, "mapRectForGeotaggablesFromDataSource:renderer:mapViewSize:fitAdjusted:", v7, v8, a4, v10, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.var1.var1 = v23;
  result.var1.var0 = v22;
  result.var0.var1 = v21;
  result.var0.var0 = v20;
  return result;
}

- ($FACAC4C914AA3357BF58EDB133E9B698)mapRectForGeotaggablesFromDataSource:(id)a3 renderer:(id)a4 mapViewSize:(CGSize)a5 fitAdjusted:(BOOL *)a6
{
  double height;
  double width;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  MKMapPoint v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CLLocationCoordinate2D v51;
  MKMapRect v52;
  $FACAC4C914AA3357BF58EDB133E9B698 result;
  MKMapRect v54;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  v13 = MEMORY[0x1E0CC1648];
  v14 = *MEMORY[0x1E0CC1648];
  v15 = *(double *)(MEMORY[0x1E0CC1648] + 8);
  objc_msgSend(v11, "minimalEncompassingMapRect");
  if (v17 == v14 && v16 == v15)
  {
    v33 = 0;
    v22 = *(double *)(v13 + 16);
    v24 = *(double *)(v13 + 24);
    if (!a6)
      goto LABEL_14;
LABEL_13:
    *a6 = v33;
    goto LABEL_14;
  }
  -[PXPlacesMapController _ensureMinimumSize:](self, "_ensureMinimumSize:");
  v14 = v19;
  v15 = v20;
  v22 = v21;
  v24 = v23;
  v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] == width && v25 == height)
    goto LABEL_10;
  objc_msgSend(v12, "minimumEdgeInsets", *MEMORY[0x1E0C9D820], v25);
  v49 = v27;
  v50 = v28;
  v47 = v29;
  v48 = v30;
  _MKMapRectThatFits();
  v31 = v52.size.width;
  v32 = v52.size.height;
  v54.origin.x = v14;
  v54.origin.y = v15;
  v54.size.width = v22;
  v54.size.height = v24;
  if (MKMapRectContainsRect(v52, v54))
  {
LABEL_10:
    v33 = 0;
    if (!a6)
      goto LABEL_14;
    goto LABEL_13;
  }
  objc_msgSend(v11, "allItems", v47, v48, v49, v50);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithSet:", v38);
  objc_msgSend(v39, "sortUsingComparator:", &__block_literal_global_94);
  objc_msgSend(v39, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  v33 = v40 != 0;
  if (v40)
  {
    objc_msgSend(v40, "coordinate");
    v42 = MKMapPointForCoordinate(v51);
    +[PXPlacesMapView canonicalMapRect:](PXPlacesMapView, "canonicalMapRect:", v42.x - v31 * 0.5, v42.y - v32 * 0.5, v31, v32);
    _MKMapRectThatFits();
    v14 = v43;
    v15 = v44;
    v22 = v45;
    v24 = v46;
  }

  if (a6)
    goto LABEL_13;
LABEL_14:

  v34 = v14;
  v35 = v15;
  v36 = v22;
  v37 = v24;
  result.var1.var1 = v37;
  result.var1.var0 = v36;
  result.var0.var1 = v35;
  result.var0.var0 = v34;
  return result;
}

- ($FACAC4C914AA3357BF58EDB133E9B698)mapRectForNearbyQueriesFromRect:(id)a3 atScale:(double)a4 targetViewSize:(CGSize)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  $FACAC4C914AA3357BF58EDB133E9B698 result;

  +[PXPlacesMapView canonicalMapRect:](PXPlacesMapView, "canonicalMapRect:", a3.var0.var0 + a3.var1.var0 * 0.5 - a5.width * a4 * 0.5, a3.var0.var1 + a3.var1.var1 * 0.5 - a5.height * a4 * 0.5, a5.width * a4, a5.height * a4);
  result.var1.var1 = v8;
  result.var1.var0 = v7;
  result.var0.var1 = v6;
  result.var0.var0 = v5;
  return result;
}

- (void)_showDebugMapRect:(id)a3 color:(id)a4
{
  double var1;
  double var0;
  double v6;
  double v7;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[9];

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v6 = a3.var0.var1;
  v7 = a3.var0.var0;
  v19[8] = *MEMORY[0x1E0C80C00];
  v19[0] = *(_QWORD *)&a3.var0.var0;
  v19[1] = *(_QWORD *)&a3.var0.var1;
  *(double *)&v19[2] = a3.var0.var0 + a3.var1.var0;
  v19[3] = *(_QWORD *)&a3.var0.var1;
  *(double *)&v19[4] = a3.var0.var0 + a3.var1.var0;
  *(double *)&v19[5] = a3.var0.var1 + a3.var1.var1;
  v19[6] = *(_QWORD *)&a3.var0.var0;
  *(double *)&v19[7] = a3.var0.var1 + a3.var1.var1;
  v9 = (void *)MEMORY[0x1E0CC1918];
  v10 = a4;
  objc_msgSend(v9, "polygonWithPoints:count:", v19, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v7, *(_QWORD *)&v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&var0, *(_QWORD *)&var1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("{%@, %@}"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setTitle:", v15);
  -[PXPlacesMapController showDebugMapRectColors](self, "showDebugMapRectColors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v10, v17);

  -[PXPlacesMapController mapView](self, "mapView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOverlay:", v11);

}

- (void)setVisibleMapRect:(id)a3 forPipeline:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double var1;
  double var0;
  double v8;
  double v9;
  id v11;

  v5 = a5;
  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v8 = a3.var0.var1;
  v9 = a3.var0.var0;
  objc_msgSend(a4, "renderer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapController setVisibleMapRect:forRenderer:animated:](self, "setVisibleMapRect:forRenderer:animated:", v11, v5, v9, v8, var0, var1);

}

- (void)setVisibleMapRect:(id)a3 forRenderer:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double var1;
  double var0;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = a5;
  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v8 = a3.var0.var1;
  v9 = a3.var0.var0;
  objc_msgSend(a4, "minimumEdgeInsets");
  -[PXPlacesMapController _setVisibleMapRect:edgePadding:animated:](self, "_setVisibleMapRect:edgePadding:animated:", v5, v9, v8, var0, var1, v11, v12, v13, v14);
}

- (void)_setVisibleMapRect:(id)a3 edgePadding:(UIEdgeInsets)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double right;
  double bottom;
  double left;
  double top;
  double var1;
  double var0;
  double v12;
  double v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;

  v5 = a5;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v12 = a3.var0.var1;
  v13 = a3.var0.var0;
  -[PXPlacesMapController mapView](self, "mapView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setVisibleMapRect:edgePadding:animated:", v5, v13, v12, var0, var1, top, left, bottom, right);

  -[PXPlacesMapController focusDelegate](self, "focusDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (-[PXPlacesMapController mapViewIsVisible](self, "mapViewIsVisible"))
    {
      -[PXPlacesMapController setSignalFocusWhenMapViewBecomesVisible:](self, "setSignalFocusWhenMapViewBecomesVisible:", 0);
      -[PXPlacesMapController mapView](self, "mapView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentViewPortWithThumbnailOverscan");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scale");
      v20 = v19;

      -[PXPlacesMapController focusDelegate](self, "focusDelegate");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "mapFocusDidChange:toRect:scale:", self, v13, v12, var0, var1, v20);

    }
    else
    {
      -[PXPlacesMapController setSignalFocusWhenMapViewBecomesVisible:](self, "setSignalFocusWhenMapViewBecomesVisible:", 1);
      -[PXPlacesMapController setSignalFocusMapRect:](self, "setSignalFocusMapRect:", v13, v12, var0, var1);
    }
  }
}

- (void)setVisibleMapRelativeToViewPort:(id)a3 andViewSize:(CGSize)a4 forRenderer:(id)a5
{
  double height;
  double width;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  height = a4.height;
  width = a4.width;
  v20 = a5;
  v9 = a3;
  objc_msgSend(v9, "mapRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v9, "scale");
  v19 = v18;

  +[PXPlacesMapView mapRectForNearbyQueriesFromRect:atScale:targetViewSize:](PXPlacesMapView, "mapRectForNearbyQueriesFromRect:atScale:targetViewSize:", v11, v13, v15, v17, v19, width, height);
  -[PXPlacesMapController setVisibleMapRect:forRenderer:animated:](self, "setVisibleMapRect:forRenderer:animated:", v20, 0);

}

- ($FACAC4C914AA3357BF58EDB133E9B698)_ensureMinimumSize:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  CLLocationCoordinate2D v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  MKMapPoint v13;
  MKMapRect v14;
  MKMapRect v16;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v13.x = a3.var0.var0 + a3.var1.var0 * 0.5;
  v13.y = a3.var0.var1 + a3.var1.var1 * 0.5;
  v7 = MKCoordinateForMapPoint(v13);
  v8 = MEMORY[0x1A85CBCB0](v7.latitude, v7.longitude);
  +[PXPlacesMapView canonicalMapRect:](PXPlacesMapView, "canonicalMapRect:", v6 - v8 * 500.0 * 0.5, v5 - v8 * 500.0 * 0.5, v8 * 500.0, v8 * 500.0);
  v16.origin.x = v9;
  v16.origin.y = v10;
  v16.size.width = v11;
  v16.size.height = v12;
  v14.origin.x = v6;
  v14.origin.y = v5;
  v14.size.width = var0;
  v14.size.height = var1;
  return ($FACAC4C914AA3357BF58EDB133E9B698)MKMapRectUnion(v14, v16);
}

- (void)_updateMapWithAllDataSources:(id)a3
{
  id v4;
  NSObject *dataSourcesQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__75950;
  v11 = __Block_byref_object_dispose__75951;
  v12 = 0;
  dataSourcesQueue = self->_dataSourcesQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PXPlacesMapController__updateMapWithAllDataSources___block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dataSourcesQueue, v6);
  -[PXPlacesMapController _updateMapWithDataSources:dataSourceChangeTable:completion:](self, "_updateMapWithDataSources:dataSourceChangeTable:completion:", v8[5], 0, v4);
  _Block_object_dispose(&v7, 8);

}

- (void)_updateMapWithDataSources:(id)a3 dataSourceChangeTable:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_group_t v14;
  size_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[5];
  id v22;
  dispatch_group_t v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapController _updateMapWithDataSource:dataSourceChange:completion:](self, "_updateMapWithDataSource:dataSourceChange:completion:", v11, v13, v10);

  }
  else if (objc_msgSend(v8, "count"))
  {
    v14 = dispatch_group_create();
    v15 = objc_msgSend(v8, "count");
    dispatch_get_global_queue(25, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke;
    block[3] = &unk_1E5121F48;
    block[4] = self;
    v22 = v8;
    v23 = v14;
    v24 = v9;
    v18 = v14;
    dispatch_apply(v15, v16, block);

    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke_4;
    v19[3] = &unk_1E5148A40;
    v20 = v10;
    dispatch_group_notify(v18, v16, v19);

  }
}

- (id)executePipeline:(id)a3 dataSourceChange:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "startTimerForPipeline:", v9);
  objc_msgSend(v7, "viewPort");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeWithUpdatedViewPort:andDataSourceChange:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stopTimerForPipeline:", v9);
  return v11;
}

- (void)_updateMapWithDataSource:(id)a3 dataSourceChange:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *executionContextQueue;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXPlacesMapController dataSources](self, "dataSources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v8);

  if (v12 && v8 && self->_pipelineExecutionAllowed)
  {
    executionContextQueue = self->_executionContextQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke;
    v14[3] = &unk_1E5148370;
    v14[4] = self;
    v15 = v8;
    v17 = v10;
    v16 = v9;
    dispatch_async(executionContextQueue, v14);

  }
}

- (double)_defaultAnimationDuration
{
  return 0.3;
}

- (double)_fadeInAnimationDuration
{
  return 0.15;
}

- (double)_fadeOutAnimationDuration
{
  return 0.4;
}

- (void)_executeUpdatePlanResults:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  os_signpost_id_t spid;
  unint64_t v63;
  NSObject *v64;
  void *v65;
  id obj;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[5];
  id v76;
  _QWORD v77[4];
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t buf[16];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKPlacesKitGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  PKPlacesKitGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  spid = v6;
  v63 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ExecuteUpdatePlanResults", ", buf, 2u);
  }
  v64 = v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v4;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v88 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
        objc_msgSend(v14, "annotationsToAddImmediately");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObjectsFromArray:", v16);

        objc_msgSend(v14, "annotationsToRemoveImmediately");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "allObjects");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v18);

        objc_msgSend(v14, "annotationsToRedraw");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObjectsFromArray:", v20);

        objc_msgSend(v14, "annotationsWithUpdatedIndex");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v22);

        objc_msgSend(v14, "overlaysToAddImmediately");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "allObjects");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "addObjectsFromArray:", v24);

        objc_msgSend(v14, "overlaysToRemoveImmediately");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "allObjects");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addObjectsFromArray:", v26);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    }
    while (v11);
  }

  -[PXPlacesMapController mapView](self, "mapView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addOverlays:", v68);

  -[PXPlacesMapController mapView](self, "mapView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeOverlays:", v67);

  if (objc_msgSend(v70, "count"))
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v29 = v70;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v84 != v31)
            objc_enumerationMutation(v29);
          v33 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j);
          -[PXPlacesMapController mapView](self, "mapView");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "viewForAnnotation:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
            objc_msgSend(v35, "setAnnotation:", v33);

        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
      }
      while (v30);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v36 = v9;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v80;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v80 != v38)
          objc_enumerationMutation(v36);
        v40 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * k);
        -[PXPlacesMapController mapView](self, "mapView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "viewForAnnotation:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v42, "conformsToProtocol:", &unk_1EEB597C0))
          objc_msgSend(v65, "addObject:", v42);

      }
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
    }
    while (v37);
  }

  if (objc_msgSend(v65, "count"))
  {
    v43 = (void *)MEMORY[0x1E0DC3F10];
    -[PXPlacesMapController _fadeOutAnimationDuration](self, "_fadeOutAnimationDuration");
    v45 = v44;
    v46 = MEMORY[0x1E0C809B0];
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __51__PXPlacesMapController__executeUpdatePlanResults___block_invoke;
    v77[3] = &unk_1E5149198;
    v78 = v65;
    v75[0] = v46;
    v75[1] = 3221225472;
    v75[2] = __51__PXPlacesMapController__executeUpdatePlanResults___block_invoke_2;
    v75[3] = &unk_1E5144558;
    v75[4] = self;
    v76 = v36;
    objc_msgSend(v43, "animateWithDuration:animations:completion:", v77, v75, v45);

    v47 = v78;
  }
  else
  {
    -[PXPlacesMapController mapView](self, "mapView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "removeAnnotations:", v36);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v48 = v10;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v72;
    do
    {
      for (m = 0; m != v49; ++m)
      {
        if (*(_QWORD *)v72 != v50)
          objc_enumerationMutation(v48);
        v52 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * m);
        -[PXPlacesMapController mapView](self, "mapView");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "viewForAnnotation:", v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54 && objc_msgSend(v52, "conformsToProtocol:", &unk_1EEB5F3D8))
        {
          v55 = v52;
          -[PXPlacesMapController _zPositionForAnnotationIndex:](self, "_zPositionForAnnotationIndex:", objc_msgSend(v55, "index"));
          v57 = v56;
          objc_msgSend(v54, "layer");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setZPosition:", v57);

        }
      }
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
    }
    while (v49);
  }

  if (objc_msgSend(v69, "count"))
  {
    -[PXPlacesMapController mapView](self, "mapView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addAnnotations:", v69);

  }
  v60 = v64;
  v61 = v60;
  if (v63 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v61, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteUpdatePlanResults", ", buf, 2u);
  }

}

- (double)_zPositionForAnnotationIndex:(int64_t)a3
{
  return (double)-a3;
}

- (NSOrderedSet)currentSelectedGeotaggables
{
  void *v2;
  void *v3;
  void *v4;

  -[PXPlacesMapController currentSelection](self, "currentSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EEB5F3D8))
  {
    objc_msgSend(v2, "geotaggables");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }

  return (NSOrderedSet *)v4;
}

- (void)dataSource:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v7, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12);
        -[PXPlacesMapController cache](self, "cache");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeCachedRenderedImageForGeotaggble:andKey:", v13, 0);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v7, "updatedItems", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19);
        -[PXPlacesMapController cache](self, "cache");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeCachedRenderedImageForGeotaggble:andKey:", v20, 0);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  -[PXPlacesMapController _updateMapWithDataSource:dataSourceChange:completion:](self, "_updateMapWithDataSource:dataSourceChange:completion:", v6, v7, 0);
  -[PXPlacesMapController changeDelegate](self, "changeDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dataSourceDidChange:", self);

}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5;

  -[PXPlacesMapController _updateMapWithAllDataSources:](self, "_updateMapWithAllDataSources:", 0, a4);
  -[PXPlacesMapController changeDelegate](self, "changeDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapRegionDidChange:", self);

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EEB5F3D8))
  {
    objc_msgSend(v5, "renderer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapController mapView](self, "mapView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewForAnnotation:andMapView:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void (**v30)(_QWORD);
  void *v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  void (**v47)(_QWORD);
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD aBlock[5];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v59 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v10, "annotation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EEBEADE0))
          objc_msgSend(v41, "addObject:", v11);
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EEB5F3D8))
        {
          -[PXPlacesMapController _zPositionForAnnotationIndex:](self, "_zPositionForAnnotationIndex:", objc_msgSend(v11, "index"));
          v13 = v12;
          objc_msgSend(v10, "layer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setZPosition:", v13);

        }
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EEB597C0))
        {
          objc_msgSend(v10, "layer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v16) = 0;
          objc_msgSend(v15, "setOpacity:", v16);

          objc_msgSend(v5, "addObject:", v10);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v7);
  }

  -[PXPlacesMapPipelineExecutionContext updatePlanResults](self->_currentExecutionContext, "updatePlanResults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v20 = v17;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v55 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend(v25, "annotationsToRemoveAfterAnimationHasStarted");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "unionSet:", v26);

        objc_msgSend(v25, "annotationsToRemoveAfterAnimationHasEnded");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "unionSet:", v27);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v22);
  }

  v28 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke;
  aBlock[3] = &unk_1E5148D08;
  aBlock[4] = self;
  v29 = v19;
  v53 = v29;
  v30 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v41, "count"))
  {
    v50[0] = v28;
    v50[1] = 3221225472;
    v50[2] = __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_2;
    v50[3] = &unk_1E5149198;
    v51 = v41;
    v31 = _Block_copy(v50);
    v32 = (void *)MEMORY[0x1E0DC3F10];
    -[PXPlacesMapController _defaultAnimationDuration](self, "_defaultAnimationDuration");
    v34 = v33;
    v48[0] = v28;
    v48[1] = 3221225472;
    v48[2] = __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_3;
    v48[3] = &unk_1E5148A40;
    v49 = v31;
    v46[0] = v28;
    v46[1] = 3221225472;
    v46[2] = __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_4;
    v46[3] = &unk_1E513FE10;
    v47 = v30;
    v35 = v31;
    objc_msgSend(v32, "animateWithDuration:animations:completion:", v48, v46, v34);

  }
  else
  {
    v30[2](v30);
  }
  if (objc_msgSend(v5, "count"))
  {
    v36 = (void *)MEMORY[0x1E0DC3F10];
    -[PXPlacesMapController _fadeInAnimationDuration](self, "_fadeInAnimationDuration");
    v38 = v37;
    v44[0] = v28;
    v44[1] = 3221225472;
    v44[2] = __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_5;
    v44[3] = &unk_1E5149198;
    v45 = v5;
    objc_msgSend(v36, "animateWithDuration:animations:", v44, v38);

  }
  if (objc_msgSend(v18, "count"))
  {
    -[PXPlacesMapController mapView](self, "mapView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allObjects");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "removeAnnotations:", v40);

  }
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(a4, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EEB5F3D8))
    {
      -[PXPlacesMapController selectionDelegate](self, "selectionDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v7, "selectionHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "selectedGeotaggablesForRenderable:mapView:", v7, v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPlacesMapController setCurrentSelection:](self, "setCurrentSelection:", v7);
        if (v10)
        {
          -[PXPlacesMapController selectionDelegate](self, "selectionDelegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXPlacesMapController mapView](self, "mapView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "didSelectGeotaggableItems:fromMapView:", v10, v12);

        }
      }
    }
  }

}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v6 = a4;
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EEB5F3D8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapController.m"), 1108, CFSTR("Parameter 'overlay' must conform to <PXPlacesMapRenderable>."));

  }
  v7 = v6;
  objc_msgSend(v7, "renderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "conformsToProtocol:", &unk_1EEBEAE40)
    || (v9 = v8,
        -[PXPlacesMapController mapView](self, "mapView"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "rendererForOverlay:andMapView:", v7, v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v10,
        !v11))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapController.m"), 1118, CFSTR("Function requires a non-null value for overlayRenderer"));

    v11 = 0;
  }

  return v11;
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  id v5;

  -[PXPlacesMapController stateDelegate](self, "stateDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapViewDidFinishRendering:", self);

}

- (void)mapContainerViewWillAppear
{
  id v2;

  -[PXPlacesMapController mapView](self, "mapView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deselectAllAnnotationsAnimated:", 0);

}

- (void)mapContainerViewDidAppear
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXPlacesMapController setMapViewIsVisible:](self, "setMapViewIsVisible:", 1);
  if (-[PXPlacesMapController signalFocusWhenMapViewBecomesVisible](self, "signalFocusWhenMapViewBecomesVisible"))
  {
    -[PXPlacesMapController setSignalFocusWhenMapViewBecomesVisible:](self, "setSignalFocusWhenMapViewBecomesVisible:", 0);
    -[PXPlacesMapController focusDelegate](self, "focusDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PXPlacesMapController mapView](self, "mapView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentViewPortWithThumbnailOverscan");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scale");

      -[PXPlacesMapController focusDelegate](self, "focusDelegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXPlacesMapController signalFocusMapRect](self, "signalFocusMapRect");
      objc_msgSend(v6, "mapFocusDidChange:toRect:scale:", self);

    }
  }
}

- (void)mapContainerViewDidDisappear
{
  -[PXPlacesMapController setMapViewIsVisible:](self, "setMapViewIsVisible:", 0);
}

- (PXPlacesMapControllerSelectionDelegate)selectionDelegate
{
  return (PXPlacesMapControllerSelectionDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (PXPlacesMapControllerChangeDelegate)changeDelegate
{
  return (PXPlacesMapControllerChangeDelegate *)objc_loadWeakRetained((id *)&self->_changeDelegate);
}

- (void)setChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_changeDelegate, a3);
}

- (PXPlacesMapControllerFocusDelegate)focusDelegate
{
  return (PXPlacesMapControllerFocusDelegate *)objc_loadWeakRetained((id *)&self->_focusDelegate);
}

- (void)setFocusDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_focusDelegate, a3);
}

- (PXPlacesMapControllerLoadingStateDelegate)stateDelegate
{
  return (PXPlacesMapControllerLoadingStateDelegate *)objc_loadWeakRetained((id *)&self->_stateDelegate);
}

- (void)setStateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stateDelegate, a3);
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (CLLocationCoordinate2D)initialCenterCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_initialCenterCoordinate.latitude;
  longitude = self->_initialCenterCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setInitialCenterCoordinate:(CLLocationCoordinate2D)a3
{
  self->_initialCenterCoordinate = a3;
}

- ($FF1229205817863B52D17A627F035FCE)initialCoordinateRegion
{
  return self;
}

- (void)setInitialCoordinateRegion:(id *)a3
{
  CLLocationDegrees v3;
  CLLocationDegrees v4;
  double v5;
  double v6;

  self->_initialCoordinateRegion.center.latitude = v3;
  self->_initialCoordinateRegion.center.longitude = v4;
  self->_initialCoordinateRegion.span.latitudeDelta = v5;
  self->_initialCoordinateRegion.span.longitudeDelta = v6;
}

- (UIEdgeInsets)initialEdgePadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_initialEdgePadding.top;
  left = self->_initialEdgePadding.left;
  bottom = self->_initialEdgePadding.bottom;
  right = self->_initialEdgePadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInitialEdgePadding:(UIEdgeInsets)a3
{
  self->_initialEdgePadding = a3;
}

- (MKAnnotation)currentSelection
{
  return self->_currentSelection;
}

- (void)setCurrentSelection:(id)a3
{
  objc_storeStrong((id *)&self->_currentSelection, a3);
}

- (NSSet)dataSources
{
  return (NSSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDataSources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMapTable)dataSourceToPipelineMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDataSourceToPipelineMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PXPlacesMapPipelineExecutionContext)currentExecutionContext
{
  return (PXPlacesMapPipelineExecutionContext *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentExecutionContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)pipelineExecutionAllowed
{
  return self->_pipelineExecutionAllowed;
}

- (void)setPipelineExecutionAllowed:(BOOL)a3
{
  self->_pipelineExecutionAllowed = a3;
}

- (BOOL)mapViewIsVisible
{
  return self->_mapViewIsVisible;
}

- (void)setMapViewIsVisible:(BOOL)a3
{
  self->_mapViewIsVisible = a3;
}

- (BOOL)signalFocusWhenMapViewBecomesVisible
{
  return self->_signalFocusWhenMapViewBecomesVisible;
}

- (void)setSignalFocusWhenMapViewBecomesVisible:(BOOL)a3
{
  self->_signalFocusWhenMapViewBecomesVisible = a3;
}

- ($FACAC4C914AA3357BF58EDB133E9B698)signalFocusMapRect
{
  double x;
  double y;
  double width;
  double height;
  $FACAC4C914AA3357BF58EDB133E9B698 result;

  x = self->_signalFocusMapRect.origin.x;
  y = self->_signalFocusMapRect.origin.y;
  width = self->_signalFocusMapRect.size.width;
  height = self->_signalFocusMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setSignalFocusMapRect:(id)a3
{
  self->_signalFocusMapRect = ($14856638CADB89CDFC2B2EA2E4D627B4)a3;
}

- (PXPlacesImageCache)cache
{
  return (PXPlacesImageCache *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSMutableDictionary)showDebugMapRectColors
{
  return self->_showDebugMapRectColors;
}

- (void)setShowDebugMapRectColors:(id)a3
{
  objc_storeStrong((id *)&self->_showDebugMapRectColors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showDebugMapRectColors, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_currentExecutionContext, 0);
  objc_storeStrong((id *)&self->_dataSourceToPipelineMap, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_currentSelection, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->_stateDelegate);
  objc_destroyWeak((id *)&self->_focusDelegate);
  objc_destroyWeak((id *)&self->_changeDelegate);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_pendingDataSourceChanges, 0);
  objc_storeStrong((id *)&self->_dataSourceExecutionContexts, 0);
  objc_storeStrong((id *)&self->_uiUpdateTimer, 0);
  objc_storeStrong((id *)&self->_executionContextQueue, 0);
  objc_storeStrong((id *)&self->_dataSourcesQueue, 0);
  objc_storeStrong((id *)&self->_pipelinesQueue, 0);
}

void __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnnotations:", v2);

}

void __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  double latitude;
  double longitude;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;
  CLLocationCoordinate2D v15;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v6, "animationDestinationCoordinate", (_QWORD)v9);
        latitude = v15.latitude;
        longitude = v15.longitude;
        if (CLLocationCoordinate2DIsValid(v15))
          objc_msgSend(v6, "setCoordinate:", latitude, longitude);
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

}

uint64_t __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__PXPlacesMapController_mapView_didAddAnnotationViews___block_invoke_5(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "layer", (_QWORD)v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v7) = 1.0;
        objc_msgSend(v6, "setOpacity:", v7);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

void __51__PXPlacesMapController__executeUpdatePlanResults___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "layer", (_QWORD)v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v7) = 0;
        objc_msgSend(v6, "setOpacity:", v7);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

void __51__PXPlacesMapController__executeUpdatePlanResults___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAnnotations:", *(_QWORD *)(a1 + 40));

}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke(id *a1)
{
  id v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  PXPlacesMapPipelineExecutionContext *v6;
  PXPlacesMapPipelineExecutionContext *v7;
  PXPlacesMapPipelineExecutionContext *v8;
  uint64_t v9;
  PXPlacesMapPipelineExecutionContext *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  PXPlacesMapPipelineExecutionContext *v26;
  dispatch_queue_t v27;
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[5];
  id v32;
  PXPlacesMapPipelineExecutionContext *v33;
  id v34;
  uint64_t *v35;
  _QWORD aBlock[4];
  PXPlacesMapPipelineExecutionContext *v37;
  id v38;
  id v39;
  uint64_t *v40;
  _QWORD v41[5];
  id v42;
  uint64_t *v43;
  _QWORD v44[6];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD block[5];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__75950;
  v58 = __Block_byref_object_dispose__75951;
  v59 = 0;
  v2 = a1[4];
  v3 = a1[5];
  v4 = *((_QWORD *)v2 + 2);
  block[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_2;
  block[3] = &unk_1E513FD98;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v53 = &v54;
  block[4] = v2;
  v52 = v3;
  dispatch_sync(v4, block);
  if (!*((_QWORD *)a1[4] + 16) && objc_msgSend((id)v55[5], "count"))
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__75950;
    v49 = __Block_byref_object_dispose__75951;
    v50 = 0;
    v44[0] = v5;
    v44[1] = 3221225472;
    v44[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_3;
    v44[3] = &unk_1E5148AA8;
    v44[4] = a1[4];
    v44[5] = &v45;
    dispatch_sync(MEMORY[0x1E0C80D38], v44);
    v8 = [PXPlacesMapPipelineExecutionContext alloc];
    v9 = v46[5];
    v41[0] = v5;
    v41[1] = 3221225472;
    v41[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_4;
    v41[3] = &unk_1E5140330;
    v41[4] = a1[4];
    v42 = a1[7];
    v43 = &v45;
    v10 = -[PXPlacesMapPipelineExecutionContext initWithViewPort:completionHandler:](v8, "initWithViewPort:completionHandler:", v9, v41);
    objc_storeStrong((id *)a1[4] + 16, v10);
    objc_msgSend(*((id *)a1[4] + 6), "objectForKey:", a1[5]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(a1[6], "updateWithChange:", v11);
      objc_msgSend(*((id *)a1[4] + 6), "removeObjectForKey:", a1[5]);
    }
    -[PXPlacesMapPipelineExecutionContext start](v10, "start");
    -[PXPlacesMapPipelineExecutionContext startTimerForDataSource:](v10, "startTimerForDataSource:", a1[5]);
    objc_msgSend(a1[4], "stateDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mapController:didStartExecutingPipelines:", a1[4], v55[5]);

    v13 = (void *)objc_opt_new();
    aBlock[0] = v5;
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_7;
    aBlock[3] = &unk_1E5121F70;
    v7 = v10;
    v37 = v7;
    v14 = a1[5];
    v15 = a1[4];
    v38 = v14;
    v39 = v15;
    v40 = &v54;
    v16 = _Block_copy(aBlock);
    if (objc_msgSend((id)v55[5], "count") == 1)
    {
      dispatch_get_global_queue(25, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v31[0] = v5;
      v31[1] = 3221225472;
      v31[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_9;
      v31[3] = &unk_1E513CD18;
      v31[4] = a1[4];
      v35 = &v54;
      v32 = a1[6];
      v33 = v7;
      v34 = v16;
      v18 = v16;
      dispatch_async(v17, v31);

    }
    else
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = dispatch_queue_create("map update plan results", v18);
      dispatch_get_global_queue(25, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      v24[0] = v5;
      v24[1] = 3221225472;
      v24[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_10;
      v24[3] = &unk_1E5121FC0;
      v21 = a1[4];
      v30 = &v54;
      v24[4] = v21;
      v25 = a1[6];
      v26 = v7;
      v27 = v19;
      v28 = v13;
      v29 = v16;
      v22 = v16;
      v23 = v19;
      dispatch_async(v20, v24);

    }
    _Block_object_dispose(&v45, 8);

    goto LABEL_13;
  }
  if (a1[6])
  {
    objc_msgSend(*((id *)a1[4] + 6), "objectForKey:", a1[5]);
    v6 = (PXPlacesMapPipelineExecutionContext *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[PXPlacesMapPipelineExecutionContext updateWithChange:](v6, "updateWithChange:", a1[6]);
    }
    else
    {
      objc_msgSend(*((id *)a1[4] + 6), "setObject:forKey:", a1[6], a1[5]);
      v7 = 0;
    }
LABEL_13:

  }
  _Block_object_dispose(&v54, 8);

}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dataSourceToPipelineMap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentViewPortWithThumbnailOverscan");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_5;
  block[3] = &unk_1E5140330;
  block[4] = v2;
  v5 = v3;
  v6 = a1[6];
  v8 = v5;
  v9 = v6;
  dispatch_async(v4, block);

}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id location;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "stopTimerForDataSource:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setUpdatePlanResults:", v5);

  objc_initWeak(&location, *(id *)(a1 + 48));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_8;
  v8[3] = &unk_1E5135228;
  objc_copyWeak(&v11, &location);
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 56);
  v9 = v6;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_9(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executePipeline:dataSourceChange:context:", v3, a1[5], a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = a1[7];
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_10(uint64_t a1)
{
  size_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count");
  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_11;
  v9[3] = &unk_1E5121F98;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 80);
  v9[4] = v4;
  v9[1] = 3221225472;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  dispatch_apply(v2, v3, v9);

  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), v6, v7, v8);
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_11(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count") > a2)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectAtIndexedSubscript:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executePipeline:dataSourceChange:context:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_12;
      block[3] = &unk_1E5148D08;
      v6 = *(NSObject **)(a1 + 56);
      v9 = *(id *)(a1 + 64);
      v10 = v7;
      dispatch_sync(v6, block);

    }
  }
}

uint64_t __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_8(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "updatePlanResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_executeUpdatePlanResults:", v4);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "currentExecutionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stop");

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "stateDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "mapController:didFinishExecutingPipelines:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  id *v27;
  void *v28;
  void *v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 128);
  *(_QWORD *)(v2 + 128) = 0;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__75950;
  v35 = __Block_byref_object_dispose__75951;
  v36 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_6;
  v30[3] = &unk_1E5148AA8;
  v30[4] = *(_QWORD *)(a1 + 32);
  v30[5] = &v31;
  dispatch_sync(MEMORY[0x1E0C80D38], v30);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "mapRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend((id)v32[5], "mapRect");
  v19 = v6 == v16 && v8 == v13 && v10 == v14 && v12 == v15;
  if (v19
    && ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "viewSize"),
         v21 = v20,
         v23 = v22,
         objc_msgSend((id)v32[5], "viewSize"),
         v21 == v25)
      ? (v26 = v23 == v24)
      : (v26 = 0),
        v26))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
    {
      v27 = *(id **)(a1 + 32);
      objc_msgSend(v27[6], "keyEnumerator");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "allObjects");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_updateMapWithDataSources:dataSourceChangeTable:completion:", v29, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 0);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateMapWithAllDataSources:", 0);
  }
  _Block_object_dispose(&v31, 8);

}

void __78__PXPlacesMapController__updateMapWithDataSource_dataSourceChange_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentViewPortWithThumbnailOverscan");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__75950;
  v20 = __Block_byref_object_dispose__75951;
  v21 = 0;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[2] = __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke_2;
  block[3] = &unk_1E5141AE0;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v14 = &v16;
  v13 = v4;
  v15 = a2;
  dispatch_sync(v5, block);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  v7 = *(void **)(a1 + 32);
  v8 = v17[5];
  objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke_3;
  v10[3] = &unk_1E5149198;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v7, "_updateMapWithDataSource:dataSourceChange:completion:", v8, v9, v10);

  _Block_object_dispose(&v16, 8);
}

uint64_t __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __84__PXPlacesMapController__updateMapWithDataSources_dataSourceChangeTable_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__PXPlacesMapController__updateMapWithAllDataSources___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dataSources");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __95__PXPlacesMapController_mapRectForGeotaggablesFromDataSource_renderer_mapViewSize_fitAdjusted___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compareTo:", a2);
}

void __40__PXPlacesMapController_removePipeline___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "executeRemoval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_executeUpdatePlanResults:", v3);

}

void __40__PXPlacesMapController_removePipeline___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dataSourceToPipelineMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __40__PXPlacesMapController_removePipeline___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "removeObject:", a1[4]);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count");
  if (!result)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  return result;
}

void __42__PXPlacesMapController_removeDataSource___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dataSourceToPipelineMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "dataSourceToPipelineMap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __42__PXPlacesMapController_removeDataSource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__75950;
  v15 = __Block_byref_object_dispose__75951;
  v16 = 0;
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PXPlacesMapController_removeDataSource___block_invoke_3;
  block[3] = &unk_1E5121ED8;
  block[5] = &v11;
  block[6] = a2;
  block[4] = *(_QWORD *)(a1 + 56);
  dispatch_sync(v3, block);
  objc_msgSend((id)v12[5], "executeRemoval");
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __42__PXPlacesMapController_removeDataSource___block_invoke_4;
  v7[3] = &unk_1E5148D08;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(NSObject **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v6 = v8;
  dispatch_sync(v5, v7);

  _Block_object_dispose(&v11, 8);
}

uint64_t __42__PXPlacesMapController_removeDataSource___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeUpdatePlanResults:", *(_QWORD *)(a1 + 40));
}

void __42__PXPlacesMapController_removeDataSource___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "dataSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setDataSources:", v3);

}

void __42__PXPlacesMapController_removeDataSource___block_invoke_3(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = a1[6];
  if (v2 < objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "objectAtIndexedSubscript:", a1[6]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

uint64_t __42__PXPlacesMapController_removeDataSource___block_invoke_4(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "addObject:");
  return result;
}

void __37__PXPlacesMapController_addPipeline___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dataSourceToPipelineMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setDelegate:", *(_QWORD *)(a1 + 32));
  if (!v6)
  {
    v6 = (id)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "dataSourceToPipelineMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "dataSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObject:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setDataSources:", v5);
}

void __32__PXPlacesMapController_dealloc__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "dataSources", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setDelegate:", 0);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

+ (void)launchMapsAtCoordinate:(CLLocationCoordinate2D)a3 withTitle:(id)a4 completionHandler:(id)a5
{
  double longitude;
  double latitude;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v8 = (objc_class *)MEMORY[0x1E0CC1900];
  v9 = a5;
  v10 = a4;
  v12 = (id)objc_msgSend([v8 alloc], "initWithCoordinate:", latitude, longitude);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1828]), "initWithPlacemark:", v12);
  objc_msgSend(v11, "setName:", v10);

  objc_msgSend(v11, "openInMapsWithLaunchOptions:fromScene:completionHandler:", 0, 0, v9);
}

+ ($FACAC4C914AA3357BF58EDB133E9B698)mapRectWithMapViewSize:(CGSize)a3 centeredOnCoordinate:(CLLocationCoordinate2D)a4 visibleDistance:(double)a5
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $FACAC4C914AA3357BF58EDB133E9B698 result;

  if (*MEMORY[0x1E0C9D820] == a3.width && *(double *)(MEMORY[0x1E0C9D820] + 8) == a3.height)
  {
    v7 = *MEMORY[0x1E0CC1648];
    v8 = *(double *)(MEMORY[0x1E0CC1648] + 8);
    v9 = *(double *)(MEMORY[0x1E0CC1648] + 16);
    v10 = *(double *)(MEMORY[0x1E0CC1648] + 24);
  }
  else
  {
    v6 = MEMORY[0x1A85CBC98](a1, a2, a4.latitude, a4.longitude, a5, a5);
    MEMORY[0x1A85CBCD4](v6);
  }
  result.var1.var1 = v10;
  result.var1.var0 = v9;
  result.var0.var1 = v8;
  result.var0.var0 = v7;
  return result;
}

@end
