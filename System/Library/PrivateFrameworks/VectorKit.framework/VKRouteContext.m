@implementation VKRouteContext

- (unint64_t)totalRouteCount
{
  unint64_t result;

  result = -[NSArray count](self->_alternateRoutes, "count");
  if (self->_routeInfo)
    ++result;
  return result;
}

- (VKRouteContext)initWithComposedRoute:(id)a3 useType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  VKRouteInfo *v7;
  VKRouteContext *v8;

  v4 = a4;
  v6 = a3;
  v7 = -[VKRouteInfo initWithComposedRoute:etaDescription:]([VKRouteInfo alloc], "initWithComposedRoute:etaDescription:", v6, 0);
  v8 = -[VKRouteContext initWithRouteInfo:useType:](self, "initWithRouteInfo:useType:", v7, v4);

  return v8;
}

- (VKRouteContext)initWithRouteInfo:(id)a3 useType:(unsigned __int8)a4
{
  id v7;
  VKRouteContext *v8;
  VKRouteContext *v9;
  uint64_t v10;
  NSHashTable *labelObservers;
  uint64_t v12;
  NSHashTable *routeLineObservers;
  uint64_t v14;
  NSHashTable *alternateRouteLineObservers;
  VKRouteContext *v16;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VKRouteContext;
  v8 = -[VKRouteContext init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_useType = a4;
    objc_storeStrong((id *)&v8->_routeInfo, a3);
    v9->_currentSegmentIndex = -1;
    v9->_currentStepIndex = -1;
    v9->_snappingToTransitLines = 0;
    v9->_routeOffset = (PolylineCoordinate)0xBF80000000000000;
    v9->_inspectedSegmentIndex = -1;
    v9->_inspectedStepIndex = -1;
    v9->_hasContextChangedForLabels = 1;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    labelObservers = v9->_labelObservers;
    v9->_labelObservers = (NSHashTable *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    routeLineObservers = v9->_routeLineObservers;
    v9->_routeLineObservers = (NSHashTable *)v12;

    v9->_hasContextChangedForAlternateRouteLines = 0;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    alternateRouteLineObservers = v9->_alternateRouteLineObservers;
    v9->_alternateRouteLineObservers = (NSHashTable *)v14;

    v16 = v9;
  }

  return v9;
}

- (VKRouteContext)initWithAnchorPoint:(id)a3 useType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  VKRouteInfo *v7;
  VKRouteContext *v8;

  v4 = a4;
  v6 = a3;
  v7 = -[VKRouteInfo initWithAnchorPoint:]([VKRouteInfo alloc], "initWithAnchorPoint:", v6);
  v8 = -[VKRouteContext initWithRouteInfo:useType:](self, "initWithRouteInfo:useType:", v7, v4);

  return v8;
}

- (id)_hashTableForObserverType:(unsigned __int8)a3
{
  if (a3 > 2u)
    return 0;
  else
    return (&self->_labelObservers)[2 * a3];
}

- (void)_setHasContextChangedForObserverType:(unsigned __int8)a3 withValue:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 <= 2u)
    *(&self->_hasContextChangedForLabels + 16 * a3) = a4;
  if (a4)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[VKRouteContext _hashTableForObserverType:](self, "_hashTableForObserverType:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "routeContextStateDidChange:", self);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)addObserver:(id)a3 withType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[VKRouteContext _hashTableForObserverType:](self, "_hashTableForObserverType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (void)removeObserver:(id)a3 withType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[VKRouteContext _hashTableForObserverType:](self, "_hashTableForObserverType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

}

- (void)resetNotificationsForObserverType:(unsigned __int8)a3
{
  -[VKRouteContext _setHasContextChangedForObserverType:withValue:](self, "_setHasContextChangedForObserverType:withValue:", a3, 0);
}

- (void)setInspectedSegmentIndex:(int64_t)a3
{
  if (self->_inspectedSegmentIndex != a3)
  {
    self->_inspectedSegmentIndex = a3;
    if (!self->_hasContextChangedForLabels)
      -[VKRouteContext _setHasContextChangedForObserverType:withValue:](self, "_setHasContextChangedForObserverType:withValue:", 0, 1);
  }
}

- (void)setInspectedStepIndex:(int64_t)a3
{
  if (self->_inspectedStepIndex != a3)
  {
    self->_inspectedStepIndex = a3;
    if (!self->_hasContextChangedForLabels)
      -[VKRouteContext _setHasContextChangedForObserverType:withValue:](self, "_setHasContextChangedForObserverType:withValue:", 0, 1);
  }
}

- (void)setCurrentStepIndex:(int64_t)a3
{
  if (self->_currentStepIndex != a3)
  {
    self->_currentStepIndex = a3;
    if (!self->_hasContextChangedForRouteLine)
      -[VKRouteContext _setHasContextChangedForObserverType:withValue:](self, "_setHasContextChangedForObserverType:withValue:", 1, 1);
  }
}

- (void)setPuckRadius:(float)a3
{
  if (vabds_f32(self->_puckRadius, a3) >= 0.000001)
  {
    self->_puckRadius = a3;
    if (!self->_hasContextChangedForLabels)
      -[VKRouteContext _setHasContextChangedForObserverType:withValue:](self, "_setHasContextChangedForObserverType:withValue:", 0, 1);
  }
}

- (void)setPuckSnappedStopID:(unint64_t)a3
{
  if (self->_puckSnappedStopID != a3)
  {
    self->_puckSnappedStopID = a3;
    if (!self->_hasContextChangedForLabels)
      -[VKRouteContext _setHasContextChangedForObserverType:withValue:](self, "_setHasContextChangedForObserverType:withValue:", 0, 1);
  }
}

- (void)setCurrentWaypoint:(id)a3 withProximity:(unsigned __int8)a4
{
  GEOComposedWaypoint *v6;
  GEOComposedWaypoint *currentWaypoint;
  id v8;

  v8 = a3;
  -[VKRouteInfo waypointForWaypoint:](self->_routeInfo, "waypointForWaypoint:");
  v6 = (GEOComposedWaypoint *)objc_claimAutoreleasedReturnValue();
  currentWaypoint = self->_currentWaypoint;
  self->_currentWaypoint = v6;

  self->_currentWaypointProximity = a4;
}

- (void)setAlternateRoutes:(id)a3
{
  NSArray *v5;
  void *v6;
  void *v7;
  NSArray *v8;

  v5 = (NSArray *)a3;
  if (self->_alternateRoutes != v5)
  {
    v8 = v5;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToSet:", v7) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alternateRoutes, a3);
      if (!self->_hasContextChangedForAlternateRouteLines)
        -[VKRouteContext _setHasContextChangedForObserverType:withValue:](self, "_setHasContextChangedForObserverType:withValue:", 2, 1);
    }

    v5 = v8;
  }

}

- (void)addShareSections:(id *)a3 shareCount:(unsigned int)a4
{
  char *v7;
  _QWORD *v8;
  char *v9;
  char *v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  v7 = (char *)operator new(0x40uLL);
  *((_DWORD *)v7 + 8) = a4;
  *((_QWORD *)v7 + 5) = 0;
  v8 = v7 + 40;
  *((_QWORD *)v7 + 6) = 0;
  *((_QWORD *)v7 + 7) = 0;
  if (a4)
  {
    v9 = (char *)operator new(24 * a4);
    *((_QWORD *)v7 + 5) = v9;
    v10 = &v9[24 * a4];
    *((_QWORD *)v7 + 7) = v10;
    do
    {
      *(_QWORD *)v9 = 0;
      *((_QWORD *)v9 + 1) = 0;
      *((_DWORD *)v9 + 3) = -1082130432;
      *((_QWORD *)v9 + 2) = 0xBF80000000000000;
      v9 += 24;
    }
    while (v9 != v10);
    *((_QWORD *)v7 + 6) = v10;
  }
  p_pair1 = &self->_shareSections.__tree_.__pair1_;
  while (1)
  {
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)p_pair1->__value_.__left_;
    v13 = p_pair1;
    if (!p_pair1->__value_.__left_)
      break;
    while (1)
    {
      p_pair1 = left;
      if (LODWORD(left[4].__value_.__left_) > a4)
        break;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)left[1].__value_.__left_;
      if (!left)
      {
        v13 = p_pair1 + 1;
        goto LABEL_10;
      }
    }
  }
LABEL_10:
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = p_pair1;
  v13->__value_.__left_ = v7;
  v14 = *(void **)self->_shareSections.__tree_.__begin_node_;
  if (v14)
  {
    self->_shareSections.__tree_.__begin_node_ = v14;
    v7 = (char *)v13->__value_.__left_;
  }
  std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_shareSections.__tree_.__pair1_.__value_.__left_, (uint64_t *)v7);
  ++self->_shareSections.__tree_.__pair3_.__value_;
  if (a4)
  {
    v15 = 0;
    do
    {
      v16 = *v8 + v15 * 24;
      v17 = *(_OWORD *)&a3[v15].var0;
      *(PolylineCoordinate *)(v16 + 16) = a3[v15].var2;
      *(_OWORD *)v16 = v17;
      ++v15;
    }
    while (a4 != v15);
  }
}

- (void)forEachSectionWithShareCount:(unsigned int)a3 dothis:(id)a4
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *left;
  unsigned int v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *v11;
  unsigned int v12;
  BOOL v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *v14;
  char *v15;
  unsigned int v16;
  BOOL v17;
  void **v18;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *v19;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *v20;
  BOOL v21;
  void (**v22)(id, _QWORD);

  v22 = (void (**)(id, _QWORD))a4;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)self->_shareSections.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_shareSections.__tree_.__pair1_;
  v6 = left;
  if (!left)
    goto LABEL_2;
  while (1)
  {
    v9 = v6[4].__value_.__left_;
    if (v9 <= a3)
      break;
    p_pair1 = v6;
LABEL_4:
    v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v6->__value_.__left_;
    if (!v6)
      goto LABEL_2;
  }
  if (v9 < a3)
  {
    ++v6;
    goto LABEL_4;
  }
  v10.__value_.__left_ = v6->__value_.__left_;
  v11 = v6;
  if (v6->__value_.__left_)
  {
    v11 = v6;
    do
    {
      v12 = *((_DWORD *)v10.__value_.__left_ + 8);
      v13 = v12 >= a3;
      if (v12 >= a3)
        v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v10.__value_.__left_;
      else
        v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)((char *)v10.__value_.__left_ + 8);
      if (v13)
        v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v10.__value_.__left_;
      v10.__value_.__left_ = v14->__value_.__left_;
    }
    while (v14->__value_.__left_);
  }
  v15 = (char *)v6[1].__value_.__left_;
  if (v15)
  {
    do
    {
      v16 = *((_DWORD *)v15 + 8);
      v17 = v16 > a3;
      if (v16 <= a3)
        v18 = (void **)(v15 + 8);
      else
        v18 = (void **)v15;
      if (v17)
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v15;
      v15 = (char *)*v18;
    }
    while (*v18);
  }
  if (v11 != p_pair1)
  {
    do
    {
      ((void (**)(id, void *))v22)[2](v22, v11[5].__value_.__left_);
      v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v11[1].__value_.__left_;
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v19->__value_.__left_;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, std::vector<RouteSection>>, void *>>> *)v11[2].__value_.__left_;
          v21 = v20->__value_.__left_ == v11;
          v11 = v20;
        }
        while (!v21);
      }
      v11 = v20;
    }
    while (v20 != p_pair1);
  }
LABEL_2:

}

- (void)forEachRouteInfo:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[VKRouteContext routeInfo](self, "routeInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, 0);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[VKRouteContext alternateRoutes](self, "alternateRoutes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        v4[2](v4, *(void **)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VKRouteContext: useType:%d routeInfo:%@ alternateRoutes:%@"), self->_useType, self->_routeInfo, self->_alternateRoutes);
}

- (VKRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (unsigned)useType
{
  return self->_useType;
}

- (PolylineCoordinate)routeOffset
{
  return self->_routeOffset;
}

- (void)setRouteOffset:(PolylineCoordinate)a3
{
  self->_routeOffset = a3;
}

- (int64_t)currentSegmentIndex
{
  return self->_currentSegmentIndex;
}

- (void)setCurrentSegmentIndex:(int64_t)a3
{
  self->_currentSegmentIndex = a3;
}

- (int64_t)currentStepIndex
{
  return self->_currentStepIndex;
}

- (BOOL)snappingToTransitLines
{
  return self->_snappingToTransitLines;
}

- (void)setSnappingToTransitLines:(BOOL)a3
{
  self->_snappingToTransitLines = a3;
}

- (int64_t)inspectedSegmentIndex
{
  return self->_inspectedSegmentIndex;
}

- (int64_t)inspectedStepIndex
{
  return self->_inspectedStepIndex;
}

- (GEOComposedWaypoint)currentWaypoint
{
  return self->_currentWaypoint;
}

- (unsigned)currentWaypointProximity
{
  return self->_currentWaypointProximity;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)puckLocation
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_puckLocation.latitude;
  longitude = self->_puckLocation.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setPuckLocation:(id)a3
{
  self->_puckLocation = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (float)puckRadius
{
  return self->_puckRadius;
}

- (unint64_t)puckSnappedStopID
{
  return self->_puckSnappedStopID;
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSString)accessPointEntryName
{
  return self->_accessPointEntryName;
}

- (void)setAccessPointEntryName:(id)a3
{
  objc_storeStrong((id *)&self->_accessPointEntryName, a3);
}

- (NSString)accessPointExitName
{
  return self->_accessPointExitName;
}

- (void)setAccessPointExitName:(id)a3
{
  objc_storeStrong((id *)&self->_accessPointExitName, a3);
}

- (NSArray)alternateRoutes
{
  return self->_alternateRoutes;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<md::FrameGraphPass *,geo::linear_set<md::FrameGraphPass *,md::FrameGraphPassLessThan,std::allocator<md::FrameGraphPass *>,std::vector<md::FrameGraphPass *>>>,std::__map_value_compare<md::FrameGraphPass *,std::__value_type<md::FrameGraphPass *,geo::linear_set<md::FrameGraphPass *,md::FrameGraphPassLessThan,std::allocator<md::FrameGraphPass *>,std::vector<md::FrameGraphPass *>>>,md::FrameGraphPassLessThan,true>,std::allocator<std::__value_type<md::FrameGraphPass *,geo::linear_set<md::FrameGraphPass *,md::FrameGraphPassLessThan,std::allocator<md::FrameGraphPass *>,std::vector<md::FrameGraphPass *>>>>>::destroy((_QWORD *)self->_shareSections.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_alternateRoutes, 0);
  objc_storeStrong((id *)&self->_alternateRouteLineObservers, 0);
  objc_storeStrong((id *)&self->_routeLineObservers, 0);
  objc_storeStrong((id *)&self->_labelObservers, 0);
  objc_storeStrong((id *)&self->_accessPointExitName, 0);
  objc_storeStrong((id *)&self->_accessPointEntryName, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_currentWaypoint, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0xBF80000000000000;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 25) = (char *)self + 208;
  return self;
}

@end
