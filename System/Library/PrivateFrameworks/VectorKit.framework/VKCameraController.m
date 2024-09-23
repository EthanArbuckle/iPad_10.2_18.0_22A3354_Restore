@implementation VKCameraController

- (BOOL)isPitchEnabled
{
  return self->_isPitchEnabled;
}

- (double)topDownMinimumZoomLevelForTileSize:(int64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[VKCameraController topDownMinimumZoomLevel](self, "topDownMinimumZoomLevel");
  v6 = v5;
  -[VKCameraController zoomLevelAdjustmentForTileSize:](self, "zoomLevelAdjustmentForTileSize:", a3);
  return v7 + v6;
}

- (BOOL)wantsTimerTick
{
  return self->_gesturing;
}

- (id)vkCamera
{
  return self->_vkCamera;
}

- (id)canvas
{
  return objc_loadWeakRetained((id *)&self->_canvas);
}

- (CGPoint)centerScreenPoint
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  float64x2_t v5;
  float64x2_t v11;
  float32x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v16;
  float64x2_t v17;
  unint64_t *v18;
  unint64_t v19;
  double v20;
  float64x2_t v21;
  float32x2_t *v22;
  std::__shared_weak_count *v23;
  CGPoint result;

  -[VKCameraController camera](self, "camera");
  if (!v23)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v23->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (v4)
  {
LABEL_5:
    if (v22)
      goto LABEL_6;
LABEL_16:
    v20 = 0.5;
    _Q1.f64[0] = 0.5;
    goto LABEL_17;
  }
  ((void (*)())v23->__on_zero_shared)();
  std::__shared_weak_count::__release_weak(v23);
  if (!v22)
    goto LABEL_16;
LABEL_6:
  -[VKCameraController camera](self, "camera");
  *(float32x2_t *)&v5.f64[0] = v22[47];
  __asm { FMOV            V1.2D, #0.5 }
  if (v5.f64[0] > 0.0 && *(double *)&v22[46] > 0.0)
  {
    *(float32x2_t *)&v5.f64[1] = v22[46];
    v11 = vaddq_f64(v5, v5);
    v12 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v22[54]), v11));
    v13 = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v22[55]), v11)));
    v14 = vcvtq_f64_f32(v12);
    __asm { FMOV            V2.2D, #0.5 }
    v16 = vsubq_f64(_Q2, v14);
    v17 = vaddq_f64(v14, _Q2);
    *(_QWORD *)&_Q2.f64[0] = *(_OWORD *)&vaddq_f64(v16, v13);
    _Q2.f64[1] = vsubq_f64(v17, v13).f64[1];
    _Q1 = vcvtq_f64_f32(vcvt_f32_f64(_Q2));
  }
  if (v23)
  {
    v18 = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      v21 = _Q1;
      ((void (*)())v23->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v23);
      _Q1 = v21;
    }
  }
  v20 = _Q1.f64[1];
LABEL_17:
  result.y = _Q1.f64[0];
  result.x = v20;
  return result;
}

- (shared_ptr<gdc::Camera>)camera
{
  Camera **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<gdc::Camera> result;

  cntrl = self->_camera.__cntrl_;
  *v2 = self->_camera.__ptr_;
  v2[1] = (Camera *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Camera *)self;
  return result;
}

- (void)beginRegionChange:(BOOL)a3
{
  unint64_t regionChangeCount;
  _BOOL8 v4;
  id v5;

  regionChangeCount = self->_regionChangeCount;
  self->_regionChangeCount = regionChangeCount + 1;
  if (!regionChangeCount)
  {
    v4 = a3;
    self->_inProgressRegionChangeIsAnimated = a3;
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapLayerWillChangeRegionAnimated:", v4);

  }
}

- (void)endRegionChange
{
  unint64_t regionChangeCount;
  unint64_t v4;
  id v5;

  regionChangeCount = self->_regionChangeCount;
  if (regionChangeCount)
  {
    v4 = regionChangeCount - 1;
    self->_regionChangeCount = v4;
    if (!v4)
    {
      -[VKCameraController cameraDelegate](self, "cameraDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mapLayerDidChangeRegionAnimated:", self->_inProgressRegionChangeIsAnimated);

    }
  }
}

- (id)cameraDelegate
{
  return objc_loadWeakRetained((id *)&self->_cameraDelegate);
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (double)currentZoomLevelForTileSize:(int64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[VKCameraController currentZoomLevel](self, "currentZoomLevel");
  v6 = v5;
  -[VKCameraController zoomLevelAdjustmentForTileSize:](self, "zoomLevelAdjustmentForTileSize:", a3);
  return v7 + v6;
}

- (RunLoopController)runLoopController
{
  return self->_runLoopController;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (BOOL)usesVKCamera
{
  return 1;
}

- (BOOL)isGesturing
{
  return self->_gesturing;
}

- (double)maximumZoomLevelForTileSize:(int64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[VKCameraController maximumZoomLevel](self, "maximumZoomLevel");
  v6 = v5;
  -[VKCameraController zoomLevelAdjustmentForTileSize:](self, "zoomLevelAdjustmentForTileSize:", a3);
  return v7 + v6;
}

- (void)setVkCamera:(id)a3
{
  VKCamera *v5;
  VKCamera **p_vkCamera;
  VKCamera *vkCamera;
  VKCamera *v8;

  v5 = (VKCamera *)a3;
  vkCamera = self->_vkCamera;
  p_vkCamera = &self->_vkCamera;
  if (vkCamera != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_vkCamera, a3);
    v5 = v8;
  }

}

- (void)setCanvas:(id)a3
{
  MDRenderTarget **p_canvas;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_canvas = &self->_canvas;
  WeakRetained = objc_loadWeakRetained((id *)p_canvas);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_canvas, obj);
    v6 = obj;
  }

}

- (void)setMaxDisplayRate:(int64_t)a3
{
  self->_maxDisplayRate = a3;
}

- (void)setBaseDisplayRate:(int64_t)a3
{
  self->_baseDisplayRate = a3;
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  __shared_weak_count *v3;
  Camera *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(Camera **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_camera.__cntrl_;
  self->_camera.__ptr_ = v4;
  self->_camera.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (void)setIsPitchEnabled:(BOOL)a3
{
  self->_isPitchEnabled = a3;
}

- (GEOMapRegion)mapRegion
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  float v8;
  float v9;
  void *v10;
  double v11;
  double v12;
  float v13;
  float v14;
  void *v15;
  double v16;
  double v17;
  float v18;
  float v19;
  void *v20;
  double v21;
  double v22;
  float v23;
  float v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  float v29;
  float v30;
  float v31;
  float v32;
  id v33;
  id v35;

  -[VKCameraController canvas](self, "canvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  if (v4 == 0.0)
  {

    goto LABEL_5;
  }
  -[VKCameraController canvas](self, "canvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;

  if (v7 == 0.0)
  {
LABEL_5:
    v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D27208]), "initWithCoordinateRegion:", 0.0, 0.0, 90.0, 180.0);
    return (GEOMapRegion *)v33;
  }
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v9 = v8;
  -[VKCameraController canvas](self, "canvas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v14 = v13;
  -[VKCameraController canvas](self, "canvas");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v17 = v16;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v19 = v18;
  -[VKCameraController canvas](self, "canvas");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "size");
  v22 = v21;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v24 = v23;
  -[VKCameraController canvas](self, "canvas");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "size");
  v27 = v26;

  -[VKCameraController vkCamera](self, "vkCamera");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (v24 + v24) / v27;
  v30 = (v19 + v19) / v22;
  v31 = (v14 + v14) / v17;
  v32 = (v9 + v9) / v12;
  v35 = 0;
  VKCameraCalculateEnclosingRegion(v28, &v35, 0, v32, v31, v30, v29);
  v33 = v35;

  return (GEOMapRegion *)v33;
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

- (VKCameraController)initWithMapDataAccess:(void *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6
{
  id v10;
  VKCameraController *v11;
  VKCameraController *v12;
  VKCameraController *v13;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)VKCameraController;
  v11 = -[VKCameraController init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_mapDataAccess = a3;
    v11->_animationRunner = a4;
    v11->_runLoopController = a5;
    objc_storeWeak((id *)&v11->_cameraDelegate, v10);
    v12->_baseDisplayRate = -1;
    v12->_maxDisplayRate = -1;
    v13 = v12;
  }

  return v12;
}

- (AnimationRunner)animationRunner
{
  return self->_animationRunner;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_destroyWeak((id *)&self->_cameraDelegate);
  objc_destroyWeak((id *)&self->_canvas);
  cntrl = self->_camera.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  objc_storeStrong((id *)&self->_vkCamera, 0);
}

- (int64_t)baseDisplayRate
{
  return self->_baseDisplayRate;
}

- (int64_t)maxDisplayRate
{
  return self->_maxDisplayRate;
}

- (void)setCameraDelegate:(id)a3
{
  VKMapViewCameraDelegate **p_cameraDelegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_cameraDelegate = &self->_cameraDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_cameraDelegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_cameraDelegate, obj);
    v6 = obj;
  }

}

- (void)setGesturing:(BOOL)a3
{
  self->_gesturing = a3;
}

- (id)getWorldType:(unsigned __int8)a3
{
  if (a3 > 6u)
    return CFSTR("Unknown");
  else
    return (id)*((_QWORD *)&off_1E42ECDC0 + a3);
}

- (id)getCameraType:(unsigned __int8)a3
{
  if (a3 > 3u)
    return CFSTR("Unknown");
  else
    return (id)*((_QWORD *)&off_1E42ECDF8 + a3);
}

- (id)getMapEngineModeType:(unsigned __int8)a3
{
  const char *v3;

  if (a3 > 0x12u)
    v3 = "<Invalid>";
  else
    v3 = off_1E42F3200[a3];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
}

- (BOOL)isAnimating
{
  _BOOL4 v3;

  v3 = -[VKCameraController isChangingRegion](self, "isChangingRegion");
  if (v3)
    LOBYTE(v3) = self->_inProgressRegionChangeIsAnimated;
  return v3;
}

- (BOOL)isChangingRegion
{
  return self->_regionChangeCount != 0;
}

- (void)checkAndResetRegionChangeCount
{
  self->_regionChangeCount = 0;
}

- (id)detailedDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[VKCameraController description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n\n"), v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("_vkCamera: %@\n"), self->_vkCamera);
  objc_msgSend(v5, "appendFormat:", CFSTR("_animating: %d\n"), -[VKCameraController isAnimating](self, "isAnimating"));
  objc_msgSend(v5, "appendFormat:", CFSTR("_gesturing: %d\n"), -[VKCameraController isGesturing](self, "isGesturing"));
  objc_msgSend(v5, "appendFormat:", CFSTR("_regionChangeCount: %lu\n"), self->_regionChangeCount);
  return v5;
}

- (CGPoint)scaledScreenPointForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[VKCameraController canvas](self, "canvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;

  v10 = x / v7;
  v11 = 1.0 - y / v9;
  v12 = v10;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (Matrix<int,)cursorFromScreenPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  uint64_t v14;

  y = a3.y;
  x = a3.x;
  -[VKCameraController canvas](self, "canvas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentScale");
  v8 = v7;

  -[VKCameraController canvas](self, "canvas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  -[VKCameraController canvas](self, "canvas");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = (int)((v8 - y * v8) * v13);

  return (Matrix<int, 2, 1>)((int)(v8 * x * v11) | (unint64_t)(v14 << 32));
}

- (void)setEdgeInsetsAnimating:(BOOL)a3
{
  self->_edgeInsetsAnimating = a3;
}

- (BOOL)edgeInsetsAnimating
{
  return self->_edgeInsetsAnimating;
}

- (double)minimumZoomLevel
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 21.0;
}

- (double)maximumZoomLevel
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 21.0;
}

- (double)currentZoomLevel
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 21.0;
}

- (double)topDownMinimumZoomLevel
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 21.0;
}

- (double)zoomLevelAdjustmentForTileSize:(int64_t)a3
{
  int v3;
  int v4;
  int v5;

  v3 = a3;
  v4 = -[VKCameraController tileSize](self, "tileSize");
  v5 = 0;
  if (v4 && v3)
  {
    if (v3 >= v4)
    {
      v5 = 0;
    }
    else
    {
      v5 = 0;
      do
      {
        ++v5;
        v3 *= 2;
      }
      while (v3 < v4);
    }
    while (v3 > v4)
    {
      --v5;
      v4 *= 2;
    }
  }
  return (double)v5;
}

- (double)minimumZoomLevelForTileSize:(int64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[VKCameraController minimumZoomLevel](self, "minimumZoomLevel");
  v6 = v5;
  -[VKCameraController zoomLevelAdjustmentForTileSize:](self, "zoomLevelAdjustmentForTileSize:", a3);
  return v7 + v6;
}

- (BOOL)canZoomInForTileSize:(int64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[VKCameraController maximumZoomLevelForTileSize:](self, "maximumZoomLevelForTileSize:");
  v6 = v5;
  -[VKCameraController currentZoomLevelForTileSize:](self, "currentZoomLevelForTileSize:", a3);
  return vabdd_f64(v7, v6) >= 0.8;
}

- (BOOL)canZoomOutForTileSize:(int64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[VKCameraController minimumZoomLevelForTileSize:](self, "minimumZoomLevelForTileSize:");
  v6 = v5;
  -[VKCameraController currentZoomLevelForTileSize:](self, "currentZoomLevelForTileSize:", a3);
  return vabdd_f64(v7, v6) >= 0.8;
}

- (int64_t)tileSize
{
  return 0;
}

- (BOOL)canPitch
{
  return 1;
}

- (BOOL)canRotate
{
  return 1;
}

- (BOOL)isPitched
{
  return 1;
}

- (BOOL)isFullyPitched
{
  return 0;
}

- (BOOL)isRotated
{
  return 1;
}

- (unint64_t)regionChangeCount
{
  return self->_regionChangeCount;
}

- (GEOMapRegion)mapRegionIgnoringEdgeInsets
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  id v11;

  -[VKCameraController canvas](self, "canvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  if (v4 == 0.0)
  {

    goto LABEL_5;
  }
  -[VKCameraController canvas](self, "canvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;

  if (v7 == 0.0)
  {
LABEL_5:
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D27208]), "initWithCoordinateRegion:", 0.0, 0.0, 90.0, 180.0);
    return (GEOMapRegion *)v9;
  }
  -[VKCameraController vkCamera](self, "vkCamera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  VKCameraCalculateEnclosingRegion(v8, &v11, 0, 0.0, 0.0, 0.0, 0.0);
  v9 = v11;

  return (GEOMapRegion *)v9;
}

- (void)setCenterCoordinate:(id)a3
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.var0, a3.var1);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v2 = 0.0;
  v3 = 0.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setDistanceFromCenterCoordinate:(double)a3
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3);
}

- (double)distanceFromCenterCoordinate
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (void)setHeading:(double)a3
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3);
}

- (double)heading
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (double)presentationHeading
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (void)setPitch:(double)a3
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3);
}

- (double)pitch
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (double)minPitch
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (double)maxPitch
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (double)altitude
{
  -[VKCameraController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (BOOL)centerCoordinate:(id *)a3 andDistanceFromCenter:(double *)a4 forMapRegion:(id)a5
{
  return 0;
}

- (void)populateDebugNode:(void *)a3 withOptions:(const void *)a4
{
  id v5;
  const std::string::value_type *v6;
  uint64_t v7;
  std::string __p;
  int v9;
  char v10[32];

  v10[23] = 20;
  strcpy(v10, "Detailed Description");
  -[VKCameraController detailedDescription](self, "detailedDescription", a3, a4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const std::string::value_type *)objc_msgSend(v5, "UTF8String");
  memset(&__p, 0, sizeof(__p));
  v9 = 4;
  if (v6)
  {
    std::string::__assign_external(&__p, v6);
  }
  else
  {
    *((_BYTE *)&__p.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&__p, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v10, (uint64_t)&v7);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

}

- (BOOL)staysCenteredDuringPinch
{
  return self->_staysCenteredDuringPinch;
}

- (void)setStaysCenteredDuringPinch:(BOOL)a3
{
  self->_staysCenteredDuringPinch = a3;
}

- (BOOL)staysCenteredDuringRotation
{
  return self->_staysCenteredDuringRotation;
}

- (void)setStaysCenteredDuringRotation:(BOOL)a3
{
  self->_staysCenteredDuringRotation = a3;
}

- (BOOL)isRotateEnabled
{
  return self->_isRotateEnabled;
}

- (void)setIsRotateEnabled:(BOOL)a3
{
  self->_isRotateEnabled = a3;
}

- (void)mapDataAccess
{
  return self->_mapDataAccess;
}

@end
