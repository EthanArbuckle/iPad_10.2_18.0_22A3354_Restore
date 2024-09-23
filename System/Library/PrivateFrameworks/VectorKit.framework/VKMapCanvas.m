@implementation VKMapCanvas

+ (BOOL)supportsMapType:(int)a3 scale:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  void *v16;
  BOOL v17;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeTileGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 1;
  switch(a3)
  {
    case 0:
    case 5:
    case 6:
    case 7:
    case 8:
      break;
    case 1:
      objc_msgSend(v7, "activeTileSetForTileType:scale:", 7, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
      objc_msgSend(v7, "activeTileSetForTileType:scale:", 7, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "activeTileSetForTileType:scale:", 20, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "activeTileSetForTileType:scale:", 6, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        v13 = v11 == 0;
      else
        v13 = 1;
      v8 = !v13 || v12 != 0;
      break;
    case 3:
    case 10:
      objc_msgSend(v7, "activeTileSetForTileType:scale:", 92, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v8 = v9 != 0;

      break;
    case 4:
      objc_msgSend(v7, "activeTileSetForTileType:scale:", 92, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "activeTileSetForTileType:scale:", 66, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v17 = v16 == 0;
      else
        v17 = 1;
      v8 = !v17;
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (id)annotationCoordinateTest
{
  if (-[VKMapCanvas _isGlobeActive](self, "_isGlobeActive"))
    -[VKMapCanvas globeAnnotationCoordinateTest](self, "globeAnnotationCoordinateTest");
  else
    -[VKCamera annotationCoordinateTest](self->super._vkCamera._obj, "annotationCoordinateTest");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  id WeakRetained;
  VKCamera *v8;
  _QWORD *mapEngine;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  __shared_weak_count *cntrl;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  Camera *ptr;
  __shared_weak_count *v29;
  objc_super v30;
  _BYTE v31[24];
  _BYTE *v32;
  _QWORD v33[3];
  _QWORD *v34;
  _QWORD v35[3];
  _QWORD *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_consoleFpsUpdateTicker);
  objc_msgSend(WeakRetained, "processLocationUpdates");

  v30.receiver = self;
  v30.super_class = (Class)VKMapCanvas;
  -[VKScreenCanvas updateWithTimestamp:withContext:](&v30, sel_updateWithTimestamp_withContext_, a4, a3);
  if (-[VKCameraController usesVKCamera](self->super._cameraController, "usesVKCamera"))
  {
    v8 = self->super._vkCamera._obj;
    v36 = 0;
    mapEngine = self->super._mapEngine;
    if (!mapEngine)
      goto LABEL_25;
    v10 = mapEngine[149];
    if (!v10)
      goto LABEL_25;
    if (*(_BYTE *)(v10 + 488) && (v11 = *(_QWORD *)(v10 + 480)) != 0)
    {
      if (v11 == v10 + 456)
      {
        v34 = v33;
        (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)(v10 + 456) + 24))(v10 + 456, v33);
LABEL_10:
        v13 = v36;
        v36 = 0;
        if (v13 == v35)
        {
          v14 = 4;
          v13 = v35;
        }
        else
        {
          if (!v13)
          {
LABEL_15:
            if (!v34)
            {
              v36 = 0;
              goto LABEL_25;
            }
            if (v34 != v33)
            {
              v36 = v34;
              goto LABEL_25;
            }
            v36 = v35;
            (*(void (**)(_QWORD *, _QWORD *))(v33[0] + 24))(v33, v35);
            v15 = v34;
            if (v34 == v33)
            {
              v16 = 4;
              v15 = v33;
            }
            else
            {
              if (!v34)
                goto LABEL_25;
              v16 = 5;
            }
            (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_25:
            cntrl = self->super._camera.__cntrl_;
            ptr = self->super._camera.__ptr_;
            v29 = cntrl;
            if (cntrl)
            {
              v18 = (unint64_t *)((char *)cntrl + 8);
              do
                v19 = __ldxr(v18);
              while (__stxr(v19 + 1, v18));
            }
            v20 = (uint64_t)v36;
            if (v36)
            {
              if (v36 == v35)
              {
                v32 = v31;
                (*(void (**)(_QWORD *, _BYTE *))(v35[0] + 24))(v35, v31);
LABEL_33:
                -[VKCamera updateCamera:withAdjustment:](v8, "updateCamera:withAdjustment:", &ptr, v31);
                v21 = v32;
                if (v32 == v31)
                {
                  v22 = 4;
                  v21 = v31;
                }
                else
                {
                  if (!v32)
                    goto LABEL_38;
                  v22 = 5;
                }
                (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_38:
                v23 = (std::__shared_weak_count *)v29;
                if (v29)
                {
                  v24 = (unint64_t *)((char *)v29 + 8);
                  do
                    v25 = __ldaxr(v24);
                  while (__stlxr(v25 - 1, v24));
                  if (!v25)
                  {
                    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
                    std::__shared_weak_count::__release_weak(v23);
                  }
                }
                v26 = v36;
                if (v36 == v35)
                {
                  v27 = 4;
                  v26 = v35;
                }
                else
                {
                  if (!v36)
                  {
LABEL_48:

                    return;
                  }
                  v27 = 5;
                }
                (*(void (**)(void))(*v26 + 8 * v27))();
                goto LABEL_48;
              }
              v20 = (*(uint64_t (**)(_QWORD *))(*v36 + 16))(v36);
            }
            v32 = (_BYTE *)v20;
            goto LABEL_33;
          }
          v14 = 5;
        }
        (*(void (**)(void))(*v13 + 8 * v14))();
        goto LABEL_15;
      }
      v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
    }
    else
    {
      v12 = 0;
    }
    v34 = (_QWORD *)v12;
    goto LABEL_10;
  }
}

- (id)annotationRectTest
{
  if (-[VKMapCanvas _isGlobeActive](self, "_isGlobeActive"))
    -[VKMapCanvas globeAnnotationRectTest](self, "globeAnnotationRectTest");
  else
    -[VKCamera annotationRectTest](self->super._vkCamera._obj, "annotationRectTest");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setPuckAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_consoleFpsUpdateTicker, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_forceRasterizationForGlobe, a3);
}

- (CGPoint)convertCoordinateToPoint:(id)a3
{
  double var0;
  long double v5;
  long double v6;
  float64x2_t v7;
  double v13;
  double v14;
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
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  double v31;
  double v32;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double var1;
  float64x2_t v39;
  uint64_t v40;
  CGPoint result;

  var1 = a3.var1;
  var0 = a3.var0;
  if (-[VKCameraController usesVKCamera](self->super._cameraController, "usesVKCamera"))
  {
    v5 = tan(var0 * 0.00872664626 + 0.785398163);
    v6 = log(v5);
    v7.f64[0] = var1;
    v7.f64[1] = v6;
    __asm { FMOV            V1.2D, #0.5 }
    v39 = vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v7);
    v40 = 0;
    -[VKCamera screenPointFromGroundPoint:](self->super._vkCamera._obj, "screenPointFromGroundPoint:", &v39);
    v14 = v13;
    v16 = v15 * 0.5 + 0.5;
    -[MDRenderTarget size](self->super._displayTarget, "size");
    v18 = v17 * v16;
    -[MDRenderTarget size](self->super._displayTarget, "size");
    v20 = v19 * (0.5 - v14 * 0.5);
  }
  else
  {
    -[MDRenderTarget size](self->super._displayTarget, "size");
    v22 = v21;
    -[MDRenderTarget size](self->super._displayTarget, "size");
    v24 = v23 * v22;
    v18 = 0.0;
    v20 = 0.0;
    if (v24 > 0.0)
    {
      v39.f64[0] = var0 * 0.0174532925;
      v39.f64[1] = var1 * 0.0174532925;
      v40 = 0;
      v25 = *(_QWORD *)(-[VKScreenCanvas mapEngine](self, "mapEngine") + 904);
      v26 = -[VKScreenCanvas mapEngine](self, "mapEngine");
      v27 = v26[133];
      v28 = (std::__shared_weak_count *)v26[134];
      if (v28)
      {
        p_shared_owners = (unint64_t *)&v28->__shared_owners_;
        do
          v30 = __ldxr(p_shared_owners);
        while (__stxr(v30 + 1, p_shared_owners));
        gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(v25 + 16), v39.f64, (uint64_t *)(v27 + 8));
        v18 = v31;
        v20 = v32;
        do
          v33 = __ldaxr(p_shared_owners);
        while (__stlxr(v33 - 1, p_shared_owners));
        if (!v33)
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
        }
      }
      else
      {
        gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(v25 + 16), v39.f64, (uint64_t *)(v27 + 8));
        v18 = v34;
        v20 = v35;
      }
    }
  }
  v36 = v18;
  v37 = v20;
  result.y = v37;
  result.x = v36;
  return result;
}

- (VKMapCanvas)initWithMapEngine:(void *)a3 inBackground:(BOOL)a4
{
  VKMapCanvas *v4;
  VKMapCanvas *v5;
  VKMapCanvas *v6;
  double v12;
  double v13;
  uint64_t v14;
  VKMapCanvas *p_canonicalSkyHeight;
  unint64_t *v16;
  objc_class *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *ptr;
  unint64_t *p_shared_owners;
  unint64_t v22;
  void *v23;
  VKMapCanvas *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)VKMapCanvas;
  v4 = -[VKScreenCanvas initWithMapEngine:inBackground:](&v26, sel_initWithMapEngine_inBackground_, a3, a4);
  v5 = v4;
  v6 = v4;
  if (v4)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    v4->_lastCanvasSize = _Q0;
    -[MDRenderTarget size](v4->super._displayTarget, "size");
    if (v12 > 0.0)
    {
      -[MDRenderTarget size](v6->super._displayTarget, "size");
      if (v13 > 0.0)
        -[VKMapCanvas updateCameraForFrameResize](v6, "updateCameraForFrameResize");
    }
    v6->_horizontalOffsetAnimation = 0;
    v14 = *((_QWORD *)v6->super._mapEngine + 112);
    p_canonicalSkyHeight = (VKMapCanvas *)&v5->_canonicalSkyHeight;
    v17 = *(objc_class **)(v14 + 272);
    v16 = *(unint64_t **)(v14 + 280);
    if (v16)
    {
      v18 = v16 + 1;
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
    ptr = (std::__shared_weak_count *)v5->_overlayContainer.__ptr_;
    p_canonicalSkyHeight->super.super.isa = v17;
    p_canonicalSkyHeight->super._mapEngine = v16;
    if (ptr)
    {
      p_shared_owners = (unint64_t *)&ptr->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))ptr->__on_zero_shared)(ptr);
        std::__shared_weak_count::__release_weak(ptr);
      }
    }
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:forKeyPath:options:context:", v6, CFSTR("preserveModelTile"), 0, _PreserveModelTileKVOContext);

    v24 = v6;
  }

  return v6;
}

- (void)setMapType:(int)a3 animated:(BOOL)a4
{
  double v5;
  double v6;
  double v7;

  -[MDRenderTarget size](self->super._displayTarget, "size", *(_QWORD *)&a3, a4);
  v6 = v5;
  -[MDRenderTarget size](self->super._displayTarget, "size");
  if (v7 * v6 > 0.0)
    -[VKCameraController updateCameraToPositionOrientationLimits](self->super._cameraController, "updateCameraToPositionOrientationLimits", v7 * v6);
}

- (void)updateCameraForFrameResize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double width;
  double height;
  BOOL v10;
  float v11;
  float v12;
  float v13;
  double v14;
  double v15;
  VKCamera *v16;
  void *v17;
  double v18;
  double v19;
  VKCamera *v20;
  VKCamera *v21;
  optional<float> *p_lastValidCanvasSizeZoomLevel;
  int v23;
  VKCamera *v24;
  uint64_t v25;
  __int128 v26;
  double v27;
  float64x2_t v28;
  __int128 v29;
  objc_super v30;
  float64x2_t v31;
  double v32;
  float64x2_t v33[2];

  -[MDRenderTarget size](self->super._displayTarget, "size");
  v4 = v3;
  v6 = v5;
  width = self->_lastCanvasSize.width;
  height = self->_lastCanvasSize.height;
  if (width != v4 || height != v6)
  {
    v10 = v4 > 0.0;
    if (v6 <= 0.0)
      v10 = 0;
    if (width <= 0.0)
    {
      if (!v10)
        goto LABEL_28;
    }
    else
    {
      if (!v10)
      {
        if (height > 0.0)
        {
          -[VKMapCanvas _zoomLevelForCanvasSize:](self, "_zoomLevelForCanvasSize:");
          p_lastValidCanvasSizeZoomLevel = &self->_lastValidCanvasSizeZoomLevel;
          if (LOBYTE(v33[0].f64[0]))
          {
            v23 = HIDWORD(v33[0].f64[0]);
            if (!self->_lastValidCanvasSizeZoomLevel._hasValue)
              p_lastValidCanvasSizeZoomLevel->_hasValue = 1;
            *((_DWORD *)&self->_lastValidCanvasSizeZoomLevel._hasValue + 1) = v23;
          }
          else if (self->_lastValidCanvasSizeZoomLevel._hasValue)
          {
            p_lastValidCanvasSizeZoomLevel->_hasValue = 0;
          }
        }
        goto LABEL_28;
      }
      if (height > 0.0)
      {
        -[VKMapCanvas _zoomLevelForCanvasSize:](self, "_zoomLevelForCanvasSize:");
        if (LOBYTE(v33[0].f64[0]))
        {
          v11 = *((float *)v33[0].f64 + 1);
LABEL_15:
          -[VKCameraController beginRegionChange:](self->super._cameraController, "beginRegionChange:", 0);
          v12 = v4 * 0.001953125;
          v13 = log2f(v12);
          -[VKCamera depthForViewWidth:](self->super._vkCamera._obj, "depthForViewWidth:", (double)exp2((float)(v13 - v11)));
          v15 = v14;
          v16 = self->super._vkCamera._obj;
          -[VKCamera footprint](v16, "footprint");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "maxDepth");
          v19 = v18;

          v20 = self->super._vkCamera._obj;
          v21 = v20;
          if (v20)
            -[VKCamera groundPointFromScreenPoint:](v20, "groundPointFromScreenPoint:", 0.5, 0.5);
          else
            memset(v33, 0, sizeof(v33));

          if (LOBYTE(v33[0].f64[0]))
          {
            v24 = self->super._vkCamera._obj;
            v25 = -[VKCamera position](v24, "position");
            *(double *)&v26 = 1.0 - v15 / v19;
            v29 = v26;
            v27 = *(double *)(v25 + 16);
            v28 = *(float64x2_t *)v25;

            v31 = vmlaq_n_f64(v28, vsubq_f64(*(float64x2_t *)((char *)v33 + 8), v28), *(double *)&v29);
            v32 = v27 + (v33[1].f64[1] - v27) * *(double *)&v29;
            -[VKCamera setPosition:](self->super._vkCamera._obj, "setPosition:", &v31);
          }
          -[VKCameraController updateCameraToPositionOrientationLimits](self->super._cameraController, "updateCameraToPositionOrientationLimits", *(_OWORD *)&v28, v29);
          -[VKCameraController endRegionChange](self->super._cameraController, "endRegionChange");
          if (!self->_lastValidCanvasSizeZoomLevel._hasValue)
            self->_lastValidCanvasSizeZoomLevel._hasValue = 1;
          *((float *)&self->_lastValidCanvasSizeZoomLevel._hasValue + 1) = v11;
          goto LABEL_28;
        }
        goto LABEL_28;
      }
    }
    if (self->_lastValidCanvasSizeZoomLevel._hasValue)
    {
      v11 = *((float *)&self->_lastValidCanvasSizeZoomLevel._hasValue + 1);
      goto LABEL_15;
    }
LABEL_28:
    self->_lastCanvasSize.width = v4;
    self->_lastCanvasSize.height = v6;
    v30.receiver = self;
    v30.super_class = (Class)VKMapCanvas;
    -[VKScreenCanvas updateCameraForFrameResize](&v30, sel_updateCameraForFrameResize);
    -[VKMapCanvas setCanonicalSkyHeight:](self, "setCanonicalSkyHeight:", *(double *)&self->_horizontalOffsetAnimation);
  }
}

- (void)setCanonicalSkyHeight:(double)a3
{
  double v4;
  double v5;
  VKTimedAnimation *horizontalOffsetAnimation;
  void *v7;
  id v8;

  *(double *)&self->_horizontalOffsetAnimation = a3;
  -[MDRenderTarget size](self->super._displayTarget, "size");
  if (v4 > 0.0)
  {
    v5 = v4;
    horizontalOffsetAnimation = self->_horizontalOffsetAnimation;
    -[VKScreenCanvas cameraController](self, "cameraController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vkCamera");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFractionOfScreenAboveFarClipPlaneAtCanonicalPitch:", *(double *)&horizontalOffsetAnimation / v5);

  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 688) = 0;
  *((_QWORD *)self + 89) = 0;
  *((_QWORD *)self + 90) = 0;
  return self;
}

- (BOOL)_isGlobeActive
{
  _QWORD *mapEngine;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL result;
  BOOL v10;
  int v11;
  BOOL v12;

  mapEngine = self->super._mapEngine;
  if (!mapEngine)
    return 0;
  v3 = *((unsigned __int8 *)mapEngine + 1241);
  v4 = (uint64_t *)mapEngine[141];
  v5 = *v4;
  v6 = v4[1];
  if (!v3)
    goto LABEL_14;
  v7 = v5;
  if (v5 != v6)
  {
    v7 = v5;
    while (*(_BYTE *)v7 != 20)
    {
      v7 += 16;
      if (v7 == v6)
        goto LABEL_14;
    }
  }
  if (v7 == v6
    || ((v8 = *(_DWORD *)(v7 + 8), result = 1, v10 = v8 > 0xA, v11 = (1 << v8) & 0x418, !v10)
      ? (v12 = v11 == 0)
      : (v12 = 1),
        v12))
  {
LABEL_14:
    if (v5 != v6)
    {
      while (*(_BYTE *)v5 != 22)
      {
        v5 += 16;
        if (v5 == v6)
          return 0;
      }
      if (v5 != v6)
        return *(_QWORD *)(v5 + 8) != 0;
    }
    return 0;
  }
  return result;
}

- (NSArray)visibleTileSets
{
  void *v3;
  _QWORD *mapEngine;
  int8x8_t *v5;
  int8x8_t v6;
  uint8x8_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  char *v21;
  char *i;
  id v23;
  id v24;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  _QWORD *v29;
  void *v30;
  char *v31;
  char *v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  _QWORD v39[2];
  uint64_t (**v40)(gdc::ResourceStatusContainer *__hidden, const gdc::ResourceKey *);
  void *__p[2];
  void *v42[2];
  int v43;
  _QWORD **v44;
  _QWORD *v45[2];
  void *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  char v52[24];
  _QWORD *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v3;
  mapEngine = self->super._mapEngine;
  if (!mapEngine)
    goto LABEL_30;
  v5 = (int8x8_t *)mapEngine[140];
  v6 = v5[2];
  if (!*(_QWORD *)&v6)
    goto LABEL_30;
  v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    v8 = 0x2B7C4502BD3C99C6;
    if (*(_QWORD *)&v6 <= 0x2B7C4502BD3C99C6uLL)
      v8 = 0x2B7C4502BD3C99C6uLL % *(_QWORD *)&v6;
  }
  else
  {
    v8 = (*(_QWORD *)&v6 - 1) & 0x2B7C4502BD3C99C6;
  }
  v9 = *(_QWORD **)(*(_QWORD *)&v5[1] + 8 * v8);
  if (!v9)
    goto LABEL_30;
  v10 = (_QWORD *)*v9;
  if (!v10)
    goto LABEL_30;
  if (v7.u32[0] < 2uLL)
  {
    v11 = *(_QWORD *)&v6 - 1;
    while (1)
    {
      v13 = v10[1];
      if (v13 == 0x2B7C4502BD3C99C6)
      {
        if (v10[2] == 0x2B7C4502BD3C99C6)
          goto LABEL_23;
      }
      else if ((v13 & v11) != v8)
      {
        goto LABEL_30;
      }
      v10 = (_QWORD *)*v10;
      if (!v10)
        goto LABEL_30;
    }
  }
  while (1)
  {
    v12 = v10[1];
    if (v12 == 0x2B7C4502BD3C99C6)
      break;
    if (v12 >= *(_QWORD *)&v6)
      v12 %= *(_QWORD *)&v6;
    if (v12 != v8)
      goto LABEL_30;
LABEL_12:
    v10 = (_QWORD *)*v10;
    if (!v10)
      goto LABEL_30;
  }
  if (v10[2] != 0x2B7C4502BD3C99C6)
    goto LABEL_12;
LABEL_23:
  v14 = v10[5];
  if (!v14
    || (v15 = *(_QWORD *)(mapEngine[112] + 24), v50 = *(_QWORD *)(v15 + 56), (v16 = *(uint64_t **)(v14 + 120)) == 0))
  {
LABEL_30:
    v23 = v3;
    v24 = v23;
    goto LABEL_31;
  }
  v17 = *v16;
  v18 = *(_QWORD *)(*v16 + 112);
  v19 = *(_QWORD *)(v17 + 120);
  if (v18 != v19)
  {
    while (*(_WORD *)v18)
    {
      v18 += 112;
      if (v18 == v19)
      {
        v18 = v19;
        break;
      }
    }
  }
  v49 = *(_QWORD *)(v18 + 104);
  v46 = 0;
  v47 = 0;
  v48 = 0;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v42 = 0u;
  v43 = 1065353216;
  v45[0] = 0;
  v45[1] = 0;
  v44 = v45;
  v39[0] = &v50;
  v39[1] = &v51;
  v40 = off_1E42B4698;
  v20 = operator new(0x28uLL);
  *v20 = &off_1E42C75E0;
  v20[1] = &v49;
  v20[2] = &v46;
  v20[3] = &v40;
  v20[4] = v39;
  v53 = v20;
  gdc::LayerDataManager::forEachLayer(*(__int16 **)(v15 + 8), *(__int16 **)(v15 + 16), (uint64_t)v52);
  (*(void (**)(_QWORD *))(*v20 + 40))(v20);
  v21 = (char *)v46;
  for (i = v47; i != v21; i -= 16)
  {
    v26 = (std::__shared_weak_count *)*((_QWORD *)i - 1);
    if (v26)
    {
      p_shared_owners = (unint64_t *)&v26->__shared_owners_;
      do
        v28 = __ldaxr(p_shared_owners);
      while (__stlxr(v28 - 1, p_shared_owners));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
  }
  v47 = v21;
  v24 = v51;
  std::__tree<gdc::ResourceKey,gdc::ResourceKeyLessThan,std::allocator<gdc::ResourceKey>>::destroy(v45[0]);
  v29 = v42[0];
  if (v42[0])
  {
    do
    {
      v34 = (_QWORD *)*v29;
      v35 = (void *)v29[3];
      if (v35 != (void *)v29[5])
        free(v35);
      operator delete(v29);
      v29 = v34;
    }
    while (v34);
  }
  v30 = __p[0];
  __p[0] = 0;
  if (v30)
    operator delete(v30);
  v31 = (char *)v46;
  if (v46)
  {
    v32 = v47;
    v33 = v46;
    if (v47 != v46)
    {
      do
      {
        v36 = (std::__shared_weak_count *)*((_QWORD *)v32 - 1);
        if (v36)
        {
          v37 = (unint64_t *)&v36->__shared_owners_;
          do
            v38 = __ldaxr(v37);
          while (__stlxr(v38 - 1, v37));
          if (!v38)
          {
            ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
            std::__shared_weak_count::__release_weak(v36);
          }
        }
        v32 -= 16;
      }
      while (v32 != v31);
      v33 = v46;
    }
    v47 = v31;
    operator delete(v33);
  }
  v23 = v51;
LABEL_31:

  return (NSArray *)v24;
}

- (id)attributionsForCurrentRegion
{
  _QWORD *mapEngine;
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
  md::SceneContext *v13;
  uint64_t *v14;
  uint64_t *v15;
  _QWORD *v16;
  void *v17;
  std::__shared_weak_count *v19;
  uint64_t v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  char v28;
  id v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  BOOL v34;
  std::__shared_weak_count *v35;

  mapEngine = self->super._mapEngine;
  if (mapEngine)
  {
    v3 = (int8x8_t *)mapEngine[140];
    v4 = v3[2];
    if (v4)
    {
      v5 = (uint8x8_t)vcnt_s8(v4);
      v5.i16[0] = vaddlv_u8(v5);
      if (v5.u32[0] > 1uLL)
      {
        v6 = 0x2B7C4502BD3C99C6;
        if (*(_QWORD *)&v4 <= 0x2B7C4502BD3C99C6uLL)
          v6 = 0x2B7C4502BD3C99C6uLL % *(_QWORD *)&v4;
      }
      else
      {
        v6 = (*(_QWORD *)&v4 - 1) & 0x2B7C4502BD3C99C6;
      }
      v7 = *(_QWORD **)(*(_QWORD *)&v3[1] + 8 * v6);
      if (v7)
      {
        v8 = (_QWORD *)*v7;
        if (v8)
        {
          if (v5.u32[0] < 2uLL)
          {
            v9 = *(_QWORD *)&v4 - 1;
            while (1)
            {
              v11 = v8[1];
              if (v11 == 0x2B7C4502BD3C99C6)
              {
                if (v8[2] == 0x2B7C4502BD3C99C6)
                  goto LABEL_23;
              }
              else if ((v11 & v9) != v6)
              {
                goto LABEL_27;
              }
              v8 = (_QWORD *)*v8;
              if (!v8)
                goto LABEL_27;
            }
          }
          while (1)
          {
            v10 = v8[1];
            if (v10 == 0x2B7C4502BD3C99C6)
              break;
            if (v10 >= *(_QWORD *)&v4)
              v10 %= *(_QWORD *)&v4;
            if (v10 != v6)
              goto LABEL_27;
LABEL_12:
            v8 = (_QWORD *)*v8;
            if (!v8)
              goto LABEL_27;
          }
          if (v8[2] != 0x2B7C4502BD3C99C6)
            goto LABEL_12;
LABEL_23:
          v12 = v8[5];
          if (v12)
          {
            v13 = *(md::SceneContext **)(v12 + 120);
            if (v13)
            {
              v14 = md::SceneContext::layerDataInView(v13, 27);
              v15 = v14 + 1;
              v16 = (_QWORD *)*v14;
              if ((uint64_t *)*v14 != v14 + 1)
              {
                v17 = 0;
                while (1)
                {
                  v20 = v16[4];
                  v19 = (std::__shared_weak_count *)v16[5];
                  v35 = v19;
                  if (v19)
                  {
                    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
                    do
                      v22 = __ldxr(p_shared_owners);
                    while (__stxr(v22 + 1, p_shared_owners));
                  }
                  if (v20)
                  {
                    v23 = *(_QWORD *)(v20 + 720);
                    if (v23)
                    {
                      v24 = *(_QWORD *)(v23 + 24);
                      v25 = *(_QWORD *)(v23 + 32);
                      if (v24 != v25)
                      {
                        if (v17)
                        {
                          if (v24 == v25)
                            goto LABEL_45;
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0C99DE8], "array", v20);
                          v17 = (void *)objc_claimAutoreleasedReturnValue();
                          v26 = *(_QWORD *)(v20 + 720);
                          v24 = *(_QWORD *)(v26 + 24);
                          v25 = *(_QWORD *)(v26 + 32);
                          if (v24 == v25)
                            goto LABEL_45;
                        }
                        do
                        {
                          v27 = *(id *)(v24 + 8);
                          v28 = objc_msgSend(v17, "containsObject:", v27);

                          if ((v28 & 1) == 0)
                          {
                            v29 = *(id *)(v24 + 8);
                            objc_msgSend(v17, "addObject:", v29);

                          }
                          v24 += 24;
                        }
                        while (v24 != v25);
                        v19 = v35;
                      }
                    }
                  }
                  if (!v19)
                    goto LABEL_49;
LABEL_45:
                  v30 = (unint64_t *)&v19->__shared_owners_;
                  do
                    v31 = __ldaxr(v30);
                  while (__stlxr(v31 - 1, v30));
                  if (!v31)
                  {
                    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
                    std::__shared_weak_count::__release_weak(v19);
                    v32 = (uint64_t *)v16[1];
                    if (!v32)
                    {
                      do
                      {
LABEL_53:
                        v33 = (uint64_t *)v16[2];
                        v34 = *v33 == (_QWORD)v16;
                        v16 = v33;
                      }
                      while (!v34);
                      goto LABEL_29;
                    }
                  }
                  else
                  {
LABEL_49:
                    v32 = (uint64_t *)v16[1];
                    if (!v32)
                      goto LABEL_53;
                  }
                  do
                  {
                    v33 = v32;
                    v32 = (uint64_t *)*v32;
                  }
                  while (v32);
LABEL_29:
                  v16 = v33;
                  if (v33 == v15)
                    return v17;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_27:
  v17 = 0;
  return v17;
}

- (void)setMapType:(int)a3
{
  -[VKMapCanvas setMapType:animated:](self, "setMapType:animated:", *(_QWORD *)&a3, 1);
}

- (void)transferStateFromCanvas:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VKMapCanvas;
  -[VKScreenCanvas transferStateFromCanvas:](&v5, sel_transferStateFromCanvas_, v4);
  -[VKCameraController beginRegionChange:](self->super._cameraController, "beginRegionChange:", 0);
  -[VKCameraController updateCameraToPositionOrientationLimits](self->super._cameraController, "updateCameraToPositionOrientationLimits");
  -[VKCameraController endRegionChange](self->super._cameraController, "endRegionChange");

}

- (void)dealloc
{
  void *v3;
  double type;
  objc_super v5;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("preserveModelTile"));

  objc_msgSend(*(id *)&self->_lastValidCanvasSizeZoomLevel._value.type, "stop");
  type = self->_lastValidCanvasSizeZoomLevel._value.type;
  self->_lastValidCanvasSizeZoomLevel._value.type = 0.0;

  v5.receiver = self;
  v5.super_class = (Class)VKMapCanvas;
  -[VKScreenCanvas dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  __int16 *v18;
  __int16 *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;
  uint64_t v24;
  uint64_t v25;
  __int16 v26;
  _QWORD v27[3];
  _QWORD *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)_PreserveModelTileKVOContext == a6)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "preserveModelTile");

    if (v14)
    {
      v15 = *((_QWORD *)self->super._mapEngine + 112);
      v16 = *(_QWORD *)(v15 + 24);
      v27[0] = &off_1E42C7DC0;
      v27[1] = v15;
      v17 = v27;
      v28 = v27;
      v18 = *(__int16 **)(v16 + 8);
      v19 = *(__int16 **)(v16 + 16);
      if (v18 == v19)
      {
        v22 = 4;
      }
      else
      {
        do
        {
          v20 = *((_QWORD *)v18 + 1);
          v21 = *((_QWORD *)v18 + 2);
          v26 = *v18;
          v24 = v21;
          v25 = v20;
          if (!v28)
            std::__throw_bad_function_call[abi:nn180100]();
          (*(void (**)(_QWORD *, __int16 *, uint64_t *, uint64_t *))(*v28 + 48))(v28, &v26, &v25, &v24);
          v18 += 12;
        }
        while (v18 != v19);
        v17 = v28;
        if (v28 == v27)
        {
          v22 = 4;
          v17 = v27;
        }
        else
        {
          if (!v28)
            goto LABEL_13;
          v22 = 5;
        }
      }
      (*(void (**)(void))(*v17 + 8 * v22))();
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)VKMapCanvas;
    -[VKMapCanvas observeValueForKeyPath:ofObject:change:context:](&v23, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
LABEL_13:

}

- (id)detailedDescription
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[VKMapCanvas description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n\n"), v4);

  -[MDRenderTarget sizeInPixels](self->super._displayTarget, "sizeInPixels");
  v7 = v6;
  -[MDRenderTarget sizeInPixels](self->super._displayTarget, "sizeInPixels");
  objc_msgSend(v5, "appendFormat:", CFSTR("Canvas size: (%f, %f)\n"), v7, v8);
  -[VKCameraController detailedDescription](self->super._cameraController, "detailedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Camera Controller:\n%@\n\n"), v9);

  return v5;
}

- (id)consoleString:(BOOL)a3
{
  char v4;
  double v5;
  int cntrl;
  void *mapEngine;
  _QWORD *v8;
  int8x8_t v9;
  uint8x8_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const Camera *v20;
  double v21;
  double v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  int v36;
  int v37;
  __CFString *v38;
  float v39;
  float v40;

  v4 = objc_opt_respondsToSelector();
  LODWORD(v5) = 0;
  if ((v4 & 1) != 0)
    -[MDRenderTarget averageFPS](self->super._displayTarget, "averageFPS", v5);
  cntrl = (int)self->_overlayContainer.__cntrl_;
  LODWORD(self->_overlayContainer.__cntrl_) = cntrl - 1;
  if (cntrl <= 0)
  {
    HIDWORD(self->_overlayContainer.__cntrl_) = LODWORD(v5);
    LODWORD(self->_overlayContainer.__cntrl_) = 10;
  }
  mapEngine = self->super._mapEngine;
  v8 = (_QWORD *)*((_QWORD *)mapEngine + 115);
  v9 = (int8x8_t)v8[1];
  if (!*(_QWORD *)&v9)
    goto LABEL_28;
  v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    v11 = 0x1AF456233693CD46;
    if (*(_QWORD *)&v9 <= 0x1AF456233693CD46uLL)
      v11 = 0x1AF456233693CD46uLL % *(_QWORD *)&v9;
  }
  else
  {
    v11 = (*(_QWORD *)&v9 - 1) & 0x1AF456233693CD46;
  }
  v12 = *(_QWORD **)(*v8 + 8 * v11);
  if (!v12)
    goto LABEL_28;
  v13 = (_QWORD *)*v12;
  if (!v13)
    goto LABEL_28;
  if (v10.u32[0] < 2uLL)
  {
    v14 = *(_QWORD *)&v9 - 1;
    while (1)
    {
      v16 = v13[1];
      if (v16 == 0x1AF456233693CD46)
      {
        if (v13[2] == 0x1AF456233693CD46)
          goto LABEL_26;
      }
      else if ((v16 & v14) != v11)
      {
        goto LABEL_28;
      }
      v13 = (_QWORD *)*v13;
      if (!v13)
        goto LABEL_28;
    }
  }
  while (1)
  {
    v15 = v13[1];
    if (v15 == 0x1AF456233693CD46)
      break;
    if (v15 >= *(_QWORD *)&v9)
      v15 %= *(_QWORD *)&v9;
    if (v15 != v11)
      goto LABEL_28;
LABEL_15:
    v13 = (_QWORD *)*v13;
    if (!v13)
      goto LABEL_28;
  }
  if (v13[2] != 0x1AF456233693CD46)
    goto LABEL_15;
LABEL_26:
  v17 = v13[5];
  if (*(_QWORD *)(v17 + 8) == 0x1AF456233693CD46)
  {
    v18 = *(_QWORD *)(v17 + 32);
    goto LABEL_29;
  }
LABEL_28:
  v18 = 0;
LABEL_29:
  v19 = *((id *)mapEngine + 105);
  objc_msgSend(v19, "size");
  v22 = v21;
  v23 = self->super._mapEngine;
  v24 = v23[140];
  v25 = *(_QWORD *)(v24 + 16);
  if ((v25 & (v25 - 1)) != 0)
  {
    v27 = 0x20A1ED17D78F322BLL;
    if (v25 <= 0x20A1ED17D78F322BLL)
      v27 = 0x20A1ED17D78F322BLL % v25;
    v28 = *(_QWORD **)(*(_QWORD *)(v24 + 8) + 8 * v27);
    do
    {
      do
        v28 = (_QWORD *)*v28;
      while (v28[1] != 0x20A1ED17D78F322BLL);
    }
    while (v28[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    v26 = *(_QWORD **)(*(_QWORD *)(v24 + 8) + 8 * ((v25 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        v26 = (_QWORD *)*v26;
      while (v26[1] != 0x20A1ED17D78F322BLL);
    }
    while (v26[2] != 0x20A1ED17D78F322BLL);
  }
  if (v18)
  {
    v29 = *(_QWORD *)(v23[112] + 312);
    v30 = *((float *)&self->_overlayContainer.__cntrl_ + 1);
    v31 = gdc::DisplayZoomLevel::centerZoomLevel((gdc::DisplayZoomLevel *)v18, v20);
    v32 = 0.0;
    if (v22 > 0.0)
    {
      v33 = v22;
      v34 = (float)v29;
      v32 = log2f(v33 / v34);
    }
    v35 = fminf(fmaxf(v31 + v32, 1.0), 25.0);
    if ((_DWORD)v29)
    {
      if ((int)v29 < 513)
      {
        v36 = 0;
        v37 = 512;
      }
      else
      {
        v36 = 0;
        v37 = 512;
        do
        {
          ++v36;
          v37 *= 2;
        }
        while (v37 < (int)v29);
      }
      while (v37 > (int)v29)
      {
        --v36;
        LODWORD(v29) = 2 * v29;
      }
    }
    else
    {
      v36 = 0;
    }
    v39 = fmaxf(v35 + (float)v36, 1.0);
    v40 = v39 * 10.0;
    if (v39 > 25.0)
      v40 = 250.0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f fps | Pitch: %.0f˚ | s: %.1f | n: %.1f\nlat: %f lon: %f alt: %f"), v30, *(double *)(v18 + 40) * 57.2957795, (float)(floorf(v40) * 0.1), (float)(floorf(v35 * 10.0) * 0.1), *(double *)(v18 + 8) * 57.2957795, *(double *)(v18 + 16) * 57.2957795, *(_QWORD *)(v18 + 32));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = CFSTR("Error");
  }

  return v38;
}

- (optional<float>)_zoomLevelForCanvasSize:(CGSize)a3
{
  float *v3;
  float *v4;
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  optional<float> result;

  v4 = v3;
  if (a3.width <= 0.0 || (height = a3.height, a3.height <= 0.0))
  {
    *(_BYTE *)v3 = 0;
  }
  else
  {
    width = a3.width;
    -[VKCamera footprint](self->super._vkCamera._obj, "footprint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxDepth");
    v10 = v9;

    -[VKCamera tanHalfVerticalFOV](self->super._vkCamera._obj, "tanHalfVerticalFOV");
    v12 = log2(width * v11 * (v10 + v10) / height);
    v13 = width * 0.001953125;
    v14 = log2f(v13) - v12;
    *(_BYTE *)v4 = 1;
    v4[1] = v14;
  }
  result._value = (ValueUnion)a2;
  result._hasValue = (char)self;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToMapPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  VKCamera *v8;
  VKCamera *v9;
  uint64_t v10;
  float64x2_t v11;
  _QWORD *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  __int128 v19;
  long double v20;
  long double v21;
  float v22;
  float v23;
  double v24;
  double v25;
  double y;
  double x;
  float64x2_t v28;
  __int128 v29;
  __int128 v30;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  y = a3.y;
  x = a3.x;
  if (-[VKCameraController usesVKCamera](self->super._cameraController, "usesVKCamera"))
  {
    -[MDRenderTarget size](self->super._displayTarget, "size");
    v5 = v4;
    -[MDRenderTarget size](self->super._displayTarget, "size");
    v7 = v6;
    v8 = self->super._vkCamera._obj;
    v9 = v8;
    if (v8)
    {
      -[VKCamera groundPointFromScreenPoint:](v8, "groundPointFromScreenPoint:", x / v5, 1.0 - y / v7);
    }
    else
    {
      v29 = 0u;
      v30 = 0u;
    }

    if ((_BYTE)v29)
    {
      v24 = *MEMORY[0x1E0D266F8] * *((double *)&v29 + 1);
      v25 = *(double *)(MEMORY[0x1E0D266F8] + 8) - *(double *)&v30 * *(double *)(MEMORY[0x1E0D266F8] + 8);
      goto LABEL_20;
    }
LABEL_19:
    v24 = *MEMORY[0x1E0D26678];
    v25 = *(double *)(MEMORY[0x1E0D26678] + 8);
    goto LABEL_20;
  }
  v10 = *(_QWORD *)(-[VKScreenCanvas mapEngine](self, "mapEngine") + 904);
  v11.f64[0] = x;
  v11.f64[1] = y;
  v28 = v11;
  v12 = -[VKScreenCanvas mapEngine](self, "mapEngine");
  v13 = v12[133];
  v14 = (std::__shared_weak_count *)v12[134];
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v16 = __ldxr(p_shared_owners);
    while (__stxr(v16 + 1, p_shared_owners));
  }
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v29, v10, v13 + 8, 0, v28);
  if (v14)
  {
    v17 = (unint64_t *)&v14->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v19 = v29;
  if (*(double *)&v29 == -3.14159265 && *((double *)&v29 + 1) == -3.14159265 && *(double *)&v30 == 0.0)
    goto LABEL_19;
  v20 = tan(*(double *)&v29 * 0.5 + 0.785398163);
  v21 = log(v20);
  v22 = *((double *)&v19 + 1) * 0.159154943 + 0.5;
  v23 = v21 * 0.159154943 + 0.5;
  v24 = *MEMORY[0x1E0D266F8] * v22;
  v25 = *(double *)(MEMORY[0x1E0D266F8] + 8) * (float)(1.0 - v23);
LABEL_20:
  result.var1 = v25;
  result.var0 = v24;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPointToCoordinate:(CGPoint)a3
{
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int8x8_t *v11;
  int8x8_t v12;
  double v13;
  uint8x8_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  float64x2_t v18;
  _QWORD *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  float64x2_t v24;
  double v25;
  unint64_t *v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  VKCamera *v34;
  double *v35;
  VKCamera *v36;
  uint64_t v37;
  double v38;
  double v39;
  long double v40;
  long double v41;
  long double v42;
  float64x2_t v43;
  float64x2_t v44;
  _QWORD *v45;
  unint64_t *p_shared_owners;
  unint64_t v47;
  double v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  VKCameraController *cameraController;
  unint64_t *v56;
  unint64_t v57;
  double v58;
  double v59;
  long double v60;
  long double v61;
  double v62;
  double v63;
  long double v64;
  double v65;
  long double v66;
  double v67;
  unint64_t *v68;
  unint64_t v69;
  VKCamera *v70;
  VKCamera *v71;
  double y;
  double x;
  float64x2_t v74;
  float64x2_t v75;
  long double v76;
  float64x2_t v77;
  float64x2_t v78;
  __int128 v79;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  y = a3.y;
  x = a3.x;
  v4 = -[VKCameraController usesVKCamera](self->super._cameraController, "usesVKCamera");
  -[MDRenderTarget size](self->super._displayTarget, "size");
  if (!v4)
  {
    if (v5 <= 0.0 || (-[MDRenderTarget size](self->super._displayTarget, "size"), v16 <= 0.0))
    {
      v45 = -[VKScreenCanvas mapEngine](self, "mapEngine");
      v29 = v45[133];
      v30 = (std::__shared_weak_count *)v45[134];
      if (v30)
      {
        p_shared_owners = (unint64_t *)&v30->__shared_owners_;
        do
          v47 = __ldxr(p_shared_owners);
        while (__stxr(v47 + 1, p_shared_owners));
        v24 = *(float64x2_t *)(v29 + 8);
        do
          v33 = __ldaxr(p_shared_owners);
        while (__stlxr(v33 - 1, p_shared_owners));
LABEL_33:
        if (!v33)
        {
          v77 = v24;
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
          v24 = v77;
        }
        goto LABEL_36;
      }
    }
    else
    {
      v17 = *(_QWORD *)(-[VKScreenCanvas mapEngine](self, "mapEngine") + 904);
      v18.f64[0] = x;
      v18.f64[1] = y;
      v74 = v18;
      v19 = -[VKScreenCanvas mapEngine](self, "mapEngine");
      v20 = v19[133];
      v21 = (std::__shared_weak_count *)v19[134];
      if (v21)
      {
        v22 = (unint64_t *)&v21->__shared_owners_;
        do
          v23 = __ldxr(v22);
        while (__stxr(v23 + 1, v22));
      }
      md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v78, v17, v20 + 8, 0, v74);
      v24 = v78;
      v25 = *(double *)&v79;
      if (v21)
      {
        v26 = (unint64_t *)&v21->__shared_owners_;
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          v75 = v24;
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
          v24 = v75;
        }
      }
      if (v24.f64[0] != -3.14159265 || v24.f64[1] != -3.14159265 || v25 != 0.0)
        goto LABEL_36;
      v28 = -[VKScreenCanvas mapEngine](self, "mapEngine");
      v29 = v28[133];
      v30 = (std::__shared_weak_count *)v28[134];
      if (v30)
      {
        v31 = (unint64_t *)&v30->__shared_owners_;
        do
          v32 = __ldxr(v31);
        while (__stxr(v32 + 1, v31));
        v24 = *(float64x2_t *)(v29 + 8);
        do
          v33 = __ldaxr(v31);
        while (__stlxr(v33 - 1, v31));
        goto LABEL_33;
      }
    }
    v24 = *(float64x2_t *)(v29 + 8);
LABEL_36:
    v44 = vmulq_f64(v24, (float64x2_t)vdupq_n_s64(0x404CA5DC1A63C1F8uLL));
    goto LABEL_37;
  }
  if (v5 <= 0.0)
    goto LABEL_26;
  -[MDRenderTarget size](self->super._displayTarget, "size");
  if (v6 <= 0.0)
    goto LABEL_26;
  -[MDRenderTarget size](self->super._displayTarget, "size");
  v8 = v7;
  -[MDRenderTarget size](self->super._displayTarget, "size");
  v10 = v9;
  v11 = (int8x8_t *)*((_QWORD *)self->super._mapEngine + 140);
  v12 = v11[2];
  v13 = 0.0;
  if (v12)
  {
    v14 = (uint8x8_t)vcnt_s8(v12);
    v14.i16[0] = vaddlv_u8(v14);
    if (v14.u32[0] > 1uLL)
    {
      v15 = 0x17767EADC5B287BuLL % *(_QWORD *)&v12;
      if (*(_QWORD *)&v12 > 0x17767EADC5B287BuLL)
        v15 = 0x17767EADC5B287BLL;
    }
    else
    {
      v15 = (*(_QWORD *)&v12 - 1) & 0x17767EADC5B287BLL;
    }
    v49 = *(_QWORD **)(*(_QWORD *)&v11[1] + 8 * v15);
    if (v49)
    {
      v50 = (_QWORD *)*v49;
      if (v50)
      {
        if (v14.u32[0] < 2uLL)
        {
          v51 = *(_QWORD *)&v12 - 1;
          while (1)
          {
            v53 = v50[1];
            if (v53 == 0x17767EADC5B287BLL)
            {
              if (v50[2] == 0x17767EADC5B287BLL)
                goto LABEL_56;
            }
            else if ((v53 & v51) != v15)
            {
              goto LABEL_70;
            }
            v50 = (_QWORD *)*v50;
            if (!v50)
              goto LABEL_70;
          }
        }
        do
        {
          v52 = v50[1];
          if (v52 == 0x17767EADC5B287BLL)
          {
            if (v50[2] == 0x17767EADC5B287BLL)
            {
LABEL_56:
              v54 = v50[5];
              if (v54)
              {
                cameraController = self->super._cameraController;
                if (cameraController)
                {
                  -[VKCameraController camera](cameraController, "camera");
                  if (*(_QWORD *)&v78.f64[1])
                  {
                    v56 = (unint64_t *)(*(_QWORD *)&v78.f64[1] + 8);
                    do
                      v57 = __ldaxr(v56);
                    while (__stlxr(v57 - 1, v56));
                    if (!v57)
                    {
                      (*(void (**)(_QWORD))(**(_QWORD **)&v78.f64[1] + 16))(*(_QWORD *)&v78.f64[1]);
                      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v78.f64[1]);
                    }
                  }
                  if (*(_QWORD *)&v78.f64[0])
                  {
                    v58 = *(double *)(v54 + 248);
                    -[VKCameraController camera](self->super._cameraController, "camera");
                    v59 = *(double *)(*(_QWORD *)&v78.f64[0] + 8);
                    v60 = cos(v59 + v59) * -559.82 + 111132.92;
                    v61 = v60 + cos(v59 * 4.0) * 1.175;
                    v62 = v61 + cos(v59 * 6.0) * -0.0023;
                    v63 = v59 * 0.5;
                    v64 = tan(v59 * 0.5 + 0.78103484);
                    v65 = log(v64);
                    v66 = tan(v63 + 0.789761487);
                    v67 = fabs((log(v66) - v65) * 0.159154943) * v58;
                    if (*(_QWORD *)&v78.f64[1])
                    {
                      v68 = (unint64_t *)(*(_QWORD *)&v78.f64[1] + 8);
                      do
                        v69 = __ldaxr(v68);
                      while (__stlxr(v69 - 1, v68));
                      if (!v69)
                      {
                        (*(void (**)(_QWORD))(**(_QWORD **)&v78.f64[1] + 16))(*(_QWORD *)&v78.f64[1]);
                        std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v78.f64[1]);
                      }
                    }
                    v13 = v67 / v62;
                  }
                }
              }
              break;
            }
          }
          else
          {
            if (v52 >= *(_QWORD *)&v12)
              v52 %= *(_QWORD *)&v12;
            if (v52 != v15)
              break;
          }
          v50 = (_QWORD *)*v50;
        }
        while (v50);
      }
    }
  }
LABEL_70:
  v70 = self->super._vkCamera._obj;
  v71 = v70;
  if (v70)
  {
    -[VKCamera groundPointFromScreenPoint:atGroundLevel:](v70, "groundPointFromScreenPoint:atGroundLevel:", x / v8, 1.0 - y / v10, -v13);
  }
  else
  {
    v78 = 0u;
    v79 = 0u;
  }

  if (LOBYTE(v78.f64[0]))
  {
    v38 = v78.f64[1];
    v39 = *(double *)&v79;
  }
  else
  {
LABEL_26:
    v34 = self->super._vkCamera._obj;
    v35 = -[VKCamera position](v34, "position");
    v36 = self->super._vkCamera._obj;
    v37 = -[VKCamera position](v36, "position");
    -[VKCamera position](self->super._vkCamera._obj, "position");
    v38 = *v35;
    v39 = *(double *)(v37 + 8);

  }
  v40 = exp(v39 * 6.28318531 + -3.14159265);
  v76 = atan(v40);
  v41 = fmod(v38 * 6.28318531, 6.28318531);
  v42 = fmod(v41 + 6.28318531, 6.28318531);
  v43.f64[0] = v76;
  v43.f64[1] = v42;
  v44 = vmlaq_f64((float64x2_t)xmmword_19FFB32F0, (float64x2_t)xmmword_19FFB32E0, v43);
LABEL_37:
  v48 = v44.f64[1];
  result.var0 = v44.f64[0];
  result.var1 = v48;
  return result;
}

- (CGPoint)convertMapPointToPoint:(id)a3
{
  double var1;
  double var0;
  double v6;
  double v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  long double v21;
  long double v22;
  long double v23;
  long double v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  double v31;
  double v32;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38[3];
  CGPoint result;

  var1 = a3.var1;
  var0 = a3.var0;
  if (-[VKCameraController usesVKCamera](self->super._cameraController, "usesVKCamera"))
  {
    v6 = *MEMORY[0x1E0D266F8];
    v7 = *(double *)(MEMORY[0x1E0D266F8] + 8);
    v8 = -[VKCamera scaledViewProjectionMatrix](self->super._vkCamera._obj, "scaledViewProjectionMatrix");
    v9 = 1.0 - var1 / v7;
    v10 = v8[13] + v8[1] * (var0 / v6) + v8[5] * v9;
    v11 = 0.5 / (v8[15] + v8[3] * (var0 / v6) + v8[7] * v9);
    v12 = v11 * (v8[12] + *v8 * (var0 / v6) + v8[4] * v9) + 0.5;
    -[MDRenderTarget size](self->super._displayTarget, "size");
    v14 = v12 * v13;
    -[MDRenderTarget size](self->super._displayTarget, "size");
    v16 = (0.5 - v11 * v10) * v15;
  }
  else
  {
    -[MDRenderTarget size](self->super._displayTarget, "size");
    v18 = v17;
    -[MDRenderTarget size](self->super._displayTarget, "size");
    v20 = v19 * v18;
    v14 = 0.0;
    v16 = 0.0;
    if (v20 > 0.0)
    {
      v21 = var0 * 6.28318531 / *MEMORY[0x1E0D266F8];
      v22 = exp(3.14159265 - var1 * 6.28318531 / *(double *)(MEMORY[0x1E0D266F8] + 8));
      v23 = atan(v22) * 2.0 + -1.57079633;
      v24 = fmod(v21, 6.28318531);
      v38[0] = v23;
      v38[1] = fmod(v24 + 6.28318531, 6.28318531) + -3.14159265;
      v38[2] = 0.0;
      v25 = *(_QWORD *)(-[VKScreenCanvas mapEngine](self, "mapEngine") + 904);
      v26 = -[VKScreenCanvas mapEngine](self, "mapEngine");
      v27 = v26[133];
      v28 = (std::__shared_weak_count *)v26[134];
      if (v28)
      {
        p_shared_owners = (unint64_t *)&v28->__shared_owners_;
        do
          v30 = __ldxr(p_shared_owners);
        while (__stxr(v30 + 1, p_shared_owners));
        gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(v25 + 16), v38, (uint64_t *)(v27 + 8));
        v14 = v31;
        v16 = v32;
        do
          v33 = __ldaxr(p_shared_owners);
        while (__stlxr(v33 - 1, p_shared_owners));
        if (!v33)
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
        }
      }
      else
      {
        gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(v25 + 16), v38, (uint64_t *)(v27 + 8));
        v14 = v34;
        v16 = v35;
      }
    }
  }
  v36 = v14;
  v37 = v16;
  result.y = v37;
  result.x = v36;
  return result;
}

- (void)updateOverlays
{
  int8x8_t *v3;
  int8x8_t v4;
  uint8x8_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  void *__p;
  char *v18;
  uint64_t v19;

  __p = 0;
  v18 = 0;
  v19 = 0;
  md::OverlayContainer::computeTileExclusionAreas(*(_QWORD **)&self->_canonicalSkyHeight, &__p);
  v3 = *(int8x8_t **)(-[VKScreenCanvas mapEngine](self, "mapEngine") + 1120);
  v4 = v3[2];
  if (!*(_QWORD *)&v4)
    goto LABEL_21;
  v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = 0x87BA2765F9E38E05;
    if (*(_QWORD *)&v4 <= 0x87BA2765F9E38E05)
      v6 = 0x87BA2765F9E38E05 % *(_QWORD *)&v4;
  }
  else
  {
    v6 = (*(_QWORD *)&v4 - 1) & 0x87BA2765F9E38E05;
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
      if (v11 == 0x87BA2765F9E38E05)
      {
        if (v8[2] == 0x87BA2765F9E38E05)
          goto LABEL_35;
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
    if (v10 == 0x87BA2765F9E38E05)
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
  if (v8[2] != 0x87BA2765F9E38E05)
    goto LABEL_11;
LABEL_35:
  v12 = v8[5];
LABEL_22:
  std::vector<md::TileExclusionArea>::__assign_with_size[abi:nn180100]<md::TileExclusionArea*,md::TileExclusionArea*>((_QWORD *)(v12 + 144), (char *)__p, v18, (v18 - (_BYTE *)__p) >> 6);
  v13 = *(_QWORD *)(-[VKScreenCanvas mapEngine](self, "mapEngine") + 1120);
  v14 = *(_QWORD *)(v13 + 16);
  if ((v14 & (v14 - 1)) != 0)
  {
    v16 = 0x87668FB4D087F775;
    if (v14 <= 0x87668FB4D087F775)
      v16 = 0x87668FB4D087F775 % v14;
    v15 = *(_QWORD **)(*(_QWORD *)(v13 + 8) + 8 * v16);
    do
    {
      do
        v15 = (_QWORD *)*v15;
      while (v15[1] != 0x87668FB4D087F775);
    }
    while (v15[2] != 0x87668FB4D087F775);
  }
  else
  {
    v15 = *(_QWORD **)(*(_QWORD *)(v13 + 8) + 8 * ((v14 - 1) & 0x87668FB4D087F775));
    do
    {
      do
        v15 = (_QWORD *)*v15;
      while (v15[1] != 0x87668FB4D087F775);
    }
    while (v15[2] != 0x87668FB4D087F775);
  }
  *(_BYTE *)(v15[5] + 923) = 1;
  if (__p)
    operator delete(__p);
}

- (void)addOverlay:(id)a3
{
  VKOverlay *v4;
  OverlayContainer *ptr;
  unint64_t *v6;
  unint64_t v7;
  MapEngine *var0;
  double canonicalSkyHeight;
  std::__shared_weak_count *v10;
  char v11;

  v4 = (VKOverlay *)a3;
  md::OverlayContainer::addOverlay(*(md::OverlayContainer **)&self->_canonicalSkyHeight, v4);
  ptr = self->_overlayContainer.__ptr_;
  canonicalSkyHeight = self->_canonicalSkyHeight;
  v10 = (std::__shared_weak_count *)ptr;
  if (ptr)
  {
    v6 = (unint64_t *)((char *)ptr + 16);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  -[VKOverlay setStandardContainer:](v4, "setStandardContainer:", &canonicalSkyHeight);
  if (v10)
    std::__shared_weak_count::__release_weak(v10);
  -[VKOverlay setRunLoopController:](v4, "setRunLoopController:", self->super._runLoopController);
  -[VKOverlay setForceRasterizationForGlobe:](v4, "setForceRasterizationForGlobe:", LOBYTE(self->_puckAnimator));
  -[VKMapCanvas updateOverlays](self, "updateOverlays");
  var0 = self->super._runLoopController->var0;
  if (var0)
  {
    v11 = 1;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v11);
  }

}

- (void)removeOverlay:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void (***v14)(_QWORD);
  void (***v15)(_QWORD);
  void (***v16)(_QWORD);
  void **v17;
  void *v18;
  void (***v19)(_QWORD);
  void (***v20)(_QWORD);
  void (**v21)(_QWORD);
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  void (***v25)(_QWORD);
  void (***v26)(_QWORD);
  void (***v27)(_QWORD);
  void **v28;
  void *v29;
  void (***v30)(_QWORD);
  void (***v31)(_QWORD);
  void (**v32)(_QWORD);
  unsigned int v33;
  uint64_t v34;
  id v35;
  char v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  BOOL v41;
  void *v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  MapEngine *var0;
  void *v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  uint64_t *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(_QWORD *)&self->_canonicalSkyHeight;
  v6 = v4;
  std::mutex::lock((std::mutex *)(v5 + 232));
  v7 = objc_msgSend(v6, "level", v6);
  v8 = v5 + 24 * v7;
  v10 = *(_QWORD *)(v8 + 160);
  v8 += 160;
  v9 = v10;
  v13 = *(_QWORD *)(v8 + 8);
  v11 = (_QWORD *)(v8 + 8);
  v12 = v13;
  if (v9 != v13)
  {
    while ((geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*(void **)(v9 + 8), &v48) & 1) == 0)
    {
      v9 += 24;
      if (v9 == v12)
      {
        v9 = v12;
        break;
      }
    }
    v14 = (void (***)(_QWORD))v9;
    v15 = (void (***)(_QWORD))*v11;
    if (v14 != (void (***)(_QWORD))*v11)
    {
      v16 = v14 + 3;
      if (v14 + 3 != v15)
      {
        do
        {
          v14 = v16;
          v17 = (void **)(v16 + 1);
          objc_storeStrong((id *)v16 - 2, v16[1]);
          v18 = *v17;
          *v17 = 0;

          v16 = v14 + 3;
        }
        while (v14 + 3 != v15);
        v15 = (void (***)(_QWORD))*v11;
      }
      if (v15 != v14)
      {
        v19 = v15 - 3;
        v20 = v19;
        do
        {
          v21 = *v20;
          v20 -= 3;
          (*v21)(v19);
          v22 = v19 == v14;
          v19 = v20;
        }
        while (!v22);
      }
      *v11 = v14;
    }
  }
  v23 = *(_QWORD *)(v5 + 208);
  v24 = *(_QWORD *)(v5 + 216);
  if (v23 != v24)
  {
    while ((geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*(void **)(v23 + 8), &v48) & 1) == 0)
    {
      v23 += 24;
      if (v23 == v24)
      {
        v23 = v24;
        break;
      }
    }
    v25 = (void (***)(_QWORD))v23;
    v26 = *(void (****)(_QWORD))(v5 + 216);
    if (v25 != v26)
    {
      v27 = v25 + 3;
      if (v25 + 3 != v26)
      {
        do
        {
          v25 = v27;
          v28 = (void **)(v27 + 1);
          objc_storeStrong((id *)v27 - 2, v27[1]);
          v29 = *v28;
          *v28 = 0;

          v27 = v25 + 3;
        }
        while (v25 + 3 != v26);
        v26 = *(void (****)(_QWORD))(v5 + 216);
      }
      if (v26 != v25)
      {
        v30 = v26 - 3;
        v31 = v30;
        do
        {
          v32 = *v31;
          v31 -= 3;
          (*v32)(v30);
          v22 = v30 == v25;
          v30 = v31;
        }
        while (!v22);
      }
      *(_QWORD *)(v5 + 216) = v25;
      *(_BYTE *)(v5 + 344) = v25 != *(void (****)(_QWORD))(v5 + 208);
    }
  }
  v33 = objc_msgSend(v6, "areResourcesRequired");
  if (v7 <= 1)
  {
    v34 = *(_QWORD *)(v5 + 16 * v7 + 8 * v33);
    if (v34)
    {
      v35 = v6;
      if ((objc_msgSend(v35, "canProvideVectorData") & 1) != 0)
      {
        v36 = 2;
      }
      else
      {
        objc_msgSend(v35, "rasterTileProvider");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v36 = 3;
        }
        else
        {
          objc_msgSend(v35, "customTileProvider");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
            v36 = 4;
          else
            v36 = 1;
        }
      }

      v39 = objc_msgSend(v35, "identifier");
      objc_msgSend(v35, "rasterTileProvider");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v41 = 0;
      }
      else
      {
        objc_msgSend(v35, "customTileProvider");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v42 == 0;

      }
      v51 = 0;
      v43 = operator new(0x30uLL);
      *v43 = &off_1E42CD6E8;
      v43[1] = v5;
      *((_DWORD *)v43 + 4) = v39;
      v43[3] = v34;
      *((_BYTE *)v43 + 32) = v41;
      *((_BYTE *)v43 + 33) = v36;
      v43[5] = v7;
      v51 = v43;
      md::OverlayContainer::queueCommand(v5, 1, &v49);
      v44 = v51;
      if (v51 == &v49)
      {
        v45 = 4;
        v44 = &v49;
        goto LABEL_47;
      }
      if (v51)
      {
        v45 = 5;
LABEL_47:
        (*(void (**)(void))(*v44 + 8 * v45))();
      }
    }
  }
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__erase_unique<unsigned int>((_QWORD *)(v5 + 296), objc_msgSend(v6, "identifier"));
  *(_BYTE *)(v5 + 345) = 1;
  ++*(_DWORD *)(v5 + 348);
  std::mutex::unlock((std::mutex *)(v5 + 232));

  if (v6)
  {
    objc_msgSend(v6, "standardContainer");
    v46 = v50;
    v49 = 0;
    v50 = 0;
    if (v46)
    {
      std::__shared_weak_count::__release_weak(v46);
      if (v50)
        std::__shared_weak_count::__release_weak(v50);
    }
  }
  objc_msgSend(v6, "setRunLoopController:", 0);
  -[VKMapCanvas updateOverlays](self, "updateOverlays");
  var0 = self->super._runLoopController->var0;
  if (var0)
  {
    LOBYTE(v49) = 1;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v49);
  }

}

- (void)insertOverlay:(id)a3 aboveOverlay:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  OverlayContainer *ptr;
  unint64_t *v19;
  unint64_t v20;
  MapEngine *var0;
  double canonicalSkyHeight;
  std::__shared_weak_count *v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)&self->_canonicalSkyHeight;
  v9 = v6;
  v10 = v7;
  v24 = v10;
  std::mutex::lock((std::mutex *)(v8 + 232));
  v11 = v8 + 24 * objc_msgSend(v9, "level");
  v14 = *(_QWORD *)(v11 + 168);
  v12 = (uint64_t *)(v11 + 168);
  v13 = v14;
  v15 = *(v12 - 1);
  if (v15 == v14)
  {
    v16 = *(v12 - 1);
  }
  else
  {
    while ((geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*(void **)(v15 + 8), &v24) & 1) == 0)
    {
      v15 += 24;
      if (v15 == v13)
      {
        v15 = v13;
        break;
      }
    }
    v16 = v15;
    v15 = *v12;
  }
  if (v16 == v15)
    v17 = (char *)v15;
  else
    v17 = (char *)(v16 + 24);
  md::OverlayContainer::_insertOverlay(v8, v9, v17);
  std::mutex::unlock((std::mutex *)(v8 + 232));

  ptr = self->_overlayContainer.__ptr_;
  canonicalSkyHeight = self->_canonicalSkyHeight;
  v23 = (std::__shared_weak_count *)ptr;
  if (ptr)
  {
    v19 = (unint64_t *)((char *)ptr + 16);
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }
  objc_msgSend(v9, "setStandardContainer:", &canonicalSkyHeight);
  if (v23)
    std::__shared_weak_count::__release_weak(v23);
  objc_msgSend(v9, "setRunLoopController:", self->super._runLoopController);
  objc_msgSend(v9, "setForceRasterizationForGlobe:", LOBYTE(self->_puckAnimator));
  -[VKMapCanvas updateOverlays](self, "updateOverlays");
  var0 = self->super._runLoopController->var0;
  if (var0)
  {
    LOBYTE(v24) = 1;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v24);
  }

}

- (void)insertOverlay:(id)a3 belowOverlay:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  OverlayContainer *ptr;
  unint64_t *v15;
  unint64_t v16;
  MapEngine *var0;
  double canonicalSkyHeight;
  std::__shared_weak_count *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)&self->_canonicalSkyHeight;
  v9 = v6;
  v10 = v7;
  v20 = v10;
  std::mutex::lock((std::mutex *)(v8 + 232));
  v11 = v8 + 24 * objc_msgSend(v9, "level");
  v12 = *(_QWORD *)(v11 + 160);
  v13 = *(_QWORD *)(v11 + 168);
  if (v12 != v13)
  {
    while ((geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*(void **)(v12 + 8), &v20) & 1) == 0)
    {
      v12 += 24;
      if (v12 == v13)
      {
        v12 = v13;
        break;
      }
    }
  }
  md::OverlayContainer::_insertOverlay(v8, v9, (char *)v12);
  std::mutex::unlock((std::mutex *)(v8 + 232));

  ptr = self->_overlayContainer.__ptr_;
  canonicalSkyHeight = self->_canonicalSkyHeight;
  v19 = (std::__shared_weak_count *)ptr;
  if (ptr)
  {
    v15 = (unint64_t *)((char *)ptr + 16);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  objc_msgSend(v9, "setStandardContainer:", &canonicalSkyHeight);
  if (v19)
    std::__shared_weak_count::__release_weak(v19);
  objc_msgSend(v9, "setRunLoopController:", self->super._runLoopController);
  objc_msgSend(v9, "setForceRasterizationForGlobe:", LOBYTE(self->_puckAnimator));
  -[VKMapCanvas updateOverlays](self, "updateOverlays");
  var0 = self->super._runLoopController->var0;
  if (var0)
  {
    LOBYTE(v20) = 1;
    md::MapEngine::setNeedsTick((uint64_t)var0, &v20);
  }

}

- (NSArray)overlays
{
  id v3;
  double canonicalSkyHeight;
  char *v5;
  id *v6;
  id *v7;
  id v8;
  char *v9;
  char *v10;
  void (**v11)(char *);
  BOOL v12;
  double v13;
  char *v14;
  id *v15;
  id *v16;
  id v17;
  char *v18;
  char *v19;
  void (**v20)(char *);
  char *v22;
  id *v23;
  uint64_t v24;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  canonicalSkyHeight = self->_canonicalSkyHeight;
  std::mutex::lock((std::mutex *)(*(_QWORD *)&canonicalSkyHeight + 232));
  v22 = 0;
  v23 = 0;
  v24 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v22, *(_QWORD *)(*(_QWORD *)&canonicalSkyHeight + 160), *(_QWORD *)(*(_QWORD *)&canonicalSkyHeight + 168), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(_QWORD *)(*(_QWORD *)&canonicalSkyHeight + 168) - *(_QWORD *)(*(_QWORD *)&canonicalSkyHeight + 160)) >> 3));
  std::mutex::unlock((std::mutex *)(*(_QWORD *)&canonicalSkyHeight + 232));
  v5 = v22;
  v6 = v23;
  if (v22 == (char *)v23)
  {
    if (!v22)
      goto LABEL_12;
    goto LABEL_11;
  }
  v7 = (id *)v22;
  do
  {
    v8 = v7[1];
    objc_msgSend(v3, "addObject:", v8);

    v7 += 3;
  }
  while (v7 != v6);
  if (v5)
  {
    if (v5 != (char *)v6)
    {
      v9 = (char *)(v6 - 3);
      v10 = (char *)(v6 - 3);
      do
      {
        v11 = *(void (***)(char *))v10;
        v10 -= 24;
        (*v11)(v9);
        v12 = v9 == v5;
        v9 = v10;
      }
      while (!v12);
    }
LABEL_11:
    operator delete(v5);
  }
LABEL_12:
  v13 = self->_canonicalSkyHeight;
  std::mutex::lock((std::mutex *)(*(_QWORD *)&v13 + 232));
  v22 = 0;
  v23 = 0;
  v24 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v22, *(_QWORD *)(*(_QWORD *)&v13 + 184), *(_QWORD *)(*(_QWORD *)&v13 + 192), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(*(_QWORD *)&v13 + 192) - *(_QWORD *)(*(_QWORD *)&v13 + 184)) >> 3));
  std::mutex::unlock((std::mutex *)(*(_QWORD *)&v13 + 232));
  v14 = v22;
  v15 = v23;
  if (v22 == (char *)v23)
  {
    if (v22)
LABEL_22:
      operator delete(v14);
  }
  else
  {
    v16 = (id *)v22;
    do
    {
      v17 = v16[1];
      objc_msgSend(v3, "addObject:", v17);

      v16 += 3;
    }
    while (v16 != v15);
    if (v14)
    {
      if (v14 != (char *)v15)
      {
        v18 = (char *)(v15 - 3);
        v19 = (char *)(v15 - 3);
        do
        {
          v20 = *(void (***)(char *))v19;
          v19 -= 24;
          (*v20)(v18);
          v12 = v18 == v14;
          v18 = v19;
        }
        while (!v12);
      }
      goto LABEL_22;
    }
  }
  return (NSArray *)v3;
}

- (id)globeAnnotationRectTest
{
  return (id)objc_msgSend(&__block_literal_global_1199, "copy");
}

- (id)globeAnnotationCoordinateTest
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__VKMapCanvas_globeAnnotationCoordinateTest__block_invoke;
  v3[3] = &unk_1E42F36D0;
  v3[4] = self;
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)isPointValidForGesturing:(CGPoint)a3
{
  double v3;
  double v4;
  BOOL v5;

  -[VKMapCanvas convertPointToCoordinate:](self, "convertPointToCoordinate:", a3.x, a3.y);
  v5 = v4 <= 90.0;
  if (v4 < -90.0)
    v5 = 0;
  if (v3 > 180.0)
    v5 = 0;
  return v3 >= -180.0 && v5;
}

- (void)goToTileX:(int)a3 Y:(int)a4 Z:(int)a5 tileSize:(int)a6
{
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  _QWORD v18[4];
  double v19[3];

  v11 = (double)(1 << a5);
  -[MDRenderTarget size](self->super._displayTarget, "size");
  v13 = v12;
  v14 = 1.0 / v11 * 0.5;
  v19[0] = v14 + (double)a3 * (1.0 / v11);
  v19[1] = v14 + (-1.0 - (double)a4 + v11) * (1.0 / v11);
  -[VKCamera tanHalfHorizFOV](self->super._vkCamera._obj, "tanHalfHorizFOV");
  v16 = v15;
  v17 = log2(v13 / (double)a6);
  v19[2] = 0.5 / (v16 * exp2((float)((float)a5 - v17)));
  memset(v18, 0, 24);
  v18[3] = 0x3FF0000000000000;
  -[VKCamera setOrientation:](self->super._vkCamera._obj, "setOrientation:", v18);
  -[VKCamera setPosition:](self->super._vkCamera._obj, "setPosition:", v19);
}

- (void)debugHighlightObjectAtPoint:(CGPoint)a3 highlightTarget:(unsigned __int8)a4
{
  double y;
  double x;
  md::HomeQueueScheduler **mapEngine;
  uint64_t v7;
  _QWORD *v8;
  double v9;
  double v10;
  uint64_t v11;
  unsigned __int8 *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  int v16;
  unint64_t v17;
  float v18;
  uint64_t *v19;
  uint64_t *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  BOOL v27;
  float v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float32x4_t v32;
  float32x4_t v33;
  int8x16_t v34;
  float32x4_t v35;
  float32x4_t v36;
  int8x16_t v37;
  int8x16_t v38;
  int16x4_t v39;
  int8x16_t v40;
  float32x4_t v41;
  int8x16_t v42;
  int8x16_t v43;
  int8x16_t v44;
  BOOL v45;
  float v46;
  BOOL v47;
  float v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  uint64_t v51;
  float v52;
  std::__shared_weak_count *v53;
  float v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  void *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  float v69;
  uint64_t v70;
  double v71;
  double v72;
  void *v73;
  int v74;
  uint64_t v75;
  double v76;
  double v77;
  void *v78;
  int v79;
  _BOOL4 v80;
  BOOL v81;
  BOOL v82;
  unint64_t *v83;
  unint64_t v84;
  unint64_t *v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t *v88;
  unint64_t v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  char v95;
  unint64_t v96;
  uint64_t v97;
  float v98;
  uint64_t Points;
  double v100;
  double v101;
  void *v102;
  int v103;
  std::__shared_weak_count *v104;
  unint64_t *v105;
  unint64_t v106;
  unint64_t *v107;
  unint64_t v108;
  std::__shared_weak_count *v109;
  unint64_t *v110;
  unint64_t v111;
  BOOL v112;
  uint64_t *v113;
  _QWORD *v114;
  uint64_t *v115;
  uint64_t v116;
  unsigned int v117;
  std::__shared_weak_count *v118;
  uint64_t v119;
  std::__shared_weak_count *v120;
  uint64_t v121;
  std::__shared_weak_count *v122;
  std::__shared_weak_count *v123;
  _QWORD v124[2];
  BOOL v125;
  void *__p;
  float *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;

  if (a4 == 1)
  {
    y = a3.y;
    x = a3.x;
    mapEngine = (md::HomeQueueScheduler **)self->super._mapEngine;
    md::HomeQueueScheduler::waitForSynchronization(mapEngine[567], "-[VKMapCanvas debugHighlightObjectAtPoint:highlightTarget:]");
    v7 = *((_QWORD *)mapEngine[107] + 5);
    if ((unint64_t)(*((_QWORD *)mapEngine[107] + 6) - v7) >= 0xA0)
      v8 = *(_QWORD **)(v7 + 152);
    else
      v8 = 0;
    if (*(_BYTE *)(v8[47] + 296))
    {
      objc_msgSend(*(id *)(v8[5] + 104), "contentScale");
      v10 = v9;
      v11 = *(_QWORD *)(v8[5] + 96);
      v12 = *(unsigned __int8 **)(v11 + 1064);
      v13 = *(std::__shared_weak_count **)(v11 + 1072);
      if (v13)
      {
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          v15 = __ldxr(p_shared_owners);
        while (__stxr(v15 + 1, p_shared_owners));
        v16 = *v12;
        do
          v17 = __ldaxr(p_shared_owners);
        while (__stlxr(v17 - 1, p_shared_owners));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      else
      {
        v16 = *v12;
      }
      v18 = *(float *)(v8[47] + 292);
      v122 = 0;
      v123 = 0;
      v19 = (uint64_t *)v8[34];
      v20 = (uint64_t *)v8[35];
      if (v19 != v20)
      {
        v21 = v10;
        v22 = x;
        v23 = v22 * v21;
        v24 = y;
        v25 = v18 - (float)(v24 * v21);
        v26 = v21 * 22.0;
        v27 = (v16 - 4) < 0xFFFFFFFD;
        v28 = 3.4028e38;
        v113 = (uint64_t *)v8[35];
        v114 = v8;
        v112 = v27;
        while (1)
        {
          v29 = *v19;
          v30 = *(_QWORD *)(*v19 + 384);
          v31 = v8[47] + 160;
          v124[0] = v30;
          v124[1] = v31;
          v125 = v27;
          __p = 0;
          v127 = 0;
          v128 = 0;
          v130 = 0;
          v131 = 0;
          v132 = 0;
          md::HighlightHelper::tileToMercatorPoints(v30, (uint64_t)&md::HighlightHelper::hitTestTile(gm::Matrix<float,2,1>,float)const::tileCorners, 4, (uint64_t)&v130);
          md::HighlightHelper::mercatorToScreenPoints((uint64_t)v124, (double **)&v130, (uint64_t)&__p);
          if (v130)
            operator delete(v130);
          v32.i64[0] = *(_QWORD *)__p;
          v33.i64[0] = *((_QWORD *)__p + 1);
          v32.i64[1] = *(_QWORD *)__p;
          v34.i64[0] = v33.i64[0];
          v34.i64[1] = v33.i64[0];
          v35.i64[0] = *((_QWORD *)__p + 2);
          v36.i64[0] = *((_QWORD *)__p + 3);
          v37.i64[0] = v35.i64[0];
          v37.i64[1] = v35.i64[0];
          v38.i64[0] = v36.i64[0];
          v38.i64[1] = v36.i64[0];
          v39.i32[0] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_19FFB2E30, v32)).u32[0];
          v39.i32[1] = vmovn_s32(vcgtq_f32(v32, (float32x4_t)xmmword_19FFB2E30)).i32[1];
          v40 = vbslq_s8((int8x16_t)vmovl_s16(v39), (int8x16_t)v32, (int8x16_t)xmmword_19FFB2E30);
          v41.i64[0] = v40.i64[0];
          v41.i64[1] = v33.i64[0];
          v33.i64[1] = vextq_s8(v40, v40, 8uLL).u64[0];
          v42 = vbslq_s8((int8x16_t)vcgtq_f32(v41, v33), v34, v40);
          v33.i64[0] = v42.i64[0];
          v33.i64[1] = v35.i64[0];
          v35.i64[1] = vextq_s8(v42, v42, 8uLL).u64[0];
          v43 = vbslq_s8((int8x16_t)vcgtq_f32(v33, v35), v37, v42);
          v34.i64[0] = v43.i64[0];
          v34.i64[1] = v36.i64[0];
          v36.i64[1] = vextq_s8(v43, v43, 8uLL).u64[0];
          v44 = vbslq_s8((int8x16_t)vcgtq_f32((float32x4_t)v34, v36), v38, v43);
          v45 = *(float *)&v44.i32[2] < *(float *)v44.i32 || *(float *)&v44.i32[3] < *(float *)&v44.i32[1];
          if (v45
            || v26 == 0.0
            || ((*(float *)v44.i32 = fmaxf(v23 - *(float *)&v44.i32[2], *(float *)v44.i32 - v23),
                 v46 = fmaxf(v25 - *(float *)&v44.i32[3], *(float *)&v44.i32[1] - v25),
                 *(float *)v44.i32 < v26)
              ? (v47 = v46 < v26)
              : (v47 = 0),
                !v47))
          {
            operator delete(__p);
            goto LABEL_18;
          }
          if (*(float *)v44.i32 <= 0.0 || v46 <= 0.0)
            break;
          v48 = (float)(*(float *)v44.i32 * *(float *)v44.i32) + (float)(v46 * v46);
          operator delete(__p);
          if (v48 < (float)(v26 * v26))
            goto LABEL_36;
LABEL_18:
          if (++v19 == v20)
            goto LABEL_150;
        }
        operator delete(__p);
LABEL_36:
        v115 = v19;
        v116 = v30;
        v119 = v29 + 384;
        v49 = *(_QWORD *)(v30 + 888);
        v121 = *(_QWORD *)(v30 + 896);
        if (v49 != v121)
        {
          v120 = 0;
          v50 = 0;
          v51 = 0;
          v52 = 3.4028e38;
          while (1)
          {
            v56 = *(_QWORD *)v49;
            if (!*(_DWORD *)(*(_QWORD *)v49 + 20))
              goto LABEL_38;
            v57 = 0;
            v58 = 0;
            v59 = v124[0];
            v54 = v26 * v26;
            do
            {
              v129 = 0;
              v60 = geo::codec::transitLinkPoints(v56, v57, &v129);
              if (v129)
              {
                __p = 0;
                v127 = 0;
                v128 = 0;
                v130 = 0;
                v131 = 0;
                v132 = 0;
                md::HighlightHelper::tileToMercatorPoints(v59, v60, v129, (uint64_t)&v130);
                md::HighlightHelper::mercatorToScreenPoints((uint64_t)v124, (double **)&v130, (uint64_t)&__p);
                if (v130)
                  operator delete(v130);
                LODWORD(v130) = 2139095039;
                v63 = __p;
                *(float *)&v61 = v23;
                *(float *)&v62 = v25;
                v64 = md::HighlightHelper::hitTest((float *)__p, v127, (float *)&v130, v61, v62, v54);
                if (v64)
                  v54 = *(float *)&v130;
                if (v63)
                  operator delete(v63);
                v58 |= v64;
              }
              ++v57;
              v56 = *(_QWORD *)v49;
            }
            while (v57 < *(unsigned int *)(*(_QWORD *)v49 + 20));
            if ((v58 & 1) == 0)
              goto LABEL_38;
            v66 = *(_QWORD *)(v49 + 56);
            v65 = *(_QWORD *)(v49 + 64);
            if (v66 == v65)
              break;
            v117 = v51;
            v118 = v50;
            v67 = 0;
            v68 = 0;
            v69 = v26 * v26;
            do
            {
              v70 = *(_QWORD *)(v66 + 24);
              if (v70 && *(_BYTE *)(v70 + 82))
              {
                __p = 0;
                v127 = 0;
                v128 = 0;
                v130 = 0;
                v131 = 0;
                v132 = 0;
                md::HighlightHelper::tileToMercatorPoints(v59, v70 + 16, 1, (uint64_t)&v130);
                md::HighlightHelper::mercatorToScreenPoints((uint64_t)v124, (double **)&v130, (uint64_t)&__p);
                if (v130)
                  operator delete(v130);
                LODWORD(v130) = 2139095039;
                v73 = __p;
                *(float *)&v71 = v23;
                *(float *)&v72 = v25;
                v74 = md::HighlightHelper::hitTest((float *)__p, v127, (float *)&v130, v71, v72, v69);
                if (v74)
                {
                  v67 = v70;
                  v69 = *(float *)&v130;
                }
                if (v73)
                  operator delete(v73);
                v68 |= v74;
              }
              v75 = *(_QWORD *)(v66 + 64);
              if (v75 && *(_BYTE *)(v75 + 82))
              {
                __p = 0;
                v127 = 0;
                v128 = 0;
                v130 = 0;
                v131 = 0;
                v132 = 0;
                md::HighlightHelper::tileToMercatorPoints(v59, v75 + 16, 1, (uint64_t)&v130);
                md::HighlightHelper::mercatorToScreenPoints((uint64_t)v124, (double **)&v130, (uint64_t)&__p);
                if (v130)
                  operator delete(v130);
                LODWORD(v130) = 2139095039;
                v78 = __p;
                *(float *)&v76 = v23;
                *(float *)&v77 = v25;
                v79 = md::HighlightHelper::hitTest((float *)__p, v127, (float *)&v130, v76, v77, v69);
                if (v79)
                {
                  v67 = v75;
                  v69 = *(float *)&v130;
                }
                if (v78)
                  operator delete(v78);
                v68 |= v79;
              }
              v66 += 96;
            }
            while (v66 != v65);
            v80 = *(_BYTE *)(v49 + 244) == 0;
            if ((v68 & 1) == 0)
            {
              v50 = v118;
              v51 = v117;
LABEL_86:
              if (v80)
                v55 = 3;
              else
                v55 = 2;
              if (v55 > v51
                || (v55 == v51 ? (v82 = v54 < v52) : (v82 = 0), v82))
              {
                v53 = (std::__shared_weak_count *)operator new(0x30uLL);
                v53->__shared_owners_ = 0;
                v53->__shared_weak_owners_ = 0;
                v53->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DC858;
                v53[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E429C0B0;
                v120 = v53 + 1;
                v53[1].__shared_owners_ = v119;
                v53[1].__shared_weak_owners_ = v49;
                if (!v50)
                  goto LABEL_39;
                v83 = (unint64_t *)&v50->__shared_owners_;
                do
                  v84 = __ldaxr(v83);
                while (__stlxr(v84 - 1, v83));
                if (v84)
                  goto LABEL_39;
LABEL_104:
                ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
                std::__shared_weak_count::__release_weak(v50);
                goto LABEL_39;
              }
LABEL_38:
              v53 = v50;
              v54 = v52;
              v55 = v51;
              goto LABEL_39;
            }
            if (*(_BYTE *)(v49 + 244))
              v55 = 5;
            else
              v55 = 4;
            if (v55 > v117
              || (v55 == v117 ? (v81 = v52 <= 3.4028e38) : (v81 = 1), !v81))
            {
              v50 = v118;
              v53 = (std::__shared_weak_count *)operator new(0x30uLL);
              v53->__shared_owners_ = 0;
              v53->__shared_weak_owners_ = 0;
              v53->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DC890;
              v53[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E429C0F0;
              v120 = v53 + 1;
              v53[1].__shared_owners_ = v119;
              v53[1].__shared_weak_owners_ = v67;
              if (!v118)
              {
                v54 = 3.4028e38;
                goto LABEL_39;
              }
              v85 = (unint64_t *)&v118->__shared_owners_;
              do
                v86 = __ldaxr(v85);
              while (__stlxr(v86 - 1, v85));
              v54 = 3.4028e38;
              if (v86)
                goto LABEL_39;
              goto LABEL_104;
            }
            v53 = v118;
            v54 = v52;
            v55 = v117;
LABEL_39:
            v49 += 248;
            v50 = v53;
            v51 = v55;
            v52 = v54;
            if (v49 == v121)
              goto LABEL_107;
          }
          v80 = *(_BYTE *)(v49 + 244) == 0;
          goto LABEL_86;
        }
        v120 = 0;
        v53 = 0;
        LOBYTE(v55) = 0;
        v54 = 3.4028e38;
LABEL_107:
        v87 = *(_QWORD *)(v116 + 920);
        if (v87 == v116 + 912)
        {
LABEL_108:
          if (v120)
          {
            v27 = v112;
            if ((float)-v55 < v28)
            {
              if (v53)
              {
                v88 = (unint64_t *)&v53->__shared_owners_;
                do
                  v89 = __ldxr(v88);
                while (__stxr(v89 + 1, v88));
              }
              v90 = v123;
              v122 = v120;
              v123 = v53;
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
              v28 = (float)-v55;
            }
          }
          else
          {
            v27 = v112;
          }
          if (v53)
          {
            v107 = (unint64_t *)&v53->__shared_owners_;
            do
              v108 = __ldaxr(v107);
            while (__stlxr(v108 - 1, v107));
            if (!v108)
            {
              ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
              std::__shared_weak_count::__release_weak(v53);
            }
          }
          v8 = v114;
          v19 = v115;
          v20 = v113;
          goto LABEL_18;
        }
        while (1)
        {
          v94 = v87 + 16;
          v93 = *(_QWORD **)(v87 + 16);
          if (!v93[11])
            goto LABEL_120;
          v95 = 0;
          v96 = 0;
          v97 = v124[0];
          v98 = v26 * v26;
          do
          {
            v129 = 0;
            Points = geo::codec::pBTransitStationTransferGetPoints(v93, v96, &v129);
            if (Points && v129)
            {
              __p = 0;
              v127 = 0;
              v128 = 0;
              v130 = 0;
              v131 = 0;
              v132 = 0;
              md::HighlightHelper::tileToMercatorPoints(v97, Points, v129, (uint64_t)&v130);
              md::HighlightHelper::mercatorToScreenPoints((uint64_t)v124, (double **)&v130, (uint64_t)&__p);
              if (v130)
                operator delete(v130);
              LODWORD(v130) = 2139095039;
              v102 = __p;
              *(float *)&v100 = v23;
              *(float *)&v101 = v25;
              v103 = md::HighlightHelper::hitTest((float *)__p, v127, (float *)&v130, v100, v101, v98);
              if (v103)
                v98 = *(float *)&v130;
              if (v102)
                operator delete(v102);
              v95 |= v103;
            }
            ++v96;
            v93 = *(_QWORD **)v94;
          }
          while (v96 < *(_QWORD *)(*(_QWORD *)v94 + 88));
          if ((v95 & 1) == 0)
            goto LABEL_120;
          if (!(_BYTE)v55)
            break;
          if (v55 == 1)
          {
            if (v98 < v54)
              break;
            LOBYTE(v55) = 1;
          }
LABEL_120:
          v87 = *(_QWORD *)(v87 + 8);
          if (v87 == v116 + 912)
            goto LABEL_108;
        }
        v104 = (std::__shared_weak_count *)operator new(0x30uLL);
        v104->__shared_owners_ = 0;
        v104->__shared_weak_owners_ = 0;
        v104->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DC8C8;
        v104[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E429C130;
        v120 = v104 + 1;
        v104[1].__shared_owners_ = v119;
        v104[1].__shared_weak_owners_ = v94;
        if (v53)
        {
          v105 = (unint64_t *)&v53->__shared_owners_;
          do
            v106 = __ldaxr(v105);
          while (__stlxr(v106 - 1, v105));
          if (!v106)
          {
            ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
            std::__shared_weak_count::__release_weak(v53);
          }
        }
        LOBYTE(v55) = 1;
        v53 = v104;
        v54 = v98;
        goto LABEL_120;
      }
    }
    else
    {
      v122 = 0;
      v123 = 0;
    }
LABEL_150:
    md::TransitRenderLayer::setDebugHighlightedItem((uint64_t)v8, &v122);
    v109 = v123;
    if (v123)
    {
      v110 = (unint64_t *)&v123->__shared_owners_;
      do
        v111 = __ldaxr(v110);
      while (__stlxr(v111 - 1, v110));
      if (!v111)
      {
        ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
        std::__shared_weak_count::__release_weak(v109);
      }
    }
  }
}

- (id)markerAtScreenPoint:(CGPoint)a3 enableExtendedFeatureMarkers:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t mapEngine;
  unint64_t v20;
  uint64_t v21;
  double v22;
  unsigned int v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v31;
  double v32;
  unsigned int v33;
  NSObject *v34;
  dispatch_time_t v35;
  intptr_t v36;
  NSObject *v37;
  uint64_t v38;
  _BYTE **v39;
  _BYTE **v40;
  _BYTE *v41;
  unint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *p_shared_owners;
  unint64_t v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  uint64_t (**v60)();
  std::__shared_weak_count *v61;
  _OWORD v62[2];

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[MDRenderTarget size](self->super._displayTarget, "size");
  v9 = v8;
  -[MDRenderTarget size](self->super._displayTarget, "size");
  v11 = v10;
  -[MDRenderTarget size](self->super._displayTarget, "size");
  v13 = v12;
  -[VKScreenCanvas vkCamera](self, "vkCamera");
  v14 = v61;
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "groundPointFromScreenPoint:", x / v9, (-1.0 - y + v11) / v13);
  else
    memset(v62, 0, sizeof(v62));

  v60 = &off_1E42B54B0;
  if (!LOBYTE(v62[0]))
  {
    mapEngine = 0;
    return (id)mapEngine;
  }
  v16 = *((_QWORD *)self->super._mapEngine + 140);
  v17 = *(_QWORD *)(v16 + 16);
  if ((v17 & (v17 - 1)) != 0)
  {
    v20 = 0x20A1ED17D78F322BLL;
    if (v17 <= 0x20A1ED17D78F322BLL)
      v20 = 0x20A1ED17D78F322BLL % v17;
    v18 = *(_QWORD **)(*(_QWORD *)(v16 + 8) + 8 * v20);
    do
    {
      do
        v18 = (_QWORD *)*v18;
      while (v18[1] != 0x20A1ED17D78F322BLL);
    }
    while (v18[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    v18 = *(_QWORD **)(*(_QWORD *)(v16 + 8) + 8 * ((v17 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        v18 = (_QWORD *)*v18;
      while (v18[1] != 0x20A1ED17D78F322BLL);
    }
    while (v18[2] != 0x20A1ED17D78F322BLL);
  }
  v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v18[5] + 144) + 16) + 24);
  std::recursive_mutex::lock((std::recursive_mutex *)(v21 + 24));
  v22 = *(float *)(v21 + 480);
  *(float *)&v23 = x * v22;
  *(float *)&v22 = *(float *)(v21 + 1508) - y * v22;
  v58 = __PAIR64__(LODWORD(v22), v23);
  (*(void (**)(uint64_t (***__return_ptr)(), _QWORD, unint64_t *, _QWORD))(**(_QWORD **)(v21 + 240) + 160))(&v60, *(_QWORD *)(v21 + 240), &v58, 0);
  std::recursive_mutex::unlock((std::recursive_mutex *)(v21 + 24));
  if (!v60)
  {
    v28 = *(_QWORD *)(v16 + 16);
    if ((v28 & (v28 - 1)) != 0)
    {
      v30 = 0x20A1ED17D78F322BLL;
      if (v28 <= 0x20A1ED17D78F322BLL)
        v30 = 0x20A1ED17D78F322BLL % v28;
      v29 = *(_QWORD **)(*(_QWORD *)(v16 + 8) + 8 * v30);
      do
      {
        do
          v29 = (_QWORD *)*v29;
        while (v29[1] != 0x20A1ED17D78F322BLL);
      }
      while (v29[2] != 0x20A1ED17D78F322BLL);
    }
    else
    {
      v29 = *(_QWORD **)(*(_QWORD *)(v16 + 8) + 8 * ((v28 - 1) & 0x20A1ED17D78F322BLL));
      do
      {
        do
          v29 = (_QWORD *)*v29;
        while (v29[1] != 0x20A1ED17D78F322BLL);
      }
      while (v29[2] != 0x20A1ED17D78F322BLL);
    }
    v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v29[5] + 144) + 16) + 24);
    v32 = *(float *)(v31 + 480);
    *(float *)&v33 = x * v32;
    *(float *)&v32 = *(float *)(v31 + 1508) - y * v32;
    v56 = __PAIR64__(LODWORD(v32), v33);
    v34 = *(id *)(v31 + 216);
    v35 = dispatch_time(0, 500000000);
    v36 = dispatch_semaphore_wait(v34, v35);

    if (v36)
    {
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
      v37 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v54) = 0;
        _os_log_impl(&dword_19F029000, v37, OS_LOG_TYPE_ERROR, "Timeout waiting for bkgd layout to complete for selection", (uint8_t *)&v54, 2u);
      }

      v58 = 0;
      v59 = 0;
    }
    else
    {
      (*(void (**)(unint64_t *__return_ptr, _QWORD, unint64_t *))(**(_QWORD **)(v31 + 240)
                                                                                         + 232))(&v58, *(_QWORD *)(v31 + 240), &v56);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v31 + 216));
      if (v58)
      {
        +[VKLineMarker markerWithLabelFeatureMarker:](VKLineMarker, "markerWithLabelFeatureMarker:", &v58);
        mapEngine = objc_claimAutoreleasedReturnValue();
        v51 = v59;
        if (!v59)
          goto LABEL_18;
LABEL_63:
        p_shared_owners = (unint64_t *)&v51->__shared_owners_;
        do
          v53 = __ldaxr(p_shared_owners);
        while (__stlxr(v53 - 1, p_shared_owners));
        if (!v53)
        {
          ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
          std::__shared_weak_count::__release_weak(v51);
        }
        goto LABEL_18;
      }
    }
    if (!v4
      || (mapEngine = (uint64_t)self->super._mapEngine,
          md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(mapEngine + 4536), "-[VKMapCanvas markerAtScreenPoint:enableExtendedFeatureMarkers:]"), v38 = *(_QWORD *)(mapEngine + 856), v39 = *(_BYTE ***)(v38 + 40), v40 = *(_BYTE ***)(v38 + 48), v39 == v40))
    {
LABEL_61:
      mapEngine = 0;
    }
    else
    {
      while (1)
      {
        v41 = *v39;
        if (*v39 && v41[32])
        {
          (*(void (**)(unint64_t *__return_ptr, _BYTE *, char *))(*(_QWORD *)v41 + 88))(&v56, v41, (char *)v62 + 8);
          v42 = v56;
          if (v56)
          {
            v54 = v56;
            v55 = v57;
            if (v57)
            {
              v43 = (unint64_t *)&v57->__shared_owners_;
              do
                v44 = __ldxr(v43);
              while (__stxr(v44 + 1, v43));
            }
            +[VKMarker markerWithFeatureMarker:](VKMarker, "markerWithFeatureMarker:", &v54);
            mapEngine = objc_claimAutoreleasedReturnValue();
            v45 = v55;
            if (v55)
            {
              v46 = (unint64_t *)&v55->__shared_owners_;
              do
                v47 = __ldaxr(v46);
              while (__stlxr(v47 - 1, v46));
              if (!v47)
              {
                ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
                std::__shared_weak_count::__release_weak(v45);
              }
            }
          }
          v48 = v57;
          if (v57)
          {
            v49 = (unint64_t *)&v57->__shared_owners_;
            do
              v50 = __ldaxr(v49);
            while (__stlxr(v50 - 1, v49));
            if (!v50)
            {
              ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
              std::__shared_weak_count::__release_weak(v48);
            }
          }
          if (v42)
            break;
        }
        if (++v39 == v40)
          goto LABEL_61;
      }
    }
    v51 = v59;
    if (!v59)
      goto LABEL_18;
    goto LABEL_63;
  }
  +[VKLabelMarker markerWithLabelMarker:](VKLabelMarker, "markerWithLabelMarker:", &v60);
  mapEngine = objc_claimAutoreleasedReturnValue();
LABEL_18:
  v24 = v61;
  if (v61)
  {
    v25 = (unint64_t *)&v61->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  return (id)mapEngine;
}

- (void)transitionToTracking:(BOOL)a3 mapMode:(int64_t)a4 startLocation:(id)a5 startCourse:(double)a6 cameraController:(id)a7 pounceCompletionHandler:(id)a8
{
  double var1;
  double var0;
  _BOOL8 v13;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  int64_t v21;

  var1 = a5.var1;
  var0 = a5.var0;
  v13 = a3;
  v15 = a7;
  v16 = a8;
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("VKPounceWillStartNotification"), self, 0);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[VKCameraController stopRegionAnimation](self->super._cameraController, "stopRegionAnimation");
  -[VKScreenCanvas setCameraController:](self, "setCameraController:", v15);
  objc_msgSend(v15, "setScreenCanvas:", self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __111__VKMapCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke;
  v19[3] = &unk_1E42F3730;
  v18 = v16;
  v20 = v18;
  v21 = a4;
  v19[4] = self;
  objc_msgSend(v15, "startWithPounce:startLocation:startCourse:pounceCompletionHandler:", v13, v19, var0, var1, a6);

}

- (void)setCameraHorizontalOffset:(double)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8;
  double v10;
  double v11;
  double v12;
  float v13;
  VKTimedAnimation *v14;
  double type;
  VKCamera *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id v25[3];
  id location;

  v8 = a5;
  objc_msgSend(*(id *)&self->_lastValidCanvasSizeZoomLevel._value.type, "stop");
  if (a4 <= 0.0 || v8 == 0)
  {
    -[MDRenderTarget size](self->super._displayTarget, "size");
    v10 = 0.0;
    if (v11 > 0.0)
    {
      -[MDRenderTarget size](self->super._displayTarget, "size");
      v10 = a3 / v12;
    }
    -[VKCamera setHorizontalOffset:](self->super._vkCamera._obj, "setHorizontalOffset:", v10);
    v13 = v10;
    *((float *)self->super._camera.__ptr_ + 122) = v13;
  }
  else
  {
    objc_initWeak(&location, self);
    v14 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a4);
    type = self->_lastValidCanvasSizeZoomLevel._value.type;
    *(_QWORD *)&self->_lastValidCanvasSizeZoomLevel._value.type = v14;

    objc_msgSend(*(id *)&self->_lastValidCanvasSizeZoomLevel._value.type, "setTimingFunction:", VKAnimationCurveLinear);
    v16 = self->super._vkCamera._obj;
    -[VKCamera horizontalOffset](v16, "horizontalOffset");
    v18 = v17;
    -[MDRenderTarget size](self->super._displayTarget, "size");
    v20 = v19 * v18;

    v21 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __65__VKMapCanvas_setCameraHorizontalOffset_duration_timingFunction___block_invoke;
    v23[3] = &unk_1E42EB4F8;
    objc_copyWeak(v25, &location);
    v24 = v8;
    v25[1] = *(id *)&v20;
    v25[2] = *(id *)&a3;
    objc_msgSend(*(id *)&self->_lastValidCanvasSizeZoomLevel._value.type, "setStepHandler:", v23);
    v22[0] = v21;
    v22[1] = 3221225472;
    v22[2] = __65__VKMapCanvas_setCameraHorizontalOffset_duration_timingFunction___block_invoke_2;
    v22[3] = &unk_1E42F3E78;
    v22[4] = self;
    objc_msgSend(*(id *)&self->_lastValidCanvasSizeZoomLevel._value.type, "setCompletionHandler:", v22);
    -[VKScreenCanvas runAnimation:](self, "runAnimation:", *(_QWORD *)&self->_lastValidCanvasSizeZoomLevel._value.type);

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }

}

- (int64_t)tileSize
{
  return *(_QWORD *)(*((_QWORD *)self->super._mapEngine + 112) + 312);
}

- (void)populateDebugNode:(void *)a3 withOptions:(const void *)a4
{
  CGFloat width;
  CGFloat height;
  char *v8;
  void **v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  int v13;
  int v14;
  unint64_t v15;
  std::string *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[7];
  int v20;
  _BYTE v21[16];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _OWORD v27[2];
  _BYTE v28[25];
  std::string v29;
  int v30;
  _BYTE v31[25];
  std::string v32;
  int v33;

  BYTE7(v27[1]) = 16;
  strcpy((char *)v27, "Last Canvas Size");
  width = self->_lastCanvasSize.width;
  height = self->_lastCanvasSize.height;
  v8 = (char *)operator new(0x80uLL);
  *((CGFloat *)v8 + 2) = width;
  *((_QWORD *)v8 + 4) = 0;
  *((_QWORD *)v8 + 5) = 0;
  *((_QWORD *)v8 + 6) = 0;
  *((_DWORD *)v8 + 14) = 2;
  *((CGFloat *)v8 + 10) = height;
  *((_QWORD *)v8 + 12) = 0;
  v9 = (void **)(v8 + 96);
  *((_QWORD *)v8 + 13) = 0;
  *((_QWORD *)v8 + 14) = 0;
  v10 = *((_QWORD *)a3 + 10);
  v11 = *((_QWORD *)a3 + 11);
  *((_DWORD *)v8 + 30) = 2;
  if (v10 >= v11)
  {
    v12 = std::vector<gdc::DebugTreeProperty>::__emplace_back_slow_path<std::string const&,gdc::DebugTreeProperty::VisualizerType>((char **)a3 + 9, (uint64_t)v27, 0);
  }
  else
  {
    *(_OWORD *)v10 = v27[0];
    *(_QWORD *)(v10 + 16) = *(_QWORD *)&v27[1];
    *(_DWORD *)(v10 + 24) = 0;
    *(_OWORD *)(v10 + 32) = 0u;
    *(_OWORD *)(v10 + 48) = 0u;
    *(_OWORD *)(v10 + 64) = 0u;
    v12 = (char *)(v10 + 80);
  }
  *((_QWORD *)a3 + 10) = v12;
  *(_OWORD *)v31 = *(_OWORD *)v8;
  *(_OWORD *)&v31[9] = *(_OWORD *)(v8 + 9);
  if (v8[55] < 0)
    std::string::__init_copy_ctor_external(&v32, *((const std::string::value_type **)v8 + 4), *((_QWORD *)v8 + 5));
  else
    v32 = *(std::string *)(v8 + 32);
  v13 = *((_DWORD *)v8 + 14);
  v33 = v13;
  *(_OWORD *)v28 = *(_OWORD *)v31;
  *(_OWORD *)&v28[9] = *(_OWORD *)&v31[9];
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v29, v32.__r_.__value_.__l.__data_, v32.__r_.__value_.__l.__size_);
    v13 = v33;
  }
  else
  {
    v29 = v32;
  }
  v30 = v13;
  gdc::DebugTreeProperty::addValue((gdc::DebugTreeProperty *)(v12 - 80), (DebugTreeValue *)v28);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v29.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_12;
  }
  else if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_12;
  }
  operator delete(v32.__r_.__value_.__l.__data_);
LABEL_12:
  *(_OWORD *)v31 = *((_OWORD *)v8 + 4);
  *(_OWORD *)&v31[9] = *(_OWORD *)(v8 + 73);
  if (v8[119] < 0)
  {
    std::string::__init_copy_ctor_external(&v32, *((const std::string::value_type **)v8 + 12), *((_QWORD *)v8 + 13));
  }
  else
  {
    *(_OWORD *)&v32.__r_.__value_.__l.__data_ = *(_OWORD *)v9;
    v32.__r_.__value_.__r.__words[2] = *((_QWORD *)v8 + 14);
  }
  v14 = *((_DWORD *)v8 + 30);
  v33 = v14;
  *(_OWORD *)v28 = *(_OWORD *)v31;
  *(_OWORD *)&v28[9] = *(_OWORD *)&v31[9];
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v29, v32.__r_.__value_.__l.__data_, v32.__r_.__value_.__l.__size_);
    v14 = v33;
  }
  else
  {
    v29 = v32;
  }
  v30 = v14;
  gdc::DebugTreeProperty::addValue((gdc::DebugTreeProperty *)(v12 - 80), (DebugTreeValue *)v28);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v29.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_22;
  }
  else if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_22;
  }
  operator delete(v32.__r_.__value_.__l.__data_);
LABEL_22:
  *(_QWORD *)v31 = 1702521171;
  v31[23] = 4;
  v15 = *((_QWORD *)v12 - 2);
  if (v15 >= *((_QWORD *)v12 - 1))
  {
    v16 = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t)(v12 - 24), (uint64_t)v31);
  }
  else
  {
    *(_OWORD *)v15 = *(_OWORD *)v31;
    *(_QWORD *)(v15 + 16) = *(_QWORD *)&v31[16];
    v16 = (std::string *)(v15 + 24);
  }
  *((_QWORD *)v12 - 2) = v16;
  if ((v31[23] & 0x80000000) == 0)
  {
    if ((v8[119] & 0x80000000) == 0)
      goto LABEL_27;
LABEL_34:
    operator delete(*v9);
    if ((v8[55] & 0x80000000) == 0)
      goto LABEL_28;
    goto LABEL_35;
  }
  operator delete(*(void **)v31);
  if (v8[119] < 0)
    goto LABEL_34;
LABEL_27:
  if ((v8[55] & 0x80000000) == 0)
    goto LABEL_28;
LABEL_35:
  operator delete(*((void **)v8 + 4));
LABEL_28:
  operator delete(v8);
  if (SBYTE7(v27[1]) < 0)
    operator delete(*(void **)&v27[0]);
  v31[23] = 11;
  strcpy(v31, "Canvas Zoom");
  -[VKScreenCanvas vkCamera](self, "vkCamera");
  v17 = *(id *)&v28[8];
  objc_msgSend(v17, "displayZoomLevel");
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 2;
  v22 = v18;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v31, (uint64_t)v21);

  *(_QWORD *)v28 = &off_1E42B54B0;
  v31[23] = 15;
  strcpy(v31, "Traffic Enabled");
  v20 = 0;
  memset(&v19[4], 0, 24);
  v19[0] = -[VKMapCanvas trafficEnabled](self, "trafficEnabled");
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v31, (uint64_t)v19);
}

- (void)didBecomeActive
{
  VKCameraController *cameraController;
  __shared_weak_count *cntrl;
  Camera *ptr;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  Camera *v11;
  __shared_weak_count *v12;

  cameraController = self->super._cameraController;
  ptr = self->super._camera.__ptr_;
  cntrl = self->super._camera.__cntrl_;
  v11 = ptr;
  v12 = cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  -[VKCameraController setCamera:](cameraController, "setCamera:", &v11);
  v8 = (std::__shared_weak_count *)v12;
  if (v12)
  {
    v9 = (unint64_t *)((char *)v12 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

- (void)didBecomeInActive
{
  VKCameraController *cameraController;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  cameraController = self->super._cameraController;
  v6 = 0;
  v7 = 0;
  -[VKCameraController setCamera:](cameraController, "setCamera:", &v6);
  v3 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

- (void)setForceRasterizationForGlobe:(BOOL)a3
{
  double canonicalSkyHeight;
  char *v5;
  id *v6;
  id *v7;
  id v8;
  id v9;
  char *v10;
  char *v11;
  void (**v12)(char *);
  BOOL v13;
  double v14;
  char *v15;
  id *v16;
  id *v17;
  id v18;
  id v19;
  char *v20;
  char *v21;
  void (**v22)(char *);
  char *v23;
  id *v24;
  uint64_t v25;

  if (LOBYTE(self->_puckAnimator) == a3)
    return;
  LOBYTE(self->_puckAnimator) = a3;
  canonicalSkyHeight = self->_canonicalSkyHeight;
  std::mutex::lock((std::mutex *)(*(_QWORD *)&canonicalSkyHeight + 232));
  v23 = 0;
  v24 = 0;
  v25 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v23, *(_QWORD *)(*(_QWORD *)&canonicalSkyHeight + 160), *(_QWORD *)(*(_QWORD *)&canonicalSkyHeight + 168), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(_QWORD *)(*(_QWORD *)&canonicalSkyHeight + 168) - *(_QWORD *)(*(_QWORD *)&canonicalSkyHeight + 160)) >> 3));
  std::mutex::unlock((std::mutex *)(*(_QWORD *)&canonicalSkyHeight + 232));
  v5 = v23;
  v6 = v24;
  if (v23 != (char *)v24)
  {
    v7 = (id *)v23;
    do
    {
      v8 = v7[1];
      objc_msgSend(v8, "setForceRasterizationForGlobe:", LOBYTE(self->_puckAnimator));

      v9 = v7[1];
      objc_msgSend(v9, "setNeedsDisplayForReason:", 2);

      v7 += 3;
    }
    while (v7 != v6);
    if (!v5)
      goto LABEL_13;
    if (v5 != (char *)v6)
    {
      v10 = (char *)(v6 - 3);
      v11 = (char *)(v6 - 3);
      do
      {
        v12 = *(void (***)(char *))v11;
        v11 -= 24;
        (*v12)(v10);
        v13 = v10 == v5;
        v10 = v11;
      }
      while (!v13);
    }
    goto LABEL_12;
  }
  if (v23)
LABEL_12:
    operator delete(v5);
LABEL_13:
  v14 = self->_canonicalSkyHeight;
  std::mutex::lock((std::mutex *)(*(_QWORD *)&v14 + 232));
  v23 = 0;
  v24 = 0;
  v25 = 0;
  std::vector<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>(&v23, *(_QWORD *)(*(_QWORD *)&v14 + 184), *(_QWORD *)(*(_QWORD *)&v14 + 192), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(*(_QWORD *)&v14 + 192) - *(_QWORD *)(*(_QWORD *)&v14 + 184)) >> 3));
  std::mutex::unlock((std::mutex *)(*(_QWORD *)&v14 + 232));
  v15 = v23;
  v16 = v24;
  if (v23 == (char *)v24)
  {
    if (!v23)
      return;
    goto LABEL_23;
  }
  v17 = (id *)v23;
  do
  {
    v18 = v17[1];
    objc_msgSend(v18, "setForceRasterizationForGlobe:", LOBYTE(self->_puckAnimator));

    v19 = v17[1];
    objc_msgSend(v19, "setNeedsDisplayForReason:", 2);

    v17 += 3;
  }
  while (v17 != v16);
  if (v15)
  {
    if (v15 != (char *)v16)
    {
      v20 = (char *)(v16 - 3);
      v21 = (char *)(v16 - 3);
      do
      {
        v22 = *(void (***)(char *))v21;
        v21 -= 24;
        (*v22)(v20);
        v13 = v20 == v15;
        v20 = v21;
      }
      while (!v13);
    }
LABEL_23:
    operator delete(v15);
  }
}

- (VKInteractiveMapDelegate)delegate
{
  return (VKInteractiveMapDelegate *)objc_loadWeakRetained((id *)&self->_forceRasterizationForGlobe);
}

- (double)canonicalSkyHeight
{
  return *(double *)&self->_horizontalOffsetAnimation;
}

- (VKPuckAnimator)puckAnimator
{
  return (VKPuckAnimator *)objc_loadWeakRetained((id *)&self->_consoleFpsUpdateTicker);
}

- (BOOL)forceRasterizationForGlobe
{
  return (BOOL)self->_puckAnimator;
}

- (BOOL)trafficEnabled
{
  return BYTE1(self->_puckAnimator);
}

- (void)setTrafficEnabled:(BOOL)a3
{
  BYTE1(self->_puckAnimator) = a3;
}

- (void).cxx_destruct
{
  OverlayContainer *ptr;
  unint64_t *v4;
  unint64_t v5;

  objc_destroyWeak((id *)&self->_forceRasterizationForGlobe);
  objc_destroyWeak((id *)&self->_consoleFpsUpdateTicker);
  ptr = self->_overlayContainer.__ptr_;
  if (ptr)
  {
    v4 = (unint64_t *)((char *)ptr + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(OverlayContainer *))(*(_QWORD *)ptr + 16))(ptr);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)ptr);
    }
  }
  objc_storeStrong((id *)&self->_lastValidCanvasSizeZoomLevel._value, 0);
  if (self->_lastValidCanvasSizeZoomLevel._hasValue)
    self->_lastValidCanvasSizeZoomLevel._hasValue = 0;
}

void __65__VKMapCanvas_setCameraHorizontalOffset_duration_timingFunction___block_invoke(uint64_t a1, float a2)
{
  id *WeakRetained;
  double v5;
  float v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  id *v13;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v13 = WeakRetained;
    *(float *)&v5 = a2;
    objc_msgSend(*(id *)(a1 + 32), "_solveForInput:", v5);
    v7 = v6;
    v8 = *(double *)(a1 + 48);
    v9 = *(double *)(a1 + 56);
    objc_msgSend(v13[13], "size");
    v11 = (v8 + (v9 - v8) * v7) / v10;
    objc_msgSend(v13[7], "setHorizontalOffset:", v11);
    WeakRetained = v13;
    v12 = v11;
    *((float *)v13[9] + 122) = v12;
  }

}

void __65__VKMapCanvas_setCameraHorizontalOffset_duration_timingFunction___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 696);
  *(_QWORD *)(v1 + 696) = 0;

}

void __111__VKMapCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  dispatch_time_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v2 = a1[5];
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (a1[6] == 1)
  {
    v3 = dispatch_time(0, 4000000000);
    v4 = a1[4];
    v5 = **(NSObject ***)(v4 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__VKMapCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke_2;
    block[3] = &unk_1E42F6DA0;
    block[4] = v4;
    dispatch_after(v3, v5, block);
  }
}

void __111__VKMapCanvas_transitionToTracking_mapMode_startLocation_startCourse_cameraController_pounceCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("VKPounceDidEndNotification"), *(_QWORD *)(a1 + 32), 0);

}

BOOL __44__VKMapCanvas_globeAnnotationCoordinateTest__block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  double v6;
  long double v7;
  __double2 v8;
  __double2 v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v6 = *(double *)(v5 + 32);
  v7 = 6371008.77 / (v6 / cos(*(long double *)(v5 + 40)) + 6371008.77);
  v8 = __sincos_stret(*(double *)(v5 + 8));
  v9 = __sincos_stret(a2 * 0.0174532925);
  return v8.__sinval * v9.__sinval + v8.__cosval * v9.__cosval * cos(-(*(double *)(v5 + 16) - a3 * 0.0174532925)) > v7;
}

uint64_t __38__VKMapCanvas_globeAnnotationRectTest__block_invoke()
{
  return 2;
}

- (void)observeValueForKeyPath:ofObject:change:context:
{
  uint64_t v2;
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  gdc::LayerDataStore *v5;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(unsigned __int16 **)(v2 + 80);
  v4 = *(unsigned __int16 **)(v2 + 88);
  if (v3 != v4)
  {
    while (*v3 != *a2)
    {
      v3 += 8;
      if (v3 == v4)
        return;
    }
  }
  if (v3 != v4)
  {
    v5 = (gdc::LayerDataStore *)*((_QWORD *)v3 + 1);
    if (v5)
      gdc::LayerDataStore::clearAllData(v5);
  }
}

- (_QWORD)observeValueForKeyPath:ofObject:change:context:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E42C7DC0;
  result[1] = v3;
  return result;
}

- (uint64_t)observeValueForKeyPath:ofObject:change:context:
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E42C7DC0;
  a2[1] = v2;
  return result;
}

- (void)visibleTileSets
{
  unint64_t v3;
  unsigned __int16 *v5;
  unsigned __int16 *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  int v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  unint64_t v22;
  unsigned int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  unsigned int v34;
  unsigned __int16 v35;
  void *__p;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a2 != a3)
  {
    v5 = a2;
    while (1)
    {
      v35 = *v5;
      std::unordered_set<gdc::ResourceKey,gdc::ResourceKeyHash,std::equal_to<gdc::ResourceKey>,std::allocator<gdc::ResourceKey>>::unordered_set((uint64_t)&__p, (uint64_t)(v5 + 4));
      v7 = (unsigned __int16 *)*((_QWORD *)**a1 + 4);
      if (v7 != *((unsigned __int16 **)**a1 + 5))
      {
        while (*v7 != v35)
          v7 += 8;
      }
      (*(void (**)(uint64_t *__return_ptr))(**((_QWORD **)v7 + 1) + 88))(&v33);
      if ((_BYTE)v33)
        break;
LABEL_24:
      v18 = v37;
      if (v37)
      {
        do
        {
          v20 = (_QWORD *)*v18;
          v21 = (void *)v18[3];
          if (v21 != (void *)v18[5])
            free(v21);
          operator delete(v18);
          v18 = v20;
        }
        while (v20);
      }
      v19 = __p;
      __p = 0;
      if (v19)
        operator delete(v19);
      v5 += 24;
      if (v5 == a3)
        return;
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = *a1[1];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "style");
          if (v14 == v34)
          {
            v15 = objc_msgSend(v13, "identifier");
            if (v15 == HIDWORD(v33))
            {
              v16 = v13;

              v10 = v16;
            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v9);

      if (v10)
        goto LABEL_22;
    }
    else
    {

    }
    v10 = objc_alloc_init(MEMORY[0x1E0D273E0]);
    objc_msgSend(v10, "setStyle:", v34);
    objc_msgSend(v10, "setIdentifier:", HIDWORD(v33));
    objc_msgSend(*a1[1], "addObject:", v10);
LABEL_22:
    v17 = v37;
    if (v37)
    {
      do
      {
        v22 = 0;
        v23 = (unsigned int *)v17[3];
        v24 = *((unsigned __int8 *)v23 + 8);
        v26 = *v23;
        v25 = v23[1];
        while (v22 < objc_msgSend(v10, "tileKeysCount"))
        {
          v27 = objc_msgSend(v10, "tileKeyAtIndex:", v22++);
          if (__PAIR64__(v26, v25) == v27 && (_DWORD)v24 == v28)
            goto LABEL_31;
        }
        v3 = v3 & 0xFFFFFFF800000000 | v24 | 0x700000000;
        objc_msgSend(v10, "addTileKey:", v25 | (v26 << 32), v3);
LABEL_31:
        v17 = (_QWORD *)*v17;
      }
      while (v17);
    }

    goto LABEL_24;
  }
}

- (__n128)visibleTileSets
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E42C75E0;
  result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

@end
