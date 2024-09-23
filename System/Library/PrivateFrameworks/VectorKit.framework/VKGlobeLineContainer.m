@implementation VKGlobeLineContainer

- (VKGlobeLineContainer)initWithRouteRenderLayer:(void *)a3
{
  VKGlobeLineContainer *v4;
  VKGlobeLineContainer *v5;
  VKGlobeRouteSplit *v6;
  VKGlobeRouteSplit *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKGlobeLineContainer;
  v4 = -[VKGlobeLineContainer init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_routeRenderLayer = a3;
    v6 = (VKGlobeRouteSplit *)operator new();
    v6->var0 = (void **)&off_1E4293A70;
    v6->var1 = 0;
    v5->_routeSplit = v6;
    v7 = (VKGlobeRouteSplit *)operator new();
    v7->var0 = (void **)&off_1E4293A70;
    v7->var1 = 0;
    v5->_skippedRouteSplit = v7;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v5, CFSTR("RouteArrowMinZoom"), 0, 0);

  }
  return v5;
}

- (void)dealloc
{
  VKGlobeLineContainer *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *p_pair1;
  id v5;
  std::__shared_weak_count *left;
  uint64_t v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  _QWORD *routeRenderLayer;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  VKRouteMatchedAnnotationPresentation *routeLineSplitAnnotation;
  VKRouteMatchedAnnotationPresentation *skippedRouteLineSplitAnnotation;
  BOOL v17;
  VKGlobeRouteSplit *routeSplit;
  VKGlobeRouteSplit *skippedRouteSplit;
  void *v20;
  objc_super v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint64_t (**v24)();
  id v25;
  uint64_t v26;
  std::__shared_weak_count *v27;

  begin_node = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__begin_node_;
  p_pair1 = &self->_polylinesToRoutes.__tree_.__pair1_;
  if (begin_node != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
  {
    while (1)
    {
      v24 = &off_1E42B4CF0;
      v5 = begin_node->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
      v7 = (uint64_t)begin_node->_overlays.__tree_.__begin_node_;
      left = (std::__shared_weak_count *)begin_node->_overlays.__tree_.__pair1_.__value_.__left_;
      v25 = v5;
      v26 = v7;
      v27 = left;
      if (left)
      {
        p_shared_weak_owners = (unint64_t *)&left->__shared_weak_owners_;
        do
          v9 = __ldxr(p_shared_weak_owners);
        while (__stxr(v9 + 1, p_shared_weak_owners));
        routeRenderLayer = self->_routeRenderLayer;
        v22 = 0;
        v11 = std::__shared_weak_count::lock(left);
        v23 = v11;
        if (v11)
          v22 = v7;
        else
          v7 = 0;
      }
      else
      {
        v11 = 0;
        v7 = 0;
        routeRenderLayer = self->_routeRenderLayer;
        v22 = 0;
        v23 = 0;
      }
      md::realistic::RouteRenderLayer::removeRouteData(routeRenderLayer, v7);
      if (v11)
      {
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
          break;
      }
      v14 = v27;
      if (v27)
        goto LABEL_16;
LABEL_17:

      routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
      if (routeLineSplitAnnotation)
      {
        do
        {
          skippedRouteLineSplitAnnotation = routeLineSplitAnnotation;
          routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
        }
        while (routeLineSplitAnnotation);
      }
      else
      {
        do
        {
          skippedRouteLineSplitAnnotation = begin_node->_skippedRouteLineSplitAnnotation;
          v17 = *(_QWORD *)skippedRouteLineSplitAnnotation == (_QWORD)begin_node;
          begin_node = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
        }
        while (!v17);
      }
      begin_node = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
      if (skippedRouteLineSplitAnnotation == (VKRouteMatchedAnnotationPresentation *)p_pair1)
        goto LABEL_25;
    }
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
    v14 = v27;
    if (!v27)
      goto LABEL_17;
LABEL_16:
    std::__shared_weak_count::__release_weak(v14);
    goto LABEL_17;
  }
LABEL_25:
  std::__tree<std::__value_type<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::weak_ptr<altitude::RouteLineData>>,std::__map_value_compare<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__value_type<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::weak_ptr<altitude::RouteLineData>>,std::less<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__value_type<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::weak_ptr<altitude::RouteLineData>>>>::destroy((_QWORD *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_);
  self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_ = 0;
  self->_polylinesToRoutes.__tree_.__pair3_.__value_ = 0;
  self->_polylinesToRoutes.__tree_.__begin_node_ = p_pair1;
  routeSplit = self->_routeSplit;
  if (routeSplit)
    (*((void (**)(VKGlobeRouteSplit *))routeSplit->var0 + 1))(routeSplit);
  skippedRouteSplit = self->_skippedRouteSplit;
  if (skippedRouteSplit)
    (*((void (**)(VKGlobeRouteSplit *))skippedRouteSplit->var0 + 1))(skippedRouteSplit);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObserver:forKeyPath:", self, CFSTR("RouteArrowMinZoom"));

  v21.receiver = self;
  v21.super_class = (Class)VKGlobeLineContainer;
  -[VKGlobeLineContainer dealloc](&v21, sel_dealloc);
}

- (void)_addOverlay:(id)a3
{
  id v4;
  void *v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<id<VKRouteOverlay>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<id<VKRouteOverlay>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<id<VKRouteOverlay>, void *>>> *v8;
  unint64_t v9;
  uint64_t *v10;
  void *v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *v14;
  unint64_t v15;
  uint64_t *v16;
  void *v17;
  id v18;
  VKPolylineOverlay *v19;
  VKPolylineOverlay *obj;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  uint64_t (**v26)();
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  p_pair1 = &self->_retainedOverlays.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<id<VKRouteOverlay>, void *>>> *)self->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    while (1)
    {
      while (1)
      {
        v8 = left;
        v9 = (unint64_t)left[4].__value_.__left_;
        if (v9 <= (unint64_t)v4)
          break;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<id<VKRouteOverlay>, void *>>> *)v8->__value_.__left_;
        p_pair1 = v8;
        if (!v8->__value_.__left_)
          goto LABEL_8;
      }
      if (v9 >= (unint64_t)v4)
        break;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<id<VKRouteOverlay>, void *>>> *)v8[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v8 + 1;
        goto LABEL_8;
      }
    }
  }
  else
  {
    v8 = &self->_retainedOverlays.__tree_.__pair1_;
LABEL_8:
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = (uint64_t)v5;
    *v10 = 0;
    v10[1] = 0;
    v10[2] = (uint64_t)v8;
    p_pair1->__value_.__left_ = v10;
    v11 = *(void **)self->_retainedOverlays.__tree_.__begin_node_;
    if (v11)
    {
      self->_retainedOverlays.__tree_.__begin_node_ = v11;
      v10 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_retainedOverlays.__tree_.__pair1_.__value_.__left_, v10);
    ++self->_retainedOverlays.__tree_.__pair3_.__value_;
  }
  v13 = &self->_overlays.__tree_.__pair1_;
  v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)self->_overlays.__tree_.__pair1_.__value_.__left_;
  if (v12)
  {
    while (1)
    {
      while (1)
      {
        v14 = v12;
        v15 = (unint64_t)v12[4].__value_.__left_;
        if (v15 <= (unint64_t)v5)
          break;
        v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v14->__value_.__left_;
        v13 = v14;
        if (!v14->__value_.__left_)
          goto LABEL_18;
      }
      if (v15 >= (unint64_t)v5)
        break;
      v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v14[1].__value_.__left_;
      if (!v12)
      {
        v13 = v14 + 1;
        goto LABEL_18;
      }
    }
  }
  else
  {
    v14 = &self->_overlays.__tree_.__pair1_;
LABEL_18:
    v16 = (uint64_t *)operator new(0x28uLL);
    v16[4] = (uint64_t)v5;
    *v16 = 0;
    v16[1] = 0;
    v16[2] = (uint64_t)v14;
    v13->__value_.__left_ = v16;
    v17 = *(void **)self->_overlays.__tree_.__begin_node_;
    if (v17)
    {
      self->_overlays.__tree_.__begin_node_ = v17;
      v16 = (uint64_t *)v13->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_overlays.__tree_.__pair1_.__value_.__left_, v16);
    ++self->_overlays.__tree_.__pair3_.__value_;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v5;
      objc_msgSend(v18, "selectedPolyline");
      v19 = (VKPolylineOverlay *)(id)objc_claimAutoreleasedReturnValue();
      obj = self->_selectedPolyline._obj;
      self->_selectedPolyline._obj = v19;

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v18, "polylines");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(v21);
            v25 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * i);
            v26 = &off_1E42B4CF0;
            v27 = v25;
            -[VKGlobeLineContainer addLine:](self, "addLine:", &v26);
            v26 = &off_1E42B4CF0;

          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v22);
      }

    }
  }

}

- (void)addPersistentOverlay:(id)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *p_pair1;
  id v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *v7;
  unint64_t v8;
  uint64_t *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_pair1 = &self->_persistentOverlays.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)self->_persistentOverlays.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v6 = v11;
    while (1)
    {
      while (1)
      {
        v7 = left;
        v8 = (unint64_t)left[4].__value_.__left_;
        if (v8 <= (unint64_t)v11)
          break;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v7->__value_.__left_;
        p_pair1 = v7;
        if (!v7->__value_.__left_)
          goto LABEL_9;
      }
      if (v8 >= (unint64_t)v11)
        break;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v7[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = &self->_persistentOverlays.__tree_.__pair1_;
LABEL_9:
    v9 = (uint64_t *)operator new(0x28uLL);
    v9[4] = (uint64_t)v11;
    *v9 = 0;
    v9[1] = 0;
    v9[2] = (uint64_t)v7;
    p_pair1->__value_.__left_ = v9;
    v10 = *(void **)self->_persistentOverlays.__tree_.__begin_node_;
    if (v10)
    {
      self->_persistentOverlays.__tree_.__begin_node_ = v10;
      v9 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_persistentOverlays.__tree_.__pair1_.__value_.__left_, v9);
    ++self->_persistentOverlays.__tree_.__pair3_.__value_;
    v6 = v11;
  }
  -[VKGlobeLineContainer _addOverlay:](self, "_addOverlay:", v6);

}

- (void)addNonPersistentOverlay:(id)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *p_pair1;
  id v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *v7;
  unint64_t v8;
  uint64_t *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_pair1 = &self->_nonPersistentOverlays.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)self->_nonPersistentOverlays.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v6 = v11;
    while (1)
    {
      while (1)
      {
        v7 = left;
        v8 = (unint64_t)left[4].__value_.__left_;
        if (v8 <= (unint64_t)v11)
          break;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v7->__value_.__left_;
        p_pair1 = v7;
        if (!v7->__value_.__left_)
          goto LABEL_9;
      }
      if (v8 >= (unint64_t)v11)
        break;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v7[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = &self->_nonPersistentOverlays.__tree_.__pair1_;
LABEL_9:
    v9 = (uint64_t *)operator new(0x28uLL);
    v9[4] = (uint64_t)v11;
    *v9 = 0;
    v9[1] = 0;
    v9[2] = (uint64_t)v7;
    p_pair1->__value_.__left_ = v9;
    v10 = *(void **)self->_nonPersistentOverlays.__tree_.__begin_node_;
    if (v10)
    {
      self->_nonPersistentOverlays.__tree_.__begin_node_ = v10;
      v9 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_nonPersistentOverlays.__tree_.__pair1_.__value_.__left_, v9);
    ++self->_nonPersistentOverlays.__tree_.__pair3_.__value_;
    v6 = v11;
  }
  -[VKGlobeLineContainer _addOverlay:](self, "_addOverlay:", v6);

}

- (void)_removeOverlay:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t *left;
  VKGlobeLineContainer *p_pair1;
  VKGlobeLineContainer *v13;
  unint64_t begin_node;
  BOOL v15;
  VKGlobeLineContainer **p_routeLineSplitAnnotation;
  VKRouteMatchedAnnotationPresentation *routeLineSplitAnnotation;
  VKGlobeLineContainer **skippedRouteLineSplitAnnotation;
  VKGlobeLineContainer *v19;
  BOOL v20;
  uint64_t *v21;
  VKGlobeLineContainer *v22;
  VKGlobeLineContainer *v23;
  unint64_t v24;
  BOOL v25;
  VKGlobeLineContainer **v26;
  VKRouteMatchedAnnotationPresentation *v27;
  VKGlobeLineContainer **v28;
  VKGlobeLineContainer *v29;
  uint64_t (**v30)();
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v5, "polylines");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(v6);
          v10 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v30 = &off_1E42B4CF0;
          v31 = v10;
          -[VKGlobeLineContainer removeLine:](self, "removeLine:", &v30);
          v30 = &off_1E42B4CF0;

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v7);
    }

  }
  left = (uint64_t *)self->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = (VKGlobeLineContainer *)&self->_retainedOverlays.__tree_.__pair1_;
    v13 = (VKGlobeLineContainer *)self->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
    do
    {
      begin_node = (unint64_t)v13->_retainedOverlays.__tree_.__begin_node_;
      v15 = begin_node >= (unint64_t)v4;
      if (begin_node >= (unint64_t)v4)
        p_routeLineSplitAnnotation = (VKGlobeLineContainer **)v13;
      else
        p_routeLineSplitAnnotation = (VKGlobeLineContainer **)&v13->_routeLineSplitAnnotation;
      if (v15)
        p_pair1 = v13;
      v13 = *p_routeLineSplitAnnotation;
    }
    while (*p_routeLineSplitAnnotation);
    if (p_pair1 != (VKGlobeLineContainer *)&self->_retainedOverlays.__tree_.__pair1_
      && p_pair1->_retainedOverlays.__tree_.__begin_node_ <= v4)
    {
      routeLineSplitAnnotation = p_pair1->_routeLineSplitAnnotation;
      if (routeLineSplitAnnotation)
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)routeLineSplitAnnotation;
          routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
        }
        while (routeLineSplitAnnotation);
      }
      else
      {
        v19 = p_pair1;
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)v19->_skippedRouteLineSplitAnnotation;
          v20 = *skippedRouteLineSplitAnnotation == v19;
          v19 = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
        }
        while (!v20);
      }
      if (self->_retainedOverlays.__tree_.__begin_node_ == p_pair1)
        self->_retainedOverlays.__tree_.__begin_node_ = skippedRouteLineSplitAnnotation;
      --self->_retainedOverlays.__tree_.__pair3_.__value_;
      std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(left, (uint64_t *)p_pair1);

      operator delete(p_pair1);
    }
  }
  v21 = (uint64_t *)self->_overlays.__tree_.__pair1_.__value_.__left_;
  if (v21)
  {
    v22 = (VKGlobeLineContainer *)&self->_overlays.__tree_.__pair1_;
    v23 = (VKGlobeLineContainer *)self->_overlays.__tree_.__pair1_.__value_.__left_;
    do
    {
      v24 = (unint64_t)v23->_retainedOverlays.__tree_.__begin_node_;
      v25 = v24 >= (unint64_t)v4;
      if (v24 >= (unint64_t)v4)
        v26 = (VKGlobeLineContainer **)v23;
      else
        v26 = (VKGlobeLineContainer **)&v23->_routeLineSplitAnnotation;
      if (v25)
        v22 = v23;
      v23 = *v26;
    }
    while (*v26);
    if (v22 != (VKGlobeLineContainer *)&self->_overlays.__tree_.__pair1_
      && v22->_retainedOverlays.__tree_.__begin_node_ <= v4)
    {
      v27 = v22->_routeLineSplitAnnotation;
      if (v27)
      {
        do
        {
          v28 = (VKGlobeLineContainer **)v27;
          v27 = *(VKRouteMatchedAnnotationPresentation **)v27;
        }
        while (v27);
      }
      else
      {
        v29 = v22;
        do
        {
          v28 = (VKGlobeLineContainer **)v29->_skippedRouteLineSplitAnnotation;
          v20 = *v28 == v29;
          v29 = (VKGlobeLineContainer *)v28;
        }
        while (!v20);
      }
      if (self->_overlays.__tree_.__begin_node_ == v22)
        self->_overlays.__tree_.__begin_node_ = v28;
      --self->_overlays.__tree_.__pair3_.__value_;
      std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v21, (uint64_t *)v22);
      operator delete(v22);
    }
  }

}

- (BOOL)hasNonPersistentOverlay:(id)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *v6;
  unint64_t v7;
  BOOL v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> **v9;

  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)self->_nonPersistentOverlays.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_nonPersistentOverlays.__tree_.__pair1_;
  v4 = left;
  if (!left)
    goto LABEL_12;
  v6 = p_pair1;
  do
  {
    v7 = (unint64_t)v4[4].__value_.__left_;
    v8 = v7 >= (unint64_t)a3;
    if (v7 >= (unint64_t)a3)
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> **)v4;
    else
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> **)&v4[1];
    if (v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == p_pair1 || v6[4].__value_.__left_ > a3)
LABEL_12:
    v6 = p_pair1;
  return v6 != p_pair1;
}

- (BOOL)hasPersistentOverlay:(id)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *v6;
  unint64_t v7;
  BOOL v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> **v9;

  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)self->_persistentOverlays.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_persistentOverlays.__tree_.__pair1_;
  v4 = left;
  if (!left)
    goto LABEL_12;
  v6 = p_pair1;
  do
  {
    v7 = (unint64_t)v4[4].__value_.__left_;
    v8 = v7 >= (unint64_t)a3;
    if (v7 >= (unint64_t)a3)
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> **)v4;
    else
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> **)&v4[1];
    if (v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == p_pair1 || v6[4].__value_.__left_ > a3)
LABEL_12:
    v6 = p_pair1;
  return v6 != p_pair1;
}

- (void)removePersistentOverlay:(id)a3
{
  uint64_t *left;
  id v5;
  VKGlobeLineContainer *p_pair1;
  VKGlobeLineContainer *v7;
  unint64_t begin_node;
  BOOL v9;
  VKGlobeLineContainer **p_routeLineSplitAnnotation;
  VKRouteMatchedAnnotationPresentation *routeLineSplitAnnotation;
  VKGlobeLineContainer **skippedRouteLineSplitAnnotation;
  VKGlobeLineContainer *v13;
  BOOL v14;
  id v15;

  v15 = a3;
  if (v15)
  {
    left = (uint64_t *)self->_persistentOverlays.__tree_.__pair1_.__value_.__left_;
    v5 = v15;
    if (left)
    {
      p_pair1 = (VKGlobeLineContainer *)&self->_persistentOverlays.__tree_.__pair1_;
      v7 = (VKGlobeLineContainer *)self->_persistentOverlays.__tree_.__pair1_.__value_.__left_;
      do
      {
        begin_node = (unint64_t)v7->_retainedOverlays.__tree_.__begin_node_;
        v9 = begin_node >= (unint64_t)v15;
        if (begin_node >= (unint64_t)v15)
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)v7;
        else
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)&v7->_routeLineSplitAnnotation;
        if (v9)
          p_pair1 = v7;
        v7 = *p_routeLineSplitAnnotation;
      }
      while (*p_routeLineSplitAnnotation);
      if (p_pair1 != (VKGlobeLineContainer *)&self->_persistentOverlays.__tree_.__pair1_
        && p_pair1->_retainedOverlays.__tree_.__begin_node_ <= v15)
      {
        routeLineSplitAnnotation = p_pair1->_routeLineSplitAnnotation;
        if (routeLineSplitAnnotation)
        {
          do
          {
            skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)routeLineSplitAnnotation;
            routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
          }
          while (routeLineSplitAnnotation);
        }
        else
        {
          v13 = p_pair1;
          do
          {
            skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)v13->_skippedRouteLineSplitAnnotation;
            v14 = *skippedRouteLineSplitAnnotation == v13;
            v13 = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
          }
          while (!v14);
        }
        if (self->_persistentOverlays.__tree_.__begin_node_ == p_pair1)
          self->_persistentOverlays.__tree_.__begin_node_ = skippedRouteLineSplitAnnotation;
        --self->_persistentOverlays.__tree_.__pair3_.__value_;
        std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(left, (uint64_t *)p_pair1);
        operator delete(p_pair1);
        v5 = v15;
      }
    }
    -[VKGlobeLineContainer _removeOverlay:](self, "_removeOverlay:", v5);
  }

}

- (void)removeNonPersistentOverlay:(id)a3
{
  uint64_t *left;
  id v5;
  VKGlobeLineContainer *p_pair1;
  VKGlobeLineContainer *v7;
  unint64_t begin_node;
  BOOL v9;
  VKGlobeLineContainer **p_routeLineSplitAnnotation;
  VKRouteMatchedAnnotationPresentation *routeLineSplitAnnotation;
  VKGlobeLineContainer **skippedRouteLineSplitAnnotation;
  VKGlobeLineContainer *v13;
  BOOL v14;
  id v15;

  v15 = a3;
  if (v15)
  {
    left = (uint64_t *)self->_nonPersistentOverlays.__tree_.__pair1_.__value_.__left_;
    v5 = v15;
    if (left)
    {
      p_pair1 = (VKGlobeLineContainer *)&self->_nonPersistentOverlays.__tree_.__pair1_;
      v7 = (VKGlobeLineContainer *)self->_nonPersistentOverlays.__tree_.__pair1_.__value_.__left_;
      do
      {
        begin_node = (unint64_t)v7->_retainedOverlays.__tree_.__begin_node_;
        v9 = begin_node >= (unint64_t)v15;
        if (begin_node >= (unint64_t)v15)
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)v7;
        else
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)&v7->_routeLineSplitAnnotation;
        if (v9)
          p_pair1 = v7;
        v7 = *p_routeLineSplitAnnotation;
      }
      while (*p_routeLineSplitAnnotation);
      if (p_pair1 != (VKGlobeLineContainer *)&self->_nonPersistentOverlays.__tree_.__pair1_
        && p_pair1->_retainedOverlays.__tree_.__begin_node_ <= v15)
      {
        routeLineSplitAnnotation = p_pair1->_routeLineSplitAnnotation;
        if (routeLineSplitAnnotation)
        {
          do
          {
            skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)routeLineSplitAnnotation;
            routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
          }
          while (routeLineSplitAnnotation);
        }
        else
        {
          v13 = p_pair1;
          do
          {
            skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)v13->_skippedRouteLineSplitAnnotation;
            v14 = *skippedRouteLineSplitAnnotation == v13;
            v13 = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
          }
          while (!v14);
        }
        if (self->_nonPersistentOverlays.__tree_.__begin_node_ == p_pair1)
          self->_nonPersistentOverlays.__tree_.__begin_node_ = skippedRouteLineSplitAnnotation;
        --self->_nonPersistentOverlays.__tree_.__pair3_.__value_;
        std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(left, (uint64_t *)p_pair1);
        operator delete(p_pair1);
        v5 = v15;
      }
    }
    -[VKGlobeLineContainer _removeOverlay:](self, "_removeOverlay:", v5);
  }

}

- (const)overlays
{
  return &self->_overlays;
}

- (const)persistentOverlays
{
  return &self->_persistentOverlays;
}

- (const)nonPersistentOverlays
{
  return &self->_nonPersistentOverlays;
}

- (void)addLine:(_retain_ptr<VKPolylineOverlay *)
{
  void **v3;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  _QWORD *routeRenderLayer;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  __double2 v22;
  __double2 v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  _DWORD *v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  __int128 v43;
  __int128 v44;
  char *v45;
  unint64_t v46;
  double *v47;
  double *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  double *v53;
  double *v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  float v67;
  float v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t *v71;
  unint64_t *v72;
  unint64_t v73;
  std::__shared_weak_count *v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  md::realistic::RealisticRenderLayer *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t *v85;
  unint64_t v86;
  std::__shared_weak_count *v87;
  unint64_t *v88;
  unint64_t v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;
  std::__shared_weak_count *v93;
  unint64_t *v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  std::__shared_weak_count *v100;
  unint64_t *v101;
  unint64_t v102;
  std::__shared_weak_count *v103;
  unint64_t *v104;
  std::__shared_weak_count *v105;
  unint64_t *v106;
  std::__shared_weak_count *v107;
  unint64_t *v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t *v112;
  unint64_t v113;
  unint64_t *v114;
  unint64_t v115;
  uint64_t RibbonTexture;
  _QWORD *v117;
  std::__shared_weak_count *v118;
  unint64_t *v119;
  unint64_t v120;
  std::__shared_weak_count *v121;
  uint64_t v122;
  std::__shared_weak_count *v123;
  uint64_t v124;
  uint64_t v125;
  std::__shared_weak_count *v126;
  unint64_t *v127;
  unint64_t v128;
  md::realistic::RealisticRenderLayer *v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t *v132;
  unint64_t v133;
  std::__shared_weak_count *v134;
  unint64_t *v135;
  unint64_t v136;
  std::__shared_weak_count *v137;
  unint64_t *v138;
  unint64_t v139;
  char *v140;
  uint64_t v141;
  uint64_t *v142;
  __int128 v143;
  std::__shared_weak_count *v144;
  unint64_t *v145;
  unint64_t v146;
  std::__shared_weak_count *v147;
  unint64_t *v148;
  unint64_t v149;
  std::__shared_weak_count *v150;
  unint64_t *v151;
  unint64_t v152;
  _QWORD *v153;
  _QWORD *v154;
  unint64_t *v155;
  unint64_t v156;
  std::__shared_weak_count *v157;
  unint64_t *v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  std::__shared_weak_count *v163;
  unint64_t *v164;
  unint64_t v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  std::__shared_weak_count *v169;
  unint64_t *v170;
  unint64_t v171;
  uint64_t v172;
  unint64_t *v173;
  unint64_t v174;
  unint64_t v175;
  unint64_t v176;
  unint64_t *v177;
  unint64_t v178;
  unint64_t *v179;
  unint64_t v180;
  unint64_t v181;
  _QWORD *v182;
  uint64_t v183;
  unint64_t v184;
  unint64_t v185;
  unint64_t v186;
  unint64_t v187;
  char *v188;
  char *v189;
  char *v190;
  char *v191;
  _QWORD *v192;
  _QWORD *v193;
  __int128 v194;
  _QWORD *v195;
  std::__shared_weak_count *v196;
  unint64_t *v197;
  unint64_t v198;
  std::__shared_weak_count *v199;
  unint64_t *v200;
  unint64_t v201;
  uint64_t v202;
  unint64_t *v203;
  unint64_t v204;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *p_pair1;
  void *v207;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *v208;
  void *v209;
  uint64_t *v210;
  void *v211;
  uint64_t *v212;
  std::__shared_weak_count *v213;
  uint64_t v214;
  unint64_t *p_shared_weak_owners;
  unint64_t v216;
  std::__shared_weak_count *v217;
  id WeakRetained;
  unint64_t *v219;
  unint64_t v220;
  uint64_t v221;
  _QWORD *v222;
  std::__shared_weak_count *v223;
  unint64_t *v224;
  unint64_t v225;
  uint64_t v226;
  std::__shared_weak_count *v227;
  _QWORD *v228;
  _QWORD *v229;
  void **v230;
  VKGlobeLineContainer *v231;
  std::__shared_weak_count *v232;
  uint64_t v233;
  std::__shared_weak_count *v234;
  void *v235;
  std::__shared_weak_count *v236;
  uint64_t v237;
  std::__shared_weak_count *v238;
  uint64_t v239;
  std::__shared_weak_count *v240;
  uint64_t v241;
  std::__shared_weak_count *v242;
  void *__p[4];
  __int128 v244;
  char *v245;
  std::__shared_weak_count *v246;

  v3 = a3._vptr$_retain_ptr;
  v5 = operator new();
  v6 = v3[1];
  v7 = (void *)objc_msgSend(v6, "composedRoute");
  v8 = v3[1];
  v9 = (void *)objc_msgSend(v8, "traffic");
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v5 + 16) = 0u;
  v10 = v7;
  *(_QWORD *)v5 = v10;
  *(_QWORD *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 32) = v9;
  *(_QWORD *)(v5 + 40) = 0;
  *(_QWORD *)(v5 + 72) = 0;
  *(_QWORD *)(v5 + 48) = 0;
  *(_QWORD *)(v5 + 56) = 0;
  *(_WORD *)(v5 + 64) = 0;
  *(_QWORD *)(v5 + 40) = v10;
  v237 = v5;
  v11 = (std::__shared_weak_count *)operator new();
  v11->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  v11->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E86E0;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = (std::__shared_weak_count_vtbl *)v5;
  v238 = v11;

  routeRenderLayer = self->_routeRenderLayer;
  v235 = (void *)v5;
  v236 = v11;
  do
    v14 = __ldxr(p_shared_owners);
  while (__stxr(v14 + 1, p_shared_owners));
  v15 = operator new();
  *(_QWORD *)v15 = 0;
  *(_OWORD *)(v15 + 8) = xmmword_19FFB5890;
  *(_DWORD *)(v15 + 24) = 0;
  *(_BYTE *)(v15 + 28) = 0;
  *(_QWORD *)(v15 + 32) = routeRenderLayer;
  *(_QWORD *)(v15 + 40) = v5;
  *(_OWORD *)(v15 + 48) = 0u;
  *(_OWORD *)(v15 + 64) = 0u;
  *(_OWORD *)(v15 + 80) = 0u;
  *(_OWORD *)(v15 + 96) = 0u;
  *(_OWORD *)(v15 + 112) = 0u;
  *(_OWORD *)(v15 + 152) = 0u;
  *(_OWORD *)(v15 + 168) = 0u;
  *(_OWORD *)(v15 + 184) = 0u;
  *(_OWORD *)(v15 + 200) = 0u;
  *(_QWORD *)(v15 + 216) = 0;
  v230 = v3;
  v231 = self;
  v229 = routeRenderLayer;
  if (objc_msgSend(*(id *)(v5 + 40), "pointCount"))
    v16 = *(void **)(v5 + 40);
  else
    v16 = 0;
  v17 = 0;
  while (v16 || v17)
  {
    objc_msgSend(v16, "pointAt:", v17);
    v21 = v20 * 0.0174532925;
    v22 = __sincos_stret(v19 * 0.0174532925);
    v23 = __sincos_stret(v21);
    v24 = *(_QWORD *)(v15 + 40);
    if (objc_msgSend(*(id *)(v24 + 40), "pointCount"))
      v25 = *(void **)(v24 + 40);
    else
      v25 = 0;
    v26 = 6378137.0 / sqrt(v22.__sinval * v22.__sinval * -0.00669437999 + 1.0);
    v27 = v26 * v22.__cosval * v23.__cosval;
    v28 = v26 * v22.__cosval * v23.__sinval;
    v29 = v22.__sinval * 0.99330562 * v26;
    v30 = *(double *)(v15 + 16);
    if (v16 != v25 || v17)
    {
      v31 = *(_QWORD *)(v15 + 88);
      v30 = sqrt((v27 - *(double *)(v31 - 24)) * (v27 - *(double *)(v31 - 24))+ (v28 - *(double *)(v31 - 16)) * (v28 - *(double *)(v31 - 16))+ (v29 - *(double *)(v31 - 8)) * (v29 - *(double *)(v31 - 8)))+ v30;
      *(double *)(v15 + 16) = v30;
    }
    v33 = *(char **)(v15 + 56);
    v32 = *(char **)(v15 + 64);
    v34 = (v32 - v33) / 48;
    v35 = *(_QWORD *)(v15 + 72);
    if ((unint64_t)v32 >= v35)
    {
      v37 = v34 + 1;
      if ((unint64_t)(v34 + 1) > 0x555555555555555)
        goto LABEL_259;
      v38 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v35 - (_QWORD)v33) >> 4);
      if (2 * v38 > v37)
        v37 = 2 * v38;
      if (v38 >= 0x2AAAAAAAAAAAAAALL)
        v39 = 0x555555555555555;
      else
        v39 = v37;
      if (v39)
      {
        if (v39 > 0x555555555555555)
          goto LABEL_260;
        v40 = (char *)operator new(48 * v39);
      }
      else
      {
        v40 = 0;
      }
      v41 = &v40[48 * v34];
      *(_DWORD *)v41 = -1;
      *((double *)v41 + 1) = v30;
      *((_QWORD *)v41 + 2) = 0;
      *((_QWORD *)v41 + 3) = 0;
      v41[32] = 0;
      *((_DWORD *)v41 + 9) = v34;
      *((_QWORD *)v41 + 5) = 0xFFFFFFFFLL;
      v42 = v41;
      if (v32 != v33)
      {
        do
        {
          v43 = *((_OWORD *)v32 - 3);
          v44 = *((_OWORD *)v32 - 1);
          *((_OWORD *)v42 - 2) = *((_OWORD *)v32 - 2);
          *((_OWORD *)v42 - 1) = v44;
          *((_OWORD *)v42 - 3) = v43;
          v42 -= 48;
          v32 -= 48;
        }
        while (v32 != v33);
        v32 = *(char **)(v15 + 56);
      }
      v45 = &v40[48 * v39];
      v36 = v41 + 48;
      *(_QWORD *)(v15 + 56) = v42;
      *(_QWORD *)(v15 + 64) = v41 + 48;
      *(_QWORD *)(v15 + 72) = v45;
      if (v32)
        operator delete(v32);
    }
    else
    {
      *(_DWORD *)v32 = -1;
      *((double *)v32 + 1) = v30;
      *((_QWORD *)v32 + 2) = 0;
      *((_QWORD *)v32 + 3) = 0;
      v32[32] = 0;
      *((_DWORD *)v32 + 9) = v34;
      v36 = v32 + 48;
      *((_QWORD *)v32 + 5) = 0xFFFFFFFFLL;
    }
    *(_QWORD *)(v15 + 64) = v36;
    v47 = *(double **)(v15 + 88);
    v46 = *(_QWORD *)(v15 + 96);
    if ((unint64_t)v47 < v46)
    {
      *v47 = v27;
      v47[1] = v28;
      v18 = v47 + 3;
      v47[2] = v29;
    }
    else
    {
      v48 = *(double **)(v15 + 80);
      v49 = 0xAAAAAAAAAAAAAAABLL * (v47 - v48) + 1;
      if (v49 > 0xAAAAAAAAAAAAAAALL)
LABEL_259:
        abort();
      v50 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v46 - (_QWORD)v48) >> 3);
      if (2 * v50 > v49)
        v49 = 2 * v50;
      if (v50 >= 0x555555555555555)
        v51 = 0xAAAAAAAAAAAAAAALL;
      else
        v51 = v49;
      if (v51)
      {
        if (v51 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_260;
        v52 = (char *)operator new(24 * v51);
      }
      else
      {
        v52 = 0;
      }
      v53 = (double *)&v52[8 * (v47 - v48)];
      *v53 = v27;
      v53[1] = v28;
      v53[2] = v29;
      v54 = v53;
      if (v47 != v48)
      {
        do
        {
          v55 = *(_OWORD *)(v47 - 3);
          *(v54 - 1) = *(v47 - 1);
          *(_OWORD *)(v54 - 3) = v55;
          v54 -= 3;
          v47 -= 3;
        }
        while (v47 != v48);
        v47 = *(double **)(v15 + 80);
      }
      v18 = v53 + 3;
      *(_QWORD *)(v15 + 80) = v54;
      *(_QWORD *)(v15 + 88) = v53 + 3;
      *(_QWORD *)(v15 + 96) = &v52[24 * v51];
      if (v47)
        operator delete(v47);
    }
    *(_QWORD *)(v15 + 88) = v18;
    if (v17 + 1 < (unint64_t)objc_msgSend(v16, "pointCount"))
    {
      ++v17;
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
  }
  v57 = *(_QWORD *)(v15 + 80);
  v56 = *(_QWORD *)(v15 + 88);
  v58 = 0xAAAAAAAAAAAAAAABLL * ((v56 - v57) >> 3);
  if (v58 >= 2)
  {
    if (v56 == v57)
    {
      v64 = 0;
      v62 = 0.0;
    }
    else
    {
      v59 = 0;
      v60 = 0;
      v61 = *(_QWORD *)(v15 + 56);
      v62 = 0.0;
      v63 = 1;
      do
      {
        v64 = v59;
        v65 = v61 + 48 * v59;
        v66 = *(double *)(v65 + 8);
        *(double *)(v65 + 16) = v66 / *(double *)(v15 + 16);
        v59 = v63;
        if ((unint64_t)v63 - v60 < 0x1F4 || v58 <= v63)
        {
          v64 = v60;
        }
        else
        {
          v67 = v66 - v62;
          altitude::Route::append((altitude::Route *)v15, v60, v63, v67);
          v61 = *(_QWORD *)(v15 + 56);
          v62 = *(double *)(v61 + 48 * v64 + 8);
          v57 = *(_QWORD *)(v15 + 80);
          v56 = *(_QWORD *)(v15 + 88);
        }
        v58 = 0xAAAAAAAAAAAAAAABLL * ((v56 - v57) >> 3);
        v63 = v59 + 1;
        v60 = v64;
      }
      while (v58 > v59);
    }
    v68 = *(double *)(*(_QWORD *)(v15 + 64) - 40) - v62;
    altitude::Route::append((altitude::Route *)v15, v64, v58, v68);
  }
  v69 = operator new();
  v70 = *(_QWORD *)(v15 + 32);
  *(_OWORD *)(v69 + 16) = 0u;
  *(_QWORD *)v69 = v15;
  *(_QWORD *)(v69 + 8) = v70;
  *(_OWORD *)(v69 + 32) = 0u;
  *(_OWORD *)(v69 + 48) = 0u;
  *(_OWORD *)(v69 + 64) = 0u;
  *(_OWORD *)(v69 + 80) = 0u;
  *(_QWORD *)(v69 + 96) = 0;
  *(_BYTE *)(v69 + 104) = *(_BYTE *)(v70 + 330);
  v71 = *(unint64_t **)(v70 + 192);
  __p[0] = *(void **)(v70 + 184);
  __p[1] = v71;
  if (v71)
  {
    v72 = v71 + 1;
    do
      v73 = __ldxr(v72);
    while (__stxr(v73 + 1, v72));
  }
  v74 = (std::__shared_weak_count *)operator new(0xE8uLL);
  v74->__shared_owners_ = 0;
  v74->__shared_weak_owners_ = 0;
  v74->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E11A0;
  v75 = ggl::BufferData::BufferData((uint64_t)&v74[1], qword_1EE56F090, 2, 1, 6, 1);
  v74[9].__shared_owners_ = (uint64_t)ggl::FlyoverRoute::Displacement::reflection(void)::reflection;
  v74[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B8D90;
  v245 = (char *)v75;
  v246 = v74;
  v76 = operator new(0xE8uLL);
  v76[1] = 0;
  v76[2] = 0;
  *v76 = &off_1E42E11D8;
  v77 = ggl::BufferData::BufferData((uint64_t)(v76 + 3), qword_1EE56F150, 2, 1, 6, 1);
  v76[28] = ggl::FlyoverRoute::Style::reflection(void)::reflection;
  v76[3] = &off_1E42B8DB0;
  *(_QWORD *)&v244 = v77;
  *((_QWORD *)&v244 + 1) = v76;
  v78 = *(_QWORD *)(v70 + 56);
  v79 = *(std::__shared_weak_count **)(v70 + 64);
  if (v79)
  {
    v80 = (unint64_t *)&v79->__shared_owners_;
    do
      v81 = __ldxr(v80);
    while (__stxr(v81 + 1, v80));
  }
  v82 = (md::realistic::RealisticRenderLayer *)operator new();
  v83 = (uint64_t)v82;
  if (!*(_QWORD *)(v70 + 280))
  {
    RibbonTexture = md::realistic::RealisticRenderLayer::createRibbonTexture(v82);
    v117 = (_QWORD *)operator new();
    *v117 = &off_1E42E7E58;
    v117[1] = 0;
    v117[2] = 0;
    v117[3] = RibbonTexture;
    v118 = *(std::__shared_weak_count **)(v70 + 288);
    *(_QWORD *)(v70 + 280) = RibbonTexture;
    *(_QWORD *)(v70 + 288) = v117;
    if (v118)
    {
      v119 = (unint64_t *)&v118->__shared_owners_;
      do
        v120 = __ldaxr(v119);
      while (__stlxr(v120 - 1, v119));
      if (!v120)
      {
        ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
        std::__shared_weak_count::__release_weak(v118);
      }
    }
  }
  ggl::FlyoverRoute::DefaultPipelineSetup::DefaultPipelineSetup(v83, v78, v79, (uint64_t *)__p, (uint64_t *)&v245, (uint64_t *)&v244, *(_QWORD *)(v70 + 280));
  v84 = *(_QWORD *)(v69 + 72);
  *(_QWORD *)(v69 + 72) = v83;
  if (v84)
    (*(void (**)(uint64_t))(*(_QWORD *)v84 + 8))(v84);
  *(_QWORD *)(v69 + 88) = *(_QWORD *)(v70 + 120);
  if (!*(_BYTE *)(v69 + 104))
  {
    v121 = (std::__shared_weak_count *)operator new(0xE8uLL);
    v121->__shared_owners_ = 0;
    v121->__shared_weak_owners_ = 0;
    v121->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E11A0;
    v122 = ggl::BufferData::BufferData((uint64_t)&v121[1], qword_1EE56F090, 2, 1, 6, 1);
    v121[9].__shared_owners_ = (uint64_t)ggl::FlyoverRoute::Displacement::reflection(void)::reflection;
    v121[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B8D90;
    v241 = v122;
    v242 = v121;
    v123 = (std::__shared_weak_count *)operator new(0xE8uLL);
    v123->__shared_owners_ = 0;
    v123->__shared_weak_owners_ = 0;
    v123->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E11D8;
    v124 = ggl::BufferData::BufferData((uint64_t)&v123[1], qword_1EE56F150, 2, 1, 6, 1);
    v123[9].__shared_owners_ = (uint64_t)ggl::FlyoverRoute::Style::reflection(void)::reflection;
    v123[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B8DB0;
    v239 = v124;
    v240 = v123;
    v125 = *(_QWORD *)(v70 + 56);
    v126 = *(std::__shared_weak_count **)(v70 + 64);
    if (v126)
    {
      v127 = (unint64_t *)&v126->__shared_owners_;
      do
        v128 = __ldxr(v127);
      while (__stxr(v128 + 1, v127));
    }
    v129 = (md::realistic::RealisticRenderLayer *)operator new();
    v130 = (uint64_t)v129;
    if (!*(_QWORD *)(v70 + 280))
    {
      v221 = md::realistic::RealisticRenderLayer::createRibbonTexture(v129);
      v222 = (_QWORD *)operator new();
      *v222 = &off_1E42E7E58;
      v222[1] = 0;
      v222[2] = 0;
      v222[3] = v221;
      v223 = *(std::__shared_weak_count **)(v70 + 288);
      *(_QWORD *)(v70 + 280) = v221;
      *(_QWORD *)(v70 + 288) = v222;
      if (v223)
      {
        v224 = (unint64_t *)&v223->__shared_owners_;
        do
          v225 = __ldaxr(v224);
        while (__stlxr(v225 - 1, v224));
        if (!v225)
        {
          ((void (*)(std::__shared_weak_count *))v223->__on_zero_shared)(v223);
          std::__shared_weak_count::__release_weak(v223);
        }
      }
    }
    ggl::FlyoverRoute::DefaultPipelineSetup::DefaultPipelineSetup(v130, v125, v126, (uint64_t *)__p, &v241, &v239, *(_QWORD *)(v70 + 280));
    v131 = *(_QWORD *)(v69 + 80);
    *(_QWORD *)(v69 + 80) = v130;
    if (v131)
      (*(void (**)(uint64_t))(*(_QWORD *)v131 + 8))(v131);
    *(_QWORD *)(v69 + 96) = *(_QWORD *)(v70 + 128);
    if (v126)
    {
      v132 = (unint64_t *)&v126->__shared_owners_;
      do
        v133 = __ldaxr(v132);
      while (__stlxr(v133 - 1, v132));
      if (!v133)
      {
        ((void (*)(std::__shared_weak_count *))v126->__on_zero_shared)(v126);
        std::__shared_weak_count::__release_weak(v126);
      }
    }
    v134 = v240;
    if (v240)
    {
      v135 = (unint64_t *)&v240->__shared_owners_;
      do
        v136 = __ldaxr(v135);
      while (__stlxr(v136 - 1, v135));
      if (!v136)
      {
        ((void (*)(std::__shared_weak_count *))v134->__on_zero_shared)(v134);
        std::__shared_weak_count::__release_weak(v134);
      }
    }
    v137 = v242;
    if (v242)
    {
      v138 = (unint64_t *)&v242->__shared_owners_;
      do
        v139 = __ldaxr(v138);
      while (__stlxr(v139 - 1, v138));
      if (!v139)
      {
        ((void (*)(std::__shared_weak_count *))v137->__on_zero_shared)(v137);
        std::__shared_weak_count::__release_weak(v137);
      }
    }
  }
  if (v79)
  {
    v85 = (unint64_t *)&v79->__shared_owners_;
    do
      v86 = __ldaxr(v85);
    while (__stlxr(v86 - 1, v85));
    if (!v86)
    {
      ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
      std::__shared_weak_count::__release_weak(v79);
    }
  }
  v87 = (std::__shared_weak_count *)*((_QWORD *)&v244 + 1);
  if (*((_QWORD *)&v244 + 1))
  {
    v88 = (unint64_t *)(*((_QWORD *)&v244 + 1) + 8);
    do
      v89 = __ldaxr(v88);
    while (__stlxr(v89 - 1, v88));
    if (!v89)
    {
      ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
      std::__shared_weak_count::__release_weak(v87);
    }
  }
  v90 = v246;
  if (v246)
  {
    v91 = (unint64_t *)&v246->__shared_owners_;
    do
      v92 = __ldaxr(v91);
    while (__stlxr(v92 - 1, v91));
    if (!v92)
    {
      ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
      std::__shared_weak_count::__release_weak(v90);
    }
  }
  v93 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v94 = (unint64_t *)((char *)__p[1] + 8);
    do
      v95 = __ldaxr(v94);
    while (__stlxr(v95 - 1, v94));
    if (!v95)
    {
      ((void (*)(std::__shared_weak_count *))v93->__on_zero_shared)(v93);
      std::__shared_weak_count::__release_weak(v93);
    }
  }
  *(_QWORD *)(v15 + 208) = v69;
  v96 = operator new();
  v97 = *(_QWORD *)(v15 + 32);
  *(_QWORD *)v96 = v15;
  *(_QWORD *)(v96 + 8) = v97;
  *(_OWORD *)(v96 + 16) = 0u;
  *(_OWORD *)(v96 + 32) = 0u;
  *(_QWORD *)(v15 + 216) = v96;
  v98 = operator new();
  v99 = *(_QWORD **)(v15 + 32);
  *(_QWORD *)v98 = v15;
  *(_QWORD *)(v98 + 8) = v99;
  *(_OWORD *)(v98 + 16) = 0u;
  *(_OWORD *)(v98 + 32) = 0u;
  *(_BYTE *)(v98 + 48) = 0;
  *(_QWORD *)(v98 + 60) = 0;
  *(_QWORD *)(v98 + 52) = 0;
  *(_DWORD *)(v98 + 68) = 0;
  v100 = (std::__shared_weak_count *)v99[24];
  v233 = v99[23];
  if (v100)
  {
    v101 = (unint64_t *)&v100->__shared_owners_;
    do
      v102 = __ldxr(v101);
    while (__stxr(v102 + 1, v101));
  }
  v234 = v100;
  v103 = (std::__shared_weak_count *)operator new(0xE8uLL);
  v103->__shared_owners_ = 0;
  v104 = (unint64_t *)&v103->__shared_owners_;
  v103->__shared_weak_owners_ = 0;
  v103->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E1718;
  v228 = &v103[1].__vftable;
  ggl::BufferData::BufferData((uint64_t)&v103[1], qword_1EE56BBB0, 2, 1, 6, 1);
  v103[9].__shared_owners_ = (uint64_t)ggl::FlyoverManeuver::Displacement::reflection(void)::reflection;
  v103[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B90F0;
  v232 = v103;
  v105 = (std::__shared_weak_count *)operator new(0xE8uLL);
  v105->__shared_owners_ = 0;
  v106 = (unint64_t *)&v105->__shared_owners_;
  v105->__shared_weak_owners_ = 0;
  v105->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E1750;
  v227 = v105 + 1;
  ggl::BufferData::BufferData((uint64_t)&v105[1], qword_1EE56BBF0, 2, 1, 6, 1);
  v105[9].__shared_owners_ = (uint64_t)ggl::FlyoverManeuver::Style::reflection(void)::reflection;
  v105[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B9110;
  v107 = (std::__shared_weak_count *)v99[12];
  v226 = v99[11];
  if (v107)
  {
    v108 = (unint64_t *)&v107->__shared_owners_;
    do
      v109 = __ldxr(v108);
    while (__stxr(v109 + 1, v108));
  }
  v110 = operator new();
  v111 = v99[33];
  if (!v111)
  {
    v140 = (char *)operator new(0x58uLL);
    *((_QWORD *)v140 + 1) = 0;
    *((_QWORD *)v140 + 2) = 0;
    *(_QWORD *)v140 = &off_1E42DED18;
    *((_QWORD *)v140 + 5) = 0;
    *((_QWORD *)v140 + 6) = 0;
    *((_QWORD *)v140 + 4) = 0;
    *((_DWORD *)v140 + 14) = 0;
    *((_QWORD *)v140 + 3) = &off_1E42B63B0;
    *(_OWORD *)(v140 + 60) = xmmword_19FFB2E60;
    *(_QWORD *)(v140 + 76) = 0x100000001;
    *((_DWORD *)v140 + 21) = 0;
    v245 = v140 + 24;
    v246 = (std::__shared_weak_count *)v140;
    v141 = *(_QWORD *)(v99[5] + 136);
    HIBYTE(__p[2]) = 17;
    strcpy((char *)__p, "/images/arrow.png");
    altitude::util::loadTextureFromBundle(&v244, *(_QWORD *)(v141 + 80), (uint64_t)__p, 1, &v245);
    v142 = v99 + 33;
    v143 = v244;
    v244 = 0uLL;
    v144 = (std::__shared_weak_count *)v99[34];
    *(_OWORD *)(v99 + 33) = v143;
    if (!v144)
      goto LABEL_136;
    v145 = (unint64_t *)&v144->__shared_owners_;
    do
      v146 = __ldaxr(v145);
    while (__stlxr(v146 - 1, v145));
    if (!v146)
    {
      ((void (*)(std::__shared_weak_count *))v144->__on_zero_shared)(v144);
      std::__shared_weak_count::__release_weak(v144);
      v147 = (std::__shared_weak_count *)*((_QWORD *)&v244 + 1);
      if (!*((_QWORD *)&v244 + 1))
        goto LABEL_140;
    }
    else
    {
LABEL_136:
      v147 = (std::__shared_weak_count *)*((_QWORD *)&v244 + 1);
      if (!*((_QWORD *)&v244 + 1))
        goto LABEL_140;
    }
    v148 = (unint64_t *)&v147->__shared_owners_;
    do
      v149 = __ldaxr(v148);
    while (__stlxr(v149 - 1, v148));
    if (!v149)
    {
      ((void (*)(std::__shared_weak_count *))v147->__on_zero_shared)(v147);
      std::__shared_weak_count::__release_weak(v147);
      if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
        goto LABEL_142;
      goto LABEL_141;
    }
LABEL_140:
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
    {
LABEL_142:
      v150 = v246;
      if (!v246)
        goto LABEL_146;
      v151 = (unint64_t *)&v246->__shared_owners_;
      do
        v152 = __ldaxr(v151);
      while (__stlxr(v152 - 1, v151));
      if (!v152)
      {
        ((void (*)(std::__shared_weak_count *))v150->__on_zero_shared)(v150);
        std::__shared_weak_count::__release_weak(v150);
        v111 = *v142;
        if (v107)
          goto LABEL_100;
      }
      else
      {
LABEL_146:
        v111 = *v142;
        if (v107)
          goto LABEL_100;
      }
LABEL_147:
      ggl::PipelineSetup::PipelineSetup((_QWORD *)v110, v226, (uint64_t)v107);
      goto LABEL_148;
    }
LABEL_141:
    operator delete(__p[0]);
    goto LABEL_142;
  }
  if (!v107)
    goto LABEL_147;
LABEL_100:
  v112 = (unint64_t *)&v107->__shared_owners_;
  do
    v113 = __ldxr(v112);
  while (__stxr(v113 + 1, v112));
  ggl::PipelineSetup::PipelineSetup((_QWORD *)v110, v226, (uint64_t)v107);
  v114 = (unint64_t *)&v107->__shared_owners_;
  do
    v115 = __ldaxr(v114);
  while (__stlxr(v115 - 1, v114));
  if (!v115)
  {
    ((void (*)(std::__shared_weak_count *))v107->__on_zero_shared)(v107);
    std::__shared_weak_count::__release_weak(v107);
  }
LABEL_148:
  *(_QWORD *)v110 = &off_1E42B70D8;
  v153 = *(_QWORD **)(v110 + 64);
  *v153 = v233;
  v153[1] = 0;
  v154 = *(_QWORD **)(v110 + 160);
  if (v234)
  {
    v155 = (unint64_t *)&v234->__shared_owners_;
    do
      v156 = __ldxr(v155);
    while (__stxr(v156 + 1, v155));
  }
  v157 = (std::__shared_weak_count *)v154[1];
  *v154 = v233;
  v154[1] = v234;
  if (v157)
  {
    v158 = (unint64_t *)&v157->__shared_owners_;
    do
      v159 = __ldaxr(v158);
    while (__stlxr(v159 - 1, v158));
    if (!v159)
    {
      ((void (*)(std::__shared_weak_count *))v157->__on_zero_shared)(v157);
      std::__shared_weak_count::__release_weak(v157);
    }
  }
  v160 = *(_QWORD *)(v110 + 64);
  *(_QWORD *)(v160 + 16) = v228;
  *(_QWORD *)(v160 + 24) = 0;
  v161 = *(_QWORD *)(v110 + 160);
  do
    v162 = __ldxr(v104);
  while (__stxr(v162 + 1, v104));
  v163 = *(std::__shared_weak_count **)(v161 + 24);
  *(_QWORD *)(v161 + 16) = v228;
  *(_QWORD *)(v161 + 24) = v232;
  if (v163)
  {
    v164 = (unint64_t *)&v163->__shared_owners_;
    do
      v165 = __ldaxr(v164);
    while (__stlxr(v165 - 1, v164));
    if (!v165)
    {
      ((void (*)(std::__shared_weak_count *))v163->__on_zero_shared)(v163);
      std::__shared_weak_count::__release_weak(v163);
    }
  }
  v166 = *(_QWORD *)(v110 + 64);
  *(_QWORD *)(v166 + 32) = v227;
  *(_QWORD *)(v166 + 40) = 0;
  v167 = *(_QWORD *)(v110 + 160);
  do
    v168 = __ldxr(v106);
  while (__stxr(v168 + 1, v106));
  v169 = *(std::__shared_weak_count **)(v167 + 40);
  *(_QWORD *)(v167 + 32) = v227;
  *(_QWORD *)(v167 + 40) = v105;
  if (v169)
  {
    v170 = (unint64_t *)&v169->__shared_owners_;
    do
      v171 = __ldaxr(v170);
    while (__stlxr(v171 - 1, v170));
    if (!v171)
    {
      ((void (*)(std::__shared_weak_count *))v169->__on_zero_shared)(v169);
      std::__shared_weak_count::__release_weak(v169);
    }
  }
  **(_QWORD **)(v110 + 96) = v111;
  v172 = *(_QWORD *)(v98 + 56);
  *(_QWORD *)(v98 + 56) = v110;
  if (v172)
    (*(void (**)(uint64_t))(*(_QWORD *)v172 + 8))(v172);
  *(_QWORD *)(v98 + 64) = v99[18];
  if (v107)
  {
    v173 = (unint64_t *)&v107->__shared_owners_;
    do
      v174 = __ldaxr(v173);
    while (__stlxr(v174 - 1, v173));
    if (!v174)
    {
      ((void (*)(std::__shared_weak_count *))v107->__on_zero_shared)(v107);
      std::__shared_weak_count::__release_weak(v107);
    }
  }
  do
    v175 = __ldaxr(v106);
  while (__stlxr(v175 - 1, v106));
  if (!v175)
  {
    ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
    std::__shared_weak_count::__release_weak(v105);
  }
  do
    v176 = __ldaxr(v104);
  while (__stlxr(v176 - 1, v104));
  if (!v176)
  {
    ((void (*)(std::__shared_weak_count *))v232->__on_zero_shared)(v232);
    std::__shared_weak_count::__release_weak(v232);
  }
  if (v234)
  {
    v177 = (unint64_t *)&v234->__shared_owners_;
    do
      v178 = __ldaxr(v177);
    while (__stlxr(v178 - 1, v177));
    if (!v178)
    {
      ((void (*)(std::__shared_weak_count *))v234->__on_zero_shared)(v234);
      std::__shared_weak_count::__release_weak(v234);
    }
  }
  *(_QWORD *)(v15 + 200) = v98;
  __p[0] = v235;
  __p[1] = v236;
  if (v236)
  {
    v179 = (unint64_t *)&v236->__shared_owners_;
    do
      v180 = __ldxr(v179);
    while (__stxr(v180 + 1, v179));
  }
  __p[2] = (void *)v15;
  v182 = (_QWORD *)v229[38];
  v181 = v229[39];
  if ((unint64_t)v182 >= v181)
  {
    v183 = v229[37];
    v184 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v182 - v183) >> 3);
    v185 = v184 + 1;
    if (v184 + 1 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v186 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v181 - v183) >> 3);
    if (2 * v186 > v185)
      v185 = 2 * v186;
    if (v186 >= 0x555555555555555)
      v187 = 0xAAAAAAAAAAAAAAALL;
    else
      v187 = v185;
    if (v187 > 0xAAAAAAAAAAAAAAALL)
LABEL_260:
      std::__throw_bad_array_new_length[abi:nn180100]();
    v188 = (char *)operator new(24 * v187);
    v189 = &v188[24 * v184];
    v190 = &v188[24 * v187];
    *(_OWORD *)v189 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    *((_QWORD *)v189 + 2) = v15;
    v191 = v189 + 24;
    v192 = (_QWORD *)v229[37];
    v193 = (_QWORD *)v229[38];
    if (v193 == v192)
    {
      v229[37] = v189;
      v229[38] = v191;
      v229[39] = v190;
    }
    else
    {
      do
      {
        v194 = *(_OWORD *)(v193 - 3);
        v193 -= 3;
        *(_OWORD *)(v189 - 24) = v194;
        v189 -= 24;
        *v193 = 0;
        v193[1] = 0;
        *((_QWORD *)v189 + 2) = v193[2];
      }
      while (v193 != v192);
      v193 = (_QWORD *)v229[37];
      v195 = (_QWORD *)v229[38];
      v229[37] = v189;
      v229[38] = v191;
      v229[39] = v190;
      while (v195 != v193)
      {
        v196 = (std::__shared_weak_count *)*(v195 - 2);
        if (v196)
        {
          v197 = (unint64_t *)&v196->__shared_owners_;
          do
            v198 = __ldaxr(v197);
          while (__stlxr(v198 - 1, v197));
          if (!v198)
          {
            ((void (*)(std::__shared_weak_count *))v196->__on_zero_shared)(v196);
            std::__shared_weak_count::__release_weak(v196);
          }
        }
        v195 -= 3;
      }
    }
    if (v193)
      operator delete(v193);
    v199 = (std::__shared_weak_count *)__p[1];
    v229[38] = v191;
    if (v199)
    {
      v200 = (unint64_t *)&v199->__shared_owners_;
      do
        v201 = __ldaxr(v200);
      while (__stlxr(v201 - 1, v200));
      if (!v201)
      {
        ((void (*)(std::__shared_weak_count *))v199->__on_zero_shared)(v199);
        std::__shared_weak_count::__release_weak(v199);
      }
    }
  }
  else
  {
    *v182 = v235;
    v182[1] = v236;
    v182[2] = v15;
    v229[38] = v182 + 3;
  }
  v202 = **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(v229[5] + 128) + 856) + 88);
  if (v202)
  {
    LOBYTE(__p[0]) = 7;
    md::MapEngine::setNeedsTick(v202, __p);
  }
  if (v236)
  {
    v203 = (unint64_t *)&v236->__shared_owners_;
    do
      v204 = __ldaxr(v203);
    while (__stlxr(v204 - 1, v203));
    if (!v204)
    {
      ((void (*)(std::__shared_weak_count *))v236->__on_zero_shared)(v236);
      std::__shared_weak_count::__release_weak(v236);
    }
  }
  p_pair1 = &v231->_polylinesToRoutes.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *)v231->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v207 = v230[1];
    while (1)
    {
      while (1)
      {
        v208 = left;
        v209 = left[5].__value_.__left_;
        if (v207 >= v209)
          break;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *)v208->__value_.__left_;
        p_pair1 = v208;
        if (!v208->__value_.__left_)
          goto LABEL_233;
      }
      if (v209 >= v207)
        break;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *)v208[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v208 + 1;
        goto LABEL_233;
      }
    }
    v210 = (uint64_t *)v208;
    v214 = v237;
    v213 = v238;
    if (v238)
    {
LABEL_238:
      p_shared_weak_owners = (unint64_t *)&v213->__shared_weak_owners_;
      do
        v216 = __ldxr(p_shared_weak_owners);
      while (__stxr(v216 + 1, p_shared_weak_owners));
    }
  }
  else
  {
    v208 = &v231->_polylinesToRoutes.__tree_.__pair1_;
LABEL_233:
    v210 = (uint64_t *)operator new(0x48uLL);
    v210[4] = (uint64_t)&off_1E42B4CF0;
    v210[5] = 0;
    v210[5] = (uint64_t)v230[1];
    v210[7] = 0;
    v210[8] = 0;
    *v210 = 0;
    v210[1] = 0;
    v210[2] = (uint64_t)v208;
    p_pair1->__value_.__left_ = v210;
    v211 = *(void **)v231->_polylinesToRoutes.__tree_.__begin_node_;
    v212 = v210;
    if (v211)
    {
      v231->_polylinesToRoutes.__tree_.__begin_node_ = v211;
      v212 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)v231->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_, v212);
    ++v231->_polylinesToRoutes.__tree_.__pair3_.__value_;
    v214 = v237;
    v213 = v238;
    if (v238)
      goto LABEL_238;
  }
  v217 = (std::__shared_weak_count *)v210[8];
  v210[7] = v214;
  v210[8] = (uint64_t)v213;
  if (v217)
    std::__shared_weak_count::__release_weak(v217);
  *(_BYTE *)(v214 + 64) = geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(v230[1], (uint64_t)&v231->_selectedPolyline);
  WeakRetained = objc_loadWeakRetained((id *)&v231->_delegate);
  objc_msgSend(WeakRetained, "lineContainerNeedsDisplay:", v231);

  if (v213)
  {
    v219 = (unint64_t *)&v213->__shared_owners_;
    do
      v220 = __ldaxr(v219);
    while (__stlxr(v220 - 1, v219));
    if (!v220)
    {
      ((void (*)(std::__shared_weak_count *))v213->__on_zero_shared)(v213);
      std::__shared_weak_count::__release_weak(v213);
    }
  }
}

- (void)removeLine:(_retain_ptr<VKPolylineOverlay *)
{
  VKGlobeLineContainer *left;
  void *v5;
  VKGlobeLineContainer *p_pair1;
  void *v7;
  BOOL v8;
  VKGlobeLineContainer **p_routeLineSplitAnnotation;
  _QWORD *routeRenderLayer;
  std::__shared_weak_count *v11;
  std::__shared_weak_count *v12;
  uint64_t begin_node;
  unint64_t *p_shared_owners;
  unint64_t v15;
  VKRouteMatchedAnnotationPresentation *routeLineSplitAnnotation;
  VKGlobeLineContainer **skippedRouteLineSplitAnnotation;
  VKGlobeLineContainer *v18;
  BOOL v19;
  uint64_t *v20;
  std::__shared_weak_count *v21;
  id WeakRetained;

  left = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v5 = (void *)*((_QWORD *)a3._vptr$_retain_ptr + 1);
    p_pair1 = (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_;
    do
    {
      v7 = left->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
      v8 = v7 >= v5;
      if (v7 >= v5)
        p_routeLineSplitAnnotation = (VKGlobeLineContainer **)left;
      else
        p_routeLineSplitAnnotation = (VKGlobeLineContainer **)&left->_routeLineSplitAnnotation;
      if (v8)
        p_pair1 = left;
      left = *p_routeLineSplitAnnotation;
    }
    while (*p_routeLineSplitAnnotation);
    if (p_pair1 != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_
      && v5 >= p_pair1->_retainedOverlays.__tree_.__pair1_.__value_.__left_)
    {
      routeRenderLayer = self->_routeRenderLayer;
      v11 = (std::__shared_weak_count *)p_pair1->_overlays.__tree_.__pair1_.__value_.__left_;
      if (v11)
      {
        v12 = std::__shared_weak_count::lock(v11);
        if (v12)
        {
          begin_node = (uint64_t)p_pair1->_overlays.__tree_.__begin_node_;
          goto LABEL_17;
        }
      }
      else
      {
        v12 = 0;
      }
      begin_node = 0;
LABEL_17:
      md::realistic::RouteRenderLayer::removeRouteData(routeRenderLayer, begin_node);
      if (v12)
      {
        p_shared_owners = (unint64_t *)&v12->__shared_owners_;
        do
          v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
      routeLineSplitAnnotation = p_pair1->_routeLineSplitAnnotation;
      if (routeLineSplitAnnotation)
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)routeLineSplitAnnotation;
          routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
        }
        while (routeLineSplitAnnotation);
      }
      else
      {
        v18 = p_pair1;
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)v18->_skippedRouteLineSplitAnnotation;
          v19 = *skippedRouteLineSplitAnnotation == v18;
          v18 = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
        }
        while (!v19);
      }
      if (self->_polylinesToRoutes.__tree_.__begin_node_ == p_pair1)
        self->_polylinesToRoutes.__tree_.__begin_node_ = skippedRouteLineSplitAnnotation;
      v20 = (uint64_t *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_;
      --self->_polylinesToRoutes.__tree_.__pair3_.__value_;
      std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v20, (uint64_t *)p_pair1);
      v21 = (std::__shared_weak_count *)p_pair1->_overlays.__tree_.__pair1_.__value_.__left_;
      if (v21)
        std::__shared_weak_count::__release_weak(v21);
      p_pair1->_retainedOverlays.__tree_.__begin_node_ = &off_1E42B4CF0;

      operator delete(p_pair1);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "lineContainerNeedsDisplay:", self);

}

- (void)clearLineSelection
{
  VKPolylineOverlay *obj;
  VKGlobeLineContainer *begin_node;
  id v5;
  void *v6;
  std::__shared_weak_count *left;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  id v10;
  VKRouteMatchedAnnotationPresentation *routeLineSplitAnnotation;
  VKGlobeLineContainer *skippedRouteLineSplitAnnotation;
  BOOL v13;
  id WeakRetained;
  uint64_t (**v15)();
  id v16;
  uint64_t (**v17)();
  id v18;
  void *v19;
  std::__shared_weak_count *v20;

  obj = self->_selectedPolyline._obj;
  self->_selectedPolyline._obj = 0;

  begin_node = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__begin_node_;
  if (begin_node != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
  {
    do
    {
      v17 = &off_1E42B4CF0;
      v5 = begin_node->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
      v6 = begin_node->_overlays.__tree_.__begin_node_;
      left = (std::__shared_weak_count *)begin_node->_overlays.__tree_.__pair1_.__value_.__left_;
      v18 = v5;
      v19 = v6;
      v20 = left;
      if (left)
      {
        p_shared_weak_owners = (unint64_t *)&left->__shared_weak_owners_;
        do
          v9 = __ldxr(p_shared_weak_owners);
        while (__stxr(v9 + 1, p_shared_weak_owners));
      }
      v15 = &off_1E42B4CF0;
      v10 = v5;
      v16 = v10;
      -[VKGlobeLineContainer setSelected:selected:](self, "setSelected:selected:", &v15, 0);
      v15 = &off_1E42B4CF0;

      if (left)
        std::__shared_weak_count::__release_weak(left);

      routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
      if (routeLineSplitAnnotation)
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)routeLineSplitAnnotation;
          routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
        }
        while (routeLineSplitAnnotation);
      }
      else
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)begin_node->_skippedRouteLineSplitAnnotation;
          v13 = skippedRouteLineSplitAnnotation->super.isa == (Class)begin_node;
          begin_node = skippedRouteLineSplitAnnotation;
        }
        while (!v13);
      }
      begin_node = skippedRouteLineSplitAnnotation;
    }
    while (skippedRouteLineSplitAnnotation != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "lineContainerNeedsDisplay:", self);

}

- (void)clearLineSkip
{
  VKPolylineOverlay *obj;
  VKGlobeLineContainer *begin_node;
  id v5;
  void *v6;
  std::__shared_weak_count *left;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  id v10;
  VKRouteMatchedAnnotationPresentation *routeLineSplitAnnotation;
  VKGlobeLineContainer *skippedRouteLineSplitAnnotation;
  BOOL v13;
  id WeakRetained;
  uint64_t (**v15)();
  id v16;
  uint64_t (**v17)();
  id v18;
  void *v19;
  std::__shared_weak_count *v20;

  obj = self->_skippedPolyline._obj;
  self->_skippedPolyline._obj = 0;

  begin_node = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__begin_node_;
  if (begin_node != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
  {
    do
    {
      v17 = &off_1E42B4CF0;
      v5 = begin_node->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
      v6 = begin_node->_overlays.__tree_.__begin_node_;
      left = (std::__shared_weak_count *)begin_node->_overlays.__tree_.__pair1_.__value_.__left_;
      v18 = v5;
      v19 = v6;
      v20 = left;
      if (left)
      {
        p_shared_weak_owners = (unint64_t *)&left->__shared_weak_owners_;
        do
          v9 = __ldxr(p_shared_weak_owners);
        while (__stxr(v9 + 1, p_shared_weak_owners));
      }
      v15 = &off_1E42B4CF0;
      v10 = v5;
      v16 = v10;
      -[VKGlobeLineContainer setSkipped:skipped:](self, "setSkipped:skipped:", &v15, 0);
      v15 = &off_1E42B4CF0;

      if (left)
        std::__shared_weak_count::__release_weak(left);

      routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
      if (routeLineSplitAnnotation)
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)routeLineSplitAnnotation;
          routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
        }
        while (routeLineSplitAnnotation);
      }
      else
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)begin_node->_skippedRouteLineSplitAnnotation;
          v13 = skippedRouteLineSplitAnnotation->super.isa == (Class)begin_node;
          begin_node = skippedRouteLineSplitAnnotation;
        }
        while (!v13);
      }
      begin_node = skippedRouteLineSplitAnnotation;
    }
    while (skippedRouteLineSplitAnnotation != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "lineContainerNeedsDisplay:", self);

}

- (void)setSelected:(_retain_ptr<VKPolylineOverlay *) selected:()geo:()geo:()geo:(geo:(BOOL)a4 :_equal_objc>)a3 :_hash_objc :_release_objc_arc :_retain_objc_arc
{
  int obj;
  void **v5;
  VKPolylineOverlay *v7;
  VKPolylineOverlay *v8;
  VKGlobeLineContainer *left;
  void *v10;
  VKGlobeLineContainer *p_pair1;
  void *v12;
  BOOL v13;
  VKGlobeLineContainer **p_routeLineSplitAnnotation;
  std::__shared_weak_count *v15;
  std::__shared_weak_count *v16;
  std::__shared_weak_count *v17;
  _BYTE *begin_node;
  unint64_t *p_shared_owners;
  unint64_t v20;
  id WeakRetained;
  void *v22;

  obj = (int)a3._obj;
  v5 = a3._vptr$_retain_ptr;
  v22 = 0;
  if ((geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(a3._vptr$_retain_ptr[1], &v22) & 1) == 0)
  {
    -[VKGlobeLineContainer _recreateLinesIfNeeded](self, "_recreateLinesIfNeeded");
    if (obj)
    {
      v7 = v5[1];
      v8 = self->_selectedPolyline._obj;
      self->_selectedPolyline._obj = v7;
    }
    else
    {
      v8 = self->_selectedPolyline._obj;
      self->_selectedPolyline._obj = 0;
    }

    left = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_;
    if (left)
    {
      v10 = v5[1];
      p_pair1 = (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_;
      do
      {
        v12 = left->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
        v13 = v12 >= v10;
        if (v12 >= v10)
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)left;
        else
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)&left->_routeLineSplitAnnotation;
        if (v13)
          p_pair1 = left;
        left = *p_routeLineSplitAnnotation;
      }
      while (*p_routeLineSplitAnnotation);
      if (p_pair1 != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_
        && v10 >= p_pair1->_retainedOverlays.__tree_.__pair1_.__value_.__left_)
      {
        v15 = (std::__shared_weak_count *)p_pair1->_overlays.__tree_.__pair1_.__value_.__left_;
        if (v15)
        {
          v16 = std::__shared_weak_count::lock(v15);
          if (v16)
          {
            v17 = v16;
            begin_node = p_pair1->_overlays.__tree_.__begin_node_;
            if (begin_node)
              begin_node[64] = obj;
            p_shared_owners = (unint64_t *)&v16->__shared_owners_;
            do
              v20 = __ldaxr(p_shared_owners);
            while (__stlxr(v20 - 1, p_shared_owners));
            if (!v20)
            {
              ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
              std::__shared_weak_count::__release_weak(v17);
            }
          }
        }
      }
    }
    -[VKGlobeLineContainer _updateRouteSplit](self, "_updateRouteSplit");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "lineContainerNeedsDisplay:", self);

  }
}

- (void)setSkipped:(_retain_ptr<VKPolylineOverlay *) skipped:()geo:()geo:()geo:(geo:(BOOL)a4 :_equal_objc>)a3 :_hash_objc :_release_objc_arc :_retain_objc_arc
{
  int obj;
  void **v5;
  VKPolylineOverlay *v7;
  VKPolylineOverlay *v8;
  VKPolylineOverlay *v9;
  VKGlobeLineContainer *left;
  void *v11;
  VKGlobeLineContainer *p_pair1;
  void *v13;
  BOOL v14;
  VKGlobeLineContainer **p_routeLineSplitAnnotation;
  std::__shared_weak_count *v16;
  std::__shared_weak_count *v17;
  std::__shared_weak_count *v18;
  _BYTE *begin_node;
  unint64_t *p_shared_owners;
  unint64_t v21;
  id WeakRetained;
  void *v23;

  obj = (int)a3._obj;
  v5 = a3._vptr$_retain_ptr;
  v23 = 0;
  if ((geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(a3._vptr$_retain_ptr[1], &v23) & 1) == 0)
  {
    -[VKGlobeLineContainer _recreateLinesIfNeeded](self, "_recreateLinesIfNeeded");
    v7 = self->_skippedPolyline._obj;
    self->_skippedPolyline._obj = 0;

    if (obj)
    {
      v8 = v5[1];
      v9 = self->_skippedPolyline._obj;
      self->_skippedPolyline._obj = v8;

    }
    left = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_;
    if (left)
    {
      v11 = v5[1];
      p_pair1 = (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_;
      do
      {
        v13 = left->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
        v14 = v13 >= v11;
        if (v13 >= v11)
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)left;
        else
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)&left->_routeLineSplitAnnotation;
        if (v14)
          p_pair1 = left;
        left = *p_routeLineSplitAnnotation;
      }
      while (*p_routeLineSplitAnnotation);
      if (p_pair1 != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_
        && v11 >= p_pair1->_retainedOverlays.__tree_.__pair1_.__value_.__left_)
      {
        v16 = (std::__shared_weak_count *)p_pair1->_overlays.__tree_.__pair1_.__value_.__left_;
        if (v16)
        {
          v17 = std::__shared_weak_count::lock(v16);
          if (v17)
          {
            v18 = v17;
            begin_node = p_pair1->_overlays.__tree_.__begin_node_;
            if (begin_node)
              begin_node[65] = obj;
            p_shared_owners = (unint64_t *)&v17->__shared_owners_;
            do
              v21 = __ldaxr(p_shared_owners);
            while (__stlxr(v21 - 1, p_shared_owners));
            if (!v21)
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v18);
            }
          }
        }
      }
    }
    -[VKGlobeLineContainer _updateSkippedRouteSplit](self, "_updateSkippedRouteSplit");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "lineContainerNeedsDisplay:", self);

  }
}

- (void)setRouteLineSplitAnnotation:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  objc_storeStrong((id *)&self->_routeLineSplitAnnotation, a3);
  objc_storeWeak(&self->_routeSplit->var1, obj);
  -[VKGlobeLineContainer _updateRouteSplit](self, "_updateRouteSplit");
  if (self->_routeLineSplitAnnotation)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "lineContainerNeedsDisplay:", self);

  }
}

- (void)setSkippedRouteLineSplitAnnotation:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  objc_storeStrong((id *)&self->_skippedRouteLineSplitAnnotation, a3);
  objc_storeWeak(&self->_skippedRouteSplit->var1, obj);
  -[VKGlobeLineContainer _updateSkippedRouteSplit](self, "_updateSkippedRouteSplit");
  if (self->_skippedRouteLineSplitAnnotation)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "lineContainerNeedsDisplay:", self);

  }
}

- (VKRouteMatchedAnnotationPresentation)routeLineSplitAnnotation
{
  return self->_routeLineSplitAnnotation;
}

- (void)_updateRouteSplit
{
  VKGlobeLineContainer *begin_node;
  std::__shared_weak_count *left;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  _QWORD *v7;
  VKGlobeRouteSplit *routeSplit;
  unint64_t *p_shared_owners;
  unint64_t v10;
  VKRouteMatchedAnnotationPresentation *routeLineSplitAnnotation;
  VKGlobeLineContainer *skippedRouteLineSplitAnnotation;
  BOOL v13;

  -[VKGlobeLineContainer _recreateLinesIfNeeded](self, "_recreateLinesIfNeeded");
  begin_node = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__begin_node_;
  if (begin_node != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
  {
    do
    {
      left = (std::__shared_weak_count *)begin_node->_overlays.__tree_.__pair1_.__value_.__left_;
      if (!left)
        goto LABEL_14;
      v5 = std::__shared_weak_count::lock(left);
      if (!v5)
        goto LABEL_14;
      v6 = v5;
      v7 = begin_node->_overlays.__tree_.__begin_node_;
      if (v7)
      {
        if (geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(begin_node->_retainedOverlays.__tree_.__pair1_.__value_.__left_, (uint64_t)&self->_selectedPolyline))routeSplit = self->_routeSplit;
        else
          routeSplit = 0;
        v7[9] = routeSplit;
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
        routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
        if (!routeLineSplitAnnotation)
        {
          do
          {
LABEL_18:
            skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)begin_node->_skippedRouteLineSplitAnnotation;
            v13 = skippedRouteLineSplitAnnotation->super.isa == (Class)begin_node;
            begin_node = skippedRouteLineSplitAnnotation;
          }
          while (!v13);
          goto LABEL_3;
        }
      }
      else
      {
LABEL_14:
        routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
        if (!routeLineSplitAnnotation)
          goto LABEL_18;
      }
      do
      {
        skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)routeLineSplitAnnotation;
        routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
      }
      while (routeLineSplitAnnotation);
LABEL_3:
      begin_node = skippedRouteLineSplitAnnotation;
    }
    while (skippedRouteLineSplitAnnotation != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_);
  }
}

- (void)_updateSkippedRouteSplit
{
  VKGlobeLineContainer *begin_node;
  std::__shared_weak_count *left;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  _QWORD *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  VKRouteMatchedAnnotationPresentation *routeLineSplitAnnotation;
  VKGlobeLineContainer *skippedRouteLineSplitAnnotation;
  BOOL v12;

  -[VKGlobeLineContainer _recreateLinesIfNeeded](self, "_recreateLinesIfNeeded");
  begin_node = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__begin_node_;
  if (begin_node != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
  {
    do
    {
      left = (std::__shared_weak_count *)begin_node->_overlays.__tree_.__pair1_.__value_.__left_;
      if (!left)
        goto LABEL_12;
      v5 = std::__shared_weak_count::lock(left);
      if (!v5)
        goto LABEL_12;
      v6 = v5;
      v7 = begin_node->_overlays.__tree_.__begin_node_;
      if (v7
        && geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(begin_node->_retainedOverlays.__tree_.__pair1_.__value_.__left_, (uint64_t)&self->_skippedPolyline))
      {
        v7[9] = self->_skippedRouteSplit;
      }
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
        routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
        if (!routeLineSplitAnnotation)
        {
          do
          {
LABEL_16:
            skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)begin_node->_skippedRouteLineSplitAnnotation;
            v12 = skippedRouteLineSplitAnnotation->super.isa == (Class)begin_node;
            begin_node = skippedRouteLineSplitAnnotation;
          }
          while (!v12);
          goto LABEL_3;
        }
      }
      else
      {
LABEL_12:
        routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
        if (!routeLineSplitAnnotation)
          goto LABEL_16;
      }
      do
      {
        skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)routeLineSplitAnnotation;
        routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
      }
      while (routeLineSplitAnnotation);
LABEL_3:
      begin_node = skippedRouteLineSplitAnnotation;
    }
    while (skippedRouteLineSplitAnnotation != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_);
  }
}

- (void)_recreateLinesIfNeeded
{
  VKGlobeLineContainer *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *v14;
  unint64_t v15;
  BOOL v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> **v17;
  id *v18;
  std::__shared_weak_count *v19;
  std::__shared_weak_count *v20;
  std::__shared_weak_count *v21;
  void *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  uint64_t v25;
  VKRouteMatchedAnnotationPresentation *routeLineSplitAnnotation;
  VKRouteMatchedAnnotationPresentation *skippedRouteLineSplitAnnotation;
  BOOL v28;
  id v29;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *p_pair1;
  void *v31;
  id obj;
  uint64_t (**v33)();
  id v34;
  uint64_t (**v35)();
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  begin_node = (VKGlobeLineContainer *)self->_overlays.__tree_.__begin_node_;
  p_pair1 = &self->_overlays.__tree_.__pair1_;
  if (begin_node == (VKGlobeLineContainer *)&self->_overlays.__tree_.__pair1_)
    return;
  v4 = &self->_polylinesToRoutes.__tree_.__pair1_;
  while (2)
  {
    v5 = begin_node->_retainedOverlays.__tree_.__begin_node_;
    objc_opt_class();
    v31 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_36;
    v6 = v5;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v29 = v6;
    objc_msgSend(v6, "polylines");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (!v8)
      goto LABEL_35;
    v9 = *(_QWORD *)v38;
    obj = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(obj);
        v11 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * v10);
        v12 = v11;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *)v4->__value_.__left_;
        if (!v4->__value_.__left_)
          goto LABEL_21;
        v14 = v4;
        do
        {
          v15 = (unint64_t)left[5].__value_.__left_;
          v16 = v15 >= (unint64_t)v11;
          if (v15 >= (unint64_t)v11)
            v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> **)left;
          else
            v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> **)&left[1];
          if (v16)
            v14 = left;
          left = *v17;
        }
        while (*v17);
        if (v14 == v4 || v11 < v14[5].__value_.__left_)
        {
LABEL_21:
          v35 = &off_1E42B4CF0;
          v36 = v11;
          -[VKGlobeLineContainer addLine:](self, "addLine:", &v35);
          v35 = &off_1E42B4CF0;
          v18 = &v36;
LABEL_22:

          goto LABEL_23;
        }
        v19 = (std::__shared_weak_count *)v14[8].__value_.__left_;
        if (!v19 || (v20 = std::__shared_weak_count::lock(v19)) == 0)
        {
LABEL_33:
          v33 = &off_1E42B4CF0;
          v34 = v12;
          -[VKGlobeLineContainer addLine:](self, "addLine:", &v33);
          v33 = &off_1E42B4CF0;
          v18 = &v34;
          goto LABEL_22;
        }
        v21 = v20;
        v22 = v14[7].__value_.__left_;
        p_shared_owners = (unint64_t *)&v20->__shared_owners_;
        do
          v24 = __ldaxr(p_shared_owners);
        while (__stlxr(v24 - 1, p_shared_owners));
        if (v24)
        {
          if (!v22)
            goto LABEL_33;
        }
        else
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v21);
          if (!v22)
            goto LABEL_33;
        }
LABEL_23:

        ++v10;
      }
      while (v10 != v8);
      v7 = obj;
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      v8 = v25;
    }
    while (v25);
LABEL_35:

LABEL_36:
    routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
    if (routeLineSplitAnnotation)
    {
      do
      {
        skippedRouteLineSplitAnnotation = routeLineSplitAnnotation;
        routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
      }
      while (routeLineSplitAnnotation);
    }
    else
    {
      do
      {
        skippedRouteLineSplitAnnotation = begin_node->_skippedRouteLineSplitAnnotation;
        v28 = *(_QWORD *)skippedRouteLineSplitAnnotation == (_QWORD)begin_node;
        begin_node = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
      }
      while (!v28);
    }
    begin_node = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
    if (skippedRouteLineSplitAnnotation != (VKRouteMatchedAnnotationPresentation *)p_pair1)
      continue;
    break;
  }
}

- (void)_destroyLinesIfNeeded
{
  VKGlobeLineContainer *begin_node;
  char *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  int64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *v34;
  VKRouteMatchedAnnotationPresentation *routeLineSplitAnnotation;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *left;
  BOOL v37;
  VKGlobeLineContainer *v38;
  id v39;
  std::__shared_weak_count *v40;
  unint64_t *p_shared_weak_owners;
  unint64_t v42;
  id *v43;
  VKRouteMatchedAnnotationPresentation *v44;
  VKGlobeLineContainer *skippedRouteLineSplitAnnotation;
  void **v46;
  id v47;
  void *v48;
  void **v49;
  void **v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  char *v55;
  id v56;
  void *v57;
  char *v58;
  void **v59;
  void *v60;
  void *v61;
  void **v62;
  void **v63;
  void **v64;
  void (**v65)(void **);
  void **v66;
  void **v67;
  void **v68;
  id v69;
  void *v70;
  id v71;
  void **v72;
  void **v73;
  void (**v74)(void **);
  char *v75;
  char *j;
  void *v77;
  id v78;
  id v79;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *p_pair1;
  VKGlobeLineContainer *v82;
  id obj;
  uint64_t v84;
  uint64_t (**v85)();
  id v86;
  uint64_t (**v87)();
  id v88;
  void *v89;
  std::__shared_weak_count *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  void **v95;
  void **v96;
  unint64_t v97;
  void *__p;
  char *v99;
  unint64_t v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  __p = 0;
  v99 = 0;
  v100 = 0;
  v95 = 0;
  v96 = 0;
  v97 = 0;
  begin_node = (VKGlobeLineContainer *)self->_overlays.__tree_.__begin_node_;
  p_pair1 = &self->_overlays.__tree_.__pair1_;
  if (begin_node == (VKGlobeLineContainer *)&self->_overlays.__tree_.__pair1_)
  {
    v3 = 0;
    goto LABEL_56;
  }
  v3 = 0;
  while (2)
  {
    v4 = begin_node->_retainedOverlays.__tree_.__begin_node_;
    objc_opt_class();
    v82 = begin_node;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_49;
    v5 = v4;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v79 = v5;
    objc_msgSend(v5, "polylines");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    v78 = v4;
    if (!v6)
    {
      v7 = obj;
      goto LABEL_48;
    }
    v84 = *(_QWORD *)v92;
    v7 = obj;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v92 != v84)
          objc_enumerationMutation(v7);
        v9 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
        if ((unint64_t)v3 < v100)
        {
          *(_QWORD *)v3 = v9;
          v3 += 8;
          goto LABEL_9;
        }
        v10 = (char *)__p;
        v11 = v3 - (_BYTE *)__p;
        v12 = (v3 - (_BYTE *)__p) >> 3;
        v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 61)
          abort();
        v14 = v100 - (_QWORD)__p;
        if ((uint64_t)(v100 - (_QWORD)__p) >> 2 > v13)
          v13 = v14 >> 2;
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
          v15 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v15 = v13;
        if (v15)
        {
          if (v15 >> 61)
LABEL_120:
            std::__throw_bad_array_new_length[abi:nn180100]();
          v16 = (char *)operator new(8 * v15);
        }
        else
        {
          v16 = 0;
        }
        v17 = &v16[8 * v12];
        v18 = &v16[8 * v15];
        *(_QWORD *)v17 = v9;
        v19 = v17 + 8;
        v20 = v3 - v10;
        if (v3 == v10)
        {
          __p = &v16[8 * v12];
          v99 = v17 + 8;
          v100 = (unint64_t)v18;
          v7 = obj;
          goto LABEL_32;
        }
        v21 = v20 - 8;
        if ((unint64_t)(v20 - 8) <= 0x137
          || (v26 = v21 & 0xFFFFFFFFFFFFFFF8, &v3[-(v21 & 0xFFFFFFFFFFFFFFF8) - 8] > v3 - 8)
          || &v16[v11 - 8 - v26] > &v16[v11 - 8]
          || (v27 = v21 >> 3, &v3[-8 * v27 - 8] < v17) && &v16[v11 - v26 - 8] < v3)
        {
          v22 = v3;
        }
        else
        {
          v28 = v27 + 1;
          v22 = &v3[-8 * (v28 & 0x3FFFFFFFFFFFFFFCLL)];
          v29 = &v16[8 * v12 - 16];
          v30 = v3 - 32;
          v31 = v28 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v33 = *(_OWORD *)v30;
            v32 = *((_OWORD *)v30 + 1);
            *(_OWORD *)v30 = 0uLL;
            *((_OWORD *)v30 + 1) = 0uLL;
            v30 -= 32;
            *((_OWORD *)v29 - 1) = v33;
            *(_OWORD *)v29 = v32;
            v29 -= 32;
            v31 -= 4;
          }
          while (v31);
          v17 -= 8 * (v28 & 0x3FFFFFFFFFFFFFFCLL);
          if (v28 == (v28 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_27;
        }
        do
        {
          v23 = *((_QWORD *)v22 - 1);
          v22 -= 8;
          *(_QWORD *)v22 = 0;
          *((_QWORD *)v17 - 1) = v23;
          v17 -= 8;
        }
        while (v22 != v10);
LABEL_27:
        v3 = (char *)__p;
        v24 = v99;
        __p = v17;
        v99 = v19;
        v100 = (unint64_t)v18;
        if (v24 == v3)
        {
          v7 = obj;
          if (!v3)
            goto LABEL_34;
LABEL_33:
          operator delete(v3);
          goto LABEL_34;
        }
        v7 = obj;
        do
        {
          v25 = (void *)*((_QWORD *)v24 - 1);
          v24 -= 8;

        }
        while (v24 != v3);
LABEL_32:
        if (v3)
          goto LABEL_33;
LABEL_34:
        v3 = v19;
LABEL_9:
        v99 = v3;
      }
      v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    }
    while (v6);
LABEL_48:

    v4 = v78;
LABEL_49:

    v34 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v82;
    routeLineSplitAnnotation = v82->_routeLineSplitAnnotation;
    if (routeLineSplitAnnotation)
    {
      do
      {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)routeLineSplitAnnotation;
        routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
      }
      while (routeLineSplitAnnotation);
    }
    else
    {
      do
      {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v34[2].__value_.__left_;
        v37 = left->__value_.__left_ == v34;
        v34 = left;
      }
      while (!v37);
    }
    begin_node = (VKGlobeLineContainer *)left;
    if (left != p_pair1)
      continue;
    break;
  }
LABEL_56:
  v38 = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__begin_node_;
  if (v38 != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
  {
    while (2)
    {
      v87 = &off_1E42B4CF0;
      v39 = v38->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
      v88 = v39;
      v40 = (std::__shared_weak_count *)v38->_overlays.__tree_.__pair1_.__value_.__left_;
      v89 = v38->_overlays.__tree_.__begin_node_;
      v90 = v40;
      if (v40)
      {
        p_shared_weak_owners = (unint64_t *)&v40->__shared_weak_owners_;
        do
          v42 = __ldxr(p_shared_weak_owners);
        while (__stxr(v42 + 1, p_shared_weak_owners));
      }
      v43 = (id *)v3;
      if (__p != v3)
      {
        v43 = (id *)__p;
        while (*v43 != v39)
        {
          if (++v43 == (id *)v3)
          {
            v43 = (id *)v3;
            break;
          }
        }
      }
      if (v43 != (id *)v3)
      {
        if (v40)
          goto LABEL_69;
        goto LABEL_70;
      }
      v46 = v96;
      if ((unint64_t)v96 < v97)
      {
        *v96 = &off_1E42B4CF0;
        v46[1] = 0;
        v47 = v39;
        v48 = v46[1];
        v46[1] = v47;

        v49 = v46 + 3;
        goto LABEL_96;
      }
      v50 = v95;
      v51 = 0xAAAAAAAAAAAAAAABLL * (v96 - v95);
      v52 = v51 + 1;
      if (v51 + 1 > 0xAAAAAAAAAAAAAAALL)
        abort();
      if (0x5555555555555556 * ((uint64_t)(v97 - (_QWORD)v95) >> 3) > v52)
        v52 = 0x5555555555555556 * ((uint64_t)(v97 - (_QWORD)v95) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v97 - (_QWORD)v95) >> 3) >= 0x555555555555555)
        v53 = 0xAAAAAAAAAAAAAAALL;
      else
        v53 = v52;
      if (v53)
      {
        if (v53 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_120;
        v54 = (char *)operator new(24 * v53);
      }
      else
      {
        v54 = 0;
      }
      v55 = &v54[24 * v51];
      *(_QWORD *)v55 = &off_1E42B4CF0;
      *((_QWORD *)v55 + 1) = 0;
      v56 = v39;
      v57 = (void *)*((_QWORD *)v55 + 1);
      *((_QWORD *)v55 + 1) = v56;

      v58 = &v54[24 * v53];
      v49 = (void **)(v55 + 24);
      if (v46 == v50)
      {
        v95 = (void **)v55;
        v96 = (void **)(v55 + 24);
        v97 = (unint64_t)v58;
        if (v46)
          goto LABEL_95;
      }
      else
      {
        do
        {
          *((_QWORD *)v55 - 3) = &off_1E42B4CF0;
          v55 -= 24;
          *((_QWORD *)v55 + 1) = 0;
          v60 = *(v46 - 2);
          v59 = v46 - 2;
          objc_storeStrong((id *)v55 + 1, v60);
          v61 = *v59;
          *v59 = 0;

          v46 = v59 - 1;
        }
        while (v46 != v50);
        v46 = v95;
        v62 = v96;
        v95 = (void **)v55;
        v96 = v49;
        v97 = (unint64_t)v58;
        if (v62 != v46)
        {
          v63 = v62 - 3;
          v64 = v62 - 3;
          do
          {
            v65 = (void (**)(void **))*v64;
            v64 -= 3;
            (*v65)(v63);
            v37 = v63 == v46;
            v63 = v64;
          }
          while (!v37);
        }
        if (v46)
LABEL_95:
          operator delete(v46);
      }
LABEL_96:
      v96 = v49;
      v40 = v90;
      if (v90)
LABEL_69:
        std::__shared_weak_count::__release_weak(v40);
LABEL_70:

      v44 = v38->_routeLineSplitAnnotation;
      if (v44)
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)v44;
          v44 = *(VKRouteMatchedAnnotationPresentation **)v44;
        }
        while (v44);
      }
      else
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)v38->_skippedRouteLineSplitAnnotation;
          v37 = skippedRouteLineSplitAnnotation->super.isa == (Class)v38;
          v38 = skippedRouteLineSplitAnnotation;
        }
        while (!v37);
      }
      v38 = skippedRouteLineSplitAnnotation;
      if (skippedRouteLineSplitAnnotation == (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
        break;
      continue;
    }
  }
  v67 = v95;
  v66 = v96;
  if (v95 == v96)
  {
    if (v95)
      goto LABEL_112;
  }
  else
  {
    v68 = v95;
    do
    {
      v69 = v68[1];
      v70 = v69;
      if (v69)
        v71 = v69;
      v85 = &off_1E42B4CF0;
      v86 = v70;
      -[VKGlobeLineContainer removeLine:](self, "removeLine:", &v85);
      v85 = &off_1E42B4CF0;

      v68 += 3;
    }
    while (v68 != v66);
    if (v67)
    {
      if (v67 != v66)
      {
        v72 = v66 - 3;
        v73 = v72;
        do
        {
          v74 = (void (**)(void **))*v73;
          v73 -= 3;
          (*v74)(v72);
          v37 = v72 == v67;
          v72 = v73;
        }
        while (!v37);
        v67 = v95;
      }
LABEL_112:
      operator delete(v67);
    }
  }
  v75 = (char *)__p;
  if (__p)
  {
    for (j = v99; j != v75; j -= 8)
    {
      v77 = (void *)*((_QWORD *)j - 1);

    }
    operator delete(v75);
  }
}

- (void)update
{
  -[VKGlobeLineContainer _destroyLinesIfNeeded](self, "_destroyLinesIfNeeded");
  -[VKGlobeLineContainer _recreateLinesIfNeeded](self, "_recreateLinesIfNeeded");
}

- (float)halfWidthForLine:(id)a3 styleZ:(float)a4
{
  id v6;
  void *v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *v10;
  unint64_t v11;
  _QWORD *p_left;
  id v13;
  void *v14;
  uint64_t *v15;
  void *v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  unint64_t *p_shared_weak_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  _QWORD *routeRenderLayer;
  uint64_t v24;
  uint64_t v25;
  float v26;
  unint64_t *p_shared_owners;
  unint64_t v28;

  v6 = a3;
  v7 = v6;
  p_pair1 = &self->_polylinesToRoutes.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    while (1)
    {
      while (1)
      {
        v10 = left;
        v11 = (unint64_t)left[5].__value_.__left_;
        if (v11 <= (unint64_t)v6)
          break;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *)v10->__value_.__left_;
        p_pair1 = v10;
        if (!v10->__value_.__left_)
          goto LABEL_8;
      }
      if (v11 >= (unint64_t)v6)
        break;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *)v10[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v10 + 1;
        goto LABEL_8;
      }
    }
    v16 = v6;
    p_left = &v10->__value_.__left_;
    v17 = (std::__shared_weak_count *)v10[8].__value_.__left_;
    if (v17)
      goto LABEL_11;
LABEL_17:

    v21 = 0;
    v22 = 0;
    goto LABEL_18;
  }
  v10 = &self->_polylinesToRoutes.__tree_.__pair1_;
LABEL_8:
  p_left = operator new(0x48uLL);
  p_left[4] = &off_1E42B4CF0;
  v13 = v7;
  p_left[5] = v13;

  p_left[7] = 0;
  p_left[8] = 0;
  *p_left = 0;
  p_left[1] = 0;
  p_left[2] = v10;
  p_pair1->__value_.__left_ = p_left;
  v14 = *(void **)self->_polylinesToRoutes.__tree_.__begin_node_;
  v15 = p_left;
  if (v14)
  {
    self->_polylinesToRoutes.__tree_.__begin_node_ = v14;
    v15 = (uint64_t *)p_pair1->__value_.__left_;
  }
  std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_, v15);
  v16 = 0;
  ++self->_polylinesToRoutes.__tree_.__pair3_.__value_;
  v17 = (std::__shared_weak_count *)p_left[8];
  if (!v17)
    goto LABEL_17;
LABEL_11:
  v18 = p_left[7];
  p_shared_weak_owners = (unint64_t *)&v17->__shared_weak_owners_;
  do
    v20 = __ldxr(p_shared_weak_owners);
  while (__stxr(v20 + 1, p_shared_weak_owners));

  v21 = std::__shared_weak_count::lock(v17);
  if (v21)
    v22 = v18;
  else
    v22 = 0;
LABEL_18:
  routeRenderLayer = self->_routeRenderLayer;
  v24 = routeRenderLayer[37];
  v25 = routeRenderLayer[38];
  v26 = 0.0;
  if (v24 == v25)
  {
LABEL_21:
    if (!v21)
      goto LABEL_28;
    goto LABEL_24;
  }
  while (*(_QWORD *)v24 != v22)
  {
    v24 += 24;
    if (v24 == v25)
      goto LABEL_21;
  }
  v26 = altitude::Route::widthForZoom(*(altitude::Route **)(v24 + 16), a4) * 0.5;
  if (v21)
  {
LABEL_24:
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v28 = __ldaxr(p_shared_owners);
    while (__stlxr(v28 - 1, p_shared_owners));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
LABEL_28:
  if (v17)
    std::__shared_weak_count::__release_weak(v17);

  return v26;
}

- (VKGlobeLineContainerDelegate)delegate
{
  return (VKGlobeLineContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VKRouteMatchedAnnotationPresentation)skippedRouteLineSplitAnnotation
{
  return self->_skippedRouteLineSplitAnnotation;
}

- (void).cxx_destruct
{
  self->_skippedPolyline._vptr$_retain_ptr = (void **)&off_1E42B4CF0;

  self->_selectedPolyline._vptr$_retain_ptr = (void **)&off_1E42B4CF0;
  std::__tree<std::__value_type<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::weak_ptr<altitude::RouteLineData>>,std::__map_value_compare<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__value_type<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::weak_ptr<altitude::RouteLineData>>,std::less<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__value_type<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::weak_ptr<altitude::RouteLineData>>>>::destroy((_QWORD *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((_QWORD *)self->_nonPersistentOverlays.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((_QWORD *)self->_persistentOverlays.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((_QWORD *)self->_overlays.__tree_.__pair1_.__value_.__left_);
  std::__tree<VKPolylineGroupOverlay * {__strong}>::destroy((_QWORD *)self->_retainedOverlays.__tree_.__pair1_.__value_.__left_);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_skippedRouteLineSplitAnnotation, 0);
  objc_storeStrong((id *)&self->_routeLineSplitAnnotation, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = (char *)self + 64;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = (char *)self + 88;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = (char *)self + 112;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 17) = (char *)self + 144;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = &off_1E42B4CF0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 23) = &off_1E42B4CF0;
  *((_QWORD *)self + 24) = 0;
  return self;
}

@end
