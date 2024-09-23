@implementation AltTileFetcher

- (AltTileFetcher)initWithToken:(id)a3
{
  id v4;
  AltTileFetcher *v5;
  uint64_t v6;
  GEOTileLoader *geoTileLoader;
  void *v8;
  uint64_t v9;
  NSString *tileLoaderClientIdentifier;
  GEOVectorTileDecoder *v11;
  GEOVectorTileDecoder *obj;
  GEOApplicationAuditToken *v13;
  GEOApplicationAuditToken *v14;
  GEOApplicationAuditToken *v15;
  GEOApplicationAuditToken *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AltTileFetcher;
  v5 = -[AltTileFetcher init](&v18, sel_init);
  objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
  v6 = objc_claimAutoreleasedReturnValue();
  geoTileLoader = v5->_geoTileLoader;
  v5->_geoTileLoader = (GEOTileLoader *)v6;

  v5->_numDownloads = 0;
  GEOTileLoaderClientIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  tileLoaderClientIdentifier = v5->_tileLoaderClientIdentifier;
  v5->_tileLoaderClientIdentifier = (NSString *)v9;

  v11 = (GEOVectorTileDecoder *)objc_alloc_init(MEMORY[0x1E0D276B0]);
  obj = v5->_vectorTileDecoder._obj;
  v5->_vectorTileDecoder._obj = v11;

  v13 = (GEOApplicationAuditToken *)v4;
  v14 = v13;
  if (v13)
    v15 = v13;
  v16 = v5->_auditToken._obj;
  v5->_auditToken._obj = v14;

  return v5;
}

- (uint64_t)getJobForKey:(uint64_t)a1@<X0>
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 104));
  v4 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyHashFunc,GEOTileKeyEqualsFunc,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyEqualsFunc,GEOTileKeyHashFunc,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>>>::find<_GEOTileKey>((_QWORD *)(a1 + 64));
  if (v4)
  {
    v5 = v4[5];
    *a2 = v4[4];
    a2[1] = v5;
    if (v5)
    {
      v6 = (unint64_t *)(v5 + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
  return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 104));
}

- (void)fetchDataForJob:(void *)a3
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *tileLoaderClientIdentifier;
  uint64_t v28;
  GEOApplicationAuditToken *obj;
  void *v30;
  _QWORD v31[5];
  __int128 *v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)a3;
  v33 = *(_OWORD *)(*(_QWORD *)a3 + 216);
  pthread_mutex_lock(*(pthread_mutex_t **)(v5 + 152));
  v6 = *(_DWORD *)(v5 + 160);
  pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 152));
  if ((v6 & 1) == 0)
  {
    pthread_mutex_lock((pthread_mutex_t *)self->_mutex.mMutex);
    if (std::__hash_table<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyHashFunc,GEOTileKeyEqualsFunc,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyEqualsFunc,GEOTileKeyHashFunc,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>>>::find<_GEOTileKey>(&self->_keyToJobMap.__table_.__bucket_list_.__ptr_.__value_))
    {
      v32 = &v33;
      v7 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyHashFunc,GEOTileKeyEqualsFunc,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyEqualsFunc,GEOTileKeyHashFunc,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((uint64_t *)&self->_keyToJobMap, (uint64_t)&v33, &v32)[4];
      v8 = *(_QWORD *)a3;
      while (1)
      {
        v9 = v7;
        v7 = *(_QWORD *)(v7 + 272);
        if (v7 == v8)
          break;
        if (!v7)
        {
          v10 = *((_QWORD *)a3 + 1);
          if (v10)
          {
            v11 = (unint64_t *)(v10 + 8);
            do
              v12 = __ldxr(v11);
            while (__stxr(v12 + 1, v11));
          }
          v13 = *(std::__shared_weak_count **)(v9 + 280);
          *(_QWORD *)(v9 + 272) = v8;
          *(_QWORD *)(v9 + 280) = v10;
          if (v13)
          {
            p_shared_owners = (unint64_t *)&v13->__shared_owners_;
            do
              v15 = __ldaxr(p_shared_owners);
            while (__stlxr(v15 - 1, p_shared_owners));
            if (!v15)
            {
              ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
              std::__shared_weak_count::__release_weak(v13);
            }
          }
          break;
        }
      }
      pthread_mutex_unlock((pthread_mutex_t *)self->_mutex.mMutex);
    }
    else
    {
      v32 = &v33;
      v16 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyHashFunc,GEOTileKeyEqualsFunc,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyEqualsFunc,GEOTileKeyHashFunc,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((uint64_t *)&self->_keyToJobMap, (uint64_t)&v33, &v32);
      v18 = *(_QWORD *)a3;
      v17 = *((_QWORD *)a3 + 1);
      if (v17)
      {
        v19 = (unint64_t *)(v17 + 8);
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      v21 = (std::__shared_weak_count *)v16[5];
      v16[4] = v18;
      v16[5] = v17;
      if (v21)
      {
        v22 = (unint64_t *)&v21->__shared_owners_;
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      ++self->_numDownloads;
      pthread_mutex_unlock((pthread_mutex_t *)self->_mutex.mMutex);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __34__AltTileFetcher_fetchDataForJob___block_invoke;
      v31[3] = &unk_1E42F4540;
      v31[4] = self;
      v24 = (void *)MEMORY[0x1A1AF5730](v31);
      objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = atomic_load((unsigned int *)(*(_QWORD *)a3 + 16));
      tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
      v28 = qos_class_self();
      obj = self->_auditToken._obj;
      dispatch_get_global_queue(0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "loadKey:priority:forClient:options:reason:qos:signpostID:auditToken:callbackQ:beginNetwork:callback:", &v33, v26, tileLoaderClientIdentifier, 3, 1, v28, 0, obj, v30, 0, v24);

    }
  }
}

- (void)cancelJob:(void *)a3
{
  void *v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)(*(_QWORD *)a3 + 216);
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex.mMutex);
  objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelKey:forClient:", &v5, self->_tileLoaderClientIdentifier);

  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex.mMutex);
}

- (void)updateJobPriority:(void *)a3
{
  void *v5;
  NSString *tileLoaderClientIdentifier;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader", *(_QWORD *)(*(_QWORD *)a3 + 216), *(_QWORD *)(*(_QWORD *)a3 + 224));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
  v7 = atomic_load((unsigned int *)(*(_QWORD *)a3 + 16));
  objc_msgSend(v5, "reprioritizeKey:forClient:newPriority:", &v8, tileLoaderClientIdentifier, v7);

}

- (void)cancelRequests
{
  _QWORD *i;
  _QWORD *next;
  unint64_t value;
  uint64_t j;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;

  pthread_mutex_lock((pthread_mutex_t *)self->_mutex.mMutex);
  if (self->_numDownloads)
  {
    for (i = self->_keyToJobMap.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
    {
      (*(void (**)(_QWORD))(*(_QWORD *)i[4] + 16))(i[4]);
      --self->_numDownloads;
    }
    -[GEOTileLoader cancelAllForClient:](self->_geoTileLoader, "cancelAllForClient:", self->_tileLoaderClientIdentifier);
    if (self->_keyToJobMap.__table_.__p2_.__value_)
    {
      next = self->_keyToJobMap.__table_.__p1_.__value_.__next_;
      while (next)
      {
        v7 = next;
        next = (_QWORD *)*next;
        v8 = (std::__shared_weak_count *)v7[5];
        if (v8)
        {
          p_shared_owners = (unint64_t *)&v8->__shared_owners_;
          do
            v10 = __ldaxr(p_shared_owners);
          while (__stlxr(v10 - 1, p_shared_owners));
          if (!v10)
          {
            ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
            std::__shared_weak_count::__release_weak(v8);
          }
        }
        operator delete(v7);
      }
      self->_keyToJobMap.__table_.__p1_.__value_.__next_ = 0;
      value = self->_keyToJobMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        for (j = 0; j != value; ++j)
          self->_keyToJobMap.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
      }
      self->_keyToJobMap.__table_.__p2_.__value_ = 0;
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex.mMutex);
}

- (uint64_t)reportCorruptTile:(uint64_t)a1
{
  return objc_msgSend(*(id *)(a1 + 8), "reportCorruptTile:");
}

- (void)purgeExpired:(double)a3
{
  GEOTileLoader *geoTileLoader;
  _QWORD v4[5];

  geoTileLoader = self->_geoTileLoader;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__AltTileFetcher_purgeExpired___block_invoke;
  v4[3] = &__block_descriptor_40_e723_B24__0r___GEOTileKey_b7b1_____GEOStandardTileKey_b40b6b26b26b14b4b4___GEOGloriaQuadIDTileKey_b6b64b14b4______b10b10b12_I____GEORegionalResourceKey_b32b8b6b8b8b1b57___GEOSputnikMetadataKey_b32b24b14b8b42___GEOFlyoverKey_b6b26b26b8b24b14b8b8___GEOTransitLineSelectionKey_b6b25b25b64___GEOPolygonSelectionKey_b6b25b25b64___GEORoadSelectionKey_b6b25b25b64___GEOContourLinesKey_b6b26b26b4b8b50___GEOTileOverlayKey_b6b26b26b8b32b16b6___GEOIdentifiedResourceKey_QCCb1b39___GEOMuninMeshKey_b64b32b16b5b3___GEOVisualLocalizationTrackKey_SCb16b6b26b26b22___GEOVisualLocalizationMetadataKey_b6b9b25b6b26b26b22___GEOVisualLocalizationDataKey_QCb5b21b21b1___GEOS2TileKey_b6b26b26b3b14b4b4b37___GEOLiveTileKey_b6b26b26b14b4b4b4b36___8d16l;
  *(double *)&v4[4] = a3;
  -[GEOTileLoader expireTilesWithPredicate:](geoTileLoader, "expireTilesWithPredicate:", v4);
}

- (void).cxx_destruct
{
  void *mMutex;
  _QWORD *next;
  void **value;
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  objc_storeStrong((id *)&self->_tileLoaderClientIdentifier, 0);
  pthread_mutex_destroy((pthread_mutex_t *)self->_mutex.mMutex);
  mMutex = self->_mutex.mMutex;
  if (mMutex)
    MEMORY[0x1A1AF4E00](mMutex, 0x1000C40FA0F61DDLL);
  self->_mutex.mMutex = 0;
  next = self->_keyToJobMap.__table_.__p1_.__value_.__next_;
  while (next)
  {
    v6 = next;
    next = (_QWORD *)*next;
    v7 = (std::__shared_weak_count *)v6[5];
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
    operator delete(v6);
  }
  value = self->_keyToJobMap.__table_.__bucket_list_.__ptr_.__value_;
  self->_keyToJobMap.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  self->_auditToken._vptr$_retain_ptr = (void **)&off_1E42B5090;

  self->_vectorTileDecoder._vptr$_retain_ptr = (void **)&off_1E42B4EB0;
  objc_storeStrong((id *)&self->_geoTileLoader, 0);
}

- (id).cxx_construct
{
  pthread_mutex_t *v3;
  pthread_mutexattr_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  self->_vectorTileDecoder._vptr$_retain_ptr = (void **)&off_1E42B4EB0;
  self->_vectorTileDecoder._obj = 0;
  self->_auditToken._vptr$_retain_ptr = (void **)&off_1E42B5090;
  self->_auditToken._obj = 0;
  self->_keyToJobMap.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_keyToJobMap.__table_.__p1_.__value_.__next_ = 0u;
  self->_keyToJobMap.__table_.__p3_.__value_ = 1.0;
  self->_mutex.mMutex = 0;
  pthread_mutexattr_init(&v5);
  pthread_mutexattr_settype(&v5, 2);
  v3 = (pthread_mutex_t *)operator new();
  pthread_mutex_init(v3, &v5);
  pthread_mutexattr_destroy(&v5);
  self->_mutex.mMutex = v3;
  return self;
}

BOOL __31__AltTileFetcher_purgeExpired___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  return (*(_BYTE *)a2 & 0x7F) == 0x14
      && (((unint64_t)*(unsigned __int16 *)(a2 + 13) << 32) & 0xFFFC00000000) == 0x3000000000
      && *(double *)(a1 + 32) < a3;
}

void __34__AltTileFetcher_fetchDataForJob___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  std::__shared_weak_count *v20;
  altitude::GeoServicesLoadJob *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  _QWORD *v24;
  int8x8_t v25;
  unint64_t v26;
  uint8x8_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  altitude::GeoServicesLoadJob *v40;
  int v41;
  altitude::GeoServicesLoadJob *v42;
  int v43;
  std::__shared_weak_count *v44;
  void *v45;
  int v46;
  unint64_t *v47;
  unint64_t v48;
  altitude::GeoServicesLoadJob *v49;
  std::__shared_weak_count *v50;
  id v51;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "decodedRepresentation");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v11;
  }
  else
  {
    v51 = v11;
    objc_msgSend(v10, "readDataWithError:", &v51);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v51;

    LOBYTE(v49) = 1;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "canDecodeTile:quickly:", a2, &v49))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "decodeTile:forKey:", v15, a2);
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = v16;
    }
    else if (!v13)
    {
      v13 = v15;
    }

  }
  v49 = 0;
  v50 = 0;
  v17 = *(_QWORD *)(a1 + 32);
  pthread_mutex_lock(*(pthread_mutex_t **)(v17 + 104));
  v18 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyHashFunc,GEOTileKeyEqualsFunc,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyEqualsFunc,GEOTileKeyHashFunc,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>>>::find<_GEOTileKey>((_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v19 = v18;
  if (v18)
  {
    v21 = (altitude::GeoServicesLoadJob *)v18[4];
    v20 = (std::__shared_weak_count *)v18[5];
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v23 = __ldxr(p_shared_owners);
      while (__stxr(v23 + 1, p_shared_owners));
    }
    v49 = v21;
    v50 = v20;
    v24 = *(_QWORD **)(a1 + 32);
    v25 = (int8x8_t)v24[9];
    v26 = v18[1];
    v27 = (uint8x8_t)vcnt_s8(v25);
    v27.i16[0] = vaddlv_u8(v27);
    if (v27.u32[0] > 1uLL)
    {
      if (v26 >= *(_QWORD *)&v25)
        v26 %= *(_QWORD *)&v25;
    }
    else
    {
      v26 &= *(_QWORD *)&v25 - 1;
    }
    v28 = v24[8];
    v29 = *(_QWORD **)(v28 + 8 * v26);
    do
    {
      v30 = v29;
      v29 = (_QWORD *)*v29;
    }
    while (v29 != v18);
    if (v30 == v24 + 10)
      goto LABEL_29;
    v31 = v30[1];
    if (v27.u32[0] > 1uLL)
    {
      if (v31 >= *(_QWORD *)&v25)
        v31 %= *(_QWORD *)&v25;
    }
    else
    {
      v31 &= *(_QWORD *)&v25 - 1;
    }
    if (v31 != v26)
    {
LABEL_29:
      if (!*v18)
        goto LABEL_30;
      v32 = *(_QWORD *)(*v18 + 8);
      if (v27.u32[0] > 1uLL)
      {
        if (v32 >= *(_QWORD *)&v25)
          v32 %= *(_QWORD *)&v25;
      }
      else
      {
        v32 &= *(_QWORD *)&v25 - 1;
      }
      if (v32 != v26)
LABEL_30:
        *(_QWORD *)(v28 + 8 * v26) = 0;
    }
    v33 = *v18;
    if (*v18)
    {
      v34 = *(_QWORD *)(v33 + 8);
      if (v27.u32[0] > 1uLL)
      {
        if (v34 >= *(_QWORD *)&v25)
          v34 %= *(_QWORD *)&v25;
      }
      else
      {
        v34 &= *(_QWORD *)&v25 - 1;
      }
      if (v34 != v26)
      {
        *(_QWORD *)(v24[8] + 8 * v34) = v30;
        v33 = *v18;
      }
    }
    *v30 = v33;
    *v18 = 0;
    --v24[11];
    v35 = (std::__shared_weak_count *)v18[5];
    if (v35)
    {
      v36 = (unint64_t *)&v35->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    operator delete(v19);
    --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 112);
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(v17 + 104));
  if (v14)
  {
    if (objc_msgSend(v14, "code") != -2)
      goto LABEL_55;
    objc_msgSend(v14, "domain");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v38, "isEqualToString:", v39) & 1) == 0)
    {

      goto LABEL_55;
    }
    v40 = v49;
    if (v49)
    {
      pthread_mutex_lock(*((pthread_mutex_t **)v49 + 19));
      v41 = *((_DWORD *)v40 + 40);
      pthread_mutex_unlock(*((pthread_mutex_t **)v40 + 19));

      if ((v41 & 2) != 0)
      {
LABEL_56:
        pthread_mutex_lock(*((pthread_mutex_t **)v40 + 19));
        v46 = *((_DWORD *)v40 + 40);
        pthread_mutex_unlock(*((pthread_mutex_t **)v40 + 19));
        if ((v46 & 2) == 0)
          (*(void (**)(altitude::GeoServicesLoadJob *))(*(_QWORD *)v40 + 16))(v40);
LABEL_58:
        v44 = v50;
        if (!v50)
          goto LABEL_63;
        goto LABEL_59;
      }
LABEL_55:
      GEOStringFromTileKey();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog((NSString *)CFSTR("Download failed: %@ Error: %@"), v45, v14);

      v40 = v49;
      if (!v49)
        goto LABEL_58;
      goto LABEL_56;
    }

    v44 = v50;
    if (!v50)
      goto LABEL_63;
  }
  else
  {
    if (!v49)
      goto LABEL_58;
    altitude::GeoServicesLoadJob::setData(v49, v13);
    v42 = v49;
    pthread_mutex_lock(*((pthread_mutex_t **)v49 + 19));
    v43 = *((_DWORD *)v42 + 40);
    pthread_mutex_unlock(*((pthread_mutex_t **)v42 + 19));
    if ((v43 & 1) != 0)
      goto LABEL_58;
    karo::Job::step(v42);
    v44 = v50;
    if (!v50)
      goto LABEL_63;
  }
LABEL_59:
  v47 = (unint64_t *)&v44->__shared_owners_;
  do
    v48 = __ldaxr(v47);
  while (__stlxr(v48 - 1, v47));
  if (!v48)
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
LABEL_63:

}

@end
