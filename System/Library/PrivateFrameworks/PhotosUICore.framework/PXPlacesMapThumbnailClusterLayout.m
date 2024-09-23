@implementation PXPlacesMapThumbnailClusterLayout

- (id)layoutForViewPort:(id)a3 andDataSourceChange:(id)a4
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  PXPlacesMapLayoutResultImpl *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  id v33;
  double v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapThumbnailClusterLayout.m"), 53, CFSTR("-[PXPlacesMapThumbnailClusterLayout layout] viewPort cannot be nil"));

  }
  -[PXPlacesMapLayout dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapThumbnailClusterLayout.m"), 54, CFSTR("-[PXPlacesMapClusterLayout layout] dataSource cannot be nil"));

  }
  -[PXPlacesMapThumbnailClusterLayout horizontalClusteringDistancePixels](self, "horizontalClusteringDistancePixels");
  if (v10 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapThumbnailClusterLayout.m"), 55, CFSTR("-[PXPlacesMapClusterLayout layout] horizontalClusteringDistancePixels cannot be <= 0"));

  }
  -[PXPlacesMapThumbnailClusterLayout verticalClusteringDistancePixels](self, "verticalClusteringDistancePixels");
  if (v11 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapThumbnailClusterLayout.m"), 56, CFSTR("-[PXPlacesMapClusterLayout layout] verticalClusteringDistancePixels cannot be <= 0"));

  }
  if (objc_msgSend(v8, "hasChanges"))
    -[PXPlacesMapThumbnailClusterLayout setCurrentMapLayoutResult:](self, "setCurrentMapLayoutResult:", 0);
  -[PXPlacesMapThumbnailClusterLayout currentMapLayoutResult](self, "currentMapLayoutResult");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PXPlacesMapThumbnailClusterLayout currentMapLayoutResult](self, "currentMapLayoutResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewPort");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEqual:", v7) & 1) != 0)
    {
      v16 = objc_msgSend(v8, "hasChanges");

      if ((v16 & 1) == 0)
      {
        -[PXPlacesMapThumbnailClusterLayout currentMapLayoutResult](self, "currentMapLayoutResult");
        v17 = (PXPlacesMapLayoutResultImpl *)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
    }
    else
    {

    }
  }
  -[PXPlacesMapThumbnailClusterLayout currentMapLayoutResult](self, "currentMapLayoutResult");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "viewPort");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PXPlacesMapThumbnailClusterLayout _viewPortChangeTypeFrom:to:](self, "_viewPortChangeTypeFrom:to:", v19, v7);

  -[PXPlacesMapThumbnailClusterLayout setCurrentChangeType:](self, "setCurrentChangeType:", v20);
  -[PXPlacesMapThumbnailClusterLayout currentMapLayoutResult](self, "currentMapLayoutResult");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_33;
  v22 = (void *)v21;
  -[PXPlacesMapThumbnailClusterLayout currentMapLayoutResult](self, "currentMapLayoutResult");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layoutItems");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    objc_msgSend(v7, "viewPortsBySplitingAt180thMerdian");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v28)
    {
      v29 = v28;
      v48 = v7;
      v30 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v50 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          switch(v20)
          {
            case 0uLL:
              goto LABEL_27;
            case 1uLL:
              -[PXPlacesMapThumbnailClusterLayout _handleZoomInToViewPort:](self, "_handleZoomInToViewPort:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
              v33 = (id)objc_claimAutoreleasedReturnValue();
              break;
            case 2uLL:
              -[PXPlacesMapThumbnailClusterLayout _handleZoomOutToViewPort:](self, "_handleZoomOutToViewPort:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
              v33 = (id)objc_claimAutoreleasedReturnValue();
              break;
            case 3uLL:
              goto LABEL_28;
            case 4uLL:
              objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "pitch");
              if (v34 == 0.0)
              {
LABEL_27:
                -[PXPlacesMapThumbnailClusterLayout _handlePanToViewPort:dataSourceChange:](self, "_handlePanToViewPort:dataSourceChange:", v32, v8);
                v33 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
LABEL_28:
                -[PXPlacesMapThumbnailClusterLayout _handlePitchChangeToViewPort:dataSourceChange:](self, "_handlePitchChangeToViewPort:dataSourceChange:", v32, v8);
                v33 = (id)objc_claimAutoreleasedReturnValue();
              }
              break;
            default:
              v33 = objc_alloc_init(MEMORY[0x1E0C99E40]);
              break;
          }
          v35 = v33;
          objc_msgSend(v26, "unionOrderedSet:", v33);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v29);
      v7 = v48;
    }
  }
  else
  {
LABEL_33:
    v26 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    objc_msgSend(v7, "viewPortsBySplitingAt180thMerdian");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v36 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v54 != v38)
            objc_enumerationMutation(v27);
          v40 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          objc_msgSend(v40, "mapRect");
          -[PXPlacesMapThumbnailClusterLayout _clusterGeotaggablesInRect:forViewPort:](self, "_clusterGeotaggablesInRect:forViewPort:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "unionOrderedSet:", v41);

        }
        v37 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v37);
    }
  }
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithOrderedSet:", v26);

  v17 = objc_alloc_init(PXPlacesMapLayoutResultImpl);
  -[PXPlacesMapLayoutResultImpl addItems:](v17, "addItems:", v42);
  -[PXPlacesMapLayoutResultImpl setViewPort:](v17, "setViewPort:", v7);
  -[PXPlacesMapThumbnailClusterLayout setCurrentMapLayoutResult:](self, "setCurrentMapLayoutResult:", v17);

LABEL_41:
  return v17;
}

- (id)_clusterGeotaggablesInViewPort:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "mapRect");
  -[PXPlacesMapThumbnailClusterLayout _clusterGeotaggablesInRect:forViewPort:](self, "_clusterGeotaggablesInRect:forViewPort:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_clusterGeotaggablesInRect:(id)a3 forViewPort:(id)a4
{
  double var1;
  double var0;
  double v6;
  double v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v6 = a3.var0.var1;
  v7 = a3.var0.var0;
  v9 = a4;
  -[PXPlacesMapLayout dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "findItemsInMapRect:", v7, v6, var0, var1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPlacesMapThumbnailClusterLayout _clusterGeotaggables:fromMapRect:viewPort:](self, "_clusterGeotaggables:fromMapRect:viewPort:", v11, v9, v7, v6, var0, var1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_clusterGeotaggables:(id)a3 fromMapRect:(id)a4 viewPort:(id)a5
{
  double var1;
  double var0;
  double v7;
  double v8;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CLLocationCoordinate2D v35;
  MKMapPoint v36;
  MKMapRect v37;

  var1 = a4.var1.var1;
  var0 = a4.var1.var0;
  v7 = a4.var0.var1;
  v8 = a4.var0.var0;
  v34 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  -[PXPlacesMapThumbnailClusterLayout _mutableSortedOrderdGeotaggablesSetFromSet:](self, "_mutableSortedOrderdGeotaggablesSetFromSet:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapThumbnailClusterLayout currentMapLayoutResult](self, "currentMapLayoutResult");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        -[PXPlacesMapThumbnailClusterLayout _primaryGeotaggleInLayoutItem:](self, "_primaryGeotaggleInLayoutItem:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v20), (_QWORD)v29);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "coordinate");
        v36 = MKMapPointForCoordinate(v35);
        v37.origin.x = v8;
        v37.origin.y = v7;
        v37.size.width = var0;
        v37.size.height = var1;
        if (MKMapRectContainsPoint(v37, v36))
          objc_msgSend(v13, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v18);
  }

  -[PXPlacesMapThumbnailClusterLayout horizontalClusteringDistancePixels](self, "horizontalClusteringDistancePixels");
  v23 = v22;
  -[PXPlacesMapThumbnailClusterLayout verticalClusteringDistancePixels](self, "verticalClusteringDistancePixels");
  v25 = v24;
  -[PXPlacesMapLayout dataSource](self, "dataSource");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapThumbnailClusterLayout _clusterGeotaggables:usingHorizontalClusteringDistance:verticalClusteringDistance:viewPort:dataSource:primaryLayoutGeotaggables:maskToMapRect:](self, "_clusterGeotaggables:usingHorizontalClusteringDistance:verticalClusteringDistance:viewPort:dataSource:primaryLayoutGeotaggables:maskToMapRect:", v12, v11, v26, v13, v23, v25, v8, v7, var0, var1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_clusterGeotaggables:(id)a3 usingHorizontalClusteringDistance:(double)a4 verticalClusteringDistance:(double)a5 viewPort:(id)a6 dataSource:(id)a7 primaryLayoutGeotaggables:(id)a8 maskToMapRect:(id)a9
{
  double v9;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  double latitude;
  double longitude;
  MKMapPoint v35;
  _BOOL4 v36;
  id v37;
  PXPlacesMapLayoutItemImpl *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  MKMapPoint v53;
  double x;
  double y;
  double v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double var1;
  double var0;
  double rect;
  id v80;
  PXPlacesMapLayoutItemImpl *v81;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;
  CLLocationCoordinate2D v94;
  CLLocationCoordinate2D v95;
  CLLocationCoordinate2D v96;
  MKMapPoint v97;
  MKMapPoint v98;
  MKMapRect v99;
  MKMapRect v100;
  MKMapRect v101;
  MKMapRect v102;

  var0 = a9.var1.var0;
  rect = a9.var1.var1;
  var1 = a9.var0.var1;
  v9 = a9.var0.var0;
  v93 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v15, "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithSet:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x1E0CB3748]);
  v80 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = v16;
  objc_msgSend(v16, "scale");
  v24 = v23 * a4 + v23 * a4;
  v25 = v23 * a5 + v23 * a5;
  v26 = 0x1E0C99000uLL;
  v27 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v73 = v25;
  v74 = v24;
  v71 = v25 * 0.5;
  v72 = v24 * 0.5;
  v68 = v17;
  v69 = v15;
  v67 = v27;
  while (objc_msgSend(v18, "count") || objc_msgSend(v15, "count"))
  {
    if (objc_msgSend(v18, "count"))
      v28 = v18;
    else
      v28 = v15;
    objc_msgSend(v28, "firstObject");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v28;
    v31 = (void *)v29;
    objc_msgSend(v30, "removeObjectAtIndex:", 0);
    objc_msgSend(v22, "objectForKey:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      objc_msgSend(v31, "coordinate");
      latitude = v94.latitude;
      longitude = v94.longitude;
      v35 = MKMapPointForCoordinate(v94);
      v99.origin.x = v9;
      v99.origin.y = var1;
      v99.size.width = var0;
      v99.size.height = rect;
      v36 = MKMapRectContainsPoint(v99, v35);
      v32 = 0;
      if (v36)
      {
        v37 = objc_alloc_init(*(Class *)(v26 + 3600));
        objc_msgSend(v37, "addObject:", v31);
        v38 = -[PXPlacesMapLayoutItemImpl initWithCoordinate:]([PXPlacesMapLayoutItemImpl alloc], "initWithCoordinate:", latitude, longitude);
        v76 = v37;
        -[PXPlacesMapLayoutItemImpl addGeotaggables:](v38, "addGeotaggables:", v37);
        objc_msgSend(v22, "setObject:forKey:", v38, v31);
        v81 = v38;
        objc_msgSend(v27, "addObject:", v38);
        v100.origin.x = v35.x - v72;
        v100.origin.y = v35.y - v71;
        v100.size.height = v73;
        v100.size.width = v74;
        v102.origin.x = v9;
        v102.origin.y = var1;
        v102.size.width = var0;
        v102.size.height = rect;
        v101 = MKMapRectIntersection(v100, v102);
        objc_msgSend(v17, "findItemsInMapRect:", v101.origin.x, v101.origin.y, v101.size.width, v101.size.height);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v39)
        {
          v75 = v39;
          v41 = objc_msgSend(v39, "count");
          v40 = v75;
          if (v41)
          {
            v70 = v31;
            -[PXPlacesMapThumbnailClusterLayout geotaggablesSortDescriptors](self, "geotaggablesSortDescriptors");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "sortedArrayUsingDescriptors:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
            v44 = v43;
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
            if (v45)
            {
              v46 = v45;
              v47 = *(_QWORD *)v88;
              do
              {
                for (i = 0; i != v46; ++i)
                {
                  if (*(_QWORD *)v88 != v47)
                    objc_enumerationMutation(v44);
                  v49 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
                  if (objc_msgSend(v21, "containsObject:", v49)
                    && (-[PXPlacesMapThumbnailClusterLayout currentChangeType](self, "currentChangeType") == 2
                     || (objc_msgSend(v18, "containsObject:", v49) & 1) == 0))
                  {
                    objc_msgSend(v22, "objectForKey:", v49);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v50)
                    {
                      v51 = v18;
                      -[PXPlacesMapThumbnailClusterLayout _primaryGeotaggleInLayoutItem:](self, "_primaryGeotaggleInLayoutItem:", v50);
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v52, "isEqual:", v49) & 1) == 0)
                      {
                        objc_msgSend(v50, "coordinate");
                        v53 = MKMapPointForCoordinate(v95);
                        objc_msgSend(v49, "coordinate");
                        v97 = MKMapPointForCoordinate(v96);
                        x = v97.x;
                        y = v97.y;
                        v56 = MKMetersBetweenMapPoints(v97, v35);
                        v98.x = x;
                        v98.y = y;
                        if (v56 < MKMetersBetweenMapPoints(v98, v53))
                          objc_msgSend(v22, "setObject:forKey:", v81, v49);
                      }

                      v18 = v51;
                    }
                    else
                    {
                      objc_msgSend(v80, "addObject:", v49);
                      objc_msgSend(v22, "setObject:forKey:", v81, v49);
                    }

                  }
                }
                v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
              }
              while (v46);
            }

            v17 = v68;
            v15 = v69;
            v27 = v67;
            v26 = 0x1E0C99000;
            v31 = v70;
            v40 = v75;
          }
        }

        v32 = 0;
      }
    }

  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v57 = v80;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v59; ++j)
      {
        if (*(_QWORD *)v84 != v60)
          objc_enumerationMutation(v57);
        v62 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j);
        objc_msgSend(v22, "objectForKey:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v63;
        if (v63)
          objc_msgSend(v63, "addGeotaggable:", v62);

      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    }
    while (v59);
  }

  return v67;
}

- (id)_mutableSortedOrderdGeotaggablesSetFromSet:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x1E0C99E10];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithSet:", v5);

  -[PXPlacesMapThumbnailClusterLayout _sortGeotaggables:](self, "_sortGeotaggables:", v6);
  return v6;
}

- (void)_sortGeotaggables:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_276175);
}

- (id)_primaryGeotaggleInLayoutItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "geotaggables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)geotaggablesSortDescriptors
{
  NSArray *geotaggablesSortDescriptors;
  PXPlacesGeotaggableSortDescriptor *v4;
  NSArray *v5;
  NSArray *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  geotaggablesSortDescriptors = self->_geotaggablesSortDescriptors;
  if (!geotaggablesSortDescriptors)
  {
    v4 = objc_alloc_init(PXPlacesGeotaggableSortDescriptor);
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_geotaggablesSortDescriptors;
    self->_geotaggablesSortDescriptors = v5;

    geotaggablesSortDescriptors = self->_geotaggablesSortDescriptors;
  }
  return geotaggablesSortDescriptors;
}

- (unint64_t)_viewPortChangeTypeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "pitch");
  v9 = v8;
  objc_msgSend(v6, "pitch");
  if (v9 <= v10)
  {
    objc_msgSend(v7, "pitch");
    v13 = v12;
    objc_msgSend(v6, "pitch");
    if (v13 >= v14)
    {
      objc_msgSend(v6, "zoomLevel");
      v16 = v15;
      objc_msgSend(v7, "zoomLevel");
      if (-[PXPlacesMapThumbnailClusterLayout _zoom:isEqualToZoom:](self, "_zoom:isEqualToZoom:", v16, v17))
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(v6, "scale");
        v19 = v18;
        objc_msgSend(v7, "scale");
        if (v19 > v20)
          v11 = 1;
        else
          v11 = 2;
      }
    }
    else
    {
      v11 = 4;
    }
  }
  else
  {
    v11 = 3;
  }

  return v11;
}

- (BOOL)_zoom:(double)a3 isEqualToZoom:(double)a4
{
  return vabdd_f64(a3, a4) < 0.01;
}

- (double)horizontalClusteringDistancePixels
{
  return self->_horizontalClusteringDistancePixels;
}

- (void)setHorizontalClusteringDistancePixels:(double)a3
{
  self->_horizontalClusteringDistancePixels = a3;
}

- (double)verticalClusteringDistancePixels
{
  return self->_verticalClusteringDistancePixels;
}

- (void)setVerticalClusteringDistancePixels:(double)a3
{
  self->_verticalClusteringDistancePixels = a3;
}

- (PXPlacesMapLayoutResult)currentMapLayoutResult
{
  return self->_currentMapLayoutResult;
}

- (void)setCurrentMapLayoutResult:(id)a3
{
  objc_storeStrong((id *)&self->_currentMapLayoutResult, a3);
}

- (unint64_t)currentChangeType
{
  return self->_currentChangeType;
}

- (void)setCurrentChangeType:(unint64_t)a3
{
  self->_currentChangeType = a3;
}

- (void)setGeotaggablesSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_geotaggablesSortDescriptors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geotaggablesSortDescriptors, 0);
  objc_storeStrong((id *)&self->_currentMapLayoutResult, 0);
}

uint64_t __55__PXPlacesMapThumbnailClusterLayout__sortGeotaggables___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compareTo:", a2);
}

@end
