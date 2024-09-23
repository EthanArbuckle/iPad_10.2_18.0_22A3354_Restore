@implementation PXPlacesMapGeometricClusterLayout

- (PXPlacesMapGeometricClusterLayout)init
{
  PXPlacesMapGeometricClusterLayout *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPlacesMapGeometricClusterLayout;
  result = -[PXPlacesMapGeometricClusterLayout init](&v3, sel_init);
  if (result)
    result->_clusteringDistance = 30.0;
  return result;
}

- (id)layoutForViewPort:(id)a3 andDataSourceChange:(id)a4
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  PXPlacesMapLayoutResultImpl *v21;
  void *v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapGeometricClusterLayout.m"), 33, CFSTR("-[PXPlacesMapClusterLayout layout] viewPort cannot be nil"));

  }
  -[PXPlacesMapLayout dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapGeometricClusterLayout.m"), 34, CFSTR("-[PXPlacesMapClusterLayout layout] dataSource cannot be nil"));

  }
  objc_msgSend(v7, "mapRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[PXPlacesMapLayout dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "findItemsInMapRect:", v11, v13, v15, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPlacesMapGeometricClusterLayout _clusterGeotaggables:forViewPort:](self, "_clusterGeotaggables:forViewPort:", v19, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(PXPlacesMapLayoutResultImpl);
  -[PXPlacesMapLayoutResultImpl addItems:](v21, "addItems:", v20);

  return v21;
}

- (id)_clusterGeotaggables:(id)a3 forViewPort:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXPlacesMapLayoutItemImpl *v13;
  PXPlacesMapLayoutItemImpl *v14;
  id v15;
  MKMapPoint v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  CLLocationCoordinate2D v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v6;
  objc_msgSend(v6, "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_276390);
  while (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
    -[PXPlacesMapGeometricClusterLayout _findClusterOverlappingGeotaggable:fromClusters:forViewPort:](self, "_findClusterOverlappingGeotaggable:fromClusters:forViewPort:", v10, v8, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "addGeotaggable:", v10);
    }
    else
    {
      v13 = [PXPlacesMapLayoutItemImpl alloc];
      objc_msgSend(v10, "coordinate");
      v14 = -[PXPlacesMapLayoutItemImpl initWithCoordinate:](v13, "initWithCoordinate:");
      v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v15, "addObject:", v10);
      objc_msgSend(v10, "coordinate");
      v16 = MKMapPointForCoordinate(v33);
      -[PXPlacesMapGeometricClusterLayout clusteringDistance](self, "clusteringDistance");
      v18 = v16.x - v17 * 0.5;
      -[PXPlacesMapGeometricClusterLayout clusteringDistance](self, "clusteringDistance");
      v20 = v16.y - v19 * 0.5;
      -[PXPlacesMapGeometricClusterLayout clusteringDistance](self, "clusteringDistance");
      v22 = v21;
      -[PXPlacesMapGeometricClusterLayout clusteringDistance](self, "clusteringDistance");
      v24 = v23;
      -[PXPlacesMapLayout dataSource](self, "dataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "findItemsInMapRect:", v18, v20, v22, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26 && objc_msgSend(v26, "count"))
      {
        objc_msgSend(v26, "allObjects");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObjectsInArray:", v27);

        objc_msgSend(v15, "unionSet:", v26);
      }
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithSet:", v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPlacesMapLayoutItemImpl addGeotaggables:](v14, "addGeotaggables:", v28);

      objc_msgSend(v8, "addObject:", v14);
    }

  }
  v29 = (void *)objc_msgSend(v8, "copy");

  return v29;
}

- (id)_findClusterOverlappingGeotaggable:(id)a3 fromClusters:(id)a4 forViewPort:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "coordinate", (_QWORD)v25);
        v18 = v17;
        v20 = v19;
        objc_msgSend(v8, "coordinate");
        if (-[PXPlacesMapGeometricClusterLayout _shapeAtCoordinate:overlapsShapeAtCoordinate:forViewPort:](self, "_shapeAtCoordinate:overlapsShapeAtCoordinate:forViewPort:", v10, v18, v20, v21, v22))
        {
          v23 = v16;
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
        continue;
      break;
    }
  }
  v23 = 0;
LABEL_11:

  return v23;
}

- (BOOL)_shapeAtCoordinate:(CLLocationCoordinate2D)a3 overlapsShapeAtCoordinate:(CLLocationCoordinate2D)a4 forViewPort:(id)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  CLLocationDegrees v7;
  CLLocationDegrees v8;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  MKMapPoint v15;
  MKMapPoint v16;
  CLLocationCoordinate2D v18;
  CLLocationCoordinate2D v19;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3.longitude;
  v8 = a3.latitude;
  v10 = a5;
  -[PXPlacesMapGeometricClusterLayout clusteringDistance](self, "clusteringDistance");
  v12 = v11;
  objc_msgSend(v10, "scale");
  v14 = v13;

  v18.latitude = v8;
  v18.longitude = v7;
  v15 = MKMapPointForCoordinate(v18);
  v19.latitude = latitude;
  v19.longitude = longitude;
  v16 = MKMapPointForCoordinate(v19);
  return sqrt((v15.x - v16.x) * (v15.x - v16.x) + (v15.y - v16.y) * (v15.y - v16.y)) < v12 * v14 + v12 * v14;
}

- (double)clusteringDistance
{
  return self->_clusteringDistance;
}

- (void)setClusteringDistance:(double)a3
{
  self->_clusteringDistance = a3;
}

uint64_t __70__PXPlacesMapGeometricClusterLayout__clusterGeotaggables_forViewPort___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compareTo:", a2);
}

@end
