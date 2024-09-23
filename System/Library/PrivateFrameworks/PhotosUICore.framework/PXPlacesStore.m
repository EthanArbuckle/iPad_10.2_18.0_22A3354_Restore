@implementation PXPlacesStore

- (PXPlacesStore)init
{
  return -[PXPlacesStore initWithCapacityPerNode:](self, "initWithCapacityPerNode:", 1000);
}

- (PXPlacesStore)initWithCapacityPerNode:(unint64_t)a3
{
  char *v4;
  PXPlacesStore *v5;
  double *v6;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPlacesStore;
  v4 = -[PXPlacesStore init](&v9, sel_init);
  v5 = (PXPlacesStore *)v4;
  if (v4)
  {
    v6 = (double *)MEMORY[0x1E0CC1670];
    v7 = *(_OWORD *)(MEMORY[0x1E0CC1670] + 16);
    *(_OWORD *)(v4 + 280) = *MEMORY[0x1E0CC1670];
    *(_OWORD *)(v4 + 296) = v7;
    *((_QWORD *)v4 + 31) = a3;
    *((_QWORD *)v4 + 1) = PXQuadTreeNodeMake(a3, *v6, v6[1], v6[2], v6[3]);
    v5->_itemsToAdd = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5->_itemsToAddArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_itemsToRemove = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    atomic_store(0, (unsigned int *)&v5->_updateCount);
    pthread_rwlock_init(&v5->_rwlock, 0);
    v5->_itemChangeSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  PXQuadTreeNodeFree(self->_rootNode);
  pthread_rwlock_destroy(&self->_rwlock);
  dispatch_release((dispatch_object_t)self->_itemChangeSemaphore);
  v3.receiver = self;
  v3.super_class = (Class)PXPlacesStore;
  -[PXPlacesStore dealloc](&v3, sel_dealloc);
}

- (void)beginUpdates
{
  int *p_updateCount;
  unsigned int v3;

  p_updateCount = &self->_updateCount;
  do
    v3 = __ldaxr((unsigned int *)p_updateCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_updateCount));
}

- (void)endUpdates
{
  int *p_updateCount;
  int v4;
  unsigned int v5;
  unsigned int v6;

  p_updateCount = &self->_updateCount;
  v4 = atomic_load((unsigned int *)&self->_updateCount);
  if (v4 <= 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesStore.m"), 128, CFSTR("-[PXMapStore beginChanges] and -[PXMapStore endChanges] need to be balanced!"));
  do
  {
    v5 = __ldaxr((unsigned int *)p_updateCount);
    v6 = v5 - 1;
  }
  while (__stlxr(v6, (unsigned int *)p_updateCount));
  if (!v6)
    -[PXPlacesStore _commitChanges](self, "_commitChanges");
}

- (void)addItem:(id)a3
{
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesStore.m"), 139, CFSTR("Cannot add nil item"));
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_itemChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableSet addObject:](-[PXPlacesStore itemsToAdd](self, "itemsToAdd"), "addObject:", a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_itemChangeSemaphore);
  if (!atomic_load((unsigned int *)&self->_updateCount))
    -[PXPlacesStore _commitChanges](self, "_commitChanges");
}

- (void)addItems:(id)a3
{
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesStore.m"), 152, CFSTR("Cannot add nil items"));
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_itemChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableSet unionSet:](-[PXPlacesStore itemsToAdd](self, "itemsToAdd"), "unionSet:", a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_itemChangeSemaphore);
  if (!atomic_load((unsigned int *)&self->_updateCount))
    -[PXPlacesStore _commitChanges](self, "_commitChanges");
}

- (void)addItemsFromArray:(id)a3
{
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesStore.m"), 165, CFSTR("Cannot add nil items"));
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_itemChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableArray addObjectsFromArray:](-[PXPlacesStore itemsToAddArray](self, "itemsToAddArray"), "addObjectsFromArray:", a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_itemChangeSemaphore);
  if (!atomic_load((unsigned int *)&self->_updateCount))
    -[PXPlacesStore _commitChanges](self, "_commitChanges");
}

- (void)removeItem:(id)a3
{
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesStore.m"), 178, CFSTR("Cannot remove nil item"));
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_itemChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableSet addObject:](-[PXPlacesStore itemsToRemove](self, "itemsToRemove"), "addObject:", a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_itemChangeSemaphore);
  if (!atomic_load((unsigned int *)&self->_updateCount))
    -[PXPlacesStore _commitChanges](self, "_commitChanges");
}

- (void)removeItems:(id)a3
{
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesStore.m"), 191, CFSTR("Cannot remove nil items"));
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_itemChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableSet unionSet:](-[PXPlacesStore itemsToRemove](self, "itemsToRemove"), "unionSet:", a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_itemChangeSemaphore);
  if (!atomic_load((unsigned int *)&self->_updateCount))
    -[PXPlacesStore _commitChanges](self, "_commitChanges");
}

- (void)_commitChanges
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSMutableSet *v7;
  NSMutableSet *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  MKMapPoint v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  CLLocationDegrees v25;
  CLLocationDegrees v26;
  MKMapPoint v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  CLLocationDegrees v33;
  CLLocationDegrees v34;
  MKMapPoint v35;
  id v36;
  _PXMapStoreChange *v37;
  os_signpost_id_t spid;
  _opaque_pthread_rwlock_t *p_rwlock;
  unint64_t v40;
  NSObject *log;
  uint8_t v42[16];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[16];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CLLocationCoordinate2D v60;
  CLLocationCoordinate2D v61;
  CLLocationCoordinate2D v62;
  CLLocationCoordinate2D v63;
  CLLocationCoordinate2D v64;
  CLLocationCoordinate2D v65;

  v59 = *MEMORY[0x1E0C80C00];
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_itemChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v3 = PKPlacesKitGetLog();
  v4 = os_signpost_id_generate(v3);
  v5 = PKPlacesKitGetLog();
  v6 = v5;
  v40 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PX_PLACES_STORE_LOAD", ", buf, 2u);
  }
  log = v6;
  v7 = -[PXPlacesStore itemsToAdd](self, "itemsToAdd", v4);
  v8 = -[PXPlacesStore itemsToRemove](self, "itemsToRemove");
  v9 = -[PXPlacesStore itemsToAddArray](self, "itemsToAddArray");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  *(_QWORD *)buf = 0;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v16, "coordinate");
        latitude = v60.latitude;
        longitude = v60.longitude;
        if (CLLocationCoordinate2DIsValid(v60))
        {
          v61.latitude = latitude;
          v61.longitude = longitude;
          v19 = MKMapPointForCoordinate(v61);
          if (PXQuadTreeNodeRemoveItem((uint64_t)self->_rootNode, (uint64_t)v16, buf, v19.x, v19.y))
            objc_msgSend(v10, "addObject:", v16);
        }
      }
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v13);
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v48 != v22)
          objc_enumerationMutation(v7);
        v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        objc_msgSend(v24, "coordinate");
        v25 = v62.latitude;
        v26 = v62.longitude;
        if (CLLocationCoordinate2DIsValid(v62))
        {
          v63.latitude = v25;
          v63.longitude = v26;
          v27 = MKMapPointForCoordinate(v63);
          if (PXQuadTreeNodeInsertItem((uint64_t)self->_rootNode, (uint64_t)v24, v27.x, v27.y))
            objc_msgSend(v11, "addObject:", v24);
        }
      }
      v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v21);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v44 != v30)
          objc_enumerationMutation(v9);
        v32 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
        objc_msgSend(v32, "coordinate");
        v33 = v64.latitude;
        v34 = v64.longitude;
        if (CLLocationCoordinate2DIsValid(v64))
        {
          v65.latitude = v33;
          v65.longitude = v34;
          v35 = MKMapPointForCoordinate(v65);
          if (PXQuadTreeNodeInsertItem((uint64_t)self->_rootNode, (uint64_t)v32, v35.x, v35.y))
            objc_msgSend(v11, "addObject:", v32);
        }
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    }
    while (v29);
  }
  self->_numberOfItems -= *(_QWORD *)buf;
  self->_numberOfItems += objc_msgSend(v11, "count");
  -[NSMutableSet removeAllObjects](v7, "removeAllObjects");
  -[NSMutableSet removeAllObjects](v8, "removeAllObjects");
  -[NSMutableArray removeAllObjects](v9, "removeAllObjects");
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_itemChangeSemaphore);
  pthread_rwlock_unlock(p_rwlock);
  if (-[PXPlacesStore delegate](self, "delegate"))
  {
    if (objc_msgSend(v10, "count"))
    {
      v36 = (id)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v36, "intersectSet:", v10);
      objc_msgSend(v11, "minusSet:", v36);
      objc_msgSend(v10, "minusSet:", v36);
    }
    else
    {
      v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    }
    v37 = -[_PXMapStoreChange initWithAddedItems:removedItems:updatedItems:]([_PXMapStoreChange alloc], "initWithAddedItems:removedItems:updatedItems:", v11, v10, v36);

    -[PXPlacesGeotaggedItemDataSourceDelegate dataSource:didChange:](-[PXPlacesStore delegate](self, "delegate"), "dataSource:didChange:", self, v37);
  }
  if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(log))
  {
    *(_WORD *)v42 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, log, OS_SIGNPOST_INTERVAL_END, spid, "PX_PLACES_STORE_LOAD", ", v42, 2u);
  }
}

- (NSSet)allItems
{
  -[PXPlacesStore rect](self, "rect");
  return (NSSet *)-[PXPlacesStore findItemsInMapRect:](self, "findItemsInMapRect:");
}

- (id)findItemsInMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  _opaque_pthread_rwlock_t *p_rwlock;
  NSObject *Log;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  double x;
  double y;
  double width;
  double height;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint8_t v27[16];
  uint8_t buf[16];
  MKMapRect v29;
  MKMapRect v30;
  MKMapRect v31;
  MKMapRect v32;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  Log = PKPlacesKitGetLog();
  v10 = os_signpost_id_generate(Log);
  v11 = PKPlacesKitGetLog();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PX_PLACES_STORE_QUERY", ", buf, 2u);
  }
  v29.origin.x = v6;
  v29.origin.y = v5;
  v29.size.width = var0;
  v29.size.height = var1;
  if (MKMapRectSpans180thMeridian(v29))
  {
    v30.origin.x = v6;
    v30.origin.y = v5;
    v30.size.width = var0;
    v30.size.height = var1;
    v31 = MKMapRectIntersection(v30, *MEMORY[0x1E0CC1670]);
    x = v31.origin.x;
    y = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;
    v31.origin.x = v6;
    v31.origin.y = v5;
    v31.size.width = var0;
    v31.size.height = var1;
    v32 = MKMapRectRemainder(v31);
    v17 = v32.origin.x;
    v18 = v32.origin.y;
    v19 = v32.size.width;
    v20 = v32.size.height;
    v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v22 = -[PXPlacesStore _findItemsInMapRect:](self, "_findItemsInMapRect:", x, y, width, height);
    v23 = -[PXPlacesStore _findItemsInMapRect:](self, "_findItemsInMapRect:", v17, v18, v19, v20);
    objc_msgSend(v21, "unionSet:", v22);
    objc_msgSend(v21, "unionSet:", v23);
    v24 = v21;
  }
  else
  {
    v24 = -[PXPlacesStore _findItemsInMapRect:](self, "_findItemsInMapRect:", v6, v5, var0, var1);
  }
  v25 = v24;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_END, v10, "PX_PLACES_STORE_QUERY", ", v27, 2u);
  }
  pthread_rwlock_unlock(p_rwlock);
  return v25;
}

- (id)_findItemsInMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  id v8;
  _QWORD v10[5];

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__PXPlacesStore__findItemsInMapRect___block_invoke;
  v10[3] = &unk_1E5129B98;
  v10[4] = v8;
  PXQuadTreeNodeFindItemsInRect((uint64_t *)self->_rootNode, (uint64_t)v10, v6, v5, var0, var1);
  return v8;
}

- ($FACAC4C914AA3357BF58EDB133E9B698)minimalEncompassingMapRect
{
  _opaque_pthread_rwlock_t *p_rwlock;
  int64_t v4;
  double *v5;
  double *rootNode;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[6];
  _QWORD v26[4];
  $FACAC4C914AA3357BF58EDB133E9B698 result;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  v4 = -[PXPlacesStore numberOfItems](self, "numberOfItems");
  v5 = (double *)malloc_type_malloc(16 * v4, 0x1000040451B5BE8uLL);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  rootNode = (double *)self->_rootNode;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __43__PXPlacesStore_minimalEncompassingMapRect__block_invoke;
  v25[3] = &unk_1E5129BC0;
  v25[4] = v26;
  v25[5] = v5;
  PXQuadTreeNodeRunCollector(rootNode, (uint64_t)v25);
  v7 = v4 - 1;
  if (v4 == 1)
  {
    v8 = *v5;
    v9 = v5[1];
    v10 = 0.0;
    v11 = 0.0;
  }
  else if (v4 < 2)
  {
    v8 = *MEMORY[0x1E0CC1648];
    v9 = *(double *)(MEMORY[0x1E0CC1648] + 8);
    v11 = *(double *)(MEMORY[0x1E0CC1648] + 16);
    v10 = *(double *)(MEMORY[0x1E0CC1648] + 24);
  }
  else
  {
    qsort(v5, v4, 0x10uLL, (int (__cdecl *)(const void *, const void *))mapPointComparator);
    v12 = 0;
    v13 = v5 + 1;
    v8 = 0.0;
    v14 = -3.40282347e38;
    v9 = 3.40282347e38;
    v15 = 0.0;
    do
    {
      v16 = *v13;
      if (v7 == v12)
        v17 = 0;
      else
        v17 = v12 + 1;
      v18 = v12 + 1;
      v19 = v5[2 * v17];
      v20 = -0.0;
      if (v7 == v12)
        v20 = *(double *)(MEMORY[0x1E0CC1670] + 16);
      if (v19 - *(v13 - 1) + v20 > v15)
      {
        v15 = v19 - *(v13 - 1) + v20;
        v8 = v5[2 * v17];
      }
      if (v16 > v14)
        v14 = *v13;
      if (v16 < v9)
        v9 = *v13;
      v13 += 2;
      ++v12;
    }
    while (v4 != v18);
    v11 = *(double *)(MEMORY[0x1E0CC1670] + 16) - v15;
    v10 = v14 - v9;
  }
  free(v5);
  pthread_rwlock_unlock(p_rwlock);
  _Block_object_dispose(v26, 8);
  v21 = v8;
  v22 = v9;
  v23 = v11;
  v24 = v10;
  result.var1.var1 = v24;
  result.var1.var0 = v23;
  result.var0.var1 = v22;
  result.var0.var0 = v21;
  return result;
}

- (void)runNodeDebugCollector:(id)a3
{
  PXQuadTreeNodeRunCollector((double *)self->_rootNode, (uint64_t)a3);
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (PXPlacesGeotaggedItemDataSourceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PXPlacesGeotaggedItemDataSourceDelegate *)a3;
}

- (unint64_t)capacityPerNode
{
  return self->_capacityPerNode;
}

- ($FACAC4C914AA3357BF58EDB133E9B698)rect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  $FACAC4C914AA3357BF58EDB133E9B698 result;

  objc_copyStruct(v6, &self->_rect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (void)setRect:(id)a3
{
  $FACAC4C914AA3357BF58EDB133E9B698 v3;

  v3 = a3;
  objc_copyStruct(&self->_rect, &v3, 32, 1, 0);
}

- (NSMutableSet)itemsToAdd
{
  return (NSMutableSet *)objc_getProperty(self, a2, 256, 1);
}

- (void)setItemsToAdd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSMutableArray)itemsToAddArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setItemsToAddArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSMutableSet)itemsToRemove
{
  return (NSMutableSet *)objc_getProperty(self, a2, 272, 1);
}

- (void)setItemsToRemove:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

_QWORD *__43__PXPlacesStore_minimalEncompassingMapRect__block_invoke(_QWORD *result, int a2, uint64_t a3, int a4, void *__src)
{
  _QWORD *v6;

  if (a3)
  {
    v6 = result;
    result = memcpy((void *)(result[5] + 16 * *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24)), __src, 16 * a3);
    *(_QWORD *)(*(_QWORD *)(v6[4] + 8) + 24) += a3;
  }
  return result;
}

uint64_t __37__PXPlacesStore__findItemsInMapRect___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
