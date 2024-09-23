@implementation LabelNavRouteLabeler

- (void)setDebugDisableRoadSignLimit:(BOOL)a3
{
  unint64_t debugCachedMaxVisibleOnRouteRoadSigns;
  unint64_t debugCachedMaxVisibleOffRouteRoadSigns;

  if (self->_debugDisableRoadSignLimit != a3)
  {
    self->_debugDisableRoadSignLimit = a3;
    if (a3)
    {
      debugCachedMaxVisibleOnRouteRoadSigns = 100;
      debugCachedMaxVisibleOffRouteRoadSigns = 100;
    }
    else
    {
      debugCachedMaxVisibleOffRouteRoadSigns = self->_debugCachedMaxVisibleOffRouteRoadSigns;
      debugCachedMaxVisibleOnRouteRoadSigns = self->_debugCachedMaxVisibleOnRouteRoadSigns;
    }
    self->_maxVisibleOnRouteRoadSigns = debugCachedMaxVisibleOnRouteRoadSigns;
    self->_maxVisibleOffRouteRoadSigns = debugCachedMaxVisibleOffRouteRoadSigns;
    self->_maxVisibleRoadSigns = debugCachedMaxVisibleOnRouteRoadSigns + debugCachedMaxVisibleOffRouteRoadSigns;
    -[NSMutableDictionary removeAllObjects](self->_visibleLabelsByName, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_visibleLabels, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_visibleShieldGroups, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_fadingLabels, "removeAllObjects");
  }
}

- (void)setRoute:(id)a3
{
  char *begin;
  char *i;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  char *v10;
  char *j;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  VKPolylineOverlay *v15;

  v15 = (VKPolylineOverlay *)a3;
  if (self->_route != v15)
  {
    objc_storeStrong((id *)&self->_route, a3);
    self->_pendingTiles.__table_.__p3_.__value_ = self->_tiles.__table_.__p3_.__value_;
    std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::shared_ptr<md::LabelTile>,void *> *>>(&self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_, (_QWORD *)self->_tiles.__table_.__p1_.__value_.__next_);
    -[NSMutableArray removeAllObjects](self->_junctions, "removeAllObjects");
    begin = (char *)self->_activeSigns.__begin_;
    for (i = (char *)self->_activeSigns.__end_; i != begin; i -= 16)
    {
      v7 = (std::__shared_weak_count *)*((_QWORD *)i - 1);
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v9 = __ldaxr(p_shared_owners);
        while (__stlxr(v9 - 1, p_shared_owners));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
    }
    self->_activeSigns.__end_ = begin;
    v10 = (char *)self->_visibleSigns.__begin_;
    for (j = (char *)self->_visibleSigns.__end_; j != v10; j -= 16)
    {
      v12 = (std::__shared_weak_count *)*((_QWORD *)j - 1);
      if (v12)
      {
        v13 = (unint64_t *)&v12->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
    }
    self->_visibleSigns.__end_ = v10;
    -[NSMutableDictionary removeAllObjects](self->_visibleLabelsByName, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_visibleLabels, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_visibleShieldGroups, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_fadingLabels, "removeAllObjects");
    -[VKLabelNavRoadGraph reset](self->_roadGraph, "reset");
    -[VKLabelNavRoadGraph setTiles:](self->_roadGraph, "setTiles:", &self->_tiles);
    self->_stepIndex = 0;
    -[LabelNavRouteLabeler _refreshGuidanceRoadNames](self, "_refreshGuidanceRoadNames");
    self->_disableTileParseForOneLayout = 1;
    *(_WORD *)&self->_checkIfRouteSubrangeChanged = 1;
    self->_isOnRoute = 0;
    self->_regenerateRoadSigns = 0;
    self->_routeUserOffset = (PolylineCoordinate)0xBF80000000000000;
    self->_currentRoadNameIndex = -1;
    -[LabelNavRouteLabeler setCurrentRoadName:](self, "setCurrentRoadName:", 0);
    -[LabelNavRouteLabeler setCurrentShieldGroup:](self, "setCurrentShieldGroup:", 0);
    -[NSMutableArray removeAllObjects](self->_routeRoadInfos, "removeAllObjects");
  }

}

- (void)setStyleManager:(shared_ptr<gss::StylesheetManager<gss::PropertyID>>)a3
{
  std::__shared_weak_count **ptr;
  __shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __shared_weak_count *cntrl;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *shared_owners;
  unsigned __int8 v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  _QWORD *v15;
  unint64_t maxVisibleRoadSigns;
  unint64_t *v17;
  unint64_t v18;

  ptr = *(std::__shared_weak_count ***)a3.__ptr_;
  v5 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v5)
  {
    v6 = (unint64_t *)((char *)v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  cntrl = self->_styleManager.__cntrl_;
  self->_styleManager.__ptr_ = ptr;
  self->_styleManager.__cntrl_ = v5;
  if (cntrl)
  {
    v9 = (unint64_t *)((char *)cntrl + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
    ptr = (std::__shared_weak_count **)self->_styleManager.__ptr_;
  }
  if (ptr)
  {
    shared_owners = ptr[2];
    if (!shared_owners)
    {
      ptr = 0;
      v15 = self->_styleManager.__ptr_;
      if (!v15)
        goto LABEL_24;
      goto LABEL_20;
    }
    v12 = atomic_load((unsigned __int8 *)&shared_owners[116]);
    if ((v12 & 1) == 0)
      std::__assoc_sub_state::wait((std::__assoc_sub_state *)shared_owners[117].__vftable);
    ptr = (std::__shared_weak_count **)shared_owners[5].__vftable;
    shared_owners = (std::__shared_weak_count *)shared_owners[5].__shared_owners_;
    if (shared_owners)
    {
      p_shared_owners = (unint64_t *)&shared_owners->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
  }
  else
  {
    shared_owners = 0;
  }
  v15 = self->_styleManager.__ptr_;
  if (!v15)
    goto LABEL_24;
LABEL_20:
  if (*(_BYTE *)(v15[2] + 60) == 1)
  {
    self->_maxOnRoadGraphRoadSigns = 0;
    self->_minVisibleOffRoadGraphRoadSigns = 0;
    self->_minVisibleProceedToRouteRoadSigns = 2;
    self->_preferRightSideLabelPlacement = 1;
    if (!ptr)
      goto LABEL_28;
LABEL_27:
    LOBYTE(ptr) = *((_BYTE *)ptr + 257) != 0;
    goto LABEL_28;
  }
LABEL_24:
  maxVisibleRoadSigns = self->_maxVisibleRoadSigns;
  if (maxVisibleRoadSigns >= 5)
    maxVisibleRoadSigns = 5;
  self->_maxOnRoadGraphRoadSigns = maxVisibleRoadSigns;
  self->_minVisibleOffRoadGraphRoadSigns = 3;
  self->_minVisibleProceedToRouteRoadSigns = 6;
  self->_preferRightSideLabelPlacement = 0;
  if (ptr)
    goto LABEL_27;
LABEL_28:
  self->_shouldLabelOppositeCarriageways = (char)ptr;
  if (shared_owners)
  {
    v17 = (unint64_t *)&shared_owners->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *, SEL))shared_owners->__on_zero_shared)(shared_owners, a2);
      std::__shared_weak_count::__release_weak(shared_owners);
    }
  }
}

- (void)clearSceneIsMemoryWarning:(BOOL)a3
{
  _QWORD *next;
  unint64_t value;
  uint64_t i;
  _QWORD *v7;
  unint64_t v8;
  uint64_t j;
  char *begin;
  char *k;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  _QWORD *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  char *v23;
  char *m;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;

  self->_disableTileParseForOneLayout = 1;
  if (!a3)
  {
    if (self->_tiles.__table_.__p2_.__value_)
    {
      next = self->_tiles.__table_.__p1_.__value_.__next_;
      while (next)
      {
        v15 = next;
        next = (_QWORD *)*next;
        v16 = (std::__shared_weak_count *)v15[3];
        if (v16)
        {
          p_shared_owners = (unint64_t *)&v16->__shared_owners_;
          do
            v18 = __ldaxr(p_shared_owners);
          while (__stlxr(v18 - 1, p_shared_owners));
          if (!v18)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v16->__on_zero_shared)(v16, a2);
            std::__shared_weak_count::__release_weak(v16);
          }
        }
        (*(void (**)(Allocator *, _QWORD *, uint64_t))(*(_QWORD *)self->_tiles.__table_.__p1_.__value__2._allocator
                                                               + 40))(self->_tiles.__table_.__p1_.__value__2._allocator, v15, 32);
      }
      self->_tiles.__table_.__p1_.__value_.__next_ = 0;
      value = self->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        for (i = 0; i != value; ++i)
          self->_tiles.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
      }
      self->_tiles.__table_.__p2_.__value_ = 0;
    }
    if (self->_pendingTiles.__table_.__p2_.__value_)
    {
      v7 = self->_pendingTiles.__table_.__p1_.__value_.__next_;
      while (v7)
      {
        v19 = v7;
        v7 = (_QWORD *)*v7;
        v20 = (std::__shared_weak_count *)v19[3];
        if (v20)
        {
          v21 = (unint64_t *)&v20->__shared_owners_;
          do
            v22 = __ldaxr(v21);
          while (__stlxr(v22 - 1, v21));
          if (!v22)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v20->__on_zero_shared)(v20, a2);
            std::__shared_weak_count::__release_weak(v20);
          }
        }
        (*(void (**)(Allocator *, _QWORD *, uint64_t))(*(_QWORD *)self->_pendingTiles.__table_.__p1_.__value__2._allocator
                                                               + 40))(self->_pendingTiles.__table_.__p1_.__value__2._allocator, v19, 32);
      }
      self->_pendingTiles.__table_.__p1_.__value_.__next_ = 0;
      v8 = self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (v8)
      {
        for (j = 0; j != v8; ++j)
          self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
      }
      self->_pendingTiles.__table_.__p2_.__value_ = 0;
    }
    self->_hasPendingTilesInSnappingRegion = 0;
    -[NSMutableArray removeAllObjects](self->_junctions, "removeAllObjects");
    begin = (char *)self->_activeSigns.__begin_;
    for (k = (char *)self->_activeSigns.__end_; k != begin; k -= 16)
    {
      v12 = (std::__shared_weak_count *)*((_QWORD *)k - 1);
      if (v12)
      {
        v13 = (unint64_t *)&v12->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
    }
    self->_activeSigns.__end_ = begin;
    v23 = (char *)self->_visibleSigns.__begin_;
    for (m = (char *)self->_visibleSigns.__end_; m != v23; m -= 16)
    {
      v25 = (std::__shared_weak_count *)*((_QWORD *)m - 1);
      if (v25)
      {
        v26 = (unint64_t *)&v25->__shared_owners_;
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
    }
    self->_visibleSigns.__end_ = v23;
    -[NSMutableDictionary removeAllObjects](self->_visibleLabelsByName, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_visibleLabels, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_visibleShieldGroups, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_fadingLabels, "removeAllObjects");
    -[VKLabelNavRoadGraph reset](self->_roadGraph, "reset");
    self->_useRouteSubrange = 0;
  }
}

- (void)setCurrentLocationText:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  __shared_weak_count *cntrl;
  unint64_t *v9;
  unint64_t v10;
  NSString *v11;

  v5 = (NSString *)a3;
  v6 = v5;
  if (self->_currentLocationText != v5)
  {
    v11 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:");
    v6 = v11;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_currentLocationText, a3);
      v6 = v11;
      cntrl = self->_currentRoadSign.__cntrl_;
      self->_currentRoadSign.__ptr_ = 0;
      self->_currentRoadSign.__cntrl_ = 0;
      if (cntrl)
      {
        v9 = (unint64_t *)((char *)cntrl + 8);
        do
          v10 = __ldaxr(v9);
        while (__stlxr(v10 - 1, v9));
        if (!v10)
        {
          (*(void (**)(__shared_weak_count *, NSString *))(*(_QWORD *)cntrl + 16))(cntrl, v11);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
          v6 = v11;
        }
      }
    }
  }

}

- (void)styleManagerDidChange:(BOOL)a3
{
  if (!a3)
    self->_regenerateRoadSigns = 1;
  self->_isStylesheetAnimating = a3;
}

- (void)styleManagerDidStartAnimating
{
  *(_WORD *)&self->_regenerateRoadSigns = 257;
}

- (void)setArtworkCache:(void *)a3
{
  self->_artworkCache = a3;
}

- (LabelNavRouteLabeler)init
{
  char *v2;
  LabelNavRouteLabeler *v3;
  id v4;
  void *v5;
  unint64_t prime;
  int8x8_t v7;
  unint64_t v8;
  uint8x8_t v9;
  uint64_t v10;
  unint64_t v11;
  int8x8_t v12;
  unint64_t v13;
  uint8x8_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  VKLabelNavRoadGraph *v30;
  void *v31;
  std::__shared_weak_count *v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  uint64_t *v35;
  uint64_t v37;
  char v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)LabelNavRouteLabeler;
  v2 = -[LabelNavRouteLabeler init](&v39, sel_init);
  v3 = (LabelNavRouteLabeler *)v2;
  if (v2)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = (void *)*((_QWORD *)v2 + 48);
    *((_QWORD *)v2 + 48) = v4;

    *((_QWORD *)v2 + 50) = -1;
    prime = vcvtps_u32_f32(32.0 / *((float *)v2 + 28));
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v7 = *(int8x8_t *)(v2 + 72);
    if (prime > *(_QWORD *)&v7)
      goto LABEL_7;
    if (prime < *(_QWORD *)&v7)
    {
      v8 = vcvtps_u32_f32((float)*((unint64_t *)v2 + 13) / *((float *)v2 + 28));
      if (*(_QWORD *)&v7 < 3uLL || (v9 = (uint8x8_t)vcnt_s8(v7), v9.i16[0] = vaddlv_u8(v9), v9.u32[0] > 1uLL))
      {
        v8 = std::__next_prime(v8);
      }
      else
      {
        v10 = 1 << -(char)__clz(v8 - 1);
        if (v8 >= 2)
          v8 = v10;
      }
      if (prime <= v8)
        prime = v8;
      if (prime < *(_QWORD *)&v7)
LABEL_7:
        std::__hash_table<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::__unordered_map_hasher<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,md::TrafficFeatureHash,std::equal_to<VKTrafficFeature * {__strong}>,true>,std::__unordered_map_equal<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::equal_to<VKTrafficFeature * {__strong}>,md::TrafficFeatureHash,true>,geo::StdAllocator<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,mdm::Allocator>>::__do_rehash<true>((uint64_t)(v2 + 64), prime);
    }
    v11 = vcvtps_u32_f32(32.0 / *((float *)v2 + 42));
    if (v11 == 1)
    {
      v11 = 2;
    }
    else if ((v11 & (v11 - 1)) != 0)
    {
      v11 = std::__next_prime(v11);
    }
    v12 = *(int8x8_t *)(v2 + 128);
    if (v11 > *(_QWORD *)&v12)
      goto LABEL_23;
    if (v11 < *(_QWORD *)&v12)
    {
      v13 = vcvtps_u32_f32((float)*((unint64_t *)v2 + 20) / *((float *)v2 + 42));
      if (*(_QWORD *)&v12 < 3uLL || (v14 = (uint8x8_t)vcnt_s8(v12), v14.i16[0] = vaddlv_u8(v14), v14.u32[0] > 1uLL))
      {
        v13 = std::__next_prime(v13);
      }
      else
      {
        v15 = 1 << -(char)__clz(v13 - 1);
        if (v13 >= 2)
          v13 = v15;
      }
      if (v11 <= v13)
        v11 = v13;
      if (v11 < *(_QWORD *)&v12)
LABEL_23:
        std::__hash_table<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::__unordered_map_hasher<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,md::TrafficFeatureHash,std::equal_to<VKTrafficFeature * {__strong}>,true>,std::__unordered_map_equal<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::equal_to<VKTrafficFeature * {__strong}>,md::TrafficFeatureHash,true>,geo::StdAllocator<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,mdm::Allocator>>::__do_rehash<true>((uint64_t)(v2 + 120), v11);
    }
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
    v17 = (void *)*((_QWORD *)v2 + 22);
    *((_QWORD *)v2 + 22) = v16;

    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = (void *)*((_QWORD *)v2 + 33);
    *((_QWORD *)v2 + 33) = v18;

    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = (void *)*((_QWORD *)v2 + 34);
    *((_QWORD *)v2 + 34) = v20;

    v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v23 = (void *)*((_QWORD *)v2 + 35);
    *((_QWORD *)v2 + 35) = v22;

    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = (void *)*((_QWORD *)v2 + 32);
    *((_QWORD *)v2 + 32) = v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 16);
    v27 = (void *)*((_QWORD *)v2 + 46);
    *((_QWORD *)v2 + 46) = v26;

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 16);
    v29 = (void *)*((_QWORD *)v2 + 47);
    *((_QWORD *)v2 + 47) = v28;

    v30 = -[VKLabelNavRoadGraph initWithJunctions:]([VKLabelNavRoadGraph alloc], "initWithJunctions:", *((_QWORD *)v2 + 22));
    v31 = (void *)*((_QWORD *)v2 + 23);
    *((_QWORD *)v2 + 23) = v30;

    *((_QWORD *)v2 + 39) = 2;
    *((_OWORD *)v2 + 20) = xmmword_19FFB5AA0;
    *((_OWORD *)v2 + 21) = xmmword_19FFB38C0;
    *((_QWORD *)v2 + 44) = 6;
    v2[465] = 0;
    v32 = (std::__shared_weak_count *)*((_QWORD *)v2 + 63);
    *((_QWORD *)v2 + 62) = 0;
    *((_QWORD *)v2 + 63) = 0;
    if (v32)
    {
      p_shared_owners = (unint64_t *)&v32->__shared_owners_;
      do
        v34 = __ldaxr(p_shared_owners);
      while (__stlxr(v34 - 1, p_shared_owners));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    v2[512] = 1;
    v2[552] = 0;
    v2[419] = 0;
    v37 = 0x3FC90FDB00000000;
    v38 = 1;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert((uint64_t *)v2 + 73, (uint64_t)&v37);
    v37 = 0x40490FDB3FC90FDBLL;
    v38 = 1;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert((uint64_t *)v2 + 73, (uint64_t)&v37);
    v37 = 0x4096CBE440490FDBLL;
    v38 = 0;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert((uint64_t *)v2 + 73, (uint64_t)&v37);
    v37 = 0x40C90FDB4096CBE4;
    v38 = 0;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert((uint64_t *)v2 + 73, (uint64_t)&v37);
    v35 = (uint64_t *)(v2 + 560);
    v37 = 0x3FC90FDB00000000;
    v38 = 0;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert(v35, (uint64_t)&v37);
    v37 = 0x40490FDB3FC90FDBLL;
    v38 = 0;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert(v35, (uint64_t)&v37);
    v37 = 0x4096CBE440490FDBLL;
    v38 = 1;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert(v35, (uint64_t)&v37);
    v37 = 0x40C90FDB4096CBE4;
    v38 = 1;
    geo::range_map<geo::Unit<geo::RadianUnitDescription,float>,md::OrientationAction,std::less<geo::Unit<geo::RadianUnitDescription,float>>,std::allocator<std::pair<gm::Range<geo::Unit<geo::RadianUnitDescription,float>> const,md::OrientationAction>>>::insert(v35, (uint64_t)&v37);
  }
  return v3;
}

- (id).cxx_construct
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  int v9;
  uint64_t v10;
  geo::read_write_lock *v11;
  const char *v12;
  malloc_zone_t *zone;
  int v14;
  uint64_t v15;
  geo::read_write_lock *v16;
  const char *v17;
  malloc_zone_t *v18;
  int v19;
  uint64_t v20;
  geo::read_write_lock *v21;
  const char *v22;
  malloc_zone_t *v23;
  int v24;
  uint64_t v25;
  geo::read_write_lock *v26;
  const char *v27;
  malloc_zone_t *v28;
  int v29;
  uint64_t v30;
  geo::read_write_lock *v31;
  const char *v32;
  malloc_zone_t *v33;
  int v34;
  uint64_t v35;
  geo::read_write_lock *v36;
  const char *v37;
  malloc_zone_t *v38;
  int v39;
  uint64_t v40;
  geo::read_write_lock *v41;
  const char *v42;
  malloc_zone_t *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;

  *(_QWORD *)((char *)self + 36) = 0xBF80000000000000;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  if ((v2 & 1) == 0)
  {
    v44 = self;
    self = v44;
    if (v9)
    {
      v10 = operator new();
      *(_QWORD *)(v10 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v10 + 24) = "VectorKitLabels";
      *(_OWORD *)(v10 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v10 = &off_1E42B5668;
      *(_QWORD *)(v10 + 8) = "VectorKitLabels";
      *(_OWORD *)(v10 + 72) = 0u;
      *(_OWORD *)(v10 + 88) = 0u;
      *(_OWORD *)(v10 + 104) = 0u;
      *(_OWORD *)(v10 + 120) = 0u;
      *(_OWORD *)(v10 + 136) = 0u;
      *(_OWORD *)(v10 + 152) = 0u;
      *(_OWORD *)(v10 + 168) = 0u;
      *(_OWORD *)(v10 + 184) = 0u;
      *(_OWORD *)(v10 + 200) = 0u;
      *(_OWORD *)(v10 + 216) = 0u;
      *(_OWORD *)(v10 + 232) = 0u;
      *(_QWORD *)(v10 + 248) = 0;
      *(_OWORD *)(v10 + 56) = 0u;
      v11 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v10 + 56), 0);
      if ((_DWORD)v11)
        geo::read_write_lock::logFailure(v11, (uint64_t)"initialization", v12);
      zone = malloc_create_zone(0, 0);
      *(_QWORD *)(v10 + 48) = zone;
      malloc_set_zone_name(zone, "VectorKitLabels");
      *(_QWORD *)(v10 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v10;
      self = v44;
    }
  }
  *((_QWORD *)self + 10) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 11) = 0;
  if ((v3 & 1) == 0)
  {
    v45 = self;
    self = v45;
    if (v14)
    {
      v15 = operator new();
      *(_QWORD *)(v15 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v15 + 24) = "VectorKitLabels";
      *(_OWORD *)(v15 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v15 = &off_1E42B5668;
      *(_QWORD *)(v15 + 8) = "VectorKitLabels";
      *(_OWORD *)(v15 + 72) = 0u;
      *(_OWORD *)(v15 + 88) = 0u;
      *(_OWORD *)(v15 + 104) = 0u;
      *(_OWORD *)(v15 + 120) = 0u;
      *(_OWORD *)(v15 + 136) = 0u;
      *(_OWORD *)(v15 + 152) = 0u;
      *(_OWORD *)(v15 + 168) = 0u;
      *(_OWORD *)(v15 + 184) = 0u;
      *(_OWORD *)(v15 + 200) = 0u;
      *(_OWORD *)(v15 + 216) = 0u;
      *(_OWORD *)(v15 + 232) = 0u;
      *(_QWORD *)(v15 + 248) = 0;
      *(_OWORD *)(v15 + 56) = 0u;
      v16 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v15 + 56), 0);
      if ((_DWORD)v16)
        geo::read_write_lock::logFailure(v16, (uint64_t)"initialization", v17);
      v18 = malloc_create_zone(0, 0);
      *(_QWORD *)(v15 + 48) = v18;
      malloc_set_zone_name(v18, "VectorKitLabels");
      *(_QWORD *)(v15 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v15;
      self = v45;
    }
  }
  *((_QWORD *)self + 12) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 13) = 0;
  *((_DWORD *)self + 28) = 1065353216;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  if ((v4 & 1) == 0)
  {
    v46 = self;
    self = v46;
    if (v19)
    {
      v20 = operator new();
      *(_QWORD *)(v20 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v20 + 24) = "VectorKitLabels";
      *(_OWORD *)(v20 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v20 = &off_1E42B5668;
      *(_QWORD *)(v20 + 8) = "VectorKitLabels";
      *(_OWORD *)(v20 + 72) = 0u;
      *(_OWORD *)(v20 + 88) = 0u;
      *(_OWORD *)(v20 + 104) = 0u;
      *(_OWORD *)(v20 + 120) = 0u;
      *(_OWORD *)(v20 + 136) = 0u;
      *(_OWORD *)(v20 + 152) = 0u;
      *(_OWORD *)(v20 + 168) = 0u;
      *(_OWORD *)(v20 + 184) = 0u;
      *(_OWORD *)(v20 + 200) = 0u;
      *(_OWORD *)(v20 + 216) = 0u;
      *(_OWORD *)(v20 + 232) = 0u;
      *(_QWORD *)(v20 + 248) = 0;
      *(_OWORD *)(v20 + 56) = 0u;
      v21 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v20 + 56), 0);
      if ((_DWORD)v21)
        geo::read_write_lock::logFailure(v21, (uint64_t)"initialization", v22);
      v23 = malloc_create_zone(0, 0);
      *(_QWORD *)(v20 + 48) = v23;
      malloc_set_zone_name(v23, "VectorKitLabels");
      *(_QWORD *)(v20 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v20;
      self = v46;
    }
  }
  *((_QWORD *)self + 17) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 18) = 0;
  if ((v5 & 1) == 0)
  {
    v47 = self;
    self = v47;
    if (v24)
    {
      v25 = operator new();
      *(_QWORD *)(v25 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v25 + 24) = "VectorKitLabels";
      *(_OWORD *)(v25 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v25 = &off_1E42B5668;
      *(_QWORD *)(v25 + 8) = "VectorKitLabels";
      *(_OWORD *)(v25 + 72) = 0u;
      *(_OWORD *)(v25 + 88) = 0u;
      *(_OWORD *)(v25 + 104) = 0u;
      *(_OWORD *)(v25 + 120) = 0u;
      *(_OWORD *)(v25 + 136) = 0u;
      *(_OWORD *)(v25 + 152) = 0u;
      *(_OWORD *)(v25 + 168) = 0u;
      *(_OWORD *)(v25 + 184) = 0u;
      *(_OWORD *)(v25 + 200) = 0u;
      *(_OWORD *)(v25 + 216) = 0u;
      *(_OWORD *)(v25 + 232) = 0u;
      *(_QWORD *)(v25 + 248) = 0;
      *(_OWORD *)(v25 + 56) = 0u;
      v26 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v25 + 56), 0);
      if ((_DWORD)v26)
        geo::read_write_lock::logFailure(v26, (uint64_t)"initialization", v27);
      v28 = malloc_create_zone(0, 0);
      *(_QWORD *)(v25 + 48) = v28;
      malloc_set_zone_name(v28, "VectorKitLabels");
      *(_QWORD *)(v25 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v25;
      self = v47;
    }
  }
  *((_QWORD *)self + 19) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 20) = 0;
  *((_DWORD *)self + 42) = 1065353216;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 24) = 0;
  if ((v6 & 1) == 0)
  {
    v48 = self;
    self = v48;
    if (v29)
    {
      v30 = operator new();
      *(_QWORD *)(v30 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v30 + 24) = "VectorKitLabels";
      *(_OWORD *)(v30 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v30 = &off_1E42B5668;
      *(_QWORD *)(v30 + 8) = "VectorKitLabels";
      *(_OWORD *)(v30 + 72) = 0u;
      *(_OWORD *)(v30 + 88) = 0u;
      *(_OWORD *)(v30 + 104) = 0u;
      *(_OWORD *)(v30 + 120) = 0u;
      *(_OWORD *)(v30 + 136) = 0u;
      *(_OWORD *)(v30 + 152) = 0u;
      *(_OWORD *)(v30 + 168) = 0u;
      *(_OWORD *)(v30 + 184) = 0u;
      *(_OWORD *)(v30 + 200) = 0u;
      *(_OWORD *)(v30 + 216) = 0u;
      *(_OWORD *)(v30 + 232) = 0u;
      *(_QWORD *)(v30 + 248) = 0;
      *(_OWORD *)(v30 + 56) = 0u;
      v31 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v30 + 56), 0);
      if ((_DWORD)v31)
        geo::read_write_lock::logFailure(v31, (uint64_t)"initialization", v32);
      v33 = malloc_create_zone(0, 0);
      *(_QWORD *)(v30 + 48) = v33;
      malloc_set_zone_name(v33, "VectorKitLabels");
      *(_QWORD *)(v30 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v30;
      self = v48;
    }
  }
  *((_QWORD *)self + 27) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 30) = 0;
  if ((v7 & 1) == 0)
  {
    v49 = self;
    self = v49;
    if (v34)
    {
      v35 = operator new();
      *(_QWORD *)(v35 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v35 + 24) = "VectorKitLabels";
      *(_OWORD *)(v35 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v35 = &off_1E42B5668;
      *(_QWORD *)(v35 + 8) = "VectorKitLabels";
      *(_OWORD *)(v35 + 72) = 0u;
      *(_OWORD *)(v35 + 88) = 0u;
      *(_OWORD *)(v35 + 104) = 0u;
      *(_OWORD *)(v35 + 120) = 0u;
      *(_OWORD *)(v35 + 136) = 0u;
      *(_OWORD *)(v35 + 152) = 0u;
      *(_OWORD *)(v35 + 168) = 0u;
      *(_OWORD *)(v35 + 184) = 0u;
      *(_OWORD *)(v35 + 200) = 0u;
      *(_OWORD *)(v35 + 216) = 0u;
      *(_OWORD *)(v35 + 232) = 0u;
      *(_QWORD *)(v35 + 248) = 0;
      *(_OWORD *)(v35 + 56) = 0u;
      v36 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v35 + 56), 0);
      if ((_DWORD)v36)
        geo::read_write_lock::logFailure(v36, (uint64_t)"initialization", v37);
      v38 = malloc_create_zone(0, 0);
      *(_QWORD *)(v35 + 48) = v38;
      malloc_set_zone_name(v38, "VectorKitLabels");
      *(_QWORD *)(v35 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v35;
      self = v49;
    }
  }
  *((_QWORD *)self + 31) = mdm::Allocator::instance(void)::alloc;
  *(_QWORD *)((char *)self + 420) = 0xBF80000000000000;
  *(_QWORD *)((char *)self + 428) = 0xBF80000000000000;
  *((_QWORD *)self + 56) = 0;
  *((_QWORD *)self + 57) = 0;
  *((_QWORD *)self + 62) = 0;
  *((_QWORD *)self + 63) = 0;
  *((_QWORD *)self + 65) = 0;
  *((_QWORD *)self + 67) = 0;
  *((_QWORD *)self + 66) = 0;
  if ((v8 & 1) == 0)
  {
    v50 = self;
    self = v50;
    if (v39)
    {
      v40 = operator new();
      *(_QWORD *)(v40 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v40 + 24) = "VectorKitLabels";
      *(_OWORD *)(v40 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v40 = &off_1E42B5668;
      *(_QWORD *)(v40 + 8) = "VectorKitLabels";
      *(_OWORD *)(v40 + 72) = 0u;
      *(_OWORD *)(v40 + 88) = 0u;
      *(_OWORD *)(v40 + 104) = 0u;
      *(_OWORD *)(v40 + 120) = 0u;
      *(_OWORD *)(v40 + 136) = 0u;
      *(_OWORD *)(v40 + 152) = 0u;
      *(_OWORD *)(v40 + 168) = 0u;
      *(_OWORD *)(v40 + 184) = 0u;
      *(_OWORD *)(v40 + 200) = 0u;
      *(_OWORD *)(v40 + 216) = 0u;
      *(_OWORD *)(v40 + 232) = 0u;
      *(_QWORD *)(v40 + 248) = 0;
      *(_OWORD *)(v40 + 56) = 0u;
      v41 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v40 + 56), 0);
      if ((_DWORD)v41)
        geo::read_write_lock::logFailure(v41, (uint64_t)"initialization", v42);
      v43 = malloc_create_zone(0, 0);
      *(_QWORD *)(v40 + 48) = v43;
      malloc_set_zone_name(v43, "VectorKitLabels");
      *(_QWORD *)(v40 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v40;
      self = v50;
    }
  }
  *((_QWORD *)self + 68) = mdm::Allocator::instance(void)::alloc;
  *(_OWORD *)((char *)self + 568) = 0u;
  *((_QWORD *)self + 70) = (char *)self + 568;
  *((_OWORD *)self + 37) = 0u;
  *((_QWORD *)self + 73) = (char *)self + 592;
  return self;
}

- (BOOL)needsDebugDraw
{
  void *v2;
  char v3;
  void *v4;
  void *v5;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "showNavLabelOverlay") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "enableNavRoadSignOrientationDebugging") & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "showNavLabelRouteAvoidanceOverlay");

    }
  }

  return v3;
}

- (void)debugDraw:(id)a3 overlayConsole:(void *)a4 navContext:(NavContext *)a5
{
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "showNavLabelOverlay");

  if (v9)
    -[LabelNavRouteLabeler drawNavOverlayDebugView:navContext:](self, "drawNavOverlayDebugView:navContext:", a4, a5);
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "enableNavRoadSignOrientationDebugging");

  if (v11)
    -[LabelNavRouteLabeler drawRoadSignOrientationDebugView:navContext:](self, "drawRoadSignOrientationDebugView:navContext:", a4, a5);
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "showNavLabelRouteAvoidanceOverlay");

  if (v13)
    -[VKLabelNavRoadGraph debugDraw:overlayConsole:navContext:](self->_roadGraph, "debugDraw:overlayConsole:navContext:", v14, a4, a5);

}

- (void)drawRoadSignOrientationDebugView:(void *)a3 navContext:(NavContext *)a4
{
  LabelLayoutContext *var3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  uint64_t v22;
  int v23;
  double v24;
  float v25;
  float v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  unsigned int index;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  LabelLayoutContext *v38;
  double v39;
  double v40;
  double v41;
  long double v42;
  long double v43;
  double v44;
  long double v45;
  double v46;
  __double2 v47;
  double v48;
  double v49;
  __double2 v50;
  id v51;
  void *v52;
  void *v53;
  BOOL v54;
  float v55;
  float v56;
  void *v57;
  uint64_t v58;
  LabelLayoutContext *v59;
  double v60;
  long double v61;
  double v62;
  double v63;
  long double v64;
  long double v65;
  double v66;
  __double2 v67;
  double v68;
  double v69;
  __double2 v70;
  double v71;
  double v72;
  long double v73;
  long double v74;
  double v75;
  void *v76;
  void *v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  void *v84;
  void *v85;
  unsigned int v86;
  unsigned int v87;
  float v88;
  float v89;
  float v90;
  double v91;
  float64x2_t v92;
  double v93;
  double v94;
  double v95;
  LabelLayoutContext *v96;
  double v97;
  int v98;
  double v99;
  double v100;
  double v101;
  long double v102;
  long double v103;
  double v104;
  long double v105;
  double v106;
  __double2 v107;
  double v108;
  double v109;
  __double2 v110;
  double v111;
  float64x2_t v112;
  double v113;
  double v114;
  double v115;
  double v116;
  float64x2_t v117;
  float64x2_t v118;
  float64x2_t v119;
  float64x2_t v120;
  double v121;
  double v122;
  double v123;
  long double v124;
  long double v125;
  double v126;
  long double v127;
  __double2 v128;
  double v129;
  double v130;
  __double2 v131;
  float32x2_t v132;
  double v133;
  float32x2_t v134;
  float32x2_t v135;
  float v136;
  int j;
  int v138;
  float v139;
  float v140;
  float v141;
  float v142;
  int v143;
  int v144;
  int v145;
  float v146;
  float v147;
  float v148;
  long double v149;
  float v150;
  float v151;
  float v152;
  float *v153;
  float *v154;
  unint64_t v155;
  float *v156;
  float *v157;
  float *v158;
  BOOL v159;
  unint64_t v160;
  float *v161;
  float *v162;
  uint64_t v163;
  float *v164;
  float *v166;
  float v167;
  float v168;
  BOOL v169;
  float v170;
  BOOL v171;
  float v172;
  float v173;
  double v174;
  double v175;
  double v176;
  float v177;
  unsigned int v178;
  unsigned int v179;
  double v180;
  double v181;
  double v182;
  double v183;
  float64x2_t v184;
  double v185;
  float64x2_t v186;
  double v187;
  float v188;
  float64x2_t v189;
  double v190;
  double v191;
  double v192;
  double v193;
  float64x2_t v194;
  float64x2_t v195;
  float64x2_t v196;
  float64x2_t v197;
  double v198;
  double v199;
  double v200;
  float64x2_t v201;
  float64x2_t v202;
  float64x2_t v203;
  float v204;
  float v205;
  double v206;
  double v207;
  float64x2_t v208;
  float64x2_t v209;
  double v210;
  double v211;
  double v212;
  double v213;
  float64x2_t v214;
  float64x2_t v215;
  float64x2_t v216;
  float32x2_t v217;
  NSMutableArray *obj;
  uint64_t v220;
  uint64_t v221;
  float64x2_t v222;
  float v223;
  double v224;
  float v225;
  double v226;
  float v227;
  double v228;
  float v229;
  float32x2_t v230;
  float32x2_t v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  _QWORD *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  float64x2_t v252;
  double v253;
  float64x2_t v254;
  double v255;
  float64x2_t v256;
  double v257;
  _BYTE v258[128];
  uint64_t v259;

  v259 = *MEMORY[0x1E0C80C00];
  var3 = a4->var3;
  v7 = *((_QWORD *)var3 + 112);
  v236 = (_QWORD *)*((_QWORD *)var3 + 108);
  v237 = v7;
  v8 = *((_QWORD *)var3 + 120);
  v238 = *((_QWORD *)var3 + 116);
  v239 = v8;
  v9 = *((_QWORD *)var3 + 113);
  v240 = *((_QWORD *)var3 + 109);
  v241 = v9;
  v10 = *((_QWORD *)var3 + 121);
  v242 = *((_QWORD *)var3 + 117);
  v243 = v10;
  v11 = *((_QWORD *)var3 + 114);
  v244 = *((_QWORD *)var3 + 110);
  v245 = v11;
  v12 = *((_QWORD *)var3 + 122);
  v246 = *((_QWORD *)var3 + 118);
  v247 = v12;
  v13 = *((_QWORD *)var3 + 115);
  v248 = *((_QWORD *)var3 + 111);
  v249 = v13;
  v14 = *((_QWORD *)var3 + 123);
  v250 = *((_QWORD *)var3 + 119);
  v251 = v14;
  -[VKLabelNavRoadGraph unitHeading](self->_roadGraph, "unitHeading", gm::Matrix<double,4,4>::inverted<int,void>(v252.f64, (double *)&v236));
  v16 = v15;
  v18 = v17;
  v19 = v252;
  v20 = v256;
  v21 = v254;
  v175 = v255;
  v176 = v253;
  v174 = v257;
  v232 = 0u;
  v233 = 0u;
  v234 = 0u;
  v235 = 0u;
  obj = self->_visibleLabels;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v232, v258, 16);
  if (v22)
  {
    v23 = 0;
    v24 = 1.0 / (v174 + v176 * v16 + v175 * v18);
    v25 = v24 * (v20.f64[0] + v19.f64[0] * v16 + v21.f64[0] * v18);
    *(float *)&v24 = v24 * (v20.f64[1] + v19.f64[1] * v16 + v21.f64[1] * v18);
    v220 = *(_QWORD *)v233;
    v26 = 40.0 / sqrtf((float)(v25 * v25) + (float)(*(float *)&v24 * *(float *)&v24));
    v172 = v26 * *(float *)&v24;
    v173 = v26 * v25;
    do
    {
      v221 = v22;
      for (i = 0; i != v221; ++i)
      {
        if (*(_QWORD *)v233 != v220)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v232 + 1) + 8 * i);
        objc_msgSend(v28, "navFeature");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "routeOffset");
        index = self->_routeUserOffset.index;
        if (index <= v30
          && (index != (_DWORD)v30 || self->_routeUserOffset.offset <= *((float *)&v30 + 1))
          && *(_QWORD *)objc_msgSend(v28, "label"))
        {
          v32 = objc_msgSend(v28, "label");
          v33 = *(double **)v32;
          v34 = *(_QWORD *)(*(_QWORD *)v32 + 160);
          if (v34)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v34 + 56))(v34);
          }
          else
          {
            v35 = v33[14];
            v36 = v33[15];
            v37 = v33[16];
          }
          v38 = a4->var3;
          v39 = *((float *)v38 + 12);
          if (*((_BYTE *)v38 + 8))
          {
            v226 = v35;
            v228 = v36;
            v40 = v39 * (0.0000000249532021 * v37);
          }
          else
          {
            v41 = v37 * v39;
            v42 = v35 * 6.28318531;
            v43 = exp(v36 * 6.28318531 + -3.14159265);
            v44 = atan(v43) * 2.0 + -1.57079633;
            v45 = fmod(v42, 6.28318531);
            v46 = fmod(v45 + 6.28318531, 6.28318531) + -3.14159265;
            v47 = __sincos_stret(v44);
            v48 = 6378137.0 / sqrt(v47.__sinval * v47.__sinval * -0.00669437999 + 1.0);
            v49 = (v48 + v41) * v47.__cosval;
            v50 = __sincos_stret(v46);
            v226 = v49 * v50.__cosval;
            v228 = v49 * v50.__sinval;
            v40 = (v41 + v48 * 0.99330562) * v47.__sinval;
          }
          v224 = v40;
          v212 = *((double *)v38 + 115);
          v213 = *((double *)v38 + 111);
          v210 = *((double *)v38 + 123);
          v211 = *((double *)v38 + 119);
          v214 = *((float64x2_t *)v38 + 54);
          v215 = *((float64x2_t *)v38 + 56);
          v222 = *((float64x2_t *)v38 + 60);
          v216 = *((float64x2_t *)v38 + 58);
          v51 = v29;
          if (objc_msgSend(v28, "isRoadLabel"))
          {
            if ((objc_msgSend(v51, "isAwayFromRoute") & 1) == 0)
            {
              objc_msgSend(v51, "navJunctionA");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "outgoingRoad");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = v53 == 0;

              if (!v54)
              {
                objc_msgSend(v51, "direction2D");
                v205 = v55;
                v204 = v56;
                v201 = v252;
                v202 = v254;
                v203 = v256;
                objc_msgSend(v51, "navJunctionA");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend(v57, "mercatorCoordinate");
                v208 = *(float64x2_t *)v58;
                v206 = *(double *)(v58 + 16);

                v59 = a4->var3;
                v60 = *((float *)v59 + 12);
                if (*((_BYTE *)v59 + 8))
                {
                  v200 = v60 * 0.0000000249532021 * v206;
                  v61 = exp(v208.f64[1] * 6.28318531 + -3.14159265);
                  v62 = atan(v61);
                  v199 = v208.f64[1];
                  v198 = v208.f64[0];
                }
                else
                {
                  v63 = v206 * v60;
                  v64 = exp(v208.f64[1] * 6.28318531 + -3.14159265);
                  v62 = atan(v64);
                  v65 = fmod(v208.f64[0] * 6.28318531, 6.28318531);
                  v66 = fmod(v65 + 6.28318531, 6.28318531) + -3.14159265;
                  v67 = __sincos_stret(v62 * 2.0 + -1.57079633);
                  v68 = 6378137.0 / sqrt(v67.__sinval * v67.__sinval * -0.00669437999 + 1.0);
                  v69 = (v68 + v63) * v67.__cosval;
                  v70 = __sincos_stret(v66);
                  v198 = v69 * v70.__cosval;
                  v199 = v69 * v70.__sinval;
                  v200 = (v63 + v68 * 0.99330562) * v67.__sinval;
                }
                v192 = *((double *)v59 + 115);
                v193 = *((double *)v59 + 111);
                v190 = *((double *)v59 + 123);
                v191 = *((double *)v59 + 119);
                v194 = *((float64x2_t *)v59 + 54);
                v195 = *((float64x2_t *)v59 + 56);
                v196 = *((float64x2_t *)v59 + 58);
                v197 = *((float64x2_t *)v59 + 60);
                v71 = v62 * 114.591559 + -90.0;
                v187 = cos(v71 * 0.034906585);
                v185 = cos(v71 * 0.0698131701);
                v183 = cos(v71 * 0.104719755);
                v72 = v71 * 0.00872664626;
                v73 = tan(v72 + 0.78103484);
                v181 = log(v73);
                v74 = tan(v72 + 0.789761487);
                v75 = log(v74);
                objc_msgSend(v51, "navJunctionA");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "outgoingRoad");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "direction3D");
                v79 = v78;
                v81 = v80;
                v83 = v82;

                objc_msgSend(v51, "navJunctionA");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "incomingRoad");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "direction3D");
                v179 = v86;
                v178 = v87;
                v177 = v88;

                v89 = fabs((v75 - v181) * 0.159154943) / (v187 * -559.82 + 111132.92 + v185 * 1.175 + v183 * -0.0023);
                v90 = v89 * 10.0;
                v91 = (float)((float)(v89 * 10.0) * v83);
                v92 = v208;
                v93 = v208.f64[0] + (float)((float)(v89 * 10.0) * v79);
                v94 = v208.f64[1] + (float)((float)(v89 * 10.0) * v81);
                v95 = v206 + v91;
                v96 = a4->var3;
                v97 = *((float *)v96 + 12);
                v98 = *((unsigned __int8 *)v96 + 8);
                if (*((_BYTE *)v96 + 8))
                {
                  v99 = v97 * 0.0000000249532021 * v95;
                  v100 = 1.0;
                }
                else
                {
                  v101 = v95 * v97;
                  v102 = v93 * 6.28318531;
                  v188 = v90;
                  v103 = exp(v94 * 6.28318531 + -3.14159265);
                  v104 = atan(v103) * 2.0 + -1.57079633;
                  v105 = fmod(v102, 6.28318531);
                  v106 = fmod(v105 + 6.28318531, 6.28318531) + -3.14159265;
                  v107 = __sincos_stret(v104);
                  v100 = 1.0;
                  v108 = 6378137.0 / sqrt(v107.__sinval * v107.__sinval * -0.00669437999 + 1.0);
                  v109 = (v108 + v101) * v107.__cosval;
                  v110 = __sincos_stret(v106);
                  v90 = v188;
                  v92 = v208;
                  v93 = v109 * v110.__cosval;
                  v94 = v109 * v110.__sinval;
                  v99 = (v101 + v108 * 0.99330562) * v107.__sinval;
                }
                v111 = v206 + (float)(v90 * v177);
                v112 = vaddq_f64(v92, vcvtq_f64_f32(vmul_n_f32((float32x2_t)__PAIR64__(v178, v179), v90)));
                v113 = *((double *)v96 + 111);
                v114 = *((double *)v96 + 115);
                v115 = *((double *)v96 + 123);
                v116 = *((double *)v96 + 119);
                v117 = *((float64x2_t *)v96 + 54);
                v118 = *((float64x2_t *)v96 + 56);
                v119 = *((float64x2_t *)v96 + 60);
                v120 = *((float64x2_t *)v96 + 58);
                v236 = (_QWORD *)vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v119, v117, v93), v118, v94), v120, v99), v100 / (v115 + v113 * v93 + v114 * v94 + v116 * v99)));
                v121 = v112.f64[1];
                if (v98)
                {
                  v122 = v97 * 0.0000000249532021 * v111;
                }
                else
                {
                  v123 = v111 * v97;
                  v124 = v112.f64[0] * 6.28318531;
                  v209 = v119;
                  v207 = v113;
                  v186 = v117;
                  v189 = v118;
                  v184 = v120;
                  v182 = v114;
                  v125 = exp(v112.f64[1] * 6.28318531 + -3.14159265);
                  v126 = atan(v125) * 2.0 + -1.57079633;
                  v127 = fmod(v124, 6.28318531);
                  v180 = fmod(v127 + 6.28318531, 6.28318531) + -3.14159265;
                  v128 = __sincos_stret(v126);
                  v129 = 6378137.0 / sqrt(v100 + v128.__sinval * v128.__sinval * -0.00669437999);
                  v130 = (v129 + v123) * v128.__cosval;
                  v131 = __sincos_stret(v180);
                  v114 = v182;
                  v120 = v184;
                  v117 = v186;
                  v118 = v189;
                  v113 = v207;
                  v119 = v209;
                  v112.f64[0] = v130 * v131.__cosval;
                  v121 = v130 * v131.__sinval;
                  v122 = (v123 + v129 * 0.99330562) * v128.__sinval;
                }
                v132 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v197, v194, v198), v195, v199), v196, v200), v100 / (v190 + v193 * v198 + v192 * v199 + v191 * v200)));
                v230 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v119, v117, v112.f64[0]), v118, v121), v120, v122), v100 / (v115 + v113 * v112.f64[0] + v114 * v121 + v116 * v122)));
                *((float32x2_t *)a3 + 1) = v132;
                ggl::DebugConsole::drawSymbol((float32x2_t *)a3, 2);
                *((float32x2_t *)a3 + 1) = v132;
                ggl::DebugConsole::drawLine((uint64_t)a3, (float *)&v236);
                *((float32x2_t *)a3 + 1) = v132;
                *(float *)&v133 = ggl::DebugConsole::drawLine((uint64_t)a3, (float *)&v230);
                -[LabelNavRouteLabeler createRoadSignOrientationResolver:navContext:](self, "createRoadSignOrientationResolver:navContext:", v51, a4, v133);
                v134 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v222, v214, v226), v215, v228), v216, v224), 1.0 / (v210 + v213 * v226 + v212 * v228 + v211 * v224)));
                v135 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v203, v201, v205), v202, v204), 1.0 / (v174 + v176 * v205 + v175 * v204)));
                v229 = v134.f32[1] + -40.0;
                v225 = v134.f32[0];
                v223 = v134.f32[0] + -40.0;
                v227 = v134.f32[1] + -80.0;
                v217 = vmul_n_f32(v135, 1.0 / sqrtf(vaddv_f32(vmul_f32(v135, v135))));
                v136 = atan2f(v217.f32[1], v217.f32[0]);
                for (j = 0; j != 20; ++j)
                {
                  v138 = 0;
                  v139 = v223 + (float)(4 * j);
                  v140 = v139 - v225;
                  v141 = v139 + -2.0;
                  v142 = v139 + 2.0;
                  do
                  {
                    v146 = v227 + (float)(4 * v138);
                    v147 = 1.0 / sqrtf((float)(v140 * v140) + (float)((float)(v146 - v229) * (float)(v146 - v229)));
                    v148 = atan2f(v147 * (float)(v146 - v229), v147 * v140);
                    v149 = fmod((float)(v148 - v136) + 6.28318531, 6.28318531);
                    v150 = fmod(v149 + 6.28318531, 6.28318531);
                    v151 = fmodf(v150, 6.2832);
                    v152 = fmodf(v151 + 6.2832, 6.2832);
                    v154 = (float *)(v236 + 1);
                    v153 = (float *)*v236;
                    if ((_QWORD *)*v236 != v236 + 1)
                    {
                      v155 = 0;
                      v156 = (float *)*v236;
                      do
                      {
                        v157 = (float *)*((_QWORD *)v156 + 1);
                        if (v157)
                        {
                          do
                          {
                            v158 = v157;
                            v157 = *(float **)v157;
                          }
                          while (v157);
                        }
                        else
                        {
                          do
                          {
                            v158 = (float *)*((_QWORD *)v156 + 2);
                            v159 = *(_QWORD *)v158 == (_QWORD)v156;
                            v156 = v158;
                          }
                          while (!v159);
                        }
                        ++v155;
                        v156 = v158;
                      }
                      while (v158 != v154);
                      do
                      {
                        v160 = v155 >> 1;
                        v161 = v153;
                        if (v155 != 1)
                        {
                          v163 = v155 >> 1;
                          v164 = v153;
                          do
                          {
                            v166 = (float *)*((_QWORD *)v164 + 1);
                            if (v166)
                            {
                              do
                              {
                                v161 = v166;
                                v166 = *(float **)v166;
                              }
                              while (v166);
                            }
                            else
                            {
                              do
                              {
                                v161 = (float *)*((_QWORD *)v164 + 2);
                                v159 = *(_QWORD *)v161 == (_QWORD)v164;
                                v164 = v161;
                              }
                              while (!v159);
                            }
                            v164 = v161;
                          }
                          while (v163-- > 1);
                        }
                        if (v152 >= v161[8])
                        {
                          v162 = (float *)*((_QWORD *)v161 + 1);
                          if (v162)
                          {
                            do
                            {
                              v153 = v162;
                              v162 = *(float **)v162;
                            }
                            while (v162);
                          }
                          else
                          {
                            do
                            {
                              v153 = (float *)*((_QWORD *)v161 + 2);
                              v159 = *(_QWORD *)v153 == (_QWORD)v161;
                              v161 = v153;
                            }
                            while (!v159);
                          }
                          v160 = v155 + ~v160;
                        }
                        v155 = v160;
                      }
                      while (v160);
                    }
                    if (v153 == v154
                      || ((v167 = v153[7], v168 = v153[8], v152 >= v167) ? (v169 = v152 < v168) : (v169 = 0),
                          !v169
                       || ((v170 = v168 - *(float *)&v237, (float)(*(float *)&v237 + v167) <= v152)
                         ? (v171 = v170 < v152)
                         : (v171 = 1),
                           v171)))
                    {
                      v143 = 0;
                    }
                    else
                    {
                      v23 = *((unsigned __int8 *)v153 + 36);
                      v143 = 1;
                    }
                    if (v23)
                      v144 = 0;
                    else
                      v144 = v143;
                    v145 = v144 << 31 >> 31;
                    if (!v23)
                      v143 = 0;
                    *((_BYTE *)a3 + 96) = v145;
                    *((_BYTE *)a3 + 97) = 0;
                    *((_BYTE *)a3 + 98) = v143 << 31 >> 31;
                    *((_BYTE *)a3 + 99) = -1;
                    v230.f32[0] = v141;
                    v230.f32[1] = v146 + -2.0;
                    v231.f32[0] = v142;
                    v231.f32[1] = v146 + 2.0;
                    *((float *)a3 + 2) = v141;
                    *((float *)a3 + 3) = v146 + -2.0;
                    ggl::DebugConsole::drawRectangleWithFill((float32x2_t *)a3, &v231, v146 + -2.0);
                    ++v138;
                  }
                  while (v138 != 20);
                }
                *((_DWORD *)a3 + 24) = -1;
                v230.f32[0] = v225 + v173;
                v230.f32[1] = v229 + v172;
                *((float *)a3 + 2) = v225;
                *((float *)a3 + 3) = v229;
                ggl::DebugConsole::drawLine((uint64_t)a3, (float *)&v230);
                *((_DWORD *)a3 + 24) = -16711681;
                v230 = vmla_f32((float32x2_t)__PAIR64__(LODWORD(v229), LODWORD(v225)), (float32x2_t)vdup_n_s32(0x42200000u), v217);
                *((float *)a3 + 2) = v225;
                *((float *)a3 + 3) = v229;
                ggl::DebugConsole::drawLine((uint64_t)a3, (float *)&v230);
              }
            }
          }

        }
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v232, v258, 16);
    }
    while (v22);
  }

}

- (void)drawNavOverlayDebugView:(void *)a3 navContext:(NavContext *)a4
{
  LabelNavLayoutContext *var4;
  LabelLayoutContext *var3;
  int v7;
  float v8;
  long double v9;
  long double v10;
  double v11;
  double v12;
  double v13;
  __double2 v14;
  long double v15;
  long double v16;
  char *v17;
  char *v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  float64x2_t v25;
  float64x2_t v26;
  const double *v27;
  uint64_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  const double *v35;
  double v36;
  double v37;
  VKPolylineOverlay *route;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *i;
  double *v48;
  double v49;
  long double v50;
  long double v51;
  long double v52;
  long double v53;
  long double v54;
  long double v55;
  long double v56;
  double v57;
  long double v58;
  double v59;
  long double v60;
  float32_t v61;
  double v62;
  VKPolylineOverlay *v63;
  void *v64;
  void *v65;
  BOOL v66;
  LabelLayoutContext *v67;
  double *v68;
  double v69;
  double v70;
  uint64_t v71;
  unint64_t v72;
  double *v73;
  double v74;
  double v75;
  LabelLayoutContext *v76;
  double v77;
  _QWORD *v78;
  _QWORD *v79;
  _QWORD *v80;
  BOOL v81;
  double v82;
  void *v83;
  void *v84;
  _QWORD *v85;
  double *v86;
  double *v87;
  double *v88;
  double *v89;
  double *v90;
  void *v91;
  uint64_t v92;
  __n128 *v93;
  __n128 *v94;
  __n128 *v95;
  uint64_t j;
  void *v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  char *v104;
  double *v105;
  __n128 *v106;
  __n128 *v107;
  void *v108;
  unint64_t v109;
  uint64_t k;
  unsigned int v111;
  uint64_t v112;
  double v113;
  double v114;
  uint64_t v115;
  long double v116;
  long double v117;
  long double v118;
  long double v119;
  __n128 v120;
  unint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t m;
  void *v128;
  unsigned int v129;
  unsigned int v130;
  double v131;
  double *v132;
  double v133;
  uint64_t v134;
  double *v135;
  double v136;
  double v137;
  double v138;
  uint64_t v139;
  double v140;
  double *n;
  double v142;
  unint64_t v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  unint64_t v152;
  float *v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double *v158;
  double v159;
  uint64_t v160;
  double *v161;
  _QWORD *ii;
  unint64_t v163;
  _QWORD *jj;
  unsigned __int8 v165;
  NSMutableArray *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t kk;
  void *v170;
  void *v171;
  uint64_t v172;
  unsigned int index;
  id v174;
  void *v175;
  double v176;
  double *v177;
  double *v178;
  unint64_t v179;
  uint64_t *v180;
  double v181;
  uint64_t v182;
  double v183;
  BOOL v184;
  float32x2_t *v186;
  double v187;
  double v188;
  double v189;
  float v190;
  unint64_t v191;
  void *v192;
  double v193;
  double *v194;
  double *v195;
  unint64_t v196;
  uint64_t *v197;
  double v198;
  uint64_t v199;
  double v200;
  BOOL v201;
  float32x2_t *v203;
  double v204;
  double v205;
  double v206;
  float v207;
  NSMutableArray *v208;
  uint64_t v209;
  char v210;
  uint64_t v211;
  uint64_t mm;
  id v213;
  void *v214;
  double v215;
  double *v216;
  double *v217;
  double v218;
  unint64_t v219;
  unint64_t v220;
  uint64_t *v221;
  uint64_t v222;
  unsigned int v223;
  double v224;
  uint64_t v225;
  double v226;
  float32x2_t *v227;
  double v228;
  double v229;
  double v230;
  float v231;
  uint64_t v232;
  char v233;
  char v234;
  char v235;
  char v236;
  void *v237;
  id v238;
  uint64_t v239;
  double v240;
  uint64_t v241;
  uint64_t nn;
  void *v243;
  double i1;
  double v245;
  uint64_t v246;
  BOOL v247;
  float32x2_t *v249;
  double v250;
  double v251;
  double v252;
  float v253;
  unint64_t v254;
  uint64_t v255;
  float v256;
  double v258;
  id obj;
  uint64_t v260;
  char v261;
  char v263;
  char v264;
  char v265;
  char v266;
  uint64_t *v267;
  char v268;
  double v269;
  char v270;
  double v271;
  NSMutableArray *v272;
  char v273;
  double v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  double v287;
  double *v288;
  uint64_t v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  void *__p;
  __n128 *v300;
  __n128 *v301;
  _QWORD **v302;
  _QWORD *v303[3];
  _QWORD *v304[2];
  int v305;
  int v306;
  int v307;
  double v308;
  double v309;
  float32x2_t *v310;
  uint64_t v311;
  float32x2_t v312;
  double v313;
  double v314;
  double v315;
  double v316;
  double v317;
  double v318;
  double v319;
  double v320;
  double v321;
  double v322;
  double v323;
  double v324;
  double v325;
  float v326;
  float v327;
  float v328;
  float v329;
  float v330;
  float v331;
  float v332;
  float v333;
  float v334;
  _DWORD v335[4];
  int v336;
  double v337;
  double v338;
  double v339;
  double v340;
  _BYTE v341[128];
  _BYTE v342[128];
  _BYTE v343[128];
  _BYTE v344[128];
  _BYTE v345[128];
  uint64_t v346;
  float64x2x2_t v347;
  float64x2x2_t v348;

  v346 = *MEMORY[0x1E0C80C00];
  v336 = -16776961;
  var3 = a4->var3;
  var4 = a4->var4;
  v7 = *((_DWORD *)var3 + 266);
  v8 = *((float *)var3 + 267);
  v256 = *((float *)a4->var1 + 44);
  v9 = *((double *)var4 + 13);
  v258 = *((double *)var4 + 12);
  if (!*((_BYTE *)var3 + 8))
  {
    v10 = *((double *)var4 + 14);
    v11 = sqrt(v258 * v258 + v9 * v9);
    v12 = atan2(v10, v11 * 0.996647189);
    v13 = atan2(v9, v258);
    v14 = __sincos_stret(v12);
    v15 = atan2(v10 + v14.__sinval * v14.__sinval * 42841.3115 * v14.__sinval, v11 + v14.__cosval * v14.__cosval * -42697.6727 * v14.__cosval);
    v16 = tan(v15 * 0.5 + 0.785398163);
    v258 = v13 * 0.159154943 + 0.5;
    v9 = log(v16) * 0.159154943 + 0.5;
  }
  v17 = (char *)*((_QWORD *)var3 + 144);
  v18 = (char *)*((_QWORD *)var3 + 145);
  if (v17 == v18)
  {
    v22 = 1.79769313e308;
    v23 = -1.79769313e308;
    v20 = 1.79769313e308;
    v21 = -1.79769313e308;
    goto LABEL_12;
  }
  v19 = v18 - v17 - 16;
  if (v19 < 0x30)
  {
    v20 = 1.79769313e308;
    v21 = -1.79769313e308;
    v22 = 1.79769313e308;
    v23 = -1.79769313e308;
    goto LABEL_11;
  }
  v24 = (v19 >> 4) + 1;
  v25 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  v26 = (float64x2_t)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v27 = (const double *)(v17 + 32);
  v28 = v24 & 0x1FFFFFFFFFFFFFFCLL;
  v29 = v26;
  v30 = v25;
  v31 = v25;
  v32 = v25;
  v33 = v26;
  v34 = v26;
  do
  {
    v35 = v27 - 4;
    v347 = vld2q_f64(v35);
    v348 = vld2q_f64(v27);
    v25 = vminnmq_f64(v347.val[0], v25);
    v30 = vminnmq_f64(v348.val[0], v30);
    v33 = vmaxnmq_f64(v33, v347.val[0]);
    v34 = vmaxnmq_f64(v34, v348.val[0]);
    v31 = vminnmq_f64(v347.val[1], v31);
    v32 = vminnmq_f64(v348.val[1], v32);
    v26 = vmaxnmq_f64(v26, v347.val[1]);
    v29 = vmaxnmq_f64(v29, v348.val[1]);
    v27 += 8;
    v28 -= 4;
  }
  while (v28);
  v23 = vmaxnmvq_f64(vmaxnmq_f64(v33, v34));
  v22 = vminnmvq_f64(vminnmq_f64(v31, v32));
  v20 = vminnmvq_f64(vminnmq_f64(v25, v30));
  v21 = vmaxnmvq_f64(vmaxnmq_f64(v26, v29));
  if (v24 != (v24 & 0x1FFFFFFFFFFFFFFCLL))
  {
    v17 += 16 * (v24 & 0x1FFFFFFFFFFFFFFCLL);
    do
    {
LABEL_11:
      v36 = *(double *)v17;
      v37 = *((double *)v17 + 1);
      v17 += 16;
      v20 = fmin(v36, v20);
      v23 = fmax(v23, v36);
      v22 = fmin(v37, v22);
      v21 = fmax(v21, v37);
    }
    while (v17 != v18);
  }
LABEL_12:
  route = self->_route;
  if (route)
  {
    -[VKPolylineOverlay routeRibbon](route, "routeRibbon");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "renderRegion");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      -[VKPolylineOverlay routeRibbon](self->_route, "routeRibbon");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "renderRegion");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (_QWORD *)objc_msgSend(v42, "snappingRegion");

      v46 = (_QWORD *)*v43;
      v45 = v43 + 1;
      v44 = v46;
      if (v46 != v45)
      {
        do
        {
          v78 = (_QWORD *)v44[1];
          v79 = v44;
          if (v78)
          {
            do
            {
              v80 = v78;
              v78 = (_QWORD *)*v78;
            }
            while (v78);
          }
          else
          {
            do
            {
              v80 = (_QWORD *)v79[2];
              v81 = *v80 == (_QWORD)v79;
              v79 = v80;
            }
            while (!v81);
          }
          v20 = fmin(*((double *)v44 + 4), v20);
          v23 = fmax(v23, *((double *)v44 + 6));
          v22 = fmin(*((double *)v44 + 5), v22);
          v21 = fmax(v21, *((double *)v44 + 7));
          v44 = v80;
        }
        while (v80 != v45);
      }
    }
  }
  for (i = self->_tiles.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v48 = (double *)i[2];
    v20 = fmin(v48[39], v20);
    v23 = fmax(v23, v48[41]);
    v22 = fmin(v48[40], v22);
    v21 = fmax(v21, v48[42]);
  }
  v49 = fmax(v23 - v20, v21 - v22) * 1.25;
  v335[0] = 0;
  *(float *)&v335[1] = v8 * 0.25;
  v335[2] = v7;
  *(float *)&v335[3] = v8 * 0.75;
  v50 = exp(v9 * 6.28318531 + -3.14159265);
  *(double *)&v267 = v9;
  v51 = atan(v50) * 114.591559 + -90.0;
  v52 = cos(v51 * 0.034906585) * -559.82 + 111132.92;
  v53 = v52 + cos(v51 * 0.0698131701) * 1.175;
  v54 = v53 + cos(v51 * 0.104719755) * -0.0023;
  v55 = v51 * 0.00872664626;
  v56 = tan(v55 + 0.78103484);
  v57 = log(v56);
  v58 = v55 + 0.789761487;
  v59 = *(double *)&v267;
  v60 = tan(v58);
  v337 = v258;
  v338 = *(double *)&v267;
  v309 = v49 * v54 / fabs((log(v60) - v57) * 0.159154943);
  v308 = v309;
  md::DebugConsoleMapRect::DebugConsoleMapRect((uint64_t)&v310, (uint64_t)a3, (uint64_t)v335, &v337, &v309, &v308);
  *((_DWORD *)a3 + 24) = 0x80000000;
  v61 = *(float *)&v311;
  *((_QWORD *)a3 + 1) = v311;
  *(float *)&v62 = ggl::DebugConsole::drawRectangleWithFill((float32x2_t *)a3, &v312, v61);
  v63 = self->_route;
  if (v63)
  {
    -[VKPolylineOverlay routeRibbon](v63, "routeRibbon", v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "renderRegion");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v65 == 0;

    if (!v66)
    {
      v307 = -16711936;
      v306 = -16777216;
      v305 = -1;
      v67 = a4->var3;
      v68 = (double *)*((_QWORD *)v67 + 144);
      v70 = *v68;
      v69 = v68[1];
      if (*((_QWORD *)v67 + 145) - (_QWORD)v68 < 0x11uLL)
      {
        v77 = *v68;
      }
      else
      {
        v71 = 0;
        v72 = 1;
        do
        {
          v73 = &v68[v71];
          v74 = v73[2] - v70;
          v75 = v73[3] - v69;
          v337 = v70;
          v338 = v69;
          v339 = v74;
          v340 = v75;
          md::DebugConsoleMapRect::drawWorldSegment((uint64_t)&v310, &v337, &v307);
          v76 = a4->var3;
          v68 = (double *)*((_QWORD *)v76 + 144);
          ++v72;
          v70 = v68[v71 + 2];
          v69 = v68[v71 + 3];
          v71 += 2;
        }
        while (v72 < (uint64_t)(*((_QWORD *)v76 + 145) - (_QWORD)v68) >> 4);
        v77 = *v68;
      }
      v82 = v68[1] - v69;
      v337 = v70;
      v338 = v69;
      v339 = v77 - v70;
      v340 = v82;
      md::DebugConsoleMapRect::drawWorldSegment((uint64_t)&v310, &v337, &v307);
      -[VKPolylineOverlay routeRibbon](self->_route, "routeRibbon");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "renderRegion");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = (_QWORD *)objc_msgSend(v84, "snappingRegion");

      v88 = (double *)*v85;
      v87 = (double *)(v85 + 1);
      v86 = v88;
      if (v88 != v87)
      {
        do
        {
          LODWORD(v337) = 1073742079;
          md::DebugConsoleMapRect::drawWorldRect((uint64_t)&v310, v86 + 4, (__int8 *)&v337, 1);
          v89 = (double *)*((_QWORD *)v86 + 1);
          if (v89)
          {
            do
            {
              v90 = v89;
              v89 = *(double **)v89;
            }
            while (v89);
          }
          else
          {
            do
            {
              v90 = (double *)*((_QWORD *)v86 + 2);
              v81 = *(_QWORD *)v90 == (_QWORD)v86;
              v86 = v90;
            }
            while (!v81);
          }
          v86 = v90;
        }
        while (v90 != v87);
      }
      v304[1] = 0;
      v304[0] = 0;
      v303[2] = v304;
      v303[1] = 0;
      v303[0] = 0;
      v302 = v303;
      __p = 0;
      v300 = 0;
      v301 = 0;
      v295 = 0u;
      v296 = 0u;
      v297 = 0u;
      v298 = 0u;
      -[VKPolylineOverlay routeRibbon](self->_route, "routeRibbon");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "matchedSegments");
      obj = (id)objc_claimAutoreleasedReturnValue();

      v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v295, v345, 16);
      if (v92)
      {
        v93 = 0;
        v94 = 0;
        v95 = 0;
        v260 = *(_QWORD *)v296;
        do
        {
          for (j = 0; j != v92; ++j)
          {
            if (*(_QWORD *)v296 != v260)
              objc_enumerationMutation(obj);
            v97 = *(void **)(*((_QWORD *)&v295 + 1) + 8 * j);
            v98 = objc_msgSend(v97, "startRouteCoordinate");
            v99 = objc_msgSend(v97, "endRouteCoordinate");
            v100 = v99;
            if (v95 >= v94)
            {
              v101 = v95 - v93;
              v102 = v101 + 1;
              if ((unint64_t)(v101 + 1) >> 60)
              {
                __p = v93;
                abort();
              }
              if (((char *)v94 - (char *)v93) >> 3 > v102)
                v102 = ((char *)v94 - (char *)v93) >> 3;
              if ((unint64_t)((char *)v94 - (char *)v93) >= 0x7FFFFFFFFFFFFFF0)
                v103 = 0xFFFFFFFFFFFFFFFLL;
              else
                v103 = v102;
              if (v103 >> 60)
                std::__throw_bad_array_new_length[abi:nn180100]();
              v104 = (char *)operator new(16 * v103);
              v105 = (double *)&v104[16 * v101];
              *v105 = (double)v98;
              v105[1] = (double)v100;
              if (v95 == v93)
              {
                v107 = (__n128 *)&v104[16 * v101];
              }
              else
              {
                v106 = (__n128 *)&v104[16 * v101];
                do
                {
                  v107 = v106 - 1;
                  v106[-1] = v95[-1];
                  --v95;
                  --v106;
                }
                while (v95 != v93);
              }
              v94 = (__n128 *)&v104[16 * v103];
              v95 = (__n128 *)(v105 + 2);
              if (v93)
                operator delete(v93);
              v93 = v107;
            }
            else
            {
              v95->n128_f64[0] = (double)v98;
              v95->n128_f64[1] = (double)v99;
              ++v95;
            }
            objc_msgSend(v97, "road");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v109 = objc_msgSend(v97, "roadRange") + 1;
            for (k = 24 * v109; ; k += 24)
            {
              objc_msgSend(v97, "roadRange");
              if (v109 >= v111)
                break;
              v112 = objc_msgSend(v108, "coordinates3d");
              v113 = *(double *)(v112 + k - 24);
              v114 = *(double *)(v112 + k - 16);
              v115 = objc_msgSend(v108, "coordinates3d");
              v269 = *(double *)(v115 + k);
              v271 = *(double *)(v115 + k + 8);
              v116 = tan(v113 * 0.00872664626 + 0.785398163);
              v117 = log(v116) * 0.159154943;
              v118 = tan(v269 * 0.00872664626 + 0.785398163);
              v119 = log(v118);
              v337 = v114 * 0.00277777778 + 0.5;
              v338 = v117 + 0.5;
              v339 = -(v114 * 0.00277777778 - v271 * 0.00277777778);
              v340 = -(v117 - v119 * 0.159154943);
              md::DebugConsoleMapRect::drawWorldSegment((uint64_t)&v310, &v337, &v306);
              ++v109;
              v59 = *(double *)&v267;
            }

          }
          v300 = v95;
          v301 = v94;
          __p = v93;
          v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v295, v345, 16);
        }
        while (v92);
      }
      else
      {
        v95 = 0;
        v93 = 0;
      }

      v121 = 126 - 2 * __clz(v95 - v93);
      if (v95 == v93)
        v122 = 0;
      else
        v122 = v121;
      std::__introsort<std::_ClassicAlgPolicy,-[LabelNavRouteLabeler(Debug) drawNavOverlayDebugView:navContext:]::$_0 &,gm::Range<double> *,false>(v93, v95, v122, 1, v120);
      v293 = 0u;
      v294 = 0u;
      v291 = 0u;
      v292 = 0u;
      -[VKPolylineOverlay composedRoute](self->_route, "composedRoute");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "sections");
      v124 = (void *)objc_claimAutoreleasedReturnValue();

      v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v291, v344, 16);
      if (v125)
      {
        v126 = *(_QWORD *)v292;
        do
        {
          for (m = 0; m != v125; ++m)
          {
            if (*(_QWORD *)v292 != v126)
              objc_enumerationMutation(v124);
            v128 = *(void **)(*((_QWORD *)&v291 + 1) + 8 * m);
            if (objc_msgSend(v128, "pointCount") >= 2)
            {
              v129 = objc_msgSend(v128, "startPointIndex");
              v130 = objc_msgSend(v128, "endPointIndex");
              v131 = (double)v129;
              *(double *)&v290 = (double)v129;
              *((double *)&v290 + 1) = (double)v130;
              v287 = COERCE_DOUBLE(&v287);
              v288 = &v287;
              v289 = 0;
              md::MuninLabelingUtils::clipRange(&v337, &v290, (uint64_t *)&__p);
              if (v289)
              {
                v133 = v287;
                v132 = v288;
                v134 = *(_QWORD *)v288;
                *(_QWORD *)(v134 + 8) = *(_QWORD *)(*(_QWORD *)&v287 + 8);
                **(_QWORD **)(*(_QWORD *)&v133 + 8) = v134;
                v289 = 0;
                if (v132 != &v287)
                {
                  do
                  {
                    v135 = (double *)*((_QWORD *)v132 + 1);
                    operator delete(v132);
                    v132 = v135;
                  }
                  while (v135 != &v287);
                }
              }
              v136 = v339;
              if (v339 != 0.0)
              {
                v137 = v338;
                v138 = v337;
                v139 = **(_QWORD **)&v338;
                *(_QWORD *)(v139 + 8) = *(_QWORD *)(*(_QWORD *)&v337 + 8);
                **(_QWORD **)(*(_QWORD *)&v138 + 8) = v139;
                v140 = v287;
                *(double *)(*(_QWORD *)&v287 + 8) = v137;
                **(double **)&v137 = v140;
                *(_QWORD *)(*(_QWORD *)&v138 + 8) = &v287;
                v287 = v138;
                v289 += *(_QWORD *)&v136;
              }
              for (n = v288; n != &v287; n = (double *)*((_QWORD *)n + 1))
              {
                v142 = n[2];
                v143 = (unint64_t)(n[3] - v142);
                if (v143 >= 2)
                {
                  objc_msgSend(v128, "vkBounds");
                  v145 = v144;
                  v147 = v146;
                  v149 = v148 - v144;
                  v151 = v150 - v146;
                  v152 = v143 - 1;
                  v153 = (float *)(objc_msgSend(v128, "points") + 12 * (unint64_t)(v142 - v131) + 16);
                  do
                  {
                    v154 = *v153;
                    v155 = v149 * *(v153 - 4);
                    v156 = v151 * *(v153 - 3);
                    v157 = -(v155 - v149 * *(v153 - 1));
                    v337 = v155 + v145;
                    v338 = v156 + v147;
                    v339 = v157;
                    v340 = -(v156 - v151 * v154);
                    md::DebugConsoleMapRect::drawWorldSegment((uint64_t)&v310, &v337, &v305);
                    v153 += 3;
                    --v152;
                  }
                  while (v152);
                }
              }
              if (v289)
              {
                v159 = v287;
                v158 = v288;
                v160 = *(_QWORD *)v288;
                *(_QWORD *)(v160 + 8) = *(_QWORD *)(*(_QWORD *)&v287 + 8);
                **(_QWORD **)(*(_QWORD *)&v159 + 8) = v160;
                v289 = 0;
                if (v158 != &v287)
                {
                  do
                  {
                    v161 = (double *)*((_QWORD *)v158 + 1);
                    operator delete(v158);
                    v158 = v161;
                  }
                  while (v161 != &v287);
                }
              }
            }
          }
          v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v291, v344, 16);
        }
        while (v125);
      }

      for (ii = self->_tiles.__table_.__p1_.__value_.__next_; ii; ii = (_QWORD *)*ii)
      {
        v163 = ii[2];
        if (!std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>(&self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_, v163))md::DebugConsoleMapRect::drawWorldRect((uint64_t)&v310, (double *)(v163 + 312), (__int8 *)&v306, 0);
      }
      for (jj = self->_pendingTiles.__table_.__p1_.__value_.__next_; jj; jj = (_QWORD *)*jj)
        md::DebugConsoleMapRect::drawWorldRect((uint64_t)&v310, (double *)(jj[2] + 312), (__int8 *)&v305, 0);
      v338 = 0.0;
      {
        v255 = operator new();
        mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v255, "VectorKitLabels", 0x5ED09DD50000000FLL);
      }
      v340 = 0.0;
      v339 = *(double *)&mdm::Allocator::instance(void)::alloc;
      v337 = COERCE_DOUBLE(&v338);
      v283 = 0u;
      v284 = 0u;
      v285 = 0u;
      v286 = 0u;
      v166 = self->_visibleLabels;
      v167 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v166, "countByEnumeratingWithState:objects:count:", &v283, v343, 16);
      if (v167)
      {
        v168 = *(_QWORD *)v284;
        v272 = v166;
        do
        {
          for (kk = 0; kk != v167; ++kk)
          {
            if (*(_QWORD *)v284 != v168)
              objc_enumerationMutation(v166);
            v170 = *(void **)(*((_QWORD *)&v283 + 1) + 8 * kk);
            objc_msgSend(v170, "navFeature");
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            v172 = objc_msgSend(v171, "routeOffset");
            index = self->_routeUserOffset.index;
            if (index <= v172
              && (index != (_DWORD)v172 || self->_routeUserOffset.offset <= *((float *)&v172 + 1)))
            {
              if (objc_msgSend(v170, "isJunctionLabel"))
              {
                v174 = v171;
                v175 = v174;
                v176 = v338;
                v177 = &v338;
                v178 = &v338;
                if (v338 == 0.0)
                {
LABEL_120:
                  v180 = (uint64_t *)(*(uint64_t (**)(double, uint64_t, uint64_t))(**(_QWORD **)&v339 + 16))(COERCE_DOUBLE(*(_QWORD *)&v339), 40, 8);
                  v180[4] = (uint64_t)v175;
                  *v180 = 0;
                  v180[1] = 0;
                  v180[2] = (uint64_t)v178;
                  *(_QWORD *)v177 = v180;
                  if (**(_QWORD **)&v337)
                  {
                    v337 = **(double **)&v337;
                    v180 = *(uint64_t **)v177;
                  }
                  std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&v338, v180);
                  ++*(_QWORD *)&v340;
                }
                else
                {
                  while (1)
                  {
                    while (1)
                    {
                      v178 = *(double **)&v176;
                      v179 = *(_QWORD *)(*(_QWORD *)&v176 + 32);
                      if ((unint64_t)v174 >= v179)
                        break;
                      v176 = *v178;
                      v177 = v178;
                      if (!*(_QWORD *)v178)
                        goto LABEL_120;
                    }
                    if (v179 >= (unint64_t)v174)
                      break;
                    v176 = v178[1];
                    if (v176 == 0.0)
                    {
                      v177 = v178 + 1;
                      goto LABEL_120;
                    }
                  }
                }
                v181 = *(double *)objc_msgSend(v175, "mercatorCoordinate");
                v182 = objc_msgSend(v175, "mercatorCoordinate");
                if (v181 >= v313)
                {
                  v183 = *(double *)(v182 + 8);
                  v184 = v181 >= v315 || v183 < v314;
                  if (!v184 && v183 < v316)
                  {
                    v186 = v310;
                    v310[12].i32[0] = -16776961;
                    v187 = v323 + v317 * v181 + v320 * v183;
                    v188 = v324 + v318 * v181 + v321 * v183;
                    v189 = 1.0 / (v325 + v319 * v181 + v322 * v183);
                    *(float *)&v187 = v189 * v187;
                    *(float *)&v189 = v189 * v188;
                    *(float *)&v188 = (float)(v332 + (float)(v326 * *(float *)&v187)) + (float)(v329 * *(float *)&v189);
                    v190 = (float)(v333 + (float)(v327 * *(float *)&v187)) + (float)(v330 * *(float *)&v189);
                    *(float *)&v189 = 1.0
                                    / (float)((float)(v334 + (float)(v328 * *(float *)&v187))
                                            + (float)(v331 * *(float *)&v189));
                    v186[1].f32[0] = *(float *)&v189 * *(float *)&v188;
                    v186[1].f32[1] = *(float *)&v189 * v190;
                    ggl::DebugConsole::drawSymbol(v186, 2);
                  }
                }
              }
              else
              {
                if (!objc_msgSend(v170, "isRoadLabel"))
                  goto LABEL_157;
                objc_msgSend(v171, "navJunctionA");
                v191 = objc_claimAutoreleasedReturnValue();
                v192 = (void *)v191;
                if (v191)
                {
                  v193 = v338;
                  v194 = &v338;
                  v195 = &v338;
                  if (v338 == 0.0)
                  {
LABEL_142:
                    v197 = (uint64_t *)(*(uint64_t (**)(double, uint64_t, uint64_t))(**(_QWORD **)&v339 + 16))(COERCE_DOUBLE(*(_QWORD *)&v339), 40, 8);
                    v197[4] = (uint64_t)v192;
                    *v197 = 0;
                    v197[1] = 0;
                    v197[2] = (uint64_t)v195;
                    *(_QWORD *)v194 = v197;
                    if (**(_QWORD **)&v337)
                    {
                      v337 = **(double **)&v337;
                      v197 = *(uint64_t **)v194;
                    }
                    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&v338, v197);
                    ++*(_QWORD *)&v340;
                  }
                  else
                  {
                    while (1)
                    {
                      while (1)
                      {
                        v195 = *(double **)&v193;
                        v196 = *(_QWORD *)(*(_QWORD *)&v193 + 32);
                        if (v191 >= v196)
                          break;
                        v193 = *v195;
                        v194 = v195;
                        if (!*(_QWORD *)v195)
                          goto LABEL_142;
                      }
                      if (v196 >= v191)
                        break;
                      v193 = v195[1];
                      if (v193 == 0.0)
                      {
                        v194 = v195 + 1;
                        goto LABEL_142;
                      }
                    }
                  }
                  v198 = *(double *)objc_msgSend(v192, "mercatorCoordinate");
                  v199 = objc_msgSend(v192, "mercatorCoordinate");
                  v166 = v272;
                  if (v198 >= v313)
                  {
                    v200 = *(double *)(v199 + 8);
                    v201 = v198 >= v315 || v200 < v314;
                    if (!v201 && v200 < v316)
                    {
                      v203 = v310;
                      v310[12].i32[0] = -16776961;
                      v204 = v323 + v317 * v198 + v320 * v200;
                      v205 = v324 + v318 * v198 + v321 * v200;
                      v206 = 1.0 / (v325 + v319 * v198 + v322 * v200);
                      *(float *)&v204 = v206 * v204;
                      *(float *)&v206 = v206 * v205;
                      *(float *)&v205 = (float)(v332 + (float)(v326 * *(float *)&v204))
                                      + (float)(v329 * *(float *)&v206);
                      v207 = (float)(v333 + (float)(v327 * *(float *)&v204)) + (float)(v330 * *(float *)&v206);
                      *(float *)&v206 = 1.0
                                      / (float)((float)(v334 + (float)(v328 * *(float *)&v204))
                                              + (float)(v331 * *(float *)&v206));
                      v203[1].f32[0] = *(float *)&v206 * *(float *)&v205;
                      v203[1].f32[1] = *(float *)&v206 * v207;
                      ggl::DebugConsole::drawSymbol(v203, 2);
                    }
                  }
                }

              }
            }
LABEL_157:

          }
          v167 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v166, "countByEnumeratingWithState:objects:count:", &v283, v343, 16);
        }
        while (v167);
      }

      v281 = 0u;
      v282 = 0u;
      v279 = 0u;
      v280 = 0u;
      v208 = self->_junctions;
      v209 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v208, "countByEnumeratingWithState:objects:count:", &v279, v342, 16);
      v210 = v306;
      v273 = BYTE1(v306);
      v270 = BYTE2(v306);
      v268 = HIBYTE(v306);
      if (v209)
      {
        v211 = *(_QWORD *)v280;
        do
        {
          for (mm = 0; mm != v209; ++mm)
          {
            if (*(_QWORD *)v280 != v211)
              objc_enumerationMutation(v208);
            v213 = *(id *)(*((_QWORD *)&v279 + 1) + 8 * mm);
            v214 = v213;
            v215 = v338;
            v216 = &v338;
            v217 = &v338;
            if (v338 == 0.0)
            {
LABEL_175:
              v221 = (uint64_t *)(*(uint64_t (**)(double, uint64_t, uint64_t))(**(_QWORD **)&v339 + 16))(COERCE_DOUBLE(*(_QWORD *)&v339), 40, 8);
              v221[4] = (uint64_t)v214;
              *v221 = 0;
              v221[1] = 0;
              v221[2] = (uint64_t)v217;
              *(_QWORD *)v216 = v221;
              if (**(_QWORD **)&v337)
              {
                v337 = **(double **)&v337;
                v221 = *(uint64_t **)v216;
              }
              std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&v338, v221);
              ++*(_QWORD *)&v340;
            }
            else
            {
              v218 = v338;
              do
              {
                v219 = *(_QWORD *)(*(_QWORD *)&v218 + 32);
                if ((unint64_t)v213 >= v219)
                {
                  if (v219 >= (unint64_t)v213)
                    goto LABEL_186;
                  *(_QWORD *)&v218 += 8;
                }
                v218 = **(double **)&v218;
              }
              while (v218 != 0.0);
              while (1)
              {
                while (1)
                {
                  v217 = *(double **)&v215;
                  v220 = *(_QWORD *)(*(_QWORD *)&v215 + 32);
                  if ((unint64_t)v213 >= v220)
                    break;
                  v215 = *v217;
                  v216 = v217;
                  if (!*(_QWORD *)v217)
                    goto LABEL_175;
                }
                if (v220 >= (unint64_t)v213)
                  break;
                v215 = v217[1];
                if (v215 == 0.0)
                {
                  v216 = v217 + 1;
                  goto LABEL_175;
                }
              }
            }
            v222 = objc_msgSend(v214, "routeOffset");
            v223 = self->_routeUserOffset.index;
            if (v223 <= v222
              && (v223 != (_DWORD)v222 || self->_routeUserOffset.offset <= *((float *)&v222 + 1)))
            {
              v224 = *(double *)objc_msgSend(v214, "mercatorCoordinate");
              v225 = objc_msgSend(v214, "mercatorCoordinate");
              if (v224 >= v313 && v224 < v315)
              {
                v226 = *(double *)(v225 + 8);
                if (v226 >= v314 && v226 < v316)
                {
                  v227 = v310;
                  v310[12].i8[0] = v210;
                  v227[12].i8[1] = v273;
                  v227[12].i8[2] = v270;
                  v227[12].i8[3] = v268;
                  v228 = v323 + v317 * v224 + v320 * v226;
                  v229 = v324 + v318 * v224 + v321 * v226;
                  v230 = 1.0 / (v325 + v319 * v224 + v322 * v226);
                  *(float *)&v228 = v230 * v228;
                  *(float *)&v230 = v230 * v229;
                  *(float *)&v229 = (float)(v332 + (float)(v326 * *(float *)&v228)) + (float)(v329 * *(float *)&v230);
                  v231 = (float)(v333 + (float)(v327 * *(float *)&v228)) + (float)(v330 * *(float *)&v230);
                  *(float *)&v230 = 1.0
                                  / (float)((float)(v334 + (float)(v328 * *(float *)&v228))
                                          + (float)(v331 * *(float *)&v230));
                  v227[1].f32[0] = *(float *)&v230 * *(float *)&v229;
                  v227[1].f32[1] = *(float *)&v230 * v231;
                  ggl::DebugConsole::drawSymbol(v227, 2);
                }
              }
            }
LABEL_186:

          }
          v209 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v208, "countByEnumeratingWithState:objects:count:", &v279, v342, 16);
        }
        while (v209);
      }

      v232 = 0;
      v265 = v305;
      v264 = BYTE1(v305);
      v263 = BYTE2(v305);
      v261 = HIBYTE(v305);
      v266 = v210;
      do
      {
        v233 = v210;
        v234 = v273;
        v235 = v270;
        v236 = v268;
        if ((_DWORD)v232)
        {
          if ((_DWORD)v232 == 2)
          {
            v233 = 0;
            v234 = -1;
            v235 = -1;
            v236 = -1;
          }
          else if ((_DWORD)v232 == 1)
          {
            v235 = 0;
            v233 = -1;
            v234 = -1;
            v236 = -1;
          }
          else
          {
            v233 = v265;
            v234 = v264;
            v235 = v263;
            v236 = v261;
          }
        }
        -[VKLabelNavRoadGraph junctionListForDepth:](self->_roadGraph, "junctionListForDepth:", v232);
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        v277 = 0u;
        v278 = 0u;
        v275 = 0u;
        v276 = 0u;
        v238 = v237;
        v239 = objc_msgSend(v238, "countByEnumeratingWithState:objects:count:", &v275, v341, 16);
        if (v239)
        {
          v241 = *(_QWORD *)v276;
          do
          {
            for (nn = 0; nn != v239; ++nn)
            {
              if (*(_QWORD *)v276 != v241)
                objc_enumerationMutation(v238);
              v243 = *(void **)(*((_QWORD *)&v275 + 1) + 8 * nn);
              for (i1 = v338; i1 != 0.0; i1 = **(double **)&i1)
              {
                v254 = *(_QWORD *)(*(_QWORD *)&i1 + 32);
                if ((unint64_t)v243 >= v254)
                {
                  if (v254 >= (unint64_t)v243)
                    goto LABEL_198;
                  *(_QWORD *)&i1 += 8;
                }
              }
              v245 = *(double *)objc_msgSend(*(id *)(*((_QWORD *)&v275 + 1) + 8 * nn), "mercatorCoordinate");
              v246 = objc_msgSend(v243, "mercatorCoordinate");
              v240 = v313;
              if (v245 >= v313)
              {
                v240 = *(double *)(v246 + 8);
                v247 = v245 >= v315 || v240 < v314;
                if (!v247 && v240 < v316)
                {
                  v249 = v310;
                  v310[12].i8[0] = v233;
                  v249[12].i8[1] = v234;
                  v249[12].i8[2] = v235;
                  v249[12].i8[3] = v236;
                  v250 = v323 + v317 * v245 + v320 * v240;
                  v251 = v324 + v318 * v245 + v321 * v240;
                  v252 = 1.0 / (v325 + v319 * v245 + v322 * v240);
                  *(float *)&v250 = v252 * v250;
                  *(float *)&v252 = v252 * v251;
                  *(float *)&v251 = (float)(v332 + (float)(v326 * *(float *)&v250)) + (float)(v329 * *(float *)&v252);
                  v253 = (float)(v333 + (float)(v327 * *(float *)&v250)) + (float)(v330 * *(float *)&v252);
                  *(float *)&v252 = 1.0
                                  / (float)((float)(v334 + (float)(v328 * *(float *)&v250))
                                          + (float)(v331 * *(float *)&v252));
                  v249[1].f32[0] = *(float *)&v252 * *(float *)&v251;
                  v249[1].f32[1] = *(float *)&v252 * v253;
                  ggl::DebugConsole::drawSymbol(v249, 0);
                }
              }
LABEL_198:
              ;
            }
            v239 = objc_msgSend(v238, "countByEnumeratingWithState:objects:count:", &v275, v341, 16, v240);
          }
          while (v239);
        }

        v210 = v266;
        ++v232;
      }
      while (v232 != 3);
      std::__tree<VKTrafficIncidentFeature * {__strong},VKTrafficIncidentFeatureSetLessThan,geo::StdAllocator<VKTrafficIncidentFeature * {__strong},mdm::Allocator>>::destroy((uint64_t)&v337, *(uint64_t *)&v338);
      if (__p)
        operator delete(__p);
      std::__tree<VKPolylineGroupOverlay * {__strong}>::destroy(v303[0]);
      std::__tree<std::__value_type<GEOComposedRouteSection * {__strong},std::vector<std::pair<int,int>>>,std::__map_value_compare<GEOComposedRouteSection * {__strong},std::__value_type<GEOComposedRouteSection * {__strong},std::vector<std::pair<int,int>>>,std::less<GEOComposedRouteSection * {__strong}>,true>,std::allocator<std::__value_type<GEOComposedRouteSection * {__strong},std::vector<std::pair<int,int>>>>>::destroy(v304[0]);
    }
  }
  v274 = *((float *)a4->var3 + 105);
  md::DebugConsoleMapRect::drawWorldArrow((uint64_t)&v310, &v274, &v336, v258, v59, v256 * 22.0, v256 * 12.0);
}

- (void)currentRoadSign
{
  return self->_currentRoadSign.__ptr_;
}

- (float)currentRoadSignPixelHeight
{
  NavCurrentRoadSign *ptr;

  ptr = self->_currentRoadSign.__ptr_;
  if (ptr)
    return *((float *)ptr + 88);
  else
    return 0.0;
}

- (void)setMaxVisibleRoadsigns:(unsigned int)a3
{
  unint64_t maxVisibleOnRouteRoadSigns;
  unint64_t v4;

  if (self->_maxVisibleRoadSigns != a3 && !self->_debugDisableRoadSignLimit)
  {
    maxVisibleOnRouteRoadSigns = self->_maxVisibleOnRouteRoadSigns;
    v4 = a3 - maxVisibleOnRouteRoadSigns;
    if (a3 < maxVisibleOnRouteRoadSigns)
      v4 = 0;
    self->_maxVisibleOffRouteRoadSigns = v4;
    self->_maxVisibleRoadSigns = a3;
    self->_debugCachedMaxVisibleOffRouteRoadSigns = v4;
    self->_debugCachedMaxVisibleOnRouteRoadSigns = maxVisibleOnRouteRoadSigns;
  }
}

- (void)setRouteUserOffset:(PolylineCoordinate)a3
{
  float offset;
  _BOOL4 isOnRoute;
  unsigned int index;
  void *v7;
  unint64_t v8;
  _BOOL4 v9;

  offset = a3.offset;
  self->_routeUserOffset = a3;
  isOnRoute = self->_isOnRoute;
  if (a3.offset < 0.0)
  {
    v9 = 0;
    v8 = 0;
  }
  else
  {
    index = a3.index;
    -[VKPolylineOverlay composedRoute](self->_route, "composedRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "stepIndexForPointIndex:", index);

    v9 = 1;
  }
  self->_isOnRoute = v9;
  if (isOnRoute != offset >= 0.0)
  {
    self->_checkIfRouteSubrangeChanged = 1;
    self->_checkOnRouteLabelsAlignment = v9;
  }
  if (v8 != self->_stepIndex)
  {
    self->_stepIndex = v8;
    -[LabelNavRouteLabeler _refreshGuidanceRoadNames](self, "_refreshGuidanceRoadNames");
    -[LabelNavRouteLabeler _updateRoadsInGuidance](self, "_updateRoadsInGuidance");
    v9 = self->_isOnRoute;
  }
  if (v9)
  {
    -[LabelNavRouteLabeler _updateCurrentRoadInfo](self, "_updateCurrentRoadInfo");
  }
  else
  {
    self->_currentRoadNameIndex = -1;
    -[LabelNavRouteLabeler setCurrentRoadName:](self, "setCurrentRoadName:", 0);
    -[LabelNavRouteLabeler setCurrentShieldGroup:](self, "setCurrentShieldGroup:", 0);
  }
}

- (BOOL)isNavMode
{
  return self->_route && self->_drawRoadSigns;
}

- (void)_reloadRouteJunctions
{
  char *begin;
  char *i;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  char *v8;
  char *j;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;

  self->_pendingTiles.__table_.__p3_.__value_ = self->_tiles.__table_.__p3_.__value_;
  std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::shared_ptr<md::LabelTile>,void *> *>>(&self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_, (_QWORD *)self->_tiles.__table_.__p1_.__value_.__next_);
  -[NSMutableArray removeAllObjects](self->_junctions, "removeAllObjects");
  begin = (char *)self->_activeSigns.__begin_;
  for (i = (char *)self->_activeSigns.__end_; i != begin; i -= 16)
  {
    v5 = (std::__shared_weak_count *)*((_QWORD *)i - 1);
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  self->_activeSigns.__end_ = begin;
  v8 = (char *)self->_visibleSigns.__begin_;
  for (j = (char *)self->_visibleSigns.__end_; j != v8; j -= 16)
  {
    v10 = (std::__shared_weak_count *)*((_QWORD *)j - 1);
    if (v10)
    {
      v11 = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  self->_visibleSigns.__end_ = v8;
  -[NSMutableDictionary removeAllObjects](self->_visibleLabelsByName, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_visibleLabels, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_visibleShieldGroups, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_fadingLabels, "removeAllObjects");
  -[VKLabelNavRoadGraph reset](self->_roadGraph, "reset");
  -[VKLabelNavRoadGraph setTiles:](self->_roadGraph, "setTiles:", &self->_tiles);
}

- (void)_refreshGuidanceRoadNames
{
  VKPolylineOverlay *route;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t stepIndex;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VKGuidanceStepInfo *v12;

  -[NSMutableSet removeAllObjects](self->_roadNamesInGuidance, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_guidanceStepInfos, "removeAllObjects");
  route = self->_route;
  if (route)
  {
    -[VKPolylineOverlay composedRoute](route, "composedRoute");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "steps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    stepIndex = self->_stepIndex;
    if (stepIndex < v6)
    {
      do
      {
        -[VKPolylineOverlay composedRoute](self->_route, "composedRoute");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "steps");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", stepIndex);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "maneuverRoadOrExitName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          -[NSMutableSet addObject:](self->_roadNamesInGuidance, "addObject:", v11);
          if (stepIndex < v6 - 1)
          {
            v12 = -[VKGuidanceStepInfo initWithRoadName:point:]([VKGuidanceStepInfo alloc], "initWithRoadName:point:", v11, objc_msgSend(v10, "endRouteCoordinate"));
            -[NSMutableArray addObject:](self->_guidanceStepInfos, "addObject:", v12);

          }
        }

        ++stepIndex;
      }
      while (v6 != stepIndex);
    }
  }
}

- (void)grabTilesFromScene:(const void *)a3
{
  unsigned __int8 v5;
  unsigned __int8 v6;
  uint64_t v7;
  unsigned __int8 v8;
  _WORD *v9;
  _WORD *v10;
  uint64_t *v11;
  _WORD *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  NSMutableArray *junctions;
  void *v18;
  void *v19;
  _QWORD *i;
  uint64_t v21;
  _BYTE *v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  _QWORD *j;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  _QWORD *v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  _QWORD v49[2];
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  float v59;
  uint64_t v60;
  _QWORD *v61;
  char v62;

  v53 = 0;
  v54 = 0;
  {
    v46 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v46, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v55 = mdm::Allocator::instance(void)::alloc;
  v56 = 0;
  {
    v47 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v47, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v57 = mdm::Allocator::instance(void)::alloc;
  v58 = 0;
  v59 = 1.0;
  v7 = *(_QWORD *)a3;
  if ((v8 & 1) == 0
  {
    qword_1ECE2F300 = 0;
    qword_1ECE2F2F8 = 0;
    md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet = (uint64_t)&qword_1ECE2F2F8;
    __cxa_atexit((void (*)(void *))std::set<gdc::LayerDataWithWorld>::~set[abi:nn180100], &md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet, &dword_19F029000);
  }
  v9 = *(_WORD **)(v7 + 48);
  v10 = *(_WORD **)(v7 + 56);
  v11 = &md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet;
  if (v9 != v10)
  {
    v12 = v9;
    while (*v12 != 13)
    {
      v12 += 16;
      if (v12 == v10)
        goto LABEL_15;
    }
    if (v12 == v10)
    {
      v11 = &md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet;
    }
    else
    {
      while (*v9 != 13)
      {
        v9 += 16;
        if (v9 == v10)
        {
          v9 = v10;
          break;
        }
      }
      v11 = (uint64_t *)(v9 + 4);
    }
  }
LABEL_15:
  v15 = (uint64_t *)*v11;
  v13 = v11 + 1;
  v14 = v15;
  if (v15 != v13)
  {
    do
    {
      v21 = v14[4];
      if (v21)
      {
        if (*(_BYTE *)(v21 + 169) == 15)
        {
          v22 = *(_BYTE **)(v21 + 720);
          if (*v22 == 1)
            std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__emplace_unique_key_args<std::shared_ptr<md::LabelTile>,std::shared_ptr<md::LabelTile> const&>((unint64_t)&v53, (unint64_t)v22, (_QWORD *)(v21 + 720));
        }
      }
      v23 = (uint64_t *)v14[1];
      if (v23)
      {
        do
        {
          v24 = v23;
          v23 = (uint64_t *)*v23;
        }
        while (v23);
      }
      else
      {
        do
        {
          v24 = (uint64_t *)v14[2];
          v25 = *v24 == (_QWORD)v14;
          v14 = v24;
        }
        while (!v25);
      }
      v14 = v24;
    }
    while (v24 != v13);
  }
  v16 = -[NSMutableArray count](self->_junctions, "count");
  junctions = self->_junctions;
  v18 = (void *)MEMORY[0x1E0CB3880];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3321888768;
  v48[2] = __43__LabelNavRouteLabeler_grabTilesFromScene___block_invoke;
  v48[3] = &__block_descriptor_88_ea8_32c135_ZTSNSt3__113unordered_setINS_10shared_ptrIN2md9LabelTileEEENS_4hashIS4_EENS_8equal_toIS4_EEN3geo12StdAllocatorIS4_N3mdm9AllocatorEEEEE_e25_B24__0_8__NSDictionary_16l;
  std::unordered_set<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::unordered_set((unint64_t)v49, (uint64_t)&v53);
  objc_msgSend(v18, "predicateWithBlock:", v48);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](junctions, "filterUsingPredicate:", v19);

  if (-[NSMutableArray count](self->_junctions, "count") != v16)
    -[VKLabelNavRoadGraph routeJunctionsHaveChanged](self->_roadGraph, "routeJunctionsHaveChanged");
  for (i = self->_tiles.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v26 = i[2];
    if (!std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>(&v53, v26))
    {
      v27 = std::__hash_table<std::__hash_value_type<altitude::Tile *,unsigned int>,std::__unordered_map_hasher<altitude::Tile *,std::__hash_value_type<altitude::Tile *,unsigned int>,std::hash<altitude::Tile *>,std::equal_to<altitude::Tile *>,true>,std::__unordered_map_equal<altitude::Tile *,std::__hash_value_type<altitude::Tile *,unsigned int>,std::equal_to<altitude::Tile *>,std::hash<altitude::Tile *>,true>,std::allocator<std::__hash_value_type<altitude::Tile *,unsigned int>>>::find<altitude::Tile *>(&self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_, v26);
      if (v27)
      {
        std::__hash_table<std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,std::__unordered_map_hasher<geo::QuadTile,std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,geo::QuadTileHash,std::equal_to<geo::QuadTile>,true>,std::__unordered_map_equal<geo::QuadTile,std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,std::equal_to<geo::QuadTile>,geo::QuadTileHash,true>,geo::StdAllocator<std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,mdm::Allocator>>::remove((uint64_t)&v60, &self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_, v27);
        v28 = v60;
        v60 = 0;
        if (v28)
        {
          if (v62)
          {
            v29 = *(std::__shared_weak_count **)(v28 + 24);
            if (v29)
            {
              p_shared_owners = (unint64_t *)&v29->__shared_owners_;
              do
                v31 = __ldaxr(p_shared_owners);
              while (__stlxr(v31 - 1, p_shared_owners));
              if (!v31)
              {
                ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
                std::__shared_weak_count::__release_weak(v29);
              }
            }
          }
          (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v61 + 40))(*v61, v28, 32);
        }
      }
      self->_checkIfRouteSubrangeChanged = 1;
    }
  }
  for (j = v56; j; j = (_QWORD *)*j)
  {
    v33 = j[2];
    if (!std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>(&self->_tiles.__table_.__bucket_list_.__ptr_.__value_, v33))
    {
      self->_disableTileParseForOneLayout = 1;
      std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__emplace_unique_key_args<std::shared_ptr<md::LabelTile>,std::shared_ptr<md::LabelTile> const&>((unint64_t)&self->_pendingTiles, v33, j + 2);
      self->_checkIfRouteSubrangeChanged = 1;
    }
  }
  if (&self->_tiles != (unordered_set<std::shared_ptr<md::LabelTile>, std::hash<std::shared_ptr<md::LabelTile>>, std::equal_to<std::shared_ptr<md::LabelTile>>, geo::StdAllocator<std::shared_ptr<md::LabelTile>, mdm::Allocator>> *)&v53)
  {
    self->_tiles.__table_.__p3_.__value_ = v59;
    std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::shared_ptr<md::LabelTile>,void *> *>>(&self->_tiles.__table_.__bucket_list_.__ptr_.__value_, v56);
  }
  -[VKLabelNavRoadGraph setTiles:](self->_roadGraph, "setTiles:", &v53);
  v34 = v51;
  while (v34)
  {
    v38 = v34;
    v34 = (_QWORD *)*v34;
    v39 = (std::__shared_weak_count *)v38[3];
    if (v39)
    {
      v40 = (unint64_t *)&v39->__shared_owners_;
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
        std::__shared_weak_count::__release_weak(v39);
      }
    }
    (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)v52 + 40))(v52, v38, 32);
  }
  v35 = v49[0];
  v49[0] = 0;
  if (v35)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v50 + 40))(v50, v35, 8 * v49[1]);
  v36 = v56;
  while (v36)
  {
    v42 = v36;
    v36 = (_QWORD *)*v36;
    v43 = (std::__shared_weak_count *)v42[3];
    if (v43)
    {
      v44 = (unint64_t *)&v43->__shared_owners_;
      do
        v45 = __ldaxr(v44);
      while (__stlxr(v45 - 1, v44));
      if (!v45)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
    (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)v57 + 40))(v57, v42, 32);
  }
  v37 = v53;
  v53 = 0;
  if (v37)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v55 + 40))(v55, v37, 8 * v54);
}

- (void)_tryAddRoadSignForJunction:(id)a3 navContext:(NavContext *)a4 labelCollisionEnabled:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  -[VKPolylineOverlay composedRoute](self->_route, "composedRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "steps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", self->_stepIndex);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "createLabelWithNavContext:isDrivingSideRight:artworkCache:", a4, objc_msgSend(v10, "drivingSide") == 0, self->_artworkCache);
  objc_msgSend(v12, "junctionSign");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[LabelNavRouteLabeler _tryAddLabel:navContext:labelCollisionEnabled:](self, "_tryAddLabel:navContext:labelCollisionEnabled:", v11, a4, v5);

}

- (void)_createOrUpdateLabelForRoad:(id)a3 isShield:(BOOL)a4 navContext:(NavContext *)a5 hopOffsetDistance:(float)a6
{
  _BOOL8 v8;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  _BOOL4 v17;
  id v18;

  v8 = a4;
  v10 = a3;
  v18 = v10;
  if (v8)
  {
    v15 = 20.0;
    v16 = 40.0;
    LODWORD(v12) = 1120403456;
  }
  else
  {
    v16 = 13.0;
    v15 = 12.0;
    if (objc_msgSend(v10, "isOnRoute") && objc_msgSend(v18, "isStartOfRoadName"))
    {
      LODWORD(v11) = 1128792064;
      v17 = -[VKLabelNavRoadGraph isPriorRouteCollinearWithRoad:distance:](self->_roadGraph, "isPriorRouteCollinearWithRoad:distance:", v18, v11);
      if (v17)
        v15 = 20.0;
      else
        v15 = 12.0;
      if (v17)
        *(float *)&v12 = 150.0;
      else
        *(float *)&v12 = 100.0;
      if (v17)
        v16 = 90.0;
      else
        v16 = 13.0;
    }
    else
    {
      LODWORD(v12) = 1120403456;
    }
    v10 = v18;
  }
  *(float *)&v11 = fmaxf(fmaxf(self->_minSignOffsetDistance, v16), a6);
  LODWORD(v14) = 13.0;
  *(float *)&v13 = v15;
  objc_msgSend(v10, "createLabelWithNavContext:isShieldLabel:desiredOffsetDistance:maxOffsetDistance:minJunctionDistance:minRouteDistance:roadGraph:artworkCache:", a5, v8, self->_roadGraph, self->_artworkCache, v11, v12, v13, v14);

}

- (void)_tryAddRoadSignForRoad:(id)a3 isShield:(BOOL)a4 navContext:(NavContext *)a5 labelCollisionEnabled:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  NSString *currentRoadName;
  void *v11;
  char v12;
  void *v13;
  double v14;
  void *v15;
  NSMutableDictionary *visibleLabelsByName;
  void *v17;
  void *v18;
  float v19;
  float v20;
  double v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  float v25;
  float v26;
  double v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSMutableDictionary *v32;
  void *v33;
  float v34;
  float v35;
  double v36;
  uint64_t v37;
  NSMutableDictionary *v38;
  void *v39;
  float v40;
  float v41;
  double v42;
  uint64_t v43;
  NSMutableDictionary *v44;
  void *v45;
  id v46;

  v6 = a6;
  v8 = a4;
  v46 = a3;
  if (!v8)
  {
    currentRoadName = self->_currentRoadName;
    objc_msgSend(v46, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](currentRoadName, "isEqualToString:", v11))
    {
      v12 = objc_msgSend(v46, "isGuidanceStepStart");

      if ((v12 & 1) == 0)
        goto LABEL_66;
    }
    else
    {

    }
  }
  if ((!objc_msgSend(v46, "isRamp") || (objc_msgSend(v46, "isOnewayToJunction") & 1) == 0)
    && !(objc_msgSend(v46, "isOnRoute") & v8)
    && (v8
     || (!objc_msgSend(v46, "hasVisibleShields")
      || (objc_msgSend(v46, "suppressRoadSignIfShieldPresent") & 1) == 0)
     && (objc_msgSend(v46, "suppressRoadSignIfDeduped") & 1) == 0))
  {
    objc_msgSend(v46, "labelWithType:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (-[NSMutableArray containsObject:](self->_visibleLabels, "containsObject:", v13) & 1) != 0)
      goto LABEL_65;
    if (v8)
    {
      LODWORD(v14) = 0;
      -[LabelNavRouteLabeler _createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:](self, "_createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:", v46, 1, a5, v14);
      objc_msgSend(v46, "labelWithType:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        visibleLabelsByName = self->_visibleLabelsByName;
        objc_msgSend(v15, "displayGroup");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](visibleLabelsByName, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "layoutWithNavContext:", a5);
        if (!-[LabelNavRouteLabeler _collideLabel:activeLabel:labelsToRemove:](self, "_collideLabel:activeLabel:labelsToRemove:", v15, v18, 0))goto LABEL_63;
        objc_msgSend(v15, "desiredOffsetDistance");
        v20 = v19 + 10.0;

        *(float *)&v21 = v20;
        -[LabelNavRouteLabeler _createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:](self, "_createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:", v46, 1, a5, v21);
        objc_msgSend(v46, "labelWithType:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v23 = self->_visibleLabelsByName;
          objc_msgSend(v22, "displayGroup");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](v23, "objectForKey:", v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "layoutWithNavContext:", a5);
          if (!-[LabelNavRouteLabeler _collideLabel:activeLabel:labelsToRemove:](self, "_collideLabel:activeLabel:labelsToRemove:", v22, v18, 0))
          {
            v15 = v22;
            goto LABEL_63;
          }
          objc_msgSend(v22, "desiredOffsetDistance");
          v26 = v25 + 10.0;

          *(float *)&v27 = v26;
          -[LabelNavRouteLabeler _createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:](self, "_createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:", v46, 1, a5, v27);
          objc_msgSend(v46, "labelWithType:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v28 = self->_visibleLabelsByName;
            objc_msgSend(v15, "displayGroup");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](v28, "objectForKey:", v29);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "layoutWithNavContext:", a5);
            if (-[LabelNavRouteLabeler _collideLabel:activeLabel:labelsToRemove:](self, "_collideLabel:activeLabel:labelsToRemove:", v15, v18, 0))
            {
LABEL_22:
              objc_msgSend(v15, "desiredOffsetDistance");
LABEL_64:

              v13 = v15;
              goto LABEL_65;
            }
LABEL_63:
            -[LabelNavRouteLabeler _tryAddLabel:navContext:labelCollisionEnabled:](self, "_tryAddLabel:navContext:labelCollisionEnabled:", v15, a5, v6);
            goto LABEL_64;
          }
        }
      }
      goto LABEL_60;
    }
    LODWORD(v14) = 0;
    -[LabelNavRouteLabeler _createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:](self, "_createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:", v46, 0, a5, v14);
    objc_msgSend(v46, "labelWithType:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      if ((objc_msgSend(v46, "isAwayFromRoute") & 1) != 0
        || !self->_isOnRoute
        && (objc_msgSend(v46, "isOnRoute") & 1) == 0
        && objc_msgSend(v46, "roadSignAlignment") != 3)
      {
        objc_msgSend(v30, "layoutWithNavContext:", a5);
        if (!*(_BYTE *)(*(_QWORD *)objc_msgSend(v30, "label") + 327))
          goto LABEL_26;
      }
      v31 = -[LabelNavRouteLabeler orientationForRoadSign:roadLabel:navContext:](self, "orientationForRoadSign:roadLabel:navContext:", v46, v30, a5);
      if ((_DWORD)v31 == objc_msgSend(v30, "alignment") && !self->_regenerateRoadSigns)
      {
        v15 = v30;
      }
      else
      {
        objc_msgSend(v46, "recreateRoadSignWithAlignment:navContext:artworkCache:", v31, a5, self->_artworkCache);
        objc_msgSend(v46, "labelWithType:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_60;
      }
      v32 = self->_visibleLabelsByName;
      objc_msgSend(v15, "displayGroup");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v32, "objectForKey:", v33);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "layoutWithNavContext:", a5);
      if (!-[LabelNavRouteLabeler _collideLabel:activeLabel:labelsToRemove:](self, "_collideLabel:activeLabel:labelsToRemove:", v15, v18, 0))goto LABEL_63;
      objc_msgSend(v15, "desiredOffsetDistance");
      v35 = v34 + 10.0;

      *(float *)&v36 = v35;
      -[LabelNavRouteLabeler _createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:](self, "_createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:", v46, 0, a5, v36);
      objc_msgSend(v46, "labelWithType:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        goto LABEL_60;
      if ((objc_msgSend(v46, "isAwayFromRoute") & 1) != 0
        || !self->_isOnRoute
        && (objc_msgSend(v46, "isOnRoute") & 1) == 0
        && objc_msgSend(v46, "roadSignAlignment") != 3)
      {
        objc_msgSend(v30, "layoutWithNavContext:", a5);
        if (!*(_BYTE *)(*(_QWORD *)objc_msgSend(v30, "label") + 327))
          goto LABEL_26;
      }
      v37 = -[LabelNavRouteLabeler orientationForRoadSign:roadLabel:navContext:](self, "orientationForRoadSign:roadLabel:navContext:", v46, v30, a5);
      if ((_DWORD)v37 == objc_msgSend(v30, "alignment") && !self->_regenerateRoadSigns)
      {
        v15 = v30;
      }
      else
      {
        objc_msgSend(v46, "recreateRoadSignWithAlignment:navContext:artworkCache:", v37, a5, self->_artworkCache);
        objc_msgSend(v46, "labelWithType:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_60;
      }
      v38 = self->_visibleLabelsByName;
      objc_msgSend(v15, "displayGroup");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v38, "objectForKey:", v39);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "layoutWithNavContext:", a5);
      if (!-[LabelNavRouteLabeler _collideLabel:activeLabel:labelsToRemove:](self, "_collideLabel:activeLabel:labelsToRemove:", v15, v18, 0))goto LABEL_63;
      objc_msgSend(v15, "desiredOffsetDistance");
      v41 = v40 + 10.0;

      *(float *)&v42 = v41;
      -[LabelNavRouteLabeler _createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:](self, "_createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:", v46, 0, a5, v42);
      objc_msgSend(v46, "labelWithType:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        goto LABEL_60;
      if ((objc_msgSend(v46, "isAwayFromRoute") & 1) != 0
        || !self->_isOnRoute
        && (objc_msgSend(v46, "isOnRoute") & 1) == 0
        && objc_msgSend(v46, "roadSignAlignment") != 3)
      {
        objc_msgSend(v30, "layoutWithNavContext:", a5);
        if (!*(_BYTE *)(*(_QWORD *)objc_msgSend(v30, "label") + 327))
        {
LABEL_26:
          v13 = v30;
LABEL_65:

          goto LABEL_66;
        }
      }
      v43 = -[LabelNavRouteLabeler orientationForRoadSign:roadLabel:navContext:](self, "orientationForRoadSign:roadLabel:navContext:", v46, v30, a5);
      if ((_DWORD)v43 == objc_msgSend(v30, "alignment") && !self->_regenerateRoadSigns)
      {
        v15 = v30;
      }
      else
      {
        objc_msgSend(v46, "recreateRoadSignWithAlignment:navContext:artworkCache:", v43, a5, self->_artworkCache);
        objc_msgSend(v46, "labelWithType:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_60;
      }
      v44 = self->_visibleLabelsByName;
      objc_msgSend(v15, "displayGroup");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v44, "objectForKey:", v45);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "layoutWithNavContext:", a5);
      if (-[LabelNavRouteLabeler _collideLabel:activeLabel:labelsToRemove:](self, "_collideLabel:activeLabel:labelsToRemove:", v15, v18, 0))
      {
        goto LABEL_22;
      }
      goto LABEL_63;
    }
LABEL_60:
    v13 = 0;
    goto LABEL_65;
  }
LABEL_66:

}

- (void)_tryAddLabel:(id)a3 navContext:(NavContext *)a4 labelCollisionEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  NSMutableDictionary *visibleLabelsByName;
  void *v11;
  void *v12;
  id v13;
  NSMutableSet *visibleShieldGroups;
  void *v15;
  NSMutableSet *v16;
  void *v17;
  char v18;
  char v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *p_shared_owners;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  _QWORD *end;
  _QWORD *begin;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  __int128 v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  uint64_t v60;
  NSMutableDictionary *v61;
  void *v62;
  void *v63;
  NSMutableSet *v64;
  void *v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  NSMutableDictionary *v69;
  void *v70;
  NSMutableSet *v71;
  NSMutableDictionary *v72;
  void *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  unint64_t *v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  float v82;
  float v83;
  float v84;
  void *v85;
  void *v86;
  BOOL v87;
  uint64_t v88;
  void *v89;
  id v90;
  _BOOL4 obj;
  NSMutableArray *obja;
  void *v93;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  std::__shared_weak_count *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v5 = a5;
  v113 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v93 = v8;
    v9 = v8;
    if (*(_QWORD *)objc_msgSend(v8, "label"))
    {
      obj = v5;
      objc_msgSend(v93, "navFeature");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      visibleLabelsByName = self->_visibleLabelsByName;
      objc_msgSend(v9, "displayGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](visibleLabelsByName, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "navFeature");
      v88 = objc_claimAutoreleasedReturnValue();
      if (self->_regenerateRoadSigns)
      {

        v12 = 0;
      }
      v95 = v12;
      if (objc_msgSend(v93, "isShieldLabel", v88))
      {
        v13 = v94;
        visibleShieldGroups = self->_visibleShieldGroups;
        objc_msgSend(v13, "shieldGroup");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(visibleShieldGroups) = -[NSMutableSet containsObject:](visibleShieldGroups, "containsObject:", v15);

        if ((visibleShieldGroups & 1) != 0)
        {

LABEL_118:
          v9 = v93;
          goto LABEL_119;
        }
        v16 = self->_visibleShieldGroups;
        objc_msgSend(v13, "shieldGroup");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v16, "addObject:", v17);

      }
      if ((objc_msgSend(v94, "isAwayFromRoute") & 1) != 0 || objc_msgSend(v89, "isOnRoute"))
      {
        v18 = objc_msgSend(v94, "isRamp");
        if (v12)
          v19 = 1;
        else
          v19 = v18;
        if ((v19 & 1) == 0)
        {
          v108 = 0u;
          v109 = 0u;
          v106 = 0u;
          v107 = 0u;
          v20 = self->_visibleLabels;
          v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
          if (!v21)
            goto LABEL_23;
          v22 = *(_QWORD *)v107;
LABEL_17:
          v23 = 0;
          while (1)
          {
            if (*(_QWORD *)v107 != v22)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * v23), "navFeature");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v25, "isEqualToString:", v26);

            if ((v27 & 1) != 0)
              break;
            if (v21 == ++v23)
            {
              v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
              if (!v21)
              {
LABEL_23:

                v12 = v95;
                goto LABEL_24;
              }
              goto LABEL_17;
            }
          }

        }
        goto LABEL_118;
      }
LABEL_24:
      if (v12)
      {
        if (v12 == v93)
          goto LABEL_118;
        if ((objc_msgSend(v94, "isOnRoute") & 1) == 0 && (objc_msgSend(v89, "isAwayFromRoute") & 1) == 0)
        {
          if ((objc_msgSend(v89, "isOnRoute") & 1) != 0)
            goto LABEL_118;
          if (objc_msgSend(v93, "isRoadLabel"))
          {
            v30 = objc_msgSend(v89, "intraRoadPriorityForRoadLabel");
            v31 = objc_msgSend(v94, "intraRoadPriorityForRoadLabel");
          }
          else
          {
            v30 = objc_msgSend(v89, "intraRoadPriorityForShieldLabel");
            v31 = objc_msgSend(v94, "intraRoadPriorityForShieldLabel");
          }
          if (v30 > v31)
            goto LABEL_118;
          if (v30 == v31)
          {
            objc_msgSend(v12, "desiredOffsetDistance");
            v83 = v82;
            objc_msgSend(v93, "desiredOffsetDistance");
            if ((float)(v83 - v84) <= 10.0)
              goto LABEL_118;
          }
          if (*(float *)(*(_QWORD *)objc_msgSend(v12, "label") + 340) < *((float *)a4->var4 + 21))
          {
            objc_msgSend(v93, "navFeature");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "navFeature");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = v85 == v86;

            v12 = v95;
            if (v87)
              goto LABEL_118;
          }
        }
        if (objc_msgSend(v89, "isOnRoute"))
        {
          if (objc_msgSend(v89, "isStartOfRoadName"))
          {
            if (!objc_msgSend(v94, "isStartOfRoadName"))
              goto LABEL_118;
            v28 = objc_msgSend(v89, "routeOffset");
            v29 = objc_msgSend(v94, "routeOffset");
            if (v28 < v29
              || (_DWORD)v28 == (_DWORD)v29 && *((float *)&v28 + 1) <= *((float *)&v29 + 1))
            {
              goto LABEL_118;
            }
          }
          else if ((objc_msgSend(v94, "isStartOfRoadName") & 1) == 0)
          {
            v80 = objc_msgSend(v89, "routeOffset");
            v81 = objc_msgSend(v94, "routeOffset");
            if (v80 < v81
              || (_DWORD)v80 == (_DWORD)v81 && *((float *)&v80 + 1) <= *((float *)&v81 + 1))
            {
              goto LABEL_118;
            }
            if (*(float *)(*(_QWORD *)objc_msgSend(v12, "label") + 268) != 0.0)
              goto LABEL_118;
          }
        }
      }
      v32 = (uint64_t *)objc_msgSend(v93, "label");
      v33 = *v32;
      v34 = (std::__shared_weak_count *)v32[1];
      v104 = *v32;
      v105 = v34;
      if (v34)
      {
        p_shared_owners = (unint64_t *)&v34->__shared_owners_;
        do
          v36 = __ldxr(p_shared_owners);
        while (__stxr(v36 + 1, p_shared_owners));
      }
      objc_msgSend(v93, "layoutWithNavContext:", a4);
      if (*(_BYTE *)(v33 + 327))
      {
        if (*(_BYTE *)(v33 + 325) && *(_BYTE *)(v33 + 326))
        {
          v90 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (v95)
            objc_msgSend(v90, "addObject:", v95);
          if (!obj
            || !-[LabelNavRouteLabeler _collideLabel:activeLabel:labelsToRemove:](self, "_collideLabel:activeLabel:labelsToRemove:", v93, v95, v90))
          {
            if ((objc_msgSend(v94, "isAwayFromRoute") & 1) == 0)
            {
              v102 = 0u;
              v103 = 0u;
              v100 = 0u;
              v101 = 0u;
              obja = self->_visibleLabels;
              v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
              if (v37)
              {
                v38 = *(_QWORD *)v101;
                do
                {
                  for (i = 0; i != v37; ++i)
                  {
                    if (*(_QWORD *)v101 != v38)
                      objc_enumerationMutation(obja);
                    v40 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
                    objc_msgSend(v40, "navFeature");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v41, "isAwayFromRoute") & 1) != 0)
                    {
                      objc_msgSend(v40, "navFeature");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v42, "name");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v94, "name");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      v45 = objc_msgSend(v43, "isEqualToString:", v44);

                      if (v45 && (objc_msgSend(v90, "containsObject:", v40) & 1) == 0)
                        objc_msgSend(v90, "addObject:", v40);
                    }
                    else
                    {

                    }
                  }
                  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
                }
                while (v37);
              }

            }
            v98 = 0u;
            v99 = 0u;
            v96 = 0u;
            v97 = 0u;
            v46 = v90;
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
            if (v47)
            {
              v48 = *(_QWORD *)v97;
              do
              {
                for (j = 0; j != v47; ++j)
                {
                  if (*(_QWORD *)v97 != v48)
                    objc_enumerationMutation(v46);
                  v50 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
                  if (*(float *)(*(_QWORD *)objc_msgSend(v50, "label") + 268) == 0.0)
                  {
                    begin = self->_activeSigns.__begin_;
                    end = self->_activeSigns.__end_;
                    v53 = (_QWORD *)objc_msgSend(v50, "label");
                    if (begin != end)
                    {
                      while (*begin != *v53)
                      {
                        begin += 2;
                        if (begin == end)
                        {
                          begin = end;
                          break;
                        }
                      }
                    }
                    v54 = self->_activeSigns.__end_;
                    if (begin != v54)
                    {
                      v55 = begin + 2;
                      if (begin + 2 != v54)
                      {
                        do
                        {
                          v56 = *(_OWORD *)v55;
                          *v55 = 0;
                          v55[1] = 0;
                          v57 = (std::__shared_weak_count *)begin[1];
                          *(_OWORD *)begin = v56;
                          if (v57)
                          {
                            v58 = (unint64_t *)&v57->__shared_owners_;
                            do
                              v59 = __ldaxr(v58);
                            while (__stlxr(v59 - 1, v58));
                            if (!v59)
                            {
                              ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
                              std::__shared_weak_count::__release_weak(v57);
                            }
                          }
                          v55 += 2;
                          begin += 2;
                        }
                        while (v55 != v54);
                        v54 = self->_activeSigns.__end_;
                      }
                      while (v54 != begin)
                      {
                        v66 = (std::__shared_weak_count *)*(v54 - 1);
                        if (v66)
                        {
                          v67 = (unint64_t *)&v66->__shared_owners_;
                          do
                            v68 = __ldaxr(v67);
                          while (__stlxr(v68 - 1, v67));
                          if (!v68)
                          {
                            ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
                            std::__shared_weak_count::__release_weak(v66);
                          }
                        }
                        v54 -= 2;
                      }
                      self->_activeSigns.__end_ = begin;
                    }
                    v69 = self->_visibleLabelsByName;
                    objc_msgSend(v50, "displayGroup");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMutableDictionary removeObjectForKey:](v69, "removeObjectForKey:", v70);

                    -[NSMutableArray removeObject:](self->_visibleLabels, "removeObject:", v50);
                    if (objc_msgSend(v50, "isShieldLabel"))
                    {
                      objc_msgSend(v50, "navFeature");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      v71 = self->_visibleShieldGroups;
                      objc_msgSend(v63, "shieldGroup");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSMutableSet removeObject:](v71, "removeObject:", v65);
                      goto LABEL_100;
                    }
                  }
                  else
                  {
                    if (!*(_BYTE *)(*(_QWORD *)objc_msgSend(v50, "label") + 264))
                    {
                      v60 = *(_QWORD *)objc_msgSend(v50, "label");
                      *(_BYTE *)(v60 + 264) = 1;
                      *(_BYTE *)(v60 + 265) = *(float *)(v60 + 268) != 0.0;
                    }
                    if (v50 == v95)
                    {
                      -[NSMutableArray addObject:](self->_fadingLabels, "addObject:", v95);
                      v61 = self->_visibleLabelsByName;
                      objc_msgSend(v95, "displayGroup");
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSMutableDictionary removeObjectForKey:](v61, "removeObjectForKey:", v62);

                      -[NSMutableArray removeObject:](self->_visibleLabels, "removeObject:", v95);
                      if (objc_msgSend(v95, "isShieldLabel"))
                      {
                        objc_msgSend(v95, "navFeature");
                        v63 = (void *)objc_claimAutoreleasedReturnValue();
                        v64 = self->_visibleShieldGroups;
                        objc_msgSend(v63, "shieldGroup");
                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSMutableSet removeObject:](v64, "removeObject:", v65);
LABEL_100:

                        continue;
                      }
                    }
                  }
                }
                v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
              }
              while (v47);
            }

            v72 = self->_visibleLabelsByName;
            objc_msgSend(v93, "displayGroup");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v72, "setObject:forKey:", v93, v73);

            -[NSMutableArray addObject:](self->_visibleLabels, "addObject:", v93);
            if ((objc_msgSend(v93, "isShieldLabel") & 1) == 0)
            {
              ++self->_countVisibleRoadSigns;
              v74 = objc_msgSend(v94, "isOnRoute");
              v75 = 296;
              if (v74)
                v75 = 288;
              ++*(Class *)((char *)&self->super.isa + v75);
            }
            if (-[NSMutableArray containsObject:](self->_fadingLabels, "containsObject:", v93))
            {
              -[NSMutableArray removeObject:](self->_fadingLabels, "removeObject:", v93);
              v76 = v104;
              v77 = *(float *)(v104 + 268) != 1.0;
            }
            else
            {
              std::vector<std::shared_ptr<md::NavLabel>,geo::StdAllocator<std::shared_ptr<md::NavLabel>,mdm::Allocator>>::push_back[abi:nn180100]((uint64_t)&self->_activeSigns, (uint64_t)&v104);
              v76 = v104;
              *(_DWORD *)(v104 + 268) = 0;
              v77 = 1;
            }
            *(_BYTE *)(v76 + 264) = 0;
            *(_BYTE *)(v76 + 265) = v77;
            v34 = v105;
          }

        }
        else if (!*(_BYTE *)(v33 + 264))
        {
          *(_BYTE *)(v33 + 264) = 1;
          *(_BYTE *)(v33 + 265) = *(float *)(v33 + 268) != 0.0;
        }
      }
      if (v34)
      {
        v78 = (unint64_t *)&v34->__shared_owners_;
        do
          v79 = __ldaxr(v78);
        while (__stlxr(v79 - 1, v78));
        if (!v79)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
      goto LABEL_118;
    }
  }
LABEL_119:

}

- (BOOL)_collideLabel:(id)a3 activeLabel:(id)a4 labelsToRemove:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  AvoidanceRectWithPriority *begin;
  AvoidanceRectWithPriority *end;
  char v13;
  char v14;
  float *v15;
  BOOL v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  float *v22;
  uint64_t v23;
  float *v24;
  uint64_t *v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  void *v29;
  void *v30;
  int v31;
  char v32;
  void *v33;
  char v34;
  char v35;
  char v36;
  int v37;
  int v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
  unint64_t *v45;
  unint64_t v46;
  id v48;
  int v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v48 = a5;
  v51 = v8;
  v10 = objc_msgSend(v8, "label");
  begin = self->_avoidanceRects.__begin_;
  end = self->_avoidanceRects.__end_;
  while (begin != end)
  {
    v13 = objc_msgSend(v51, "isJunctionLabel");
    if (*((_BYTE *)begin + 20))
      v14 = 0;
    else
      v14 = v13;
    if ((v14 & 1) == 0)
    {
      v15 = *(float **)v10;
      if (*(float *)(*(_QWORD *)v10 + 344) > *(float *)begin
        && v15[84] < *((float *)begin + 2)
        && v15[87] > *((float *)begin + 1)
        && v15[85] < *((float *)begin + 3))
      {
        v16 = 1;
        goto LABEL_80;
      }
    }
    begin = (AvoidanceRectWithPriority *)((char *)begin + 24);
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v17 = self->_visibleLabels;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v55;
LABEL_15:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v55 != v19)
        objc_enumerationMutation(v17);
      v21 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * v20);
      if (v21 != v9)
      {
        v22 = *(float **)v10;
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v20), "label");
        v24 = *(float **)v23;
        if (v22[86] > *(float *)(*(_QWORD *)v23 + 336) && v22[84] < v24[86] && v22[87] > v24[85] && v22[85] < v24[87])
          break;
      }
LABEL_16:
      if (++v20 == v18)
      {
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        if (v18)
          goto LABEL_15;
        goto LABEL_77;
      }
    }
    v52 = v51;
    v53 = v21;
    v25 = (uint64_t *)objc_msgSend(v52, "label");
    v26 = (std::__shared_weak_count *)v25[1];
    v58 = *v25;
    v59 = v26;
    if (v26)
    {
      p_shared_owners = (unint64_t *)&v26->__shared_owners_;
      do
        v28 = __ldxr(p_shared_owners);
      while (__stxr(v28 + 1, p_shared_owners));
    }
    objc_msgSend(v52, "navFeature");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "navFeature");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v29, "isOnRoute"))
    {
      v32 = objc_msgSend(v29, "isAwayFromRoute");
      v33 = v53;
      if ((v32 & 1) == 0)
      {
        v34 = objc_msgSend(v30, "isAwayFromRoute");
        v33 = v53;
        if ((v34 & 1) == 0)
        {
          v35 = objc_msgSend(v52, "isShieldLabel");
          v33 = v53;
          if ((v35 & 1) == 0)
          {
            objc_msgSend(v53, "isShieldLabel");
            v33 = v53;
          }
        }
      }
      goto LABEL_69;
    }
    if (!objc_msgSend(v30, "isOnRoute"))
    {
      if (objc_msgSend(v52, "isShieldLabel"))
      {
        v36 = objc_msgSend(v53, "isShieldLabel");
        v33 = v53;
        if ((v36 & 1) == 0)
          goto LABEL_69;
      }
LABEL_68:
      v33 = v52;
LABEL_69:
      v50 = v33;

      if (v26)
      {
        v45 = (unint64_t *)&v26->__shared_owners_;
        do
          v46 = __ldaxr(v45);
        while (__stlxr(v46 - 1, v45));
        if (!v46)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }

      if (v50 == v53)
      {

        v16 = 1;
        goto LABEL_79;
      }
      objc_msgSend(v48, "addObject:");

      goto LABEL_16;
    }
    if ((objc_msgSend(v52, "isShieldLabel") & 1) != 0 || (objc_msgSend(v53, "isShieldLabel") & 1) == 0)
    {
      if (objc_msgSend(v52, "isShieldLabel"))
      {
        v31 = objc_msgSend(v53, "isShieldLabel") ^ 1;
        v49 = v31;
      }
      else
      {
        v49 = 0;
        v31 = 0;
      }
    }
    else
    {
      v49 = 0;
      v31 = 1;
    }
    if (!objc_msgSend(v29, "isInGuidance") || objc_msgSend(v30, "isInGuidance"))
    {
      if ((objc_msgSend(v29, "isInGuidance") & 1) != 0)
      {
        if ((v31 & 1) != 0)
          goto LABEL_67;
      }
      else
      {
        v37 = objc_msgSend(v30, "isInGuidance");
        v38 = v49;
        if (v37)
          v38 = 1;
        v49 = v38;
        if (((v37 | v31) & 1) != 0)
          goto LABEL_67;
      }
      if (!objc_msgSend(v52, "isJunctionLabel") || objc_msgSend(v53, "isJunctionLabel"))
      {
        if ((objc_msgSend(v52, "isJunctionLabel") & 1) == 0)
        {
          v39 = objc_msgSend(v53, "isJunctionLabel");
          v33 = v53;
          if ((v39 & 1) != 0)
            goto LABEL_69;
        }
        if (!objc_msgSend(v29, "isStartOfRoadName")
          || objc_msgSend(v30, "isStartOfRoadName"))
        {
          if ((objc_msgSend(v29, "isStartOfRoadName") & 1) == 0)
          {
            v40 = objc_msgSend(v30, "isStartOfRoadName");
            v33 = v53;
            if ((v40 & 1) != 0)
              goto LABEL_69;
          }
          v41 = objc_msgSend(v30, "routeOffset");
          v42 = objc_msgSend(v29, "routeOffset");
          v43 = v41 < v42
             || *((float *)&v41 + 1) <= *((float *)&v42 + 1) && (_DWORD)v41 == (_DWORD)v42;
          v49 = v43;
        }
      }
    }
LABEL_67:
    v33 = v53;
    if (v49)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_77:
  v16 = 0;
LABEL_79:

LABEL_80:
  return v16;
}

- (void)styleManagerDidFinishAnimating
{
  self->_isStylesheetAnimating = 0;
}

- (void)_generateCurrentRoadSignWithContext:(NavContext *)a3
{
  int16x4_t v3;
  LabelManager *var1;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t v11;
  LabelManager *v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  gss::Allocator *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unsigned int v28;
  unsigned __int8 *v29;
  unsigned int v30;
  float *v31;
  float v32;
  int v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  int v37;
  BOOL v38;
  BOOL v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  float *v43;
  float v44;
  BOOL v45;
  unsigned int v46;
  int v47;
  int v48;
  int v49;
  __int16 v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  __shared_weak_count *cntrl;
  unint64_t *v55;
  unint64_t v56;
  shared_ptr<md::NavCurrentRoadSign> *p_currentRoadSign;
  NavCurrentRoadSign *ptr;
  float v59;
  LabelNavLayoutContext *var4;
  float v61;
  float v62;
  unint64_t *v63;
  LabelManager *v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t *v69;
  unint64_t v70;
  unsigned __int8 v76;
  unsigned __int8 v77;
  LabelManager *v78;
  double v79;
  LabelNavLayoutContext *v80;
  float v81;
  float v82;
  double v83;
  double v84;
  double v85;
  float v86;
  void *v87;
  VKLabelNavArtworkCache *artworkCache;
  NSString *v89;
  void *v90;
  void *v91;
  uint64_t *v92;
  NavCurrentRoadSign *v93;
  int v94;
  float v95;
  float v96;
  float v97;
  unint64_t *v98;
  __shared_weak_count *v99;
  unint64_t *v100;
  unint64_t v101;
  __shared_weak_count *v102;
  unint64_t *v103;
  unint64_t v104;
  std::__shared_weak_count *v105;
  uint64_t *v106;
  unint64_t v107;
  unint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  double v125;
  __int16 v126;
  RoadSignMetrics v127;
  RoadSignColoring v128;
  std::string::size_type v129;
  std::__shared_weak_count *v130;
  _BYTE v131[2];
  _BYTE v132[2];
  uint64_t v133;
  double v134;
  __int16 v135;
  void *v136[2];
  __int128 v137;

  v135 = 0;
  var1 = a3->var1;
  v8 = *((_QWORD *)var1 + 43);
  v7 = (std::__shared_weak_count *)*((_QWORD *)var1 + 44);
  if (!v7)
    goto LABEL_6;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *, SEL))v7->__on_zero_shared)(v7, a2);
    std::__shared_weak_count::__release_weak(v7);
    if (!v8)
      goto LABEL_82;
  }
  else
  {
LABEL_6:
    if (!v8)
      goto LABEL_82;
  }
  v12 = a3->var1;
  v14 = *((_QWORD *)v12 + 43);
  v13 = (std::__shared_weak_count *)*((_QWORD *)v12 + 44);
  *(_QWORD *)&v137 = v14;
  *((_QWORD *)&v137 + 1) = v13;
  if (v13)
  {
    v15 = (unint64_t *)&v13->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  memset(&v128, 0, 24);
  *(_QWORD *)&v128._fillColor._backing._e[2] = gss::Allocator::instance((gss::Allocator *)self);
  *(_QWORD *)(&v127._orientation + 7) = 0;
  *(_QWORD *)&v127._orientation = 0;
  HIBYTE(v127._scale) = 1;
  gss::StylesheetManager<gss::ScenePropertyID>::styleQueryForFeatureAttributes((unint64_t *)&v112, v14, (gss::FeatureAttributeSet *)&v128, (gss::QueryOverrides *)&v127);
  if (!BYTE6(v127._scale) && *(_QWORD *)&v127._orientation)
  {
    v18 = gss::Allocator::instance(v17);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v18 + 40))(v18, *(_QWORD *)&v127._orientation, WORD2(v127._scale));
  }
  if (*(_QWORD *)&v128._hasFillColor)
  {
    v128._fillColor._backing._e[0] = *(double *)&v128._hasFillColor;
    (*(void (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)&v128._fillColor._backing._e[2] + 40))(*(_QWORD *)&v128._fillColor._backing._e[2], *(_QWORD *)&v128._hasFillColor, *(_QWORD *)&v128._fillColor._backing._e[1] - *(_QWORD *)&v128._hasFillColor);
  }
  if (v13)
  {
    v19 = (unint64_t *)&v13->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v22 = (std::__shared_weak_count *)*((_QWORD *)&v112 + 1);
  v21 = v112;
  *(_OWORD *)&v127._orientation = v112;
  if (*((_QWORD *)&v112 + 1))
  {
    v23 = (unint64_t *)(*((_QWORD *)&v112 + 1) + 8);
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
    *(_QWORD *)&v128._fillColor._backing._e[0] = v22;
    do
      v25 = __ldxr(v23);
    while (__stxr(v25 + 1, v23));
  }
  else
  {
    v128._fillColor._backing._e[0] = 0.0;
  }
  *(_QWORD *)&v128._hasFillColor = v21;
  memset(&v128._fillColor._backing._e[1], 0, 17);
  if (v21)
    LODWORD(v21) = (*(uint64_t (**)(uint64_t, double *))(*(_QWORD *)v21 + 48))(v21, &v128._fillColor._backing._e[1]);
  LOBYTE(v128._fillColor._backing._e[3]) = v21;
  if (v22)
  {
    v26 = (unint64_t *)&v22->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
    LODWORD(v21) = LOBYTE(v128._fillColor._backing._e[3]);
  }
  if ((_DWORD)v21)
  {
    v28 = (int)*((float *)a3->var3 + 8);
    LOBYTE(v136[0]) = 1;
    v29 = *(unsigned __int8 **)(*(_QWORD *)&v128._hasFillColor + 24);
    if (v28 >= 0x17)
      v30 = 23;
    else
      v30 = v28;
    v31 = *(float **)v29;
    if (*(_QWORD *)v29
      && (v32 = *v31, LODWORD(v31) = *v31 == 1.0, v29[10])
      && (v32 != 0.0 ? (_ZF = v32 == 1.0) : (_ZF = 1), !_ZF)
      || (v34 = v29[v31 + 11], v32 = 0.0, v34 == 2))
    {
      v127._orientation = 1;
      LOBYTE(v137) = 1;
      v35 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<BOOL>(v29, v30, 0, &v127);
      v36 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<BOOL>(v29, v30, 1, &v137);
      v37 = (v127._orientation | v137) != 0;
      if (v32 < 1.0)
        v36 = v35;
    }
    else
    {
      v36 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<BOOL>(*(unsigned __int8 **)(*(_QWORD *)&v128._hasFillColor + 24), v30, v34, v136);
      v37 = LOBYTE(v136[0]);
    }
    if (v36)
      v38 = v37 == 0;
    else
      v38 = 1;
    v39 = !v38;
    self->_isCurrentRoadSignVisible = v39;
    v40 = (int)*((float *)a3->var3 + 8);
    LOBYTE(v136[0]) = 1;
    v41 = *(_QWORD *)(*(_QWORD *)&v128._hasFillColor + 24);
    if (v40 >= 0x17)
      v42 = 23;
    else
      v42 = v40;
    v43 = *(float **)v41;
    if (*(_QWORD *)v41
      && (v44 = *v43, LODWORD(v43) = *v43 == 1.0, *(_BYTE *)(v41 + 10))
      && (v44 != 0.0 ? (v45 = v44 == 1.0) : (v45 = 1), !v45)
      || (v46 = *(unsigned __int8 *)(v41 + v43 + 11), v44 = 0.0, v46 == 2))
    {
      v127._orientation = 1;
      LOBYTE(v137) = 1;
      v47 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<int>(v41, v42, 0, &v127);
      v48 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<int>(v41, v42, 1u, &v137);
      v49 = (v127._orientation | v137) != 0;
      if (v44 < 1.0)
        LOWORD(v48) = v47;
    }
    else
    {
      v48 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<int>(*(_QWORD *)(*(_QWORD *)&v128._hasFillColor + 24), v42, v46, v136);
      v49 = LOBYTE(v136[0]);
    }
    if (v49)
      v50 = v48;
    else
      v50 = v135;
    v135 = v50;
  }
  gss::QueryableLocker<gss::ScenePropertyID>::~QueryableLocker((uint64_t)&v128);
  v51 = (std::__shared_weak_count *)*((_QWORD *)&v112 + 1);
  if (*((_QWORD *)&v112 + 1))
  {
    v52 = (unint64_t *)(*((_QWORD *)&v112 + 1) + 8);
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
      if (self->_regenerateRoadSigns)
        goto LABEL_83;
      goto LABEL_89;
    }
  }
LABEL_82:
  if (self->_regenerateRoadSigns)
  {
LABEL_83:
    cntrl = self->_currentRoadSign.__cntrl_;
    self->_currentRoadSign.__ptr_ = 0;
    self->_currentRoadSign.__cntrl_ = 0;
    if (!cntrl)
      return;
    v55 = (unint64_t *)((char *)cntrl + 8);
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    goto LABEL_86;
  }
LABEL_89:
  p_currentRoadSign = &self->_currentRoadSign;
  ptr = self->_currentRoadSign.__ptr_;
  if (ptr)
  {
    v59 = *((float *)ptr + 86) - *((float *)ptr + 84);
    var4 = a3->var4;
    v61 = *((float *)var4 + 8);
    v62 = *((float *)var4 + 10);
    if (v59 > (float)(v62 - v61))
    {
      cntrl = self->_currentRoadSign.__cntrl_;
      self->_currentRoadSign.__ptr_ = 0;
      self->_currentRoadSign.__cntrl_ = 0;
      if (!cntrl)
        return;
      v63 = (unint64_t *)((char *)cntrl + 8);
      do
        v56 = __ldaxr(v63);
      while (__stlxr(v56 - 1, v63));
      goto LABEL_86;
    }
    v3.i32[0] = *((_DWORD *)var4 + 31);
    v94 = *((_DWORD *)var4 + 32);
    v95 = v59 * 0.5;
    if ((float)(*(float *)v3.i32 - v95) >= v61)
    {
      if ((float)(*(float *)v3.i32 + v95) > v62)
        *(float *)v3.i32 = v62 - v95;
    }
    else
    {
      *(float *)v3.i32 = v61 + v95;
    }
    *((_DWORD *)ptr + 75) = v3.i32[0];
    *((_DWORD *)ptr + 76) = v94;
    v3.i32[0] = *((_DWORD *)ptr + 87);
    v96 = *(float *)v3.i32 - *((float *)ptr + 85);
    v3.i16[0] = v135;
    v97 = *((float *)a3->var1 + 44) * (float)vmovl_s16(v3).i32[0];
    *((_DWORD *)ptr + 64) = 0;
    *((float *)ptr + 65) = v97 + (float)(v96 * 0.5);
    *((float *)ptr + 88) = v96 + v97;
  }
  else
  {
    if (!-[NSString length](self->_currentLocationText, "length"))
    {
      cntrl = self->_currentRoadSign.__cntrl_;
      self->_currentRoadSign.__ptr_ = 0;
      self->_currentRoadSign.__cntrl_ = 0;
      if (!cntrl)
        return;
      v98 = (unint64_t *)((char *)cntrl + 8);
      do
        v56 = __ldaxr(v98);
      while (__stlxr(v56 - 1, v98));
      goto LABEL_86;
    }
    v132[0] = 0;
    v131[0] = 0;
    GetLabelNavStyleAttributes(&v133, 3u, 1, v132, v131);
    v64 = a3->var1;
    v65 = *(std::__shared_weak_count **)&v134;
    *(_QWORD *)&v127._orientation = v133;
    v127._scale = v134;
    if (v134 != 0.0)
    {
      v66 = (unint64_t *)(*(_QWORD *)&v134 + 8);
      do
        v67 = __ldxr(v66);
      while (__stxr(v67 + 1, v66));
    }
    v68 = *((_QWORD *)v64 + 42);
    md::createFeatureAttributeSet((gss::Allocator *)&v128, (uint64_t *)&v127);
    md::LabelStyleCache::styleQueryForFeatureAttributes(&v129, (uint64_t *)(v68 + 184), (uint64_t *)&v128._hasFillColor, 0);
    a2 = *(SEL *)&v128._hasFillColor;
    if (*(_QWORD *)&v128._hasFillColor)
    {
      v128._fillColor._backing._e[0] = *(double *)&v128._hasFillColor;
      (*(void (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)&v128._fillColor._backing._e[2] + 40))(*(_QWORD *)&v128._fillColor._backing._e[2], *(_QWORD *)&v128._hasFillColor, *(_QWORD *)&v128._fillColor._backing._e[1] - *(_QWORD *)&v128._hasFillColor);
    }
    if (v65)
    {
      v69 = (unint64_t *)&v65->__shared_owners_;
      do
        v70 = __ldaxr(v69);
      while (__stlxr(v70 - 1, v69));
      if (!v70)
      {
        ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
        std::__shared_weak_count::__release_weak(v65);
      }
    }
    if (v129)
    {
      v128._gradientFillAngle = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)v128._fillColor._backing._e = _Q0;
      *(_OWORD *)&v128._fillColor._backing._e[2] = _Q0;
      memset(&v128._shadowColor, 0, 24);
      v128._shadowColor._backing._e[3] = 0.200000003;
      memset(&v128._textColor, 0, 24);
      v128._textColor._backing._e[3] = 1.0;
      v127._orientation = 0;
      *(_OWORD *)&v127._scale = _Q0;
      *(_OWORD *)&v127._arrowWeight = xmmword_19FFB4FB0;
      v127._arrowTipCornerRadius = 0.0;
      v127._arrowJoinCornerRadius = 0.0;
      v127._shadowOffset = (CGSize)*MEMORY[0x1E0C9D820];
      v127._strokeWeight = 0.0;
      v127._innerStrokeWeight = 0.0;
      v127._shadowRadius = 20.0;
      *(_OWORD *)&v127._signHeight = xmmword_19FFB4FC0;
      v127._horizontalMargin = 0.0;
      v127._verticalMargin = 0.0;
      v127._cornerRadius = 6.5;
      v127._glyphSize = v127._shadowOffset;
      v127._glyphVerticalOffset = 0.0;
      *(_QWORD *)&v128._hasFillColor = 0x1010000000001;
      __asm { FMOV            V1.2D, #6.0 }
      v112 = _Q0;
      v113 = _Q1;
      v114 = xmmword_19FFB5930;
      v115 = 0x4031000000000000;
      v116 = 0;
      v117 = 0;
      v118 = 0;
      {
        v109 = operator new();
        mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v109, "VectorKitLabels", 0x5ED09DD50000000FLL);
      }
      v119 = mdm::Allocator::instance(void)::alloc;
      v120 = 0;
      v121 = 0;
      v122 = 0;
      {
        v110 = operator new();
        mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v110, "VectorKitLabels", 0x5ED09DD50000000FLL);
      }
      v125 = 0.0;
      v123 = mdm::Allocator::instance(void)::alloc;
      v124 = 0;
      v127._orientation = 13;
      v78 = a3->var1;
      v79 = *((float *)v78 + 44);
      v127._scale = *(float *)(*((_QWORD *)v78 + 42) + 172);
      v127._contentScale = v79;
      *(double *)&v112 = v127._scale;
      *((double *)&v112 + 1) = v79;
      v126 = 1;
      v137 = 0uLL;
      v136[0] = 0;
      v136[1] = 0;
      if ((GetRoadSignMetadataForStyleQuery(v129, v130, (std::string::size_type *)v136, (uint64_t)&v128, (uint64_t)&v127, (uint64_t)&v112) & 1) != 0)
      {
        v80 = a3->var4;
        v81 = *((float *)a3->var1 + 44);
        v82 = (float)((float)((float)(*((float *)v80 + 10) - *((float *)v80 + 8)) / v81) + -32.0)
            + round(*(double *)&v112 * *(double *)&v113 * *((double *)&v112 + 1)) * -2.0;
        v83 = v82;
        v84 = round(*(double *)&v112 * *((double *)&v114 + 1) * *((double *)&v112 + 1));
        v85 = v84 + v84;
        if (v85 <= v83)
        {
          LOWORD(v85) = v135;
          v86 = round(v127._scale * v127._signHeight * v127._contentScale) / v81;
          if ((float)(v86 + (float)((float)vmovl_s16(*(int16x4_t *)&v85).i32[0] * 2.0)) < (float)((float)(*((float *)v80 + 11) - *((float *)v80 + 9))
                                                                                                 / v81))
          {
            v125 = v83;
            -[LabelNavRouteLabeler currentLocationText](self, "currentLocationText");
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            if (v87)
            {
              artworkCache = (VKLabelNavArtworkCache *)self->_artworkCache;
              -[LabelNavRouteLabeler currentLocationText](self, "currentLocationText");
              v89 = (NSString *)objc_claimAutoreleasedReturnValue();
              VKLabelNavArtworkCache::getRoadSignArtwork(artworkCache, v89, &v127, &v128, (const md::RoadSignTextMetrics *)&v112);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              v136[0] = v90;

              if (v90)
              {
                -[LabelNavRouteLabeler currentLocationText](self, "currentLocationText");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                v92 = (uint64_t *)((char *)a3->var4 + 124);
                v111 = *((_DWORD *)a3->var1 + 44);
                std::make_shared[abi:nn180100]<md::NavCurrentRoadSign,NSString * {__strong},std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>> &,gm::Matrix<float,2,1> const&,float,VKRoadSignArtwork * {__strong}&,short &,void>((uint64_t)&v137, v91, v129, v130, v92, (float *)&v111, v136, &v135);
                std::shared_ptr<md::LabelFeature>::operator=[abi:nn180100]((uint64_t)p_currentRoadSign, &v137);
                std::shared_ptr<esl::QuartzContext>::~shared_ptr[abi:ne180100]((uint64_t)&v137);

                v93 = p_currentRoadSign->__ptr_;
                *((_BYTE *)v93 + 264) = 0;
                *((_BYTE *)v93 + 265) = *((float *)v93 + 67) != 1.0;

              }
            }
          }
        }
      }
      else
      {
        v102 = self->_currentRoadSign.__cntrl_;
        self->_currentRoadSign.__ptr_ = 0;
        self->_currentRoadSign.__cntrl_ = 0;
        if (v102)
        {
          v103 = (unint64_t *)((char *)v102 + 8);
          do
            v104 = __ldaxr(v103);
          while (__stlxr(v104 - 1, v103));
          if (!v104)
          {
            (*(void (**)(__shared_weak_count *))(*(_QWORD *)v102 + 16))(v102);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v102);
          }
        }
      }
      if (SHIBYTE(v122) < 0)
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v123 + 40))(v123, v120, v122 & 0x7FFFFFFFFFFFFFFFLL);
      if (SHIBYTE(v118) < 0)
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v119 + 40))(v119, v116, v118 & 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      v99 = self->_currentRoadSign.__cntrl_;
      self->_currentRoadSign.__ptr_ = 0;
      self->_currentRoadSign.__cntrl_ = 0;
      if (v99)
      {
        v100 = (unint64_t *)((char *)v99 + 8);
        do
          v101 = __ldaxr(v100);
        while (__stlxr(v101 - 1, v100));
        if (!v101)
        {
          (*(void (**)(__shared_weak_count *))(*(_QWORD *)v99 + 16))(v99);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v99);
        }
      }
    }
    v105 = v130;
    if (v130)
    {
      v106 = &v130->__shared_owners_;
      do
        v107 = __ldaxr((unint64_t *)v106);
      while (__stlxr(v107 - 1, (unint64_t *)v106));
      if (!v107)
      {
        ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
        std::__shared_weak_count::__release_weak(v105);
      }
    }
    cntrl = *(__shared_weak_count **)&v134;
    if (v134 != 0.0)
    {
      v108 = (unint64_t *)(*(_QWORD *)&v134 + 8);
      do
        v56 = __ldaxr(v108);
      while (__stlxr(v56 - 1, v108));
LABEL_86:
      if (!v56)
      {
        (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
  }
}

- (RoadSignOrientationResolver)createRoadSignOrientationResolver:(id)a3 navContext:(NavContext *)a4
{
  uint64_t v4;
  uint64_t v6;
  int v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  RoadSignOrientationResolver result;

  v6 = v4;
  v12 = a3;
  v7 = objc_msgSend(v12, "roadSignAlignment");
  v8 = objc_msgSend(v12, "roadSignAlignment");
  v9 = 584;
  if (v7 == 7)
    v9 = 560;
  *(_QWORD *)v6 = (char *)self + v9;
  *(_DWORD *)(v6 + 8) = 1035122883;
  *(_BYTE *)(v6 + 12) = v8;

  result.var1 = (Unit<geo::RadianUnitDescription, float>)v11;
  result.var2 = BYTE4(v11);
  result.var0 = v10;
  return result;
}

- (unsigned)resolveOrientation:(NavContext *)a3 road:(id)a4 currentOrientation:(unsigned __int8)a5
{
  id v7;
  float v8;
  float v9;
  float v10;
  float v11;
  __float2 v12;
  float v13;
  float v14;
  float v15;
  float v16;
  unsigned __int8 v17;
  float v18;
  float v19;
  float *v20;
  float *v21;
  unint64_t v22;
  float *v23;
  float *v24;
  float *v25;
  BOOL v26;
  unint64_t v27;
  float *v28;
  float *v29;
  uint64_t v30;
  float *v31;
  float *v33;
  float v34;
  float v35;
  BOOL v36;
  float v37;
  unint64_t v40;
  _QWORD *v41;
  float v42;
  unsigned __int8 v43;

  v7 = a4;
  -[LabelNavRouteLabeler createRoadSignOrientationResolver:navContext:](self, "createRoadSignOrientationResolver:navContext:", v7, a3);
  objc_msgSend(v7, "direction2D");
  v9 = v8;
  v11 = v10;
  v40 = __PAIR64__(LODWORD(v10), LODWORD(v8));
  v12 = __sincosf_stret(*((float *)a3->var3 + 105));
  if (v40 && *(_QWORD *)&v12)
  {
    v13 = atan2f(v11, v9);
    v14 = atan2f(v12.__sinval, v12.__cosval);
    v15 = fmodf((float)(3.1416 - v13) + v14, 6.2832);
    v16 = fmodf(v15 + 6.2832, 6.2832) + -3.1416;
    if (v16 < 0.0)
      v16 = v16 + 6.28318531;
  }
  else
  {
    v16 = 0.0;
  }
  v17 = v43;
  v18 = fmodf(v16, 6.2832);
  v19 = fmodf(v18 + 6.2832, 6.2832);
  v20 = (float *)(v41 + 1);
  v21 = (float *)*v41;
  if ((_QWORD *)*v41 != v41 + 1)
  {
    v22 = 0;
    v23 = (float *)*v41;
    do
    {
      v24 = (float *)*((_QWORD *)v23 + 1);
      if (v24)
      {
        do
        {
          v25 = v24;
          v24 = *(float **)v24;
        }
        while (v24);
      }
      else
      {
        do
        {
          v25 = (float *)*((_QWORD *)v23 + 2);
          v26 = *(_QWORD *)v25 == (_QWORD)v23;
          v23 = v25;
        }
        while (!v26);
      }
      ++v22;
      v23 = v25;
    }
    while (v25 != v20);
    do
    {
      v27 = v22 >> 1;
      v28 = v21;
      if (v22 != 1)
      {
        v30 = v22 >> 1;
        v31 = v21;
        do
        {
          v33 = (float *)*((_QWORD *)v31 + 1);
          if (v33)
          {
            do
            {
              v28 = v33;
              v33 = *(float **)v33;
            }
            while (v33);
          }
          else
          {
            do
            {
              v28 = (float *)*((_QWORD *)v31 + 2);
              v26 = *(_QWORD *)v28 == (_QWORD)v31;
              v31 = v28;
            }
            while (!v26);
          }
          v31 = v28;
        }
        while (v30-- > 1);
      }
      if (v19 >= v28[8])
      {
        v29 = (float *)*((_QWORD *)v28 + 1);
        if (v29)
        {
          do
          {
            v21 = v29;
            v29 = *(float **)v29;
          }
          while (v29);
        }
        else
        {
          do
          {
            v21 = (float *)*((_QWORD *)v28 + 2);
            v26 = *(_QWORD *)v21 == (_QWORD)v28;
            v28 = v21;
          }
          while (!v26);
        }
        v27 = v22 + ~v27;
      }
      v22 = v27;
    }
    while (v27);
  }
  if (v21 != v20)
  {
    v34 = v21[7];
    v35 = v21[8];
    v36 = v19 >= v34 && v19 < v35;
    if (v36 && !*((_BYTE *)v21 + 36))
    {
      v37 = v35 - v42;
      if ((float)(v42 + v34) <= v19 && v37 >= v19)
      {
        if (v43 - 1 > 0xC)
          v17 = 0;
        else
          v17 = byte_19FFB8C0C[(v43 - 1)];
      }
    }
  }

  return v17;
}

- (unsigned)orientationForRoadSign:(id)a3 roadLabel:(id)a4 navContext:(NavContext *)a5
{
  id v8;
  id v9;
  unsigned __int8 v10;
  double v11;
  unsigned __int8 v12;
  unsigned int v14;
  float v15;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "isAwayFromRoute") || objc_msgSend(v8, "roadSignAlignment") == 3)
  {
    if ((objc_msgSend(v8, "isAwayFromRoute") & 1) == 0 && objc_msgSend(v8, "roadSignAlignment") != 3)
    {
      v10 = -[LabelNavRouteLabeler resolveOrientation:road:currentOrientation:](self, "resolveOrientation:road:currentOrientation:", a5, v8, objc_msgSend(v9, "alignment"));
LABEL_11:
      v12 = v10;
      goto LABEL_12;
    }
LABEL_10:
    v10 = objc_msgSend(v9, "alignment");
    goto LABEL_11;
  }
  v15 = 0.0;
  if (!-[VKLabelNavRoadGraph collideRouteWithLabel:routeCrossProduct:context:](self->_roadGraph, "collideRouteWithLabel:routeCrossProduct:context:", v9, &v15, a5))goto LABEL_10;
  v11 = v15;
  if (v15 >= 0.1 && v11 <= -0.1)
  {
    v10 = objc_msgSend(v8, "roadSignAlignment");
    goto LABEL_11;
  }
  v14 = objc_msgSend(v8, "roadSignAlignment", v11) - 1;
  if (v14 > 0xC)
    v12 = 0;
  else
    v12 = byte_19FFB8C0C[v14];
LABEL_12:

  return v12;
}

- (void)layoutWithNavContext:(NavContext *)a3 avoidanceRects:(const void *)a4
{
  vector<std::shared_ptr<md::NavLabel>, geo::StdAllocator<std::shared_ptr<md::NavLabel>, mdm::Allocator>> *p_activeSigns;
  char *v6;
  char *begin;
  char *i;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  vector<std::shared_ptr<md::NavLabel>, geo::StdAllocator<std::shared_ptr<md::NavLabel>, mdm::Allocator>> *p_visibleSigns;
  char *v13;
  char *j;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  LabelNavRouteLabeler *v18;
  MapNavLabeler *var2;
  NavCurrentRoadSign *ptr;
  uint64_t v21;
  NavCurrentRoadSign *v22;
  __shared_weak_count *cntrl;
  unint64_t *v24;
  unint64_t v25;
  _QWORD *end;
  _OWORD *v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t *v30;
  char v31;
  NavContext *v32;
  LabelNavLayoutContext *var4;
  double v34;
  int64x2_t v35;
  BOOL v37;
  double v38;
  LabelLayoutContext *var3;
  double v40;
  float32x2_t v41;
  float v42;
  float v43;
  float v44;
  float v45;
  double v46;
  float v47;
  double v48;
  double v49;
  double v50;
  long double v52;
  long double v53;
  long double v54;
  long double v60;
  long double v61;
  double v62;
  BOOL v63;
  int v64;
  float minSignOffsetDistance;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  _OWORD *v69;
  void *v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  unint64_t *v74;
  unint64_t v75;
  NSMutableArray *v76;
  NSMutableArray *visibleLabels;
  int v78;
  id v79;
  uint64_t v80;
  void *m;
  id v82;
  void *v83;
  void *v84;
  LabelNavRouteLabeler *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  unint64_t *v91;
  unint64_t v92;
  _OWORD *v93;
  _BOOL4 v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  unint64_t *v99;
  unint64_t v100;
  _OWORD *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  NSString *currentRoadName;
  void *v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t n;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _QWORD *v124;
  uint64_t v125;
  unint64_t *v126;
  unint64_t v127;
  _OWORD *v128;
  int v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  unint64_t *v133;
  unint64_t v134;
  _OWORD *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD *v139;
  uint64_t v140;
  unint64_t *v141;
  unint64_t v142;
  _OWORD *v143;
  NSMutableDictionary *visibleLabelsByName;
  void *v145;
  LabelNavRouteLabeler *v146;
  uint64_t v147;
  _QWORD *v148;
  uint64_t v149;
  unint64_t *v150;
  unint64_t v151;
  _OWORD *v152;
  void *v153;
  NSMutableSet *visibleShieldGroups;
  void *v155;
  int v156;
  unint64_t *p_countVisibleOffRouteRoadSigns;
  uint64_t v158;
  LabelNavRouteLabeler *v159;
  NSMutableArray *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t ii;
  void *v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t jj;
  void *v169;
  LabelNavRouteLabeler *v170;
  unint64_t v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t kk;
  id v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t mm;
  void *v181;
  unsigned int index;
  unsigned int v183;
  void *v184;
  void *v185;
  uint64_t v186;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::shared_ptr<md::LabelTile>, void *> *>, geo::StdAllocator<std::__hash_node<std::shared_ptr<md::LabelTile>, void *>, mdm::Allocator>> *p_p1;
  double *v188;
  float64x2_t v190;
  double *v195;
  double *v196;
  double *v197;
  unint64_t nn;
  void *v199;
  uint64_t v200;
  uint64_t i1;
  id v202;
  void *v203;
  unint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t i2;
  void *v208;
  _QWORD *v209;
  _QWORD *v210;
  std::__shared_weak_count *v211;
  unint64_t *v212;
  unint64_t v213;
  NavCurrentRoadSign *v214;
  __shared_weak_count *v215;
  unint64_t *v216;
  unint64_t v217;
  void *v218;
  unint64_t v219;
  _BOOL4 v220;
  unint64_t countVisibleRoadSigns;
  unint64_t v222;
  _OWORD *v223;
  unint64_t *v224;
  unint64_t v225;
  Allocator *allocator;
  unint64_t *v227;
  unint64_t v228;
  _QWORD *next;
  uint64_t v230;
  std::__shared_weak_count *v231;
  unint64_t *v232;
  unint64_t v233;
  std::__shared_weak_count *v234;
  float64x2_t v235;
  unint64_t *v236;
  unint64_t v237;
  float64x2_t v238;
  BOOL v239;
  BOOL v240;
  BOOL v241;
  double *v243;
  double *v244;
  double *v245;
  unint64_t v246;
  void *v247;
  void *v248;
  _BOOL4 v249;
  int v250;
  void *v251;
  uint64_t v252;
  unint64_t v253;
  void *v255;
  int v256;
  id v257;
  uint64_t v258;
  NSMutableArray *v259;
  NSMutableArray *v260;
  id obj;
  uint64_t v262;
  id v263;
  id v264;
  id v265;
  md::NavContext *v267;
  float64x2_t v269;
  int v270;
  float64x2_t v271;
  id v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  double v310;
  int64x2_t v311;
  char v312;
  _BYTE v313[128];
  _BYTE v314[128];
  _BYTE v315[128];
  _BYTE v316[128];
  _BYTE v317[128];
  _BYTE v318[128];
  _BYTE v319[128];
  _BYTE v320[128];
  _BYTE v321[128];
  uint64_t v322;

  v322 = *MEMORY[0x1E0C80C00];
  begin = (char *)self->_activeSigns.__begin_;
  p_activeSigns = &self->_activeSigns;
  v6 = begin;
  LOBYTE(p_activeSigns[-6].__end_) = 0;
  v258 = (uint64_t)p_activeSigns;
  for (i = (char *)p_activeSigns->__end_; i != v6; i -= 16)
  {
    v9 = (std::__shared_weak_count *)*((_QWORD *)i - 1);
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *, SEL))v9->__on_zero_shared)(v9, a2);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  p_visibleSigns = &self->_visibleSigns;
  v13 = (char *)self->_visibleSigns.__begin_;
  self->_activeSigns.__end_ = v6;
  for (j = (char *)self->_visibleSigns.__end_; j != v13; j -= 16)
  {
    v15 = (std::__shared_weak_count *)*((_QWORD *)j - 1);
    if (v15)
    {
      v16 = (unint64_t *)&v15->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *, SEL))v15->__on_zero_shared)(v15, a2);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  v18 = self;
  self->_visibleSigns.__end_ = v13;
  if (self->_isOnRoute
    || (var2 = a3->var2,
        (unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)var2 + 3) + 336) + 163) << 16 == 393216)
    || (*(unsigned int (**)(MapNavLabeler *, SEL))(*(_QWORD *)var2 + 376))(var2, a2))
  {
    -[LabelNavRouteLabeler _generateCurrentRoadSignWithContext:](self, "_generateCurrentRoadSignWithContext:", a3);
    ptr = self->_currentRoadSign.__ptr_;
    if (!ptr || !self->_isCurrentRoadSignVisible)
      goto LABEL_42;
    md::NavLabel::layoutForStagingWithNavContext((md::NavLabel *)self->_currentRoadSign.__ptr_, (md::NavContext *)a3);
    *((_DWORD *)ptr + 81) = *((_DWORD *)ptr + 74);
    *((_QWORD *)ptr + 41) = *(_QWORD *)((char *)ptr + 300);
    if (*((_BYTE *)ptr + 280))
    {
      *((_DWORD *)ptr + 67) = *((_DWORD *)ptr + 69);
      *((_BYTE *)ptr + 280) = 0;
    }
    v21 = *((_QWORD *)ptr + 36);
    if (v21)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 968))(v21);
    md::NavLabel::layoutForDisplayWithNavContext((float32x2_t *)ptr, (float64x2_t **)a3);
    v22 = self->_currentRoadSign.__ptr_;
    cntrl = self->_currentRoadSign.__cntrl_;
    v311.i64[0] = (uint64_t)v22;
    v311.i64[1] = (uint64_t)cntrl;
    if (cntrl)
    {
      v24 = (unint64_t *)((char *)cntrl + 8);
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
    }
    end = self->_visibleSigns.__end_;
    if (end >= self->_visibleSigns.__end_cap_.__value_)
    {
      v27 = std::vector<std::shared_ptr<md::RouteAnnotationLabelFeature>,geo::StdAllocator<std::shared_ptr<md::RouteAnnotationLabelFeature>,mdm::Allocator>>::__emplace_back_slow_path<std::shared_ptr<md::RouteAnnotationLabelFeature>>((uint64_t)p_visibleSigns, (uint64_t)&v311);
      cntrl = (__shared_weak_count *)v311.i64[1];
      self->_visibleSigns.__end_ = v27;
      if (!cntrl)
        goto LABEL_42;
    }
    else
    {
      if (end)
      {
        *end = v22;
        end[1] = cntrl;
        v311 = 0uLL;
        cntrl = 0;
      }
      self->_visibleSigns.__end_ = end + 2;
      if (!cntrl)
      {
LABEL_42:
        if (self->_tiles.__table_.__p2_.__value_)
          goto LABEL_43;
        goto LABEL_309;
      }
    }
    v28 = (unint64_t *)((char *)cntrl + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
  }
  else
  {
    cntrl = self->_currentRoadSign.__cntrl_;
    self->_currentRoadSign.__ptr_ = 0;
    self->_currentRoadSign.__cntrl_ = 0;
    if (!cntrl)
      goto LABEL_42;
    v30 = (unint64_t *)((char *)cntrl + 8);
    do
      v29 = __ldaxr(v30);
    while (__stlxr(v29 - 1, v30));
  }
  if (v29)
    goto LABEL_42;
  (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  if (self->_tiles.__table_.__p2_.__value_)
  {
LABEL_43:
    if (&self->_avoidanceRects != a4)
      std::vector<md::AvoidanceRectWithPriority,geo::StdAllocator<md::AvoidanceRectWithPriority,mdm::Allocator>>::__assign_with_size[abi:nn180100]<md::AvoidanceRectWithPriority*,md::AvoidanceRectWithPriority*>((uint64_t)&self->_avoidanceRects, *(__int128 **)a4, *((__int128 **)a4 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3));
    if (self->_disableTileParseForOneLayout
      || -[VKPolylineOverlay isSnappingForSceneTiles](self->_route, "isSnappingForSceneTiles"))
    {
      v31 = 1;
    }
    else
    {
      if (self->_checkIfRouteSubrangeChanged)
      {
        if (-[LabelNavRouteLabeler _updateActiveRouteRange](self, "_updateActiveRouteRange"))
          -[LabelNavRouteLabeler _reloadRouteJunctions](self, "_reloadRouteJunctions");
        self->_checkIfRouteSubrangeChanged = 0;
      }
      if (self->_useRouteSubrange && self->_isOnRoute)
      {
        index = self->_routeUserOffset.index;
        v183 = self->_routeSubrangeEnd.index;
        if (index >= v183 && (index != v183 || self->_routeUserOffset.offset > self->_routeSubrangeEnd.offset))
        {
          -[LabelNavRouteLabeler _updateActiveRouteRange](self, "_updateActiveRouteRange");
          -[LabelNavRouteLabeler _reloadRouteJunctions](self, "_reloadRouteJunctions");
        }
      }
      self->_hasPendingTilesInSnappingRegion = 0;
      -[VKPolylineOverlay routeRibbon](self->_route, "routeRibbon");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "renderRegion");
      v185 = (void *)objc_claimAutoreleasedReturnValue();

      if (v185)
      {
        v186 = objc_msgSend(v185, "snappingRegion");
        p_p1 = &self->_pendingTiles.__table_.__p1_;
        v188 = (double *)(v186 + 8);
        __asm { FMOV            V6.2D, #0.5 }
        v271 = _Q6;
        do
        {
LABEL_262:
          p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::shared_ptr<md::LabelTile>, void *> *>, geo::StdAllocator<std::__hash_node<std::shared_ptr<md::LabelTile>, void *>, mdm::Allocator>> *)p_p1->__value_.__next_;
          if (!p_p1)
          {
            self->_hasPendingTilesInSnappingRegion = 0;
            goto LABEL_389;
          }
          v190 = vmlaq_f64(*(float64x2_t *)((char *)p_p1[1].__value_.__next_ + 312), _Q6, vsubq_f64(*(float64x2_t *)((char *)p_p1[1].__value_.__next_ + 328), *(float64x2_t *)((char *)p_p1[1].__value_.__next_ + 312)));
        }
        while (v190.f64[0] < *(double *)(v186 + 24)
             || v190.f64[0] >= *(double *)(v186 + 40)
             || v190.f64[1] < *(double *)(v186 + 32)
             || v190.f64[1] >= *(double *)(v186 + 48)
             || *(_QWORD *)v186 == (_QWORD)v188);
        v195 = *(double **)v186;
        while (v190.f64[0] < v195[4] || v190.f64[0] >= v195[6] || v190.f64[1] < v195[5] || v190.f64[1] >= v195[7])
        {
          v196 = (double *)*((_QWORD *)v195 + 1);
          if (v196)
          {
            do
            {
              v197 = v196;
              v196 = *(double **)v196;
            }
            while (v196);
          }
          else
          {
            do
            {
              v197 = (double *)*((_QWORD *)v195 + 2);
              _ZF = *(_QWORD *)v197 == (_QWORD)v195;
              v195 = v197;
            }
            while (!_ZF);
          }
          v195 = v197;
          if (v197 == v188)
          {
            _Q6 = v271;
            goto LABEL_262;
          }
        }
        allocator = p_p1[1].__value__2._allocator;
        *(_QWORD *)&v309 = p_p1[1].__value_.__next_;
        *((_QWORD *)&v309 + 1) = allocator;
        if (allocator)
        {
          v227 = (unint64_t *)((char *)allocator + 8);
          do
            v228 = __ldxr(v227);
          while (__stxr(v228 + 1, v227));
        }
        -[LabelNavRouteLabeler _addJunctionsForTile:](self, "_addJunctionsForTile:", &v309);
        -[VKLabelNavRoadGraph routeJunctionsHaveChanged](self->_roadGraph, "routeJunctionsHaveChanged");
        next = p_p1->__value_.__next_;
        std::__hash_table<std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,std::__unordered_map_hasher<geo::QuadTile,std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,geo::QuadTileHash,std::equal_to<geo::QuadTile>,true>,std::__unordered_map_equal<geo::QuadTile,std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,std::equal_to<geo::QuadTile>,geo::QuadTileHash,true>,geo::StdAllocator<std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,mdm::Allocator>>::remove((uint64_t)&v311, &self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_, p_p1);
        v230 = v311.i64[0];
        v311.i64[0] = 0;
        if (v230)
        {
          if (v312)
          {
            v231 = *(std::__shared_weak_count **)(v230 + 24);
            if (v231)
            {
              v232 = (unint64_t *)&v231->__shared_owners_;
              do
                v233 = __ldaxr(v232);
              while (__stlxr(v233 - 1, v232));
              if (!v233)
              {
                ((void (*)(std::__shared_weak_count *))v231->__on_zero_shared)(v231);
                std::__shared_weak_count::__release_weak(v231);
              }
            }
          }
          (*(void (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)v311.i64[1] + 40))(*(_QWORD *)v311.i64[1], v230, 32);
        }
        v234 = (std::__shared_weak_count *)*((_QWORD *)&v309 + 1);
        v235 = v271;
        if (*((_QWORD *)&v309 + 1))
        {
          v236 = (unint64_t *)(*((_QWORD *)&v309 + 1) + 8);
          do
            v237 = __ldaxr(v236);
          while (__stlxr(v237 - 1, v236));
          if (!v237)
          {
            ((void (*)(std::__shared_weak_count *))v234->__on_zero_shared)(v234);
            std::__shared_weak_count::__release_weak(v234);
            v235 = v271;
          }
        }
        self->_hasPendingTilesInSnappingRegion = 0;
        if (next)
        {
          while (1)
          {
            v238 = vmlaq_f64(*(float64x2_t *)(next[2] + 312), v235, vsubq_f64(*(float64x2_t *)(next[2] + 328), *(float64x2_t *)(next[2] + 312)));
            v239 = v238.f64[0] >= *(double *)(v186 + 24) && v238.f64[0] < *(double *)(v186 + 40);
            v240 = !v239 || v238.f64[1] < *(double *)(v186 + 32);
            v241 = !v240 && v238.f64[1] < *(double *)(v186 + 48);
            if (v241 && *(_QWORD *)v186 != (_QWORD)v188)
              break;
LABEL_361:
            next = (_QWORD *)*next;
            v235 = v271;
            if (!next)
              goto LABEL_389;
          }
          v243 = *(double **)v186;
          while (v238.f64[0] < v243[4] || v238.f64[0] >= v243[6] || v238.f64[1] < v243[5] || v238.f64[1] >= v243[7])
          {
            v244 = (double *)*((_QWORD *)v243 + 1);
            if (v244)
            {
              do
              {
                v245 = v244;
                v244 = *(double **)v244;
              }
              while (v244);
            }
            else
            {
              do
              {
                v245 = (double *)*((_QWORD *)v243 + 2);
                _ZF = *(_QWORD *)v245 == (_QWORD)v243;
                v243 = v245;
              }
              while (!_ZF);
            }
            v243 = v245;
            if (v245 == v188)
              goto LABEL_361;
          }
          self->_hasPendingTilesInSnappingRegion = 1;
        }
      }
LABEL_389:

      v31 = 0;
      v18 = self;
    }
    if (v18->_hasPendingTilesInSnappingRegion)
      v31 = 1;
    v18->_needsLayout |= v31;
    v18->_disableTileParseForOneLayout = 0;
    v32 = a3;
    var4 = a3->var4;
    v309 = *((_OWORD *)var4 + 6);
    v34 = *((double *)var4 + 14);
    v310 = v34;
    v35 = vdupq_n_s64(0x7FF8000000000000uLL);
    v311 = v35;
    _ZF = (_QWORD)v309 == v35.i64[0] && *((_QWORD *)&v309 + 1) == v35.i64[1];
    v37 = _ZF && *(_QWORD *)&v34 == 0x7FF8000000000000;
    v38 = 0.0;
    if (!v37)
    {
      var3 = a3->var3;
      if (*((_BYTE *)var3 + 8))
      {
        v40 = *((double *)var3 + 19);
        if (v40 > 0.0)
        {
          v41 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)var3 + 60), *((float64x2_t *)var3 + 54), *(double *)&v309), *((float64x2_t *)var3 + 56), *((double *)&v309 + 1)), *((float64x2_t *)var3 + 58), v310), 1.0/ (*((double *)var3 + 123)+ *((double *)var3 + 111) * *(double *)&v309+ *((double *)var3 + 115) * *((double *)&v309 + 1)+ *((double *)var3 + 119) * v310)));
          v42 = v41.f32[0] + -100.0;
          v43 = *((float *)var3 + 266);
          v44 = *((float *)var3 + 267);
          v45 = (float)(v41.f32[1] / v44) + -0.5;
          v46 = *((double *)var3 + 35);
          v47 = *((double *)var3 + 33) * v46;
          v48 = (float)((float)((float)((float)(v42 / v43) + -0.5) - *((float *)var3 + 104)) * v47);
          v49 = (float)((float)(v45 * (float)(v44 * v47)) / v43);
          v50 = *((double *)var3 + 22) * v46 + *((double *)var3 + 25) * v48 + *((double *)var3 + 28) * v49;
          if (v50 <= 0.0)
          {
            v269 = vmlaq_n_f64(*(float64x2_t *)((char *)var3 + 136), vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*((float64x2_t *)var3 + 13), v49), *(float64x2_t *)((char *)var3 + 184), v48), *((float64x2_t *)var3 + 10), v46), v40 / -v50);
            _D8 = 0x401921FB54442D18;
            v52 = *(double *)&v309 * 6.28318531;
            v53 = exp(*((double *)&v309 + 1) * 6.28318531 + -3.14159265);
            atan(v53);
            v54 = fmod(v52, 6.28318531);
            fmod(v54 + 6.28318531, 6.28318531);
            _V0.D[1] = v269.f64[1];
            __asm { FMLA            D10, D8, V0.D[1] }
            v60 = exp(_D10);
            atan(v60);
            v61 = fmod(6.28318531 * v269.f64[0], 6.28318531);
            fmod(v61 + 6.28318531, 6.28318531);
            GEOCalculateDistanceHighPrecision();
            v38 = v62 * 0.01;
            v32 = a3;
            v18 = self;
          }
        }
      }
    }
    v63 = v18->_regenerateRoadSigns && !v18->_isStylesheetAnimating;
    v64 = v63;
    if (!v18->_isStylesheetAnimating && v38 > 0.0)
    {
      v38 = v38
          * (float)((float)((float)((float)(*(float *)(*((_QWORD *)v32->var1 + 42) + 172) * 13.0) + 7.0)
                          + (float)(*((float *)v32->var4 + 30) * 0.5))
                  * *((float *)v32->var1 + 44));
      *(float *)&v38 = v38;
      if (*(float *)&v38 < 100.0)
      {
        minSignOffsetDistance = v18->_minSignOffsetDistance;
        if (minSignOffsetDistance < *(float *)&v38
          || (*(float *)&v38 = *(float *)&v38 + 2.0, minSignOffsetDistance > *(float *)&v38))
        {
          v18->_minSignOffsetDistance = *(float *)&v38;
          v64 = 1;
        }
      }
    }
    v18->_countVisibleOnRouteRoadSigns = 0;
    v18->_countVisibleOffRouteRoadSigns = 0;
    v18->_countVisibleRoadSigns = 0;
    -[VKLabelNavRoadGraph startingLabelLayoutWithContext:routeUserOffset:](v18->_roadGraph, "startingLabelLayoutWithContext:routeUserOffset:", a3, *(_QWORD *)&v18->_routeUserOffset, v38);
    v255 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_fadingLabels);
    v256 = v64;
    -[NSMutableArray removeAllObjects](self->_fadingLabels, "removeAllObjects");
    v307 = 0u;
    v308 = 0u;
    v305 = 0u;
    v306 = 0u;
    obj = v255;
    v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v305, v321, 16);
    if (v66)
    {
      v67 = *(_QWORD *)v306;
      do
      {
        for (k = 0; k != v66; ++k)
        {
          if (*(_QWORD *)v306 != v67)
            objc_enumerationMutation(obj);
          v70 = *(void **)(*((_QWORD *)&v305 + 1) + 8 * k);
          if (*(float *)(*(_QWORD *)objc_msgSend(v70, "label") + 268) != 0.0)
          {
            if (*(_BYTE *)(*(_QWORD *)objc_msgSend(v70, "label") + 264))
            {
              objc_msgSend(v70, "layoutWithNavContext:", a3);
              if (*(_BYTE *)(*(_QWORD *)objc_msgSend(v70, "label") + 327))
              {
                -[NSMutableArray addObject:](self->_fadingLabels, "addObject:", v70);
                v71 = objc_msgSend(v70, "label");
                v72 = self->_activeSigns.__end_;
                if (v72 >= self->_activeSigns.__end_cap_.__value_)
                {
                  v69 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v258, (__int128 *)v71);
                }
                else
                {
                  if (v72)
                  {
                    *v72 = *(_QWORD *)v71;
                    v73 = *(_QWORD *)(v71 + 8);
                    v72[1] = v73;
                    if (v73)
                    {
                      v74 = (unint64_t *)(v73 + 8);
                      do
                        v75 = __ldxr(v74);
                      while (__stxr(v75 + 1, v74));
                    }
                  }
                  v69 = v72 + 2;
                }
                self->_activeSigns.__end_ = v69;
              }
            }
          }
        }
        v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v305, v321, 16);
      }
      while (v66);
    }

    v259 = self->_visibleLabels;
    v76 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](v259, "count"));
    visibleLabels = self->_visibleLabels;
    self->_visibleLabels = v76;

    -[NSMutableDictionary removeAllObjects](self->_visibleLabelsByName, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_visibleShieldGroups, "removeAllObjects");
    v257 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v78 = v256;
    v79 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v303 = 0u;
    v304 = 0u;
    v301 = 0u;
    v302 = 0u;
    v260 = v259;
    v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v260, "countByEnumeratingWithState:objects:count:", &v301, v320, 16);
    if (v80)
    {
      v262 = *(_QWORD *)v302;
      do
      {
        v263 = (id)v80;
        for (m = 0; m != v263; m = (char *)m + 1)
        {
          if (*(_QWORD *)v302 != v262)
            objc_enumerationMutation(v260);
          v82 = *(id *)(*((_QWORD *)&v301 + 1) + 8 * (_QWORD)m);
          objc_msgSend(v82, "navFeature");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v270 = *(unsigned __int8 *)(*(_QWORD *)objc_msgSend(v82, "label") + 27);
          objc_msgSend(v82, "navFeature");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v84, "isValid") & 1) == 0)
          {

            goto LABEL_207;
          }
          if (*(float *)(*(_QWORD *)objc_msgSend(v82, "label") + 268) == 0.0)
          {
            v94 = *(_BYTE *)(*(_QWORD *)objc_msgSend(v82, "label") + 264) == 0;

            if (!v94)
              goto LABEL_207;
          }
          else
          {

          }
          v85 = self;
          if (self->_regenerateRoadSigns)
          {
            if (objc_msgSend(v82, "isRoadLabel"))
            {
              objc_msgSend(v82, "navFeature");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = *(_QWORD *)objc_msgSend(v82, "label");
              *(_BYTE *)(v87 + 264) = 1;
              *(_BYTE *)(v87 + 265) = *(float *)(v87 + 268) != 0.0;
              -[NSMutableArray addObject:](self->_fadingLabels, "addObject:", v82);
              v88 = objc_msgSend(v82, "label");
              v89 = self->_activeSigns.__end_;
              if (v89 >= self->_activeSigns.__end_cap_.__value_)
              {
                v93 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v258, (__int128 *)v88);
              }
              else
              {
                if (v89)
                {
                  *v89 = *(_QWORD *)v88;
                  v90 = *(_QWORD *)(v88 + 8);
                  v89[1] = v90;
                  if (v90)
                  {
                    v91 = (unint64_t *)(v90 + 8);
                    do
                      v92 = __ldxr(v91);
                    while (__stxr(v92 + 1, v91));
                  }
                }
                v93 = v89 + 2;
              }
              self->_activeSigns.__end_ = v93;
              objc_msgSend(v86, "recreateRoadSignWithAlignment:navContext:artworkCache:", objc_msgSend(v82, "alignment"), a3, self->_artworkCache);
              objc_msgSend(v86, "labelWithType:", 0);
              v102 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v102, "navFeature");
              v103 = objc_claimAutoreleasedReturnValue();
LABEL_122:
              v104 = (void *)v103;

              v83 = v104;
              v82 = v102;
              v85 = self;
              goto LABEL_123;
            }
            if (self->_regenerateRoadSigns && objc_msgSend(v82, "isShieldLabel"))
            {
              objc_msgSend(v82, "navFeature");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = *(_QWORD *)objc_msgSend(v82, "label");
              *(_BYTE *)(v95 + 264) = 1;
              *(_BYTE *)(v95 + 265) = *(float *)(v95 + 268) != 0.0;
              -[NSMutableArray addObject:](self->_fadingLabels, "addObject:", v82);
              v96 = objc_msgSend(v82, "label");
              v97 = self->_activeSigns.__end_;
              if (v97 >= self->_activeSigns.__end_cap_.__value_)
              {
                v101 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v258, (__int128 *)v96);
              }
              else
              {
                if (v97)
                {
                  *v97 = *(_QWORD *)v96;
                  v98 = *(_QWORD *)(v96 + 8);
                  v97[1] = v98;
                  if (v98)
                  {
                    v99 = (unint64_t *)(v98 + 8);
                    do
                      v100 = __ldxr(v99);
                    while (__stxr(v100 + 1, v99));
                  }
                }
                v101 = v97 + 2;
              }
              self->_activeSigns.__end_ = v101;
              objc_msgSend(v86, "recreateRoadShieldWithNavContext:artworkCache:", a3, self->_artworkCache);
              objc_msgSend(v86, "labelWithType:", 1);
              v102 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v102, "navFeature");
              v103 = objc_claimAutoreleasedReturnValue();
              goto LABEL_122;
            }
          }
LABEL_123:
          if (v78 && ((objc_msgSend(v82, "isRoadLabel") & 1) != 0 || objc_msgSend(v82, "isShieldLabel")))
          {
            v105 = objc_msgSend(v82, "isShieldLabel");
            objc_msgSend(v82, "desiredOffsetDistance");
            -[LabelNavRouteLabeler _createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:](v85, "_createOrUpdateLabelForRoad:isShield:navContext:hopOffsetDistance:", v83, v105, a3);
          }
          objc_msgSend(v83, "layoutWithNavContext:", a3);
          if (*(_BYTE *)(*(_QWORD *)objc_msgSend(v82, "label") + 327))
          {
            if (objc_msgSend(v82, "isRoadLabel"))
            {
              currentRoadName = v85->_currentRoadName;
              objc_msgSend(v83, "name");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[NSString isEqualToString:](currentRoadName, "isEqualToString:", v107))
              {
                v108 = objc_msgSend(v83, "isGuidanceStepStart");

                v85 = self;
                if ((v108 & 1) == 0)
                {
LABEL_135:
                  if (!*(_BYTE *)(*(_QWORD *)objc_msgSend(v82, "label") + 264))
                  {
                    v110 = *(_QWORD *)objc_msgSend(v82, "label");
                    *(_BYTE *)(v110 + 264) = 1;
                    *(_BYTE *)(v110 + 265) = *(float *)(v110 + 268) != 0.0;
                  }
                  goto LABEL_137;
                }
              }
              else
              {

                v85 = self;
              }
            }
            v109 = objc_msgSend(v82, "label");
            if (!*(_BYTE *)(*(_QWORD *)v109 + 325) || !*(_BYTE *)(*(_QWORD *)v109 + 326))
              goto LABEL_135;
LABEL_137:
            if (!*(_BYTE *)(*(_QWORD *)objc_msgSend(v82, "label") + 264))
            {
              if (-[LabelNavRouteLabeler _collideLabel:activeLabel:labelsToRemove:](v85, "_collideLabel:activeLabel:labelsToRemove:", v82, 0, v257))
              {
                v111 = *(_QWORD *)objc_msgSend(v82, "label");
                *(_BYTE *)(v111 + 264) = 1;
                *(_BYTE *)(v111 + 265) = *(float *)(v111 + 268) != 0.0;
              }
              else
              {
                v299 = 0u;
                v300 = 0u;
                v297 = 0u;
                v298 = 0u;
                v112 = v257;
                v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v297, v319, 16);
                if (v113)
                {
                  v114 = *(_QWORD *)v298;
                  do
                  {
                    for (n = 0; n != v113; ++n)
                    {
                      if (*(_QWORD *)v298 != v114)
                        objc_enumerationMutation(v112);
                      v116 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * n);
                      if (!*(_BYTE *)(*(_QWORD *)objc_msgSend(v116, "label") + 264))
                      {
                        v117 = *(_QWORD *)objc_msgSend(v116, "label");
                        *(_BYTE *)(v117 + 264) = 1;
                        *(_BYTE *)(v117 + 265) = *(float *)(v117 + 268) != 0.0;
                      }
                    }
                    v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v297, v319, 16);
                  }
                  while (v113);
                }

                v78 = v256;
                v85 = self;
              }
              objc_msgSend(v257, "removeAllObjects");
            }
            if (objc_msgSend(v82, "isRoadLabel")
              && !*(_BYTE *)(*(_QWORD *)objc_msgSend(v82, "label") + 264))
            {
              objc_msgSend(v82, "navFeature");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              v121 = -[LabelNavRouteLabeler orientationForRoadSign:roadLabel:navContext:](v85, "orientationForRoadSign:roadLabel:navContext:", v120, v82, a3);
              if ((_DWORD)v121 != objc_msgSend(v82, "alignment") || v85->_regenerateRoadSigns)
              {
                v122 = *(_QWORD *)objc_msgSend(v82, "label");
                *(_BYTE *)(v122 + 264) = 1;
                *(_BYTE *)(v122 + 265) = *(float *)(v122 + 268) != 0.0;
                -[NSMutableArray addObject:](v85->_fadingLabels, "addObject:", v82);
                v123 = objc_msgSend(v82, "label");
                v124 = v85->_activeSigns.__end_;
                if (v124 >= v85->_activeSigns.__end_cap_.__value_)
                {
                  v128 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v258, (__int128 *)v123);
                }
                else
                {
                  if (v124)
                  {
                    *v124 = *(_QWORD *)v123;
                    v125 = *(_QWORD *)(v123 + 8);
                    v124[1] = v125;
                    if (v125)
                    {
                      v126 = (unint64_t *)(v125 + 8);
                      do
                        v127 = __ldxr(v126);
                      while (__stxr(v127 + 1, v126));
                    }
                  }
                  v128 = v124 + 2;
                }
                v85->_activeSigns.__end_ = v128;
                objc_msgSend(v120, "recreateRoadSignWithAlignment:navContext:artworkCache:", v121, a3, v85->_artworkCache);
                objc_msgSend(v120, "labelWithType:", 0);
                v136 = objc_claimAutoreleasedReturnValue();

                v82 = (id)v136;
              }

              v85 = self;
              if (self->_checkOnRouteLabelsAlignment)
              {
LABEL_154:
                if (objc_msgSend(v82, "isRoadLabel"))
                {
                  objc_msgSend(v82, "navFeature");
                  v118 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v118, "isAwayFromRoute") & 1) != 0
                    || (v129 = objc_msgSend(v82, "alignment"),
                        v129 == objc_msgSend(v118, "roadSignAlignment"))
                    && !v85->_regenerateRoadSigns)
                  {
                    v119 = (uint64_t)v82;
                  }
                  else
                  {
                    if (*(_BYTE *)(*(_QWORD *)objc_msgSend(v82, "label") + 264))
                    {
                      -[NSMutableArray addObject:](v85->_fadingLabels, "addObject:", v82);
                      v130 = objc_msgSend(v82, "label");
                      v131 = v85->_activeSigns.__end_;
                      if (v131 >= v85->_activeSigns.__end_cap_.__value_)
                      {
                        v135 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v258, (__int128 *)v130);
                      }
                      else
                      {
                        if (v131)
                        {
                          *v131 = *(_QWORD *)v130;
                          v132 = *(_QWORD *)(v130 + 8);
                          v131[1] = v132;
                          if (v132)
                          {
                            v133 = (unint64_t *)(v132 + 8);
                            do
                              v134 = __ldxr(v133);
                            while (__stxr(v134 + 1, v133));
                          }
                        }
                        v135 = v131 + 2;
                      }
                      v85->_activeSigns.__end_ = v135;
                      objc_msgSend(v118, "clearRoadSign");
                      v119 = 0;
                    }
                    else
                    {
                      v137 = *(_QWORD *)objc_msgSend(v82, "label");
                      *(_BYTE *)(v137 + 264) = 1;
                      *(_BYTE *)(v137 + 265) = *(float *)(v137 + 268) != 0.0;
                      -[NSMutableArray addObject:](v85->_fadingLabels, "addObject:", v82);
                      v138 = objc_msgSend(v82, "label");
                      v139 = v85->_activeSigns.__end_;
                      if (v139 >= v85->_activeSigns.__end_cap_.__value_)
                      {
                        v143 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v258, (__int128 *)v138);
                      }
                      else
                      {
                        if (v139)
                        {
                          *v139 = *(_QWORD *)v138;
                          v140 = *(_QWORD *)(v138 + 8);
                          v139[1] = v140;
                          if (v140)
                          {
                            v141 = (unint64_t *)(v140 + 8);
                            do
                              v142 = __ldxr(v141);
                            while (__stxr(v142 + 1, v141));
                          }
                        }
                        v143 = v139 + 2;
                      }
                      v85->_activeSigns.__end_ = v143;
                      objc_msgSend(v118, "recreateRoadSignWithAlignment:navContext:artworkCache:", objc_msgSend(v118, "roadSignAlignment"), a3, v85->_artworkCache);
                      objc_msgSend(v118, "labelWithType:", 0);
                      v119 = objc_claimAutoreleasedReturnValue();
                    }

                  }
                  v82 = (id)v119;
                  v85 = self;
                }
              }
            }
            else if (v85->_checkOnRouteLabelsAlignment)
            {
              goto LABEL_154;
            }
            if (v82)
            {
              visibleLabelsByName = v85->_visibleLabelsByName;
              objc_msgSend(v82, "displayGroup");
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](visibleLabelsByName, "setObject:forKey:", v82, v145);

              v146 = self;
              -[NSMutableArray addObject:](self->_visibleLabels, "addObject:", v82);
              v147 = objc_msgSend(v82, "label");
              v148 = self->_activeSigns.__end_;
              if (v148 >= self->_activeSigns.__end_cap_.__value_)
              {
                v152 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>(v258, (__int128 *)v147);
              }
              else
              {
                if (v148)
                {
                  *v148 = *(_QWORD *)v147;
                  v149 = *(_QWORD *)(v147 + 8);
                  v148[1] = v149;
                  if (v149)
                  {
                    v150 = (unint64_t *)(v149 + 8);
                    do
                      v151 = __ldxr(v150);
                    while (__stxr(v151 + 1, v150));
                  }
                }
                v152 = v148 + 2;
              }
              self->_activeSigns.__end_ = v152;
              objc_msgSend(v79, "addObject:", v83);
              if (objc_msgSend(v82, "isShieldLabel"))
              {
                objc_msgSend(v82, "navFeature");
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                visibleShieldGroups = self->_visibleShieldGroups;
                objc_msgSend(v153, "shieldGroup");
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableSet addObject:](visibleShieldGroups, "addObject:", v155);

                v146 = self;
              }
              if ((objc_msgSend(v82, "isShieldLabel") & 1) == 0)
              {
                ++v146->_countVisibleRoadSigns;
                v156 = objc_msgSend(v83, "isOnRoute");
                p_countVisibleOffRouteRoadSigns = &self->_countVisibleOffRouteRoadSigns;
                if (v156)
                  p_countVisibleOffRouteRoadSigns = &self->_countVisibleOnRouteRoadSigns;
                ++*p_countVisibleOffRouteRoadSigns;
              }
              if (*(_QWORD *)objc_msgSend(v82, "label") && v270 == 2)
              {
                v158 = *(_QWORD *)objc_msgSend(v82, "label");
                *(_BYTE *)(v158 + 24) = 0;
                *(_BYTE *)(v158 + 27) = 2;
              }
            }
          }
LABEL_207:

        }
        v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v260, "countByEnumeratingWithState:objects:count:", &v301, v320, 16);
      }
      while (v80);
    }

    v159 = self;
    self->_checkOnRouteLabelsAlignment = 0;
    if (self->_isStylesheetAnimating
      || (-[LabelNavRouteLabeler _addLabelsAtJunctions:withContext:maxLabelsToAdd:](self, "_addLabelsAtJunctions:withContext:maxLabelsToAdd:", self->_junctions, a3, self->_maxVisibleRoadSigns), -[LabelNavRouteLabeler _addLabelsForJunctions:withContext:maxLabelsToAdd:useAllJunctions:placeShieldsFrontToBack:](self, "_addLabelsForJunctions:withContext:maxLabelsToAdd:useAllJunctions:placeShieldsFrontToBack:", self->_junctions, a3, self->_maxVisibleRoadSigns, 0, 0), self->_hasPendingTilesInSnappingRegion))
    {
LABEL_211:
      v159->_avoidanceRects.__end_ = v159->_avoidanceRects.__begin_;
      if (!v159->_regenerateRoadSigns)
      {
LABEL_248:
        v159->_regenerateRoadSigns = 0;
        -[LabelNavRouteLabeler _addVisibleSigns](v159, "_addVisibleSigns");

        return;
      }
      v295 = 0u;
      v296 = 0u;
      v293 = 0u;
      v294 = 0u;
      v160 = v159->_junctions;
      v161 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v160, "countByEnumeratingWithState:objects:count:", &v293, v318, 16);
      if (v161)
      {
        v162 = *(_QWORD *)v294;
        do
        {
          for (ii = 0; ii != v161; ++ii)
          {
            if (*(_QWORD *)v294 != v162)
              objc_enumerationMutation(v160);
            v164 = *(void **)(*((_QWORD *)&v293 + 1) + 8 * ii);
            v289 = 0u;
            v290 = 0u;
            v291 = 0u;
            v292 = 0u;
            objc_msgSend(v164, "roads");
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v289, v317, 16);
            if (v166)
            {
              v167 = *(_QWORD *)v290;
              do
              {
                for (jj = 0; jj != v166; ++jj)
                {
                  if (*(_QWORD *)v290 != v167)
                    objc_enumerationMutation(v165);
                  v169 = *(void **)(*((_QWORD *)&v289 + 1) + 8 * jj);
                  if ((objc_msgSend(v79, "containsObject:", v169) & 1) == 0)
                  {
                    objc_msgSend(v169, "clearRoadSign");
                    objc_msgSend(v169, "clearRoadShield");
                  }
                }
                v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v289, v317, 16);
              }
              while (v166);
            }

          }
          v161 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v160, "countByEnumeratingWithState:objects:count:", &v293, v318, 16);
        }
        while (v161);
      }

      v170 = self;
      if (-[VKLabelNavRoadGraph countReadyJunctionLists](self->_roadGraph, "countReadyJunctionLists") > 1)
      {
        v171 = 2;
      }
      else
      {
        v171 = -[VKLabelNavRoadGraph countReadyJunctionLists](self->_roadGraph, "countReadyJunctionLists");
        if (!v171)
        {
          v264 = 0;
LABEL_231:
          -[VKLabelNavRoadGraph offRouteJunctionList](v170->_roadGraph, "offRouteJunctionList");
          v172 = (void *)objc_claimAutoreleasedReturnValue();

          v279 = 0u;
          v280 = 0u;
          v277 = 0u;
          v278 = 0u;
          v265 = v172;
          v173 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v277, v314, 16);
          if (v173)
          {
            v174 = *(_QWORD *)v278;
            do
            {
              for (kk = 0; kk != v173; ++kk)
              {
                if (*(_QWORD *)v278 != v174)
                  objc_enumerationMutation(v265);
                v176 = *(id *)(*((_QWORD *)&v277 + 1) + 8 * kk);
                v273 = 0u;
                v274 = 0u;
                v275 = 0u;
                v276 = 0u;
                objc_msgSend(v176, "roads");
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                v178 = objc_msgSend(v177, "countByEnumeratingWithState:objects:count:", &v273, v313, 16);
                if (v178)
                {
                  v179 = *(_QWORD *)v274;
                  do
                  {
                    for (mm = 0; mm != v178; ++mm)
                    {
                      if (*(_QWORD *)v274 != v179)
                        objc_enumerationMutation(v177);
                      v181 = *(void **)(*((_QWORD *)&v273 + 1) + 8 * mm);
                      if ((objc_msgSend(v79, "containsObject:", v181) & 1) == 0)
                      {
                        objc_msgSend(v181, "clearRoadSign");
                        objc_msgSend(v181, "clearRoadShield");
                      }
                    }
                    v178 = objc_msgSend(v177, "countByEnumeratingWithState:objects:count:", &v273, v313, 16);
                  }
                  while (v178);
                }

              }
              v173 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v277, v314, 16);
            }
            while (v173);
          }

          v159 = self;
          goto LABEL_248;
        }
      }
      v264 = 0;
      for (nn = 1; nn <= v171; ++nn)
      {
        -[VKLabelNavRoadGraph junctionListForDepth:](v170->_roadGraph, "junctionListForDepth:", nn);
        v199 = (void *)objc_claimAutoreleasedReturnValue();

        v287 = 0u;
        v288 = 0u;
        v285 = 0u;
        v286 = 0u;
        v264 = v199;
        v200 = objc_msgSend(v264, "countByEnumeratingWithState:objects:count:", &v285, v316, 16);
        if (v200)
        {
          v267 = *(md::NavContext **)v286;
          do
          {
            for (i1 = 0; i1 != v200; ++i1)
            {
              if (*(md::NavContext **)v286 != v267)
                objc_enumerationMutation(v264);
              v202 = *(id *)(*((_QWORD *)&v285 + 1) + 8 * i1);
              v281 = 0u;
              v282 = 0u;
              v283 = 0u;
              v284 = 0u;
              v272 = v202;
              objc_msgSend(v202, "roads");
              v203 = (void *)objc_claimAutoreleasedReturnValue();
              v204 = v171;
              v205 = objc_msgSend(v203, "countByEnumeratingWithState:objects:count:", &v281, v315, 16);
              if (v205)
              {
                v206 = *(_QWORD *)v282;
                do
                {
                  for (i2 = 0; i2 != v205; ++i2)
                  {
                    if (*(_QWORD *)v282 != v206)
                      objc_enumerationMutation(v203);
                    v208 = *(void **)(*((_QWORD *)&v281 + 1) + 8 * i2);
                    if ((objc_msgSend(v79, "containsObject:", v208) & 1) == 0)
                    {
                      objc_msgSend(v208, "clearRoadSign");
                      objc_msgSend(v208, "clearRoadShield");
                    }
                  }
                  v205 = objc_msgSend(v203, "countByEnumeratingWithState:objects:count:", &v281, v315, 16);
                }
                while (v205);
              }

              v171 = v204;
            }
            v200 = objc_msgSend(v264, "countByEnumeratingWithState:objects:count:", &v285, v316, 16);
          }
          while (v200);
        }

        v170 = self;
      }
      goto LABEL_231;
    }
    if (self->_shouldLabelOppositeCarriageways)
    {
      if (!-[VKLabelNavRoadGraph prepareOppositeCarriagewayJunctions](self->_roadGraph, "prepareOppositeCarriagewayJunctions"))
      {
        self->_needsLayout = 1;
        goto LABEL_211;
      }
      -[VKLabelNavRoadGraph oppositeCarriagewayJunctions](self->_roadGraph, "oppositeCarriagewayJunctions");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      -[LabelNavRouteLabeler _addLabelsForJunctions:withContext:maxLabelsToAdd:useAllJunctions:placeShieldsFrontToBack:](self, "_addLabelsForJunctions:withContext:maxLabelsToAdd:useAllJunctions:placeShieldsFrontToBack:", v218, a3, self->_maxVisibleRoadSigns, 0, 0);

      v159 = self;
    }
    if (!(*(unsigned int (**)(MapNavLabeler *))(*(_QWORD *)a3->var2 + 408))(a3->var2))
      goto LABEL_211;
    v219 = -[VKLabelNavRoadGraph countReadyJunctionLists](v159->_roadGraph, "countReadyJunctionLists");
    v220 = v219 > 2;
    countVisibleRoadSigns = v159->_countVisibleRoadSigns;
    if (countVisibleRoadSigns >= v159->_maxOnRoadGraphRoadSigns)
      goto LABEL_402;
    if (-[VKLabelNavRoadGraph countReadyJunctionLists](v159->_roadGraph, "countReadyJunctionLists") > 1)
    {
      v222 = 2;
    }
    else
    {
      v222 = -[VKLabelNavRoadGraph countReadyJunctionLists](v159->_roadGraph, "countReadyJunctionLists");
      if (!v222)
      {
LABEL_398:
        v159 = self;
        countVisibleRoadSigns = self->_countVisibleRoadSigns;
        if (countVisibleRoadSigns < self->_maxOnRoadGraphRoadSigns && v219 <= 2)
        {
          v251 = 0;
          self->_needsLayout = 1;
LABEL_410:

          v159 = self;
          goto LABEL_211;
        }
LABEL_402:
        v252 = 344;
        if (!v159->_isOnRoute)
          v252 = 352;
        v253 = *(unint64_t *)((char *)&v159->super.isa + v252);
        if (countVisibleRoadSigns >= v253 || !v220)
        {
          v251 = 0;
        }
        else
        {
          -[VKLabelNavRoadGraph offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:](v159->_roadGraph, "offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:", a3, 25, v159->_isOnRoute);
          v251 = (void *)objc_claimAutoreleasedReturnValue();
          -[LabelNavRouteLabeler _addLabelsForJunctions:withContext:maxLabelsToAdd:useAllJunctions:placeShieldsFrontToBack:](v159, "_addLabelsForJunctions:withContext:maxLabelsToAdd:useAllJunctions:placeShieldsFrontToBack:", v251, a3, v253, 1, 1);
        }
        goto LABEL_410;
      }
    }
    v246 = 2;
    while (1)
    {
      -[VKLabelNavRoadGraph junctionListForDepth:](self->_roadGraph, "junctionListForDepth:", v246 - 1);
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      v248 = v247;
      if (!v247 || !objc_msgSend(v247, "count"))
        break;
      -[LabelNavRouteLabeler _addLabelsForJunctions:withContext:maxLabelsToAdd:useAllJunctions:placeShieldsFrontToBack:](self, "_addLabelsForJunctions:withContext:maxLabelsToAdd:useAllJunctions:placeShieldsFrontToBack:", v248, a3, self->_maxOnRoadGraphRoadSigns, 0, 1);
      v249 = self->_countVisibleRoadSigns >= self->_maxOnRoadGraphRoadSigns;

      v250 = v246++ > v222 || v249;
      if (v250 == 1)
        goto LABEL_398;
    }

    v159 = self;
    countVisibleRoadSigns = self->_countVisibleRoadSigns;
    v220 = 1;
    goto LABEL_402;
  }
LABEL_309:
  -[NSMutableDictionary removeAllObjects](self->_visibleLabelsByName, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_visibleLabels, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_visibleShieldGroups, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_fadingLabels, "removeAllObjects");
  v209 = self->_visibleSigns.__end_;
  v210 = self->_visibleSigns.__begin_;
  while (v209 != v210)
  {
    v211 = (std::__shared_weak_count *)*(v209 - 1);
    if (v211)
    {
      v212 = (unint64_t *)&v211->__shared_owners_;
      do
        v213 = __ldaxr(v212);
      while (__stlxr(v213 - 1, v212));
      if (!v213)
      {
        ((void (*)(std::__shared_weak_count *))v211->__on_zero_shared)(v211);
        std::__shared_weak_count::__release_weak(v211);
      }
    }
    v209 -= 2;
  }
  self->_visibleSigns.__end_ = v210;
  v214 = self->_currentRoadSign.__ptr_;
  if (v214 && self->_isCurrentRoadSignVisible)
  {
    v215 = self->_currentRoadSign.__cntrl_;
    v311.i64[0] = (uint64_t)self->_currentRoadSign.__ptr_;
    v311.i64[1] = (uint64_t)v215;
    if (v215)
    {
      v216 = (unint64_t *)((char *)v215 + 8);
      do
        v217 = __ldxr(v216);
      while (__stxr(v217 + 1, v216));
      v210 = self->_visibleSigns.__end_;
    }
    if (v210 < self->_visibleSigns.__end_cap_.__value_)
    {
      if (v210)
      {
        *v210 = v214;
        v210[1] = v215;
        v311 = 0uLL;
        v215 = 0;
      }
      self->_visibleSigns.__end_ = v210 + 2;
      if (!v215)
        goto LABEL_341;
      goto LABEL_337;
    }
    v223 = std::vector<std::shared_ptr<md::RouteAnnotationLabelFeature>,geo::StdAllocator<std::shared_ptr<md::RouteAnnotationLabelFeature>,mdm::Allocator>>::__emplace_back_slow_path<std::shared_ptr<md::RouteAnnotationLabelFeature>>((uint64_t)p_visibleSigns, (uint64_t)&v311);
    v215 = (__shared_weak_count *)v311.i64[1];
    self->_visibleSigns.__end_ = v223;
    if (v215)
    {
LABEL_337:
      v224 = (unint64_t *)((char *)v215 + 8);
      do
        v225 = __ldaxr(v224);
      while (__stlxr(v225 - 1, v224));
      if (!v225)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)v215 + 16))(v215);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v215);
      }
    }
  }
LABEL_341:
  self->_regenerateRoadSigns = 0;
}

- (void)_addVisibleSigns
{
  __int128 *begin;
  __int128 *end;
  vector<std::shared_ptr<md::NavLabel>, geo::StdAllocator<std::shared_ptr<md::NavLabel>, mdm::Allocator>> *p_visibleSigns;
  _OWORD *v6;
  uint64_t v7;
  unsigned __int8 v8;
  int v9;
  char v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;

  begin = (__int128 *)self->_activeSigns.__begin_;
  end = (__int128 *)self->_activeSigns.__end_;
  if (begin != end)
  {
    p_visibleSigns = &self->_visibleSigns;
    do
    {
      v7 = *(_QWORD *)begin;
      if (*(_BYTE *)(*(_QWORD *)begin + 26))
      {
        v8 = atomic_load((unsigned __int8 *)(*(_QWORD *)(v7 + 8) + 286));
        v7 = *(_QWORD *)begin;
        if ((v8 & 1) != 0)
        {
          v9 = *(unsigned __int8 *)(*(_QWORD *)(v7 + 8) + 280);
          *(_BYTE *)(v7 + 27) = v9;
          if (v9 == 2)
          {
            v10 = 0;
          }
          else
          {
            *(_BYTE *)(v7 + 26) = 0;
            v10 = 1;
          }
          *(_BYTE *)(v7 + 24) = v10;
        }
      }
      if (*(_BYTE *)(v7 + 27) == 2)
      {
        v11 = self->_visibleSigns.__end_;
        if (v11 >= self->_visibleSigns.__end_cap_.__value_)
        {
          v6 = std::vector<std::shared_ptr<md::LabelMarker>,geo::StdAllocator<std::shared_ptr<md::LabelMarker>,mdm::Allocator>>::__push_back_slow_path<std::shared_ptr<md::LabelMarker> const&>((uint64_t)p_visibleSigns, begin);
        }
        else
        {
          if (v11)
          {
            v12 = *((_QWORD *)begin + 1);
            *v11 = v7;
            v11[1] = v12;
            if (v12)
            {
              v13 = (unint64_t *)(v12 + 8);
              do
                v14 = __ldxr(v13);
              while (__stxr(v14 + 1, v13));
            }
          }
          v6 = v11 + 2;
        }
        self->_visibleSigns.__end_ = v6;
      }
      ++begin;
    }
    while (begin != end);
  }
}

- (void)_addLabelsAtJunctions:(id)a3 withContext:(NavContext *)a4 maxLabelsToAdd:(unint64_t)a5
{
  id v8;
  unint64_t countVisibleRoadSigns;
  unint64_t maxVisibleRoadSigns;
  BOOL v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  double *v20;
  LabelLayoutContext *var3;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double *v27;
  LabelLayoutContext *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  unsigned int index;
  float offset;
  uint64_t v37;
  double v38;
  long double v39;
  long double v40;
  double v41;
  long double v42;
  double v43;
  __double2 v44;
  double v45;
  double v46;
  __double2 v47;
  double v48;
  LabelNavLayoutContext *var4;
  double v50;
  long double v51;
  long double v52;
  double v53;
  long double v54;
  double v55;
  __double2 v56;
  double v57;
  double v58;
  __double2 v59;
  float32x2_t v60;
  LabelNavLayoutContext *v61;
  uint64_t v62;
  unint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v69;
  id v70;
  unsigned int v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a5)
    goto LABEL_62;
  countVisibleRoadSigns = self->_countVisibleRoadSigns;
  maxVisibleRoadSigns = self->_maxVisibleRoadSigns;
  v11 = maxVisibleRoadSigns >= countVisibleRoadSigns;
  v12 = maxVisibleRoadSigns - countVisibleRoadSigns;
  if (v12 == 0 || !v11)
    goto LABEL_62;
  if (v12 >= (uint64_t)a5)
    v13 = a5;
  else
    v13 = v12;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "labelCollisionDisabled");

  v70 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v71 = v15 ^ 1;
  while (v18 < (unint64_t)objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isOnRoute") & 1) == 0)
      goto LABEL_9;
    if (v17)
    {
      v20 = (double *)objc_msgSend(v19, "mercatorCoordinate");
      var3 = a4->var3;
      v22 = *((float *)var3 + 12);
      v24 = *v20;
      v23 = v20[1];
      v25 = v20[2];
      if (*((_BYTE *)var3 + 8))
      {
        v26 = v22 * (0.0000000249532021 * v25);
      }
      else
      {
        v38 = v25 * v22;
        v39 = v24 * 6.28318531;
        v40 = exp(v23 * 6.28318531 + -3.14159265);
        v41 = atan(v40) * 2.0 + -1.57079633;
        v42 = fmod(v39, 6.28318531);
        v43 = fmod(v42 + 6.28318531, 6.28318531) + -3.14159265;
        v44 = __sincos_stret(v41);
        v45 = 6378137.0 / sqrt(v44.__sinval * v44.__sinval * -0.00669437999 + 1.0);
        v46 = (v45 + v38) * v44.__cosval;
        v47 = __sincos_stret(v43);
        v24 = v46 * v47.__cosval;
        v23 = v46 * v47.__sinval;
        v26 = (v38 + v45 * 0.99330562) * v44.__sinval;
      }
      v48 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)var3 + 60), *((float64x2_t *)var3 + 54), v24), *((float64x2_t *)var3 + 56), v23), *((float64x2_t *)var3 + 58), v26), 1.0/ (*((double *)var3 + 123)+ *((double *)var3 + 111) * v24+ *((double *)var3 + 115) * v23+ *((double *)var3 + 119) * v26))));
      var4 = a4->var4;
      if (*(float *)&v48 >= *((float *)var4 + 12) && *(float *)&v48 < *((float *)var4 + 14))
      {
        LODWORD(v48) = HIDWORD(v48);
        if (*((float *)&v48 + 1) >= *((float *)var4 + 13) && *((float *)&v48 + 1) < *((float *)var4 + 15))
          objc_msgSend(v70, "addObject:", v19, v48);
      }
      if ((unint64_t)++v16 >= 0x14)
      {

        break;
      }
      goto LABEL_32;
    }
    if ((*(unsigned int (**)(MapNavLabeler *))(*(_QWORD *)a4->var2 + 408))(a4->var2))
    {
      v27 = (double *)objc_msgSend(v19, "mercatorCoordinate");
      v28 = a4->var3;
      v29 = *((float *)v28 + 12);
      v31 = *v27;
      v30 = v27[1];
      v32 = v27[2];
      if (*((_BYTE *)v28 + 8))
      {
        v33 = v29 * (0.0000000249532021 * v32);
      }
      else
      {
        v50 = v32 * v29;
        v51 = v31 * 6.28318531;
        v52 = exp(v30 * 6.28318531 + -3.14159265);
        v53 = atan(v52) * 2.0 + -1.57079633;
        v54 = fmod(v51, 6.28318531);
        v55 = fmod(v54 + 6.28318531, 6.28318531) + -3.14159265;
        v56 = __sincos_stret(v53);
        v57 = 6378137.0 / sqrt(v56.__sinval * v56.__sinval * -0.00669437999 + 1.0);
        v58 = (v57 + v50) * v56.__cosval;
        v59 = __sincos_stret(v55);
        v31 = v58 * v59.__cosval;
        v30 = v58 * v59.__sinval;
        v33 = (v50 + v57 * 0.99330562) * v56.__sinval;
      }
      v60 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)v28 + 60), *((float64x2_t *)v28 + 54), v31), *((float64x2_t *)v28 + 56), v30), *((float64x2_t *)v28 + 58), v33), 1.0/ (*((double *)v28 + 123)+ *((double *)v28 + 111) * v31+ *((double *)v28 + 115) * v30+ *((double *)v28 + 119) * v33)));
      v61 = a4->var4;
      if (v60.f32[0] < *((float *)v61 + 12)
        || v60.f32[0] >= *((float *)v61 + 14)
        || v60.f32[1] < *((float *)v61 + 13)
        || v60.f32[1] >= *((float *)v61 + 15))
      {
LABEL_8:
        v17 = 0;
        goto LABEL_9;
      }
LABEL_38:
      if (v18 <= 2)
        v62 = 2;
      else
        v62 = v18;
      v18 = v62 - 2;
LABEL_32:
      v17 = 1;
      goto LABEL_9;
    }
    v34 = objc_msgSend(v19, "routeOffset");
    index = self->_routeUserOffset.index;
    if (index > v34)
      goto LABEL_8;
    if (index != (_DWORD)v34)
      goto LABEL_38;
    offset = self->_routeUserOffset.offset;
    if (v18 <= 2)
      v37 = 2;
    else
      v37 = v18;
    v17 = offset < *((float *)&v34 + 1);
    if (offset < *((float *)&v34 + 1))
      v18 = v37 - 2;
LABEL_9:

    ++v18;
  }
  v63 = self->_countVisibleRoadSigns;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v64 = v70;
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  if (v65)
  {
    v66 = *(_QWORD *)v73;
LABEL_45:
    v67 = 0;
    while (1)
    {
      if (*(_QWORD *)v73 != v66)
        objc_enumerationMutation(v64);
      if (self->_countVisibleRoadSigns >= self->_maxVisibleRoadSigns || v13 < 1)
        break;
      v69 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v67);
      if (((objc_msgSend(v69, "isOnRoute") & 1) != 0
         || self->_countVisibleOffRouteRoadSigns < self->_maxVisibleOffRouteRoadSigns)
        && (!objc_msgSend(v69, "isOnRoute")
         || self->_countVisibleOnRouteRoadSigns < self->_maxVisibleOnRouteRoadSigns))
      {
        objc_msgSend(v69, "prepareStyleVarsWithContext:", a4);
        if (objc_msgSend(v69, "isVisible"))
          -[LabelNavRouteLabeler _tryAddRoadSignForJunction:navContext:labelCollisionEnabled:](self, "_tryAddRoadSignForJunction:navContext:labelCollisionEnabled:", v69, a4, v71);
        v13 -= self->_countVisibleRoadSigns - v63 == 1;
        v63 = self->_countVisibleRoadSigns;
      }
      if (v65 == ++v67)
      {
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
        if (v65)
          goto LABEL_45;
        break;
      }
    }
  }

LABEL_62:
}

- (void)_addLabelsForJunctions:(id)a3 withContext:(NavContext *)a4 maxLabelsToAdd:(unint64_t)a5 useAllJunctions:(BOOL)a6 placeShieldsFrontToBack:(BOOL)a7
{
  _BOOL4 v7;
  unint64_t countVisibleRoadSigns;
  unint64_t maxVisibleRoadSigns;
  BOOL v13;
  int64_t v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  unint64_t j;
  void *v23;
  double *v24;
  LabelLayoutContext *var3;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  unsigned int index;
  double v33;
  long double v34;
  long double v35;
  double v36;
  long double v37;
  double v38;
  __double2 v39;
  double v40;
  double v41;
  __double2 v42;
  float32x2_t v43;
  LabelNavLayoutContext *var4;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  float v51;
  void *v52;
  uint64_t v53;
  double v54;
  uint64_t v56;
  unint64_t k;
  void *v58;
  double *v59;
  LabelLayoutContext *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  long double v67;
  long double v68;
  double v69;
  long double v70;
  double v71;
  __double2 v72;
  double v73;
  double v74;
  __double2 v75;
  double v76;
  LabelNavLayoutContext *v77;
  void *v78;
  unint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t m;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t n;
  void *v96;
  NSMutableDictionary *visibleLabelsByName;
  void *v98;
  void *v99;
  void *v100;
  _BOOL4 v101;
  int64_t v102;
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v101 = a7;
  v7 = a6;
  v125 = *MEMORY[0x1E0C80C00];
  v103 = a3;
  if (a5)
  {
    countVisibleRoadSigns = self->_countVisibleRoadSigns;
    maxVisibleRoadSigns = self->_maxVisibleRoadSigns;
    v13 = maxVisibleRoadSigns >= countVisibleRoadSigns;
    v14 = maxVisibleRoadSigns - countVisibleRoadSigns;
    if (v14 != 0 && v13)
    {
      if (v14 >= (uint64_t)a5)
        v14 = a5;
      v102 = v14;
      +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "labelCollisionDisabled");

      v104 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (v7)
      {
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v17 = v103;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v117, v124, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v118;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v118 != v19)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * i), "roads");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "addObjectsFromArray:", v21);

            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v117, v124, 16);
          }
          while (v18);
        }

      }
      else if (objc_msgSend(v103, "count"))
      {
        for (j = 0; j < objc_msgSend(v103, "count"); ++j)
        {
          objc_msgSend(v103, "objectAtIndexedSubscript:", j);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((*(unsigned int (**)(MapNavLabeler *))(*(_QWORD *)a4->var2 + 408))(a4->var2))
          {
            v24 = (double *)objc_msgSend(v23, "mercatorCoordinate");
            var3 = a4->var3;
            v26 = *((float *)var3 + 12);
            v28 = *v24;
            v27 = v24[1];
            v29 = v24[2];
            if (*((_BYTE *)var3 + 8))
            {
              v30 = v26 * (0.0000000249532021 * v29);
            }
            else
            {
              v33 = v29 * v26;
              v34 = v28 * 6.28318531;
              v35 = exp(v27 * 6.28318531 + -3.14159265);
              v36 = atan(v35) * 2.0 + -1.57079633;
              v37 = fmod(v34, 6.28318531);
              v38 = fmod(v37 + 6.28318531, 6.28318531) + -3.14159265;
              v39 = __sincos_stret(v36);
              v40 = 6378137.0 / sqrt(v39.__sinval * v39.__sinval * -0.00669437999 + 1.0);
              v41 = (v40 + v33) * v39.__cosval;
              v42 = __sincos_stret(v38);
              v28 = v41 * v42.__cosval;
              v27 = v41 * v42.__sinval;
              v30 = (v33 + v40 * 0.99330562) * v39.__sinval;
            }
            v43 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)var3 + 60), *((float64x2_t *)var3 + 54), v28), *((float64x2_t *)var3 + 56), v27), *((float64x2_t *)var3 + 58), v30), 1.0/ (*((double *)var3 + 123)+ *((double *)var3 + 111) * v28+ *((double *)var3 + 115) * v27+ *((double *)var3 + 119) * v30)));
            var4 = a4->var4;
            if (v43.f32[0] >= *((float *)var4 + 12)
              && v43.f32[0] < *((float *)var4 + 14)
              && v43.f32[1] >= *((float *)var4 + 13)
              && v43.f32[1] < *((float *)var4 + 15))
            {
LABEL_31:

              break;
            }
          }
          else
          {
            v31 = objc_msgSend(v23, "routeOffset");
            index = self->_routeUserOffset.index;
            if (index <= v31
              && (index != (_DWORD)v31 || self->_routeUserOffset.offset < *((float *)&v31 + 1)))
            {
              goto LABEL_31;
            }
          }

        }
        v45 = objc_msgSend(v103, "count");
        if ((uint64_t)j >= v45)
          v46 = v45;
        else
          v46 = j;
        if (v46 <= 1)
          v47 = 1;
        else
          v47 = v46;
        objc_msgSend(v103, "objectAtIndexedSubscript:", v47 - 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "routeOffset");

        if (v47 > 1)
        {
          v50 = 0;
          v51 = *((float *)&v49 + 1);
          do
          {
            objc_msgSend(v103, "objectAtIndexedSubscript:", v47 - 2);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v52, "routeOffset");
            --v47;
            *(float *)&v54 = vabds_f32(*((float *)&v53 + 1), v51);
            if ((_DWORD)v49 != (_DWORD)v53 || *(float *)&v54 >= 0.00000011921)
            {
              if (v50)
              {

                goto LABEL_49;
              }
              v56 = objc_msgSend(v52, "routeOffset", v54);
              v51 = *((float *)&v56 + 1);
              LODWORD(v49) = v56;
              v50 = 1;
            }

          }
          while (v47 > 1);
        }
        v47 = 0;
LABEL_49:
        for (k = 0; v47 + k < objc_msgSend(v103, "count"); ++k)
        {
          objc_msgSend(v103, "objectAtIndexedSubscript:");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = (double *)objc_msgSend(v58, "mercatorCoordinate");
          v60 = a4->var3;
          v61 = *((float *)v60 + 12);
          v63 = *v59;
          v62 = v59[1];
          v64 = v59[2];
          if (*((_BYTE *)v60 + 8))
          {
            v65 = v61 * (0.0000000249532021 * v64);
          }
          else
          {
            v66 = v64 * v61;
            v67 = v63 * 6.28318531;
            v68 = exp(v62 * 6.28318531 + -3.14159265);
            v69 = atan(v68) * 2.0 + -1.57079633;
            v70 = fmod(v67, 6.28318531);
            v71 = fmod(v70 + 6.28318531, 6.28318531) + -3.14159265;
            v72 = __sincos_stret(v69);
            v73 = 6378137.0 / sqrt(v72.__sinval * v72.__sinval * -0.00669437999 + 1.0);
            v74 = (v73 + v66) * v72.__cosval;
            v75 = __sincos_stret(v71);
            v63 = v74 * v75.__cosval;
            v62 = v74 * v75.__sinval;
            v65 = (v66 + v73 * 0.99330562) * v72.__sinval;
          }
          v76 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)v60 + 60), *((float64x2_t *)v60 + 54), v63), *((float64x2_t *)v60 + 56), v62), *((float64x2_t *)v60 + 58), v65), 1.0/ (*((double *)v60 + 123)+ *((double *)v60 + 111) * v63+ *((double *)v60 + 115) * v62+ *((double *)v60 + 119) * v65))));
          v77 = a4->var4;
          if (*(float *)&v76 < *((float *)v77 + 12)
            || *(float *)&v76 >= *((float *)v77 + 14)
            || (LODWORD(v76) = HIDWORD(v76), *((float *)&v76 + 1) < *((float *)v77 + 13))
            || *((float *)&v76 + 1) >= *((float *)v77 + 15))
          {
            if (k >= 0x14)
            {

              break;
            }
          }
          else
          {
            objc_msgSend(v58, "roads", v76);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "addObjectsFromArray:", v78);

          }
        }
      }
      v79 = self->_countVisibleRoadSigns;
      v113 = 0u;
      v114 = 0u;
      v115 = 0u;
      v116 = 0u;
      v80 = v104;
      v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
      v82 = v16 ^ 1u;
      if (v81)
      {
        v83 = *(_QWORD *)v114;
LABEL_64:
        v84 = 0;
        while (1)
        {
          if (*(_QWORD *)v114 != v83)
            objc_enumerationMutation(v80);
          if (self->_countVisibleRoadSigns >= self->_maxVisibleRoadSigns || v102 == 0)
            break;
          v86 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v84);
          if (((objc_msgSend(v86, "isOnRoute") & 1) != 0
             || self->_countVisibleOffRouteRoadSigns < self->_maxVisibleOffRouteRoadSigns)
            && (!objc_msgSend(v86, "isOnRoute")
             || self->_countVisibleOnRouteRoadSigns < self->_maxVisibleOnRouteRoadSigns)
            && (objc_msgSend(v86, "areLabelsDisabled") & 1) == 0)
          {
            objc_msgSend(v86, "prepareStyleVarsWithContext:", a4);
            if (objc_msgSend(v86, "hasVisibleSigns"))
              -[LabelNavRouteLabeler _tryAddRoadSignForRoad:isShield:navContext:labelCollisionEnabled:](self, "_tryAddRoadSignForRoad:isShield:navContext:labelCollisionEnabled:", v86, 0, a4, v82);
            if (v101 && objc_msgSend(v86, "hasVisibleShields"))
              -[LabelNavRouteLabeler _tryAddRoadSignForRoad:isShield:navContext:labelCollisionEnabled:](self, "_tryAddRoadSignForRoad:isShield:navContext:labelCollisionEnabled:", v86, 1, a4, v82);
            v102 -= self->_countVisibleRoadSigns - v79 == 1;
            v79 = self->_countVisibleRoadSigns;
          }
          if (v81 == ++v84)
          {
            v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
            if (v81)
              goto LABEL_64;
            break;
          }
        }
      }

      if (!v101)
      {
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        objc_msgSend(v80, "reverseObjectEnumerator");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
        if (v88)
        {
          v89 = *(_QWORD *)v110;
          do
          {
            for (m = 0; m != v88; ++m)
            {
              if (*(_QWORD *)v110 != v89)
                objc_enumerationMutation(v87);
              v91 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * m);
              if ((objc_msgSend(v91, "areLabelsDisabled") & 1) == 0)
              {
                objc_msgSend(v91, "prepareStyleVarsWithContext:", a4);
                if (objc_msgSend(v91, "hasVisibleShields"))
                  -[LabelNavRouteLabeler _tryAddRoadSignForRoad:isShield:navContext:labelCollisionEnabled:](self, "_tryAddRoadSignForRoad:isShield:navContext:labelCollisionEnabled:", v91, 1, a4, v82);
              }
            }
            v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
          }
          while (v88);
        }

      }
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v92 = v80;
      v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
      if (v93)
      {
        v94 = *(_QWORD *)v106;
        do
        {
          for (n = 0; n != v93; ++n)
          {
            if (*(_QWORD *)v106 != v94)
              objc_enumerationMutation(v92);
            v96 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * n);
            if ((objc_msgSend(v96, "areLabelsDisabled") & 1) == 0 && (objc_msgSend(v96, "isOnRoute") & 1) == 0)
            {
              visibleLabelsByName = self->_visibleLabelsByName;
              objc_msgSend(v96, "name");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKey:](visibleLabelsByName, "objectForKey:", v98);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(visibleLabelsByName) = v99 == 0;

              if ((visibleLabelsByName & 1) == 0)
              {
                objc_msgSend(v96, "labelWithType:", 0);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v100
                  || (-[NSMutableArray containsObject:](self->_visibleLabels, "containsObject:", v100) & 1) == 0)
                {
                  objc_msgSend(v96, "prepareStyleVarsWithContext:", a4);
                  if (objc_msgSend(v96, "hasVisibleSigns"))
                    -[LabelNavRouteLabeler _tryAddRoadSignForRoad:isShield:navContext:labelCollisionEnabled:](self, "_tryAddRoadSignForRoad:isShield:navContext:labelCollisionEnabled:", v96, 0, a4, v82);
                }

              }
            }
          }
          v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
        }
        while (v93);
      }

    }
  }

}

- (BOOL)_addJunctionsForTile:(const void *)a3
{
  uint64_t *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  std::__shared_weak_count *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t n;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  std::__shared_weak_count *v82;
  uint64_t v83;
  std::__shared_weak_count *v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  std::__shared_weak_count *v95;
  LabelNavRouteLabeler *v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[24];
  _BYTE *v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v96 = self;
  v4 = *(uint64_t **)(*(_QWORD *)a3 + 24);
  v6 = *v4;
  v5 = (std::__shared_weak_count *)v4[1];
  v94 = v6;
  v95 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v92 = *MEMORY[0x1E0D26A38];
  -[VKPolylineOverlay routeRibbon](v96->_route, "routeRibbon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "matchedSegments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v88 != v13)
          objc_enumerationMutation(v11);
        v91 = *(id *)(*((_QWORD *)&v87 + 1) + 8 * i);
        objc_msgSend(v91, "road");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "feature");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (uint64_t *)objc_msgSend(v16, "getRoad");

        if (v17)
        {
          v86 = 0;
          objc_msgSend(v91, "road");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "startJunction");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "connectivityJunction");

          v85 = 0;
          v86 = v20;
          objc_msgSend(v91, "road");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "endJunction");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "connectivityJunction");

          v85 = v23;
          objc_msgSend(v91, "road");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "feature");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "feature");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "containingTile");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            objc_msgSend(v27, "vectorTilePtr");
          }
          else
          {
            v83 = 0;
            v84 = 0;
          }

          if (!geo::codec::TileKeyEquals((_QWORD *)(v94 + 4), (_QWORD *)(v83 + 4)) || *(_DWORD *)v94 != *(_DWORD *)v83)
            goto LABEL_28;
          v81 = 0;
          v82 = 0;
          v29 = (std::__shared_weak_count *)v17[1];
          if (v29)
          {
            v82 = std::__shared_weak_count::lock(v29);
            if (v82)
              v81 = *v17;
          }
          v102 = 0;
          v30 = operator new(0x48uLL);
          *v30 = &off_1E42C7B80;
          v30[1] = &v86;
          v30[2] = &v85;
          v30[3] = &v91;
          v30[4] = &v94;
          v30[5] = &v92;
          v30[6] = &v96;
          v30[7] = a3;
          v30[8] = &v93;
          v102 = v30;
          geo::codec::forEachEdgeInRoad(&v81, (uint64_t)v17, 1, (uint64_t)v101);
          v31 = v102;
          if (v102 == v101)
          {
            v31 = v101;
            v32 = 4;
LABEL_23:
            (*(void (**)(void))(*v31 + 8 * v32))();
          }
          else if (v102)
          {
            v32 = 5;
            goto LABEL_23;
          }
          v33 = v82;
          if (!v82)
            goto LABEL_28;
          v34 = (unint64_t *)&v82->__shared_owners_;
          do
            v35 = __ldaxr(v34);
          while (__stlxr(v35 - 1, v34));
          if (!v35)
          {
            ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
            std::__shared_weak_count::__release_weak(v33);
            v36 = v84;
            if (!v84)
              continue;
          }
          else
          {
LABEL_28:
            v36 = v84;
            if (!v84)
              continue;
          }
          v37 = (unint64_t *)&v36->__shared_owners_;
          do
            v38 = __ldaxr(v37);
          while (__stlxr(v38 - 1, v37));
          if (!v38)
          {
            ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
            std::__shared_weak_count::__release_weak(v36);
          }
          continue;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v93, "count"))
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v39 = v93;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v77, v100, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v78 != v41)
            objc_enumerationMutation(v39);
          v43 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
          objc_msgSend(v43, "evaluateCrossStreets");
          objc_msgSend(v43, "setDepthFromRoute:", 0);
        }
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v77, v100, 16);
      }
      while (v40);
    }

    -[NSMutableArray removeObjectsInArray:](v96->_junctions, "removeObjectsInArray:", v93);
    -[NSMutableArray addObjectsFromArray:](v96->_junctions, "addObjectsFromArray:", v93);
    v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v45 = v93;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v99, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v74;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v74 != v47)
            objc_enumerationMutation(v45);
          v49 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * k);
          if (objc_msgSend(v49, "isOverpass"))
          {
            -[VKLabelNavRoadGraph overpassJunctionForJunction:](v96->_roadGraph, "overpassJunctionForJunction:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v50;
            if (v50 && (objc_msgSend(v50, "isOnRoute") & 1) == 0 && (objc_msgSend(v51, "isIntraRamp") & 1) == 0)
            {
              objc_msgSend(v51, "setDepthFromRoute:", 0);
              objc_msgSend(v51, "setRouteOffset:", objc_msgSend(v49, "routeOffset"));
              objc_msgSend(v51, "setIsRouteOverpass:", 1);
              objc_msgSend(v51, "evaluateCrossStreetsUsingRouteJunction:", v49);
              objc_msgSend(v44, "addObject:", v51);
            }

          }
        }
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v99, 16);
      }
      while (v46);
    }

    objc_msgSend(v93, "removeObjectsInArray:", v44);
    objc_msgSend(v93, "addObjectsFromArray:", v44);
    objc_msgSend(v44, "removeObjectsInArray:", v96->_junctions);
    -[NSMutableArray addObjectsFromArray:](v96->_junctions, "addObjectsFromArray:", v44);
    v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v53 = v93;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v69, v98, 16);
    if (v54)
    {
      v55 = *(_QWORD *)v70;
      do
      {
        for (m = 0; m != v54; ++m)
        {
          if (*(_QWORD *)v70 != v55)
            objc_enumerationMutation(v53);
          -[VKLabelNavRoadGraph evaluateDualCarriagewayForJunction:outputJunctionList:](v96->_roadGraph, "evaluateDualCarriagewayForJunction:outputJunctionList:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * m), v52);
        }
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v69, v98, 16);
      }
      while (v54);
    }

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v57 = v52;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v65, v97, 16);
    if (v58)
    {
      v59 = *(_QWORD *)v66;
      do
      {
        for (n = 0; n != v58; ++n)
        {
          if (*(_QWORD *)v66 != v59)
            objc_enumerationMutation(v57);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * n), "setDepthFromRoute:", 0, (_QWORD)v65);
        }
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v65, v97, 16);
      }
      while (v58);
    }

    objc_msgSend(v57, "removeObjectsInArray:", v96->_junctions);
    -[NSMutableArray addObjectsFromArray:](v96->_junctions, "addObjectsFromArray:", v57);
    -[NSMutableArray sortUsingComparator:](v96->_junctions, "sortUsingComparator:", &__block_literal_global_21807);
    -[LabelNavRouteLabeler _updateRoadStarts](v96, "_updateRoadStarts");
    -[LabelNavRouteLabeler _updateRoadsInGuidance](v96, "_updateRoadsInGuidance");
    -[LabelNavRouteLabeler _updatePreferredLabelPlacements](v96, "_updatePreferredLabelPlacements");
    -[LabelNavRouteLabeler _initalizeCurrentRoadInfo](v96, "_initalizeCurrentRoadInfo");
    -[LabelNavRouteLabeler _updateUniqueOffRouteRoads](v96, "_updateUniqueOffRouteRoads");
    -[LabelNavRouteLabeler _dedupOffRouteRoads](v96, "_dedupOffRouteRoads");

  }
  v61 = v95;
  if (v95)
  {
    v62 = (unint64_t *)&v95->__shared_owners_;
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
  return 1;
}

- (void)_updateUniqueOffRouteRoads
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSMutableArray *obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_junctions;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((objc_msgSend(v21, "isOnDualCarriageway") & 1) == 0)
        {
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          objc_msgSend(v21, "roads");
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v2 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          if (!v2)
            goto LABEL_4;
          v3 = *(_QWORD *)v31;
          v20 = *(_QWORD *)v31;
          while (1)
          {
            v4 = 0;
            v22 = v2;
            do
            {
              if (*(_QWORD *)v31 != v3)
                objc_enumerationMutation(v23);
              v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v4);
              if ((objc_msgSend(v6, "isOnRoute") & 1) == 0)
              {
                v28 = 0u;
                v29 = 0u;
                v26 = 0u;
                v27 = 0u;
                objc_msgSend(v21, "roads");
                v25 = (id)objc_claimAutoreleasedReturnValue();
                v7 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
                v24 = v4;
                if (v7)
                {
                  v8 = 0;
                  v9 = *(_QWORD *)v27;
                  v10 = 1;
                  do
                  {
                    for (j = 0; j != v7; ++j)
                    {
                      if (*(_QWORD *)v27 != v9)
                        objc_enumerationMutation(v25);
                      v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                      if (v12 != v6)
                      {
                        objc_msgSend(v6, "name");
                        v13 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v12, "name");
                        v14 = (void *)objc_claimAutoreleasedReturnValue();
                        v15 = objc_msgSend(v13, "isEqualToString:", v14);

                        if (v15)
                        {
                          v8 |= objc_msgSend(v12, "isOnRoute");
                          ++v10;
                        }
                      }
                    }
                    v7 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
                  }
                  while (v7);

                  if (v10 == 2)
                  {
                    v5 = 0;
                    goto LABEL_14;
                  }
                  if (v10 != 1)
                  {
                    v5 = v8 ^ 1;
                    goto LABEL_14;
                  }
                }
                else
                {

                }
                v5 = 1;
LABEL_14:
                v3 = v20;
                v2 = v22;
                v4 = v24;
                objc_msgSend(v6, "setIsRoadLabelUnique:", v5 & 1);
              }
              ++v4;
            }
            while (v4 != v2);
            v2 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
            if (!v2)
            {
LABEL_4:

              break;
            }
          }
        }
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v17);
  }

}

- (void)_updateRoadStarts
{
  unint64_t v3;
  unint64_t v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  char v12;
  char v13;
  double v14;
  double v15;
  uint64_t v16;
  VKRouteRoadInfo *v17;
  void *v18;
  void *v19;
  VKRouteRoadInfo *v20;
  void *v21;
  void *v22;
  double v23;
  id v24;

  -[NSMutableArray removeAllObjects](self->_routeRoadInfos, "removeAllObjects");
  -[LabelNavRouteLabeler currentRoadName](self, "currentRoadName");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = 0;
  v5 = 0.0;
  while (v3 < -[NSMutableArray count](self->_junctions, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_junctions, "objectAtIndexedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "outgoingRoad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
      goto LABEL_18;
    objc_msgSend(v7, "name");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v24 == v9)
    {

LABEL_18:
      objc_msgSend(v8, "setIsStartOfRoadName:", 0);
      objc_msgSend(v8, "length");
      v15 = v23 + v5;
      goto LABEL_2;
    }
    objc_msgSend(v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v24, "isEqualToString:", v10);

    if ((v11 & 1) != 0)
      goto LABEL_18;
    if (v3 && v5 < 30.0)
    {
      v12 = -[NSMutableSet containsObject:](self->_roadNamesInGuidance, "containsObject:", v24);
      v13 = v4 >= v3 ? 1 : v12;
      if ((v13 & 1) == 0)
      {
        do
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_junctions, "objectAtIndexedSubscript:", v4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "outgoingRoad");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v22, "areLabelsDisabled") & 1) == 0)
            objc_msgSend(v22, "setAreLabelsDisabled:", 1);

          ++v4;
        }
        while (v3 != v4);
      }
    }
    objc_msgSend(v8, "length");
    v15 = v14;
    objc_msgSend(v8, "setIsStartOfRoadName:", 1);
    objc_msgSend(v8, "name");
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = [VKRouteRoadInfo alloc];
    objc_msgSend(v8, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shieldGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[VKRouteRoadInfo initWithName:shieldGroup:offset:](v17, "initWithName:shieldGroup:offset:", v18, v19, objc_msgSend(v6, "routeOffset"));

    -[NSMutableArray addObject:](self->_routeRoadInfos, "addObject:", v20);
    v4 = v3;
    v24 = (id)v16;
LABEL_2:
    v5 = v15;

    ++v3;
  }

}

- (void)_updateRoadsInGuidance
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSMutableSet *roadNamesInGuidance;
  void *v10;
  unsigned int v11;
  double v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSMutableArray *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_junctions;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v7, "outgoingRoad");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        roadNamesInGuidance = self->_roadNamesInGuidance;
        objc_msgSend(v8, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setIsInGuidance:", -[NSMutableSet containsObject:](roadNamesInGuidance, "containsObject:", v10));

        objc_msgSend(v8, "setIsGuidanceStepStart:", 0);
        if (objc_msgSend(v8, "isInGuidance"))
        {
          v11 = objc_msgSend(v7, "routeOffset");
          v12 = COERCE_FLOAT((unint64_t)objc_msgSend(v7, "routeOffset") >> 32) + (double)v11;
          while (v4 < -[NSMutableArray count](self->_guidanceStepInfos, "count"))
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_guidanceStepInfos, "objectAtIndexedSubscript:", v4);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v12 + -0.1 > (double)(int)objc_msgSend(v13, "routePoint");

            if (!v14)
              break;
            ++v4;
          }
          if (v4 < -[NSMutableArray count](self->_guidanceStepInfos, "count"))
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_guidanceStepInfos, "objectAtIndexedSubscript:", v4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "roadName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "isEqualToString:", v17))
            {
              v18 = vabdd_f64(v12, (double)(int)objc_msgSend(v15, "routePoint")) < 0.1;

              if (v18)
              {
                objc_msgSend(v8, "setIsGuidanceStepStart:", 1);
                ++v4;
              }
            }
            else
            {

            }
          }
        }

      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v3);
  }

}

- (void)_updatePreferredLabelPlacements
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_junctions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        v9 = v6;
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "requiredLabelPlacement", (_QWORD)v15);
        v6 = v11;
        if ((v11 - 1) >= 2)
        {
          if ((_DWORD)v11 == 3)
          {
            if ((_DWORD)v9 == 1 && !self->_preferRightSideLabelPlacement)
              v6 = 2;
            else
              v6 = 1;
            goto LABEL_10;
          }
          v6 = v9;
          if ((_DWORD)v11 == 5)
          {
            if (self->_preferRightSideLabelPlacement)
            {
              v6 = 1;
            }
            else
            {
              -[VKPolylineOverlay composedRoute](self->_route, "composedRoute");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "steps");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectAtIndexedSubscript:", self->_stepIndex);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v14, "drivingSide"))
                v6 = 2;
              else
                v6 = 1;

            }
LABEL_10:
            objc_msgSend(v10, "setPreferredLabelPlacement:", v6);
            continue;
          }
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

- (void)_dedupOffRouteRoads
{
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t j;
  void *v8;
  id v9;
  const char *v10;
  size_t v11;
  std::string::size_type v12;
  std::string *p_dst;
  uint64_t v14;
  uint64_t v15;
  std::string *v16;
  std::string *v17;
  std::string *v18;
  size_t size;
  std::string::size_type v20;
  std::string::size_type v21;
  std::string::size_type v22;
  int v23;
  std::string *v24;
  std::string *v25;
  uint64_t v26;
  const void *v27;
  std::string::size_type v28;
  int v29;
  std::string *v30;
  id *p_data;
  std::string::pointer data;
  void *v33;
  double v34;
  double v35;
  std::string *v36;
  size_t v37;
  std::string::size_type v38;
  std::string::size_type v39;
  std::string::size_type v40;
  int v41;
  std::string *v42;
  std::string *v43;
  uint64_t v44;
  const void *v45;
  std::string::size_type v46;
  int v47;
  unsigned __int8 *v48;
  size_t v49;
  std::string::size_type v50;
  std::string::size_type v51;
  std::string::size_type v52;
  int v53;
  std::string *v54;
  std::string *v55;
  uint64_t v56;
  const void *v57;
  std::string::size_type v58;
  int v59;
  unsigned __int8 *v60;
  id v61;
  __int128 v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  _QWORD *v67;
  std::string *v68;
  std::string *v69;
  id v70;
  std::string *v71;
  std::string *v72;
  std::string *v73;
  __int128 v74;
  std::string::size_type v75;
  std::string *v76;
  std::string *v77;
  std::string *v78;
  void *v79;
  NSMutableArray *obj;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  void *v85;
  std::string::pointer v86;
  std::string __dst;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  void *__p;
  std::string *v97;
  unint64_t v98;
  std::string v99;
  id v100;
  _QWORD *v101;
  std::string *v102;
  std::string *v103;
  char *v104;
  unint64_t *v105;
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  __p = 0;
  v97 = 0;
  v98 = 0;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = self->_junctions;
  v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
  if (v2)
  {
    v81 = *(_QWORD *)v93;
    do
    {
      v82 = v2;
      for (i = 0; i != v82; ++i)
      {
        if (*(_QWORD *)v93 != v81)
          objc_enumerationMutation(obj);
        v3 = *(char **)(*((_QWORD *)&v92 + 1) + 8 * i);
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v86 = v3;
        objc_msgSend(v3, "roads");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
        if (v5)
        {
          v6 = *(_QWORD *)v89;
          v85 = v4;
          do
          {
            for (j = 0; j != v5; ++j)
            {
              if (*(_QWORD *)v89 != v6)
                objc_enumerationMutation(v4);
              v8 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
              if ((objc_msgSend(v8, "isOnRoute") & 1) == 0
                && objc_msgSend(v8, "roadHasName")
                && (objc_msgSend(v8, "areLabelsDisabled") & 1) == 0)
              {
                objc_msgSend(v8, "setSuppressRoadSignIfDeduped:", 0);
                objc_msgSend(v8, "name");
                v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v10 = (const char *)objc_msgSend(v9, "UTF8String");
                v11 = strlen(v10);
                if (v11 >= 0x7FFFFFFFFFFFFFF8)
                  abort();
                v12 = v11;
                if (v11 >= 0x17)
                {
                  v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v11 | 7) != 0x17)
                    v14 = v11 | 7;
                  v15 = v14 + 1;
                  p_dst = (std::string *)operator new(v14 + 1);
                  __dst.__r_.__value_.__l.__size_ = v12;
                  __dst.__r_.__value_.__r.__words[2] = v15 | 0x8000000000000000;
                  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
                }
                else
                {
                  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v11;
                  p_dst = &__dst;
                  if (!v11)
                  {
LABEL_24:
                    p_dst->__r_.__value_.__s.__data_[v12] = 0;

                    v16 = (std::string *)__p;
                    v17 = v97;
                    v18 = (std::string *)__p;
                    if (__p == v97)
                      goto LABEL_56;
                    size = __dst.__r_.__value_.__l.__size_;
                    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                      v20 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
                    else
                      v20 = __dst.__r_.__value_.__l.__size_;
                    if ((*((_BYTE *)&__dst.__r_.__value_.__s + 23) & 0x80) == 0)
                    {
                      v18 = (std::string *)__p;
                      if (!*((_BYTE *)&__dst.__r_.__value_.__s + 23))
                      {
                        v18 = (std::string *)__p;
                        while (1)
                        {
                          v21 = HIBYTE(v18->__r_.__value_.__r.__words[2]);
                          if ((v21 & 0x80u) != 0)
                            v21 = v18->__r_.__value_.__l.__size_;
                          if (v20 == v21)
                            goto LABEL_56;
                          v18 = (std::string *)((char *)v18 + 32);
                          if (v18 == v97)
                            goto LABEL_61;
                        }
                      }
                      do
                      {
                        v22 = HIBYTE(v18->__r_.__value_.__r.__words[2]);
                        v23 = (char)v22;
                        if ((v22 & 0x80u) != 0)
                          v22 = v18->__r_.__value_.__l.__size_;
                        if (v20 == v22)
                        {
                          if (v23 >= 0)
                            v24 = v18;
                          else
                            v24 = (std::string *)v18->__r_.__value_.__r.__words[0];
                          v25 = &__dst;
                          v26 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
                          while (v25->__r_.__value_.__s.__data_[0] == v24->__r_.__value_.__s.__data_[0])
                          {
                            v25 = (std::string *)((char *)v25 + 1);
                            v24 = (std::string *)((char *)v24 + 1);
                            if (!--v26)
                              goto LABEL_56;
                          }
                        }
                        v18 = (std::string *)((char *)v18 + 32);
                      }
                      while (v18 != v97);
LABEL_61:
                      v36 = v16;
                      if (v16 != v17)
                      {
                        v37 = __dst.__r_.__value_.__l.__size_;
                        if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                          v38 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
                        else
                          v38 = __dst.__r_.__value_.__l.__size_;
                        if ((*((_BYTE *)&__dst.__r_.__value_.__s + 23) & 0x80) == 0)
                        {
                          v36 = v16;
                          if (!*((_BYTE *)&__dst.__r_.__value_.__s + 23))
                          {
                            v36 = v16;
                            while (1)
                            {
                              v39 = HIBYTE(v36->__r_.__value_.__r.__words[2]);
                              if ((v39 & 0x80u) != 0)
                                v39 = v36->__r_.__value_.__l.__size_;
                              if (v38 == v39)
                                goto LABEL_94;
                              v36 = (std::string *)((char *)v36 + 32);
                              if (v36 == v17)
                                goto LABEL_95;
                            }
                          }
                          do
                          {
                            v40 = HIBYTE(v36->__r_.__value_.__r.__words[2]);
                            v41 = (char)v40;
                            if ((v40 & 0x80u) != 0)
                              v40 = v36->__r_.__value_.__l.__size_;
                            if (v38 == v40)
                            {
                              if (v41 >= 0)
                                v42 = v36;
                              else
                                v42 = (std::string *)v36->__r_.__value_.__r.__words[0];
                              v43 = &__dst;
                              v44 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
                              while (v43->__r_.__value_.__s.__data_[0] == v42->__r_.__value_.__s.__data_[0])
                              {
                                v43 = (std::string *)((char *)v43 + 1);
                                v42 = (std::string *)((char *)v42 + 1);
                                if (!--v44)
                                  goto LABEL_94;
                              }
                            }
                            v36 = (std::string *)((char *)v36 + 32);
                          }
                          while (v36 != v17);
LABEL_95:
                          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                          {
                            std::string::__init_copy_ctor_external(&v99, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
                            v16 = (std::string *)__p;
                            v17 = v97;
                          }
                          else
                          {
                            v99 = __dst;
                          }
                          v100 = 0;
                          v36 = v16;
                          if (v16 != v17)
                          {
                            v49 = v99.__r_.__value_.__l.__size_;
                            if ((v99.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                              v50 = HIBYTE(v99.__r_.__value_.__r.__words[2]);
                            else
                              v50 = v99.__r_.__value_.__l.__size_;
                            if ((*((_BYTE *)&v99.__r_.__value_.__s + 23) & 0x80) == 0)
                            {
                              v36 = v16;
                              if (!*((_BYTE *)&v99.__r_.__value_.__s + 23))
                              {
                                v36 = v16;
                                while (1)
                                {
                                  v51 = HIBYTE(v36->__r_.__value_.__r.__words[2]);
                                  if ((v51 & 0x80u) != 0)
                                    v51 = v36->__r_.__value_.__l.__size_;
                                  if (v50 == v51)
                                    goto LABEL_130;
                                  v36 = (std::string *)((char *)v36 + 32);
                                  if (v36 == v17)
                                    goto LABEL_132;
                                }
                              }
                              do
                              {
                                v52 = HIBYTE(v36->__r_.__value_.__r.__words[2]);
                                v53 = (char)v52;
                                if ((v52 & 0x80u) != 0)
                                  v52 = v36->__r_.__value_.__l.__size_;
                                if (v50 == v52)
                                {
                                  if (v53 >= 0)
                                    v54 = v36;
                                  else
                                    v54 = (std::string *)v36->__r_.__value_.__r.__words[0];
                                  v55 = &v99;
                                  v56 = HIBYTE(v99.__r_.__value_.__r.__words[2]);
                                  while (v55->__r_.__value_.__s.__data_[0] == v54->__r_.__value_.__s.__data_[0])
                                  {
                                    v55 = (std::string *)((char *)v55 + 1);
                                    v54 = (std::string *)((char *)v54 + 1);
                                    if (!--v56)
                                      goto LABEL_130;
                                  }
                                }
                                v36 = (std::string *)((char *)v36 + 32);
                              }
                              while (v36 != v17);
LABEL_132:
                              if (v98 <= (unint64_t)v17)
                              {
                                v63 = ((char *)v17 - (char *)v16) >> 5;
                                v64 = v63 + 1;
                                if ((unint64_t)(v63 + 1) >> 59)
                                  abort();
                                v65 = v98 - (_QWORD)v16;
                                if ((uint64_t)(v98 - (_QWORD)v16) >> 4 > v64)
                                  v64 = v65 >> 4;
                                if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFE0)
                                  v66 = 0x7FFFFFFFFFFFFFFLL;
                                else
                                  v66 = v64;
                                v105 = &v98;
                                if (v66)
                                {
                                  if (v66 >> 59)
                                    std::__throw_bad_array_new_length[abi:nn180100]();
                                  v67 = operator new(32 * v66);
                                }
                                else
                                {
                                  v67 = 0;
                                }
                                v69 = (std::string *)&v67[4 * v63];
                                v101 = v67;
                                v102 = v69;
                                v103 = v69;
                                v104 = (char *)&v67[4 * v66];
                                if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0)
                                {
                                  std::string::__init_copy_ctor_external((std::string *)&v67[4 * v63], v99.__r_.__value_.__l.__data_, v99.__r_.__value_.__l.__size_);
                                  v69 = v102;
                                  v71 = v103;
                                  v70 = v100;
                                }
                                else
                                {
                                  v70 = 0;
                                  *v69 = v99;
                                  v71 = (std::string *)&v67[4 * v63];
                                }
                                v67[4 * v63 + 3] = v70;
                                v68 = (std::string *)((char *)v71 + 32);
                                v72 = (std::string *)__p;
                                v73 = v97;
                                if (v97 == __p)
                                {
                                  __p = v69;
                                  v97 = (std::string *)((char *)v71 + 32);
                                  v98 = (unint64_t)v104;
                                }
                                else
                                {
                                  do
                                  {
                                    v74 = *(_OWORD *)&v73[-2].__r_.__value_.__r.__words[2];
                                    v69[-1].__r_.__value_.__l.__size_ = v73[-1].__r_.__value_.__l.__size_;
                                    *(_OWORD *)&v69[-2].__r_.__value_.__r.__words[2] = v74;
                                    v73[-2].__r_.__value_.__r.__words[2] = 0;
                                    v73[-1].__r_.__value_.__r.__words[0] = 0;
                                    v75 = v73[-1].__r_.__value_.__r.__words[2];
                                    v73[-1].__r_.__value_.__l.__size_ = 0;
                                    v73[-1].__r_.__value_.__r.__words[2] = 0;
                                    v69[-1].__r_.__value_.__r.__words[2] = v75;
                                    v69 = (std::string *)((char *)v69 - 32);
                                    v73 = (std::string *)((char *)v73 - 32);
                                  }
                                  while (v73 != v72);
                                  v73 = (std::string *)__p;
                                  v76 = v97;
                                  __p = v69;
                                  v97 = v68;
                                  v98 = (unint64_t)v104;
                                  while (v76 != v73)
                                  {

                                    if (v76[-1].__r_.__value_.__s.__data_[15] < 0)
                                      operator delete((void *)v76[-2].__r_.__value_.__r.__words[2]);
                                    v76 = (std::string *)((char *)v76 - 32);
                                  }
                                }
                                if (v73)
                                  operator delete(v73);
                              }
                              else
                              {
                                if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0)
                                {
                                  std::string::__init_copy_ctor_external(v17, v99.__r_.__value_.__l.__data_, v99.__r_.__value_.__l.__size_);
                                }
                                else
                                {
                                  v62 = *(_OWORD *)&v99.__r_.__value_.__l.__data_;
                                  v17->__r_.__value_.__r.__words[2] = v99.__r_.__value_.__r.__words[2];
                                  *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v62;
                                }
                                v17[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v100;
                                v68 = (std::string *)((char *)v17 + 32);
                              }
                              v97 = v68;
                              v36 = (std::string *)((char *)v68 - 32);
                              v61 = v100;
                              goto LABEL_161;
                            }
                            v57 = (const void *)v99.__r_.__value_.__r.__words[0];
                            v36 = v16;
                            while (1)
                            {
                              v58 = HIBYTE(v36->__r_.__value_.__r.__words[2]);
                              v59 = (char)v58;
                              if ((v58 & 0x80u) != 0)
                                v58 = v36->__r_.__value_.__l.__size_;
                              if (v50 == v58)
                              {
                                v60 = v59 >= 0
                                    ? (unsigned __int8 *)v36
                                    : (unsigned __int8 *)v36->__r_.__value_.__r.__words[0];
                                if (!memcmp(v57, v60, v49))
                                  break;
                              }
                              v36 = (std::string *)((char *)v36 + 32);
                              if (v36 == v17)
                                goto LABEL_132;
                            }
                          }
LABEL_130:
                          if (v17 == v36)
                            goto LABEL_132;
                          v61 = 0;
LABEL_161:

                          if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0)
                            operator delete(v99.__r_.__value_.__l.__data_);
LABEL_163:
                          objc_storeStrong((id *)&v36[1].__r_.__value_.__l.__data_, v86);
LABEL_164:
                          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                            operator delete(__dst.__r_.__value_.__l.__data_);
                          v4 = v85;
                          continue;
                        }
                        v45 = (const void *)__dst.__r_.__value_.__r.__words[0];
                        v36 = v16;
                        while (1)
                        {
                          v46 = HIBYTE(v36->__r_.__value_.__r.__words[2]);
                          v47 = (char)v46;
                          if ((v46 & 0x80u) != 0)
                            v46 = v36->__r_.__value_.__l.__size_;
                          if (v38 == v46)
                          {
                            v48 = v47 >= 0
                                ? (unsigned __int8 *)v36
                                : (unsigned __int8 *)v36->__r_.__value_.__r.__words[0];
                            if (!memcmp(v45, v48, v37))
                              break;
                          }
                          v36 = (std::string *)((char *)v36 + 32);
                          if (v36 == v17)
                            goto LABEL_95;
                        }
                      }
LABEL_94:
                      if (v17 == v36)
                        goto LABEL_95;
                      goto LABEL_163;
                    }
                    v27 = (const void *)__dst.__r_.__value_.__r.__words[0];
                    v18 = (std::string *)__p;
                    while (1)
                    {
                      v28 = HIBYTE(v18->__r_.__value_.__r.__words[2]);
                      v29 = (char)v28;
                      if ((v28 & 0x80u) != 0)
                        v28 = v18->__r_.__value_.__l.__size_;
                      if (v20 == v28)
                      {
                        v30 = v29 >= 0 ? v18 : (std::string *)v18->__r_.__value_.__r.__words[0];
                        if (!memcmp(v27, v30, size))
                          break;
                      }
                      v18 = (std::string *)((char *)v18 + 32);
                      if (v18 == v17)
                        goto LABEL_61;
                    }
LABEL_56:
                    if (v18 == v17)
                      goto LABEL_61;
                    data = v18[1].__r_.__value_.__l.__data_;
                    p_data = (id *)&v18[1].__r_.__value_.__l.__data_;
                    if (data == v86)
                    {
                      objc_msgSend(v8, "setSuppressRoadSignIfDeduped:", 0);
                    }
                    else
                    {
                      -[VKPolylineOverlay composedRoute](self->_route, "composedRoute");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "distanceFromPoint:toPoint:", objc_msgSend(*p_data, "routeOffset"), objc_msgSend(v86, "routeOffset"));
                      v35 = v34;

                      if (v35 >= 300.0)
                        objc_storeStrong(p_data, v86);
                      objc_msgSend(v8, "setSuppressRoadSignIfDeduped:", v35 < 300.0);
                    }
                    goto LABEL_164;
                  }
                }
                memmove(p_dst, v10, v12);
                goto LABEL_24;
              }
            }
            v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
          }
          while (v5);
        }

      }
      v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
    }
    while (v2);
  }

  v77 = (std::string *)__p;
  if (__p)
  {
    v78 = v97;
    v79 = __p;
    if (v97 != __p)
    {
      do
      {

        if (v78[-1].__r_.__value_.__s.__data_[15] < 0)
          operator delete((void *)v78[-2].__r_.__value_.__r.__words[2]);
        v78 = (std::string *)((char *)v78 - 32);
      }
      while (v78 != v77);
      v79 = __p;
    }
    v97 = v77;
    operator delete(v79);
  }
}

- (void)_initalizeCurrentRoadInfo
{
  self->_currentRoadNameIndex = -1;
  -[LabelNavRouteLabeler _updateCurrentRoadInfo](self, "_updateCurrentRoadInfo");
}

- (void)_updateCurrentRoadInfo
{
  uint64_t currentRoadNameIndex;
  uint64_t v4;
  uint64_t v5;
  unsigned int index;
  float v7;
  float offset;
  __shared_weak_count *cntrl;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  NSString *currentRoadName;
  NSString *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  NSString *v19;

  if (self->_isOnRoute)
  {
    currentRoadNameIndex = self->_currentRoadNameIndex;
    if (currentRoadNameIndex < -[NSMutableArray count](self->_routeRoadInfos, "count") - 1)
    {
      while (1)
      {
        v4 = currentRoadNameIndex + 1;
        -[NSMutableArray objectAtIndexedSubscript:](self->_routeRoadInfos, "objectAtIndexedSubscript:", currentRoadNameIndex + 1);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v18, "routeOffset");
        index = self->_routeUserOffset.index;
        if (index < v5)
          break;
        if (index == (_DWORD)v5)
        {
          v7 = *((float *)&v5 + 1);
          offset = self->_routeUserOffset.offset;

          if (offset < v7)
            goto LABEL_16;
        }
        else
        {

        }
        ++currentRoadNameIndex;
        if (v4 >= -[NSMutableArray count](self->_routeRoadInfos, "count") - 1)
          goto LABEL_16;
      }

    }
LABEL_16:
    if (currentRoadNameIndex != self->_currentRoadNameIndex)
    {
      self->_currentRoadNameIndex = currentRoadNameIndex;
      -[NSMutableArray objectAtIndexedSubscript:](self->_routeRoadInfos, "objectAtIndexedSubscript:", currentRoadNameIndex);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();

      currentRoadName = self->_currentRoadName;
      v14 = v19;
      if (currentRoadName != v19)
      {
        v15 = -[NSString isEqualToString:](currentRoadName, "isEqualToString:");
        v14 = v19;
        if (!v15)
        {
          -[LabelNavRouteLabeler setCurrentRoadName:](self, "setCurrentRoadName:", v19);
          -[NSMutableArray objectAtIndexedSubscript:](self->_routeRoadInfos, "objectAtIndexedSubscript:", self->_currentRoadNameIndex);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "shieldGroup");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[LabelNavRouteLabeler setCurrentShieldGroup:](self, "setCurrentShieldGroup:", v17);

          v14 = v19;
        }
      }

    }
  }
  else
  {
    cntrl = self->_currentRoadSign.__cntrl_;
    self->_currentRoadSign.__ptr_ = 0;
    self->_currentRoadSign.__cntrl_ = 0;
    if (cntrl)
    {
      v10 = (unint64_t *)((char *)cntrl + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
  }
}

- (BOOL)_findRouteOverlappingJunctionFrom:(int64_t)a3 routeJunctions:(void *)a4 lookBackward:(BOOL)a5 firstOverlap:(int64_t *)a6 secondOverlap:(int64_t *)a7
{
  unsigned __int8 v11;
  unsigned __int8 v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint8x8_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint8x8_t v30;
  unint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v35;
  BOOL v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  int v41;
  uint64_t v42;
  BOOL v43;
  int v44;
  uint64_t v45;
  BOOL v46;
  unint64_t v47;
  uint64_t v48;
  int8x8_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  unint64_t *v55;

  v48 = 0;
  v49 = 0;
  if ((v11 & 1) == 0)
  {
    v46 = a5;
    a5 = v46;
    if (v41)
    {
      v42 = operator new();
      mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v42, "VectorKitLabels", 0x5ED09DD50000000FLL);
      a5 = v46;
    }
  }
  v50 = mdm::Allocator::instance(void)::alloc;
  v51 = 0;
  if ((v12 & 1) == 0)
  {
    v43 = a5;
    a5 = v43;
    if (v44)
    {
      v45 = operator new();
      mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v45, "VectorKitLabels", 0x5ED09DD50000000FLL);
      a5 = v43;
    }
  }
  v52 = mdm::Allocator::instance(void)::alloc;
  v53 = 0;
  v54 = 1065353216;
  if (a5)
  {
    if ((a3 & 0x8000000000000000) == 0)
    {
      do
      {
        v47 = 0;
        v13 = *(_QWORD *)(*(_QWORD *)a4 + 16 * a3 + 8);
        v47 = v13;
        if (v49)
        {
          v14 = 0x9DDFEA08EB382D69 * (((8 * v13) + 8) ^ HIDWORD(v13));
          v15 = 0x9DDFEA08EB382D69 * (HIDWORD(v13) ^ (v14 >> 47) ^ v14);
          v16 = 0x9DDFEA08EB382D69 * (v15 ^ (v15 >> 47));
          v17 = (uint8x8_t)vcnt_s8(v49);
          v17.i16[0] = vaddlv_u8(v17);
          if (v17.u32[0] > 1uLL)
          {
            v18 = v16;
            if (v16 >= *(_QWORD *)&v49)
              v18 = v16 % *(_QWORD *)&v49;
          }
          else
          {
            v18 = v16 & (*(_QWORD *)&v49 - 1);
          }
          v19 = *(_QWORD **)(v48 + 8 * v18);
          if (v19)
          {
            v20 = (_QWORD *)*v19;
            if (v20)
            {
              if (v17.u32[0] < 2uLL)
              {
                while (1)
                {
                  v22 = v20[1];
                  if (v22 == v16)
                  {
                    if (v20[2] == v13)
                      goto LABEL_55;
                  }
                  else if ((v22 & (*(_QWORD *)&v49 - 1)) != v18)
                  {
                    goto LABEL_25;
                  }
                  v20 = (_QWORD *)*v20;
                  if (!v20)
                    goto LABEL_25;
                }
              }
              do
              {
                v21 = v20[1];
                if (v21 == v16)
                {
                  if (v20[2] == v13)
                  {
LABEL_55:
                    *a6 = a3;
                    *a7 = v20[3];
                    goto LABEL_57;
                  }
                }
                else
                {
                  if (v21 >= *(_QWORD *)&v49)
                    v21 %= *(_QWORD *)&v49;
                  if (v21 != v18)
                    break;
                }
                v20 = (_QWORD *)*v20;
              }
              while (v20);
            }
          }
        }
LABEL_25:
        v55 = &v47;
        std::__hash_table<std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,std::__unordered_map_hasher<GeoCodecsConnectivityJunction *,std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,std::hash<GeoCodecsConnectivityJunction *>,std::equal_to<GeoCodecsConnectivityJunction *>,true>,std::__unordered_map_equal<GeoCodecsConnectivityJunction *,std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,std::equal_to<GeoCodecsConnectivityJunction *>,std::hash<GeoCodecsConnectivityJunction *>,true>,geo::StdAllocator<std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,mdm::Allocator>>::__emplace_unique_key_args<GeoCodecsConnectivityJunction *,std::piecewise_construct_t const&,std::tuple<GeoCodecsConnectivityJunction * const&>,std::tuple<>>((float *)&v48, v13, &v55)[3] = a3;
      }
      while (a3-- >= 1);
    }
LABEL_50:
    v36 = 0;
    v37 = v51;
    if (!v51)
      goto LABEL_52;
    goto LABEL_51;
  }
  v24 = a3 + 1;
  v25 = *(_QWORD *)a4;
  if (v24 >= (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4)
    goto LABEL_50;
  while (1)
  {
    v47 = 0;
    v26 = *(_QWORD *)(v25 + 16 * v24 + 8);
    v47 = v26;
    if (v49)
    {
      v27 = 0x9DDFEA08EB382D69 * (((8 * v26) + 8) ^ HIDWORD(v26));
      v28 = 0x9DDFEA08EB382D69 * (HIDWORD(v26) ^ (v27 >> 47) ^ v27);
      v29 = 0x9DDFEA08EB382D69 * (v28 ^ (v28 >> 47));
      v30 = (uint8x8_t)vcnt_s8(v49);
      v30.i16[0] = vaddlv_u8(v30);
      if (v30.u32[0] > 1uLL)
      {
        v31 = v29;
        if (v29 >= *(_QWORD *)&v49)
          v31 = v29 % *(_QWORD *)&v49;
      }
      else
      {
        v31 = v29 & (*(_QWORD *)&v49 - 1);
      }
      v32 = *(_QWORD **)(v48 + 8 * v31);
      if (v32)
      {
        v33 = (_QWORD *)*v32;
        if (v33)
          break;
      }
    }
LABEL_49:
    v55 = &v47;
    std::__hash_table<std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,std::__unordered_map_hasher<GeoCodecsConnectivityJunction *,std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,std::hash<GeoCodecsConnectivityJunction *>,std::equal_to<GeoCodecsConnectivityJunction *>,true>,std::__unordered_map_equal<GeoCodecsConnectivityJunction *,std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,std::equal_to<GeoCodecsConnectivityJunction *>,std::hash<GeoCodecsConnectivityJunction *>,true>,geo::StdAllocator<std::__hash_value_type<GeoCodecsConnectivityJunction *,long>,mdm::Allocator>>::__emplace_unique_key_args<GeoCodecsConnectivityJunction *,std::piecewise_construct_t const&,std::tuple<GeoCodecsConnectivityJunction * const&>,std::tuple<>>((float *)&v48, v26, &v55)[3] = v24++;
    v25 = *(_QWORD *)a4;
    if (v24 >= (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4)
      goto LABEL_50;
  }
  if (v30.u32[0] < 2uLL)
  {
    while (1)
    {
      v35 = v33[1];
      if (v35 == v29)
      {
        if (v33[2] == v26)
          goto LABEL_56;
      }
      else if ((v35 & (*(_QWORD *)&v49 - 1)) != v31)
      {
        goto LABEL_49;
      }
      v33 = (_QWORD *)*v33;
      if (!v33)
        goto LABEL_49;
    }
  }
  while (1)
  {
    v34 = v33[1];
    if (v34 == v29)
      break;
    if (v34 >= *(_QWORD *)&v49)
      v34 %= *(_QWORD *)&v49;
    if (v34 != v31)
      goto LABEL_49;
LABEL_39:
    v33 = (_QWORD *)*v33;
    if (!v33)
      goto LABEL_49;
  }
  if (v33[2] != v26)
    goto LABEL_39;
LABEL_56:
  *a6 = v33[3];
  *a7 = v24;
LABEL_57:
  v36 = 1;
  v37 = v51;
  if (v51)
  {
    do
    {
LABEL_51:
      v38 = (_QWORD *)*v37;
      (*(void (**)(uint64_t))(*(_QWORD *)v52 + 40))(v52);
      v37 = v38;
    }
    while (v38);
  }
LABEL_52:
  v39 = v48;
  v48 = 0;
  if (v39)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v50 + 40))(v50, v39, 8 * *(_QWORD *)&v49);
  return v36;
}

- (BOOL)_updateActiveRouteRange
{
  __n128 v2;
  unsigned __int8 v4;
  _QWORD *next;
  uint64_t v6;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  double v19;
  uint64_t *v20;
  __int128 *v21;
  __int128 *v22;
  __int128 *v23;
  __int128 *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 *v27;
  __int128 *v28;
  __int128 *v29;
  uint64_t v30;
  __int128 *v31;
  unsigned int index;
  unint64_t v33;
  unint64_t v34;
  __int128 *v35;
  float v36;
  BOOL v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  _BOOL4 v42;
  uint64_t v43;
  unsigned int *v44;
  unsigned int v45;
  float v46;
  unsigned int *v47;
  unsigned int v48;
  float v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[7];
  _QWORD v56[2];
  _QWORD v57[8];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  __n128 (*v61)(__n128 *, __n128 *);
  uint64_t (*v62)(uint64_t);
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v58 = 0;
  v59 = &v58;
  v60 = 0x5012000000;
  v61 = __Block_byref_object_copy__21786;
  v62 = __Block_byref_object_dispose__21787;
  v63 = "";
  v64 = 0;
  v65 = 0;
  v66 = 0;
  {
    v51 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v51, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v67 = mdm::Allocator::instance(void)::alloc;
  v57[0] = 0;
  v57[1] = v57;
  v2.n128_u64[0] = 0x4012000000;
  v57[2] = 0x4012000000;
  v57[3] = __Block_byref_object_copy__15;
  v57[4] = __Block_byref_object_dispose__16;
  v57[5] = "";
  v57[6] = 0xBF80000000000000;
  next = self->_tiles.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = *(_QWORD **)(next[2] + 24);
      v8 = (std::__shared_weak_count *)v7[1];
      v56[0] = *v7;
      v56[1] = v8;
      if (v8)
      {
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
      }
      -[VKPolylineOverlay composedRoute](self->_route, "composedRoute");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v6;
      v55[1] = 3221225472;
      v55[2] = __47__LabelNavRouteLabeler__updateActiveRouteRange__block_invoke;
      v55[3] = &unk_1E42F3EE0;
      v55[5] = &v58;
      v55[6] = next + 2;
      v55[4] = v57;
      objc_msgSend(v11, "forEachSnappedPath:", v55);

      if (v8)
      {
        v12 = (unint64_t *)&v8->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
      next = (_QWORD *)*next;
    }
    while (next);
  }
  v14 = v59[6];
  v15 = v59[7];
  v16 = 126 - 2 * __clz((uint64_t)(v15 - v14) >> 4);
  if (v15 == v14)
    v17 = 0;
  else
    v17 = v16;
  *(double *)&v18 = std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,RouteJunctionInfo *,false>(v14, v15, v17, 1, v2);
  v20 = v59;
  v21 = (__int128 *)v59[6];
  v22 = (__int128 *)v59[7];
  v23 = v21;
  if (v21 == v22)
  {
LABEL_26:
    v28 = (__int128 *)v59[6];
    v22 = v23;
  }
  else
  {
    v24 = v21 - 1;
    do
    {
      if (v24 + 2 == v22)
      {
        v23 = (__int128 *)v59[7];
        goto LABEL_26;
      }
      v25 = *((_QWORD *)v24 + 3);
      v26 = *((_QWORD *)v24++ + 5);
    }
    while (v25 != v26);
    v27 = v24 + 2;
    if (v24 + 2 != v22)
    {
      do
      {
        if (*((_QWORD *)v24 + 1) != *((_QWORD *)v27 + 1))
        {
          v18 = *v27;
          v24[1] = *v27;
          ++v24;
        }
        ++v27;
      }
      while (v27 != v22);
      v21 = (__int128 *)v20[6];
      v22 = (__int128 *)v20[7];
    }
    v29 = v24 + 1;
    if (v24 + 1 == v22)
    {
      v28 = v21;
    }
    else
    {
      v28 = v21;
      v20[7] = (uint64_t)v29;
      v22 = (__int128 *)v20[7];
    }
  }
  if ((unint64_t)((char *)v22 - (char *)v28) < 0x11)
  {
    if (self->_useRouteSubrange)
      goto LABEL_46;
    goto LABEL_75;
  }
  if (!self->_isOnRoute)
  {
    v41 = 0;
    goto LABEL_54;
  }
  v30 = v22 - v28;
  v31 = v28;
  if (v22 == v21)
    goto LABEL_48;
  index = self->_routeUserOffset.index;
  *(float *)&v18 = self->_routeUserOffset.offset;
  v19 = 3.18618444e-58;
  v33 = v30;
  do
  {
    v34 = v33 >> 1;
    v35 = &v21[v33 >> 1];
    if (*(_DWORD *)v35 == index)
    {
      v36 = *((float *)v35 + 1);
      if (vabds_f32(v36, *(float *)&v18) >= 0.00000011921 && v36 < *(float *)&v18)
      {
LABEL_35:
        v21 = v35 + 1;
        v34 = v33 + ~v34;
      }
    }
    else if (*(_DWORD *)v35 < index)
    {
      goto LABEL_35;
    }
    v33 = v34;
  }
  while (v34);
  v31 = v21;
LABEL_48:
  v39 = v31 - v28;
  if (v39 <= 1)
    v39 = 1;
  v40 = v39 - 1;
  if (v40 >= v30 - 1)
    v41 = v30 - 1;
  else
    v41 = v40;
LABEL_54:
  v56[0] = 0;
  v54 = 0;
  v42 = -[LabelNavRouteLabeler _findRouteOverlappingJunctionFrom:routeJunctions:lookBackward:firstOverlap:secondOverlap:](self, "_findRouteOverlappingJunctionFrom:routeJunctions:lookBackward:firstOverlap:secondOverlap:", v41, v20 + 6, 1, v56, &v54, *(double *)&v18, v19);
  if (v42)
  {
    if (v56[0] + 1 < v54)
      v43 = v56[0] + 1;
    else
      v43 = v54;
    v44 = (unsigned int *)(v59[6] + 16 * v43);
    v45 = *v44;
    v46 = *((float *)v44 + 1);
  }
  else
  {
    v45 = 0;
    v46 = 0.0;
  }
  v52 = 0;
  v53 = 0;
  if (!-[LabelNavRouteLabeler _findRouteOverlappingJunctionFrom:routeJunctions:lookBackward:firstOverlap:secondOverlap:](self, "_findRouteOverlappingJunctionFrom:routeJunctions:lookBackward:firstOverlap:secondOverlap:", v41, v59 + 6, 0, &v53, &v52))
  {
    if (self->_useRouteSubrange)
    {
      if (v42)
      {
        v49 = 0.0;
        v48 = -1;
        goto LABEL_66;
      }
LABEL_46:
      self->_useRouteSubrange = 0;
      v38 = 1;
      goto LABEL_76;
    }
    if (v42)
    {
      v49 = 0.0;
      v48 = -1;
      goto LABEL_73;
    }
LABEL_75:
    v38 = 0;
    goto LABEL_76;
  }
  v47 = (unsigned int *)(v59[6] + 16 * v53);
  v48 = *v47;
  v49 = *((float *)v47 + 1);
  if (self->_useRouteSubrange)
  {
LABEL_66:
    if (self->_routeSubrangeEnd.index != v48
      || vabds_f32(self->_routeSubrangeEnd.offset, v49) >= 0.00000011921
      || self->_routeSubrangeStart.index != v45
      || vabds_f32(self->_routeSubrangeStart.offset, v46) >= 0.00000011921)
    {
      self->_routeSubrangeEnd.index = v48;
      self->_routeSubrangeEnd.offset = v49;
      self->_routeSubrangeStart.index = v45;
      v38 = 1;
      goto LABEL_74;
    }
    goto LABEL_75;
  }
LABEL_73:
  v38 = 1;
  self->_useRouteSubrange = 1;
  self->_routeSubrangeEnd.index = v48;
  self->_routeSubrangeEnd.offset = v49;
  self->_routeSubrangeStart.index = v45;
LABEL_74:
  self->_routeSubrangeStart.offset = v46;
LABEL_76:
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(&v58, 8);
  if (v64)
  {
    v65 = v64;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v67 + 40))(v67, v64, v66 - v64);
  }
  return v38;
}

- (unsigned)computeRoutePositionForPOIAtPixel:(const void *)a3 currentPosition:(unsigned __int8)a4 context:(NavContext *)a5
{
  if (self->_isOnRoute)
    return -[VKLabelNavRoadGraph computeRoutePositionForPOIAtPixel:currentPosition:context:](self->_roadGraph, "computeRoutePositionForPOIAtPixel:currentPosition:context:", a3, a4, a5);
  else
    return 9;
}

- (BOOL)needsLayout
{
  return self->_needsLayout;
}

- (VKPolylineOverlay)route
{
  return self->_route;
}

- (BOOL)drawRoadSigns
{
  return self->_drawRoadSigns;
}

- (void)setDrawRoadSigns:(BOOL)a3
{
  self->_drawRoadSigns = a3;
}

- (PolylineCoordinate)routeUserOffset
{
  return self->_routeUserOffset;
}

- (NSString)currentLocationText
{
  return self->_currentLocationText;
}

- (const)activeSigns
{
  return &self->_activeSigns;
}

- (NSString)currentRoadName
{
  return self->_currentRoadName;
}

- (void)setCurrentRoadName:(id)a3
{
  objc_storeStrong((id *)&self->_currentRoadName, a3);
}

- (NSString)currentShieldGroup
{
  return self->_currentShieldGroup;
}

- (void)setCurrentShieldGroup:(id)a3
{
  objc_storeStrong((id *)&self->_currentShieldGroup, a3);
}

- (BOOL)debugDisableRoadSignLimit
{
  return self->_debugDisableRoadSignLimit;
}

- (void)artworkCache
{
  return self->_artworkCache;
}

- (const)visibleSigns
{
  return &self->_visibleSigns;
}

- (BOOL)debugEnableShieldsOnRouteLine
{
  return self->_debugEnableShieldsOnRouteLine;
}

- (void)setDebugEnableShieldsOnRouteLine:(BOOL)a3
{
  self->_debugEnableShieldsOnRouteLine = a3;
}

- (void).cxx_destruct
{
  AvoidanceRectWithPriority *begin;
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  char *v10;
  char *end;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  char *v16;
  char *v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD *next;
  void **value;
  _QWORD *v24;
  void **v25;
  _QWORD *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  _QWORD *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;

  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((_QWORD *)self->_rightTurnOrientations._storage.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((_QWORD *)self->_leftTurnOrientations._storage.__tree_.__pair1_.__value_.__left_);
  begin = self->_avoidanceRects.__begin_;
  if (begin)
  {
    self->_avoidanceRects.__end_ = begin;
    (*(void (**)(Allocator *, AvoidanceRectWithPriority *, int64_t))(*(_QWORD *)self->_avoidanceRects.__end_cap_.__value__2._allocator
                                                                                     + 40))(self->_avoidanceRects.__end_cap_.__value__2._allocator, begin, self->_avoidanceRects.__end_cap_.__value_ - begin);
  }
  cntrl = self->_styleManager.__cntrl_;
  if (!cntrl)
    goto LABEL_7;
  v5 = (unint64_t *)((char *)cntrl + 8);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 - 1, v5));
  if (!v6)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    v7 = self->_currentRoadSign.__cntrl_;
    if (!v7)
      goto LABEL_13;
  }
  else
  {
LABEL_7:
    v7 = self->_currentRoadSign.__cntrl_;
    if (!v7)
      goto LABEL_13;
  }
  v8 = (unint64_t *)((char *)v7 + 8);
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9 - 1, v8));
  if (!v9)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v7 + 16))(v7);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
  }
LABEL_13:
  objc_storeStrong((id *)&self->_currentShieldGroup, 0);
  objc_storeStrong((id *)&self->_currentRoadName, 0);
  objc_storeStrong((id *)&self->_routeRoadInfos, 0);
  objc_storeStrong((id *)&self->_guidanceStepInfos, 0);
  objc_storeStrong((id *)&self->_roadNamesInGuidance, 0);
  objc_storeStrong((id *)&self->_visibleShieldGroups, 0);
  objc_storeStrong((id *)&self->_visibleLabels, 0);
  objc_storeStrong((id *)&self->_visibleLabelsByName, 0);
  objc_storeStrong((id *)&self->_fadingLabels, 0);
  v10 = (char *)self->_visibleSigns.__begin_;
  if (v10)
  {
    end = (char *)self->_visibleSigns.__end_;
    v12 = self->_visibleSigns.__begin_;
    if (end != v10)
    {
      do
      {
        v13 = (std::__shared_weak_count *)*((_QWORD *)end - 1);
        if (v13)
        {
          p_shared_owners = (unint64_t *)&v13->__shared_owners_;
          do
            v15 = __ldaxr(p_shared_owners);
          while (__stlxr(v15 - 1, p_shared_owners));
          if (!v15)
          {
            ((void (*)(std::__shared_weak_count *, void *))v13->__on_zero_shared)(v13, v12);
            std::__shared_weak_count::__release_weak(v13);
          }
        }
        end -= 16;
      }
      while (end != v10);
      v12 = self->_visibleSigns.__begin_;
    }
    self->_visibleSigns.__end_ = v10;
    (*(void (**)(Allocator *, void *, int64_t))(*(_QWORD *)self->_visibleSigns.__end_cap_.__value__2._allocator
                                                                + 40))(self->_visibleSigns.__end_cap_.__value__2._allocator, v12, (char *)self->_visibleSigns.__end_cap_.__value_ - (char *)v12);
  }
  v16 = (char *)self->_activeSigns.__begin_;
  if (v16)
  {
    v17 = (char *)self->_activeSigns.__end_;
    v18 = self->_activeSigns.__begin_;
    if (v17 != v16)
    {
      do
      {
        v19 = (std::__shared_weak_count *)*((_QWORD *)v17 - 1);
        if (v19)
        {
          v20 = (unint64_t *)&v19->__shared_owners_;
          do
            v21 = __ldaxr(v20);
          while (__stlxr(v21 - 1, v20));
          if (!v21)
          {
            ((void (*)(std::__shared_weak_count *, void *))v19->__on_zero_shared)(v19, v18);
            std::__shared_weak_count::__release_weak(v19);
          }
        }
        v17 -= 16;
      }
      while (v17 != v16);
      v18 = self->_activeSigns.__begin_;
    }
    self->_activeSigns.__end_ = v16;
    (*(void (**)(Allocator *, void *, int64_t))(*(_QWORD *)self->_activeSigns.__end_cap_.__value__2._allocator
                                                                + 40))(self->_activeSigns.__end_cap_.__value__2._allocator, v18, (char *)self->_activeSigns.__end_cap_.__value_ - (char *)v18);
  }
  objc_storeStrong((id *)&self->_roadGraph, 0);
  objc_storeStrong((id *)&self->_junctions, 0);
  next = self->_pendingTiles.__table_.__p1_.__value_.__next_;
  while (next)
  {
    v26 = next;
    next = (_QWORD *)*next;
    v27 = (std::__shared_weak_count *)v26[3];
    if (v27)
    {
      v28 = (unint64_t *)&v27->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
    (*(void (**)(Allocator *, _QWORD *, uint64_t))(*(_QWORD *)self->_pendingTiles.__table_.__p1_.__value__2._allocator
                                                           + 40))(self->_pendingTiles.__table_.__p1_.__value__2._allocator, v26, 32);
  }
  value = self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_;
  self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Allocator *, void **, unint64_t))(*(_QWORD *)self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator
                                                                   + 40))(self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator, value, 8 * self->_pendingTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  v24 = self->_tiles.__table_.__p1_.__value_.__next_;
  while (v24)
  {
    v30 = v24;
    v24 = (_QWORD *)*v24;
    v31 = (std::__shared_weak_count *)v30[3];
    if (v31)
    {
      v32 = (unint64_t *)&v31->__shared_owners_;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    (*(void (**)(Allocator *, _QWORD *, uint64_t))(*(_QWORD *)self->_tiles.__table_.__p1_.__value__2._allocator
                                                           + 40))(self->_tiles.__table_.__p1_.__value__2._allocator, v30, 32);
  }
  v25 = self->_tiles.__table_.__bucket_list_.__ptr_.__value_;
  self->_tiles.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v25)
    (*(void (**)(Allocator *, void **, unint64_t))(*(_QWORD *)self->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator
                                                                   + 40))(self->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator, v25, 8 * self->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  objc_storeStrong((id *)&self->_currentLocationText, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

void __47__LabelNavRouteLabeler__updateActiveRouteRange__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _OWORD *v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  _OWORD *v28;
  _OWORD *v29;
  unint64_t v30;
  _OWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  unint64_t *v58;
  unint64_t v59;
  char v60;
  char v61;
  uint64_t v62;
  _OWORD *v63;
  _OWORD *v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _OWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _OWORD *v76;
  uint64_t v77;
  id v78;
  _QWORD *v79;
  std::__shared_weak_count *v80;
  geo::MapNode *v81;
  std::__shared_weak_count *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v78 = a2;
  objc_msgSend(v78, "edges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v84 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        objc_msgSend(v8, "mapEdge");
        v9 = (std::__shared_weak_count *)v79[2];
        v81 = (geo::MapNode *)v79[1];
        v82 = v9;
        if (v9)
        {
          p_shared_owners = (unint64_t *)&v9->__shared_owners_;
          do
            v11 = __ldxr(p_shared_owners);
          while (__stxr(v11 + 1, p_shared_owners));
        }
        v12 = *(uint64_t **)(**(_QWORD **)(a1 + 48) + 24);
        v13 = *v12;
        v14 = (std::__shared_weak_count *)v12[1];
        if (v14)
        {
          v15 = (unint64_t *)&v14->__shared_owners_;
          do
            v16 = __ldxr(v15);
          while (__stxr(v16 + 1, v15));
        }
        v17 = VectorTileMapper::mapNodeJunctionToTile(&v81, v13);
        if (!v14)
          goto LABEL_19;
        v18 = (unint64_t *)&v14->__shared_owners_;
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
          v20 = v82;
          if (!v82)
            goto LABEL_25;
        }
        else
        {
LABEL_19:
          v20 = v82;
          if (!v82)
            goto LABEL_25;
        }
        v21 = (unint64_t *)&v20->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
LABEL_25:
        if (v80)
        {
          v23 = (unint64_t *)&v80->__shared_owners_;
          do
            v24 = __ldaxr(v23);
          while (__stlxr(v24 - 1, v23));
          if (!v24)
          {
            ((void (*)())v80->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v80);
          }
        }
        v25 = objc_msgSend(v8, "clippedFront");
        if (v17)
          v26 = v25;
        else
          v26 = 1;
        if ((v26 & 1) == 0)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = v17;
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56))
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = objc_msgSend(v8, "routeOffsetA");
            v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v28 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
            v29 = *(_OWORD **)(v27 + 56);
            v30 = *(_QWORD *)(v27 + 64);
            if ((unint64_t)v29 >= v30)
            {
              v32 = *(_QWORD *)(v27 + 48);
              v33 = ((uint64_t)v29 - v32) >> 4;
              v34 = v33 + 1;
              if ((unint64_t)(v33 + 1) >> 60)
                abort();
              v35 = v30 - v32;
              if (v35 >> 3 > v34)
                v34 = v35 >> 3;
              if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF0)
                v36 = 0xFFFFFFFFFFFFFFFLL;
              else
                v36 = v34;
              if (v36)
              {
                v37 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v27 + 72) + 16))(*(_QWORD *)(v27 + 72), 16 * v36, 8);
                v38 = (_OWORD *)(v37 + 16 * v33);
                v39 = v37 + 16 * v36;
                if (v37)
                  *v38 = *v28;
              }
              else
              {
                v39 = 0;
                v38 = (_OWORD *)(16 * v33);
              }
              v41 = *(_QWORD *)(v27 + 48);
              v40 = *(_QWORD *)(v27 + 56);
              v42 = v38;
              if (v40 != v41)
              {
                do
                {
                  *--v42 = *(_OWORD *)(v40 - 16);
                  v40 -= 16;
                }
                while (v40 != v41);
                v40 = *(_QWORD *)(v27 + 48);
              }
              v31 = v38 + 1;
              *(_QWORD *)(v27 + 48) = v42;
              *(_QWORD *)(v27 + 56) = v38 + 1;
              v43 = *(_QWORD *)(v27 + 64);
              *(_QWORD *)(v27 + 64) = v39;
              if (v40)
                (*(void (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v27 + 72) + 40))(*(_QWORD *)(v27 + 72), v40, v43 - v40);
            }
            else
            {
              if (v29)
                *v29 = *v28;
              v31 = v29 + 1;
            }
            *(_QWORD *)(v27 + 56) = v31;
          }
        }
        objc_msgSend(v8, "mapEdge");
        v44 = (std::__shared_weak_count *)v79[4];
        v81 = (geo::MapNode *)v79[3];
        v82 = v44;
        if (v44)
        {
          v45 = (unint64_t *)&v44->__shared_owners_;
          do
            v46 = __ldxr(v45);
          while (__stxr(v46 + 1, v45));
        }
        v47 = *(uint64_t **)(**(_QWORD **)(a1 + 48) + 24);
        v48 = *v47;
        v49 = (std::__shared_weak_count *)v47[1];
        if (v49)
        {
          v50 = (unint64_t *)&v49->__shared_owners_;
          do
            v51 = __ldxr(v50);
          while (__stxr(v51 + 1, v50));
        }
        v52 = VectorTileMapper::mapNodeJunctionToTile(&v81, v48);
        if (!v49)
          goto LABEL_65;
        v53 = (unint64_t *)&v49->__shared_owners_;
        do
          v54 = __ldaxr(v53);
        while (__stlxr(v54 - 1, v53));
        if (!v54)
        {
          ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
          std::__shared_weak_count::__release_weak(v49);
          v55 = v82;
          if (!v82)
            goto LABEL_71;
        }
        else
        {
LABEL_65:
          v55 = v82;
          if (!v82)
            goto LABEL_71;
        }
        v56 = (unint64_t *)&v55->__shared_owners_;
        do
          v57 = __ldaxr(v56);
        while (__stlxr(v57 - 1, v56));
        if (!v57)
        {
          ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
          std::__shared_weak_count::__release_weak(v55);
        }
LABEL_71:
        if (v80)
        {
          v58 = (unint64_t *)&v80->__shared_owners_;
          do
            v59 = __ldaxr(v58);
          while (__stlxr(v59 - 1, v58));
          if (!v59)
          {
            ((void (*)())v80->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v80);
          }
        }
        v60 = objc_msgSend(v8, "clippedBack");
        if (v52)
          v61 = v60;
        else
          v61 = 1;
        if ((v61 & 1) == 0)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = v52;
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56))
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = objc_msgSend(v8, "routeOffsetB");
            v62 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v63 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
            v64 = *(_OWORD **)(v62 + 56);
            v65 = *(_QWORD *)(v62 + 64);
            if ((unint64_t)v64 >= v65)
            {
              v66 = *(_QWORD *)(v62 + 48);
              v67 = ((uint64_t)v64 - v66) >> 4;
              v68 = v67 + 1;
              if ((unint64_t)(v67 + 1) >> 60)
                abort();
              v69 = v65 - v66;
              if (v69 >> 3 > v68)
                v68 = v69 >> 3;
              if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF0)
                v70 = 0xFFFFFFFFFFFFFFFLL;
              else
                v70 = v68;
              if (v70)
              {
                v71 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v62 + 72) + 16))(*(_QWORD *)(v62 + 72), 16 * v70, 8);
                v72 = (_OWORD *)(v71 + 16 * v67);
                v73 = v71 + 16 * v70;
                if (v71)
                  *v72 = *v63;
              }
              else
              {
                v73 = 0;
                v72 = (_OWORD *)(16 * v67);
              }
              v75 = *(_QWORD *)(v62 + 48);
              v74 = *(_QWORD *)(v62 + 56);
              v76 = v72;
              if (v74 != v75)
              {
                do
                {
                  *--v76 = *(_OWORD *)(v74 - 16);
                  v74 -= 16;
                }
                while (v74 != v75);
                v74 = *(_QWORD *)(v62 + 48);
              }
              v7 = v72 + 1;
              *(_QWORD *)(v62 + 48) = v76;
              *(_QWORD *)(v62 + 56) = v72 + 1;
              v77 = *(_QWORD *)(v62 + 64);
              *(_QWORD *)(v62 + 64) = v73;
              if (v74)
                (*(void (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v62 + 72) + 40))(*(_QWORD *)(v62 + 72), v74, v77 - v74);
            }
            else
            {
              if (v64)
                *v64 = *v63;
              v7 = v64 + 1;
            }
            *(_QWORD *)(v62 + 56) = v7;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
    }
    while (v4);
  }

}

uint64_t __45__LabelNavRouteLabeler__addJunctionsForTile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double *v6;
  double *v7;
  float v8;
  float v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  v6 = (double *)v4;
  v7 = (double *)v5;
  v8 = v6[25];
  v9 = v7[25];
  if (v8 < v9)
    v10 = -1;
  else
    v10 = v8 > v9;
  if (!v10)
  {
    objc_msgSend(v6, "incomingRoad");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      && (objc_msgSend(v7, "incomingRoad"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          !v12))
    {
      v10 = -1;
    }
    else
    {
      objc_msgSend(v6, "incomingRoad");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {

        v10 = 0;
      }
      else
      {
        objc_msgSend(v7, "incomingRoad");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v14 != 0;

      }
    }
  }

  return v10;
}

- (void)_addJunctionsForTile:
{
  uint64_t v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  char v35;
  void *v36;
  unsigned int v37;
  __int128 *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;

  v2 = *a2;
  if (*(_QWORD *)(*a2 + 40) == **(_QWORD **)(a1 + 8) && *(_QWORD *)(v2 + 48) == **(_QWORD **)(a1 + 16))
  {
    v4 = objc_alloc(MEMORY[0x1E0D27488]);
    objc_msgSend(**(id **)(a1 + 24), "road");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feature");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "init:withMultiSectionFeatureInterface:", v2, v6);

    v8 = **(_QWORD **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v9, "road");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "feature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containingTile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "vectorTilePtr");
      v14 = v43;
      if (v44)
      {
        p_shared_owners = &v44->__shared_owners_;
        do
          v16 = __ldaxr((unint64_t *)p_shared_owners);
        while (__stlxr(v16 - 1, (unint64_t *)p_shared_owners));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
          std::__shared_weak_count::__release_weak(v44);
        }
      }
    }
    else
    {
      v14 = 0;
      v43 = 0;
      v44 = 0;
    }

    if (!geo::codec::TileKeyEquals((_QWORD *)(v8 + 4), (_QWORD *)(v14 + 4)) || *(_DWORD *)v8 != *(_DWORD *)v14)
    {

LABEL_44:
      return;
    }
    if (v14 == v8)
    {
      v29 = objc_msgSend(v9, "get");
      v28 = *(_QWORD *)v29;
      v39 = *(_OWORD *)(v29 + 24);
      v41 = *(_OWORD *)(v29 + 8);
      v20 = *(_QWORD *)(v29 + 40);
      v23 = *(_QWORD *)(v29 + 48);
    }
    else
    {
      v17 = objc_msgSend(v9, "get");
      v18 = *(_QWORD *)(v17 + 40);
      if (v18 && (v19 = (v18 - *(_QWORD *)(v14 + 688)) >> 5, v19 < *(_QWORD *)(v8 + 696)))
        v20 = *(_QWORD *)(v8 + 688) + 32 * v19;
      else
        v20 = 0;
      v21 = *(_QWORD *)(v17 + 48);
      if (v21 && (v22 = (v21 - *(_QWORD *)(v14 + 688)) >> 5, v22 < *(_QWORD *)(v8 + 696)))
        v23 = *(_QWORD *)(v8 + 688) + 32 * v22;
      else
        v23 = 0;
      v39 = *(_OWORD *)(v17 + 24);
      v41 = *(_OWORD *)(v17 + 8);
      if (*(_QWORD *)v17)
      {
        v24 = *(_QWORD *)v17 - *(_QWORD *)(v14 + 32);
        v25 = 0xCF3CF3CF3CF3CF3DLL * (v24 >> 3);
        v26 = *(_QWORD *)(v8 + 32);
        v27 = v26 + v24;
        if (v25 >= 0xCF3CF3CF3CF3CF3DLL * ((*(_QWORD *)(v8 + 40) - v26) >> 3))
          v28 = 0;
        else
          v28 = v27;
      }
      else
      {
        v28 = 0;
      }
    }

    objc_msgSend(**(id **)(a1 + 24), "road");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isFlipped");

    if (objc_msgSend(**(id **)(a1 + 24), "isPartialStart"))
    {
      v32 = objc_msgSend(**(id **)(a1 + 24), "startRouteCoordinate");
      v33 = *(_QWORD *)(a1 + 40);
      v34 = *(_DWORD *)v33 != (_DWORD)v32 || vabds_f32(*((float *)&v32 + 1), *(float *)(v33 + 4)) >= 0.00000011921;
    }
    else
    {
      v34 = 0;
    }
    v35 = objc_msgSend(**(id **)(a1 + 24), "isPartialEnd", v39, v41);
    **(_QWORD **)(a1 + 40) = objc_msgSend(**(id **)(a1 + 24), "endRouteCoordinate");
    v43 = objc_msgSend(**(id **)(a1 + 24), "startRouteCoordinate");
    v44 = (std::__shared_weak_count *)objc_msgSend(**(id **)(a1 + 24), "endRouteCoordinate");
    v45 = v28;
    v46 = v42;
    v47 = v40;
    v48 = v20;
    v49 = v23;
    v50 = v42;
    if (v34)
    {
      v36 = **(void ***)(a1 + 24);
      if ((v31 & 1) != 0)
      {
        *((_QWORD *)&v50 + 1) = objc_msgSend(v36, "roadRange");
        if ((v35 & 1) == 0)
          goto LABEL_43;
        goto LABEL_39;
      }
      *(_QWORD *)&v50 = objc_msgSend(v36, "roadRange");
      if ((v35 & 1) != 0)
        goto LABEL_41;
    }
    else if ((v35 & 1) != 0)
    {
      if ((_DWORD)v31)
      {
LABEL_39:
        objc_msgSend(**(id **)(a1 + 24), "roadRange");
        v38 = &v50;
LABEL_42:
        *(_QWORD *)v38 = v37;
        goto LABEL_43;
      }
LABEL_41:
      objc_msgSend(**(id **)(a1 + 24), "roadRange");
      v38 = (__int128 *)((char *)&v50 + 8);
      goto LABEL_42;
    }
LABEL_43:
    objc_msgSend(*(id *)(**(_QWORD **)(a1 + 48) + 184), "addRouteRoadEdge:atA:isRouteRefineJunction:tile:junctionList:", &v43, v31 ^ 1, 0, *(_QWORD *)(a1 + 56), **(_QWORD **)(a1 + 64));
    objc_msgSend(*(id *)(**(_QWORD **)(a1 + 48) + 184), "addRouteRoadEdge:atA:isRouteRefineJunction:tile:junctionList:", &v43, v31, 0, *(_QWORD *)(a1 + 56), **(_QWORD **)(a1 + 64));
    goto LABEL_44;
  }
}

- (__n128)_addJunctionsForTile:
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_QWORD *)a2 = &off_1E42C7B80;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  v4 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 56) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v4;
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL __43__LabelNavRouteLabeler_grabTilesFromScene___block_invoke(uint64_t a1, void *a2)
{
  return std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>((_QWORD *)(a1 + 32), *(_QWORD *)objc_msgSend(a2, "tile")) != 0;
}

@end
