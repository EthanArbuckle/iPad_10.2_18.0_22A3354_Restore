@implementation VKMapSnapshotCreator

- (void)initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "tileGroupDidChange");

}

- (BOOL)wantsTimerTick
{
  return !self->_didBecomeFullyDrawn;
}

- (void)renderSnapshot:(id)a3
{
  void *v4;
  id completion;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    (*(void (**)(Timer *, _QWORD, double))(*(_QWORD *)self->_expirationTimer.__ptr_.__value_ + 24))(self->_expirationTimer.__ptr_.__value_, 0, 70.0);
    v4 = (void *)objc_msgSend(v7, "copy");
    completion = self->_completion;
    self->_completion = v4;

    -[VKMapSnapshotCreator activeCanvas](self, "activeCanvas");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loadScene");

    md::MapEngine::updateRunLoopStatus((md::MapEngine *)self->_mapEngine.__ptr_.__value_);
  }

}

- (void)didUpdateSceneStatus:(unsigned __int8)a3
{
  if ((a3 - 2) <= 2)
  {
    self->_didBecomeFullyDrawn = 1;
    self->_hasFailedTiles = (a3 - 3) < 2;
  }
}

- (int)mapType
{
  return self->_mapType;
}

- (void)setShowsGlobe:(BOOL)a3
{
  uint64_t v3;
  char v4;

  v3 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  v4 = 22;
  md::MapEngineSettings::set(v3, &v4, (_QWORD *)(-[VKMapSnapshotCreator _globeIsEnabled](self, "_globeIsEnabled") & a3));
}

- (BOOL)_globeIsEnabled
{
  char v2;
  void *v3;

  if (!MapsFeature_IsEnabled_ShelbyvilleGlobe())
    return 0;
  if ((GEOConfigGetBOOL() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "supportsAdvancedMap");

  return v2;
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6
{
  double var1;
  double var0;
  id v11;

  var1 = a3.var1;
  var0 = a3.var0;
  -[VKMapSnapshotCreator activeCanvas](self, "activeCanvas");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCenterCoordinate:altitude:yaw:pitch:", var0, var1, a4, a5, a6);

}

- (void)setShowsBuildings:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  MapEngine *value;
  uint64_t v9;
  int v10;
  VKMapSnapshotCreator *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    v10 = 134218242;
    v11 = self;
    v12 = 2080;
    v13 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsBuildings: %s", (uint8_t *)&v10, 0x16u);
  }
  v7 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v10) = 1;
  md::MapEngineSettings::set(v7, &v10, (_QWORD *)v3);
  if (v3)
  {
    value = self->_mapEngine.__ptr_.__value_;
    if (*((_BYTE *)value + 1240))
    {
      v9 = *((_QWORD *)value + 141);
      LOBYTE(v10) = 24;
      md::MapEngineSettings::set(v9, &v10, (_QWORD *)1);
    }
  }
}

void __44__VKMapSnapshotCreator_willBecomeFullyDrawn__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  _BYTE v9[24];
  _BYTE *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD **)(a1 + 32);
  if (!v3[9])
    goto LABEL_9;
  objc_msgSend(v3, "activeCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v10 = 0;
  objc_msgSend(v4, "renderSceneWithEngine:completion:", v5, v9);
  v6 = v10;
  if (v10 == v9)
  {
    v7 = 4;
    v6 = v9;
  }
  else
  {
    if (!v10)
      goto LABEL_7;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_7:

  v8 = *(_QWORD **)(a1 + 32);
  if (v8[8])
    objc_msgSend(v8, "renderNextSnapshot");
LABEL_9:

}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  float right;
  float bottom;
  float left;
  float top;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  MapEngine *value;
  float *v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  unint64_t v18;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  self->_edgeInsets = a3;
  -[VKMapSnapshotCreator activeCanvas](self, "activeCanvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = top;
  *(float *)&v10 = left;
  *(float *)&v11 = bottom;
  *(float *)&v12 = right;
  objc_msgSend(v8, "setEdgeInsets:", v9, v10, v11, v12);

  value = self->_mapEngine.__ptr_.__value_;
  v14 = (float *)*((_QWORD *)value + 133);
  v15 = (std::__shared_weak_count *)*((_QWORD *)value + 134);
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
    v14[108] = top;
    v14[109] = left;
    v14[110] = bottom;
    v14[111] = right;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  else
  {
    v14[108] = top;
    v14[109] = left;
    v14[110] = bottom;
    v14[111] = right;
  }
}

- (void)setMapType:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  VKGlobeImageCanvas *v7;
  VKGlobeImageCanvas *globeCanvas;
  void *v9;
  void *v10;
  int8x8_t *v11;
  int8x8_t v12;
  uint8x8_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  md::StyleLogic *v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  void *v25;
  int v26;
  VKMapSnapshotCreator *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v3 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v26 = 134218240;
    v27 = self;
    v28 = 2048;
    v29 = v3;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator %p setMapType: %ld", (uint8_t *)&v26, 0x16u);
  }
  v6 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v26) = 20;
  md::MapEngineSettings::set(v6, &v26, (_QWORD *)v3);
  if ((v3 - 3) <= 1 && !self->_globeCanvas && !*((_BYTE *)self->_mapEngine.__ptr_.__value_ + 1241))
  {
    v7 = -[VKGlobeImageCanvas initWithMapEngine:]([VKGlobeImageCanvas alloc], "initWithMapEngine:", self->_mapEngine.__ptr_.__value_);
    globeCanvas = self->_globeCanvas;
    self->_globeCanvas = v7;

  }
  -[VKMapSnapshotCreator activeCanvas](self, "activeCanvas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_mapType = v3;
  -[VKMapSnapshotCreator activeCanvas](self, "activeCanvas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != v9)
    -[VKMapSnapshotCreator _transferSettingsFrom:to:](self, "_transferSettingsFrom:to:", v9, v10);
  v11 = (int8x8_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 140);
  v12 = v11[2];
  if (!*(_QWORD *)&v12)
    goto LABEL_31;
  v13 = (uint8x8_t)vcnt_s8(v12);
  v13.i16[0] = vaddlv_u8(v13);
  if (v13.u32[0] > 1uLL)
  {
    v14 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v12 <= 0x2FED70A4459DFCA1uLL)
      v14 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v12;
  }
  else
  {
    v14 = (*(_QWORD *)&v12 - 1) & 0x2FED70A4459DFCA1;
  }
  v15 = *(_QWORD **)(*(_QWORD *)&v11[1] + 8 * v14);
  if (!v15 || (v16 = (_QWORD *)*v15) == 0)
  {
LABEL_31:
    v20 = 0;
    goto LABEL_32;
  }
  if (v13.u32[0] < 2uLL)
  {
    v17 = *(_QWORD *)&v12 - 1;
    while (1)
    {
      v19 = v16[1];
      if (v19 == 0x2FED70A4459DFCA1)
      {
        if (v16[2] == 0x2FED70A4459DFCA1)
          goto LABEL_43;
      }
      else if ((v19 & v17) != v14)
      {
        goto LABEL_31;
      }
      v16 = (_QWORD *)*v16;
      if (!v16)
        goto LABEL_31;
    }
  }
  while (1)
  {
    v18 = v16[1];
    if (v18 == 0x2FED70A4459DFCA1)
      break;
    if (v18 >= *(_QWORD *)&v12)
      v18 %= *(_QWORD *)&v12;
    if (v18 != v14)
      goto LABEL_31;
LABEL_21:
    v16 = (_QWORD *)*v16;
    if (!v16)
      goto LABEL_31;
  }
  if (v16[2] != 0x2FED70A4459DFCA1)
    goto LABEL_21;
LABEL_43:
  v20 = (md::StyleLogic *)v16[5];
LABEL_32:
  md::StyleLogic::updateConfiguration(v20, self->_mapType);
  v21 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 140);
  v22 = *(_QWORD *)(v21 + 16);
  if ((v22 & (v22 - 1)) != 0)
  {
    v24 = 0x20A1ED17D78F322BLL;
    if (v22 <= 0x20A1ED17D78F322BLL)
      v24 = 0x20A1ED17D78F322BLL % v22;
    v23 = *(_QWORD **)(*(_QWORD *)(v21 + 8) + 8 * v24);
    do
    {
      do
        v23 = (_QWORD *)*v23;
      while (v23[1] != 0x20A1ED17D78F322BLL);
    }
    while (v23[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    v23 = *(_QWORD **)(*(_QWORD *)(v21 + 8) + 8 * ((v22 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        v23 = (_QWORD *)*v23;
      while (v23[1] != 0x20A1ED17D78F322BLL);
    }
    while (v23[2] != 0x20A1ED17D78F322BLL);
  }
  *(_DWORD *)(v23[5] + 220) = self->_mapType;
  -[VKMapSnapshotCreator activeCanvas](self, "activeCanvas");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setMapType:", v3);

}

- (void)didPresent
{
  id v2;

  -[VKMapSnapshotCreator activeCanvas](self, "activeCanvas");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didLayout");

}

- (void)willLayoutWithTimestamp:(double)a3 withContext:(void *)a4
{
  id v6;

  -[VKMapSnapshotCreator activeCanvas](self, "activeCanvas");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithTimestamp:withContext:", a4, a3);

}

- (id)activeCanvas
{
  uint64_t v2;

  if (*((_BYTE *)self->_mapEngine.__ptr_.__value_ + 1241))
    return self->_mapCanvas;
  v2 = 8;
  if ((self->_mapType - 3) < 2)
    v2 = 16;
  return *(id *)((char *)&self->super.isa + v2);
}

- (void)setTerrainMode:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  char v13;

  if (-[VKMapSnapshotCreator _daVinciDataAvailable](self, "_daVinciDataAvailable")
    && -[VKMapSnapshotCreator _elevatedGroundIsEnabled](self, "_elevatedGroundIsEnabled"))
  {
    v5 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
    v13 = 29;
    md::MapEngineSettings::set(v5, &v13, (_QWORD *)a3);
    v6 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
    v12 = 21;
    v7 = (unint64_t)(a3 - 1) < 3;
    v8 = &v12;
  }
  else
  {
    v9 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
    v11 = 29;
    md::MapEngineSettings::set(v9, &v11, 0);
    v6 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
    v10 = 21;
    v8 = &v10;
    v7 = 0;
  }
  md::MapEngineSettings::set(v6, v8, (_QWORD *)v7);
}

- (BOOL)_elevatedGroundIsEnabled
{
  char v2;
  void *v3;

  if (!MapsFeature_IsEnabled_ShelbyvilleTerrain())
    return 0;
  if ((GEOConfigGetBOOL() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "supportsAdvancedMap");

  return v2;
}

- (BOOL)_daVinciDataAvailable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 112) + 24) + 56);
  v3 = *(_QWORD *)(v2 + 32);
  v4 = *(_QWORD *)(v2 + 40);
  if (v3 != v4)
  {
    while (*(_WORD *)v3 != 29)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  if (v3 == v4)
    return 0;
  (*(void (**)(uint64_t *__return_ptr))(**(_QWORD **)(v3 + 8) + 64))(&v6);
  return (_BYTE)v6 != 0;
}

- (void)setShowsHiking:(BOOL)a3
{
  -[VKMapSnapshotCreator setShowsHiking:withTopographicFeatures:](self, "setShowsHiking:withTopographicFeatures:", a3, 1);
}

- (void)setShowsTintBands:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  VKMapSnapshotCreator *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    v8 = 134218242;
    v9 = self;
    v10 = 2080;
    v11 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsTintBands: %s", (uint8_t *)&v8, 0x16u);
  }
  v7 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v8) = 11;
  md::MapEngineSettings::set(v7, &v8, (_QWORD *)v3);
}

- (VKMapSnapshotCreator)initWithSize:(CGSize)a3 scale:(double)a4 homeQueue:(id)a5 signpostId:(unint64_t)a6 mapType:(int)a7 mapDisplayStyles:(id *)a8 mapDisplayStylesCount:(unint64_t)a9 auditToken:(id)a10
{
  uint64_t v11;

  LOBYTE(v11) = 1;
  return -[VKMapSnapshotCreator initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:](self, "initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:", a5, a6, *(_QWORD *)&a7, a8, a9, a10, a3.width, a3.height, a4, v11, 0);
}

- (VKMapSnapshotCreator)initWithSize:(CGSize)a3 scale:(double)a4 homeQueue:(id)a5 signpostId:(unint64_t)a6 mapType:(int)a7 mapDisplayStyles:(id *)a8 mapDisplayStylesCount:(unint64_t)a9 auditToken:(id)a10 useMultisampling:(BOOL)a11 withError:(id *)a12
{
  double height;
  double width;
  NSObject *v21;
  id v22;
  void *v23;
  VKManifestTileGroupObserverProxy *v24;
  VKManifestTileGroupObserverProxy *manifestTileGroupObserverProxy;
  NSObject *v26;
  VKManifestTileGroupObserverProxy *v27;
  VKManifestTileGroupObserverProxy *v28;
  uint64_t (***v29)();
  uint64_t v30;
  VKManifestTileGroupObserverProxy *v31;
  uint64_t (***v32)();
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  VKMapSnapshotCreator *v38;
  VKMapSnapshotCreator *v40;
  std::chrono::steady_clock::time_point *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  os_signpost_id_t rep;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v49;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v50;
  md::AnimationManager *v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *p_shared_owners;
  uint64_t v55;
  float v56;
  float v57;
  float v58;
  id v59;
  unint64_t v60;
  uint64_t value;
  VKMapImageCanvas *v62;
  VKMapImageCanvas *mapCanvas;
  VKMapImageCanvas *v64;
  void *v65;
  void *v66;
  void *v67;
  VKNotificationObserver *v68;
  MapEngine *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t *v72;
  unint64_t v73;
  uint64_t v74;
  VKNotificationObserver *notificationObserver;
  MapEngine *v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t *v79;
  unint64_t v80;
  $6EFE6C6748B912A6EAC8A8E593ED1344 *v81;
  unsigned __int8 *p_var0;
  uint64_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unsigned int v89;
  uint64_t v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  VKMapSnapshotCreator *v95;
  NSObject *v96;
  unint64_t v97;
  objc_super v98;
  id from;
  id to;
  id location;
  id v102;
  __int128 v103;
  uint8_t buf[24];
  double v105;
  __int16 v106;
  double v107;
  uint64_t (**v108)();
  id v109;
  uint64_t (***v110)();
  uint64_t (**v111)();
  id v112;
  uint64_t (***v113)();
  uint64_t v114;

  height = a3.height;
  width = a3.width;
  v114 = *MEMORY[0x1E0C80C00];
  v21 = a5;
  v22 = a10;
  if (a12)
    *a12 = 0;
  +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[VKManifestTileGroupObserverProxy initWithQueue:]([VKManifestTileGroupObserverProxy alloc], "initWithQueue:", v21);
  manifestTileGroupObserverProxy = self->_manifestTileGroupObserverProxy;
  self->_manifestTileGroupObserverProxy = v24;

  v97 = a9;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v26 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = self->_manifestTileGroupObserverProxy;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v27;
    _os_log_impl(&dword_19F029000, v26, OS_LOG_TYPE_INFO, "[VKSnapshotCreator:%p] Manifest observer - %p", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  v28 = self->_manifestTileGroupObserverProxy;
  objc_copyWeak(&to, &location);
  v113 = 0;
  v111 = &off_1E42C7358;
  objc_moveWeak(&v112, &to);
  v113 = &v111;
  objc_destroyWeak(&to);
  -[VKManifestTileGroupObserverProxy setDidChangeActiveTileGroup:](v28, "setDidChangeActiveTileGroup:", &v111);
  v29 = v113;
  if (v113 == &v111)
  {
    v30 = 4;
    v29 = &v111;
  }
  else
  {
    if (!v113)
      goto LABEL_12;
    v30 = 5;
  }
  (*v29)[v30]();
LABEL_12:
  v31 = self->_manifestTileGroupObserverProxy;
  objc_copyWeak(&from, &location);
  v110 = 0;
  v108 = &off_1E42C73A0;
  objc_moveWeak(&v109, &from);
  v110 = &v108;
  objc_destroyWeak(&from);
  -[VKManifestTileGroupObserverProxy setWillChangeActiveTileGroup:](v31, "setWillChangeActiveTileGroup:", &v108);
  v32 = v110;
  if (v110 == &v108)
  {
    v33 = 4;
    v32 = &v108;
    goto LABEL_16;
  }
  if (v110)
  {
    v33 = 5;
LABEL_16:
    (*v32)[v33]();
  }
  if (!objc_msgSend(v23, "device")
    || (v34 = *(_QWORD *)(objc_msgSend(v23, "device") + 8)) == 0
    || ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v34 + 32))(v34) & 1) == 0)
  {
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
    v37 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v37, OS_LOG_TYPE_ERROR, "Not able to take a snapshot without valid metal device", buf, 2u);
    }
    if (a12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.maps.snapshot"), -3, 0);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
LABEL_34:
    v38 = 0;
    goto LABEL_35;
  }
  if (width * a4 >= 1.0
    && v21
    && height * a4 >= 1.0
    && a4 >= 1.0
    && *(_DWORD *)(*(_QWORD *)(objc_msgSend(v23, "device", 1.0, height * a4) + 8) + 24) >= (int)(fmax(width, height) * a4))
  {
    v98.receiver = self;
    v98.super_class = (Class)VKMapSnapshotCreator;
    v40 = -[VKMapSnapshotCreator init](&v98, sel_init);
    v41 = (std::chrono::steady_clock::time_point *)v40;
    if (!v40)
    {
LABEL_81:
      self = v41;
      v38 = self;
      goto LABEL_35;
    }
    v40->_signpostId = a6;
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
    v42 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = height;
      *(_WORD *)&buf[22] = 2048;
      v105 = width;
      v106 = 2048;
      v107 = a4;
      _os_log_impl(&dword_19F029000, v42, OS_LOG_TYPE_INFO, "Creating VKMapSnapshotCreator: %p with height:%f width:%f contenteScale:%f", buf, 0x2Au);
      if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
    }
    v43 = (id)GEOGetVectorKitVKMapSnapshotLog(void)::log;
    v44 = v43;
    rep = v41[14].__d_.__rep_;
    if (rep - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_DWORD *)buf = 134218496;
      *(double *)&buf[4] = height;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = width;
      *(_WORD *)&buf[22] = 2048;
      v105 = a4;
      _os_signpost_emit_with_name_impl(&dword_19F029000, v44, OS_SIGNPOST_INTERVAL_BEGIN, rep, "MapSnapshotCreator", "height:%f width:%f contenteScale:%f", buf, 0x20u);
    }

    v41[25].__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    objc_copyWeak(&v102, &location);
    v46 = operator new();
    objc_moveWeak((id *)&v103, &v102);
    v105 = 0.0;
    *(_QWORD *)buf = &off_1E42C73E8;
    objc_moveWeak((id *)&buf[8], (id *)&v103);
    v105 = COERCE_DOUBLE(buf);
    objc_destroyWeak((id *)&v103);
    gdc::Timer::Timer(v46, v21, buf);
    v47 = *(uint8_t **)&v105;
    if (*(uint8_t **)&v105 == buf)
    {
      v48 = 4;
      v47 = buf;
    }
    else
    {
      if (v105 == 0.0)
        goto LABEL_54;
      v48 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v47 + 8 * v48))();
LABEL_54:
    v49 = v41[26].__d_.__rep_;
    v41[26].__d_.__rep_ = v46;
    if (v49)
      (*(void (**)(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep))(*(_QWORD *)v49 + 8))(v49);
    objc_destroyWeak(&v102);
    memset(buf, 0, sizeof(buf));
    v95 = (VKMapSnapshotCreator *)v41;
    geo::linear_map<md::MapEngineSetting,long long,std::equal_to<md::MapEngineSetting>,std::allocator<std::pair<md::MapEngineSetting,long long>>,std::vector<std::pair<md::MapEngineSetting,long long>>>::emplace<md::MapEngineSetting,long long>((unsigned __int8 **)buf, 0x14u, a7);
    v50 = v41[14].__d_.__rep_;
    v96 = v21;
    v94 = v22;
    v51 = (md::AnimationManager *)operator new();
    *((_OWORD *)v51 + 13) = 0u;
    *((_OWORD *)v51 + 14) = 0u;
    *((_OWORD *)v51 + 11) = 0u;
    *((_OWORD *)v51 + 12) = 0u;
    *((_OWORD *)v51 + 9) = 0u;
    *((_OWORD *)v51 + 10) = 0u;
    *((_OWORD *)v51 + 7) = 0u;
    *((_OWORD *)v51 + 8) = 0u;
    *((_OWORD *)v51 + 5) = 0u;
    *((_OWORD *)v51 + 6) = 0u;
    *((_OWORD *)v51 + 3) = 0u;
    *((_OWORD *)v51 + 4) = 0u;
    *((_OWORD *)v51 + 1) = 0u;
    *((_OWORD *)v51 + 2) = 0u;
    *(_OWORD *)v51 = 0u;
    md::AnimationManager::AnimationManager(v51);
    *(_QWORD *)v51 = &off_1E42A10D0;
    v52 = operator new();
    v53 = (std::__shared_weak_count *)operator new(0xA8uLL);
    v53->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v53->__shared_owners_;
    v53->__shared_weak_owners_ = 0;
    v53->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DAD70;
    v55 = md::TaskContext::TaskContext((uint64_t)&v53[1], v96);
    v56 = width;
    v57 = height;
    v58 = a4;
    *(_QWORD *)&v103 = v55;
    *((_QWORD *)&v103 + 1) = v53;
    v102 = v51;
    md::MapEngine::MapEngine(v52, a11, 0, &v103, 1, &v102, buf, v50, v56, v57, v58, v94);
    v59 = v102;
    v102 = 0;
    v41 = (std::chrono::steady_clock::time_point *)v95;
    if (v59)
      (*(void (**)(id))(*(_QWORD *)v59 + 8))(v59);
    do
      v60 = __ldaxr(p_shared_owners);
    while (__stlxr(v60 - 1, p_shared_owners));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }

    value = (uint64_t)v95->_mapEngine.__ptr_.__value_;
    v95->_mapEngine.__ptr_.__value_ = (MapEngine *)v52;
    if (value)
    {
      md::MapEngineDeleter::operator()(value);
      v52 = (uint64_t)v95->_mapEngine.__ptr_.__value_;
    }
    objc_storeWeak((id *)(v52 + 848), v95);
    v62 = -[VKMapImageCanvas initWithMapEngine:]([VKMapImageCanvas alloc], "initWithMapEngine:", v95->_mapEngine.__ptr_.__value_);
    mapCanvas = v95->_mapCanvas;
    v95->_mapCanvas = v62;

    v64 = v95->_mapCanvas;
    if (v64)
    {
      objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "openServerConnection");

      objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      GEOTileLoaderClientIdentifier();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "openForClient:", v67);

      v68 = [VKNotificationObserver alloc];
      v69 = v95->_mapEngine.__ptr_.__value_;
      v70 = *((_QWORD *)v69 + 1);
      v71 = *((_QWORD *)v69 + 2);
      *(_QWORD *)&v103 = v70;
      *((_QWORD *)&v103 + 1) = v71;
      if (v71)
      {
        v72 = (unint64_t *)(v71 + 8);
        do
          v73 = __ldxr(v72);
        while (__stxr(v73 + 1, v72));
      }
      v74 = -[VKNotificationObserver initWithTarget:taskContext:](v68, "initWithTarget:taskContext:", v95);
      notificationObserver = v95->_notificationObserver;
      v95->_notificationObserver = (VKNotificationObserver *)v74;

      std::shared_ptr<esl::QuartzContext>::~shared_ptr[abi:ne180100]((uint64_t)&v103);
      v76 = v95->_mapEngine.__ptr_.__value_;
      v78 = *((_QWORD *)v76 + 1);
      v77 = *((_QWORD *)v76 + 2);
      *(_QWORD *)&v103 = v78;
      *((_QWORD *)&v103 + 1) = v77;
      if (v77)
      {
        v79 = (unint64_t *)(v77 + 8);
        do
          v80 = __ldxr(v79);
        while (__stxr(v80 + 1, v79));
      }
      std::shared_ptr<md::LabelFeature>::operator=[abi:nn180100]((uint64_t)&v95->_taskContext, &v103);
      std::shared_ptr<esl::QuartzContext>::~shared_ptr[abi:ne180100]((uint64_t)&v103);
      -[VKMapSnapshotCreator setEmphasis:](v95, "setEmphasis:", 1);
      v95->_displayStylesCount = v97;
      v81 = ($6EFE6C6748B912A6EAC8A8E593ED1344 *)malloc_type_malloc(6 * v97, 0x1000040274DC3F3uLL);
      v95->_displayStyles = v81;
      memcpy(v81, a8, 6 * v97);
      p_var0 = &v95->_displayStyles->var0;
      v83 = *p_var0;
      v84 = p_var0[1];
      v85 = p_var0[2];
      v86 = p_var0[3];
      v87 = p_var0[4];
      v88 = p_var0[5];
      v89 = v85 - 1;
      if (v89 > 8)
        v90 = 0;
      else
        v90 = qword_1A007B738[v89];
      v92 = v83 | (v84 << 8) | v90 | (v86 << 24) | (v87 << 32) | (v88 << 40) | 0x1000000000000;
      v93 = md::LogicManager::logic<md::StyleLogic>(*((int8x8_t **)v95->_mapEngine.__ptr_.__value_ + 140));
      md::StyleLogic::setDisplayStyle(v93, v92);
      v95->_nextDisplayStyleIndex = 1;
    }
    else
    {
      GEOGetVectorKitVKMapSnapshotLog();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v103) = 0;
        _os_log_impl(&dword_19F029000, v91, OS_LOG_TYPE_ERROR, "Failed to get an map canvas", (uint8_t *)&v103, 2u);
      }

      if (a12)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.maps.snapshot"), -4, 0);
        *a12 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    if (*(_QWORD *)buf)
      operator delete(*(void **)buf);
    if (!v64)
    {
      v38 = 0;
      self = v95;
      goto LABEL_35;
    }
    goto LABEL_81;
  }
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v35 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218496;
    *(double *)&buf[4] = height;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = width;
    *(_WORD *)&buf[22] = 2048;
    v105 = a4;
    _os_log_impl(&dword_19F029000, v35, OS_LOG_TYPE_ERROR, "Image size or content scale too small to produce an image: height:%f, width:%f, contentScale:%f", buf, 0x20u);
  }
  if (!a12)
    goto LABEL_34;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.maps.snapshot"), -2, 0);
  v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
  v38 = 0;
  *a12 = v36;
LABEL_35:
  objc_destroyWeak(&location);

  return v38;
}

- (void)setEmphasis:(unsigned __int8)a3
{
  int8x8_t *v3;
  int8x8_t v4;
  uint8x8_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v3 = (int8x8_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 140);
  v4 = v3[2];
  if (!*(_QWORD *)&v4)
    goto LABEL_21;
  v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v4 <= 0x2FED70A4459DFCA1uLL)
      v6 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v4;
  }
  else
  {
    v6 = (*(_QWORD *)&v4 - 1) & 0x2FED70A4459DFCA1;
  }
  v7 = *(_QWORD **)(*(_QWORD *)&v3[1] + 8 * v6);
  if (!v7 || (v8 = (_QWORD *)*v7) == 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  if (v5.u32[0] < 2uLL)
  {
    v9 = *(_QWORD *)&v4 - 1;
    while (1)
    {
      v11 = v8[1];
      if (v11 == 0x2FED70A4459DFCA1)
      {
        if (v8[2] == 0x2FED70A4459DFCA1)
          goto LABEL_26;
      }
      else if ((v11 & v9) != v6)
      {
        goto LABEL_21;
      }
      v8 = (_QWORD *)*v8;
      if (!v8)
        goto LABEL_21;
    }
  }
  while (1)
  {
    v10 = v8[1];
    if (v10 == 0x2FED70A4459DFCA1)
      break;
    if (v10 >= *(_QWORD *)&v4)
      v10 %= *(_QWORD *)&v4;
    if (v10 != v6)
      goto LABEL_21;
LABEL_11:
    v8 = (_QWORD *)*v8;
    if (!v8)
      goto LABEL_21;
  }
  if (v8[2] != 0x2FED70A4459DFCA1)
    goto LABEL_11;
LABEL_26:
  v12 = v8[5];
LABEL_22:
  if (a3 == 2)
    v13 = 2;
  else
    v13 = a3 == 1;
  md::StyleLogic::setEmphasis(v12, v13, 0.0);
}

- (VKRouteOverlay)routeOverlay
{
  return self->_routeOverlay;
}

- (void)setShowsRoadShields:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t *v7;
  uint64_t v8;
  md::LabelManager *v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsRoadShields: %s", v12, 0x16u);
  }
  v7 = -[VKMapSnapshotCreator _labelSettings](self, "_labelSettings");
  v8 = *v7;
  *(_BYTE *)(*(_QWORD *)(*v7 + 40) + 20) = v3;
  v9 = *(md::LabelManager **)(v8 + 24);
  *(_QWORD *)v12 = &off_1E42C9CF8;
  *(_QWORD *)&v12[8] = v9;
  *(_QWORD *)&v12[16] = v3;
  v13 = v12;
  md::LabelManager::queueCommand(v9, 54, 1, v12);
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
  }
  else
  {
    if (!v13)
      return;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
}

- (void)setShowsVenues:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  md::LabelManager *v10;
  _QWORD *v11;
  uint64_t v12;
  _BYTE v13[24];
  _BYTE *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    *(_DWORD *)v13 = 134218242;
    *(_QWORD *)&v13[4] = self;
    *(_WORD *)&v13[12] = 2080;
    *(_QWORD *)&v13[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsVenues: %s", v13, 0x16u);
  }
  v7 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  v13[0] = 0;
  md::MapEngineSettings::set(v7, v13, (_QWORD *)v3);
  v8 = -[VKMapSnapshotCreator _labelSettings](self, "_labelSettings");
  v9 = *v8;
  *(_BYTE *)(*(_QWORD *)(*v8 + 40) + 16) = v3;
  v10 = *(md::LabelManager **)(v9 + 24);
  *(_QWORD *)v13 = &off_1E42C9638;
  *(_QWORD *)&v13[8] = v10;
  *(_QWORD *)&v13[16] = v3;
  v14 = v13;
  md::LabelManager::queueCommand(v10, 49, 1, v13);
  v11 = v14;
  if (v14 == v13)
  {
    v12 = 4;
    v11 = v13;
  }
  else
  {
    if (!v14)
      return;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
}

- (void)setLabelScaleFactor:(int64_t)a3
{
  NSObject *v5;
  uint64_t *v6;
  unsigned __int8 v7;
  uint64_t v8;
  md::LabelManager *v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v12 = 134218240;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2048;
    *(_QWORD *)&v12[14] = a3;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setLabelScaleFactor: %ld", v12, 0x16u);
  }
  v6 = -[VKMapSnapshotCreator _labelSettings](self, "_labelSettings");
  if ((unint64_t)a3 >= 6)
    v7 = 1;
  else
    v7 = a3;
  v8 = *v6;
  *(_BYTE *)(*(_QWORD *)(*v6 + 40) + 48) = v7;
  v9 = *(md::LabelManager **)(v8 + 24);
  *(_QWORD *)v12 = &off_1E42C9C68;
  *(_QWORD *)&v12[8] = v9;
  *(_QWORD *)&v12[16] = v7;
  v13 = v12;
  md::LabelManager::queueCommand(v9, 4, 1, v12);
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
  }
  else
  {
    if (!v13)
      return;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
}

- (void)setShowsRoadLabels:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t *v7;
  uint64_t v8;
  md::LabelManager *v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsRoadLabels: %s", v12, 0x16u);
  }
  v7 = -[VKMapSnapshotCreator _labelSettings](self, "_labelSettings");
  v8 = *v7;
  *(_BYTE *)(*(_QWORD *)(*v7 + 40) + 19) = v3;
  v9 = *(md::LabelManager **)(v8 + 24);
  *(_QWORD *)v12 = &off_1E42C9AB8;
  *(_QWORD *)&v12[8] = v9;
  *(_QWORD *)&v12[16] = v3;
  v13 = v12;
  md::LabelManager::queueCommand(v9, 53, 1, v12);
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
  }
  else
  {
    if (!v13)
      return;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
}

- (void)addCustomFeatureDataSource:(id)a3
{
  id v4;

  v4 = a3;
  md::LabelSettings::addCustomFeatureDataSource((uint64_t)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings"), v4);

}

- (void)setLocalizeLabels:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t *v4;
  uint64_t v5;
  md::LabelManager *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[3];
  _QWORD *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v4 = -[VKMapSnapshotCreator _labelSettings](self, "_labelSettings");
  v5 = *v4;
  *(_BYTE *)(*(_QWORD *)(*v4 + 40) + 24) = v3;
  v6 = *(md::LabelManager **)(v5 + 24);
  v9[0] = &off_1E42C9950;
  v9[1] = v6;
  v9[2] = v3;
  v10 = v9;
  md::LabelManager::queueCommand(v6, 5, 1, v9);
  v7 = v10;
  if (v10 == v9)
  {
    v8 = 4;
    v7 = v9;
  }
  else
  {
    if (!v10)
      return;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
}

- (void)setShowsPointLabels:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t *v7;
  uint64_t v8;
  md::LabelManager *v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsPointLabels: %s", v12, 0x16u);
  }
  v7 = -[VKMapSnapshotCreator _labelSettings](self, "_labelSettings");
  v8 = *v7;
  *(_BYTE *)(*(_QWORD *)(*v7 + 40) + 18) = v3;
  v9 = *(md::LabelManager **)(v8 + 24);
  *(_QWORD *)v12 = &off_1E42C9CB0;
  *(_QWORD *)&v12[8] = v9;
  *(_QWORD *)&v12[16] = v3;
  v13 = v12;
  md::LabelManager::queueCommand(v9, 52, 1, v12);
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
  }
  else
  {
    if (!v13)
      return;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
}

- (void)_labelSettings
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;

  v2 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 140);
  v3 = *(_QWORD *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    v5 = 0x20A1ED17D78F322BLL;
    if (v3 <= 0x20A1ED17D78F322BLL)
      v5 = 0x20A1ED17D78F322BLL % v3;
    v4 = *(_QWORD **)(*(_QWORD *)(v2 + 8) + 8 * v5);
    do
    {
      do
        v4 = (_QWORD *)*v4;
      while (v4[1] != 0x20A1ED17D78F322BLL);
    }
    while (v4[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    v4 = *(_QWORD **)(*(_QWORD *)(v2 + 8) + 8 * ((v3 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        v4 = (_QWORD *)*v4;
      while (v4[1] != 0x20A1ED17D78F322BLL);
    }
    while (v4[2] != 0x20A1ED17D78F322BLL);
  }
  return *(void **)(v4[5] + 144);
}

- (int64_t)terrainMode
{
  MapEngine *value;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  value = self->_mapEngine.__ptr_.__value_;
  if (!value)
    return 0;
  v3 = (uint64_t *)*((_QWORD *)value + 141);
  v4 = *v3;
  v5 = v3[1];
  if (v4 != v5)
  {
    while (*(_BYTE *)v4 != 29)
    {
      v4 += 16;
      if (v4 == v5)
        return 0;
    }
  }
  if (v4 == v5)
    return 0;
  else
    return *(_QWORD *)(v4 + 8);
}

- (void)setClearFontCache:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSnapshotterIsInService:", v3);

}

- (id).cxx_construct
{
  self->_mapEngine.__ptr_.__value_ = 0;
  self->_taskContext.__ptr_ = 0;
  self->_taskContext.__cntrl_ = 0;
  *(_OWORD *)&self->_images.__begin_ = 0u;
  *(_OWORD *)&self->_images.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_ioSurfaces.__end_ = 0u;
  self->_timer._startTime.__d_.__rep_ = 0;
  self->_timer._startTime.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  self->_expirationTimer.__ptr_.__value_ = 0;
  return self;
}

- (void)setShowsHillshade:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  v5 = 32;
  if (a3)
    v4 = -[VKMapSnapshotCreator _hillshadeIsAvailable](self, "_hillshadeIsAvailable");
  else
    v4 = 0;
  md::MapEngineSettings::set(v3, &v5, (_QWORD *)v4);
}

- (BOOL)_hillshadeIsAvailable
{
  int v2;
  BOOL result;

  v2 = *((unsigned __int8 *)self->_mapEngine.__ptr_.__value_ + 4584);
  result = MapsFeature_IsEnabled_HikingiOS();
  if (!v2)
    return 0;
  return result;
}

- (void)willBecomeFullyDrawn
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  VKMapSnapshotCreator *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p willBecomeFullyDrawn", buf, 0xCu);
  }
  v4 = *(NSObject **)self->_taskContext.__ptr_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VKMapSnapshotCreator_willBecomeFullyDrawn__block_invoke;
  block[3] = &unk_1E42F6DA0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)setPointsOfInterestFilter:(id)a3
{
  GEOPOICategoryFilter *v5;
  std::__shared_weak_count *v6;
  GEOPOICategoryFilter *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  GEOPOICategoryFilter *v10;
  std::__shared_weak_count *v11;
  std::__shared_weak_count *v12;

  v5 = (GEOPOICategoryFilter *)a3;
  if (self->_pointsOfInterestFilter != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_pointsOfInterestFilter, a3);
    if (v10)
    {
      v6 = (std::__shared_weak_count *)operator new(0x30uLL);
      v6->__shared_owners_ = 0;
      v6->__shared_weak_owners_ = 0;
      v6->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DC158;
      v7 = v10;
      v6[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B4E90;
      v6[1].__shared_owners_ = (uint64_t)v7;
      v11 = v6 + 1;
      v12 = v6;
    }
    else
    {
      v6 = 0;
      v11 = 0;
      v12 = 0;
    }
    md::LabelSettings_Presentation::setPointsOfInterestFilter((uint64_t)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings"), (uint64_t *)&v11);
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    v5 = v10;
  }

}

- (void)setShowsTraffic:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  VKMapSnapshotCreator *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    v8 = 134218242;
    v9 = self;
    v10 = 2080;
    v11 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsTraffic: %s", (uint8_t *)&v8, 0x16u);
  }
  v7 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v8) = 2;
  md::MapEngineSettings::set(v7, &v8, (_QWORD *)v3);
}

- (void)setMapKitClientMode:(unsigned __int8)a3
{
  int v3;
  NSObject *v5;
  int8x8_t *v6;
  int8x8_t v7;
  uint8x8_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  VKMapSnapshotCreator *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_mapKitClientMode == a3)
    return;
  v3 = a3;
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = (id)GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v16 = 134218242;
    v17 = self;
    v18 = 2080;
    v19 = gss::to_string(v3);
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapSnapshotCreator:%p] Set mapKitClientMode: %s", (uint8_t *)&v16, 0x16u);
  }

  self->_mapKitClientMode = v3;
  v6 = (int8x8_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 140);
  v7 = v6[2];
  if (!*(_QWORD *)&v7)
    goto LABEL_26;
  v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v7 <= 0x2FED70A4459DFCA1uLL)
      v9 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v7;
  }
  else
  {
    v9 = (*(_QWORD *)&v7 - 1) & 0x2FED70A4459DFCA1;
  }
  v10 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
  if (!v10 || (v11 = (_QWORD *)*v10) == 0)
  {
LABEL_26:
    v15 = 0;
    goto LABEL_27;
  }
  if (v8.u32[0] < 2uLL)
  {
    v12 = *(_QWORD *)&v7 - 1;
    while (1)
    {
      v14 = v11[1];
      if (v14 == 0x2FED70A4459DFCA1)
      {
        if (v11[2] == 0x2FED70A4459DFCA1)
          goto LABEL_29;
      }
      else if ((v14 & v12) != v9)
      {
        goto LABEL_26;
      }
      v11 = (_QWORD *)*v11;
      if (!v11)
        goto LABEL_26;
    }
  }
  while (1)
  {
    v13 = v11[1];
    if (v13 == 0x2FED70A4459DFCA1)
      break;
    if (v13 >= *(_QWORD *)&v7)
      v13 %= *(_QWORD *)&v7;
    if (v13 != v9)
      goto LABEL_26;
LABEL_16:
    v11 = (_QWORD *)*v11;
    if (!v11)
      goto LABEL_26;
  }
  if (v11[2] != 0x2FED70A4459DFCA1)
    goto LABEL_16;
LABEL_29:
  v15 = v11[5];
LABEL_27:
  md::StyleLogic::setMapKitClientMode(v15, v3);
}

- (void)setMapKitUsage:(unsigned __int8)a3
{
  unsigned int v3;
  NSObject *v5;
  _BOOL4 v6;
  int8x8_t *v7;
  int8x8_t v8;
  uint8x8_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  VKMapSnapshotCreator *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_mapKitUsage == a3)
    return;
  v3 = a3;
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = (id)GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v17 = 134218242;
    v18 = self;
    v19 = 2080;
    v20 = gss::to_string(v3);
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapSnapshotCreator:%p] Set mapKitUsage: %s", (uint8_t *)&v17, 0x16u);
  }

  self->_mapKitUsage = v3;
  v6 = v3 != 0;
  self->_usage = v6;
  v7 = (int8x8_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 140);
  v8 = v7[2];
  if (!*(_QWORD *)&v8)
    goto LABEL_26;
  v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    v10 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v8 <= 0x2FED70A4459DFCA1uLL)
      v10 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v8;
  }
  else
  {
    v10 = (*(_QWORD *)&v8 - 1) & 0x2FED70A4459DFCA1;
  }
  v11 = *(_QWORD **)(*(_QWORD *)&v7[1] + 8 * v10);
  if (!v11 || (v12 = (_QWORD *)*v11) == 0)
  {
LABEL_26:
    v16 = 0;
    goto LABEL_27;
  }
  if (v9.u32[0] < 2uLL)
  {
    v13 = *(_QWORD *)&v8 - 1;
    while (1)
    {
      v15 = v12[1];
      if (v15 == 0x2FED70A4459DFCA1)
      {
        if (v12[2] == 0x2FED70A4459DFCA1)
          goto LABEL_29;
      }
      else if ((v15 & v13) != v10)
      {
        goto LABEL_26;
      }
      v12 = (_QWORD *)*v12;
      if (!v12)
        goto LABEL_26;
    }
  }
  while (1)
  {
    v14 = v12[1];
    if (v14 == 0x2FED70A4459DFCA1)
      break;
    if (v14 >= *(_QWORD *)&v8)
      v14 %= *(_QWORD *)&v8;
    if (v14 != v10)
      goto LABEL_26;
LABEL_16:
    v12 = (_QWORD *)*v12;
    if (!v12)
      goto LABEL_26;
  }
  if (v12[2] != 0x2FED70A4459DFCA1)
    goto LABEL_16;
LABEL_29:
  v16 = v12[5];
LABEL_27:
  md::StyleLogic::setUsage(v16, v6, v3);
}

- (void)setRouteOverlay:(id)a3
{
  VKRouteOverlay *v5;
  MapEngine *value;
  uint64_t v7;
  _QWORD **v8;
  VKRouteOverlay *v9;
  _QWORD *v10;
  _QWORD **v11;
  BOOL v12;
  _QWORD **v13;
  _QWORD *v14[2];

  v5 = (VKRouteOverlay *)a3;
  if (self->_routeOverlay != v5)
  {
    objc_storeStrong((id *)&self->_routeOverlay, a3);
    value = self->_mapEngine.__ptr_.__value_;
    md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)value + 567), "-[VKMapSnapshotCreator setRouteOverlay:]");
    v7 = *(_QWORD *)(*((_QWORD *)value + 112) + 16);
    std::mutex::lock((std::mutex *)(v7 + 96));
    v14[0] = 0;
    v14[1] = 0;
    v13 = v14;
    std::set<objc_object  {objcproto14VKRouteOverlay}*>::insert[abi:nn180100]<std::__tree_const_iterator<objc_object  {objcproto14VKRouteOverlay}*,std::__tree_node<objc_object  {objcproto14VKRouteOverlay}*,void *> *,long>>(&v13, *(_QWORD **)(v7 + 48), (_QWORD *)(v7 + 56));
    std::mutex::unlock((std::mutex *)(v7 + 96));
    v8 = v13;
    if (v13 != v14)
    {
      do
      {
        v9 = v8[4];
        if (v9 != v5)
          md::RouteOverlayContainer::removeOverlay(*(_QWORD *)(*((_QWORD *)value + 112) + 16), v5, 1);

        v10 = v8[1];
        if (v10)
        {
          do
          {
            v11 = (_QWORD **)v10;
            v10 = (_QWORD *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            v11 = (_QWORD **)v8[2];
            v12 = *v11 == v8;
            v8 = v11;
          }
          while (!v12);
        }
        v8 = v11;
      }
      while (v11 != v14);
    }
    if (v5)
      md::RouteOverlayContainer::addOverlay(*(_QWORD *)(*((_QWORD *)value + 112) + 16), v5, 1);
    std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v14[0]);
  }

}

- (void)setRouteContext:(id)a3
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  VKRouteContext *v7;
  int8x8_t *v8;
  int8x8_t v9;
  uint8x8_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  md::TransitLogic *v17;
  int8x8_t v18;
  uint8x8_t v19;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  md::NavigationLogic *v26;
  int8x8_t v27;
  uint8x8_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  unint64_t v41;
  char v42;
  VKRouteContext *v43;

  v7 = (VKRouteContext *)a3;
  if (self->_routeContext != v7)
  {
    v43 = v7;
    objc_storeStrong((id *)&self->_routeContext, a3);
    v8 = (int8x8_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 140);
    if (!v8)
      goto LABEL_79;
    v9 = v8[2];
    if (v9)
    {
      v10 = (uint8x8_t)vcnt_s8(v9);
      v10.i16[0] = vaddlv_u8(v10);
      if (v10.u32[0] > 1uLL)
      {
        v11 = 0x1BCA10CB9934FB1BLL;
        if (*(_QWORD *)&v9 <= 0x1BCA10CB9934FB1BuLL)
          v11 = 0x1BCA10CB9934FB1BuLL % *(_QWORD *)&v9;
      }
      else
      {
        v11 = (*(_QWORD *)&v9 - 1) & 0x1BCA10CB9934FB1BLL;
      }
      v12 = *(_QWORD **)(*(_QWORD *)&v8[1] + 8 * v11);
      if (v12)
      {
        v13 = (_QWORD *)*v12;
        if (v13)
        {
          if (v10.u32[0] < 2uLL)
          {
            v14 = *(_QWORD *)&v9 - 1;
            while (1)
            {
              v16 = v13[1];
              if (v16 == 0x1BCA10CB9934FB1BLL)
              {
                if (v13[2] == 0x1BCA10CB9934FB1BLL)
                  goto LABEL_66;
              }
              else if ((v16 & v14) != v11)
              {
                goto LABEL_23;
              }
              v13 = (_QWORD *)*v13;
              if (!v13)
                goto LABEL_23;
            }
          }
          do
          {
            v15 = v13[1];
            if (v15 == 0x1BCA10CB9934FB1BLL)
            {
              if (v13[2] == 0x1BCA10CB9934FB1BLL)
              {
LABEL_66:
                v17 = (md::TransitLogic *)v13[5];
                goto LABEL_24;
              }
            }
            else
            {
              if (v15 >= *(_QWORD *)&v9)
                v15 %= *(_QWORD *)&v9;
              if (v15 != v11)
                break;
            }
            v13 = (_QWORD *)*v13;
          }
          while (v13);
        }
      }
    }
LABEL_23:
    v17 = 0;
LABEL_24:
    md::TransitLogic::setRouteContext(v17, v43);
    v18 = v8[2];
    if (v18)
    {
      v19 = (uint8x8_t)vcnt_s8(v18);
      v19.i16[0] = vaddlv_u8(v19);
      if (v19.u32[0] > 1uLL)
      {
        v20 = 0xBEC1A12372CEEC00;
        if (*(_QWORD *)&v18 <= 0xBEC1A12372CEEC00)
          v20 = 0xBEC1A12372CEEC00 % *(_QWORD *)&v18;
      }
      else
      {
        v20 = (*(_QWORD *)&v18 - 1) & 0xBEC1A12372CEEC00;
      }
      v21 = *(_QWORD **)(*(_QWORD *)&v8[1] + 8 * v20);
      if (v21)
      {
        v22 = (_QWORD *)*v21;
        if (v22)
        {
          if (v19.u32[0] < 2uLL)
          {
            v23 = *(_QWORD *)&v18 - 1;
            while (1)
            {
              v25 = v22[1];
              if (v25 == 0xBEC1A12372CEEC00)
              {
                if (v22[2] == 0xBEC1A12372CEEC00)
                  goto LABEL_67;
              }
              else if ((v25 & v23) != v20)
              {
                goto LABEL_44;
              }
              v22 = (_QWORD *)*v22;
              if (!v22)
                goto LABEL_44;
            }
          }
          do
          {
            v24 = v22[1];
            if (v24 == 0xBEC1A12372CEEC00)
            {
              if (v22[2] == 0xBEC1A12372CEEC00)
              {
LABEL_67:
                v26 = (md::NavigationLogic *)v22[5];
                goto LABEL_45;
              }
            }
            else
            {
              if (v24 >= *(_QWORD *)&v18)
                v24 %= *(_QWORD *)&v18;
              if (v24 != v20)
                break;
            }
            v22 = (_QWORD *)*v22;
          }
          while (v22);
        }
      }
    }
LABEL_44:
    v26 = 0;
LABEL_45:
    md::NavigationLogic::setRouteContext(v26, v43);
    v27 = v8[2];
    if (v27)
    {
      v28 = (uint8x8_t)vcnt_s8(v27);
      v28.i16[0] = vaddlv_u8(v28);
      if (v28.u32[0] > 1uLL)
      {
        v29 = 0x2FED70A4459DFCA1;
        if (*(_QWORD *)&v27 <= 0x2FED70A4459DFCA1uLL)
          v29 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v27;
      }
      else
      {
        v29 = (*(_QWORD *)&v27 - 1) & 0x2FED70A4459DFCA1;
      }
      v30 = *(_QWORD **)(*(_QWORD *)&v8[1] + 8 * v29);
      if (v30)
      {
        v31 = (_QWORD *)*v30;
        if (v31)
        {
          if (v28.u32[0] < 2uLL)
          {
            v32 = *(_QWORD *)&v27 - 1;
            while (1)
            {
              v34 = v31[1];
              if (v34 == 0x2FED70A4459DFCA1)
              {
                if (v31[2] == 0x2FED70A4459DFCA1)
                  goto LABEL_68;
              }
              else if ((v34 & v32) != v29)
              {
                goto LABEL_79;
              }
              v31 = (_QWORD *)*v31;
              if (!v31)
                goto LABEL_79;
            }
          }
          do
          {
            v33 = v31[1];
            if (v33 == 0x2FED70A4459DFCA1)
            {
              if (v31[2] == 0x2FED70A4459DFCA1)
              {
LABEL_68:
                v35 = v31[5];
                if (v35)
                {
                  if (v43)
                  {
                    -[VKRouteContext routeInfo](v43, "routeInfo");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "route");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v38 = objc_msgSend(v37, "transportType");

                    if (v38 >= 7)
                      v3 = 4;
                    else
                      v3 = 0x50403020100uLL >> (8 * v38);
                    -[VKRouteContext routeInfo](v43, "routeInfo");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "route");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    v41 = objc_msgSend(v40, "source");

                    if (v41 >= 6)
                      v4 = 0;
                    else
                      v4 = 0x40003020100uLL >> (8 * v41);
                    v42 = 1;
                  }
                  else
                  {
                    v42 = 0;
                  }
                  md::StyleLogic::setRouteTransportType(v35, v42, v3);
                  md::StyleLogic::setRouteSource(v35, v42, v4);
                }
                break;
              }
            }
            else
            {
              if (v33 >= *(_QWORD *)&v27)
                v33 %= *(_QWORD *)&v27;
              if (v33 != v29)
                break;
            }
            v31 = (_QWORD *)*v31;
          }
          while (v31);
        }
      }
    }
LABEL_79:
    md::LabelSettings_Navigation::setRouteContext((md::LabelSettings_Navigation *)(-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings") + 8), v43);
    v7 = v43;
  }

}

- (void)dealloc
{
  NSObject *v3;
  GEOPOICategoryFilter *pointsOfInterestFilter;
  $6EFE6C6748B912A6EAC8A8E593ED1344 *displayStyles;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t signpostId;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  VKMapSnapshotCreator *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v12 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "Deallocating VKMapSnapshotCreator: %p", buf, 0xCu);
  }
  if (!self->_didSoftDealloc)
    -[VKMapSnapshotCreator softDealloc](self, "softDealloc");
  pointsOfInterestFilter = self->_pointsOfInterestFilter;
  self->_pointsOfInterestFilter = 0;

  displayStyles = self->_displayStyles;
  if (displayStyles)
    free(displayStyles);
  -[VKMapSnapshotCreator clearResources](self, "clearResources");
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v6 = (id)GEOGetVectorKitVKMapSnapshotLog(void)::log;
  v7 = v6;
  signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v7, OS_SIGNPOST_INTERVAL_END, signpostId, "MapSnapshotCreator", (const char *)&unk_1A0189141, buf, 2u);
  }

  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v9 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F029000, v9, OS_LOG_TYPE_INFO, "Dealloc VKMapSnapshotCreator end", buf, 2u);
  }
  v10.receiver = self;
  v10.super_class = (Class)VKMapSnapshotCreator;
  -[VKMapSnapshotCreator dealloc](&v10, sel_dealloc);
}

- (void)softDealloc
{
  NSObject *v3;
  VKNotificationObserver *notificationObserver;
  void *v5;
  void *v6;
  void *v7;
  id completion;
  VKMapImageCanvas *mapCanvas;
  VKGlobeImageCanvas *globeCanvas;
  VKRouteContext *routeContext;
  VKRouteOverlay *routeOverlay;
  GEOPOICategoryFilter *pointsOfInterestFilter;
  MapEngine *value;
  int v15;
  VKMapSnapshotCreator *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v15 = 134217984;
    v16 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "Deleting VKMapSnapshotCreator memory: %p", (uint8_t *)&v15, 0xCu);
  }
  notificationObserver = self->_notificationObserver;
  self->_notificationObserver = 0;

  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "closeServerConnection:", 1);

  objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GEOTileLoaderClientIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "closeForClient:", v7);

  completion = self->_completion;
  self->_completion = 0;

  mapCanvas = self->_mapCanvas;
  self->_mapCanvas = 0;

  -[VKGlobeImageCanvas willDealloc](self->_globeCanvas, "willDealloc");
  globeCanvas = self->_globeCanvas;
  self->_globeCanvas = 0;

  routeContext = self->_routeContext;
  self->_routeContext = 0;

  routeOverlay = self->_routeOverlay;
  self->_routeOverlay = 0;

  pointsOfInterestFilter = self->_pointsOfInterestFilter;
  self->_pointsOfInterestFilter = 0;

  value = self->_mapEngine.__ptr_.__value_;
  self->_mapEngine.__ptr_.__value_ = 0;
  if (value)
    md::MapEngineDeleter::operator()((uint64_t)value);
  self->_didSoftDealloc = 1;
}

- (void)tileGroupWillChange
{
  NSObject *v3;
  int v4;
  VKMapSnapshotCreator *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKSnapshotCreator:%p] tileGroupWillChange", (uint8_t *)&v4, 0xCu);
  }
}

- (void)tileGroupDidChange
{
  NSObject *v3;
  MapEngine *value;
  void *v5;
  int v6;
  VKMapSnapshotCreator *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKSnapshotCreator:%p] tileGroupDidChange", (uint8_t *)&v6, 0xCu);
  }
  value = self->_mapEngine.__ptr_.__value_;
  if (value)
    md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)value + 567), "-[VKMapSnapshotCreator tileGroupDidChange]");
  +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prune:", 0);

}

- (void)clearResources
{
  NSObject *v3;
  CGImage **begin;
  CGImage **end;
  CGImage *v6;
  __IOSurface **v7;
  __IOSurface **v8;
  __IOSurface *v9;
  int v10;
  VKMapSnapshotCreator *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_images.__begin_ != self->_images.__end_ || self->_ioSurfaces.__begin_ != self->_ioSurfaces.__end_)
  {
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
    v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = self;
      _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "Clear VKMapSnapshotCreator %p resources", (uint8_t *)&v10, 0xCu);
    }
    begin = self->_images.__begin_;
    end = self->_images.__end_;
    if (begin != end)
    {
      do
      {
        v6 = *begin++;
        CGImageRelease(v6);
      }
      while (begin != end);
      begin = self->_images.__begin_;
    }
    self->_images.__end_ = begin;
    v7 = self->_ioSurfaces.__begin_;
    v8 = self->_ioSurfaces.__end_;
    if (v7 != v8)
    {
      do
      {
        v9 = *v7++;
        CFRelease(v9);
      }
      while (v7 != v8);
      v7 = self->_ioSurfaces.__begin_;
    }
    self->_ioSurfaces.__end_ = v7;
  }
}

- (void)addOverlay:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;

  -[VKMapImageCanvas addOverlay:](self->_mapCanvas, "addOverlay:", a3);
  v4 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  v6 = 5;
  -[VKMapImageCanvas overlays](self->_mapCanvas, "overlays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  md::MapEngineSettings::set(v4, &v6, (_QWORD *)(objc_msgSend(v5, "count") != 0));

}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*((id *)self->_mapEngine.__ptr_.__value_ + 105), "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (unsigned)emphasis
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;

  v2 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 140);
  v3 = *(_QWORD *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    v5 = 0x2FED70A4459DFCA1;
    if (v3 <= 0x2FED70A4459DFCA1)
      v5 = 0x2FED70A4459DFCA1 % v3;
    v4 = *(_QWORD **)(*(_QWORD *)(v2 + 8) + 8 * v5);
    do
    {
      do
        v4 = (_QWORD *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    v4 = *(_QWORD **)(*(_QWORD *)(v2 + 8) + 8 * ((v3 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        v4 = (_QWORD *)*v4;
      while (v4[1] != 0x2FED70A4459DFCA1);
    }
    while (v4[2] != 0x2FED70A4459DFCA1);
  }
  return *(_BYTE *)(v4[5] + 164);
}

- (void)_transferSettingsFrom:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  v5 = a4;
  objc_msgSend(v10, "edgeInsets");
  objc_msgSend(v5, "setEdgeInsets:");
  objc_msgSend(v10, "mapRegion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pitch");
  v8 = v7;
  objc_msgSend(v10, "yaw");
  objc_msgSend(v5, "setMapRegion:pitch:yaw:", v6, v8, v9);

}

- (BOOL)localizeLabels
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings") + 40) + 24);
}

- (BOOL)showsPointsOfInterest
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings") + 40) + 17);
}

- (void)setShowsPointsOfInterest:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t *v7;
  uint64_t v8;
  md::LabelManager *v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsPointsOfInterest: %s", v12, 0x16u);
  }
  v7 = -[VKMapSnapshotCreator _labelSettings](self, "_labelSettings");
  v8 = *v7;
  *(_BYTE *)(*(_QWORD *)(*v7 + 40) + 17) = v3;
  v9 = *(md::LabelManager **)(v8 + 24);
  *(_QWORD *)v12 = &off_1E42CA1C0;
  *(_QWORD *)&v12[8] = v9;
  *(_QWORD *)&v12[16] = v3;
  v13 = v12;
  md::LabelManager::queueCommand(v9, 18, 1, v12);
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
  }
  else
  {
    if (!v13)
      return;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
}

- (BOOL)showsRoadLabels
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings") + 40) + 19);
}

- (BOOL)showsRoadShields
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings") + 40) + 20);
}

- (BOOL)showsPointLabels
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings") + 40) + 18);
}

- (BOOL)showsContourLabels
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings") + 40) + 21);
}

- (void)setShowsContourLabels:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t *v7;
  uint64_t v8;
  md::LabelManager *v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsContourLabels: %s", v12, 0x16u);
  }
  v7 = -[VKMapSnapshotCreator _labelSettings](self, "_labelSettings");
  v8 = *v7;
  *(_BYTE *)(*(_QWORD *)(*v7 + 40) + 21) = v3;
  v9 = *(md::LabelManager **)(v8 + 24);
  *(_QWORD *)v12 = &off_1E4279840;
  *(_QWORD *)&v12[8] = v9;
  *(_QWORD *)&v12[16] = v3;
  v13 = v12;
  md::LabelManager::queueCommand(v9, 55, 1, v12);
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
  }
  else
  {
    if (!v13)
      return;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
}

- (BOOL)showsPhysicalFeatureLabels
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings") + 40) + 22);
}

- (void)setShowsPhysicalFeatureLabels:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t *v7;
  uint64_t v8;
  md::LabelManager *v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowPhysicalFeatureLabels: %s", v12, 0x16u);
  }
  v7 = -[VKMapSnapshotCreator _labelSettings](self, "_labelSettings");
  v8 = *v7;
  *(_BYTE *)(*(_QWORD *)(*v7 + 40) + 22) = v3;
  v9 = *(md::LabelManager **)(v8 + 24);
  *(_QWORD *)v12 = &off_1E4279888;
  *(_QWORD *)&v12[8] = v9;
  *(_QWORD *)&v12[16] = v3;
  v13 = v12;
  md::LabelManager::queueCommand(v9, 56, 1, v12);
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
  }
  else
  {
    if (!v13)
      return;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
}

- (BOOL)showsLabels
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings") + 40) + 23);
}

- (void)setShowsLabels:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t *v7;
  uint64_t v8;
  md::LabelManager *v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v5 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p setShowsLabels: %s", v12, 0x16u);
  }
  v7 = -[VKMapSnapshotCreator _labelSettings](self, "_labelSettings");
  v8 = *v7;
  *(_BYTE *)(*(_QWORD *)(*v7 + 40) + 23) = v3;
  v9 = *(md::LabelManager **)(v8 + 24);
  *(_QWORD *)v12 = &off_1E42797F8;
  *(_QWORD *)&v12[8] = v9;
  *(_QWORD *)&v12[16] = v3;
  v13 = v12;
  md::LabelManager::queueCommand(v9, 57, 1, v12);
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
  }
  else
  {
    if (!v13)
      return;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
}

- (void)setLabelExclusionRegions:(id)a3
{
  id v4;

  v4 = a3;
  md::LabelSettings::setLabelExclusionRegions((uint64_t)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings"), v4);

}

- (BOOL)showsBuildings
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 1)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (BOOL)showsTintBands
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 11)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (BOOL)showsHiking
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 33)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (BOOL)showsTopographicFeatures
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 34)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (void)setShowsHiking:(BOOL)a3 withTopographicFeatures:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  const char *v8;
  const char *v9;
  _BOOL4 v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  VKMapSnapshotCreator *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v4 = a4;
  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v7 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v8 = "NO";
    if (v5)
      v9 = "YES";
    else
      v9 = "NO";
    v14 = 134218498;
    v15 = self;
    v17 = v9;
    v16 = 2080;
    if (v4)
      v8 = "YES";
    v18 = 2080;
    v19 = v8;
    _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "KMapSnapshotCreator: %p Set shows hiking: %s with topograpic features: %s", (uint8_t *)&v14, 0x20u);
  }
  v10 = v5 && -[VKMapSnapshotCreator _hikingIsAvailable](self, "_hikingIsAvailable");
  v11 = (_QWORD *)(v10 & v4);
  v12 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v14) = 33;
  md::MapEngineSettings::set(v12, &v14, (_QWORD *)v10);
  v13 = *((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  LOBYTE(v14) = 34;
  md::MapEngineSettings::set(v13, &v14, v11);
}

- (BOOL)showsHillshade
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 32)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (void)setSelectedTrailId:(unint64_t)a3
{
  -[VKMapSnapshotCreator setSelectedTrailWithId:name:locale:](self, "setSelectedTrailWithId:name:locale:", a3, 0, 0);
}

- (void)setSelectedTrailWithId:(unint64_t)a3 name:(id)a4 locale:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int8x8_t *v11;
  int8x8_t v12;
  uint8x8_t v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  md::HikingLogic *v20;
  MapEngine *value;
  int v22;
  VKMapSnapshotCreator *v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v10 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v22 = 134218240;
    v23 = self;
    v24 = 2048;
    v25 = a3;
    _os_log_impl(&dword_19F029000, v10, OS_LOG_TYPE_INFO, "[VKMapSnapshotCreator:%p] Select trail id: %llu", (uint8_t *)&v22, 0x16u);
  }
  v11 = (int8x8_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 140);
  v12 = v11[2];
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8(v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      v14 = 0xC74495586E0C32F6;
      if (*(_QWORD *)&v12 <= 0xC74495586E0C32F6)
        v14 = 0xC74495586E0C32F6 % *(_QWORD *)&v12;
    }
    else
    {
      v14 = (*(_QWORD *)&v12 - 1) & 0xC74495586E0C32F6;
    }
    v15 = *(_QWORD **)(*(_QWORD *)&v11[1] + 8 * v14);
    if (v15)
    {
      v16 = (_QWORD *)*v15;
      if (v16)
      {
        if (v13.u32[0] < 2uLL)
        {
          v17 = *(_QWORD *)&v12 - 1;
          while (1)
          {
            v19 = v16[1];
            if (v19 == 0xC74495586E0C32F6)
            {
              if (v16[2] == 0xC74495586E0C32F6)
                goto LABEL_26;
            }
            else if ((v19 & v17) != v14)
            {
              goto LABEL_28;
            }
            v16 = (_QWORD *)*v16;
            if (!v16)
              goto LABEL_28;
          }
        }
        do
        {
          v18 = v16[1];
          if (v18 == 0xC74495586E0C32F6)
          {
            if (v16[2] == 0xC74495586E0C32F6)
            {
LABEL_26:
              v20 = (md::HikingLogic *)v16[5];
              if (v20)
              {
                md::HikingLogic::setSelectedTrail(v20, a3, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
                value = self->_mapEngine.__ptr_.__value_;
                LOBYTE(v22) = 1;
                md::MapEngine::setNeedsTick((uint64_t)value, &v22);
              }
              break;
            }
          }
          else
          {
            if (v18 >= *(_QWORD *)&v12)
              v18 %= *(_QWORD *)&v12;
            if (v18 != v14)
              break;
          }
          v16 = (_QWORD *)*v16;
        }
        while (v16);
      }
    }
  }
LABEL_28:

}

- (BOOL)showsVenues
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (BOOL)showsGlobe
{
  MapEngine *value;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  value = self->_mapEngine.__ptr_.__value_;
  if (!value)
    return 0;
  v3 = (uint64_t *)*((_QWORD *)value + 141);
  v4 = *v3;
  v5 = v3[1];
  if (v4 != v5)
  {
    while (*(_BYTE *)v4 != 22)
    {
      v4 += 16;
      if (v4 == v5)
        return 0;
    }
  }
  return v4 != v5 && *(_QWORD *)(v4 + 8) != 0;
}

- (BOOL)showsTraffic
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 141);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 2)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (int64_t)labelScaleFactor
{
  unsigned int v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings") + 40)
                          + 48);
  if (v2 >= 6)
    return 1;
  else
    return v2;
}

- (void)removeCustomFeatureDataSource:(id)a3
{
  id v4;

  v4 = a3;
  md::LabelSettings::removeCustomFeatureDataSource((uint64_t)-[VKMapSnapshotCreator _labelSettings](self, "_labelSettings"), v4);

}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5
{
  void *v8;
  id v9;

  v9 = a3;
  -[VKMapSnapshotCreator activeCanvas](self, "activeCanvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMapRegion:pitch:yaw:", v9, a4, a5);

}

- (void)cancel
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  VKMapSnapshotCreator *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p cancel snapshot", (uint8_t *)&v5, 0xCu);
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  }
  v4 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log))
  {
    LOWORD(v5) = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cancel", (const char *)&unk_1A0189141, (uint8_t *)&v5, 2u);
  }
  (*(void (**)(Timer *))(*(_QWORD *)self->_expirationTimer.__ptr_.__value_ + 40))(self->_expirationTimer.__ptr_.__value_);
  -[VKMapSnapshotCreator cancelFlushingTileDecodes:](self, "cancelFlushingTileDecodes:", 1);
}

- (void)timeout
{
  NSObject *v3;
  NSObject *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  int v7;
  VKMapSnapshotCreator *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p snapshot request timed out", (uint8_t *)&v7, 0xCu);
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  }
  v4 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cancel", (const char *)&unk_1A0189141, (uint8_t *)&v7, 2u);
  }
  if (self->_completion)
  {
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AF5730]();
    -[VKMapSnapshotCreator cancelFlushingTileDecodes:](self, "cancelFlushingTileDecodes:", 1);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.maps.snapshot.timeout"), -6, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapSnapshotCreator softDealloc](self, "softDealloc");
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v6);
    -[VKMapSnapshotCreator clearResources](self, "clearResources");

  }
}

- (void)cancelFlushingTileDecodes:(BOOL)a3
{
  id completion;
  _BOOL4 v4;
  void *v6;
  MapEngine *value;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[3];
  _QWORD *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  completion = self->_completion;
  if (completion)
  {
    v4 = a3;
    self->_completion = 0;

    -[VKMapSnapshotCreator activeCanvas](self, "activeCanvas");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelLoad");

    value = self->_mapEngine.__ptr_.__value_;
    v8 = *((_QWORD *)value + 11);
    if (v8)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 32))(v8);
      if (*((_QWORD *)value + 11) == *((_QWORD *)value + 8))
      {
        v10 = (std::__shared_weak_count *)*((_QWORD *)value + 9);
        *((_QWORD *)value + 8) = 0;
        *((_QWORD *)value + 9) = 0;
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
      else
      {
        v9 = *((_QWORD *)value + 10);
        *((_QWORD *)value + 10) = 0;
        if (v9)
          (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      }
      *((_QWORD *)value + 11) = 0;
    }
    v13 = *((_QWORD *)self->_taskContext.__ptr_ + 1);
    v17[0] = &off_1E42C7C58;
    v18 = v17;
    geo::TaskQueue::barrierSync(v13, v17);
    v14 = v18;
    if (v18 == v17)
    {
      v15 = 4;
      v14 = v17;
    }
    else
    {
      if (!v18)
        goto LABEL_17;
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_17:
    -[VKMapSnapshotCreator activeCanvas](self, "activeCanvas");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cancelTileRequests");

    -[VKMapSnapshotCreator clearResources](self, "clearResources");
    if (v4)
      md::TaskContext::flushTileDecodeQueues((md::TaskContext *)self->_taskContext.__ptr_);
  }
}

- (void)renderNextSnapshot
{
  void *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  CGImage **value;
  CGImage **end;
  CGImage **v10;
  CGImage **begin;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  CGImage **v17;
  CGImage **v18;
  unint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  CGImage **v22;
  uint64_t v23;
  __int128 v24;
  CGImage *v25;
  NSObject *v26;
  unint64_t nextDisplayStyleIndex;
  unint64_t displayStylesCount;
  id v29;
  uint64_t v30;
  __IOSurface *v31;
  __IOSurface **v32;
  __IOSurface **v33;
  __IOSurface **v34;
  NSObject *v35;
  __IOSurface **v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  _BYTE *v41;
  __IOSurface **v42;
  __IOSurface **v43;
  unint64_t v44;
  uint64_t v45;
  _OWORD *v46;
  __IOSurface **v47;
  uint64_t v48;
  __int128 v49;
  __IOSurface *v50;
  $6EFE6C6748B912A6EAC8A8E593ED1344 *v51;
  uint64_t var0;
  uint64_t var1;
  int var2;
  uint64_t var3;
  uint64_t var4;
  uint64_t var5;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  int8x8_t *v61;
  int8x8_t v62;
  uint8x8_t v63;
  uint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  MapEngine *v72;
  _QWORD *v73;
  uint64_t v74;
  _QWORD block[5];
  _BYTE v76[24];
  _BYTE *v77;
  _BYTE buf[22];
  __int16 v79;
  unint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 105);
  if (!v3)
  {
    v4 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    goto LABEL_11;
  }
  objc_msgSend(v3, "bitmapData");
  if (*(_QWORD *)buf)
  {
    v4 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)buf + 24))(*(_QWORD *)buf);
    v5 = *(std::__shared_weak_count **)&buf[8];
    if (!*(_QWORD *)&buf[8])
      goto LABEL_11;
  }
  else
  {
    v4 = 0;
    v5 = *(std::__shared_weak_count **)&buf[8];
    if (!*(_QWORD *)&buf[8])
      goto LABEL_11;
  }
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(p_shared_owners);
  while (__stlxr(v7 - 1, p_shared_owners));
  if (!v7)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
LABEL_11:
  end = self->_images.__end_;
  value = self->_images.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->_images.__begin_;
    v12 = end - begin;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61)
      abort();
    v14 = (char *)value - (char *)begin;
    if (v14 >> 2 > v13)
      v13 = v14 >> 2;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    if (v15)
    {
      if (v15 >> 61)
        goto LABEL_98;
      v16 = operator new(8 * v15);
    }
    else
    {
      v16 = 0;
    }
    v17 = (CGImage **)&v16[8 * v12];
    v18 = (CGImage **)&v16[8 * v15];
    *v17 = (CGImage *)v4;
    v10 = v17 + 1;
    if (end == begin)
    {
      begin = end;
    }
    else
    {
      v19 = (char *)end - (char *)begin - 8;
      if (v19 < 0x58)
        goto LABEL_102;
      if ((unint64_t)((char *)begin - v16) < 0x20)
        goto LABEL_102;
      v20 = (v19 >> 3) + 1;
      v21 = &v16[8 * v12 - 16];
      v22 = end - 2;
      v23 = v20 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v24 = *(_OWORD *)v22;
        *(v21 - 1) = *((_OWORD *)v22 - 1);
        *v21 = v24;
        v21 -= 2;
        v22 -= 4;
        v23 -= 4;
      }
      while (v23);
      v17 -= v20 & 0x3FFFFFFFFFFFFFFCLL;
      end -= v20 & 0x3FFFFFFFFFFFFFFCLL;
      if (v20 != (v20 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_102:
        do
        {
          v25 = *--end;
          *--v17 = v25;
        }
        while (end != begin);
        begin = self->_images.__begin_;
      }
    }
    self->_images.__begin_ = v17;
    self->_images.__end_ = v10;
    self->_images.__end_cap_.__value_ = v18;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = (CGImage *)v4;
    v10 = end + 1;
  }
  self->_images.__end_ = v10;
  if (!self->_displayStyles || self->_nextDisplayStyleIndex >= self->_displayStylesCount)
  {
    v35 = *(NSObject **)self->_taskContext.__ptr_;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__VKMapSnapshotCreator_renderNextSnapshot__block_invoke;
    block[3] = &unk_1E42F6DA0;
    block[4] = self;
    dispatch_async(v35, block);
    return;
  }
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v26 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    displayStylesCount = self->_displayStylesCount;
    nextDisplayStyleIndex = self->_nextDisplayStyleIndex;
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = nextDisplayStyleIndex;
    v79 = 2048;
    v80 = displayStylesCount;
    _os_log_impl(&dword_19F029000, v26, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p rendering next display style (%llu / %llu)", buf, 0x20u);
  }
  v29 = *((id *)self->_mapEngine.__ptr_.__value_ + 105);
  v30 = objc_msgSend(v29, "flipImage");
  v31 = (__IOSurface *)v30;
  v33 = self->_ioSurfaces.__end_;
  v32 = self->_ioSurfaces.__end_cap_.__value_;
  if (v33 >= v32)
  {
    v36 = self->_ioSurfaces.__begin_;
    v37 = v33 - v36;
    v38 = v37 + 1;
    if ((unint64_t)(v37 + 1) >> 61)
      abort();
    v39 = (char *)v32 - (char *)v36;
    if (v39 >> 2 > v38)
      v38 = v39 >> 2;
    if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
      v40 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v40 = v38;
    if (!v40)
    {
      v41 = 0;
      goto LABEL_53;
    }
    if (!(v40 >> 61))
    {
      v41 = operator new(8 * v40);
LABEL_53:
      v42 = (__IOSurface **)&v41[8 * v37];
      v43 = (__IOSurface **)&v41[8 * v40];
      *v42 = v31;
      v34 = v42 + 1;
      if (v33 == v36)
      {
        v36 = v33;
      }
      else
      {
        v44 = (char *)v33 - (char *)v36 - 8;
        if (v44 < 0x58)
          goto LABEL_103;
        if ((unint64_t)((char *)v36 - v41) < 0x20)
          goto LABEL_103;
        v45 = (v44 >> 3) + 1;
        v46 = &v41[8 * v37 - 16];
        v47 = v33 - 2;
        v48 = v45 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v49 = *(_OWORD *)v47;
          *(v46 - 1) = *((_OWORD *)v47 - 1);
          *v46 = v49;
          v46 -= 2;
          v47 -= 4;
          v48 -= 4;
        }
        while (v48);
        v42 -= v45 & 0x3FFFFFFFFFFFFFFCLL;
        v33 -= v45 & 0x3FFFFFFFFFFFFFFCLL;
        if (v45 != (v45 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_103:
          do
          {
            v50 = *--v33;
            *--v42 = v50;
          }
          while (v33 != v36);
          v36 = self->_ioSurfaces.__begin_;
        }
      }
      self->_ioSurfaces.__begin_ = v42;
      self->_ioSurfaces.__end_ = v34;
      self->_ioSurfaces.__end_cap_.__value_ = v43;
      if (v36)
        operator delete(v36);
      goto LABEL_64;
    }
LABEL_98:
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  *v33 = (__IOSurface *)v30;
  v34 = v33 + 1;
LABEL_64:
  self->_ioSurfaces.__end_ = v34;

  v51 = &self->_displayStyles[self->_nextDisplayStyleIndex];
  var0 = v51->var0;
  var1 = v51->var1;
  var2 = v51->var2;
  var3 = v51->var3;
  var4 = v51->var4;
  var5 = v51->var5;
  v58 = var2 - 1;
  if (v58 > 8)
    v59 = 0;
  else
    v59 = qword_1A007B738[v58];
  v60 = v59 + 0x1000000000000 + (var0 | (var1 << 8) | (var3 << 24) | (var4 << 32) | (var5 << 40));
  v61 = (int8x8_t *)*((_QWORD *)self->_mapEngine.__ptr_.__value_ + 140);
  v62 = v61[2];
  if (!*(_QWORD *)&v62)
    goto LABEL_87;
  v63 = (uint8x8_t)vcnt_s8(v62);
  v63.i16[0] = vaddlv_u8(v63);
  if (v63.u32[0] > 1uLL)
  {
    v64 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v62 <= 0x2FED70A4459DFCA1uLL)
      v64 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v62;
  }
  else
  {
    v64 = (*(_QWORD *)&v62 - 1) & 0x2FED70A4459DFCA1;
  }
  v65 = *(_QWORD **)(*(_QWORD *)&v61[1] + 8 * v64);
  if (!v65 || (v66 = (_QWORD *)*v65) == 0)
  {
LABEL_87:
    v70 = 0;
    goto LABEL_88;
  }
  if (v63.u32[0] < 2uLL)
  {
    v67 = *(_QWORD *)&v62 - 1;
    while (1)
    {
      v69 = v66[1];
      if (v69 == 0x2FED70A4459DFCA1)
      {
        if (v66[2] == 0x2FED70A4459DFCA1)
          goto LABEL_96;
      }
      else if ((v69 & v67) != v64)
      {
        goto LABEL_87;
      }
      v66 = (_QWORD *)*v66;
      if (!v66)
        goto LABEL_87;
    }
  }
  while (1)
  {
    v68 = v66[1];
    if (v68 == 0x2FED70A4459DFCA1)
      break;
    if (v68 >= *(_QWORD *)&v62)
      v68 %= *(_QWORD *)&v62;
    if (v68 != v64)
      goto LABEL_87;
LABEL_77:
    v66 = (_QWORD *)*v66;
    if (!v66)
      goto LABEL_87;
  }
  if (v66[2] != 0x2FED70A4459DFCA1)
    goto LABEL_77;
LABEL_96:
  v70 = v66[5];
LABEL_88:
  md::StyleLogic::setDisplayStyle(v70, v60);
  -[VKMapSnapshotCreator activeCanvas](self, "activeCanvas");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = self->_mapEngine.__ptr_.__value_;
  v77 = 0;
  objc_msgSend(v71, "renderSceneWithEngine:completion:", v72, v76);
  v73 = v77;
  if (v77 == v76)
  {
    v74 = 4;
    v73 = v76;
LABEL_92:
    (*(void (**)(void))(*v73 + 8 * v74))();
  }
  else if (v77)
  {
    v74 = 5;
    goto LABEL_92;
  }

  ++self->_nextDisplayStyleIndex;
  if (self->_completion)
    -[VKMapSnapshotCreator renderNextSnapshot](self, "renderNextSnapshot");
}

- (void)didReceiveMemoryWarning
{
  NSObject *v3;
  NSObject *v4;
  MapEngine *value;
  VKGlobeImageCanvas *globeCanvas;
  VKMapImageCanvas *mapCanvas;
  void *v8;
  int v9;
  VKMapSnapshotCreator *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  v3 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator didReceiveMemoryWarning: %p", (uint8_t *)&v9, 0xCu);
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
  }
  v4 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
  if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DidReceiveMemoryWarning", (const char *)&unk_1A0189141, (uint8_t *)&v9, 2u);
  }
  value = self->_mapEngine.__ptr_.__value_;
  md::HomeQueueScheduler::waitForSynchronization(*((md::HomeQueueScheduler **)value + 567), "-[VKMapSnapshotCreator didReceiveMemoryWarning]");
  globeCanvas = self->_globeCanvas;
  if (globeCanvas)
    -[VKImageCanvas didReceiveMemoryWarning:](globeCanvas, "didReceiveMemoryWarning:", 0);
  mapCanvas = self->_mapCanvas;
  if (mapCanvas)
    -[VKImageCanvas didReceiveMemoryWarning:](mapCanvas, "didReceiveMemoryWarning:", 0);
  md::MapEngine::prune((uint64_t)value, 2u);
  +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prune:", 1);

}

- (BOOL)canChangeVenueFocus
{
  return 1;
}

- (GEOPOICategoryFilter)pointsOfInterestFilter
{
  return self->_pointsOfInterestFilter;
}

- (VKEdgeInsets)edgeInsets
{
  float top;
  float left;
  float bottom;
  float right;
  VKEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (VKRouteContext)routeContext
{
  return self->_routeContext;
}

- (unsigned)mapKitUsage
{
  return self->_mapKitUsage;
}

- (unsigned)mapKitClientMode
{
  return self->_mapKitClientMode;
}

- (void).cxx_destruct
{
  Timer *value;
  __IOSurface **begin;
  CGImage **v5;
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  MapEngine *v9;

  objc_storeStrong((id *)&self->_routeContext, 0);
  objc_storeStrong((id *)&self->_routeOverlay, 0);
  objc_storeStrong((id *)&self->_manifestTileGroupObserverProxy, 0);
  value = self->_expirationTimer.__ptr_.__value_;
  self->_expirationTimer.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Timer *))(*(_QWORD *)value + 8))(value);
  begin = self->_ioSurfaces.__begin_;
  if (begin)
  {
    self->_ioSurfaces.__end_ = begin;
    operator delete(begin);
  }
  v5 = self->_images.__begin_;
  if (v5)
  {
    self->_images.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  cntrl = self->_taskContext.__cntrl_;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  v9 = self->_mapEngine.__ptr_.__value_;
  self->_mapEngine.__ptr_.__value_ = 0;
  if (v9)
    md::MapEngineDeleter::operator()((uint64_t)v9);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_pointsOfInterestFilter, 0);
  objc_storeStrong((id *)&self->_globeCanvas, 0);
  objc_storeStrong((id *)&self->_mapCanvas, 0);
}

void __42__VKMapSnapshotCreator_renderNextSnapshot__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  _BOOL4 v17;
  float v18;
  _QWORD *v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  float v32;
  float v33;
  unsigned int v34;
  uint64_t *v35;
  uint64_t v36;
  VKMapSnapshot *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  id v48;
  id v49;
  unint64_t v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  int v57;
  unsigned __int16 *v59;
  unsigned __int16 *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  long double v67;
  double v68;
  double v69;
  double v70;
  float v71;
  float64x2_t v72;
  uint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *p_shared_owners;
  unint64_t v80;
  uint64_t v81;
  std::__shared_weak_count *v82;
  unint64_t *v83;
  unint64_t v84;
  int v85;
  int64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float32x4_t v89;
  unint64_t v90;
  VKSnapshotElevationRaster *v91;
  double v92;
  double v93;
  VKSnapshotElevationRaster *v94;
  void *v95;
  unint64_t *v96;
  unint64_t v97;
  unint64_t *v98;
  unint64_t v99;
  long double v100;
  __int128 v101;
  float64x2_t v102;
  id v103;
  void (**v104)(_QWORD, _QWORD, _QWORD);
  malloc_statistics_t stats;
  int v106;
  uint64_t v107;
  mach_msg_type_number_t task_info_outCnt;
  _WORD v109[2];
  uint64_t v110;
  _OWORD buf[9];
  int v112;
  int v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v104 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AF5730]();
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 64);
    *(_QWORD *)(v2 + 64) = 0;

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned __int8 *)(v4 + 56);
    v6 = *(unsigned __int8 *)(v4 + 57);
    if (v5)
    {
      if (!v6)
      {
        if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
          dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
        v7 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
        if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_INFO))
        {
          v8 = *(_QWORD *)(a1 + 32);
          LODWORD(buf[0]) = 134217984;
          *(_QWORD *)((char *)buf + 4) = v8;
          _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "VKMapSnapshotCreator: %p finished rendering snapshot!", (uint8_t *)buf, 0xCu);
        }
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v10 = *(_QWORD **)(a1 + 32);
        v12 = v10[19];
        v11 = v10[20];
        if (v12 != v11)
        {
          do
          {
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v12, "^{CGImage=}");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v13);

            v12 += 8;
          }
          while (v12 != v11);
          v10 = *(_QWORD **)(a1 + 32);
        }
        objc_msgSend(v10, "activeCanvas");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "vkCamera");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pitch");
        if (v16 > 0.0 && objc_msgSend(*(id *)(a1 + 32), "_elevatedGroundIsEnabled"))
        {
          v17 = objc_msgSend(*(id *)(a1 + 32), "terrainMode") == 1;

          v18 = 0.0;
          if (v17)
          {
            v103 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v19 = *(_QWORD **)(a1 + 32);
            v20 = gdc::Context::get<md::SceneContext>(*(_QWORD **)(v19[9] + 920));
            if ((objc_msgSend(v19, "showsGlobe") & 1) != 0)
            {
              v21 = 1;
            }
            else if (objc_msgSend(*(id *)(a1 + 32), "_elevatedGroundIsEnabled"))
            {
              v21 = 4;
            }
            else
            {
              v21 = 0;
            }
            v59 = *(unsigned __int16 **)(*(_QWORD *)v20 + 112);
            v60 = *(unsigned __int16 **)(*(_QWORD *)v20 + 120);
            if (v59 != v60)
            {
              while (*v59 != v21)
              {
                v59 += 56;
                if (v59 == v60)
                {
                  v59 = *(unsigned __int16 **)(*(_QWORD *)v20 + 120);
                  break;
                }
              }
            }
            v61 = *((_QWORD *)v59 + 13);
            v62 = *(_QWORD *)(v61 + 24);
            v63 = *(_QWORD *)(v61 + 32);
            if (v62 != v63)
            {
              while (*(_WORD *)v62 != 43)
              {
                v62 += 32;
                if (v62 == v63)
                  goto LABEL_65;
              }
            }
            if (v62 == v63)
            {
LABEL_65:
              v64 = 0;
              v65 = 0;
            }
            else
            {
              v64 = *(_QWORD *)(v62 + 8);
              v65 = *(_QWORD *)(v62 + 16);
            }
            objc_msgSend(*(id *)(a1 + 32), "activeCanvas");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "camera");
            v101 = *(_OWORD *)(*(_QWORD *)&buf[0] + 16);
            v67 = tan(*(double *)(*(_QWORD *)&buf[0] + 8) * 0.5 + 0.785398163);
            v100 = log(v67);
            std::shared_ptr<esl::QuartzContext>::~shared_ptr[abi:ne180100]((uint64_t)buf);

            if (v64 != v65)
            {
              *(_QWORD *)&v72.f64[0] = v101;
              v72.f64[1] = v100;
              __asm { FMOV            V1.2D, #0.5 }
              v102 = vmlaq_f64(_Q1, (float64x2_t)vdupq_n_s64(0x3FC45F306DC9C883uLL), v72);
              v18 = 0.0;
              do
              {
                v77 = *(_QWORD *)(v64 + 112);
                v78 = *(std::__shared_weak_count **)(v64 + 120);
                *(_QWORD *)&buf[0] = v77;
                *((_QWORD *)&buf[0] + 1) = v78;
                if (v78)
                {
                  p_shared_owners = (unint64_t *)&v78->__shared_owners_;
                  do
                    v80 = __ldxr(p_shared_owners);
                  while (__stxr(v80 + 1, p_shared_owners));
                }
                if (v77)
                {
                  v81 = *(_QWORD *)(v77 + 720);
                  v82 = *(std::__shared_weak_count **)(v77 + 728);
                  *(_QWORD *)&stats.blocks_in_use = v81;
                  stats.size_in_use = (size_t)v82;
                  if (v82)
                  {
                    v83 = (unint64_t *)&v82->__shared_owners_;
                    do
                      v84 = __ldxr(v83);
                    while (__stxr(v84 + 1, v83));
                  }
                  if (v81)
                  {
                    v85 = 1 << *(_BYTE *)(v81 + 57);
                    v86.i64[0] = *(int *)(v81 + 64);
                    v86.i64[1] = v85 + ~*(_DWORD *)(v81 + 60);
                    v87 = vmlsq_lane_f64(v102, vcvtq_f64_s64(v86), 1.0 / (double)v85, 0);
                    v88 = vmulq_n_f64(v87, (double)v85);
                    v89 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v88), v88);
                    LODWORD(v88.f64[0]) = vmovn_s32(vcgeq_f32((float32x4_t)xmmword_19FFB3850, v89)).u32[0];
                    HIDWORD(v88.f64[0]) = vmovn_s32(vcgeq_f32(v89, (float32x4_t)xmmword_19FFB3850)).i32[1];
                    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(*(int16x4_t *)&v88.f64[0], 0xFuLL))) & 1) != 0)
                    {
                      v90 = md::ElevationRaster::elevationInMetersAtWorldPoint(v81, 1, v102.f64[0], v102.f64[1], 0.00781250185, v87.f64[0], v68, v69, v70, v71);
                      if (HIDWORD(v90))
                        v18 = *(float *)&v90;
                      else
                        v18 = 0.0;
                    }
                  }
                  v91 = [VKSnapshotElevationRaster alloc];
                  v109[0] = *(_WORD *)(v81 + 56);
                  v110 = *(_QWORD *)(v81 + 60);
                  HIDWORD(v92) = HIDWORD(v110);
                  LODWORD(v92) = *(_DWORD *)(v81 + 48);
                  LODWORD(v93) = *(_DWORD *)(v77 + 736);
                  v94 = -[VKSnapshotElevationRaster initWithQuadTile:width:height:scale:tileSizeInMeters:minElevationInMeters:](v91, "initWithQuadTile:width:height:scale:tileSizeInMeters:minElevationInMeters:", v109, *(unsigned int *)(v81 + 32), *(unsigned int *)(v81 + 40), *(__int16 *)(v81 + 52), v92, v93);
                  v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *(_QWORD *)v81, 2 * *(_QWORD *)(v81 + 32) * *(_QWORD *)(v81 + 40));
                  -[VKSnapshotElevationRaster setRasterData:](v94, "setRasterData:", v95);

                  objc_msgSend(v103, "addObject:", v94);
                  if (v82)
                  {
                    v96 = (unint64_t *)&v82->__shared_owners_;
                    do
                      v97 = __ldaxr(v96);
                    while (__stlxr(v97 - 1, v96));
                    if (!v97)
                    {
                      ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
                      std::__shared_weak_count::__release_weak(v82);
                    }
                  }
                  v78 = (std::__shared_weak_count *)*((_QWORD *)&buf[0] + 1);
                }
                if (v78)
                {
                  v98 = (unint64_t *)&v78->__shared_owners_;
                  do
                    v99 = __ldaxr(v98);
                  while (__stlxr(v99 - 1, v98));
                  if (!v99)
                  {
                    ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
                    std::__shared_weak_count::__release_weak(v78);
                  }
                }
                v64 += 144;
              }
              while (v64 != v65);
            }
          }
          else
          {
            v103 = 0;
          }
        }
        else
        {

          v103 = 0;
          v18 = 0.0;
        }
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
        v26 = *(_QWORD **)(v25 + 920);
        v27 = v26[1];
        if ((v27 & (v27 - 1)) != 0)
        {
          v30 = 0x8BD499FBD96FBB9ELL;
          if (v27 <= 0x8BD499FBD96FBB9ELL)
            v30 = 0x8BD499FBD96FBB9ELL % v27;
          v28 = *(_QWORD **)(*v26 + 8 * v30);
          do
          {
            do
              v28 = (_QWORD *)*v28;
            while (v28[1] != 0x8BD499FBD96FBB9ELL);
          }
          while (v28[2] != 0x8BD499FBD96FBB9ELL);
        }
        else
        {
          v28 = *(_QWORD **)(*v26 + 8 * ((v27 - 1) & 0x8BD499FBD96FBB9ELL));
          do
          {
            do
              v28 = (_QWORD *)*v28;
            while (v28[1] != 0x8BD499FBD96FBB9ELL);
          }
          while (v28[2] != 0x8BD499FBD96FBB9ELL);
        }
        v31 = *(_QWORD *)(v28[5] + 32);
        v32 = *(float *)(v31 + 16);
        v33 = *(float *)(v31 + 20);
        v34 = *(_DWORD *)objc_msgSend(*(id *)(v25 + 840), "format");
        if (v34 - 44 >= 0xE && ((v56 = v34 > 0xF, v57 = (1 << v34) & 0xA800, !v56) ? (_ZF = v57 == 0) : (_ZF = 1), _ZF))
          v35 = (uint64_t *)MEMORY[0x1E0C9DA00];
        else
          v35 = (uint64_t *)MEMORY[0x1E0C9DA10];
        v36 = *v35;
        v37 = [VKMapSnapshot alloc];
        v38 = *(_QWORD **)(a1 + 32);
        v39 = v38[16];
        v40 = v38[17];
        v41 = *(id *)(v38[9] + 840);
        objc_msgSend(v41, "contentScale");
        v43 = v42;
        objc_msgSend(*(id *)(a1 + 32), "activeCanvas");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "vkCamera");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v46 = v33 * v32;
        *(float *)&v47 = v18;
        v48 = -[VKMapSnapshot _initWithImages:displayStyles:displayStylesCount:scale:camera:elevationScale:targetPointElevation:colorSpace:](v37, "_initWithImages:displayStyles:displayStylesCount:scale:camera:elevationScale:targetPointElevation:colorSpace:", v9, v39, v40, v45, v36, v43, v46, v47);

        objc_msgSend(v48, "setElevationRasters:", v103);
        v49 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        task_info_outCnt = 93;
        if (!task_info(*MEMORY[0x1E0C83DA0], 0x16u, (task_info_t)buf, &task_info_outCnt))
        {
          LODWORD(v50) = v112;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setValue:forKey:", v51, CFSTR("MemoryUsage:Footprint"));

          LODWORD(v52) = v113;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setValue:forKey:", v53, CFSTR("MemoryUsage:Footprint_Peak"));

        }
        v107 = 0;
        v106 = 0;
        malloc_get_all_zones();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)((std::chrono::steady_clock::now().__d_.__rep_ - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200)) / 1000)* 0.001);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TimeForSnapshot"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setValue:forKey:", v54, v55);

        objc_msgSend(v48, "setMemoryStats:", v49);
        objc_msgSend(*(id *)(a1 + 32), "softDealloc");
        ((void (**)(_QWORD, id, _QWORD))v104)[2](v104, v48, 0);
        objc_msgSend(*(id *)(a1 + 32), "clearResources");

        goto LABEL_43;
      }
    }
    else if (!v6)
    {
      if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
      v22 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
      if (!os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      v29 = *(_QWORD *)(a1 + 32);
      LODWORD(buf[0]) = 134217984;
      *(_QWORD *)((char *)buf + 4) = v29;
      v24 = "VKMapSnapshotCreator: %p failed to fully render";
      goto LABEL_21;
    }
    if (GEOGetVectorKitVKMapSnapshotLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapSnapshotLog(void)::onceToken, &__block_literal_global_16513);
    v22 = GEOGetVectorKitVKMapSnapshotLog(void)::log;
    if (!os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapSnapshotLog(void)::log, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v23 = *(_QWORD *)(a1 + 32);
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = v23;
    v24 = "VKMapSnapshotCreator: %p failed to render - failed tiles!";
LABEL_21:
    _os_log_impl(&dword_19F029000, v22, OS_LOG_TYPE_ERROR, v24, (uint8_t *)buf, 0xCu);
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.maps.snapshot.failedtiles"), -5, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "softDealloc");
    ((void (**)(_QWORD, _QWORD, id))v104)[2](v104, 0, v9);
    objc_msgSend(*(id *)(a1 + 32), "clearResources");
LABEL_43:

  }
}

- (void)cancelFlushingTileDecodes:
{
  *a2 = &off_1E42C7C58;
}

- (_QWORD)cancelFlushingTileDecodes:
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E42C7C58;
  return result;
}

- (uint64_t)initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (id)initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:useMultisampling:withError:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E42C7358;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

+ (BOOL)supportsSharingThumbnails
{
  void *v2;
  char v3;

  +[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canMakeSharingThumbnails");

  return v3;
}

@end
