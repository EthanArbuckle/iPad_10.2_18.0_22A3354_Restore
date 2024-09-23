@implementation VKLabelNavRoadGraph

- (void)routeJunctionsHaveChanged
{
  char *next;
  unint64_t value;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  self->_simplifiedRouteValid = 0;
  self->_simplifiedRoutePoints.__end_ = self->_simplifiedRoutePoints.__begin_;
  self->_routeFeatureMapValid = 0;
  if (self->_routeFeatureMap.__table_.__p2_.__value_)
  {
    next = (char *)self->_routeFeatureMap.__table_.__p1_.__value_.__next_;
    if (next)
    {
      do
      {
        v10 = *(char **)next;
        v11 = (std::__shared_weak_count *)*((_QWORD *)next + 7);
        if (v11)
        {
          p_shared_owners = (unint64_t *)&v11->__shared_owners_;
          do
            v13 = __ldaxr(p_shared_owners);
          while (__stlxr(v13 - 1, p_shared_owners));
          if (!v13)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v11->__on_zero_shared)(v11, a2);
            std::__shared_weak_count::__release_weak(v11);
          }
        }
        if (next[39] < 0)
          (*(void (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)next + 5) + 40))(*((_QWORD *)next + 5), *((_QWORD *)next + 2), *((_QWORD *)next + 4) & 0x7FFFFFFFFFFFFFFFLL);
        (*(void (**)(Allocator *, char *, uint64_t))(*(_QWORD *)self->_routeFeatureMap.__table_.__p1_.__value__2._allocator
                                                             + 40))(self->_routeFeatureMap.__table_.__p1_.__value__2._allocator, next, 64);
        next = v10;
      }
      while (v10);
    }
    self->_routeFeatureMap.__table_.__p1_.__value_.__next_ = 0;
    value = self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (i = 0; i != value; ++i)
        self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    self->_routeFeatureMap.__table_.__p2_.__value_ = 0;
  }
  self->_oppositeCarriagewayJunctionsValid = 0;
  -[NSMutableArray removeAllObjects](self->_oppositeCarriagewayJunctions, "removeAllObjects");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_tileDatasByIndex, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9++), "setOppositeCarriagewayJunctionsValid:", 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)reset
{
  _QWORD *next;
  unint64_t value;
  uint64_t i;
  _QWORD *v6;
  unint64_t v7;
  uint64_t j;
  _QWORD *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  _QWORD *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;

  if (self->_tiles.__table_.__p2_.__value_)
  {
    next = self->_tiles.__table_.__p1_.__value_.__next_;
    while (next)
    {
      v9 = next;
      next = (_QWORD *)*next;
      v10 = (std::__shared_weak_count *)v9[3];
      if (v10)
      {
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *, SEL))v10->__on_zero_shared)(v10, a2);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
      (*(void (**)(Allocator *, _QWORD *, uint64_t))(*(_QWORD *)self->_tiles.__table_.__p1_.__value__2._allocator
                                                             + 40))(self->_tiles.__table_.__p1_.__value__2._allocator, v9, 32);
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
  if (self->_duplicateTiles.__table_.__p2_.__value_)
  {
    v6 = self->_duplicateTiles.__table_.__p1_.__value_.__next_;
    while (v6)
    {
      v13 = v6;
      v6 = (_QWORD *)*v6;
      v14 = (std::__shared_weak_count *)v13[3];
      if (v14)
      {
        v15 = (unint64_t *)&v14->__shared_owners_;
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *, SEL))v14->__on_zero_shared)(v14, a2);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      (*(void (**)(Allocator *, _QWORD *, uint64_t))(*(_QWORD *)self->_duplicateTiles.__table_.__p1_.__value__2._allocator
                                                             + 40))(self->_duplicateTiles.__table_.__p1_.__value__2._allocator, v13, 32);
    }
    self->_duplicateTiles.__table_.__p1_.__value_.__next_ = 0;
    v7 = self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (v7)
    {
      for (j = 0; j != v7; ++j)
        self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
    }
    self->_duplicateTiles.__table_.__p2_.__value_ = 0;
  }
  -[NSMutableDictionary removeAllObjects](self->_tileDatasByIndex, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_intersections, "removeAllObjects");
  self->_offRouteJunctionsValid = 0;
  -[NSMutableArray removeAllObjects](self->_offRouteJunctions, "removeAllObjects");
  -[VKLabelNavRoadGraph routeJunctionsHaveChanged](self, "routeJunctionsHaveChanged");
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
  unsigned __int8 v9;
  int v10;
  uint64_t v11;
  geo::read_write_lock *v12;
  const char *v13;
  malloc_zone_t *zone;
  int v15;
  uint64_t v16;
  geo::read_write_lock *v17;
  const char *v18;
  malloc_zone_t *v19;
  int v20;
  uint64_t v21;
  geo::read_write_lock *v22;
  const char *v23;
  malloc_zone_t *v24;
  int v25;
  uint64_t v26;
  geo::read_write_lock *v27;
  const char *v28;
  malloc_zone_t *v29;
  int v30;
  uint64_t v31;
  geo::read_write_lock *v32;
  const char *v33;
  malloc_zone_t *v34;
  int v35;
  uint64_t v36;
  geo::read_write_lock *v37;
  const char *v38;
  malloc_zone_t *v39;
  int v40;
  uint64_t v41;
  geo::read_write_lock *v42;
  const char *v43;
  malloc_zone_t *v44;
  int v45;
  uint64_t v46;
  geo::read_write_lock *v47;
  const char *v48;
  malloc_zone_t *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;

  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  if ((v2 & 1) == 0)
  {
    v50 = self;
    self = v50;
    if (v10)
    {
      v11 = operator new();
      *(_QWORD *)(v11 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v11 + 24) = "VectorKitLabels";
      *(_OWORD *)(v11 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v11 = &off_1E42B5668;
      *(_QWORD *)(v11 + 8) = "VectorKitLabels";
      *(_OWORD *)(v11 + 72) = 0u;
      *(_OWORD *)(v11 + 88) = 0u;
      *(_OWORD *)(v11 + 104) = 0u;
      *(_OWORD *)(v11 + 120) = 0u;
      *(_OWORD *)(v11 + 136) = 0u;
      *(_OWORD *)(v11 + 152) = 0u;
      *(_OWORD *)(v11 + 168) = 0u;
      *(_OWORD *)(v11 + 184) = 0u;
      *(_OWORD *)(v11 + 200) = 0u;
      *(_OWORD *)(v11 + 216) = 0u;
      *(_OWORD *)(v11 + 232) = 0u;
      *(_QWORD *)(v11 + 248) = 0;
      *(_OWORD *)(v11 + 56) = 0u;
      v12 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v11 + 56), 0);
      if ((_DWORD)v12)
        geo::read_write_lock::logFailure(v12, (uint64_t)"initialization", v13);
      zone = malloc_create_zone(0, 0);
      *(_QWORD *)(v11 + 48) = zone;
      malloc_set_zone_name(zone, "VectorKitLabels");
      *(_QWORD *)(v11 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v11;
      self = v50;
    }
  }
  *((_QWORD *)self + 3) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 4) = 0;
  if ((v3 & 1) == 0)
  {
    v51 = self;
    self = v51;
    if (v15)
    {
      v16 = operator new();
      *(_QWORD *)(v16 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v16 + 24) = "VectorKitLabels";
      *(_OWORD *)(v16 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v16 = &off_1E42B5668;
      *(_QWORD *)(v16 + 8) = "VectorKitLabels";
      *(_OWORD *)(v16 + 72) = 0u;
      *(_OWORD *)(v16 + 88) = 0u;
      *(_OWORD *)(v16 + 104) = 0u;
      *(_OWORD *)(v16 + 120) = 0u;
      *(_OWORD *)(v16 + 136) = 0u;
      *(_OWORD *)(v16 + 152) = 0u;
      *(_OWORD *)(v16 + 168) = 0u;
      *(_OWORD *)(v16 + 184) = 0u;
      *(_OWORD *)(v16 + 200) = 0u;
      *(_OWORD *)(v16 + 216) = 0u;
      *(_OWORD *)(v16 + 232) = 0u;
      *(_QWORD *)(v16 + 248) = 0;
      *(_OWORD *)(v16 + 56) = 0u;
      v17 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v16 + 56), 0);
      if ((_DWORD)v17)
        geo::read_write_lock::logFailure(v17, (uint64_t)"initialization", v18);
      v19 = malloc_create_zone(0, 0);
      *(_QWORD *)(v16 + 48) = v19;
      malloc_set_zone_name(v19, "VectorKitLabels");
      *(_QWORD *)(v16 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v16;
      self = v51;
    }
  }
  *((_QWORD *)self + 5) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 6) = 0;
  *((_DWORD *)self + 14) = 1065353216;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  if ((v4 & 1) == 0)
  {
    v52 = self;
    self = v52;
    if (v20)
    {
      v21 = operator new();
      *(_QWORD *)(v21 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v21 + 24) = "VectorKitLabels";
      *(_OWORD *)(v21 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v21 = &off_1E42B5668;
      *(_QWORD *)(v21 + 8) = "VectorKitLabels";
      *(_OWORD *)(v21 + 72) = 0u;
      *(_OWORD *)(v21 + 88) = 0u;
      *(_OWORD *)(v21 + 104) = 0u;
      *(_OWORD *)(v21 + 120) = 0u;
      *(_OWORD *)(v21 + 136) = 0u;
      *(_OWORD *)(v21 + 152) = 0u;
      *(_OWORD *)(v21 + 168) = 0u;
      *(_OWORD *)(v21 + 184) = 0u;
      *(_OWORD *)(v21 + 200) = 0u;
      *(_OWORD *)(v21 + 216) = 0u;
      *(_OWORD *)(v21 + 232) = 0u;
      *(_QWORD *)(v21 + 248) = 0;
      *(_OWORD *)(v21 + 56) = 0u;
      v22 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v21 + 56), 0);
      if ((_DWORD)v22)
        geo::read_write_lock::logFailure(v22, (uint64_t)"initialization", v23);
      v24 = malloc_create_zone(0, 0);
      *(_QWORD *)(v21 + 48) = v24;
      malloc_set_zone_name(v24, "VectorKitLabels");
      *(_QWORD *)(v21 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v21;
      self = v52;
    }
  }
  *((_QWORD *)self + 10) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 11) = 0;
  if ((v5 & 1) == 0)
  {
    v53 = self;
    self = v53;
    if (v25)
    {
      v26 = operator new();
      *(_QWORD *)(v26 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v26 + 24) = "VectorKitLabels";
      *(_OWORD *)(v26 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v26 = &off_1E42B5668;
      *(_QWORD *)(v26 + 8) = "VectorKitLabels";
      *(_OWORD *)(v26 + 72) = 0u;
      *(_OWORD *)(v26 + 88) = 0u;
      *(_OWORD *)(v26 + 104) = 0u;
      *(_OWORD *)(v26 + 120) = 0u;
      *(_OWORD *)(v26 + 136) = 0u;
      *(_OWORD *)(v26 + 152) = 0u;
      *(_OWORD *)(v26 + 168) = 0u;
      *(_OWORD *)(v26 + 184) = 0u;
      *(_OWORD *)(v26 + 200) = 0u;
      *(_OWORD *)(v26 + 216) = 0u;
      *(_OWORD *)(v26 + 232) = 0u;
      *(_QWORD *)(v26 + 248) = 0;
      *(_OWORD *)(v26 + 56) = 0u;
      v27 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v26 + 56), 0);
      if ((_DWORD)v27)
        geo::read_write_lock::logFailure(v27, (uint64_t)"initialization", v28);
      v29 = malloc_create_zone(0, 0);
      *(_QWORD *)(v26 + 48) = v29;
      malloc_set_zone_name(v29, "VectorKitLabels");
      *(_QWORD *)(v26 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v26;
      self = v53;
    }
  }
  *((_QWORD *)self + 12) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 13) = 0;
  *((_DWORD *)self + 28) = 1065353216;
  *((_QWORD *)self + 27) = 0xBF80000000000000;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 30) = 0;
  if ((v6 & 1) == 0)
  {
    v54 = self;
    self = v54;
    if (v30)
    {
      v31 = operator new();
      *(_QWORD *)(v31 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v31 + 24) = "VectorKitLabels";
      *(_OWORD *)(v31 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v31 = &off_1E42B5668;
      *(_QWORD *)(v31 + 8) = "VectorKitLabels";
      *(_OWORD *)(v31 + 72) = 0u;
      *(_OWORD *)(v31 + 88) = 0u;
      *(_OWORD *)(v31 + 104) = 0u;
      *(_OWORD *)(v31 + 120) = 0u;
      *(_OWORD *)(v31 + 136) = 0u;
      *(_OWORD *)(v31 + 152) = 0u;
      *(_OWORD *)(v31 + 168) = 0u;
      *(_OWORD *)(v31 + 184) = 0u;
      *(_OWORD *)(v31 + 200) = 0u;
      *(_OWORD *)(v31 + 216) = 0u;
      *(_OWORD *)(v31 + 232) = 0u;
      *(_QWORD *)(v31 + 248) = 0;
      *(_OWORD *)(v31 + 56) = 0u;
      v32 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v31 + 56), 0);
      if ((_DWORD)v32)
        geo::read_write_lock::logFailure(v32, (uint64_t)"initialization", v33);
      v34 = malloc_create_zone(0, 0);
      *(_QWORD *)(v31 + 48) = v34;
      malloc_set_zone_name(v34, "VectorKitLabels");
      *(_QWORD *)(v31 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v31;
      self = v54;
    }
  }
  *((_QWORD *)self + 31) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 32) = 0;
  if ((v7 & 1) == 0)
  {
    v55 = self;
    self = v55;
    if (v35)
    {
      v36 = operator new();
      *(_QWORD *)(v36 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v36 + 24) = "VectorKitLabels";
      *(_OWORD *)(v36 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v36 = &off_1E42B5668;
      *(_QWORD *)(v36 + 8) = "VectorKitLabels";
      *(_OWORD *)(v36 + 72) = 0u;
      *(_OWORD *)(v36 + 88) = 0u;
      *(_OWORD *)(v36 + 104) = 0u;
      *(_OWORD *)(v36 + 120) = 0u;
      *(_OWORD *)(v36 + 136) = 0u;
      *(_OWORD *)(v36 + 152) = 0u;
      *(_OWORD *)(v36 + 168) = 0u;
      *(_OWORD *)(v36 + 184) = 0u;
      *(_OWORD *)(v36 + 200) = 0u;
      *(_OWORD *)(v36 + 216) = 0u;
      *(_OWORD *)(v36 + 232) = 0u;
      *(_QWORD *)(v36 + 248) = 0;
      *(_OWORD *)(v36 + 56) = 0u;
      v37 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v36 + 56), 0);
      if ((_DWORD)v37)
        geo::read_write_lock::logFailure(v37, (uint64_t)"initialization", v38);
      v39 = malloc_create_zone(0, 0);
      *(_QWORD *)(v36 + 48) = v39;
      malloc_set_zone_name(v39, "VectorKitLabels");
      *(_QWORD *)(v36 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v36;
      self = v55;
    }
  }
  *((_QWORD *)self + 33) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 34) = 0;
  *((_DWORD *)self + 70) = 1065353216;
  *((_QWORD *)self + 38) = 0;
  *((_QWORD *)self + 39) = 0;
  *((_QWORD *)self + 37) = 0;
  if ((v8 & 1) == 0)
  {
    v56 = self;
    self = v56;
    if (v40)
    {
      v41 = operator new();
      *(_QWORD *)(v41 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v41 + 24) = "VectorKitLabels";
      *(_OWORD *)(v41 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v41 = &off_1E42B5668;
      *(_QWORD *)(v41 + 8) = "VectorKitLabels";
      *(_OWORD *)(v41 + 72) = 0u;
      *(_OWORD *)(v41 + 88) = 0u;
      *(_OWORD *)(v41 + 104) = 0u;
      *(_OWORD *)(v41 + 120) = 0u;
      *(_OWORD *)(v41 + 136) = 0u;
      *(_OWORD *)(v41 + 152) = 0u;
      *(_OWORD *)(v41 + 168) = 0u;
      *(_OWORD *)(v41 + 184) = 0u;
      *(_OWORD *)(v41 + 200) = 0u;
      *(_OWORD *)(v41 + 216) = 0u;
      *(_OWORD *)(v41 + 232) = 0u;
      *(_QWORD *)(v41 + 248) = 0;
      *(_OWORD *)(v41 + 56) = 0u;
      v42 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v41 + 56), 0);
      if ((_DWORD)v42)
        geo::read_write_lock::logFailure(v42, (uint64_t)"initialization", v43);
      v44 = malloc_create_zone(0, 0);
      *(_QWORD *)(v41 + 48) = v44;
      malloc_set_zone_name(v44, "VectorKitLabels");
      *(_QWORD *)(v41 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v41;
      self = v56;
    }
  }
  *((_QWORD *)self + 40) = mdm::Allocator::instance(void)::alloc;
  *((_QWORD *)self + 44) = 0;
  *((_QWORD *)self + 45) = 0;
  *((_QWORD *)self + 43) = 0;
  if ((v9 & 1) == 0)
  {
    v57 = self;
    self = v57;
    if (v45)
    {
      v46 = operator new();
      *(_QWORD *)(v46 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v46 + 24) = "VectorKitLabels";
      *(_OWORD *)(v46 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v46 = &off_1E42B5668;
      *(_QWORD *)(v46 + 8) = "VectorKitLabels";
      *(_OWORD *)(v46 + 72) = 0u;
      *(_OWORD *)(v46 + 88) = 0u;
      *(_OWORD *)(v46 + 104) = 0u;
      *(_OWORD *)(v46 + 120) = 0u;
      *(_OWORD *)(v46 + 136) = 0u;
      *(_OWORD *)(v46 + 152) = 0u;
      *(_OWORD *)(v46 + 168) = 0u;
      *(_OWORD *)(v46 + 184) = 0u;
      *(_OWORD *)(v46 + 200) = 0u;
      *(_OWORD *)(v46 + 216) = 0u;
      *(_OWORD *)(v46 + 232) = 0u;
      *(_QWORD *)(v46 + 248) = 0;
      *(_OWORD *)(v46 + 56) = 0u;
      v47 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v46 + 56), 0);
      if ((_DWORD)v47)
        geo::read_write_lock::logFailure(v47, (uint64_t)"initialization", v48);
      v49 = malloc_create_zone(0, 0);
      *(_QWORD *)(v46 + 48) = v49;
      malloc_set_zone_name(v49, "VectorKitLabels");
      *(_QWORD *)(v46 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v46;
      self = v57;
    }
  }
  *((_QWORD *)self + 46) = mdm::Allocator::instance(void)::alloc;
  return self;
}

- (VKLabelNavRoadGraph)initWithJunctions:(id)a3
{
  id v5;
  VKLabelNavRoadGraph *v6;
  VKLabelNavRoadGraph *v7;
  VKLabelNavRoadGraph *v8;
  unint64_t prime;
  int8x8_t value;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *tileDatasByIndex;
  unint64_t v16;
  int8x8_t v17;
  unint64_t v18;
  uint8x8_t v19;
  uint64_t v20;
  NSMutableArray *v21;
  NSMutableArray *intersections;
  NSMutableArray *v23;
  NSMutableArray *offRouteJunctions;
  NSMutableArray *v25;
  NSMutableArray *oppositeCarriagewayJunctions;
  VKLabelNavRoadGraph *v27;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)VKLabelNavRoadGraph;
  v6 = -[VKLabelNavRoadGraph init](&v29, sel_init);
  v7 = v6;
  v8 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_junctions, a3);
    prime = vcvtps_u32_f32(32.0 / v8->_tiles.__table_.__p3_.__value_);
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    value = (int8x8_t)v8->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (prime > *(_QWORD *)&value)
      goto LABEL_7;
    if (prime < *(_QWORD *)&value)
    {
      v11 = vcvtps_u32_f32((float)v8->_tiles.__table_.__p2_.__value_ / v8->_tiles.__table_.__p3_.__value_);
      if (*(_QWORD *)&value < 3uLL || (v12 = (uint8x8_t)vcnt_s8(value), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
      {
        v11 = std::__next_prime(v11);
      }
      else
      {
        v13 = 1 << -(char)__clz(v11 - 1);
        if (v11 >= 2)
          v11 = v13;
      }
      if (prime <= v11)
        prime = v11;
      if (prime < *(_QWORD *)&value)
LABEL_7:
        std::__hash_table<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::__unordered_map_hasher<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,md::TrafficFeatureHash,std::equal_to<VKTrafficFeature * {__strong}>,true>,std::__unordered_map_equal<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::equal_to<VKTrafficFeature * {__strong}>,md::TrafficFeatureHash,true>,geo::StdAllocator<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,mdm::Allocator>>::__do_rehash<true>((uint64_t)&v7->_tiles, prime);
    }
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tileDatasByIndex = v8->_tileDatasByIndex;
    v8->_tileDatasByIndex = v14;

    v16 = vcvtps_u32_f32(32.0 / v8->_duplicateTiles.__table_.__p3_.__value_);
    if (v16 == 1)
    {
      v16 = 2;
    }
    else if ((v16 & (v16 - 1)) != 0)
    {
      v16 = std::__next_prime(v16);
    }
    v17 = (int8x8_t)v8->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (v16 > *(_QWORD *)&v17)
      goto LABEL_23;
    if (v16 < *(_QWORD *)&v17)
    {
      v18 = vcvtps_u32_f32((float)v8->_duplicateTiles.__table_.__p2_.__value_ / v8->_duplicateTiles.__table_.__p3_.__value_);
      if (*(_QWORD *)&v17 < 3uLL || (v19 = (uint8x8_t)vcnt_s8(v17), v19.i16[0] = vaddlv_u8(v19), v19.u32[0] > 1uLL))
      {
        v18 = std::__next_prime(v18);
      }
      else
      {
        v20 = 1 << -(char)__clz(v18 - 1);
        if (v18 >= 2)
          v18 = v20;
      }
      if (v16 <= v18)
        v16 = v18;
      if (v16 < *(_QWORD *)&v17)
LABEL_23:
        std::__hash_table<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::__unordered_map_hasher<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,md::TrafficFeatureHash,std::equal_to<VKTrafficFeature * {__strong}>,true>,std::__unordered_map_equal<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::equal_to<VKTrafficFeature * {__strong}>,md::TrafficFeatureHash,true>,geo::StdAllocator<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,mdm::Allocator>>::__do_rehash<true>((uint64_t)&v7->_duplicateTiles, v16);
    }
    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    intersections = v8->_intersections;
    v8->_intersections = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    offRouteJunctions = v8->_offRouteJunctions;
    v8->_offRouteJunctions = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    oppositeCarriagewayJunctions = v8->_oppositeCarriagewayJunctions;
    v8->_oppositeCarriagewayJunctions = v25;

    v27 = v8;
  }

  return v8;
}

- (void)startingLabelLayoutWithContext:(NavContext *)a3 routeUserOffset:(PolylineCoordinate)a4
{
  __float2 v6;

  self->_screenRouteValid = 0;
  v6 = __sincosf_stret(*((float *)a3->var3 + 105));
  self->_unitHeading._e[0] = v6.__cosval;
  self->_unitHeading._e[1] = v6.__sinval;
  self->_routeUserOffset = a4;
}

- (void)setTiles:(const void *)a3
{
  _QWORD *next;
  char v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  NSMutableDictionary *tileDatasByIndex;
  void *v14;
  _QWORD *i;
  unint64_t v16;
  unint64_t *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  VKLabelNavTileData *v21;
  NSMutableDictionary *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  char v26;

  next = self->_tiles.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v6 = 0;
    do
    {
      v7 = next[2];
      if (!std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>(a3, v7))
      {
        if (std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>(&self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value_, v7))
        {
          v8 = std::__hash_table<std::__hash_value_type<altitude::Tile *,unsigned int>,std::__unordered_map_hasher<altitude::Tile *,std::__hash_value_type<altitude::Tile *,unsigned int>,std::hash<altitude::Tile *>,std::equal_to<altitude::Tile *>,true>,std::__unordered_map_equal<altitude::Tile *,std::__hash_value_type<altitude::Tile *,unsigned int>,std::equal_to<altitude::Tile *>,std::hash<altitude::Tile *>,true>,std::allocator<std::__hash_value_type<altitude::Tile *,unsigned int>>>::find<altitude::Tile *>(&self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value_, v7);
          if (v8)
          {
            std::__hash_table<std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,std::__unordered_map_hasher<geo::QuadTile,std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,geo::QuadTileHash,std::equal_to<geo::QuadTile>,true>,std::__unordered_map_equal<geo::QuadTile,std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,std::equal_to<geo::QuadTile>,geo::QuadTileHash,true>,geo::StdAllocator<std::__hash_value_type<geo::QuadTile,md::LabelCachingStore<geo::QuadTile,std::shared_ptr<md::StandardLabelMapTile>,std::weak_ptr<md::StandardLabelMapTile>,geo::QuadTileHash,std::equal_to<geo::QuadTile>>::MapEntry>,mdm::Allocator>>::remove((uint64_t)&v24, &self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value_, v8);
            v9 = v24;
            v24 = 0;
            if (v9)
            {
              if (v26)
              {
                v10 = *(std::__shared_weak_count **)(v9 + 24);
                if (v10)
                {
                  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
                  do
                    v12 = __ldaxr(p_shared_owners);
                  while (__stlxr(v12 - 1, p_shared_owners));
                  if (!v12)
                  {
                    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
                    std::__shared_weak_count::__release_weak(v10);
                  }
                }
              }
              (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v25 + 40))(*v25, v9, 32);
            }
          }
        }
        else
        {
          tileDatasByIndex = self->_tileDatasByIndex;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld"), *(int *)(v7 + 296), *(int *)(v7 + 292));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](tileDatasByIndex, "removeObjectForKey:", v14);

          v6 = 1;
        }
      }
      next = (_QWORD *)*next;
    }
    while (next);
  }
  else
  {
    v6 = 0;
  }
  for (i = (_QWORD *)*((_QWORD *)a3 + 3); i; i = (_QWORD *)*i)
  {
    v17 = i + 2;
    v16 = i[2];
    if (!std::__hash_table<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::__unordered_map_hasher<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::hash<md::mun::CollectionPoint const*>,std::equal_to<md::mun::CollectionPoint const*>,true>,std::__unordered_map_equal<md::mun::CollectionPoint const*,std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>,std::equal_to<md::mun::CollectionPoint const*>,std::hash<md::mun::CollectionPoint const*>,true>,std::allocator<std::__hash_value_type<md::mun::CollectionPoint const*,geo::small_vector<md::mun::CollectionPoint const*,6ul>>>>::find<md::mun::CollectionPoint const*>(&self->_tiles.__table_.__bucket_list_.__ptr_.__value_, v16))
    {
      v18 = self->_tileDatasByIndex;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld"), *(int *)(v16 + 296), *(int *)(v16 + 292));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v18, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__emplace_unique_key_args<std::shared_ptr<md::LabelTile>,std::shared_ptr<md::LabelTile> const&>((unint64_t)&self->_duplicateTiles, *v17, i + 2);
      }
      else
      {
        v21 = -[VKLabelNavTileData initWithTile:]([VKLabelNavTileData alloc], "initWithTile:", i + 2);
        v22 = self->_tileDatasByIndex;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld"), *(int *)(*v17 + 296), *(int *)(*v17 + 292));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v21, v23);

        v6 = 1;
      }
    }
  }
  if (&self->_tiles != a3)
  {
    self->_tiles.__table_.__p3_.__value_ = *((float *)a3 + 12);
    std::__hash_table<std::shared_ptr<md::LabelTile>,std::hash<std::shared_ptr<md::LabelTile>>,std::equal_to<std::shared_ptr<md::LabelTile>>,geo::StdAllocator<std::shared_ptr<md::LabelTile>,mdm::Allocator>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::shared_ptr<md::LabelTile>,void *> *>>(&self->_tiles.__table_.__bucket_list_.__ptr_.__value_, *((_QWORD **)a3 + 3));
  }
  if ((v6 & 1) != 0)
  {
    -[NSMutableArray removeAllObjects](self->_intersections, "removeAllObjects");
    self->_offRouteJunctionsValid = 0;
    -[NSMutableArray removeAllObjects](self->_offRouteJunctions, "removeAllObjects");
    self->_oppositeCarriagewayJunctionsValid = 0;
    -[NSMutableArray removeAllObjects](self->_oppositeCarriagewayJunctions, "removeAllObjects");
  }
}

- (id)junctionForRoad:(id)a3 nearJunction:(BOOL)a4 crossTileEdge:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BYTE v13[56];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "getRoadEdge:", v13);
  -[VKLabelNavRoadGraph _junctionForRoadEdge:atA:routeOffset:tile:](self, "_junctionForRoadEdge:atA:routeOffset:tile:", v13, v6, objc_msgSend(v8, "routeOffset"), objc_msgSend(v8, "tile"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5 && v9 && objc_msgSend(v9, "isTileEdgeJunction"))
  {
    -[VKLabelNavRoadGraph _findInterTileJunctionForJunction:](self, "_findInterTileJunctionForJunction:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }

  return v10;
}

- (Matrix<float,)unitHeading
{
  float v2;
  float v3;
  Matrix<float, 2, 1> result;

  v2 = self->_unitHeading._e[0];
  v3 = self->_unitHeading._e[1];
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (id)_junctionForRoadEdge:(const GeoCodecsRoadEdge *)a3 atA:(BOOL)a4 routeOffset:(PolylineCoordinate)a5 tile:(const void *)a6
{
  _BOOL8 v8;
  NSMutableDictionary *tileDatasByIndex;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  VKLabelNavJunction *v15;
  _QWORD *v16;
  double v17;
  double v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v22;

  v8 = a4;
  tileDatasByIndex = self->_tileDatasByIndex;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld"), *(int *)(*(_QWORD *)a6 + 296), *(int *)(*(_QWORD *)a6 + 292));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](tileDatasByIndex, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 48;
  if (v8)
    v13 = 40;
  if (v12)
  {
    v14 = *(uint64_t *)((char *)&a3->var0 + v13);
    if (v14)
    {
      objc_msgSend(v12, "junctionForGeoJunction:", *(GeoCodecsRoadFeature **)((char *)&a3->var0 + v13));
      v15 = (VKLabelNavJunction *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v15 = -[VKLabelNavJunction initWithGEOJunction:routeOffset:tile:]([VKLabelNavJunction alloc], "initWithGEOJunction:routeOffset:tile:", v14, a5, a6);
        objc_msgSend(v12, "addJunction:", v15);
      }
    }
    else
    {
      v22 = 0;
      v16 = geo::codec::multiSectionFeaturePoints(a3->var0, 0, &v22);
      v19 = 16;
      if (v8)
        v19 = 8;
      v20 = &v16[*(uint64_t *)((char *)&a3->var0 + v19)];
      LODWORD(v17) = *v20;
      LODWORD(v18) = v20[1];
      objc_msgSend(v12, "junctionAtCoordinate:", v17, v18);
      v15 = (VKLabelNavJunction *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v15 = -[VKLabelNavJunction initWithRoadEdge:atA:routeOffset:tile:]([VKLabelNavJunction alloc], "initWithRoadEdge:atA:routeOffset:tile:", a3, v8, a5, a6);
        objc_msgSend(v12, "addJunction:", v15);
      }
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_findInterTileJunctionForJunction:(id)a3
{
  id v4;
  double v5;
  float v6;
  int v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *tileDatasByIndex;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  NSMutableDictionary *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v27;
  uint64_t v28;
  NSMutableDictionary *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;

  v4 = a3;
  objc_msgSend(v4, "tileCoordinate");
  v7 = LODWORD(v5);
  v8 = v6;
  v9 = 1;
  v10 = 2;
  if (*(float *)&v5 <= 0.9995)
    v10 = 0;
  if (*(float *)&v5 >= 0.0005)
    v9 = v10;
  LODWORD(v5) = 973279855;
  v11 = v9 | 4;
  if (v6 <= 0.9995)
    v11 = v9;
  v12 = v9 | 8;
  if (v6 < 0.0005)
    v13 = v12;
  else
    v13 = v11;
  if ((v13 & 1) != 0)
  {
    tileDatasByIndex = self->_tileDatasByIndex;
    v15 = objc_msgSend(v4, "tile", v5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld"), *(int *)(*(_QWORD *)v15 + 296) - 1, *(int *)(*(_QWORD *)v15 + 292));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](tileDatasByIndex, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      LODWORD(v18) = 1.0;
      *(float *)&v19 = v8;
      objc_msgSend(v17, "findTileEdgeJunctionAtCoordinate:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        goto LABEL_17;
    }

    if (v13 == 1)
    {
LABEL_19:
      v20 = 0;
      goto LABEL_20;
    }
  }
  if ((v13 & 2) == 0)
  {
LABEL_21:
    v27 = 2;
    while (1)
    {
      while (1)
      {
        v28 = *((_QWORD *)&-[VKLabelNavRoadGraph _findInterTileJunctionForJunction:]::tileOffsets + 4 * v27);
        if ((v28 & ~v13) == 0)
          break;
        if (++v27 == 8)
          goto LABEL_19;
      }
      v29 = self->_tileDatasByIndex;
      v30 = objc_msgSend(v4, "tile", v5);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld"), *((_QWORD *)&-[VKLabelNavRoadGraph _findInterTileJunctionForJunction:]::tileOffsets + 4 * v27 + 1)+ *(int *)(*(_QWORD *)v30 + 296), *((_QWORD *)&-[VKLabelNavRoadGraph _findInterTileJunctionForJunction:]::tileOffsets + 4 * v27 + 2)+ *(int *)(*(_QWORD *)v30 + 292));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v29, "objectForKey:", v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        LODWORD(v32) = v7;
        if ((v27 & 0x7FFFFFFFFFFFFFFELL) != 2)
          LODWORD(v32) = *((_DWORD *)&-[VKLabelNavRoadGraph _findInterTileJunctionForJunction:]::tileOffsets
                         + 8 * v27
                         + 6);
        LODWORD(v33) = *((_DWORD *)&-[VKLabelNavRoadGraph _findInterTileJunctionForJunction:]::tileOffsets + 8 * v27 + 7);
        objc_msgSend(v17, "findTileEdgeJunctionAtCoordinate:", v32, v33);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          goto LABEL_17;
      }

      v20 = 0;
      if (v13 != v28 && ++v27 != 8)
        continue;
      goto LABEL_20;
    }
  }
  v21 = self->_tileDatasByIndex;
  v22 = objc_msgSend(v4, "tile", v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld"), *(int *)(*(_QWORD *)v22 + 296) + 1, *(int *)(*(_QWORD *)v22 + 292));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v21, "objectForKey:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17
    || (LODWORD(v24) = 0,
        *(float *)&v25 = v8,
        objc_msgSend(v17, "findTileEdgeJunctionAtCoordinate:", v24, v25),
        (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {

    if (v13 == 2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_17:

LABEL_20:
  return v20;
}

- (id)nextRoadSegmentForRoad:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  id v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VKLabelNavRoadGraph junctionForRoad:nearJunction:crossTileEdge:](self, "junctionForRoad:nearJunction:crossTileEdge:", v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v5;
  if (v5)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v5, "roads");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((objc_msgSend(v11, "matchesRoad:", v4) & 1) == 0)
          {
            objc_msgSend(v11, "name");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "isEqualToString:", v13);

            if (v14)
            {
              if (v7)
              {
                objc_msgSend(v4, "direction2D");
                v16 = v15;
                v18 = v17;
                objc_msgSend(v11, "direction2D");
                v20 = v19;
                v22 = v21;
                objc_msgSend(v7, "direction2D");
                if ((float)((float)(v20 * v16) + (float)(v22 * v18)) > (float)((float)(v23 * v16) + (float)(v24 * v18)))
                {
                  v25 = v11;

                  v7 = v25;
                }
              }
              else
              {
                v7 = v11;
              }
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v8);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_nextIntersectionForRoad:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0;
  while (1)
  {
    -[VKLabelNavRoadGraph junctionForRoad:nearJunction:crossTileEdge:](self, "junctionForRoad:nearJunction:crossTileEdge:", v4, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6 || (objc_msgSend(v6, "isIntersection") & 1) != 0)
      break;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v7, "roads", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v9)
    {
LABEL_16:

LABEL_17:
      v7 = 0;
      break;
    }
    v10 = *(_QWORD *)v16;
LABEL_6:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
      if ((objc_msgSend(v12, "matchesRoad:", v4) & 1) == 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          goto LABEL_6;
        goto LABEL_16;
      }
    }
    v13 = v12;

    if (!v13)
      goto LABEL_17;

    ++v5;
    v4 = v13;
    if (v5 == 10)
    {
      v7 = 0;
      v4 = v13;
      break;
    }
  }

  return v7;
}

- (NSMutableArray)junctions
{
  return self->_junctions;
}

- (void)setJunctions:(id)a3
{
  objc_storeStrong((id *)&self->_junctions, a3);
}

- (void).cxx_destruct
{
  RouteSegment *begin;
  LabelPoint *v4;
  char *next;
  void **value;
  _QWORD *v7;
  void **v8;
  _QWORD *v9;
  void **v10;
  char *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  _QWORD *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  _QWORD *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;

  begin = self->_screenRouteSegments.__begin_;
  if (begin)
  {
    self->_screenRouteSegments.__end_ = begin;
    (*(void (**)(Allocator *, RouteSegment *, int64_t))(*(_QWORD *)self->_screenRouteSegments.__end_cap_.__value__2._allocator
                                                                        + 40))(self->_screenRouteSegments.__end_cap_.__value__2._allocator, begin, self->_screenRouteSegments.__end_cap_.__value_ - begin);
  }
  v4 = self->_simplifiedRoutePoints.__begin_;
  if (v4)
  {
    self->_simplifiedRoutePoints.__end_ = v4;
    (*(void (**)(Allocator *, LabelPoint *, int64_t))(*(_QWORD *)self->_simplifiedRoutePoints.__end_cap_.__value__2._allocator
                                                                      + 40))(self->_simplifiedRoutePoints.__end_cap_.__value__2._allocator, v4, self->_simplifiedRoutePoints.__end_cap_.__value_ - v4);
  }
  next = (char *)self->_routeFeatureMap.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v11 = *(char **)next;
      v12 = (std::__shared_weak_count *)*((_QWORD *)next + 7);
      if (v12)
      {
        p_shared_owners = (unint64_t *)&v12->__shared_owners_;
        do
          v14 = __ldaxr(p_shared_owners);
        while (__stlxr(v14 - 1, p_shared_owners));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
      if (next[39] < 0)
        (*(void (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)next + 5) + 40))(*((_QWORD *)next + 5), *((_QWORD *)next + 2), *((_QWORD *)next + 4) & 0x7FFFFFFFFFFFFFFFLL);
      (*(void (**)(Allocator *, char *, uint64_t))(*(_QWORD *)self->_routeFeatureMap.__table_.__p1_.__value__2._allocator
                                                           + 40))(self->_routeFeatureMap.__table_.__p1_.__value__2._allocator, next, 64);
      next = v11;
    }
    while (v11);
  }
  value = self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value_;
  self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Allocator *, void **, unint64_t))(*(_QWORD *)self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator
                                                                   + 40))(self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator, value, 8 * self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  objc_storeStrong((id *)&self->_offRouteJunctions, 0);
  objc_storeStrong((id *)&self->_oppositeCarriagewayJunctions, 0);
  objc_storeStrong((id *)&self->_intersections, 0);
  objc_storeStrong((id *)&self->_junctions, 0);
  objc_storeStrong((id *)&self->_tileDatasByIndex, 0);
  v7 = self->_duplicateTiles.__table_.__p1_.__value_.__next_;
  while (v7)
  {
    v15 = v7;
    v7 = (_QWORD *)*v7;
    v16 = (std::__shared_weak_count *)v15[3];
    if (v16)
    {
      v17 = (unint64_t *)&v16->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    (*(void (**)(Allocator *, _QWORD *, uint64_t))(*(_QWORD *)self->_duplicateTiles.__table_.__p1_.__value__2._allocator
                                                           + 40))(self->_duplicateTiles.__table_.__p1_.__value__2._allocator, v15, 32);
  }
  v8 = self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value_;
  self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(Allocator *, void **, unint64_t))(*(_QWORD *)self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator
                                                                   + 40))(self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator, v8, 8 * self->_duplicateTiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
  v9 = self->_tiles.__table_.__p1_.__value_.__next_;
  while (v9)
  {
    v19 = v9;
    v9 = (_QWORD *)*v9;
    v20 = (std::__shared_weak_count *)v19[3];
    if (v20)
    {
      v21 = (unint64_t *)&v20->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    (*(void (**)(Allocator *, _QWORD *, uint64_t))(*(_QWORD *)self->_tiles.__table_.__p1_.__value__2._allocator
                                                           + 40))(self->_tiles.__table_.__p1_.__value__2._allocator, v19, 32);
  }
  v10 = self->_tiles.__table_.__bucket_list_.__ptr_.__value_;
  self->_tiles.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v10)
    (*(void (**)(Allocator *, void **, unint64_t))(*(_QWORD *)self->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator
                                                                   + 40))(self->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value__2._allocator, v10, 8 * self->_tiles.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_);
}

- (void)addRouteRoadEdge:(const VKLabelNavRouteRoadEdge *)a3 atA:(BOOL)a4 isRouteRefineJunction:(BOOL)a5 tile:(const void *)a6 junctionList:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a5;
  v9 = a4;
  v16 = a7;
  v12 = 8;
  if (v9)
    v12 = 0;
  v13 = *(uint64_t *)((char *)&a3->var0 + v12);
  -[VKLabelNavRoadGraph _junctionForRoadEdge:atA:routeOffset:tile:](self, "_junctionForRoadEdge:atA:routeOffset:tile:", &a3->var2, v9, v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setRouteOffset:", v13);
    objc_msgSend(v15, "setIsRouteRefineJunction:", v8);
    if ((objc_msgSend(v16, "containsObject:", v15) & 1) == 0)
      objc_msgSend(v16, "addObject:", v15);
    objc_msgSend(v15, "findRoads");
    objc_msgSend(v15, "addRouteEdge:atA:", a3, v9);
  }

}

- (id)overpassJunctionForJunction:(id)a3
{
  id v4;
  void *v5;
  VKLabelNavJunction *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  geo::codec::VectorTile *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  NSMutableDictionary *tileDatasByIndex;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t *v24;
  unint64_t v25;
  geo::codec::VectorTile *v26;

  v4 = a3;
  objc_msgSend(v4, "overpassJunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "overpassJunction");
    v6 = (VKLabelNavJunction *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "geoJunction") && objc_msgSend(v4, "isOverpass"))
  {
    v7 = *(_QWORD *)(*(_QWORD *)objc_msgSend(v4, "tile") + 24);
    v9 = *(geo::codec::VectorTile **)v7;
    v8 = *(std::__shared_weak_count **)(v7 + 8);
    v26 = *(geo::codec::VectorTile **)v7;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    tileDatasByIndex = self->_tileDatasByIndex;
    v13 = objc_msgSend(v4, "tile");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld"), *(int *)(*(_QWORD *)v13 + 296), *(int *)(*(_QWORD *)v13 + 292), v26, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](tileDatasByIndex, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = geo::codec::VectorTile::junctionsCount(v9);
    v17 = geo::codec::VectorTile::junctions(v9);
    v18 = geo::codec::VectorTile::overpasses(v9);
    v6 = 0;
    if (v17)
    {
      v19 = v18;
      if (v18)
      {
        v20 = objc_msgSend(v4, "geoJunction");
        v6 = 0;
        if (*(_WORD *)(v19 + ((v20 - v17) >> 4)))
        {
          if (v16)
          {
            v21 = 0;
            while ((v20 - v17) >> 5 == v21
                 || *(unsigned __int16 *)(v19 + ((v20 - v17) >> 4)) != *(unsigned __int16 *)(v19 + 2 * v21))
            {
              if (v16 == ++v21)
              {
                v6 = 0;
                goto LABEL_22;
              }
            }
            v22 = v17 + 32 * v21;
            objc_msgSend(v15, "junctionForGeoJunction:", v22);
            v6 = (VKLabelNavJunction *)objc_claimAutoreleasedReturnValue();
            if (!v6)
            {
              v6 = -[VKLabelNavJunction initWithGEOJunction:routeOffset:tile:]([VKLabelNavJunction alloc], "initWithGEOJunction:routeOffset:tile:", v22, 0xBF80000000000000, objc_msgSend(v4, "tile"));
              objc_msgSend(v15, "addJunction:", v6);
            }
            -[VKLabelNavJunction setOverpassJunction:](v6, "setOverpassJunction:", v4);
            objc_msgSend(v4, "setOverpassJunction:", v6);
          }
        }
      }
    }
LABEL_22:

    if (v8)
    {
      v24 = (unint64_t *)&v8->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_checkIfDualCarriageWayConnectorRoad:(id)a3 fromJunction:(id)a4 toJunction:(id)a5 checkShields:(BOOL)a6
{
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  BOOL v35;
  uint64_t v37;
  _BOOL8 v38;
  id v39;
  id obj;
  id v41;
  _BOOL4 v42;
  uint64_t v43;
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
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v42 = a6;
  v59 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v39 = a4;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(a5, "roads");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v8)
  {
    v37 = 0;
    v38 = 0;
    v43 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v53 != v43)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v10, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if ((v14 & 1) == 0)
          {
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            objc_msgSend(v39, "roads");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            if (v16)
            {
              v17 = *(_QWORD *)v49;
LABEL_12:
              v18 = 0;
              while (1)
              {
                if (*(_QWORD *)v49 != v17)
                  objc_enumerationMutation(v15);
                v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v18);
                objc_msgSend(v10, "name");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "name");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v20, "isEqualToString:", v21);

                if ((v22 & 1) != 0)
                  break;
                if (v16 == ++v18)
                {
                  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
                  if (v16)
                    goto LABEL_12;
                  goto LABEL_18;
                }
              }
              v23 = v38;

              v38 = 1;
              if (v23)
                goto LABEL_36;
            }
            else
            {
LABEL_18:

            }
          }
        }
        if (v42)
        {
          if (objc_msgSend(v10, "hasShield"))
          {
            objc_msgSend(v10, "shieldGroup");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "shieldGroup");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "isEqualToString:", v25);

            if ((v26 & 1) == 0)
            {
              v46 = 0u;
              v47 = 0u;
              v44 = 0u;
              v45 = 0u;
              objc_msgSend(v39, "roads");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
              if (v28)
              {
                v29 = *(_QWORD *)v45;
LABEL_25:
                v30 = 0;
                while (1)
                {
                  if (*(_QWORD *)v45 != v29)
                    objc_enumerationMutation(v27);
                  v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v30);
                  objc_msgSend(v10, "shieldGroup");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "shieldGroup");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v32, "isEqualToString:", v33);

                  if ((v34 & 1) != 0)
                    break;
                  if (v28 == ++v30)
                  {
                    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
                    if (v28)
                      goto LABEL_25;
                    goto LABEL_4;
                  }
                }
                v35 = v37 == 1;

                v37 = 1;
                if (!v35)
                  continue;
                LOBYTE(v38) = 1;
                goto LABEL_36;
              }
LABEL_4:

            }
          }
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      if (v8)
        continue;
      break;
    }
  }
  LOBYTE(v38) = 0;
LABEL_36:

  return v38;
}

- (void)evaluateDualCarriagewayForJunction:(id)a3 outputJunctionList:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _BOOL4 v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  double v44;
  id v45;
  void *v46;
  void *v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v45 = a4;
  v47 = v5;
  if (objc_msgSend(v5, "isRouteOverpass"))
  {
    objc_msgSend(v5, "overpassJunction");
    v62 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5;
  }
  else
  {
    v6 = v5;
    v62 = v5;
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v6, "roads");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
  if (!v50)
    goto LABEL_101;
  v49 = *(_QWORD *)v68;
  do
  {
    v52 = 0;
    while (2)
    {
      if (*(_QWORD *)v68 != v49)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v52);
      v8 = objc_msgSend(v7, "isOnRoute");
      objc_msgSend(v7, "length");
      v10 = v9;
      if (v9 > 70.0)
        goto LABEL_7;
      v11 = v47;
      v56 = v7;
      -[VKLabelNavRoadGraph junctionForRoad:nearJunction:crossTileEdge:](self, "junctionForRoad:nearJunction:crossTileEdge:");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v51)
      {
        v14 = 0;
        goto LABEL_90;
      }
      if (-[VKLabelNavRoadGraph _checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:](self, "_checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:"))
      {
        v12 = 0;
        v46 = v56;
        v13 = v11;
        goto LABEL_14;
      }
      if (objc_msgSend(v11, "isRouteOverpass") && objc_msgSend(v51, "isOverpass"))
      {
        -[VKLabelNavRoadGraph overpassJunctionForJunction:](self, "overpassJunctionForJunction:", v51);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15
          && -[VKLabelNavRoadGraph _checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:](self, "_checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:"))
        {
          v46 = v56;
          v13 = v11;
LABEL_25:
          v12 = objc_msgSend(v15, "isOnRoute");

          goto LABEL_14;
        }

      }
      objc_msgSend(v51, "roads");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v51, "isTileEdgeJunction"))
        goto LABEL_31;
      if (objc_msgSend(v15, "count") != 1)
        goto LABEL_31;
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

      if (v19)
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_31:
        if (objc_msgSend(v15, "count") != 2)
          goto LABEL_86;
        objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "matchesRoad:"))
          objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
        else
          objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (!v20)
        goto LABEL_87;
      objc_msgSend(v20, "length");
      v23 = v22 + v10;
      if (v23 > 70.0)
        goto LABEL_87;
      v24 = v51;

      -[VKLabelNavRoadGraph junctionForRoad:nearJunction:crossTileEdge:](self, "junctionForRoad:nearJunction:crossTileEdge:", v20, 0, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v51)
      {
        v14 = 0;
        v11 = v24;
        v56 = v20;
        goto LABEL_90;
      }
      if (-[VKLabelNavRoadGraph _checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:](self, "_checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:", v56, v62))
      {
        v12 = 0;
        v46 = v20;
        v13 = v24;
      }
      else
      {
        if (objc_msgSend(v11, "isRouteOverpass") && objc_msgSend(v51, "isOverpass"))
        {
          -[VKLabelNavRoadGraph overpassJunctionForJunction:](self, "overpassJunctionForJunction:", v51);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15
            && -[VKLabelNavRoadGraph _checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:](self, "_checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:", v56, v62, v15, 1))
          {
            v46 = v20;
            v13 = v24;
            goto LABEL_25;
          }

        }
        objc_msgSend(v51, "roads");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v51, "isTileEdgeJunction"))
          goto LABEL_77;
        if (objc_msgSend(v15, "count") != 1)
          goto LABEL_77;
        objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "name");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "isEqualToString:", v41);

        if ((v42 & 1) != 0)
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_77:
          if (objc_msgSend(v15, "count") != 2)
            goto LABEL_85;
          objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v43, "matchesRoad:", v20) & 1) != 0)
            objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
          else
            objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (!v46)
        {
LABEL_85:
          v56 = v20;
          v11 = v24;
LABEL_86:
          v20 = 0;
LABEL_87:

LABEL_88:
          v56 = v20;
          goto LABEL_89;
        }
        objc_msgSend(v46, "length");
        if (v44 + v23 > 70.0)
        {
          v57 = v20;
          v11 = v24;
          v20 = v46;

          goto LABEL_88;
        }
        v13 = v51;

        -[VKLabelNavRoadGraph junctionForRoad:nearJunction:crossTileEdge:](self, "junctionForRoad:nearJunction:crossTileEdge:");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v51)
        {
          v14 = 0;
          v11 = v13;
          v56 = v46;
          goto LABEL_90;
        }
        if (!-[VKLabelNavRoadGraph _checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:](self, "_checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:", v56, v62))
        {
          if (!objc_msgSend(v11, "isRouteOverpass") || !objc_msgSend(v51, "isOverpass"))
          {
LABEL_17:
            v11 = v13;
            goto LABEL_18;
          }
          -[VKLabelNavRoadGraph overpassJunctionForJunction:](self, "overpassJunctionForJunction:", v51);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15
            || !-[VKLabelNavRoadGraph _checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:](self, "_checkIfDualCarriageWayConnectorRoad:fromJunction:toJunction:checkShields:", v56, v62, v15, 1))
          {
LABEL_64:
            v11 = v13;
            v20 = v46;
            goto LABEL_88;
          }
          goto LABEL_25;
        }
        v12 = 0;
      }
LABEL_14:
      objc_msgSend(v11, "setIsOnDualCarriageway:", 1);
      if ((v8 & 1) != 0)
        goto LABEL_17;
      objc_msgSend(v56, "setAreLabelsDisabled:", 1);
      if ((objc_msgSend(v51, "isOnRoute") & 1) != 0 || (v12 & 1) != 0)
        goto LABEL_17;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v54 = v13;
      objc_msgSend(v51, "roads");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      if (!v26)
        goto LABEL_62;
      v58 = *(_QWORD *)v64;
      v53 = v25;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v64 != v58)
            objc_enumerationMutation(v53);
          v28 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v62, "incomingRoad");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29
            && (objc_msgSend(v28, "name"),
                v61 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v62, "incomingRoad"),
                v59 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v59, "name"),
                v60 = (void *)objc_claimAutoreleasedReturnValue(),
                (objc_msgSend(v61, "isEqualToString:") & 1) != 0))
          {
            LOBYTE(v30) = 1;
          }
          else
          {
            objc_msgSend(v62, "outgoingRoad");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              objc_msgSend(v28, "name");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "outgoingRoad");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v32, "isEqualToString:", v34);

              if (!v29)
              {
                if (v30)
                  goto LABEL_44;
                goto LABEL_58;
              }
            }
            else
            {
              if (!v29)
                goto LABEL_58;
              LOBYTE(v30) = 0;
            }
          }

          if ((v30 & 1) != 0)
            goto LABEL_44;
LABEL_58:
          -[VKLabelNavRoadGraph junctionForRoad:nearJunction:crossTileEdge:](self, "junctionForRoad:nearJunction:crossTileEdge:", v28, 0, 0);
          v35 = (id)objc_claimAutoreleasedReturnValue();
          v36 = v54 == v35;

          if (v36)
          {
LABEL_44:
            objc_msgSend(v28, "setAreLabelsDisabled:", 1);
            continue;
          }
          objc_msgSend(v56, "routeCrossProduct");
          objc_msgSend(v28, "setRouteCrossProduct:");
          objc_msgSend(v28, "setRouteOffset:", objc_msgSend(v56, "routeOffset"));
        }
        v25 = v53;
        v26 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      }
      while (v26);
LABEL_62:

      objc_msgSend(v51, "setRouteOffset:", objc_msgSend(v56, "routeOffset"));
      objc_msgSend(v51, "setIsOnDualCarriageway:", 1);
      objc_msgSend(v45, "addObject:", v51);
      objc_msgSend(v62, "incomingRoad");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37 == 0;

      if (!v38)
      {
        v13 = v54;
        objc_msgSend(v62, "incomingRoad");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "direction2D");
        objc_msgSend(v51, "setSharedRouteDirection:");
        goto LABEL_64;
      }
      v11 = v54;
LABEL_18:
      v56 = v46;
LABEL_89:
      v14 = v51;
LABEL_90:

LABEL_7:
      if (++v52 != v50)
        continue;
      break;
    }
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
  }
  while (v50);
LABEL_101:

}

- (unint64_t)countReadyJunctionLists
{
  if (-[NSMutableArray count](self->_intersections, "count"))
    return -[NSMutableArray count](self->_intersections, "count");
  else
    return 1;
}

- (id)junctionListForDepth:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_intersections, "count") <= a3
    && (-[VKLabelNavRoadGraph _updateIntersectionsForDepth:](self, "_updateIntersectionsForDepth:", a3),
        -[NSMutableArray count](self->_intersections, "count") <= a3))
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_intersections, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)offRouteJunctionList
{
  return self->_offRouteJunctions;
}

- (void)_updateIntersectionsForDepth:(unint64_t)a3
{
  unint64_t v5;
  id v6;
  unint64_t v7;
  NSMutableArray *intersections;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  void *v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3 - 1;
  if (a3 <= 1)
  {
    if (-[NSMutableArray count](self->_intersections, "count"))
    {
      if (!a3)
        return;
    }
    else
    {
      -[NSMutableArray addObject:](self->_intersections, "addObject:", self->_junctions);
      if (!a3)
        return;
    }
  }
  if (-[NSMutableArray count](self->_intersections, "count") >= a3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_intersections, "objectAtIndexedSubscript:", v5);
    v17 = objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = -[NSMutableArray count](self->_intersections, "count");
    intersections = self->_intersections;
    if (v7 <= a3)
      -[NSMutableArray addObject:](intersections, "addObject:", v6, v17);
    else
      -[NSMutableArray setObject:atIndexedSubscript:](intersections, "setObject:atIndexedSubscript:", v6, a3, v17);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v18;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v20 = *(_QWORD *)v27;
      do
      {
        v21 = v9;
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v11, "roads");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v23;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v23 != v14)
                  objc_enumerationMutation(v12);
                -[VKLabelNavRoadGraph _nextIntersectionForRoad:](self, "_nextIntersectionForRoad:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v6, "containsObject:", v16) & 1) == 0 && objc_msgSend(v16, "depthFromRoute") >= a3)
                {
                  objc_msgSend(v16, "setDepthFromRoute:", a3);
                  objc_msgSend(v16, "setRouteOffset:", objc_msgSend(v11, "routeOffset"));
                  objc_msgSend(v6, "addObject:", v16);
                }

              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v13);
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_29113);
  }
}

- (id)offRouteGraphJunctionsWithNavContext:(NavContext *)a3 maxJunctions:(unint64_t)a4 isOnRoute:(BOOL)a5
{
  LabelLayoutContext *var3;
  long double v8;
  long double v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  long double v14;
  double v15;
  long double v16;
  double v17;
  LabelNavLayoutContext *var4;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  float v25;
  float v26;
  unsigned __int8 v27;
  NSMutableArray *v28;
  float *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  double *v35;
  LabelLayoutContext *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  long double v43;
  long double v44;
  double v45;
  long double v46;
  double v47;
  __double2 v48;
  double v49;
  double v50;
  __double2 v51;
  float32x2_t v52;
  LabelNavLayoutContext *v53;
  float32x2_t v54;
  id v55;
  float v56;
  float v57;
  unint64_t v58;
  id v59;
  _QWORD *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  float *v69;
  unint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  void *v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  double *v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  void *v84;
  float *v85;
  float *v86;
  unint64_t v87;
  BOOL v88;
  void *v89;
  uint64_t v91;
  float v93;
  _BOOL4 v94;
  int v95;
  unint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  unint64_t v101;
  float *v102;
  unint64_t v103;
  uint64_t v104;
  _BYTE v105[128];
  uint64_t v106;
  float64x2x2_t v107;

  v94 = a5;
  v106 = *MEMORY[0x1E0C80C00];
  var3 = a3->var3;
  v8 = exp(*((double *)var3 + 30) * 6.28318531 + -3.14159265);
  v9 = atan(v8) * 114.591559 + -90.0;
  v10 = cos(v9 * 0.034906585);
  v11 = cos(v9 * 0.0698131701);
  v12 = cos(v9 * 0.104719755);
  v13 = v9 * 0.00872664626;
  v14 = tan(v9 * 0.00872664626 + 0.78103484);
  v15 = log(v14);
  v16 = tan(v13 + 0.789761487);
  v17 = log(v16);
  var4 = a3->var4;
  v20 = *(double *)var4;
  v19 = *((double *)var4 + 1);
  v21 = *((double *)var4 + 2);
  v22 = *((double *)var4 + 3);
  if (!self->_offRouteJunctionsValid
    || v20 < self->_offRouteJunctionSelectRect._minimum._e[0]
    || v21 > self->_offRouteJunctionSelectRect._maximum._e[0]
    || v19 < self->_offRouteJunctionSelectRect._minimum._e[1]
    || v22 > self->_offRouteJunctionSelectRect._maximum._e[1])
  {
    if (v21 >= v20 && v22 >= v19)
    {
      v23 = fabs((v17 - v15) * 0.159154943) * -250.0 / (v10 * -559.82 + 111132.92 + v11 * 1.175 + v12 * -0.0023);
      v20 = v20 + v23;
      v21 = v21 - v23;
      v19 = v19 + v23;
      v22 = v22 - v23;
    }
    self->_offRouteJunctionSelectRect._minimum._e[0] = v20;
    self->_offRouteJunctionSelectRect._minimum._e[1] = v19;
    self->_offRouteJunctionSelectRect._maximum._e[0] = v21;
    self->_offRouteJunctionSelectRect._maximum._e[1] = v22;
    -[VKLabelNavRoadGraph _findOffRouteJunctions](self, "_findOffRouteJunctions");
    self->_offRouteJunctionsValid = 1;
    var3 = a3->var3;
  }
  v24 = *((float *)var3 + 266);
  v25 = *((float *)var3 + 267);
  if (v94)
    v26 = 0.7;
  else
    v26 = 0.5;
  v101 = 0;
  v102 = 0;
  v103 = 0;
  {
    v91 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v91, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v104 = mdm::Allocator::instance(void)::alloc;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v28 = self->_offRouteJunctions;
  v29 = 0;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
  if (v30)
  {
    v31 = 0;
    v93 = v24 * 0.5;
    v32 = *(_QWORD *)v98;
    while (1)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v98 != v32)
          objc_enumerationMutation(v28);
        v34 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
        v35 = (double *)objc_msgSend(v34, "mercatorCoordinate");
        v36 = a3->var3;
        v37 = *((float *)v36 + 12);
        v39 = *v35;
        v38 = v35[1];
        v40 = v35[2];
        if (*((_BYTE *)v36 + 8))
        {
          v41 = v37 * 0.0000000249532021 * v40;
        }
        else
        {
          v42 = v40 * v37;
          v43 = v39 * 6.28318531;
          v44 = exp(v38 * 6.28318531 + -3.14159265);
          v45 = atan(v44) * 2.0 + -1.57079633;
          v46 = fmod(v43, 6.28318531);
          v47 = fmod(v46 + 6.28318531, 6.28318531) + -3.14159265;
          v48 = __sincos_stret(v45);
          v49 = 6378137.0 / sqrt(v48.__sinval * v48.__sinval * -0.00669437999 + 1.0);
          v50 = (v49 + v42) * v48.__cosval;
          v51 = __sincos_stret(v47);
          v39 = v50 * v51.__cosval;
          v38 = v50 * v51.__sinval;
          v41 = (v42 + v49 * 0.99330562) * v48.__sinval;
        }
        v52 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)v36 + 60), *((float64x2_t *)v36 + 54), v39), *((float64x2_t *)v36 + 56), v38), *((float64x2_t *)v36 + 58), v41), 1.0/ (*((double *)v36 + 123)+ *((double *)v36 + 111) * v39+ *((double *)v36 + 115) * v38+ *((double *)v36 + 119) * v41)));
        v53 = a3->var4;
        if (v52.f32[0] >= *((float *)v53 + 12) && v52.f32[0] < *((float *)v53 + 14))
        {
          v54 = v52;
          if (v52.f32[1] >= *((float *)v53 + 13) && v52.f32[1] < *((float *)v53 + 15))
          {
            v55 = v34;

            v31 = v55;
            v95 = v95 & 0xFFFFFF00 | objc_msgSend(v55, "largestRoadClass");
            v56 = v54.f32[0] - v93;
            if (v94)
              v56 = v56 + v56;
            v57 = (float)((float)(v54.f32[1] - (float)(v25 * v26)) * (float)(v54.f32[1] - (float)(v25 * v26)))
                + (float)(v56 * v56);
            v58 = (unint64_t)v102;
            if ((unint64_t)v102 < v103)
            {
              if (v102)
              {
                *(_QWORD *)v58 = v55;
                *(_DWORD *)(v58 + 8) = v95;
                *(float *)(v58 + 12) = v57;
              }
              v29 = (float *)(v58 + 16);
              goto LABEL_18;
            }
            v59 = v55;
            v60 = (_QWORD *)v101;
            v61 = (uint64_t)((uint64_t)v102 - v101) >> 4;
            v62 = v61 + 1;
            if ((unint64_t)(v61 + 1) >> 60)
              abort();
            v96 = v103;
            if ((uint64_t)(v103 - v101) >> 3 > v62)
              v62 = (uint64_t)(v103 - v101) >> 3;
            if (v103 - v101 >= 0x7FFFFFFFFFFFFFF0)
              v63 = 0xFFFFFFFFFFFFFFFLL;
            else
              v63 = v62;
            if (v63)
            {
              v64 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v104 + 16))(v104, 16 * v63, 8);
              v65 = v64 + 16 * v61;
              v66 = v64 + 16 * v63;
              v31 = v59;
              if (v64)
              {
                v67 = v66;
                v68 = v31;
                v66 = v67;
                *(_QWORD *)v65 = v68;
                *(_DWORD *)(v65 + 8) = v95;
                *(float *)(v65 + 12) = v57;
              }
            }
            else
            {
              v66 = 0;
              v65 = 16 * v61;
              v31 = v59;
            }
            v69 = (float *)(v65 + 16);
            if ((_QWORD *)v58 == v60)
            {
              v101 = v65;
              v103 = v66;
              v29 = (float *)(v65 + 16);
              v75 = v96;
              if (!v58)
                goto LABEL_18;
            }
            else
            {
              v70 = v58 - (_QWORD)v60 - 16;
              if (v70 <= 0x6F || (v71 = v70 >> 4, v58 - 16 * v71 - 16 < v65) && v65 - 16 * v71 - 16 < v58)
              {
                v72 = (_QWORD *)v58;
                goto LABEL_49;
              }
              v76 = v71 + 1;
              v77 = (v71 + 1) & 0x1FFFFFFFFFFFFFFELL;
              v72 = (_QWORD *)(v58 - 16 * v77);
              v78 = (double *)(v65 - 32);
              v79 = v58 - 32;
              v80 = v77;
              do
              {
                v107 = vld2q_f64((const double *)v79);
                *(_QWORD *)(v79 + 16) = 0;
                *(_QWORD *)v79 = 0;
                v79 -= 32;
                vst2q_f64(v78, v107);
                v78 -= 4;
                v80 -= 2;
              }
              while (v80);
              v65 -= 16 * v77;
              if (v76 != v77)
              {
                do
                {
LABEL_49:
                  v73 = *(v72 - 2);
                  v72 -= 2;
                  *v72 = 0;
                  *(_QWORD *)(v65 - 16) = v73;
                  v65 -= 16;
                  *(_QWORD *)(v65 + 8) = v72[1];
                }
                while (v72 != v60);
              }
              v101 = v65;
              v102 = v69;
              v29 = v69;
              v103 = v66;
              do
              {
                v74 = *(void **)(v58 - 16);
                v58 -= 16;

              }
              while ((_QWORD *)v58 != v60);
              v58 = (unint64_t)v60;
              v75 = v96;
              if (!v60)
              {
LABEL_18:
                v102 = v29;
                continue;
              }
            }
            (*(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)v104 + 40))(v104, v58, v75 - v58);
            goto LABEL_18;
          }
        }
      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
      if (!v30)
      {
        v81 = v101;
        goto LABEL_63;
      }
    }
  }
  v81 = 0;
  v31 = 0;
LABEL_63:

  v82 = 126 - 2 * __clz(((uint64_t)v29 - v81) >> 4);
  if (v29 == (float *)v81)
    v83 = 0;
  else
    v83 = v82;
  std::__introsort<std::_ClassicAlgPolicy,-[VKLabelNavRoadGraph(junctionlist) offRouteGraphJunctionsWithNavContext:maxJunctions:isOnRoute:]::$_2 &,OffRouteJunctionInfo *,false>(v81, v29, v83, 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (float *)v101;
  v85 = v102;
  if ((float *)v101 == v102)
  {
    if (v101)
    {
LABEL_75:
      v102 = v86;
      (*(void (**)(uint64_t, float *, unint64_t))(*(_QWORD *)v104 + 40))(v104, v86, v103 - (_QWORD)v86);
    }
  }
  else
  {
    v87 = v101 + 16;
    do
    {
      objc_msgSend(v84, "addObject:", *(_QWORD *)(v87 - 16));
      if (objc_msgSend(v84, "count") >= a4)
        break;
      v88 = v87 == (_QWORD)v85;
      v87 += 16;
    }
    while (!v88);
    if (v86)
    {
      do
      {
        v89 = (void *)*((_QWORD *)v85 - 2);
        v85 -= 4;

      }
      while (v85 != v86);
      goto LABEL_75;
    }
  }

  return v84;
}

- (void)_findOffRouteJunctions
{
  signed int v3;
  signed int v4;
  signed int v5;
  signed int v6;
  int v7;
  NSMutableArray *offRouteJunctions;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  NSMutableDictionary *tileDatasByIndex;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;

  -[NSMutableArray removeAllObjects](self->_offRouteJunctions, "removeAllObjects");
  v3 = vcvtd_n_s64_f64(self->_offRouteJunctionSelectRect._minimum._e[0], 0xFuLL);
  v4 = vcvtd_n_s64_f64(self->_offRouteJunctionSelectRect._maximum._e[1], 0xFuLL);
  v5 = vcvtd_n_s64_f64(self->_offRouteJunctionSelectRect._maximum._e[0], 0xFuLL);
  v6 = vcvtd_n_s64_f64(self->_offRouteJunctionSelectRect._minimum._e[1], 0xFuLL);
  v7 = v5 - v3 + 1 + (v5 - v3 + 1) * (v4 - v6);
  if (v7 < 0)
    v7 = -v7;
  if (v7 <= 0x19)
  {
    if (v5 >= v3 && v4 >= v6)
    {
      v10 = 0x7FFF - v6;
      v18 = 0x7FFF - v4;
      if (0x7FFF - v4 > v10)
        v10 = 0x7FFF - v4;
      v11 = v3;
      v12 = v5 + 1;
      v13 = v4 - 32766 + v10;
      do
      {
        v14 = v13;
        v15 = v18;
        do
        {
          tileDatasByIndex = self->_tileDatasByIndex;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld"), v11, v15);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](tileDatasByIndex, "objectForKey:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            objc_msgSend(v17, "appendNavJunctionsInWorldRect:junctions:", &self->_offRouteJunctionSelectRect, self->_offRouteJunctions);

          ++v15;
          --v14;
        }
        while (v14);
        ++v11;
      }
      while (v12 != (_DWORD)v11);
    }
    offRouteJunctions = self->_offRouteJunctions;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_101);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray filterUsingPredicate:](offRouteJunctions, "filterUsingPredicate:");

  }
}

- (BOOL)isPriorRouteCollinearWithRoad:(id)a3 distance:(float)a4
{
  BOOL v4;
  id v7;
  float v8;
  NSMutableArray *junctions;
  void *v10;
  uint64_t v11;
  BOOL v12;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  void *v26;
  double v27;
  char v28;

  v7 = a3;
  objc_msgSend(v7, "routeCrossProduct");
  if (fabsf(v8) > 0.2
    || (junctions = self->_junctions,
        objc_msgSend(v7, "navJunctionA"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[NSMutableArray indexOfObject:](junctions, "indexOfObject:", v10),
        v10,
        v11 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v7, "direction2D");
    if (v11 - 1 < 0)
    {
LABEL_12:
      v28 = 0;
    }
    else
    {
      v15 = v13;
      v16 = v14;
      v17 = a4;
      v18 = 0.0;
      while (1)
      {
        -[NSMutableArray objectAtIndex:](self->_junctions, "objectAtIndex:", --v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isOnRoute"))
        {
          objc_msgSend(v19, "outgoingRoad");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v19, "outgoingRoad");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "direction2D");
            v24 = -(float)((float)(v22 * v15) - (float)(v23 * v16));

            v25 = fabsf(v24);
            v4 = v25 <= 0.2;
            if (v25 > 0.2)
              break;
            objc_msgSend(v19, "outgoingRoad");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "length");
            v18 = v27 + v18;

            if (v18 >= v17)
              break;
          }
        }

        if (v11 <= 0)
          goto LABEL_12;
      }

      v28 = 1;
    }
    v12 = v28 & v4;
  }

  return v12;
}

- (void)_updateSimplifiedRoute
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  NSMutableArray *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  unsigned int index;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  _QWORD *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  LabelPoint *begin;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[17];

  v51[16] = *MEMORY[0x1E0C80C00];
  if (self->_simplifiedRouteValid)
    return;
  self->_simplifiedRouteValid = 1;
  self->_simplifiedRoutePoints.__end_ = self->_simplifiedRoutePoints.__begin_;
  self->_currentRoadStartSimplifiedPointIndex = 0;
  if (!-[NSMutableArray count](self->_junctions, "count"))
    return;
  v47 = 0;
  v48 = 0;
  v49 = 0;
  {
    v35 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v35, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v50 = mdm::Allocator::instance(void)::alloc;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  {
    v36 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v36, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v46 = mdm::Allocator::instance(void)::alloc;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = self->_junctions;
  v6 = 0;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (objc_msgSend(v10, "isOnRoute"))
        {
          objc_msgSend(v10, "outgoingRoad");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11 == 0;

          if (!v12)
          {
            v13 = objc_msgSend(v10, "routeOffset");
            index = self->_routeUserOffset.index;
            if (index > v13
              || index == (_DWORD)v13 && self->_routeUserOffset.offset >= *((float *)&v13 + 1))
            {
              v6 = (v48 - v47) >> 4;
            }
            objc_msgSend(v10, "outgoingRoad");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "appendSimplifiedWorldRoadPoints:pointElevations:", &v47, &v43);

          }
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v7);
  }

  v17 = v48 - v47;
  if ((unint64_t)(v48 - v47) <= 0x4001)
  {
    MEMORY[0x1E0C80A78](v16);
    v19 = (uint64_t *)((char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v19, v18);
    goto LABEL_23;
  }
  v19 = malloc_type_malloc(v17 >> 1, 0x100004000313F17uLL);
  if (v19)
  {
LABEL_23:
    -[NSMutableArray objectAtIndexedSubscript:](self->_junctions, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "worldUnitsPerMeter");
    v22 = v21;

    v23 = v47;
    v24 = (v48 - v47) >> 4;
    if ((unint64_t)(v48 - v47) > 0x2F)
    {
      v38 = 1;
      *v19 = 0;
      v26 = v24 - 1;
      geo::dpSimplifyViaIndexes<gm::Matrix<double,2,1>,unsigned long>(v23, 0, v24 - 1, (uint64_t)v19, &v38, v22 * 8.0);
      v27 = v38;
      v24 = v38 + 1;
      v19[v38] = v26;
      if (v27 == -1)
      {
LABEL_38:
        if ((unint64_t)v17 >= 0x4002)
          free(v19);
        goto LABEL_40;
      }
    }
    else
    {
      if (v48 != v47)
      {
        v25 = 0;
        do
        {
          v19[v25] = v25;
          ++v25;
        }
        while (v24 != v25);
      }
      if (!v24)
        goto LABEL_38;
    }
    begin = self->_simplifiedRoutePoints.__begin_;
    v29 = 0xAAAAAAAAAAAAAAABLL * ((self->_simplifiedRoutePoints.__end_ - begin) >> 4);
    if (v24 <= v29)
    {
      if (v24 < v29)
        self->_simplifiedRoutePoints.__end_ = (LabelPoint *)((char *)begin + 48 * v24);
    }
    else
    {
      std::vector<md::LabelPoint,geo::StdAllocator<md::LabelPoint,mdm::Allocator>>::__append((uint64_t)&self->_simplifiedRoutePoints, v24 - v29);
      begin = self->_simplifiedRoutePoints.__begin_;
    }
    v30 = 0;
    v31 = v47;
    v32 = v43;
    v33 = (char *)begin + 46;
    do
    {
      v34 = v19[v30];
      if (v34 <= v6)
        self->_currentRoadStartSimplifiedPointIndex = v30;
      *(_OWORD *)(v33 - 22) = *(_OWORD *)(v31 + 16 * v34);
      *(_WORD *)(v33 - 1) = 257;
      *(_DWORD *)(v33 - 6) = *(_DWORD *)(v32 + 4 * v34);
      ++v30;
      v33 += 48;
    }
    while (v24 != v30);
    goto LABEL_38;
  }
LABEL_40:
  if (v43)
  {
    v44 = v43;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v46 + 40))(v46, v43, v45 - v43);
  }
  if (v47)
  {
    v48 = v47;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v50 + 40))(v50, v47, v49 - v47);
  }
}

- (void)_transformRouteToScreenWithContext:(NavContext *)a3
{
  LabelLayoutContext *var3;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  LabelPoint *begin;
  unint64_t v13;
  RouteSegment *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v39;
  double v40;
  double v41;
  double v42;
  LabelLayoutContext *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float32x2_t v53;
  float32x2_t v54;
  float v55;
  float v56;
  BOOL v57;
  float v58;
  BOOL v59;
  float32x2_t v60;
  float32x2_t v61;
  RouteSegment *end;
  RouteSegment *value;
  RouteSegment *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  RouteSegment *v71;
  RouteSegment *v72;
  RouteSegment *v73;
  __int128 v74;
  RouteSegment *v75;
  float32x2_t v76;
  float32x2_t v77;
  float32x2_t v78;
  double v79;
  double v80;
  double v81;
  _QWORD v82[2];

  if (!self->_screenRouteValid)
  {
    if (!self->_simplifiedRouteValid)
      -[VKLabelNavRoadGraph _updateSimplifiedRoute](self, "_updateSimplifiedRoute");
    self->_screenRouteValid = 1;
    self->_screenRouteSegments.__end_ = self->_screenRouteSegments.__begin_;
    self->_firstPOIAligningRouteSegment = 0;
    var3 = a3->var3;
    v6 = *((double *)var3 + 35);
    v80 = *((double *)var3 + 17);
    v81 = *((double *)var3 + 34);
    v7 = *((double *)var3 + 19);
    v79 = *((double *)var3 + 18);
    v8 = *((double *)var3 + 20);
    v9 = *((double *)var3 + 21);
    v10 = *((double *)var3 + 22);
    v11 = *((_QWORD *)var3 + 133);
    v82[0] = 0;
    v82[1] = v11;
    begin = self->_simplifiedRoutePoints.__begin_;
    if (0xAAAAAAAAAAAAAAABLL * ((self->_simplifiedRoutePoints.__end_ - begin) >> 4) >= 2)
    {
      v13 = 1;
      do
      {
        if (self->_currentRoadStartSimplifiedPointIndex == v13 - 1)
          self->_firstPOIAligningRouteSegment = 0xCCCCCCCCCCCCCCCDLL
                                              * ((self->_screenRouteSegments.__end_ - self->_screenRouteSegments.__begin_) >> 2);
        md::NavContext::worldPoint((md::NavContext *)*((unsigned __int8 *)a3->var3 + 8), (const md::LabelPoint *)((char *)begin + 48 * v13 - 48));
        v16 = v15;
        v18 = v17;
        v20 = v19;
        md::NavContext::worldPoint((md::NavContext *)*((unsigned __int8 *)a3->var3 + 8), (const md::LabelPoint *)((char *)self->_simplifiedRoutePoints.__begin_ + 48 * v13));
        v24 = (v16 - v80) * v8 + (v18 - v79) * v9 + (v20 - v7) * v10;
        v25 = (v21 - v80) * v8 + (v22 - v79) * v9 + (v23 - v7) * v10;
        if (v24 <= v25)
        {
          v26 = (v16 - v80) * v8 + (v18 - v79) * v9 + (v20 - v7) * v10;
          v27 = (v21 - v80) * v8 + (v22 - v79) * v9 + (v23 - v7) * v10;
          v28 = v21;
          v29 = v22;
          v30 = v23;
          v21 = v16;
          v22 = v18;
          v23 = v20;
        }
        else
        {
          v26 = (v21 - v80) * v8 + (v22 - v79) * v9 + (v23 - v7) * v10;
          v27 = (v16 - v80) * v8 + (v18 - v79) * v9 + (v20 - v7) * v10;
          v28 = v16;
          v29 = v18;
          v30 = v20;
        }
        if (v27 >= v81 && v26 <= v6)
        {
          v32 = v27 - v26;
          v33 = v26 >= v81 || v32 <= 2.22044605e-16;
          v34 = v21;
          v35 = v22;
          v36 = v23;
          if (!v33)
          {
            v37 = (v81 - v26) / v32;
            v34 = v21 + (v28 - v21) * v37;
            v35 = v22 + (v29 - v22) * v37;
            v36 = v23 + (v30 - v23) * v37;
          }
          if (v27 > v6 && v32 > 2.22044605e-16)
          {
            v39 = (v6 - v26) / v32;
            v28 = v21 + (v28 - v21) * v39;
            v29 = v22 + (v29 - v22) * v39;
            v30 = v23 + (v30 - v23) * v39;
          }
          if (v24 <= v25)
          {
            v40 = v36;
            v41 = v35;
            v42 = v34;
            v36 = v30;
            v35 = v29;
            v34 = v28;
          }
          else
          {
            v40 = v30;
            v41 = v29;
            v42 = v28;
          }
          v43 = a3->var3;
          v44 = *((double *)v43 + 111);
          v45 = *((double *)v43 + 115);
          v46 = *((double *)v43 + 123);
          v47 = *((double *)v43 + 119);
          v48 = 1.0 / (v46 + v44 * v42 + v45 * v41 + v47 * v40);
          v49 = *((float64x2_t *)v43 + 54);
          v50 = *((float64x2_t *)v43 + 56);
          v51 = vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)v43 + 60), v49, v42), v50, v41);
          v52 = *((float64x2_t *)v43 + 58);
          v53 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(v51, v52, v40), v48));
          v54 = vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(*((float64x2_t *)v43 + 60), v49, v34), v50, v35), v52, v36), 1.0 / (v46 + v44 * v34 + v45 * v35 + v47 * v36)));
          v55 = v53.f32[1];
          v56 = v54.f32[1];
          v76 = v54;
          v77 = v53;
          if (lineSegmentIntersectsRectangle((float *)v82, v53.f32[0], v53.f32[1], v54.f32[0], v54.f32[1]))
          {
            v57 = (float)(v56 - v55) < 0.0;
            if ((float)(v56 - v55) < 0.0)
            {
              v58 = fabsf(vsub_f32(v76, v77).f32[0]);
              v59 = v58 > 1.0e-15 && (float)((float)(v56 - v55) / v58) > -0.08749;
              v60 = v77;
              v61 = v76;
            }
            else
            {
              v59 = 0;
              v60 = v76;
              v61 = v77;
            }
            end = self->_screenRouteSegments.__end_;
            value = self->_screenRouteSegments.__end_cap_.__value_;
            if (end >= value)
            {
              v64 = self->_screenRouteSegments.__begin_;
              v65 = 0xCCCCCCCCCCCCCCCDLL * ((end - v64) >> 2);
              v66 = v65 + 1;
              if (v65 + 1 > 0xCCCCCCCCCCCCCCCLL)
                abort();
              v67 = 0xCCCCCCCCCCCCCCCDLL * ((value - v64) >> 2);
              if (2 * v67 > v66)
                v66 = 2 * v67;
              if (v67 >= 0x666666666666666)
                v66 = 0xCCCCCCCCCCCCCCCLL;
              if (v66)
              {
                v78 = v61;
                v68 = 20 * v66;
                v69 = (*(uint64_t (**)(Allocator *, unint64_t, uint64_t))(*(_QWORD *)self->_screenRouteSegments.__end_cap_.__value__2._allocator
                                                                                        + 16))(self->_screenRouteSegments.__end_cap_.__value__2._allocator, 20 * v66, 4);
                v70 = v69 + 20 * v65;
                v66 = v69 + v68;
                if (v69)
                {
                  *(float32x2_t *)v70 = v78;
                  *(float32x2_t *)(v70 + 8) = v60;
                  *(_BYTE *)(v70 + 16) = v57;
                  *(_BYTE *)(v70 + 17) = v59;
                }
              }
              else
              {
                v70 = 20 * v65;
              }
              v72 = self->_screenRouteSegments.__begin_;
              v71 = self->_screenRouteSegments.__end_;
              v73 = (RouteSegment *)v70;
              if (v71 != v72)
              {
                do
                {
                  v74 = *(_OWORD *)((char *)v71 - 20);
                  *((_DWORD *)v73 - 1) = *((_DWORD *)v71 - 1);
                  *(_OWORD *)((char *)v73 - 20) = v74;
                  v73 = (RouteSegment *)((char *)v73 - 20);
                  v71 = (RouteSegment *)((char *)v71 - 20);
                }
                while (v71 != v72);
                v71 = self->_screenRouteSegments.__begin_;
              }
              v14 = (RouteSegment *)(v70 + 20);
              self->_screenRouteSegments.__begin_ = v73;
              self->_screenRouteSegments.__end_ = (RouteSegment *)(v70 + 20);
              v75 = self->_screenRouteSegments.__end_cap_.__value_;
              self->_screenRouteSegments.__end_cap_.__value_ = (RouteSegment *)v66;
              if (v71)
                (*(void (**)(Allocator *, RouteSegment *, int64_t))(*(_QWORD *)self->_screenRouteSegments.__end_cap_.__value__2._allocator
                                                                                    + 40))(self->_screenRouteSegments.__end_cap_.__value__2._allocator, v71, v75 - v71);
            }
            else
            {
              if (end)
              {
                *(float32x2_t *)end = v61;
                *((float32x2_t *)end + 1) = v60;
                *((_BYTE *)end + 16) = v57;
                *((_BYTE *)end + 17) = v59;
              }
              v14 = (RouteSegment *)((char *)end + 20);
            }
            self->_screenRouteSegments.__end_ = v14;
            if (0xCCCCCCCCCCCCCCCDLL * ((v14 - self->_screenRouteSegments.__begin_) >> 2) > 0x13)
              break;
          }
        }
        ++v13;
        begin = self->_simplifiedRoutePoints.__begin_;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((self->_simplifiedRoutePoints.__end_ - begin) >> 4) > v13);
    }
  }
}

- (BOOL)collideRouteWithLabel:(id)a3 routeCrossProduct:(float *)a4 context:(NavContext *)a5
{
  id v8;
  uint64_t v9;
  RouteSegment *end;
  RouteSegment *begin;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;

  v8 = a3;
  if (!self->_screenRouteValid)
    -[VKLabelNavRoadGraph _transformRouteToScreenWithContext:](self, "_transformRouteToScreenWithContext:", a5);
  v9 = objc_msgSend(v8, "label");
  begin = self->_screenRouteSegments.__begin_;
  end = self->_screenRouteSegments.__end_;
  if (begin == end)
  {
LABEL_7:
    v17 = 0;
  }
  else
  {
    v12 = *(_QWORD *)v9;
    v19 = *(_OWORD *)(*(_QWORD *)v9 + 336);
    while (1)
    {
      v20 = v19;
      v13 = *(float *)begin;
      v14 = *((float *)begin + 1);
      v15 = *((float *)begin + 2);
      v16 = *((float *)begin + 3);
      if ((lineSegmentIntersectsRectangle((float *)&v20, *(float *)begin, v14, v15, v16) & 1) != 0)
        break;
      begin = (RouteSegment *)((char *)begin + 20);
      if (begin == end)
        goto LABEL_7;
    }
    *a4 = (float)((float)(v13 - *(float *)(v12 + 328)) * (float)(v16 - v14))
        + (float)((float)(*(float *)(v12 + 332) - v14) * (float)(v15 - v13));
    v17 = 1;
  }

  return v17;
}

- (unsigned)computeRoutePositionForPOIAtPixel:(const void *)a3 currentPosition:(unsigned __int8)a4 context:(NavContext *)a5
{
  int v6;
  unint64_t firstPOIAligningRouteSegment;
  RouteSegment *begin;
  unint64_t v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v26;
  float v27;
  _BOOL4 v28;
  int v29;
  float *v30;
  int v31;
  _BOOL4 v32;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v41;
  char *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  float *v47;
  float *v48;
  float v49;
  float v50;
  float v51;
  float v52;
  unsigned __int8 v53;

  v6 = a4;
  if (!self->_screenRouteValid)
    -[VKLabelNavRoadGraph _transformRouteToScreenWithContext:](self, "_transformRouteToScreenWithContext:", a5);
  firstPOIAligningRouteSegment = self->_firstPOIAligningRouteSegment;
  begin = self->_screenRouteSegments.__begin_;
  v11 = 0xCCCCCCCCCCCCCCCDLL * ((self->_screenRouteSegments.__end_ - begin) >> 2);
  if (firstPOIAligningRouteSegment >= v11)
    goto LABEL_12;
  v12 = *((float *)a5->var1 + 44);
  v13 = (float)(v12 * 140.0) * (float)(v12 * 140.0);
  v14 = *(float *)a3;
  v15 = *((float *)a3 + 1);
  v16 = (float *)((char *)begin + 20 * firstPOIAligningRouteSegment);
  v18 = *v16;
  v17 = v16[1];
  v19 = v16[2] - *v16;
  v20 = v16[3] - v17;
  v21 = (float)(v19 * v19) + (float)(v20 * v20);
  if (v21 > 1.0e-15)
  {
    v22 = v14 - v18;
    v23 = v15 - v17;
    v24 = (float)((float)(v14 - v18) * v19) + (float)((float)(v15 - v17) * v20);
    if (v24 >= 0.0 && v24 <= v21)
    {
      v26 = fminf(fmaxf(v24 / v21, 0.0), 1.0);
      v27 = (float)((float)(v14 - (float)(v18 + (float)(v26 * v19))) * (float)(v14 - (float)(v18 + (float)(v26 * v19))))
          + (float)((float)(v15 - (float)(v17 + (float)(v26 * v20))) * (float)(v15 - (float)(v17 + (float)(v26 * v20))));
      if (v27 < v13)
        goto LABEL_37;
    }
  }
  if (firstPOIAligningRouteSegment + 1 == v11)
  {
LABEL_12:
    v28 = 0;
    v29 = 9;
    goto LABEL_40;
  }
  v30 = (float *)((char *)begin + 20 * firstPOIAligningRouteSegment++ + 36);
  while (1)
  {
    v34 = *(v30 - 2);
    v35 = *(v30 - 1);
    v37 = *(v30 - 4);
    v36 = *(v30 - 3);
    v19 = v34 - v37;
    v20 = v35 - v36;
    v22 = v14 - v37;
    v23 = v15 - v36;
    v38 = (float)(v19 * v19) + (float)(v20 * v20);
    v39 = (float)((float)(v14 - v37) * (float)(v34 - v37)) + (float)((float)(v15 - v36) * (float)(v35 - v36));
    if (v38 <= 1.0e-15)
      break;
    if (v39 < 0.0 || v39 > v38)
      break;
    v41 = fminf(fmaxf(v39 / v38, 0.0), 1.0);
    v27 = (float)((float)(v14 - (float)(v37 + (float)(v41 * v19))) * (float)(v14 - (float)(v37 + (float)(v41 * v19))))
        + (float)((float)(v15 - (float)(v36 + (float)(v41 * v20))) * (float)(v15 - (float)(v36 + (float)(v41 * v20))));
    if (v27 < v13)
      goto LABEL_37;
LABEL_21:
    ++firstPOIAligningRouteSegment;
    v30 += 5;
    if (v11 == firstPOIAligningRouteSegment)
      goto LABEL_12;
  }
  v31 = *(unsigned __int8 *)v30;
  v32 = v39 < 0.0;
  v27 = (float)((float)(v14 - v34) * (float)(v14 - v34)) + (float)((float)(v15 - v35) * (float)(v15 - v35));
  if (*(_BYTE *)v30)
    v32 = v39 > v38;
  else
    v27 = (float)(v22 * v22) + (float)(v23 * v23);
  if (!v32 || v27 >= v13)
    goto LABEL_21;
  v42 = (char *)begin + 20 * firstPOIAligningRouteSegment - 20;
  v43 = v42[16];
  v44 = *(_QWORD *)v42;
  v45 = *(_QWORD *)((char *)begin + 20 * firstPOIAligningRouteSegment - 12);
  if (v43)
    v46 = v44;
  else
    v46 = *(_QWORD *)((char *)begin + 20 * firstPOIAligningRouteSegment - 12);
  v47 = v30 - 4;
  v48 = v30 - 2;
  if (!v31)
    v48 = v47;
  v49 = v14 - *(float *)&v44;
  v50 = v15 - *((float *)&v44 + 1);
  if (v46 == *(_QWORD *)v48)
  {
    --firstPOIAligningRouteSegment;
    v20 = *((float *)&v45 + 1) - *((float *)&v44 + 1);
    v19 = *(float *)&v45 - *(float *)&v44;
    v23 = v50;
    v22 = v49;
  }
LABEL_37:
  v28 = v27 > (float)((float)(v12 * 130.0) * (float)(v12 * 130.0));
  v51 = -(float)((float)(v22 * v20) - (float)(v23 * v19));
  v52 = -(float)((float)(v23 * v19) - (float)(v22 * v20));
  if (*((_BYTE *)begin + 20 * firstPOIAligningRouteSegment + 17))
    v51 = v52;
  v29 = 4 * (v51 > 0.0);
LABEL_40:
  if ((((v6 != 9) ^ (v29 != 9)) & v28) != 0)
    v53 = v6;
  else
    v53 = v29;
  if (v29 == v6)
    return v6;
  else
    return v53;
}

- (id)oppositeCarriagewayJunctions
{
  return self->_oppositeCarriagewayJunctions;
}

- (BOOL)prepareOppositeCarriagewayJunctions
{
  BOOL result;
  char *next;
  unint64_t value;
  uint64_t i;
  NSMutableArray *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  unint64_t v16;
  void *v17;
  id v18;
  unint64_t v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  unsigned int v25;
  unsigned int v26;
  id *v27;
  double v28;
  unsigned __int8 v29;
  size_t v30;
  size_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  _OWORD *v41;
  uint64_t *v42;
  mdm::Allocator *v43;
  mdm::Allocator *v44;
  std::__shared_weak_count *v45;
  _QWORD *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  _OWORD *v50;
  _QWORD *v51;
  mdm::Allocator *v52;
  unsigned __int8 v53;
  size_t v54;
  size_t v55;
  _QWORD *p_dst;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  unint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  _OWORD *v66;
  uint64_t *v67;
  mdm::Allocator *v68;
  mdm::Allocator *v69;
  std::__shared_weak_count *v70;
  unint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  _OWORD *v75;
  _QWORD *v76;
  mdm::Allocator *v77;
  _QWORD *v78;
  id v79;
  uint64_t v80;
  size_t v81;
  size_t v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  std::__shared_weak_count *v87;
  uint64_t *v88;
  unint64_t v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;
  uint64_t *v93;
  unint64_t v94;
  uint64_t v95;
  size_t v96;
  size_t v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  std::__shared_weak_count *v102;
  uint64_t *v103;
  unint64_t v104;
  std::__shared_weak_count *v105;
  unint64_t *v106;
  unint64_t v107;
  uint64_t *v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  std::__shared_weak_count *v114;
  unint64_t *p_shared_owners;
  unint64_t v116;
  void *v117;
  double v118;
  double v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  double v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t k;
  void *v133;
  NSMutableArray *oppositeCarriagewayJunctions;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v138;
  uint64_t v139;
  unordered_map<std::basic_string<char, std::char_traits<char>, geo::StdAllocator<char, mdm::Allocator>>, std::shared_ptr<NavRoadFeature>, std::hash<std::basic_string<char, std::char_traits<char>, geo::StdAllocator<char, mdm::Allocator>>>, std::equal_to<std::basic_string<char, std::char_traits<char>, geo::StdAllocator<char, mdm::Allocator>>>, geo::StdAllocator<std::pair<const std::basic_string<char, std::char_traits<char>, geo::StdAllocator<char, mdm::Allocator>>, std::shared_ptr<NavRoadFeature>>, mdm::Allocator>> *p_routeFeatureMap;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t *v149;
  std::__shared_weak_count *v150;
  _QWORD *__dst;
  size_t v152;
  unint64_t v153;
  uint64_t v154;
  char *v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  id v159;
  id v160;
  char v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _OWORD *v166;
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  if (self->_oppositeCarriagewayJunctionsValid)
    return 1;
  if (-[NSMutableArray count](self->_junctions, "count"))
  {
    if (!self->_routeFeatureMapValid)
    {
      p_routeFeatureMap = &self->_routeFeatureMap;
      if (self->_routeFeatureMap.__table_.__p2_.__value_)
      {
        next = (char *)self->_routeFeatureMap.__table_.__p1_.__value_.__next_;
        if (next)
        {
          do
          {
            v113 = *(char **)next;
            v114 = (std::__shared_weak_count *)*((_QWORD *)next + 7);
            if (v114)
            {
              p_shared_owners = (unint64_t *)&v114->__shared_owners_;
              do
                v116 = __ldaxr(p_shared_owners);
              while (__stlxr(v116 - 1, p_shared_owners));
              if (!v116)
              {
                ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
                std::__shared_weak_count::__release_weak(v114);
              }
            }
            if (next[39] < 0)
              (*(void (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)next + 5) + 40))(*((_QWORD *)next + 5), *((_QWORD *)next + 2), *((_QWORD *)next + 4) & 0x7FFFFFFFFFFFFFFFLL);
            (*(void (**)(Allocator *, char *, uint64_t))(*(_QWORD *)self->_routeFeatureMap.__table_.__p1_.__value__2._allocator
                                                                 + 40))(self->_routeFeatureMap.__table_.__p1_.__value__2._allocator, next, 64);
            next = v113;
          }
          while (v113);
        }
        self->_routeFeatureMap.__table_.__p1_.__value_.__next_ = 0;
        value = self->_routeFeatureMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
        if (value)
        {
          for (i = 0; i != value; ++i)
            p_routeFeatureMap->__table_.__bucket_list_.__ptr_.__value_[i] = 0;
        }
        self->_routeFeatureMap.__table_.__p2_.__value_ = 0;
      }
      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      v7 = self->_junctions;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v162, v169, 16);
      if (v8)
      {
        v9 = 0;
        v10 = *(_QWORD *)v163;
        for (j = *(_QWORD *)v163; ; j = *(_QWORD *)v163)
        {
          if (j != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * v9);
          if (objc_msgSend(v12, "isOnRoute"))
          {
            objc_msgSend(v12, "outgoingRoad");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13 == 0;

            if (!v14)
            {
              objc_msgSend(v12, "outgoingRoad");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "cstrName");

              objc_msgSend(v12, "outgoingRoad");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "shieldGroup");
              v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v19 = objc_msgSend(v18, "UTF8String");

              if (v16 | v19)
                break;
            }
          }
LABEL_101:
          if (++v9 >= v8)
          {
            v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v162, v169, 16);
            if (!v8)
              goto LABEL_170;
            v9 = 0;
          }
        }
        v155 = 0;
        v156 = 0;
        v157 = 0;
        {
          v110 = operator new();
          mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v110, "VectorKitLabels", 0x5ED09DD50000000FLL);
        }
        v158 = mdm::Allocator::instance(void)::alloc;
        v159 = 0;
        v160 = 0;
        objc_msgSend(v12, "outgoingRoad");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "appendSimplifiedWorldRoadPoints:pointElevations:", &v155, 0);

        if ((unint64_t)(v156 - v155) < 0x20)
          goto LABEL_99;
        objc_storeStrong(&v159, v12);
        objc_msgSend(v12, "outgoingRoad");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKLabelNavRoadGraph junctionForRoad:nearJunction:crossTileEdge:](self, "junctionForRoad:nearJunction:crossTileEdge:", v22, 0, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v160;
        v160 = v23;

        if (!v160)
          goto LABEL_99;
        v25 = objc_msgSend(v159, "largestRoadClass");
        v26 = objc_msgSend(v160, "largestRoadClass");
        v27 = &v159;
        if (v25 <= v26)
          v27 = &v160;
        v161 = objc_msgSend(*v27, "largestRoadClass");
        LODWORD(v28) = (unint64_t)objc_msgSend(v159, "routeOffset") >> 32;
        if (*(float *)&v28 < 0.0 && COERCE_FLOAT((unint64_t)objc_msgSend(v160, "routeOffset", v28) >> 32) < 0.0)
          goto LABEL_99;
        if (!v16 || !*(_BYTE *)v16)
        {
LABEL_63:
          if (v19 && *(_BYTE *)v19)
          {
            {
              v112 = operator new();
              mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v112, "VectorKitLabels", 0x5ED09DD50000000FLL);
            }
            v154 = mdm::Allocator::instance(void)::alloc;
            v54 = strlen((const char *)v19);
            if (v54 > 0x7FFFFFFFFFFFFFF7)
              abort();
            v55 = v54;
            if (v54 >= 0x17)
            {
              v57 = (v54 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v54 | 7) != 0x17)
                v57 = v54 | 7;
              v58 = v57 + 1;
              p_dst = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                                     + 16))(mdm::Allocator::instance(void)::alloc, v57 + 1, 1);
              v152 = v55;
              v153 = v58 | 0x8000000000000000;
              __dst = p_dst;
            }
            else
            {
              HIBYTE(v153) = v54;
              p_dst = &__dst;
              if (!v54)
              {
LABEL_74:
                *((_BYTE *)p_dst + v55) = 0;
                v59 = std::__hash_table<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::__unordered_map_hasher<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,std::__unordered_map_equal<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,geo::StdAllocator<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,mdm::Allocator>>::find<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>(p_routeFeatureMap, (uint64_t)&__dst);
                if (SHIBYTE(v153) < 0)
                  (*(void (**)(uint64_t, _QWORD *, unint64_t))(*(_QWORD *)v154 + 40))(v154, __dst, v153 & 0x7FFFFFFFFFFFFFFFLL);
                if (v59)
                {
                  v60 = (uint64_t *)v59[6];
                  v61 = v60[9];
                  if (v61 >= v60[10])
                  {
                    v76 = std::vector<NavRoadSegment,geo::StdAllocator<NavRoadSegment,mdm::Allocator>>::__push_back_slow_path<NavRoadSegment const&>(v60 + 8, (uint64_t)&v155);
                  }
                  else
                  {
                    if (v61)
                    {
                      *(_QWORD *)v61 = 0;
                      *(_QWORD *)(v61 + 8) = 0;
                      v62 = v158;
                      *(_QWORD *)(v61 + 16) = 0;
                      *(_QWORD *)(v61 + 24) = v62;
                      v63 = v155;
                      v64 = v156;
                      v65 = v156 - v155;
                      if (v156 != v155)
                      {
                        if (v65 < 0)
                          abort();
                        v66 = (_OWORD *)(*(uint64_t (**)(uint64_t, int64_t, uint64_t))(*(_QWORD *)v62 + 16))(v62, v156 - v155, 8);
                        *(_QWORD *)v61 = v66;
                        *(_QWORD *)(v61 + 8) = v66;
                        *(_QWORD *)(v61 + 16) = &v66[v65 >> 4];
                        do
                        {
                          if (v66)
                            *v66 = *(_OWORD *)v63;
                          v63 += 16;
                          ++v66;
                        }
                        while (v63 != v64);
                        *(_QWORD *)(v61 + 8) = v66;
                      }
                      *(_QWORD *)(v61 + 32) = v159;
                      *(_QWORD *)(v61 + 40) = v160;
                      *(_BYTE *)(v61 + 48) = v161;
                    }
                    v76 = (_QWORD *)(v61 + 56);
                    v60[9] = v61 + 56;
                  }
                  v60[9] = (uint64_t)v76;
                  goto LABEL_99;
                }
                v67 = (uint64_t *)operator new();
                *v67 = 0;
                v67[1] = 0;
                v67[2] = 0;
                v68 = (mdm::Allocator *)mdm::Allocator::instance((mdm::Allocator *)v67);
                v67[3] = (uint64_t)v68;
                v67[4] = 0;
                v67[5] = 0;
                v67[6] = 0;
                v69 = (mdm::Allocator *)mdm::Allocator::instance(v68);
                v67[7] = (uint64_t)v69;
                v67[8] = 0;
                v67[9] = 0;
                v67[10] = 0;
                v67[11] = mdm::Allocator::instance(v69);
                v149 = v67;
                v70 = (std::__shared_weak_count *)operator new();
                v70->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E6878;
                v70->__shared_owners_ = 0;
                v70->__shared_weak_owners_ = 0;
                v70[1].__vftable = (std::__shared_weak_count_vtbl *)v67;
                v150 = v70;
                std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_external(v67 + 4, (char *)v19);
                v71 = v67[9];
                if (v71 >= v67[10])
                {
                  v77 = (mdm::Allocator *)std::vector<NavRoadSegment,geo::StdAllocator<NavRoadSegment,mdm::Allocator>>::__push_back_slow_path<NavRoadSegment const&>(v67 + 8, (uint64_t)&v155);
                }
                else
                {
                  if (v71)
                  {
                    *(_QWORD *)v71 = 0;
                    *(_QWORD *)(v71 + 8) = 0;
                    v72 = v158;
                    *(_QWORD *)(v71 + 16) = 0;
                    *(_QWORD *)(v71 + 24) = v72;
                    v74 = v155;
                    v73 = v156;
                    if (v156 != v155)
                    {
                      if (v156 - v155 < 0)
                        abort();
                      v139 = v156 - v155;
                      v75 = (_OWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v72 + 16))(v72);
                      *(_QWORD *)v71 = v75;
                      *(_QWORD *)(v71 + 8) = v75;
                      *(_QWORD *)(v71 + 16) = &v75[v139 >> 4];
                      do
                      {
                        if (v75)
                          *v75 = *(_OWORD *)v74;
                        v74 += 16;
                        ++v75;
                      }
                      while (v74 != v73);
                      *(_QWORD *)(v71 + 8) = v75;
                    }
                    *(_QWORD *)(v71 + 32) = v159;
                    *(_QWORD *)(v71 + 40) = v160;
                    *(_BYTE *)(v71 + 48) = v161;
                  }
                  v77 = (mdm::Allocator *)(v71 + 56);
                  v67[9] = v71 + 56;
                }
                v67[9] = (uint64_t)v77;
                v95 = mdm::Allocator::instance(v77);
                v154 = v95;
                v96 = strlen((const char *)v19);
                if (v96 > 0x7FFFFFFFFFFFFFF7)
                  abort();
                v97 = v96;
                if (v96 >= 0x17)
                {
                  v99 = (v96 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v96 | 7) != 0x17)
                    v99 = v96 | 7;
                  v100 = v99 + 1;
                  v98 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v95 + 16))(v95, v99 + 1, 1);
                  v152 = v97;
                  v153 = v100 | 0x8000000000000000;
                  __dst = v98;
                }
                else
                {
                  HIBYTE(v153) = v96;
                  v98 = &__dst;
                  if (!v96)
                    goto LABEL_141;
                }
                memmove(v98, (const void *)v19, v97);
LABEL_141:
                *((_BYTE *)v98 + v97) = 0;
                v166 = &__dst;
                v101 = std::__hash_table<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<NavRoadFeature>>,std::__unordered_map_hasher<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<NavRoadFeature>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,std::__unordered_map_equal<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<NavRoadFeature>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,geo::StdAllocator<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<NavRoadFeature>>,mdm::Allocator>>::__emplace_unique_key_args<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::piecewise_construct_t const&,std::tuple<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>&&>,std::tuple<>>((float *)p_routeFeatureMap, (uint64_t)&__dst, &v166);
                v102 = v150;
                if (v150)
                {
                  v103 = &v150->__shared_owners_;
                  do
                    v104 = __ldxr((unint64_t *)v103);
                  while (__stxr(v104 + 1, (unint64_t *)v103));
                }
                v105 = *(std::__shared_weak_count **)(v101 + 56);
                *(_QWORD *)(v101 + 48) = v149;
                *(_QWORD *)(v101 + 56) = v102;
                if (v105)
                {
                  v106 = (unint64_t *)&v105->__shared_owners_;
                  do
                    v107 = __ldaxr(v106);
                  while (__stlxr(v107 - 1, v106));
                  if (!v107)
                  {
                    ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
                    std::__shared_weak_count::__release_weak(v105);
                  }
                }
                if (SHIBYTE(v153) < 0)
                  (*(void (**)(uint64_t, _QWORD *, unint64_t))(*(_QWORD *)v154 + 40))(v154, __dst, v153 & 0x7FFFFFFFFFFFFFFFLL);
                if (v150)
                {
                  v108 = &v150->__shared_owners_;
                  do
                    v109 = __ldaxr((unint64_t *)v108);
                  while (__stlxr(v109 - 1, (unint64_t *)v108));
                  if (!v109)
                  {
                    ((void (*)(std::__shared_weak_count *))v150->__on_zero_shared)(v150);
                    std::__shared_weak_count::__release_weak(v150);
                  }
                }
                goto LABEL_99;
              }
            }
            memmove(p_dst, (const void *)v19, v55);
            goto LABEL_74;
          }
LABEL_99:

          if (v155)
          {
            v156 = v155;
            (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)v158 + 40))(v158, v155, v157 - (_QWORD)v155);
          }
          goto LABEL_101;
        }
        {
          v111 = operator new();
          mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v111, "VectorKitLabels", 0x5ED09DD50000000FLL);
        }
        v154 = mdm::Allocator::instance(void)::alloc;
        v30 = strlen((const char *)v16);
        if (v30 > 0x7FFFFFFFFFFFFFF7)
          abort();
        v31 = v30;
        if (v30 >= 0x17)
        {
          v33 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v30 | 7) != 0x17)
            v33 = v30 | 7;
          v34 = v33 + 1;
          v32 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                               + 16))(mdm::Allocator::instance(void)::alloc, v33 + 1, 1);
          v152 = v31;
          v153 = v34 | 0x8000000000000000;
          __dst = v32;
        }
        else
        {
          HIBYTE(v153) = v30;
          v32 = &__dst;
          if (!v30)
          {
LABEL_38:
            *((_BYTE *)v32 + v31) = 0;
            v35 = std::__hash_table<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::__unordered_map_hasher<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,std::__unordered_map_equal<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,geo::StdAllocator<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,mdm::Allocator>>::find<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>(p_routeFeatureMap, (uint64_t)&__dst);
            if (SHIBYTE(v153) < 0)
              (*(void (**)(uint64_t, _QWORD *, unint64_t))(*(_QWORD *)v154 + 40))(v154, __dst, v153 & 0x7FFFFFFFFFFFFFFFLL);
            if (v35)
            {
              v36 = (uint64_t *)v35[6];
              v37 = v36[9];
              if (v37 >= v36[10])
              {
                v51 = std::vector<NavRoadSegment,geo::StdAllocator<NavRoadSegment,mdm::Allocator>>::__push_back_slow_path<NavRoadSegment const&>(v36 + 8, (uint64_t)&v155);
              }
              else
              {
                if (v37)
                {
                  *(_QWORD *)v37 = 0;
                  *(_QWORD *)(v37 + 8) = 0;
                  v38 = v158;
                  *(_QWORD *)(v37 + 16) = 0;
                  *(_QWORD *)(v37 + 24) = v38;
                  v40 = v155;
                  v39 = v156;
                  if (v156 != v155)
                  {
                    if (v156 - v155 < 0)
                      abort();
                    v137 = v156 - v155;
                    v41 = (_OWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v38 + 16))(v38);
                    *(_QWORD *)v37 = v41;
                    *(_QWORD *)(v37 + 8) = v41;
                    *(_QWORD *)(v37 + 16) = &v41[v137 >> 4];
                    do
                    {
                      if (v41)
                        *v41 = *(_OWORD *)v40;
                      v40 += 16;
                      ++v41;
                    }
                    while (v40 != v39);
                    *(_QWORD *)(v37 + 8) = v41;
                  }
                  *(_QWORD *)(v37 + 32) = v159;
                  *(_QWORD *)(v37 + 40) = v160;
                  *(_BYTE *)(v37 + 48) = v161;
                }
                v51 = (_QWORD *)(v37 + 56);
                v36[9] = v37 + 56;
              }
              v36[9] = (uint64_t)v51;
              goto LABEL_63;
            }
            v42 = (uint64_t *)operator new();
            *v42 = 0;
            v42[1] = 0;
            v42[2] = 0;
            v43 = (mdm::Allocator *)mdm::Allocator::instance((mdm::Allocator *)v42);
            v42[3] = (uint64_t)v43;
            v42[4] = 0;
            v42[5] = 0;
            v42[6] = 0;
            v44 = (mdm::Allocator *)mdm::Allocator::instance(v43);
            v42[7] = (uint64_t)v44;
            v42[8] = 0;
            v42[9] = 0;
            v42[10] = 0;
            v42[11] = mdm::Allocator::instance(v44);
            v149 = v42;
            v45 = (std::__shared_weak_count *)operator new();
            v45->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E6878;
            v45->__shared_owners_ = 0;
            v45->__shared_weak_owners_ = 0;
            v45[1].__vftable = (std::__shared_weak_count_vtbl *)v42;
            v150 = v45;
            std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_external(v42, (char *)v16);
            v46 = (_QWORD *)v42[9];
            if ((unint64_t)v46 >= v42[10])
            {
              v52 = (mdm::Allocator *)std::vector<NavRoadSegment,geo::StdAllocator<NavRoadSegment,mdm::Allocator>>::__push_back_slow_path<NavRoadSegment const&>(v42 + 8, (uint64_t)&v155);
            }
            else
            {
              if (v46)
              {
                *v46 = 0;
                v46[1] = 0;
                v47 = v158;
                v46[2] = 0;
                v46[3] = v47;
                v49 = v155;
                v48 = v156;
                if (v156 != v155)
                {
                  v138 = v46;
                  if (v156 - v155 < 0)
                    abort();
                  v136 = v156 - v155;
                  v50 = (_OWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v47 + 16))(v47);
                  v46 = v138;
                  *v138 = v50;
                  v138[1] = v50;
                  v138[2] = &v50[v136 >> 4];
                  do
                  {
                    if (v50)
                      *v50 = *(_OWORD *)v49;
                    v49 += 16;
                    ++v50;
                  }
                  while (v49 != v48);
                  v138[1] = v50;
                }
                v78 = v46;
                v46[4] = v159;
                v79 = v160;
                v46 = v78;
                v78[5] = v79;
                *((_BYTE *)v78 + 48) = v161;
              }
              v52 = (mdm::Allocator *)(v46 + 7);
              v42[9] = (uint64_t)(v46 + 7);
            }
            v42[9] = (uint64_t)v52;
            v80 = mdm::Allocator::instance(v52);
            v154 = v80;
            v81 = strlen((const char *)v16);
            if (v81 > 0x7FFFFFFFFFFFFFF7)
              abort();
            v82 = v81;
            if (v81 >= 0x17)
            {
              v84 = (v81 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v81 | 7) != 0x17)
                v84 = v81 | 7;
              v85 = v84 + 1;
              v83 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v80 + 16))(v80, v84 + 1, 1);
              v152 = v82;
              v153 = v85 | 0x8000000000000000;
              __dst = v83;
            }
            else
            {
              HIBYTE(v153) = v81;
              v83 = &__dst;
              if (!v81)
                goto LABEL_115;
            }
            memmove(v83, (const void *)v16, v82);
LABEL_115:
            *((_BYTE *)v83 + v82) = 0;
            v166 = &__dst;
            v86 = std::__hash_table<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<NavRoadFeature>>,std::__unordered_map_hasher<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<NavRoadFeature>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,std::__unordered_map_equal<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<NavRoadFeature>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,geo::StdAllocator<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<NavRoadFeature>>,mdm::Allocator>>::__emplace_unique_key_args<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::piecewise_construct_t const&,std::tuple<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>&&>,std::tuple<>>((float *)p_routeFeatureMap, (uint64_t)&__dst, &v166);
            v87 = v150;
            if (v150)
            {
              v88 = &v150->__shared_owners_;
              do
                v89 = __ldxr((unint64_t *)v88);
              while (__stxr(v89 + 1, (unint64_t *)v88));
            }
            v90 = *(std::__shared_weak_count **)(v86 + 56);
            *(_QWORD *)(v86 + 48) = v149;
            *(_QWORD *)(v86 + 56) = v87;
            if (v90)
            {
              v91 = (unint64_t *)&v90->__shared_owners_;
              do
                v92 = __ldaxr(v91);
              while (__stlxr(v92 - 1, v91));
              if (!v92)
              {
                ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
                std::__shared_weak_count::__release_weak(v90);
              }
            }
            if (SHIBYTE(v153) < 0)
              (*(void (**)(uint64_t, _QWORD *, unint64_t))(*(_QWORD *)v154 + 40))(v154, __dst, v153 & 0x7FFFFFFFFFFFFFFFLL);
            if (v150)
            {
              v93 = &v150->__shared_owners_;
              do
                v94 = __ldaxr((unint64_t *)v93);
              while (__stlxr(v94 - 1, (unint64_t *)v93));
              if (!v94)
              {
                ((void (*)(std::__shared_weak_count *))v150->__on_zero_shared)(v150);
                std::__shared_weak_count::__release_weak(v150);
              }
            }
            goto LABEL_63;
          }
        }
        memmove(v32, (const void *)v16, v31);
        goto LABEL_38;
      }
LABEL_170:

      self->_routeFeatureMapValid = 1;
    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_junctions, "objectAtIndexedSubscript:", 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "worldUnitsPerMeter");
    v119 = v118;

    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_tileDatasByIndex, "objectEnumerator");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v145, v168, 16);
    if (v121)
    {
      v122 = 0;
      v123 = 0;
      v124 = v119 * 50.0 * (v119 * 50.0);
      v125 = *(_QWORD *)v146;
      while (2)
      {
        v126 = 0;
        v127 = v123 + 1;
        v123 += v121;
        do
        {
          if (*(_QWORD *)v146 != v125)
            objc_enumerationMutation(v120);
          v128 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * v126);
          if ((objc_msgSend(v128, "oppositeCarriagewayJunctionsValid") & 1) == 0)
          {
            objc_msgSend(v128, "findOppositeCarriagewayJunctionsWithRouteFeatures:distanceThreshold:", &self->_routeFeatureMap, v124);
            if (v122)
            {

              return 0;
            }
            v122 = 1;
          }
          if ((unint64_t)(v127 + v126) > 0xB)
            goto LABEL_182;
          ++v126;
        }
        while (v121 != v126);
        v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v145, v168, 16);
        if (v121)
          continue;
        break;
      }
    }
LABEL_182:

    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_tileDatasByIndex, "objectEnumerator");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v141, v167, 16);
    if (v130)
    {
      v131 = *(_QWORD *)v142;
      do
      {
        for (k = 0; k != v130; ++k)
        {
          if (*(_QWORD *)v142 != v131)
            objc_enumerationMutation(v129);
          v133 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * k);
          if (objc_msgSend(v133, "oppositeCarriagewayJunctionsValid"))
          {
            oppositeCarriagewayJunctions = self->_oppositeCarriagewayJunctions;
            objc_msgSend(v133, "oppositeCarriagewayJunctions");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObjectsFromArray:](oppositeCarriagewayJunctions, "addObjectsFromArray:", v135);

          }
        }
        v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v141, v167, 16);
      }
      while (v130);
    }

    -[NSMutableArray removeObjectsInArray:](self->_oppositeCarriagewayJunctions, "removeObjectsInArray:", self->_junctions);
    -[NSMutableArray sortUsingComparator:](self->_oppositeCarriagewayJunctions, "sortUsingComparator:", &__block_literal_global_102);
  }
  result = 1;
  self->_oppositeCarriagewayJunctionsValid = 1;
  return result;
}

- (void)debugDraw:(id)a3 overlayConsole:(void *)a4 navContext:(NavContext *)a5
{
  RouteSegment *i;
  RouteSegment *begin;
  id v10;

  v10 = a3;
  if (!self->_screenRouteValid)
    -[VKLabelNavRoadGraph _transformRouteToScreenWithContext:](self, "_transformRouteToScreenWithContext:", a5);
  *((float *)a4 + 26) = fabsf(*((float *)a5->var1 + 44) * 3.0) * 0.5;
  *((_DWORD *)a4 + 24) = 32512;
  begin = self->_screenRouteSegments.__begin_;
  for (i = self->_screenRouteSegments.__end_; begin != i; begin = (RouteSegment *)((char *)begin + 20))
  {
    *((_DWORD *)a4 + 2) = *(_DWORD *)begin;
    *((_DWORD *)a4 + 3) = *((_DWORD *)begin + 1);
    ggl::DebugConsole::drawLine((uint64_t)a4, (float *)begin + 2);
  }
  *((float *)a4 + 26) = fabsf(*((float *)a5->var1 + 44)) * 0.5;

}

uint64_t __72__VKLabelNavRoadGraph_junctionlist__prepareOppositeCarriagewayJunctions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v3;
  double v4;

  v3 = *(double *)(a2 + 200);
  v4 = *(double *)(a3 + 200);
  if (v3 < v4)
    return -1;
  else
    return v3 > v4;
}

uint64_t __59__VKLabelNavRoadGraph_junctionlist___findOffRouteJunctions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isOffRouteGraph"))
  {
    if ((objc_msgSend(v2, "isIntersection") & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(v2, "isRoadTerminus");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __66__VKLabelNavRoadGraph_junctionlist___updateIntersectionsForDepth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double *v6;
  double *v7;
  double v8;
  double v9;
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

@end
