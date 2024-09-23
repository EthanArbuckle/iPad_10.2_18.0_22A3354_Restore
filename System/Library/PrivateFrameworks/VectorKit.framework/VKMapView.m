@implementation VKMapView

- (double)altitude
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "altitude");
  v5 = v4;

  return v5;
}

- (void)initWithDescriptor:
{
  JUMPOUT(0x1A1AF4E00);
}

- (uint64_t)initWithDescriptor:
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E42C7670;
  a2[1] = v2;
  return result;
}

- (BOOL)isPitchable
{
  void *v2;
  void *v3;
  char v4;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPitchEnabled");

  return v4;
}

- (id)annotationCoordinateTest
{
  void *v2;
  void *v3;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "annotationCoordinateTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)topDownMinimumZoomLevelForTileSize:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topDownMinimumZoomLevelForTileSize:", a3);
  v7 = v6;

  return v7;
}

- (void)setEdgeInsets:(VKEdgeInsets)a3 duration:(double)a4 timingFunction:(id)a5 completionHandler:(id)a6
{
  float right;
  float bottom;
  float left;
  float top;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  _BOOL4 v21;
  NSObject *v22;
  VKTimedAnimation *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  float *v43;
  std::__shared_weak_count *v44;
  unint64_t *p_shared_owners;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  void *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  int v57;
  int v58;
  int v59;
  int v60;
  VKEdgeInsets v61;
  _QWORD v62[4];
  id v63;
  unint64_t v64;
  unint64_t v65;
  VKEdgeInsets v66;
  uint8_t buf[4];
  VKMapView *v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  uint64_t v77;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v77 = *MEMORY[0x1E0C80C00];
  v66 = a3;
  v13 = a5;
  v14 = a6;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "edgeInsets");
  v64 = __PAIR64__(v17, v16);
  v65 = __PAIR64__(v19, v18);

  v21 = *(_QWORD *)&v66.top != v64 || *(_QWORD *)&v66.bottom != v65;
  objc_msgSend(*((id *)self + 19), "stop");
  if (v21)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v22 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219008;
      v68 = self;
      v69 = 2048;
      v70 = top;
      v71 = 2048;
      v72 = bottom;
      v73 = 2048;
      v74 = left;
      v75 = 2048;
      v76 = right;
      _os_log_impl(&dword_19F029000, v22, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set edge insets: top: %f, bottom: %f, left: %f, right: %f", buf, 0x34u);
    }
    if (a4 > 0.0 && v13)
    {
      *((VKEdgeInsets *)self + 10) = v66;
      v23 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a4);
      v24 = (void *)*((_QWORD *)self + 19);
      *((_QWORD *)self + 19) = v23;

      v25 = MEMORY[0x1E0C809B0];
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __69__VKMapView_setEdgeInsets_duration_timingFunction_completionHandler___block_invoke;
      v62[3] = &unk_1E42EB630;
      v63 = v13;
      objc_msgSend(*((id *)self + 19), "setTimingFunction:", v62);
      -[VKMapView currentCanvas](self, "currentCanvas");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "edgeInsets");
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;

      objc_initWeak((id *)buf, self);
      v55[0] = v25;
      v55[1] = 3221225472;
      v55[2] = __69__VKMapView_setEdgeInsets_duration_timingFunction_completionHandler___block_invoke_2;
      v55[3] = &unk_1E42EB270;
      objc_copyWeak(&v56, (id *)buf);
      v57 = v28;
      v58 = v30;
      v59 = v32;
      v60 = v34;
      v61 = v66;
      objc_msgSend(*((id *)self + 19), "setStepHandler:", v55);
      v49 = v25;
      v50 = 3221225472;
      v51 = __69__VKMapView_setEdgeInsets_duration_timingFunction_completionHandler___block_invoke_3;
      v52 = &unk_1E42F9D20;
      objc_copyWeak(&v54, (id *)buf);
      v53 = v14;
      objc_msgSend(*((id *)self + 19), "setCompletionHandler:", &v49);
      -[VKMapView currentCanvas](self, "currentCanvas", v49, v50, v51, v52);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "cameraController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setEdgeInsetsAnimating:", 1);

      -[VKMapView runAnimation:](self, "runAnimation:", *((_QWORD *)self + 19));
      objc_destroyWeak(&v54);
      objc_destroyWeak(&v56);
      objc_destroyWeak((id *)buf);

      goto LABEL_30;
    }
    -[VKMapView currentCanvas](self, "currentCanvas");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v38 = top;
    *(float *)&v39 = left;
    *(float *)&v40 = bottom;
    *(float *)&v41 = right;
    objc_msgSend(v37, "setEdgeInsets:", v38, v39, v40, v41);

    *(VKEdgeInsets *)(*((_QWORD *)self + 48) + 960) = v66;
    v42 = *((_QWORD *)self + 48);
    v43 = *(float **)(v42 + 1064);
    v44 = *(std::__shared_weak_count **)(v42 + 1072);
    if (v44)
    {
      p_shared_owners = (unint64_t *)&v44->__shared_owners_;
      do
        v46 = __ldxr(p_shared_owners);
      while (__stxr(v46 + 1, p_shared_owners));
      v43[108] = top;
      v43[109] = left;
      v43[110] = bottom;
      v43[111] = right;
      do
        v47 = __ldaxr(p_shared_owners);
      while (__stlxr(v47 - 1, p_shared_owners));
      if (v47)
      {
        if (!v14)
          goto LABEL_29;
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
        std::__shared_weak_count::__release_weak(v44);
        if (!v14)
        {
LABEL_29:
          v48 = *((_QWORD *)self + 48);
          buf[0] = 1;
          md::MapEngine::setNeedsTick(v48, buf);
          goto LABEL_30;
        }
      }
    }
    else
    {
      v43[108] = top;
      v43[109] = left;
      v43[110] = bottom;
      v43[111] = right;
      if (!v14)
        goto LABEL_29;
    }
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
    goto LABEL_29;
  }
  if (v14)
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
LABEL_30:

}

- (VKEdgeInsets)edgeInsets
{
  float v2;
  float v3;
  float v4;
  float v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  VKEdgeInsets result;

  if (*((_QWORD *)self + 19))
  {
    v2 = *((float *)self + 40);
    v3 = *((float *)self + 41);
    v4 = *((float *)self + 42);
    v5 = *((float *)self + 43);
  }
  else
  {
    -[VKMapView currentCanvas](self, "currentCanvas");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "edgeInsets");
    v2 = v7;
    v3 = v8;
    v4 = v9;
    v5 = v10;

  }
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)wantsTimerTick
{
  void *v2;
  char v3;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsTimerTick");

  return v3;
}

- (id)currentCanvas
{
  int *v3;

  if (!*(_BYTE *)(*((_QWORD *)self + 48) + 1241)
    && (-[VKMapView mapType](self, "mapType") == 4
     || -[VKMapView mapType](self, "mapType") == 3
     || -[VKMapView mapType](self, "mapType") == 10))
  {
    v3 = &OBJC_IVAR___VKMapView__globe;
  }
  else
  {
    v3 = &OBJC_IVAR___VKMapView__canvas;
  }
  return *(id *)((char *)self + *v3);
}

- (int)mapType
{
  if (*((_BYTE *)self + 32))
    return *((_DWORD *)self + 9);
  else
    return 0;
}

- (BOOL)isPitched
{
  void *v2;
  void *v3;
  char v4;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPitched");

  return v4;
}

- (double)currentZoomLevelForTileSize:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentZoomLevelForTileSize:", a3);
  v7 = v6;

  return v7;
}

- (double)yaw
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heading");
  v5 = v4;

  return v5;
}

- (double)presentationYaw
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heading");
  v5 = v4;

  return v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)centerCoordinate
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerCoordinate");
  v5 = v4;
  v7 = v6;

  v8 = 0.0;
  v9 = v5;
  v10 = v7;
  result.var2 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (double)pitch
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pitch");
  v5 = v4;

  return v5;
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  -[VKMapView setEdgeInsets:duration:timingFunction:completionHandler:](self, "setEdgeInsets:duration:timingFunction:completionHandler:", 0, 0, *(double *)&a3.top, *(double *)&a3.left, *(double *)&a3.bottom, *(double *)&a3.right, 0.0);
}

- (void)activateInternalSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (os_variant_has_internal_ui())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persistentDomainForName:", CFSTR("com.apple.Maps"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", CFSTR("ActivateMapInspectorOnLaunch"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if (objc_msgSend(v4, "isEqual:", &unk_1E43475E8))
      {
        +[MIController sharedController](MIController, "sharedController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "activateController:", self);

      }
    }

  }
}

- (void)setLabelSelectionFilter:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)self + 77);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)self + 77, obj);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 312), a3);

  }
}

- (void)_labelSettings
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;

  v2 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
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

- (BOOL)isAnimatingToTrackAnnotation
{
  void *v2;
  void *v3;
  char v4;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "isAnimatingToTrackAnnotation");
  else
    v4 = 0;

  return v4;
}

- (void)setIconsShouldAlignToPixels:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  VKMapView *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (-[VKMapView iconsShouldAlignToPixels](self, "iconsShouldAlignToPixels") != a3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v5 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v6 = "NO";
      if (v3)
        v6 = "YES";
      v7 = 134218242;
      v8 = self;
      v9 = 2080;
      v10 = v6;
      _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set icons should align to pixels: %s", (uint8_t *)&v7, 0x16u);
    }
    *(_BYTE *)(*((_QWORD *)self + 48) + 976) = v3;
    -[VKMapView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)iconsShouldAlignToPixels
{
  return *(_BYTE *)(*((_QWORD *)self + 48) + 976);
}

- (void)setNeedsLayout
{
  uint64_t v2;
  char v3;

  v2 = *((_QWORD *)self + 48);
  v3 = 1;
  md::MapEngine::setNeedsTick(v2, &v3);
}

- (BOOL)rendersInBackground
{
  return *(_BYTE *)(*((_QWORD *)self + 48) + 1178);
}

- (BOOL)supportsMapType:(int)a3
{
  uint64_t v3;
  double v5;
  __objc2_class **v6;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  -[VKMapView contentsScale](self, "contentsScale");
  if (v3 <= 0xA && ((1 << v3) & 0x418) != 0 && !*(_BYTE *)(*((_QWORD *)self + 48) + 1241))
    v6 = off_1E426D410;
  else
    v6 = off_1E426D490;
  if (v5 <= 1.0)
    v7 = 1;
  else
    v7 = 2;
  return -[__objc2_class supportsMapType:scale:](*v6, "supportsMapType:scale:", v3, v7);
}

- (BOOL)isGesturing
{
  void *v2;
  void *v3;
  char v4;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGesturing");

  return v4;
}

- (void)didPresent
{
  char v3;
  id v4;
  id WeakRetained;
  id v6;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didPresent");

  WeakRetained = objc_loadWeakRetained((id *)self + 15);
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)self + 15);
    objc_msgSend(v6, "mapLayerDidDraw:", self);

  }
}

- (BOOL)canEnter3DMode
{
  void *v2;
  void *v3;
  char v4;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "canEnter3DMode");
  else
    v4 = 1;

  return v4;
}

- (id)annotationRectTest
{
  void *v2;
  void *v3;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "annotationRectTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)maximumZoomLevelForTileSize:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maximumZoomLevelForTileSize:", a3);
  v7 = v6;

  return v7;
}

- (void)setEmphasis:(unsigned __int8)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  NSObject *v7;
  unsigned int v8;
  double v9;
  void *v10;
  float v11;
  float v12;
  int8x8_t *v13;
  int8x8_t v14;
  uint8x8_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  VKMapView *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*((unsigned __int8 *)self + 144) == a3)
    return;
  v4 = a4;
  v5 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v7 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v5 == 2)
      v8 = 2;
    else
      v8 = v5 == 1;
    v25 = 134218242;
    v26 = self;
    v27 = 2080;
    v28 = gss::to_string(v8);
    _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set emphasis: %s", (uint8_t *)&v25, 0x16u);
  }

  *((_BYTE *)self + 144) = v5;
  LODWORD(v9) = 0;
  if (v4)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transitionTimeMultiplier");
    v12 = v11;

    *(float *)&v9 = v12 * 0.6;
  }
  v13 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v14 = v13[2];
  if (!*(_QWORD *)&v14)
    goto LABEL_31;
  v15 = (uint8x8_t)vcnt_s8(v14);
  v15.i16[0] = vaddlv_u8(v15);
  if (v15.u32[0] > 1uLL)
  {
    v16 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v14 <= 0x2FED70A4459DFCA1uLL)
      v16 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v14;
  }
  else
  {
    v16 = (*(_QWORD *)&v14 - 1) & 0x2FED70A4459DFCA1;
  }
  v17 = *(_QWORD **)(*(_QWORD *)&v13[1] + 8 * v16);
  if (!v17 || (v18 = (_QWORD *)*v17) == 0)
  {
LABEL_31:
    v22 = 0;
    goto LABEL_32;
  }
  if (v15.u32[0] < 2uLL)
  {
    v19 = *(_QWORD *)&v14 - 1;
    while (1)
    {
      v21 = v18[1];
      if (v21 == 0x2FED70A4459DFCA1)
      {
        if (v18[2] == 0x2FED70A4459DFCA1)
          goto LABEL_37;
      }
      else if ((v21 & v19) != v16)
      {
        goto LABEL_31;
      }
      v18 = (_QWORD *)*v18;
      if (!v18)
        goto LABEL_31;
    }
  }
  while (1)
  {
    v20 = v18[1];
    if (v20 == 0x2FED70A4459DFCA1)
      break;
    if (v20 >= *(_QWORD *)&v14)
      v20 %= *(_QWORD *)&v14;
    if (v20 != v16)
      goto LABEL_31;
LABEL_21:
    v18 = (_QWORD *)*v18;
    if (!v18)
      goto LABEL_31;
  }
  if (v18[2] != 0x2FED70A4459DFCA1)
    goto LABEL_21;
LABEL_37:
  v22 = v18[5];
LABEL_32:
  if (v5 == 2)
    v23 = 2;
  else
    v23 = v5 == 1;
  md::StyleLogic::setEmphasis(v22, v23, *(float *)&v9);
  v24 = *((_QWORD *)self + 48);
  LOBYTE(v25) = 1;
  md::MapEngine::setNeedsTick(v24, &v25);
  -[VKMapView _updateOnlyShowRoadClosures](self, "_updateOnlyShowRoadClosures");
  -[VKMapView _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)setTrafficEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  md::LabelManager *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[24];
  _BYTE *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v18 = 134218242;
    *(_QWORD *)&v18[4] = self;
    *(_WORD *)&v18[12] = 2080;
    *(_QWORD *)&v18[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set trafficEnabled: %s", v18, 0x16u);
  }
  v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v18[0] = 2;
  md::MapEngineSettings::set(v7, v18, (_QWORD *)v3);
  v8 = -[VKMapView _labelSettings](self, "_labelSettings");
  if (!v3)
    goto LABEL_14;
  v9 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v10 = *v9;
  v11 = v9[1];
  if (v10 != v11)
  {
    while (*(_BYTE *)v10 != 3)
    {
      v10 += 16;
      if (v10 == v11)
        goto LABEL_14;
    }
  }
  if (v10 == v11)
LABEL_14:
    v12 = 0;
  else
    v12 = *(_QWORD *)(v10 + 8) != 0;
  *(_BYTE *)(v8[5] + 25) = v12;
  v13 = (md::LabelManager *)v8[3];
  *((_BYTE *)v13 + 3568) = v12;
  *(_QWORD *)v18 = &off_1E42C9998;
  *(_QWORD *)&v18[8] = v13;
  *(_QWORD *)&v18[16] = v12;
  v19 = v18;
  md::LabelManager::queueCommand(v13, 14, 1, v18);
  v14 = v19;
  if (v19 == v18)
  {
    v15 = 4;
    v14 = v18;
  }
  else
  {
    if (!v19)
      goto LABEL_20;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_20:
  v16 = (uint64_t)-[VKMapView mapDisplayStyle](self, "mapDisplayStyle");
  if ((v16 & 0xFE00) == 0)
  {
    v17 = 256;
    if (!v3)
      v17 = 0;
    -[VKMapView setMapDisplayStyle:](self, "setMapDisplayStyle:", v16 & 0xFFFFFFFF00FFLL | v17);
  }
  -[VKMapView _updateOnlyShowRoadClosures](self, "_updateOnlyShowRoadClosures");
}

- (void)_updateOnlyShowRoadClosures
{
  unsigned int BOOL;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  md::LabelManager *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[24];
  _BYTE *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)self + 144) == 2 && !*((_BYTE *)self + 209))
    BOOL = GEOConfigGetBOOL();
  else
    BOOL = 0;
  v4 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v5 = *v4;
  v6 = v4[1];
  if (v5 != v6)
  {
    while (*(_BYTE *)v5 != 4)
    {
      v5 += 16;
      if (v5 == v6)
        goto LABEL_10;
    }
  }
  if (v5 == v6)
LABEL_10:
    v7 = 0;
  else
    v7 = *(_QWORD *)(v5 + 8);
  if (v7 != BOOL)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v8 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v26 = 134218240;
      *(_QWORD *)&v26[4] = self;
      *(_WORD *)&v26[12] = 1024;
      *(_DWORD *)&v26[14] = BOOL;
      _os_log_impl(&dword_19F029000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set onlyShowRoadClosures: %i", v26, 0x12u);
    }
    v9 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
    v26[0] = 4;
    md::MapEngineSettings::set(v9, v26, (_QWORD *)BOOL);
    v10 = -[VKMapView _labelSettings](self, "_labelSettings");
    if (!BOOL)
      goto LABEL_24;
    v11 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
    v12 = *v11;
    v13 = v11[1];
    if (v12 != v13)
    {
      while (*(_BYTE *)v12 != 3)
      {
        v12 += 16;
        if (v12 == v13)
          goto LABEL_24;
      }
    }
    if (v12 == v13)
LABEL_24:
      v14 = 0;
    else
      v14 = *(_QWORD *)(v12 + 8) != 0;
    *(_BYTE *)(v10[5] + 26) = v14;
    v15 = (md::LabelManager *)v10[3];
    *((_BYTE *)v15 + 3569) = v14;
    *(_QWORD *)v26 = &off_1E42CA328;
    *(_QWORD *)&v26[8] = v15;
    *(_QWORD *)&v26[16] = v14;
    v27 = v26;
    md::LabelManager::queueCommand(v15, 15, 1, v26);
    v16 = v27;
    if (v27 == v26)
    {
      v17 = 4;
      v16 = v26;
    }
    else
    {
      if (!v27)
        goto LABEL_30;
      v17 = 5;
    }
    (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_30:
    v18 = *(_QWORD *)(*((_QWORD *)self + 48) + 896);
    if (v18)
    {
      v19 = *(_QWORD *)(v18 + 32);
      v20 = *(_QWORD *)(v18 + 40);
      v21 = v19;
      if (v19 != v20)
      {
        v21 = v19;
        while (*(_WORD *)v21 != 52)
        {
          v21 += 16;
          if (v21 == v20)
            goto LABEL_39;
        }
      }
      if (v21 != v20)
      {
        v22 = *(_QWORD *)(v21 + 8);
        if (v22)
          *(_BYTE *)(v22 + 785) = BOOL;
      }
LABEL_39:
      if (v19 != v20)
      {
        v23 = v19;
        while (*(_WORD *)v23 != 53)
        {
          v23 += 16;
          if (v23 == v20)
            goto LABEL_49;
        }
        if (v23 != v20)
        {
          v24 = *(_QWORD *)(v23 + 8);
          if (v24)
            *(_BYTE *)(v24 + 785) = BOOL;
        }
LABEL_49:
        while (v19 != v20)
        {
          if (*(_WORD *)v19 == 2)
          {
            if (v19 != v20)
            {
              v25 = *(_QWORD *)(v19 + 8);
              if (v25)
                *(_BYTE *)(v25 + 802) = BOOL;
            }
            return;
          }
          v19 += 16;
        }
      }
    }
  }
}

- (void)_applyMapDisplayStyle:(id)a3 animated:(BOOL)a4 duration:(double)a5
{
  uint64_t v6;
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
  uint64_t v17;
  float v18;
  float v19;
  unsigned int v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  geo::read_write_lock *v29;
  const char *v30;
  geo::read_write_lock *v31;
  const char *v32;
  gss::Allocator *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  float v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[15];
  char v49;
  unint64_t v50;

  v6 = *(_QWORD *)&a3.var0;
  v7 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v8 = v7[2];
  v43 = a4;
  if (!*(_QWORD *)&v8)
    goto LABEL_21;
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
LABEL_21:
    v16 = 0;
    goto LABEL_22;
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
          goto LABEL_77;
      }
      else if ((v15 & v13) != v10)
      {
        goto LABEL_21;
      }
      v12 = (_QWORD *)*v12;
      if (!v12)
        goto LABEL_21;
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
      goto LABEL_21;
LABEL_11:
    v12 = (_QWORD *)*v12;
    if (!v12)
      goto LABEL_21;
  }
  if (v12[2] != 0x2FED70A4459DFCA1)
    goto LABEL_11;
LABEL_77:
  v16 = v12[5];
LABEL_22:
  if ((a3.var2 - 1) > 8u)
    v17 = 0;
  else
    v17 = qword_1A007B738[(a3.var2 - 1)];
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "transitionTimeMultiplier");
  v19 = v18;
  if (*(_DWORD *)(v16 + 1096) == 8)
  {
    v20 = 2;
  }
  else
  {
    v21 = *(uint64_t **)(v16 + 184);
    v22 = *v21;
    v23 = v21[1];
    if (v22 != v23)
    {
      while (*(_BYTE *)v22 != 2)
      {
        v22 += 16;
        if (v22 == v23)
          goto LABEL_33;
      }
    }
    if (v22 == v23)
LABEL_33:
      v24 = 0;
    else
      v24 = *(_QWORD *)(v22 + 8);
    v20 = v24 != 0;
  }
  v47 = *(unsigned __int8 *)(v16 + 164);
  v46 = *(unsigned __int8 *)(v16 + 166);
  v25 = gss::ClientStyleState<gss::PropertyID>::targetMapDisplayStyle(*(_QWORD *)(v16 + 208));
  v26 = v6 & 0xFFFFFF00FFFFLL | v17;
  v27 = (v6 | v17);
  if (v27 != v25
    || v20 != BYTE1(v25)
    || BYTE2(v17) != BYTE2(v25)
    || (unint64_t)(v6 & 0xFF00FFFF | v17) >> 24 != BYTE3(v25)
    || BYTE4(v26) != BYTE4(v25)
    || BYTE5(v26) != BYTE5(v25)
    || (_DWORD)v47 != BYTE6(v25)
    || v46 != HIBYTE(v25))
  {
    goto LABEL_59;
  }
  if (*(_QWORD *)(v16 + 272))
  {
    v28 = *(_QWORD *)(v16 + 224);
    v50 = v28 + 16;
    v29 = (geo::read_write_lock *)pthread_rwlock_rdlock((pthread_rwlock_t *)(v28 + 16));
    if ((_DWORD)v29)
      geo::read_write_lock::logFailure(v29, (uint64_t)"read lock", v30);
    memset(v48, 0, sizeof(v48));
    v49 = 1;
    geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::copy(v48, v28 + 232);
    v31 = (geo::read_write_lock *)pthread_rwlock_unlock((pthread_rwlock_t *)(v28 + 16));
    if ((_DWORD)v31)
      geo::read_write_lock::logFailure(v31, (uint64_t)"unlock", v32);
    v33 = (gss::Allocator *)gss::DisplayStyle::DisplayStyle((uint64_t)&v50, (uint64_t)v48);
    if (!v48[14])
    {
      v34 = *(_QWORD *)v48;
      if (*(_QWORD *)v48)
      {
        v35 = gss::Allocator::instance(v33);
        (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v35 + 40))(v35, v34, *(unsigned __int16 *)&v48[12]);
      }
    }
    if (v27 != v50
      || v20 != BYTE1(v50)
      || BYTE2(v17) != BYTE2(v50)
      || BYTE3(v26) != BYTE3(v50)
      || BYTE4(v26) != BYTE4(v50)
      || BYTE5(v26) != BYTE5(v50)
      || (_DWORD)v47 != BYTE6(v50)
      || v46 != HIBYTE(v50))
    {
LABEL_59:
      *(_BYTE *)(v16 + 176) = BYTE2(v17);
      v36 = *(void **)(v16 + 1184);
      if (v36)
        objc_msgSend(v36, "stop");
      v37 = v26 & 0xFFFFFFFF00FFLL | ((unint64_t)v20 << 8) | (v46 << 56) | (v47 << 48);
      gss::ClientStyleState<gss::PropertyID>::setTargetMapDisplayStyle(*(_QWORD *)(v16 + 208), v37);
      gss::ClientStyleState<gss::ScenePropertyID>::setTargetMapDisplayStyle(*(_QWORD *)(v16 + 224), v37);
      v38 = v19 * a5;
      *(_QWORD *)(v16 + 328) = v37;
      *(_BYTE *)(v16 + 336) = v43;
      if (!v43)
        v38 = 0.0;
      if (*(_BYTE *)(v16 + 1116))
      {
        *(float *)(v16 + 1120) = fmaxf(*(float *)(v16 + 1120), v38);
      }
      else
      {
        *(_BYTE *)(v16 + 1116) = 1;
        *(float *)(v16 + 1120) = v38;
        v48[0] = 4;
        v39 = *(char **)(v16 + 1128);
        v40 = *(char **)(v16 + 1136);
        if (v39 != v40)
        {
          while (*v39 <= 3u)
          {
            if (++v39 == v40)
              goto LABEL_71;
          }
        }
        if (v39 == v40 || (v40 = v39, *v39 != 4))
LABEL_71:
          std::vector<md::StyleManagerEvent>::insert(v16 + 1128, v40, v48);
        v41 = **(_QWORD **)(v16 + 1240);
        if (v41)
        {
          v48[0] = 12;
          md::MapEngine::setNeedsTick(v41, v48);
        }
      }
    }
  }

  v42 = **(_QWORD **)(*((_QWORD *)self + 48) + 120);
  if (v42)
  {
    v48[0] = 1;
    md::MapEngine::setNeedsTick(v42, v48);
  }
  -[VKMapView _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)_updateBackgroundColor
{
  CGColorSpace *v3;
  CGColor *v4;
  __int128 v5;
  CGFloat components[2];
  float64x2_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  md::GridLogic::defaultBackgroundColor(&v5, -[VKMapView mapType](self, "mapType"), -[VKMapView mapDisplayStyle](self, "mapDisplayStyle"), -[VKMapView emphasis](self, "emphasis"));
  v3 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
  *(float64x2_t *)components = vcvtq_f64_f32(*(float32x2_t *)&v5);
  v7 = vcvtq_f64_f32(*(float32x2_t *)((char *)&v5 + 8));
  v4 = CGColorCreate(v3, components);
  -[VKMapView setBackgroundColor:](self, "setBackgroundColor:", v4);
  CGColorRelease(v4);
  CGColorSpaceRelease(v3);
}

- ($6EFE6C6748B912A6EAC8A8E593ED1344)mapDisplayStyle
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
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
  v6 = gss::ClientStyleState<gss::PropertyID>::targetMapDisplayStyle(*(_QWORD *)(v4[5] + 208));
  return ($6EFE6C6748B912A6EAC8A8E593ED1344)(v6 & 0xFFFFFFFFFFLL | ((unint64_t)((v6 & 0xFF0000000000) == 0x10000000000) << 40));
}

- (unsigned)emphasis
{
  return *((_BYTE *)self + 144);
}

- (void)setMapDisplayStyle:(id)a3 animated:(BOOL)a4 duration:(double)a5
{
  uint64_t v6;
  unint64_t v7;
  int var3;
  NSObject *v10;
  unint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint8_t buf[4];
  VKMapView *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  int v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  double v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v6 = a4;
  v7 = *(_QWORD *)&a3.var0;
  v47 = *MEMORY[0x1E0C80C00];
  var3 = a3.var3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v10 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  v11 = 0x1EE53C000;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if ((_BYTE)v7)
      v12 = CFSTR("Night");
    else
      v12 = CFSTR("Day");
    v24 = -[__CFString UTF8String](v12, "UTF8String");
    v26 = v6;
    v13 = CFSTR("None");
    if (BYTE1(v7) == 1)
      v13 = CFSTR("Traffic");
    if (BYTE1(v7) == 2)
      v14 = CFSTR("Transit");
    else
      v14 = (__CFString *)v13;
    v15 = -[__CFString UTF8String](v14, "UTF8String", v24);
    v16 = &stru_1E4315B30;
    if (BYTE2(v7) <= 9u)
      v16 = off_1E42EB458[SBYTE2(v7)];
    v17 = -[__CFString UTF8String](v16, "UTF8String");
    v18 = CFSTR("Route Creation");
    if (var3 != 1)
      v18 = &stru_1E4315B30;
    if (var3)
      v19 = (__CFString *)v18;
    else
      v19 = CFSTR("Default");
    v20 = -[__CFString UTF8String](v19, "UTF8String");
    if (BYTE4(v7) > 4u)
      v21 = &stru_1E4315B30;
    else
      v21 = off_1E42EB4A8[SBYTE4(v7)];
    v22 = -[__CFString UTF8String](v21, "UTF8String");
    v23 = *((unsigned __int8 *)self + 598);
    *(_DWORD *)buf = 134220290;
    v28 = self;
    v29 = 2080;
    v30 = v25;
    v31 = 2080;
    v32 = v15;
    v33 = 2080;
    v34 = v17;
    v35 = 2080;
    v36 = v20;
    v11 = 0x1EE53C000uLL;
    v37 = 2080;
    v38 = v22;
    v39 = 1024;
    v40 = (v7 >> 40) & 1;
    v41 = 1024;
    v6 = v26;
    v42 = v26;
    v43 = 2048;
    v44 = a5;
    v45 = 1024;
    v46 = v23;
    _os_log_impl(&dword_19F029000, v10, OS_LOG_TYPE_INFO, "[VKMapView:%p] SetDisplayStyle (timePeriod:%s overlayType:%s applicationState:%s applicationSubState:%s searchResultsType:%s mapHasLabels:%d) animated:%d duration:%f _displayOverrideEnabled:%d", buf, 0x5Au);
  }

  *((_WORD *)self + 296) = v7;
  *((_BYTE *)self + 594) = BYTE2(v7);
  *((_BYTE *)self + 595) = var3;
  *((_BYTE *)self + 596) = BYTE4(v7);
  *((_BYTE *)self + 597) = BYTE5(v7);
  if (!*((_BYTE *)self + *(int *)(v11 + 3440)))
    -[VKMapView _applyMapDisplayStyle:animated:duration:](self, "_applyMapDisplayStyle:animated:duration:", v7 & 0xFFFFFFFFFFFFLL, v6, a5);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  os_signpost_type_t v11;
  NSObject *v12;
  void *v13;
  md::MapEngine *v14;
  objc_super v15;
  uint8_t buf[4];
  VKMapView *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)buf = 134218242;
    v17 = self;
    v18 = 2080;
    v19 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set hidden: %s", buf, 0x16u);
    if (v3)
    {
      if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
LABEL_10:
      v7 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
      v8 = v7;
      v9 = *(_QWORD *)(*((_QWORD *)self + 48) + 1216);
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        v10 = v8;
        v11 = OS_SIGNPOST_INTERVAL_END;
LABEL_18:
        _os_signpost_emit_with_name_impl(&dword_19F029000, v10, v11, v9, "Visible", (const char *)&unk_1A0189141, buf, 2u);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  }
  else if (v3)
  {
    goto LABEL_10;
  }
  v12 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  v8 = v12;
  v9 = *(_QWORD *)(*((_QWORD *)self + 48) + 1216);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    v10 = v8;
    v11 = OS_SIGNPOST_INTERVAL_BEGIN;
    goto LABEL_18;
  }
LABEL_19:

  v15.receiver = self;
  v15.super_class = (Class)VKMapView;
  -[VKMapView setHidden:](&v15, sel_setHidden_, v3);
  v13 = (void *)*((_QWORD *)self + 6);
  if (v13)
    objc_msgSend(v13, "stopLoading");
  v14 = (md::MapEngine *)*((_QWORD *)self + 48);
  if (v14)
  {
    *((_BYTE *)v14 + 1176) = v3;
    md::MapEngine::updateRunLoopStatus(v14);
  }
}

- (void)setMapDisplayStyle:(id)a3
{
  -[VKMapView setMapDisplayStyle:animated:duration:](self, "setMapDisplayStyle:animated:duration:", *(_QWORD *)&a3.var0 & 0xFFFFFFFFFFFFLL, 1, 1.0);
}

- (void)locationInHikingToolTipRegion:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__VKMapView_locationInHikingToolTipRegion___block_invoke;
  v3[3] = &unk_1E42EB1D0;
  v3[4] = self;
  v3[5] = a3;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v3);
}

- (void)labelManagerDidLayout
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  _QWORD v6[5];
  uint8_t buf[16];

  if (!*((_BYTE *)self + 582))
  {
    *((_BYTE *)self + 582) = 1;
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v3 = (id)GEOGetVectorKitVKDefaultLog_log;
    v4 = v3;
    v5 = *(_QWORD *)(*((_QWORD *)self + 48) + 1216);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F029000, v4, OS_SIGNPOST_INTERVAL_END, v5, "LabelsCompletedFirstLayout", (const char *)&unk_1A0189141, buf, 2u);
    }

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__VKMapView_labelManagerDidLayout__block_invoke;
  v6[3] = &unk_1E42F6DA0;
  v6[4] = self;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v6);
}

- (void)didFinishLoadingData
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__VKMapView_didFinishLoadingData__block_invoke;
  v2[3] = &unk_1E42F6DA0;
  v2[4] = self;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v2);
}

- (void)didStartLoadingData
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __32__VKMapView_didStartLoadingData__block_invoke;
  v2[3] = &unk_1E42F6DA0;
  v2[4] = self;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v2);
}

- (void)_postDelegateCallbackBlock:(id)a3
{
  id WeakRetained;
  NSObject *v5;
  dispatch_block_t block;

  block = a3;
  WeakRetained = objc_loadWeakRetained((id *)self + 15);

  if (WeakRetained)
  {
    -[VKMapView _mapDelegateQueue](self, "_mapDelegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, block);

  }
}

- (id)_mapDelegateQueue
{
  uint64_t v2;
  id *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  id v7;
  unint64_t v8;

  v2 = *((_QWORD *)self + 48);
  v3 = *(id **)(v2 + 8);
  v4 = *(std::__shared_weak_count **)(v2 + 16);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
    v7 = *v3;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  else
  {
    v7 = *v3;
  }
  return v7;
}

- (VKMapView)initWithDescriptor:(id)a3
{
  double v4;
  VKMapView *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t (***v17)();
  uint64_t v18;
  NSObject *v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  unsigned __int8 *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  const char *v40;
  size_t v41;
  const void *v42;
  const void **v43;
  uint64_t v44;
  uint64_t v45;
  const void *v46;
  _BYTE *v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  NSObject *v51;
  os_signpost_id_t v52;
  VKStateCaptureHandler *v53;
  id v54;
  VKStateCaptureHandler *v55;
  VKStateCaptureHandler *v56;
  uint64_t (***v57)();
  uint64_t v58;
  size_t v59;
  const void *v60;
  const void **v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  double v66;
  double v67;
  uint64_t v68;
  os_signpost_id_t v69;
  id v70;
  md::AnimationManager *v71;
  uint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *p_shared_owners;
  uint64_t v75;
  float v76;
  float64_t v77;
  unint64_t v78;
  uint64_t v79;
  void *v80;
  int v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  VKManifestTileGroupObserverProxy *v85;
  uint64_t v86;
  id *v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  id v91;
  VKManifestTileGroupObserverProxy *v92;
  unint64_t *v93;
  unint64_t v94;
  NSObject *v95;
  uint64_t (***v96)();
  uint64_t v97;
  uint64_t (***v98)();
  uint64_t v99;
  uint64_t (***v100)();
  uint64_t v101;
  VKCamera *v102;
  VKCamera *v103;
  id *v104;
  double v105;
  id v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  std::__shared_weak_count *v110;
  unint64_t *v111;
  unint64_t v112;
  long double v113;
  long double v114;
  float64x2_t v115;
  unint64_t *v121;
  unint64_t v122;
  id v123;
  VKMapCanvas *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  std::__shared_weak_count *v130;
  unint64_t *v131;
  unint64_t v132;
  std::__shared_weak_count *v133;
  unint64_t *v134;
  unint64_t v135;
  VKMapCameraController *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  uint64_t v142;
  void *v143;
  VKDaVinciCameraController *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  id v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  VKMuninCameraController *v154;
  uint64_t v155;
  std::__shared_weak_count *v156;
  uint64_t v157;
  unint64_t *v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  id v164;
  int8x8_t *v165;
  int8x8_t v166;
  uint8x8_t v167;
  uint64_t v168;
  uint64_t v169;
  int8x8_t v170;
  _QWORD *v171;
  _QWORD *v172;
  unint64_t v173;
  uint64_t v174;
  uint64_t v175;
  _QWORD *v176;
  uint64_t v177;
  uint64_t v178;
  char *v179;
  char v180;
  const void **v181;
  const void *v182;
  char **v183;
  int v184;
  char *v185;
  const void *v186;
  size_t v187;
  int v188;
  int v189;
  char *v190;
  size_t v191;
  size_t v192;
  int v193;
  uint64_t v194;
  _QWORD *v195;
  uint64_t v196;
  unint64_t v197;
  uint64_t v198;
  VKMuninCameraController *v199;
  VKMuninCameraController *v200;
  std::__shared_weak_count *v201;
  unint64_t *v202;
  unint64_t v203;
  VKARWalkingCameraController *v204;
  uint64_t v205;
  std::__shared_weak_count *v206;
  uint64_t v207;
  unint64_t *v208;
  unint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  id v214;
  int8x8_t *v215;
  int8x8_t v216;
  uint8x8_t v217;
  uint64_t v218;
  uint64_t v219;
  int8x8_t v220;
  _QWORD *v221;
  _QWORD *v222;
  unint64_t v223;
  uint64_t v224;
  uint64_t v225;
  _QWORD *v226;
  _QWORD *v227;
  uint64_t v228;
  unint64_t v229;
  uint64_t v230;
  VKARWalkingCameraController *v231;
  VKARWalkingCameraController *v232;
  std::__shared_weak_count *v233;
  unint64_t *v234;
  unint64_t v235;
  int v236;
  char v237;
  NSObject *v238;
  unint64_t v239;
  __CFString *v240;
  uint64_t v241;
  const char *v242;
  int8x8_t *v243;
  int8x8_t v244;
  uint8x8_t v245;
  uint64_t v246;
  _QWORD *v247;
  _QWORD *v248;
  uint64_t v249;
  unint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  unint64_t v254;
  _QWORD *v255;
  unint64_t v256;
  NSObject *v257;
  const __CFString *v258;
  __CFString *v259;
  uint64_t v260;
  int8x8_t *v261;
  int8x8_t v262;
  uint8x8_t v263;
  uint64_t v264;
  _QWORD *v265;
  _QWORD *v266;
  uint64_t v267;
  unint64_t v268;
  uint64_t v269;
  uint64_t v270;
  VKNotificationObserver *v271;
  uint64_t v272;
  std::__shared_weak_count *v273;
  unint64_t *v274;
  unint64_t v275;
  uint64_t v276;
  void *v277;
  unint64_t *v278;
  unint64_t v279;
  uint64_t v280;
  unint64_t v281;
  _QWORD *v282;
  unint64_t v283;
  void *v284;
  unsigned int *v285;
  void *v286;
  VKMapView *v287;
  _QWORD *v288;
  uint64_t v289;
  VKMapView *result;
  unsigned __int16 v291;
  int v292;
  unsigned __int16 v293;
  int v294;
  unsigned __int16 v295;
  int v296;
  unsigned __int16 v297;
  int v298;
  uint64_t *v299;
  uint64_t *v300;
  uint64_t v301;
  uint64_t *v302;
  uint64_t v303;
  uint64_t *v304;
  uint64_t v305;
  __int128 v306;
  VKManifestTileGroupObserverProxy *v307;
  id v308;
  uint64_t v309;
  std::__shared_weak_count *v310;
  uint64_t v311;
  std::__shared_weak_count *v312;
  uint64_t v313;
  std::__shared_weak_count *v314;
  uint64_t (**v315)();
  id v316;
  float64x2_t v317;
  uint64_t v318;
  id v319[4];
  id v320;
  id v321;
  id from;
  id to;
  id location;
  os_signpost_id_t v325;
  objc_super v326;
  uint64_t (**v327)();
  id v328;
  uint64_t (***v329)();
  uint64_t (**v330)();
  id v331;
  uint64_t (***v332)();
  uint64_t (**v333)();
  id v334;
  uint64_t (***v335)();
  uint64_t (**v336)();
  id v337;
  uint64_t (***v338)();
  _QWORD v339[3];
  _QWORD *v340;
  uint64_t (**v341)();
  os_signpost_id_t *v342;
  uint64_t (***v343)();
  _QWORD v344[3];
  _QWORD *v345;
  _BYTE buf[24];
  _BYTE v347[10];
  __int16 v348;
  const char *v349;
  char *v350[2];
  char v351;
  const void *__dst[6];

  __dst[3] = *(const void **)MEMORY[0x1E0C80C00];
  v308 = a3;
  objc_msgSend(v308, "contentScale");
  checkForBogusContentScale(v4);
  v326.receiver = self;
  v326.super_class = (Class)VKMapView;
  v5 = -[VKMapView init](&v326, sel_init);

  v6 = v308;
  if (!v5)
    goto LABEL_394;
  *((_BYTE *)v5 + 528) = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (void *)*((_QWORD *)v5 + 73);
  *((_QWORD *)v5 + 73) = v7;

  v325 = 0;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v9 = (id)GEOGetVectorKitVKDefaultLog_log;
  v10 = os_signpost_id_make_with_pointer(v9, v5);

  v325 = v10;
  v341 = &off_1E42C7670;
  v342 = &v325;
  v343 = &v341;
  v339[0] = &off_1E42C76B8;
  v339[1] = &v325;
  v340 = v339;
  v345 = v344;
  v344[0] = &off_1E42C76B8;
  v344[1] = &v325;
  if (GEOGetVectorKitPerformanceLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitPerformanceLog_onceToken, &__block_literal_global_13_11780);
  v11 = (id)GEOGetVectorKitPerformanceLog_log;
  v12 = v11;
  v13 = *v342;
  if (*v342 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CreateVKMapView", (const char *)&unk_1A0189141, buf, 2u);
  }

  v14 = v340;
  if (v340 == v339)
  {
    v16 = 4;
    v14 = v339;
    v15 = v308;
  }
  else
  {
    v15 = v308;
    if (!v340)
      goto LABEL_14;
    v16 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v16))();
LABEL_14:
  v17 = v343;
  if (v343 == &v341)
  {
    v18 = 4;
    v17 = &v341;
  }
  else
  {
    if (!v343)
      goto LABEL_19;
    v18 = 5;
  }
  (*v17)[v18]();
LABEL_19:
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v19 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = objc_msgSend(v15, "shouldRasterize");
    v21 = objc_msgSend(v15, "inBackground");
    objc_msgSend(v15, "contentScale");
    v23 = v22;
    v24 = gss::to_string(objc_msgSend(v15, "carDisplayType"));
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v20;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v21;
    *(_WORD *)v347 = 2048;
    *(_QWORD *)&v347[2] = v23;
    v348 = 2080;
    v349 = v24;
    _os_log_impl(&dword_19F029000, v19, OS_LOG_TYPE_INFO, "[VKMapView:%p] Creating VKMapView, rasterize=%i inBkgd=%i contentScale=%f carDisplayType=%s", buf, 0x2Cu);
  }

  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v25 = (id)GEOGetVectorKitVKDefaultLog_log;
  v26 = v25;
  v27 = v325;
  if (v325 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v27, "LoadRequiredLayers", (const char *)&unk_1A0189141, buf, 2u);
  }

  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v28 = (id)GEOGetVectorKitVKDefaultLog_log;
  v29 = v28;
  v30 = v325;
  if (v325 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v30, "LoadAllLayers", (const char *)&unk_1A0189141, buf, 2u);
  }

  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v31 = (id)GEOGetVectorKitVKDefaultLog_log;
  v32 = v31;
  v33 = v325;
  if (v325 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v33, "LabelsCompletedFirstLayout", (const char *)&unk_1A0189141, buf, 2u);
  }

  v34 = (unsigned __int8 *)operator new();
  *((_DWORD *)v34 + 48) = 0;
  *((_OWORD *)v34 + 10) = 0u;
  *((_OWORD *)v34 + 11) = 0u;
  *((_OWORD *)v34 + 8) = 0u;
  *((_OWORD *)v34 + 9) = 0u;
  *((_OWORD *)v34 + 6) = 0u;
  *((_OWORD *)v34 + 7) = 0u;
  *((_OWORD *)v34 + 4) = 0u;
  *((_OWORD *)v34 + 5) = 0u;
  *((_OWORD *)v34 + 2) = 0u;
  *((_OWORD *)v34 + 3) = 0u;
  *(_OWORD *)v34 = 0u;
  *((_OWORD *)v34 + 1) = 0u;
  v35 = *((_QWORD *)v5 + 63);
  *((_QWORD *)v5 + 63) = v34;
  if (v35)
  {
    MEMORY[0x1A1AF4E00](v35, 0x1000C40E32A8BA7);
    v34 = (unsigned __int8 *)*((_QWORD *)v5 + 63);
  }
  v36 = objc_msgSend(v308, "carDisplayType");
  GEOConfigGetString();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    v39 = (const char *)objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    if (v36 <= 2)
    {
LABEL_42:
      v40 = off_1E42F0AE8[v36];
      goto LABEL_45;
    }
  }
  else
  {
    v39 = "\n"
          "{\n"
          "    car: {\n"
          "        disable-globe:true,\n"
          "        trench:{ nominal:{target-fps:15, max-fps:-1}, fair:{target-fps:15, max-fps:-1}, serious:{target-fps:10"
          ", max-fps:15}, critical:{target-fps:5, max-fps:10} },\n"
          "        overview:{ nominal:{target-fps:10, max-fps:-1}, fair:{target-fps:10, max-fps:-1}, serious:{target-fps:"
          "5, max-fps:15}, critical:{target-fps:5, max-fps:10} },\n"
          "        default:{ nominal:{target-fps:15, max-fps:-1}, fair:{target-fps:15, max-fps:-1}, serious:{target-fps:1"
          "0, max-fps:15}, critical:{target-fps:5, max-fps:10} },\n"
          "    },\n"
          "\n"
          "    device: {\n"
          "        trench:{ nominal:{target-fps:15, max-fps:-1}, fair:{target-fps:15, max-fps:-1}, serious:{target-fps:10"
          ", max-fps:15}, critical:{target-fps:5, max-fps:10} },\n"
          "        overview:{ nominal:{target-fps:10, max-fps:-1}, fair:{target-fps:10, max-fps:-1}, serious:{target-fps:"
          "10, max-fps:15}, critical:{target-fps:5, max-fps:10} },\n"
          "        default:{ nominal:{target-fps:15, max-fps:-1}, fair:{target-fps:15, max-fps:-1}, serious:{target-fps:1"
          "0, max-fps:15}, critical:{target-fps:5, max-fps:10} },\n"
          "    },\n"
          "}\n";
    if (v36 <= 2)
      goto LABEL_42;
  }
  v40 = "none";
LABEL_45:
  v41 = strlen(v39);
  if (v41 > 0x7FFFFFFFFFFFFFF7)
    abort();
  v42 = (const void *)v41;
  if (v41 >= 0x17)
  {
    v44 = (v41 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v41 | 7) != 0x17)
      v44 = v41 | 7;
    v45 = v44 + 1;
    v43 = (const void **)operator new(v44 + 1);
    __dst[1] = v42;
    __dst[2] = (const void *)(v45 | 0x8000000000000000);
    __dst[0] = v43;
    goto LABEL_52;
  }
  HIBYTE(__dst[2]) = v41;
  v43 = __dst;
  if (v41)
LABEL_52:
    memcpy(v43, v39, (size_t)v42);
  *((_BYTE *)v42 + (_QWORD)v43) = 0;
  md::StyleSettingsParser::StyleSettingsParser((uint64_t)buf, (uint64_t)__dst);
  if (SHIBYTE(__dst[2]) < 0)
    operator delete((void *)__dst[0]);
  v46 = (const void *)buf[23];
  if (buf[23] >= 0)
    v47 = buf;
  else
    v47 = *(_BYTE **)buf;
  if (buf[23] < 0)
    v46 = *(const void **)&buf[8];
  __dst[0] = v47;
  __dst[1] = v46;
  md::StyleSettingsParser::parseNode((uint64_t)buf, (uint64_t)v347, (unsigned __int8 **)__dst);
  if (v351)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v48 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__dst[0]) = 136315138;
      *(const void **)((char *)__dst + 4) = v39;
      _os_log_impl(&dword_19F029000, v48, OS_LOG_TYPE_ERROR, "DisplayOptions: unable to parse display options: %s", (uint8_t *)__dst, 0xCu);
    }

    goto LABEL_66;
  }
  v59 = strlen(v40);
  if (v59 > 0x7FFFFFFFFFFFFFF7)
    abort();
  v60 = (const void *)v59;
  if (v59 >= 0x17)
  {
    v177 = (v59 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v59 | 7) != 0x17)
      v177 = v59 | 7;
    v178 = v177 + 1;
    v61 = (const void **)operator new(v177 + 1);
    __dst[1] = v60;
    __dst[2] = (const void *)(v178 | 0x8000000000000000);
    __dst[0] = v61;
  }
  else
  {
    HIBYTE(__dst[2]) = v59;
    v61 = __dst;
    if (!v59)
      goto LABEL_176;
  }
  memcpy(v61, v40, (size_t)v60);
LABEL_176:
  *((_BYTE *)v60 + (_QWORD)v61) = 0;
  v179 = v350[0];
  v180 = HIBYTE(__dst[2]);
  if (!v350[0])
    goto LABEL_399;
  if (SHIBYTE(__dst[2]) >= 0)
    v181 = __dst;
  else
    v181 = (const void **)__dst[0];
  if (SHIBYTE(__dst[2]) >= 0)
    v182 = (const void *)HIBYTE(__dst[2]);
  else
    v182 = __dst[1];
  v183 = v350;
  do
  {
    while (1)
    {
      v184 = v179[55];
      v185 = v184 >= 0 ? v179 + 32 : (char *)*((_QWORD *)v179 + 4);
      v186 = v184 >= 0 ? (const void *)v179[55] : (const void *)*((_QWORD *)v179 + 5);
      v187 = (size_t)(v182 >= v186 ? v186 : v182);
      v188 = memcmp(v185, v181, v187);
      if (v188)
        break;
      if (v186 >= v182)
        goto LABEL_198;
LABEL_184:
      v179 = (char *)*((_QWORD *)v179 + 1);
      if (!v179)
        goto LABEL_199;
    }
    if (v188 < 0)
      goto LABEL_184;
LABEL_198:
    v183 = (char **)v179;
    v179 = *(char **)v179;
  }
  while (v179);
LABEL_199:
  if (v183 == v350)
    goto LABEL_399;
  v189 = *((char *)v183 + 55);
  if (v189 >= 0)
    v190 = (char *)(v183 + 4);
  else
    v190 = v183[4];
  if (v189 >= 0)
    v191 = *((unsigned __int8 *)v183 + 55);
  else
    v191 = (size_t)v183[5];
  if (v191 >= (unint64_t)v182)
    v192 = (size_t)v182;
  else
    v192 = v191;
  v193 = memcmp(v181, v190, v192);
  if (v193)
  {
    if ((v193 & 0x80000000) == 0)
      goto LABEL_211;
LABEL_399:
    v194 = 0;
    if (v180 < 0)
      goto LABEL_400;
  }
  else
  {
    if ((unint64_t)v182 < v191)
      goto LABEL_399;
LABEL_211:
    if (v183[7][8] == 1)
      v194 = (uint64_t)v183[7];
    else
      v194 = 0;
    if (v180 < 0)
LABEL_400:
      operator delete((void *)__dst[0]);
  }
  if (v194)
  {
    HIBYTE(__dst[2]) = 15;
    strcpy((char *)__dst, "disable-shadows");
    v291 = md::StyleSettingsObjectNode::getValue<BOOL>(v194, __dst);
    if (v291 > 0xFFu)
      v292 = v291;
    else
      v292 = *v34;
    *v34 = v292 != 0;
    HIBYTE(__dst[2]) = 17;
    strcpy((char *)__dst, "disable-buildings");
    v293 = md::StyleSettingsObjectNode::getValue<BOOL>(v194, __dst);
    if (v293 > 0xFFu)
      v294 = v293;
    else
      v294 = v34[1];
    v34[1] = v294 != 0;
    HIBYTE(__dst[2]) = 13;
    strcpy((char *)__dst, "disable-globe");
    v295 = md::StyleSettingsObjectNode::getValue<BOOL>(v194, __dst);
    if (v295 > 0xFFu)
      v296 = v295;
    else
      v296 = v34[2];
    v34[2] = v296 != 0;
    HIBYTE(__dst[2]) = 14;
    strcpy((char *)__dst, "disable-metros");
    v297 = md::StyleSettingsObjectNode::getValue<BOOL>(v194, __dst);
    if (v297 > 0xFFu)
      v298 = v297;
    else
      v298 = v34[3];
    v34[3] = v298 != 0;
    HIBYTE(__dst[2]) = 6;
    strcpy((char *)__dst, "trench");
    v299 = std::__tree<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>>>::find<std::string>(v194 + 16, __dst);
    v300 = (uint64_t *)(v194 + 24);
    if ((uint64_t *)(v194 + 24) != v299)
    {
      v301 = v299[7];
      if (*(_BYTE *)(v301 + 8) == 1)
        md::DisplayOptions::readThermalOptions(v301, (uint64_t)(v34 + 4));
    }
    HIBYTE(__dst[2]) = 8;
    strcpy((char *)__dst, "overview");
    v302 = std::__tree<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>>>::find<std::string>(v194 + 16, __dst);
    if (v300 != v302)
    {
      v303 = v302[7];
      if (*(_BYTE *)(v303 + 8) == 1)
        md::DisplayOptions::readThermalOptions(v303, (uint64_t)(v34 + 68));
    }
    HIBYTE(__dst[2]) = 7;
    strcpy((char *)__dst, "default");
    v304 = std::__tree<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>>>::find<std::string>(v194 + 16, __dst);
    if (v300 != v304)
    {
      v305 = v304[7];
      if (*(_BYTE *)(v305 + 8) == 1)
        md::DisplayOptions::readThermalOptions(v305, (uint64_t)(v34 + 132));
    }
  }
LABEL_66:
  *(_QWORD *)v347 = &off_1E429F8B0;
  std::__tree<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>>>::destroy(v350[0]);
  if ((buf[23] & 0x80000000) != 0)
    operator delete(*(void **)buf);

  objc_msgSend(v308, "contentScale");
  -[VKMapView setContentsScale:](v5, "setContentsScale:");
  v49 = objc_msgSend(v308, "inBackground");
  *((_BYTE *)v5 + 240) = v49;
  if (v49)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v50 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
    v51 = v50;
    v52 = v325;
    if (v325 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F029000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v52, "Foreground", (const char *)&unk_1A0189141, buf, 2u);
    }

  }
  objc_initWeak(&location, v5);
  v53 = [VKStateCaptureHandler alloc];
  v54 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&to, &location);
  v338 = 0;
  v336 = &off_1E42C7700;
  objc_moveWeak(&v337, &to);
  v338 = &v336;
  objc_destroyWeak(&to);
  v55 = -[VKStateCaptureHandler initWithQueue:withName:withCallback:](v53, "initWithQueue:withName:withCallback:", MEMORY[0x1E0C80D38], CFSTR("VKMapView"), &v336);
  v56 = v55;
  objc_storeStrong((id *)v5 + 54, v55);

  v57 = v338;
  if (v338 == &v336)
  {
    v58 = 4;
    v57 = &v336;
LABEL_83:
    (*v57)[v58]();
  }
  else if (v338)
  {
    v58 = 5;
    goto LABEL_83;
  }

  GEOTileLoaderClientIdentifier();
  v62 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)*((_QWORD *)v5 + 17);
  *((_QWORD *)v5 + 17) = v62;

  *((_DWORD *)v5 + 99) = -1;
  if (objc_msgSend(v308, "allowsAntialiasing"))
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "enableAntialiasing");

  }
  else
  {
    v65 = 0;
  }
  memset(__dst, 0, 24);
  geo::linear_map<md::MapEngineSetting,long long,std::equal_to<md::MapEngineSetting>,std::allocator<std::pair<md::MapEngineSetting,long long>>,std::vector<std::pair<md::MapEngineSetting,long long>>>::emplace<md::MapEngineSetting,long long>((unsigned __int8 **)__dst, 0x1Fu, objc_msgSend(v308, "carDisplayType"));
  objc_msgSend(v308, "contentScale");
  v67 = v66;
  v68 = objc_msgSend(v308, "mapViewPurpose");
  v69 = v325;
  objc_msgSend(v308, "auditToken");
  v70 = (id)objc_claimAutoreleasedReturnValue();
  v71 = (md::AnimationManager *)operator new();
  md::AnimationManager::AnimationManager(v71);
  v72 = operator new();
  v73 = (std::__shared_weak_count *)operator new(0xA8uLL);
  v73->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v73->__shared_owners_;
  v73->__shared_weak_owners_ = 0;
  v73->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DAD70;
  v75 = md::TaskContext::TaskContext((uint64_t)&v73[1], MEMORY[0x1E0C80D38]);
  v76 = v67;
  *(_QWORD *)buf = v75;
  *(_QWORD *)&buf[8] = v73;
  *(_QWORD *)&v317.f64[0] = v71;
  md::MapEngine::MapEngine(v72, v65, v68, buf, 0, &v317, __dst, v69, 0.0, 0.0, v76, v70);
  v77 = v317.f64[0];
  v317.f64[0] = 0.0;
  if (v77 != 0.0)
    (*(void (**)(float64_t))(**(_QWORD **)&v77 + 8))(COERCE_FLOAT64_T(*(_QWORD *)&v77));
  do
    v78 = __ldaxr(p_shared_owners);
  while (__stlxr(v78 - 1, p_shared_owners));
  if (!v78)
  {
    ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
    std::__shared_weak_count::__release_weak(v73);
  }

  v79 = *((_QWORD *)v5 + 48);
  *((_QWORD *)v5 + 48) = v72;
  if (v79)
    md::MapEngineDeleter::operator()(v79);

  objc_storeWeak((id *)(*((_QWORD *)v5 + 48) + 848), v5);
  -[VKMapView _setupThermalMonitor](v5, "_setupThermalMonitor");
  +[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "lowPerformanceDevice");

  if (v81)
    v82 = 30;
  else
    v82 = -1;
  v83 = *(uint64_t **)(*((_QWORD *)v5 + 48) + 120);
  v83[1] = v82;
  v84 = *v83;
  if (*v83 && !**(_BYTE **)(v84 + 1056))
    md::MapEngine::setDisplayRate(v84, v82);
  v85 = [VKManifestTileGroupObserverProxy alloc];
  v86 = *((_QWORD *)v5 + 48);
  v87 = *(id **)(v86 + 8);
  v88 = *(std::__shared_weak_count **)(v86 + 16);
  *(_QWORD *)buf = v87;
  *(_QWORD *)&buf[8] = v88;
  if (v88)
  {
    v89 = (unint64_t *)&v88->__shared_owners_;
    do
      v90 = __ldxr(v89);
    while (__stxr(v90 + 1, v89));
  }
  v91 = *v87;
  v92 = -[VKManifestTileGroupObserverProxy initWithQueue:](v85, "initWithQueue:", v91);

  if (v88)
  {
    v93 = (unint64_t *)&v88->__shared_owners_;
    do
      v94 = __ldaxr(v93);
    while (__stlxr(v94 - 1, v93));
    if (!v94)
    {
      ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
      std::__shared_weak_count::__release_weak(v88);
    }
  }
  v307 = v92;
  objc_storeStrong((id *)v5 + 69, v92);

  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v95 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v307;
    _os_log_impl(&dword_19F029000, v95, OS_LOG_TYPE_INFO, "[VKMapView%p] Manifest observer - %p", buf, 0x16u);
  }

  objc_copyWeak(&from, &location);
  v335 = 0;
  v333 = &off_1E42C7748;
  objc_moveWeak(&v334, &from);
  v335 = &v333;
  objc_destroyWeak(&from);
  -[VKManifestTileGroupObserverProxy setDidChangeActiveTileGroup:](v307, "setDidChangeActiveTileGroup:", &v333);
  v96 = v335;
  if (v335 == &v333)
  {
    v97 = 4;
    v96 = &v333;
LABEL_116:
    (*v96)[v97]();
  }
  else if (v335)
  {
    v97 = 5;
    goto LABEL_116;
  }
  objc_copyWeak(&v321, &location);
  v332 = 0;
  v330 = &off_1E42C7790;
  objc_moveWeak(&v331, &v321);
  v332 = &v330;
  objc_destroyWeak(&v321);
  -[VKManifestTileGroupObserverProxy setWillChangeActiveTileGroup:](v307, "setWillChangeActiveTileGroup:", &v330);
  v98 = v332;
  if (v332 == &v330)
  {
    v99 = 4;
    v98 = &v330;
LABEL_121:
    (*v98)[v99]();
  }
  else if (v332)
  {
    v99 = 5;
    goto LABEL_121;
  }
  objc_copyWeak(&v320, &location);
  v329 = 0;
  v327 = &off_1E42C77D8;
  objc_moveWeak(&v328, &v320);
  v329 = &v327;
  objc_destroyWeak(&v320);
  -[VKManifestTileGroupObserverProxy setExperimentConfigurationDidChange:](v307, "setExperimentConfigurationDidChange:", &v327);
  v100 = v329;
  if (v329 == &v327)
  {
    v101 = 4;
    v100 = &v327;
LABEL_126:
    (*v100)[v101]();
  }
  else if (v329)
  {
    v101 = 5;
    goto LABEL_126;
  }
  if (!*((_BYTE *)v5 + 240))
  {
    -[VKMapView openLoaderConnection](v5, "openLoaderConnection");
    -[VKMapView _createDisplayLayer](v5, "_createDisplayLayer");
  }
  v102 = -[VKCamera initWithRunLoopController:]([VKCamera alloc], "initWithRunLoopController:", *(_QWORD *)(*((_QWORD *)v5 + 48) + 120));
  v103 = v102;
  v104 = (id *)((char *)v5 + 456);
  objc_storeStrong((id *)v5 + 57, v102);

  v105 = *(double *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)v5 + 48) + 24) + 8) + 64);
  v106 = *((id *)v5 + 57);
  objc_msgSend(v106, "setNdcZNear:", v105);

  memset(v319, 0, 24);
  v319[3] = (id)0x3FF0000000000000;
  v107 = *((id *)v5 + 57);
  objc_msgSend(v107, "setOrientation:", v319);

  v108 = *((_QWORD *)v5 + 48);
  v109 = *(_QWORD *)(v108 + 1064);
  v110 = *(std::__shared_weak_count **)(v108 + 1072);
  if (v110)
  {
    v111 = (unint64_t *)&v110->__shared_owners_;
    do
      v112 = __ldxr(v111);
    while (__stxr(v112 + 1, v111));
  }
  v306 = *(_OWORD *)(v109 + 16);
  v113 = tan(*(double *)(v109 + 8) * 0.5 + 0.785398163);
  v114 = log(v113);
  *(_QWORD *)&v115.f64[0] = v306;
  v115.f64[1] = v114;
  __asm { FMOV            V2.2D, #0.5 }
  v317 = vmlaq_f64(_Q2, (float64x2_t)vdupq_n_s64(0x3FC45F306DC9C883uLL), v115);
  v318 = *((_QWORD *)&v306 + 1);
  if (v110)
  {
    v121 = (unint64_t *)&v110->__shared_owners_;
    do
      v122 = __ldaxr(v121);
    while (__stlxr(v122 - 1, v121));
    if (!v122)
    {
      ((void (*)(std::__shared_weak_count *))v110->__on_zero_shared)(v110);
      std::__shared_weak_count::__release_weak(v110);
    }
  }
  v123 = *v104;
  objc_msgSend(v123, "setMercatorPosition:", &v317);

  v124 = -[VKMapCanvas initWithMapEngine:inBackground:]([VKMapCanvas alloc], "initWithMapEngine:inBackground:", *((_QWORD *)v5 + 48), objc_msgSend(v308, "inBackground"));
  v125 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v124;

  objc_msgSend(*((id *)v5 + 5), "setDelegate:", v5);
  objc_msgSend(*((id *)v5 + 5), "setMapDelegate:", v5);
  v126 = (void *)*((_QWORD *)v5 + 5);
  v315 = &off_1E42B54B0;
  v316 = 0;
  v316 = *v104;
  objc_msgSend(v126, "setVkCamera:", &v315);
  v315 = &off_1E42B54B0;

  v127 = (void *)*((_QWORD *)v5 + 5);
  v128 = *((_QWORD *)v5 + 48);
  v129 = *(_QWORD *)(v128 + 1064);
  v130 = *(std::__shared_weak_count **)(v128 + 1072);
  v313 = v129;
  v314 = v130;
  if (v130)
  {
    v131 = (unint64_t *)&v130->__shared_owners_;
    do
      v132 = __ldxr(v131);
    while (__stxr(v132 + 1, v131));
  }
  objc_msgSend(v127, "setCamera:", &v313);
  v133 = v314;
  if (v314)
  {
    v134 = (unint64_t *)&v314->__shared_owners_;
    do
      v135 = __ldaxr(v134);
    while (__stlxr(v135 - 1, v134));
    if (!v135)
    {
      ((void (*)(std::__shared_weak_count *))v133->__on_zero_shared)(v133);
      std::__shared_weak_count::__release_weak(v133);
    }
  }
  v136 = [VKMapCameraController alloc];
  v137 = *((_QWORD *)v5 + 48);
  v138 = *(_QWORD *)(v137 + 904);
  v139 = *(_QWORD *)(v137 + 112);
  v140 = *(_QWORD *)(v137 + 120);
  v141 = *(id *)(v137 + 1104);
  v142 = -[VKMapCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](v136, "initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:", v138, v139, v140, v141);
  v143 = (void *)*((_QWORD *)v5 + 31);
  *((_QWORD *)v5 + 31) = v142;

  objc_msgSend(*((id *)v5 + 31), "setMapEngine:", *((_QWORD *)v5 + 48));
  v144 = [VKDaVinciCameraController alloc];
  v145 = *((_QWORD *)v5 + 48);
  v146 = *(_QWORD *)(v145 + 904);
  v147 = *(_QWORD *)(v145 + 112);
  v148 = *(_QWORD *)(v145 + 120);
  v149 = *(id *)(v145 + 1104);
  v150 = -[VKDaVinciCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:mapEngine:](v144, "initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:mapEngine:", v146, v147, v148, v149, *((_QWORD *)v5 + 48));
  v151 = (void *)*((_QWORD *)v5 + 32);
  *((_QWORD *)v5 + 32) = v150;

  v152 = (void *)*((_QWORD *)v5 + 5);
  -[VKMapView resolveMapCameraController](v5, "resolveMapCameraController");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setCameraController:", v153);

  v154 = [VKMuninCameraController alloc];
  v155 = *((_QWORD *)v5 + 48);
  v157 = *(_QWORD *)(v155 + 8);
  v156 = *(std::__shared_weak_count **)(v155 + 16);
  v311 = v157;
  v312 = v156;
  if (v156)
  {
    v158 = (unint64_t *)&v156->__shared_owners_;
    do
      v159 = __ldxr(v158);
    while (__stxr(v159 + 1, v158));
  }
  v160 = *((_QWORD *)v5 + 48);
  v161 = *(_QWORD *)(v160 + 904);
  v162 = *(_QWORD *)(v160 + 112);
  v163 = *(_QWORD *)(v160 + 120);
  v164 = *(id *)(v160 + 1104);
  v165 = *(int8x8_t **)(*((_QWORD *)v5 + 48) + 1120);
  v166 = v165[2];
  if (!*(_QWORD *)&v166)
  {
    v169 = 0;
    goto LABEL_235;
  }
  v167 = (uint8x8_t)vcnt_s8(v166);
  v167.i16[0] = vaddlv_u8(v167);
  if (v167.u32[0] > 1uLL)
  {
    v168 = 0x669A8EDAC04FCBF1;
    if (*(_QWORD *)&v166 <= 0x669A8EDAC04FCBF1uLL)
      v168 = 0x669A8EDAC04FCBF1uLL % *(_QWORD *)&v166;
  }
  else
  {
    v168 = (*(_QWORD *)&v166 - 1) & 0x669A8EDAC04FCBF1;
  }
  v170 = v165[1];
  v171 = *(_QWORD **)(*(_QWORD *)&v170 + 8 * v168);
  if (!v171 || (v172 = (_QWORD *)*v171) == 0)
  {
LABEL_169:
    v169 = 0;
    if (v167.u32[0] > 1uLL)
      goto LABEL_217;
    goto LABEL_170;
  }
  if (v167.u32[0] < 2uLL)
  {
    while (1)
    {
      v174 = v172[1];
      if (v174 == 0x669A8EDAC04FCBF1)
      {
        if (v172[2] == 0x669A8EDAC04FCBF1)
          goto LABEL_216;
      }
      else if ((v174 & (*(_QWORD *)&v166 - 1)) != v168)
      {
        goto LABEL_169;
      }
      v172 = (_QWORD *)*v172;
      if (!v172)
        goto LABEL_169;
    }
  }
  while (2)
  {
    v173 = v172[1];
    if (v173 != 0x669A8EDAC04FCBF1)
    {
      if (v173 >= *(_QWORD *)&v166)
        v173 %= *(_QWORD *)&v166;
      if (v173 != v168)
        goto LABEL_169;
      goto LABEL_159;
    }
    if (v172[2] != 0x669A8EDAC04FCBF1)
    {
LABEL_159:
      v172 = (_QWORD *)*v172;
      if (!v172)
        goto LABEL_169;
      continue;
    }
    break;
  }
LABEL_216:
  v169 = v172[5];
  if (v167.u32[0] > 1uLL)
  {
LABEL_217:
    v175 = 0x17767EADC5B287BLL;
    if (*(_QWORD *)&v166 <= 0x17767EADC5B287BuLL)
      v175 = 0x17767EADC5B287BuLL % *(_QWORD *)&v166;
    v176 = *(_QWORD **)(*(_QWORD *)&v170 + 8 * v175);
    if (v176)
      goto LABEL_220;
    goto LABEL_234;
  }
LABEL_170:
  v175 = (*(_QWORD *)&v166 - 1) & 0x17767EADC5B287BLL;
  v176 = *(_QWORD **)(*(_QWORD *)&v170 + 8 * v175);
  if (v176)
  {
LABEL_220:
    v195 = (_QWORD *)*v176;
    if (v195)
    {
      if (v167.u32[0] < 2uLL)
      {
        v196 = *(_QWORD *)&v166 - 1;
        while (1)
        {
          v198 = v195[1];
          if (v198 == 0x17767EADC5B287BLL)
          {
            if (v195[2] == 0x17767EADC5B287BLL)
              goto LABEL_267;
          }
          else if ((v198 & v196) != v175)
          {
            goto LABEL_234;
          }
          v195 = (_QWORD *)*v195;
          if (!v195)
            goto LABEL_234;
        }
      }
      do
      {
        v197 = v195[1];
        if (v197 == 0x17767EADC5B287BLL)
        {
          if (v195[2] == 0x17767EADC5B287BLL)
          {
LABEL_267:
            v166 = (int8x8_t)v195[5];
            goto LABEL_235;
          }
        }
        else
        {
          if (v197 >= *(_QWORD *)&v166)
            v197 %= *(_QWORD *)&v166;
          if (v197 != v175)
            break;
        }
        v195 = (_QWORD *)*v195;
      }
      while (v195);
    }
  }
LABEL_234:
  v166 = 0;
LABEL_235:
  v199 = -[VKMuninCameraController initWithTaskContext:mapDataAccess:animationRunner:runLoopController:cameraDelegate:muninSceneLogic:elevationLogic:](v154, "initWithTaskContext:mapDataAccess:animationRunner:runLoopController:cameraDelegate:muninSceneLogic:elevationLogic:", &v311, v161, v162, v163, v164, v169, *(_QWORD *)&v166);
  v200 = v199;
  objc_storeStrong((id *)v5 + 35, v199);

  v201 = v312;
  if (v312)
  {
    v202 = (unint64_t *)&v312->__shared_owners_;
    do
      v203 = __ldaxr(v202);
    while (__stlxr(v203 - 1, v202));
    if (!v203)
    {
      ((void (*)(std::__shared_weak_count *))v201->__on_zero_shared)(v201);
      std::__shared_weak_count::__release_weak(v201);
    }
  }
  v204 = [VKARWalkingCameraController alloc];
  v205 = *((_QWORD *)v5 + 48);
  v207 = *(_QWORD *)(v205 + 8);
  v206 = *(std::__shared_weak_count **)(v205 + 16);
  v309 = v207;
  v310 = v206;
  if (v206)
  {
    v208 = (unint64_t *)&v206->__shared_owners_;
    do
      v209 = __ldxr(v208);
    while (__stxr(v209 + 1, v208));
  }
  v210 = *((_QWORD *)v5 + 48);
  v211 = *(_QWORD *)(v210 + 904);
  v212 = *(_QWORD *)(v210 + 112);
  v213 = *(_QWORD *)(v210 + 120);
  v214 = *(id *)(v210 + 1104);
  v215 = *(int8x8_t **)(*((_QWORD *)v5 + 48) + 1120);
  v216 = v215[2];
  if (!*(_QWORD *)&v216)
  {
    v219 = 0;
    goto LABEL_287;
  }
  v217 = (uint8x8_t)vcnt_s8(v216);
  v217.i16[0] = vaddlv_u8(v217);
  if (v217.u32[0] > 1uLL)
  {
    v218 = 0x69AB09C896BF94A7;
    if (*(_QWORD *)&v216 <= 0x69AB09C896BF94A7uLL)
      v218 = 0x69AB09C896BF94A7uLL % *(_QWORD *)&v216;
  }
  else
  {
    v218 = (*(_QWORD *)&v216 - 1) & 0x69AB09C896BF94A7;
  }
  v220 = v215[1];
  v221 = *(_QWORD **)(*(_QWORD *)&v220 + 8 * v218);
  if (!v221 || (v222 = (_QWORD *)*v221) == 0)
  {
LABEL_264:
    v219 = 0;
    if (v217.u32[0] > 1uLL)
      goto LABEL_269;
    goto LABEL_265;
  }
  if (v217.u32[0] < 2uLL)
  {
    while (1)
    {
      v224 = v222[1];
      if (v224 == 0x69AB09C896BF94A7)
      {
        if (v222[2] == 0x69AB09C896BF94A7)
          goto LABEL_268;
      }
      else if ((v224 & (*(_QWORD *)&v216 - 1)) != v218)
      {
        goto LABEL_264;
      }
      v222 = (_QWORD *)*v222;
      if (!v222)
        goto LABEL_264;
    }
  }
  while (2)
  {
    v223 = v222[1];
    if (v223 != 0x69AB09C896BF94A7)
    {
      if (v223 >= *(_QWORD *)&v216)
        v223 %= *(_QWORD *)&v216;
      if (v223 != v218)
        goto LABEL_264;
      goto LABEL_254;
    }
    if (v222[2] != 0x69AB09C896BF94A7)
    {
LABEL_254:
      v222 = (_QWORD *)*v222;
      if (!v222)
        goto LABEL_264;
      continue;
    }
    break;
  }
LABEL_268:
  v219 = v222[5];
  if (v217.u32[0] > 1uLL)
  {
LABEL_269:
    v225 = 0x17767EADC5B287BLL;
    if (*(_QWORD *)&v216 <= 0x17767EADC5B287BuLL)
      v225 = 0x17767EADC5B287BuLL % *(_QWORD *)&v216;
    v226 = *(_QWORD **)(*(_QWORD *)&v220 + 8 * v225);
    if (v226)
      goto LABEL_272;
    goto LABEL_286;
  }
LABEL_265:
  v225 = (*(_QWORD *)&v216 - 1) & 0x17767EADC5B287BLL;
  v226 = *(_QWORD **)(*(_QWORD *)&v220 + 8 * v225);
  if (v226)
  {
LABEL_272:
    v227 = (_QWORD *)*v226;
    if (v227)
    {
      if (v217.u32[0] < 2uLL)
      {
        v228 = *(_QWORD *)&v216 - 1;
        while (1)
        {
          v230 = v227[1];
          if (v230 == 0x17767EADC5B287BLL)
          {
            if (v227[2] == 0x17767EADC5B287BLL)
              goto LABEL_395;
          }
          else if ((v230 & v228) != v225)
          {
            goto LABEL_286;
          }
          v227 = (_QWORD *)*v227;
          if (!v227)
            goto LABEL_286;
        }
      }
      do
      {
        v229 = v227[1];
        if (v229 == 0x17767EADC5B287BLL)
        {
          if (v227[2] == 0x17767EADC5B287BLL)
          {
LABEL_395:
            v216 = (int8x8_t)v227[5];
            goto LABEL_287;
          }
        }
        else
        {
          if (v229 >= *(_QWORD *)&v216)
            v229 %= *(_QWORD *)&v216;
          if (v229 != v225)
            break;
        }
        v227 = (_QWORD *)*v227;
      }
      while (v227);
    }
  }
LABEL_286:
  v216 = 0;
LABEL_287:
  v231 = -[VKARWalkingCameraController initWithTaskContext:mapDataAccess:animationRunner:runLoopController:cameraDelegate:arLogic:elevationLogic:](v204, "initWithTaskContext:mapDataAccess:animationRunner:runLoopController:cameraDelegate:arLogic:elevationLogic:", &v309, v211, v212, v213, v214, v219, *(_QWORD *)&v216);
  v232 = v231;
  objc_storeStrong((id *)v5 + 38, v231);

  v233 = v310;
  if (v310)
  {
    v234 = (unint64_t *)&v310->__shared_owners_;
    do
      v235 = __ldaxr(v234);
    while (__stlxr(v235 - 1, v234));
    if (!v235)
    {
      ((void (*)(std::__shared_weak_count *))v233->__on_zero_shared)(v233);
      std::__shared_weak_count::__release_weak(v233);
    }
  }
  -[VKMapView setCanonicalSkyHeight:](v5, "setCanonicalSkyHeight:", 25.0);
  -[VKMapView _updateBackgroundColor](v5, "_updateBackgroundColor");
  *((_BYTE *)v5 + 192) = 0;
  v236 = objc_msgSend(v308, "mapKitUsage");
  *((_BYTE *)v5 + 211) = v236;
  if (v236)
  {
    v237 = 0;
    *((_BYTE *)v5 + 209) = 1;
  }
  else
  {
    *((_BYTE *)v5 + 209) = 0;
    if (objc_msgSend(v308, "mapsUsage"))
      v237 = objc_msgSend(v308, "mapsUsage");
    else
      v237 = 1;
  }
  *((_BYTE *)v5 + 210) = v237;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v238 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v238, OS_LOG_TYPE_INFO))
  {
    v239 = *((unsigned __int8 *)v5 + 210);
    if (v239 > 2)
      v240 = &stru_1E4315B30;
    else
      v240 = off_1E42EB3D0[v239];
    v241 = -[__CFString UTF8String](v240, "UTF8String");
    v242 = gss::to_string(*((unsigned __int8 *)v5 + 211));
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v241;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)v347 = v242;
    _os_log_impl(&dword_19F029000, v238, OS_LOG_TYPE_INFO, "[VKMapView:%p] mapsUsage=%s mapKitUsage=%s", buf, 0x20u);
  }

  v243 = *(int8x8_t **)(*((_QWORD *)v5 + 48) + 1120);
  v244 = v243[2];
  if (!*(_QWORD *)&v244)
    goto LABEL_324;
  v245 = (uint8x8_t)vcnt_s8(v244);
  v245.i16[0] = vaddlv_u8(v245);
  if (v245.u32[0] > 1uLL)
  {
    v246 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v244 <= 0x2FED70A4459DFCA1uLL)
      v246 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v244;
  }
  else
  {
    v246 = (*(_QWORD *)&v244 - 1) & 0x2FED70A4459DFCA1;
  }
  v247 = *(_QWORD **)(*(_QWORD *)&v243[1] + 8 * v246);
  if (!v247 || (v248 = (_QWORD *)*v247) == 0)
  {
LABEL_324:
    v252 = 0;
    goto LABEL_325;
  }
  if (v245.u32[0] < 2uLL)
  {
    v249 = *(_QWORD *)&v244 - 1;
    while (1)
    {
      v251 = v248[1];
      if (v251 == 0x2FED70A4459DFCA1)
      {
        if (v248[2] == 0x2FED70A4459DFCA1)
          goto LABEL_396;
      }
      else if ((v251 & v249) != v246)
      {
        goto LABEL_324;
      }
      v248 = (_QWORD *)*v248;
      if (!v248)
        goto LABEL_324;
    }
  }
  while (2)
  {
    v250 = v248[1];
    if (v250 != 0x2FED70A4459DFCA1)
    {
      if (v250 >= *(_QWORD *)&v244)
        v250 %= *(_QWORD *)&v244;
      if (v250 != v246)
        goto LABEL_324;
      goto LABEL_314;
    }
    if (v248[2] != 0x2FED70A4459DFCA1)
    {
LABEL_314:
      v248 = (_QWORD *)*v248;
      if (!v248)
        goto LABEL_324;
      continue;
    }
    break;
  }
LABEL_396:
  v252 = v248[5];
LABEL_325:
  md::StyleLogic::setUsage(v252, *((unsigned __int8 *)v5 + 209), *((unsigned __int8 *)v5 + 211));
  v253 = *(_QWORD *)(*((_QWORD *)v5 + 48) + 1120);
  v254 = *(_QWORD *)(v253 + 16);
  if ((v254 & (v254 - 1)) != 0)
  {
    v256 = 0x20A1ED17D78F322BLL;
    if (v254 <= 0x20A1ED17D78F322BLL)
      v256 = 0x20A1ED17D78F322BLL % v254;
    v255 = *(_QWORD **)(*(_QWORD *)(v253 + 8) + 8 * v256);
    do
    {
      do
        v255 = (_QWORD *)*v255;
      while (v255[1] != 0x20A1ED17D78F322BLL);
    }
    while (v255[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    v255 = *(_QWORD **)(*(_QWORD *)(v253 + 8) + 8 * ((v254 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        v255 = (_QWORD *)*v255;
      while (v255[1] != 0x20A1ED17D78F322BLL);
    }
    while (v255[2] != 0x20A1ED17D78F322BLL);
  }
  *(_BYTE *)(v255[5] + 224) = *((_BYTE *)v5 + 210);
  *((_BYTE *)v5 + 212) = objc_msgSend(v308, "mapKitClientMode");
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v257 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v257, OS_LOG_TYPE_INFO))
  {
    v258 = &stru_1E4315B30;
    if (*((_BYTE *)v5 + 212) == 1)
      v258 = CFSTR("Weather");
    if (*((_BYTE *)v5 + 212))
      v259 = (__CFString *)v258;
    else
      v259 = CFSTR("Standard");
    v260 = -[__CFString UTF8String](v259, "UTF8String");
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v260;
    _os_log_impl(&dword_19F029000, v257, OS_LOG_TYPE_INFO, "[VKMapView:%p] mapKitClientMode=%s", buf, 0x16u);
  }

  v261 = *(int8x8_t **)(*((_QWORD *)v5 + 48) + 1120);
  v262 = v261[2];
  if (!*(_QWORD *)&v262)
    goto LABEL_364;
  v263 = (uint8x8_t)vcnt_s8(v262);
  v263.i16[0] = vaddlv_u8(v263);
  if (v263.u32[0] > 1uLL)
  {
    v264 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v262 <= 0x2FED70A4459DFCA1uLL)
      v264 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v262;
  }
  else
  {
    v264 = (*(_QWORD *)&v262 - 1) & 0x2FED70A4459DFCA1;
  }
  v265 = *(_QWORD **)(*(_QWORD *)&v261[1] + 8 * v264);
  if (!v265 || (v266 = (_QWORD *)*v265) == 0)
  {
LABEL_364:
    v270 = 0;
    goto LABEL_365;
  }
  if (v263.u32[0] < 2uLL)
  {
    v267 = *(_QWORD *)&v262 - 1;
    while (1)
    {
      v269 = v266[1];
      if (v269 == 0x2FED70A4459DFCA1)
      {
        if (v266[2] == 0x2FED70A4459DFCA1)
          goto LABEL_397;
      }
      else if ((v269 & v267) != v264)
      {
        goto LABEL_364;
      }
      v266 = (_QWORD *)*v266;
      if (!v266)
        goto LABEL_364;
    }
  }
  while (2)
  {
    v268 = v266[1];
    if (v268 != 0x2FED70A4459DFCA1)
    {
      if (v268 >= *(_QWORD *)&v262)
        v268 %= *(_QWORD *)&v262;
      if (v268 != v264)
        goto LABEL_364;
      goto LABEL_354;
    }
    if (v266[2] != 0x2FED70A4459DFCA1)
    {
LABEL_354:
      v266 = (_QWORD *)*v266;
      if (!v266)
        goto LABEL_364;
      continue;
    }
    break;
  }
LABEL_397:
  v270 = v266[5];
LABEL_365:
  md::StyleLogic::setMapKitClientMode(v270, *((unsigned __int8 *)v5 + 212));
  v271 = [VKNotificationObserver alloc];
  v272 = *((_QWORD *)v5 + 48);
  v273 = *(std::__shared_weak_count **)(v272 + 16);
  *(_QWORD *)buf = *(_QWORD *)(v272 + 8);
  *(_QWORD *)&buf[8] = v273;
  if (v273)
  {
    v274 = (unint64_t *)&v273->__shared_owners_;
    do
      v275 = __ldxr(v274);
    while (__stxr(v275 + 1, v274));
  }
  v276 = -[VKNotificationObserver initWithTarget:taskContext:](v271, "initWithTarget:taskContext:", v5);
  v277 = (void *)*((_QWORD *)v5 + 27);
  *((_QWORD *)v5 + 27) = v276;

  if (v273)
  {
    v278 = (unint64_t *)&v273->__shared_owners_;
    do
      v279 = __ldaxr(v278);
    while (__stlxr(v279 - 1, v278));
    if (!v279)
    {
      ((void (*)(std::__shared_weak_count *))v273->__on_zero_shared)(v273);
      std::__shared_weak_count::__release_weak(v273);
    }
  }
  v280 = *(_QWORD *)(*((_QWORD *)v5 + 48) + 1120);
  v281 = *(_QWORD *)(v280 + 16);
  if ((v281 & (v281 - 1)) != 0)
  {
    v283 = 0xBEC1A12372CEEC00;
    if (v281 <= 0xBEC1A12372CEEC00)
      v283 = 0xBEC1A12372CEEC00 % v281;
    v282 = *(_QWORD **)(*(_QWORD *)(v280 + 8) + 8 * v283);
    do
    {
      do
        v282 = (_QWORD *)*v282;
      while (v282[1] != 0xBEC1A12372CEEC00);
    }
    while (v282[2] != 0xBEC1A12372CEEC00);
  }
  else
  {
    v282 = *(_QWORD **)(*(_QWORD *)(v280 + 8) + 8 * ((v281 - 1) & 0xBEC1A12372CEEC00));
    do
    {
      do
        v282 = (_QWORD *)*v282;
      while (v282[1] != 0xBEC1A12372CEEC00);
    }
    while (v282[2] != 0xBEC1A12372CEEC00);
  }
  objc_storeStrong((id *)v5 + 28, *(id *)(v282[5] + 296));
  objc_msgSend(*((id *)v5 + 28), "setDelegate:", v5);
  objc_msgSend(*((id *)v5 + 5), "setPuckAnimator:", *((_QWORD *)v5 + 28));
  -[VKMapView _configureDefaultSettings](v5, "_configureDefaultSettings");
  -[VKMapView activateInternalSettings](v5, "activateInternalSettings");
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  v285 = (unsigned int *)objc_msgSend(v284, "displayStyleOverride");

  if (v285)
    -[VKMapView enableMapDisplayStyleDebugOverride:](v5, "enableMapDisplayStyleDebugOverride:", *v285 | ((unint64_t)*((unsigned __int16 *)v285 + 2) << 32));
  else
    -[VKMapView disableMapDisplayStyleDebugOverride](v5, "disableMapDisplayStyleDebugOverride");
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView setDisableBuildingFootprints:](v5, "setDisableBuildingFootprints:", objc_msgSend(v286, "disableBuildingFootprints"));

  -[VKMapView setDisableShadows:](v5, "setDisableShadows:", **((unsigned __int8 **)v5 + 63));
  v287 = v5;

  if (__dst[0])
    operator delete((void *)__dst[0]);
  objc_destroyWeak(&location);
  if (v345)
  {
    (*(void (**)(_QWORD *))(*v345 + 48))(v345);
    v6 = v308;
    v288 = v345;
    if (v345 == v344)
    {
      v289 = 4;
      v288 = v344;
LABEL_393:
      (*(void (**)(void))(*v288 + 8 * v289))();
    }
    else if (v345)
    {
      v289 = 5;
      goto LABEL_393;
    }
LABEL_394:

    return v5;
  }
  else
  {
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
  }
  return result;
}

- (void)setContentsScale:(double)a3
{
  NSObject *v5;
  uint64_t v6;
  float v7;
  md::World *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int16 *v44;
  unsigned __int16 *v45;
  unsigned __int16 *v46;
  uint64_t v47;
  float v48;
  uint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  float *v53;
  uint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  unint64_t v57;
  uint64_t v58;
  _QWORD *i;
  _QWORD *v60;
  uint64_t v61;
  float *v62;
  uint64_t v63;
  uint64_t v64;
  objc_super v65;
  _BYTE buf[24];
  _BYTE *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (vabdd_f64(*((double *)self + 76), a3) > 2.22044605e-16)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v5 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a3;
      _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set contents scale: %f", buf, 0x16u);
    }
    *((double *)self + 76) = a3;
    v65.receiver = self;
    v65.super_class = (Class)VKMapView;
    -[VKMapView setContentsScale:](&v65, sel_setContentsScale_, a3);
    v6 = *((_QWORD *)self + 48);
    if (v6)
    {
      md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v6 + 4536), "-[VKMapView setContentsScale:]");
      v7 = a3;
      v8 = *(md::World **)(v6 + 896);
      v9 = *((_QWORD *)v8 + 4);
      v10 = *((_QWORD *)v8 + 5);
      v11 = v9;
      if (v9 != v10)
      {
        v11 = *((_QWORD *)v8 + 4);
        while (*(_WORD *)v11 != 1)
        {
          v11 += 16;
          if (v11 == v10)
            goto LABEL_15;
        }
      }
      if (v11 != v10)
      {
        v12 = *(_QWORD *)(v11 + 8);
        if (v12)
        {
          atomic_store(LODWORD(v7), (unsigned int *)(v12 + 800));
          v9 = *((_QWORD *)v8 + 4);
          v10 = *((_QWORD *)v8 + 5);
        }
      }
LABEL_15:
      if (v9 != v10)
      {
        v13 = v9;
        while (*(_WORD *)v13 != 59)
        {
          v13 += 16;
          if (v13 == v10)
            goto LABEL_23;
        }
        if (v13 != v10)
        {
          v14 = *(_QWORD *)(v13 + 8);
          if (v14)
          {
            atomic_store(LODWORD(v7), (unsigned int *)(v14 + 800));
            v9 = *((_QWORD *)v8 + 4);
            v10 = *((_QWORD *)v8 + 5);
          }
        }
LABEL_23:
        if (v9 != v10)
        {
          v15 = v9;
          while (*(_WORD *)v15 != 6)
          {
            v15 += 16;
            if (v15 == v10)
              goto LABEL_31;
          }
          if (v15 != v10)
          {
            v16 = *(_QWORD *)(v15 + 8);
            if (v16)
            {
              atomic_store(LODWORD(v7), (unsigned int *)(v16 + 792));
              v9 = *((_QWORD *)v8 + 4);
              v10 = *((_QWORD *)v8 + 5);
            }
          }
LABEL_31:
          if (v9 != v10)
          {
            v17 = v9;
            while (*(_WORD *)v17 != 14)
            {
              v17 += 16;
              if (v17 == v10)
                goto LABEL_41;
            }
            if (v17 != v10)
            {
              v18 = *(_QWORD *)(v17 + 8);
              if (v18)
              {
                atomic_store(LODWORD(v7), (unsigned int *)(v18 + 768));
                v9 = *((_QWORD *)v8 + 4);
                v10 = *((_QWORD *)v8 + 5);
              }
            }
LABEL_41:
            while (v9 != v10)
            {
              if (*(_WORD *)v9 == 11)
              {
                if (v9 != v10)
                {
                  v64 = *(_QWORD *)(v9 + 8);
                  if (v64)
                    atomic_store(LODWORD(v7), (unsigned int *)(v64 + 624));
                }
                break;
              }
              v9 += 16;
            }
          }
        }
      }
      v19 = *((_QWORD *)v8 + 7);
      v20 = *((_QWORD *)v8 + 8);
      v21 = v19;
      if (v19 != v20)
      {
        v21 = *((_QWORD *)v8 + 7);
        while (*(_WORD *)v21 != 11)
        {
          v21 += 16;
          if (v21 == v20)
            goto LABEL_50;
        }
      }
      if (v21 != v20)
      {
        v22 = *(_QWORD *)(v21 + 8);
        if (v22)
          *(float *)(v22 + 24) = v7;
      }
LABEL_50:
      v23 = *((_QWORD *)v8 + 4);
      v24 = *((_QWORD *)v8 + 5);
      if (v23 != v24)
      {
        while (*(_WORD *)v23 != 12)
        {
          v23 += 16;
          if (v23 == v24)
            goto LABEL_57;
        }
      }
      if (v23 != v24)
      {
        v25 = *(_QWORD *)(v23 + 8);
        if (v25)
        {
          atomic_store(LODWORD(v7), (unsigned int *)(v25 + 624));
          v19 = *((_QWORD *)v8 + 7);
          v20 = *((_QWORD *)v8 + 8);
        }
      }
LABEL_57:
      if (v19 != v20)
      {
        v26 = v19;
        while (*(_WORD *)v26 != 12)
        {
          v26 += 16;
          if (v26 == v20)
            goto LABEL_65;
        }
        if (v26 != v20)
        {
          v27 = *(_QWORD *)(v26 + 8);
          if (v27)
            *(float *)(v27 + 24) = v7;
        }
      }
LABEL_65:
      v28 = *((_QWORD *)v8 + 4);
      v29 = *((_QWORD *)v8 + 5);
      if (v28 != v29)
      {
        while (*(_WORD *)v28 != 71)
        {
          v28 += 16;
          if (v28 == v29)
            goto LABEL_72;
        }
      }
      if (v28 != v29)
      {
        v30 = *(_QWORD *)(v28 + 8);
        if (v30)
        {
          atomic_store(LODWORD(v7), (unsigned int *)(v30 + 624));
          v19 = *((_QWORD *)v8 + 7);
          v20 = *((_QWORD *)v8 + 8);
        }
      }
LABEL_72:
      if (v19 != v20)
      {
        v31 = v19;
        while (*(_WORD *)v31 != 71)
        {
          v31 += 16;
          if (v31 == v20)
            goto LABEL_80;
        }
        if (v31 != v20)
        {
          v32 = *(_QWORD *)(v31 + 8);
          if (v32)
            *(float *)(v32 + 24) = v7;
        }
      }
LABEL_80:
      v33 = *((_QWORD *)v8 + 4);
      v34 = *((_QWORD *)v8 + 5);
      if (v33 != v34)
      {
        while (*(_WORD *)v33 != 72)
        {
          v33 += 16;
          if (v33 == v34)
            goto LABEL_89;
        }
      }
      if (v33 != v34)
      {
        v35 = *(_QWORD *)(v33 + 8);
        if (v35)
        {
          atomic_store(LODWORD(v7), (unsigned int *)(v35 + 624));
          v19 = *((_QWORD *)v8 + 7);
          v20 = *((_QWORD *)v8 + 8);
        }
      }
LABEL_89:
      while (v19 != v20)
      {
        if (*(_WORD *)v19 == 72)
        {
          if (v19 != v20)
          {
            v41 = *(_QWORD *)(v19 + 8);
            if (v41)
              *(float *)(v41 + 24) = v7;
          }
          break;
        }
        v19 += 16;
      }
      v36 = *((_QWORD *)v8 + 4);
      v37 = *((_QWORD *)v8 + 5);
      v38 = v36;
      if (v36 != v37)
      {
        v38 = *((_QWORD *)v8 + 4);
        while (*(_WORD *)v38 != 16)
        {
          v38 += 16;
          if (v38 == v37)
            goto LABEL_98;
        }
      }
      if (v38 != v37)
      {
        v39 = *(_QWORD *)(v38 + 8);
        if (v39)
        {
          atomic_store(LODWORD(v7), (unsigned int *)(v39 + 856));
          v36 = *((_QWORD *)v8 + 4);
          v37 = *((_QWORD *)v8 + 5);
        }
      }
LABEL_98:
      if (v36 != v37)
      {
        v40 = v36;
        while (*(_WORD *)v40 != 17)
        {
          v40 += 16;
          if (v40 == v37)
            goto LABEL_111;
        }
        if (v40 != v37)
        {
          v42 = *(_QWORD *)(v40 + 8);
          if (v42)
          {
            atomic_store(LODWORD(v7), (unsigned int *)(v42 + 808));
            v36 = *((_QWORD *)v8 + 4);
            v37 = *((_QWORD *)v8 + 5);
          }
        }
LABEL_111:
        while (v36 != v37)
        {
          if (*(_WORD *)v36 == 41)
          {
            if (v36 != v37)
            {
              v63 = *(_QWORD *)(v36 + 8);
              if (v63)
                atomic_store(LODWORD(v7), (unsigned int *)(v63 + 800));
            }
            break;
          }
          v36 += 16;
        }
      }
      v43 = *(_QWORD *)(*((_QWORD *)v8 + 3) + 56);
      v44 = (unsigned __int16 *)&md::MapResourceTypeList;
      do
      {
        v45 = *(unsigned __int16 **)(v43 + 32);
        v46 = *(unsigned __int16 **)(v43 + 40);
        if (v45 != v46)
        {
          while (*v45 != *v44)
          {
            v45 += 8;
            if (v45 == v46)
              goto LABEL_113;
          }
        }
        if (v45 != v46)
        {
          v47 = *((_QWORD *)v45 + 1);
          if (v47)
          {
            v48 = a3;
            (*(void (**)(uint64_t, float))(*(_QWORD *)v47 + 96))(v47, v48);
          }
        }
LABEL_113:
        ++v44;
      }
      while (v44 != word_19FFB8A58);
      md::World::clearAllData(v8);
      objc_msgSend(*(id *)(v6 + 840), "setContentScale:", v7);
      v49 = *(_QWORD *)(v6 + 1120);
      v50 = *(_QWORD *)(v49 + 16);
      if ((v50 & (v50 - 1)) != 0)
      {
        v52 = 0x2FED70A4459DFCA1;
        if (v50 <= 0x2FED70A4459DFCA1)
          v52 = 0x2FED70A4459DFCA1 % v50;
        v51 = *(_QWORD **)(*(_QWORD *)(v49 + 8) + 8 * v52);
        do
        {
          do
            v51 = (_QWORD *)*v51;
          while (v51[1] != 0x2FED70A4459DFCA1);
        }
        while (v51[2] != 0x2FED70A4459DFCA1);
      }
      else
      {
        v51 = *(_QWORD **)(*(_QWORD *)(v49 + 8) + 8 * ((v50 - 1) & 0x2FED70A4459DFCA1));
        do
        {
          do
            v51 = (_QWORD *)*v51;
          while (v51[1] != 0x2FED70A4459DFCA1);
        }
        while (v51[2] != 0x2FED70A4459DFCA1);
      }
      v53 = (float *)v51[5];
      v53[30] = v7;
      (*(void (**)(float *))(*(_QWORD *)v53 + 16))(v53);
      v54 = *(_QWORD *)(v6 + 1120);
      v55 = *(_QWORD *)(v54 + 16);
      if ((v55 & (v55 - 1)) != 0)
      {
        v57 = 0x20A1ED17D78F322BLL;
        if (v55 <= 0x20A1ED17D78F322BLL)
          v57 = 0x20A1ED17D78F322BLL % v55;
        v56 = *(_QWORD **)(*(_QWORD *)(v54 + 8) + 8 * v57);
        do
        {
          do
            v56 = (_QWORD *)*v56;
          while (v56[1] != 0x20A1ED17D78F322BLL);
        }
        while (v56[2] != 0x20A1ED17D78F322BLL);
      }
      else
      {
        v56 = *(_QWORD **)(*(_QWORD *)(v54 + 8) + 8 * ((v55 - 1) & 0x20A1ED17D78F322BLL));
        do
        {
          do
            v56 = (_QWORD *)*v56;
          while (v56[1] != 0x20A1ED17D78F322BLL);
        }
        while (v56[2] != 0x20A1ED17D78F322BLL);
      }
      v58 = v56[5];
      **(float **)(v58 + 152) = v7;
      for (i = *(_QWORD **)(v58 + 192); i; i = (_QWORD *)*i)
      {
        v62 = (float *)i[3];
        if (v62[886] != v7)
        {
          v62[886] = v7;
          *(_QWORD *)buf = &off_1E42C96C8;
          *(_QWORD *)&buf[8] = v62;
          *(_QWORD *)&buf[16] = LODWORD(v7);
          v67 = buf;
          md::LabelManager::queueCommand((md::LabelManager *)v62, 3, 1, buf);
          v60 = v67;
          if (v67 == buf)
          {
            v60 = buf;
            v61 = 4;
          }
          else
          {
            if (!v67)
              continue;
            v61 = 5;
          }
          (*(void (**)(void))(*v60 + 8 * v61))();
        }
      }
    }
    objc_msgSend(*((id *)self + 6), "setContentsScale:", a3);
  }
}

- (void)_setupThermalMonitor
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  uint8_t buf[4];
  VKMapView *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __42__VKMapView_Thermal___setupThermalMonitor__block_invoke;
  v10 = &unk_1E42EB360;
  objc_copyWeak(&v11, &location);
  v3 = (void *)MEMORY[0x1A1AF5730](&v7);
  -[VKMapView _mapDelegateQueue](self, "_mapDelegateQueue", v7, v8, v9, v10);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = notify_register_dispatch((const char *)*MEMORY[0x1E0C83A00], (int *)self + 129, v4, v3) == 0;

  if (v5)
  {
    -[VKMapView _updateThermalPressureLevel](self, "_updateThermalPressureLevel");
  }
  else
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v6 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v14 = self;
      _os_log_impl(&dword_19F029000, v6, OS_LOG_TYPE_ERROR, "[VKMapView:%p] Failed to register for thermal pressure notifications", buf, 0xCu);
    }
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_updateThermalPressureLevel
{
  NSObject *v3;
  uint64_t state64;
  uint8_t buf[4];
  VKMapView *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  if (notify_get_state(*((_DWORD *)self + 129), &state64))
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v3 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v6 = self;
      _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_ERROR, "[VKMapView:%p] Failed to get thermal pressure level", buf, 0xCu);
    }
  }
  else if (state64 != *((_QWORD *)self + 65))
  {
    -[VKMapView _setThermalPressureLevel:](self, "_setThermalPressureLevel:");
    -[VKMapView _updateCameraThermalOptions](self, "_updateCameraThermalOptions");
  }
}

- (void)setDisableShadows:(BOOL)a3
{
  uint64_t v3;
  int8x8_t *v4;
  int8x8_t v5;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = *((_QWORD *)self + 48);
  v4 = *(int8x8_t **)(v3 + 1120);
  v5 = v4[2];
  if (v5)
  {
    v6 = (uint8x8_t)vcnt_s8(v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      v7 = 0x91E65CD7F1A7A7FALL;
      if (*(_QWORD *)&v5 <= 0x91E65CD7F1A7A7FALL)
        v7 = 0x91E65CD7F1A7A7FALL % *(_QWORD *)&v5;
    }
    else
    {
      v7 = (*(_QWORD *)&v5 - 1) & 0x91E65CD7F1A7A7FALL;
    }
    v8 = *(_QWORD **)(*(_QWORD *)&v4[1] + 8 * v7);
    if (v8)
    {
      v9 = (_QWORD *)*v8;
      if (v9)
      {
        if (v6.u32[0] < 2uLL)
        {
          v10 = *(_QWORD *)&v5 - 1;
          while (1)
          {
            v12 = v9[1];
            if (v12 == 0x91E65CD7F1A7A7FALL)
            {
              if (v9[2] == 0x91E65CD7F1A7A7FALL)
                goto LABEL_22;
            }
            else if ((v12 & v10) != v7)
            {
              return;
            }
            v9 = (_QWORD *)*v9;
            if (!v9)
              return;
          }
        }
        do
        {
          v11 = v9[1];
          if (v11 == 0x91E65CD7F1A7A7FALL)
          {
            if (v9[2] == 0x91E65CD7F1A7A7FALL)
            {
LABEL_22:
              v13 = v9[5];
              if (v13)
              {
                *(_BYTE *)(v13 + 136) = a3;
                v14 = 1;
                md::MapEngine::setNeedsTick(v3, &v14);
              }
              return;
            }
          }
          else
          {
            if (v11 >= *(_QWORD *)&v5)
              v11 %= *(_QWORD *)&v5;
            if (v11 != v7)
              return;
          }
          v9 = (_QWORD *)*v9;
        }
        while (v9);
      }
    }
  }
}

- (void)setDisableBuildingFootprints:(BOOL)a3
{
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  char v7;
  char v8;

  v4 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v8 = 13;
  if (*(_BYTE *)(*((_QWORD *)self + 63) + 1))
    *(_QWORD *)&a3 = 1;
  else
    v5 = a3;
  md::MapEngineSettings::set(v4, &v8, (_QWORD *)a3);
  v6 = *((_QWORD *)self + 48);
  v7 = 1;
  md::MapEngine::setNeedsTick(v6, &v7);
}

- (void)setCanonicalSkyHeight:(double)a3
{
  NSObject *v5;
  int v6;
  VKMapView *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = 134218240;
    v7 = self;
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set sky height: %f", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(*((id *)self + 5), "setCanonicalSkyHeight:", a3);
}

- (void)disableMapDisplayStyleDebugOverride
{
  NSObject *v3;
  __CFString *v4;
  int v5;
  VKMapView *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*((_BYTE *)self + 592))
      v4 = CFSTR("Night");
    else
      v4 = CFSTR("Day");
    v5 = 134218242;
    v6 = self;
    v7 = 2080;
    v8 = -[__CFString UTF8String](v4, "UTF8String");
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Map display style debug override disabled, setting time of day to: %s", (uint8_t *)&v5, 0x16u);
  }

  *((_BYTE *)self + 598) = 0;
  -[VKMapView _applyMapDisplayStyle:animated:duration:](self, "_applyMapDisplayStyle:animated:duration:", *((unsigned int *)self + 148) | ((unint64_t)*((unsigned __int16 *)self + 298) << 32), 1, 1.0);
}

- (void)willLayoutWithTimestamp:(double)a3 withContext:(void *)a4
{
  id v6;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithTimestamp:withContext:", a4, a3);

}

- (BOOL)canRotate
{
  void *v2;
  void *v3;
  char v4;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canRotate");

  return v4;
}

- (void)projectCoordinate:(id)a3 toPoint:(CGPoint *)a4
{
  double var1;
  double var0;
  CGFloat v7;
  CGFloat v8;
  id v9;

  var1 = a3.var1;
  var0 = a3.var0;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertCoordinateToPoint:", var0, var1);
  a4->x = v7;
  a4->y = v8;

}

- (optional<double>)puckAnimator:(id)a3 getElevationWithCoordinate:(const void *)a4
{
  unsigned __int8 *v4;
  ValueUnion v5;
  optional<double> result;

  v4 = *(unsigned __int8 **)(*((_QWORD *)self + 48) + 904);
  if (v4)
  {
    md::MapDataAccess::heightAtCoordinate(v4, a4);
    *(_QWORD *)&v5.type = v5.data[0];
  }
  else
  {
    v5.type = 0.0;
  }
  result._value = v5;
  result._hasValue = (char)v4;
  return result;
}

- (void)didUpdateSceneStatus:(unsigned __int8)a3
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  _QWORD v7[6];
  _QWORD v8[5];
  char v9;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 0;
  v6 = a3;
  switch(a3)
  {
    case 0u:
      goto LABEL_7;
    case 1u:
      v6 = 1;
      goto LABEL_7;
    case 2u:
      goto LABEL_6;
    case 3u:
      v5 = 1;
      v6 = 3;
      goto LABEL_6;
    case 4u:
      v5 = 1;
      v6 = 4;
      goto LABEL_6;
    default:
      v5 = 0;
      v6 = 0;
LABEL_6:
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __34__VKMapView_didUpdateSceneStatus___block_invoke;
      v8[3] = &unk_1E42EB220;
      v8[4] = self;
      v9 = v5;
      -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v8);
LABEL_7:
      v7[0] = v4;
      v7[1] = 3221225472;
      v7[2] = __34__VKMapView_didUpdateSceneStatus___block_invoke_2;
      v7[3] = &unk_1E42EB1D0;
      v7[4] = self;
      v7[5] = v6;
      -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v7);
      return;
  }
}

- (BOOL)isShowingCuratedElevatedGround
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    return 0;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0x17767EADC5B287BLL;
    if (*(_QWORD *)&v3 <= 0x17767EADC5B287BuLL)
      v5 = 0x17767EADC5B287BuLL % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0x17767EADC5B287BLL;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6)
    return 0;
  v7 = (_QWORD *)*v6;
  if (!v7)
    return 0;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0x17767EADC5B287BLL)
      {
        if (v7[2] == 0x17767EADC5B287BLL)
          goto LABEL_22;
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        return 0;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0x17767EADC5B287BLL)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      return 0;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      return 0;
  }
  if (v7[2] != 0x17767EADC5B287BLL)
    goto LABEL_11;
LABEL_22:
  v11 = v7[5];
  if (v11)
  {
    if (*(_BYTE *)(v11 + 56))
    {
      v12 = *(_QWORD *)(v11 + 160);
      if (*(_BYTE *)(v12 + 80))
        return *(_BYTE *)(v12 + 82) != 0;
    }
  }
  return 0;
}

void __32__VKMapView_didStartLoadingData__block_invoke(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayerDidStartLoadingTiles:", *(_QWORD *)(a1 + 32));

  }
}

- (void)setShowsBuildings:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  VKMapView *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    v8 = 134218242;
    v9 = self;
    v10 = 2080;
    v11 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows buildings: %s", (uint8_t *)&v8, 0x16u);
  }
  v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  LOBYTE(v8) = 1;
  md::MapEngineSettings::set(v7, &v8, (_QWORD *)v3);
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
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v13 = 134218242;
    *(_QWORD *)&v13[4] = self;
    *(_WORD *)&v13[12] = 2080;
    *(_QWORD *)&v13[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows venues: %s", v13, 0x16u);
  }
  v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v13[0] = 0;
  md::MapEngineSettings::set(v7, v13, (_QWORD *)v3);
  v8 = -[VKMapView _labelSettings](self, "_labelSettings");
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

- (void)setCameraDelegate:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = *(id *)(*((_QWORD *)self + 48) + 1104);
  objc_msgSend(v4, "setCameraDelegate:", v5);

}

- (void)setMapType:(int)a3 animated:(BOOL)a4
{
  uint64_t v4;
  char *v6;
  NSObject *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  unsigned int v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t **v23;
  char *i;
  uint64_t **j;
  char *v26;
  uint64_t v27;
  id v28;
  char *v29;
  char *v30;
  void (**v31)(char *);
  BOOL v32;
  uint64_t *v33;
  char v34;
  uint64_t *v35;
  void *v36;
  uint64_t *v37;
  void *v38;
  uint64_t *v39;
  char v40;
  id v41;
  int8x8_t *v42;
  int8x8_t v43;
  uint8x8_t v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  md::StyleLogic *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  unint64_t v56;
  int v57;
  std::mutex *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  uint64_t v66;
  int v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t m;
  uint64_t v76;
  void *v77;
  char isKindOfClass;
  void *v79;
  void *v80;
  char v81;
  std::mutex *v82;
  void *v83;
  void *v84;
  int v85;
  uint64_t v86;
  id v87;
  char v88;
  id v89;
  uint64_t v90;
  int v91;
  int v92;
  uint64_t v93;
  id v94;
  std::mutex *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _BOOL8 v101;
  unint64_t v102;
  id v103;
  char v104;
  id v105;
  id v106;
  char v107;
  id v108;
  id v109;
  char v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  int v118;
  int v119;
  unsigned int v120;
  int v121;
  _BOOL4 v122;
  void *v123;
  unsigned int v124;
  std::mutex *v125;
  std::mutex *v126;
  std::mutex *v127;
  std::mutex *v128;
  _QWORD v129[5];
  char v130;
  _QWORD v131[5];
  char v132;
  _QWORD v133[5];
  char v134;
  _QWORD v135[5];
  char v136;
  _QWORD v137[5];
  std::mutex *v138;
  __int128 v139;
  uint64_t v140;
  __int128 v141;
  uint64_t v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _BYTE v151[128];
  _BYTE v152[128];
  uint8_t buf[24];
  uint64_t v154;
  uint64_t v155;

  v122 = a4;
  v4 = *(_QWORD *)&a3;
  v155 = *MEMORY[0x1E0C80C00];
  v6 = (char *)self + 32;
  if (*((_BYTE *)self + 32) && *((_DWORD *)self + 9) == a3)
    return;
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(*((_QWORD *)self + 48) + 4536), "-[VKMapView setMapType:animated:]");
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v7 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if ((v4 - 1) > 0xA)
      v8 = CFSTR("VKMapTypeStandard");
    else
      v8 = off_1E42EB400[(v4 - 1)];
    v9 = "NO";
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = self;
    if (v122)
      v9 = "YES";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2080;
    v154 = (uint64_t)v9;
    _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set map type: %@, animated: %s", buf, 0x20u);
  }

  v10 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  buf[0] = 20;
  md::MapEngineSettings::set(v10, buf, (_QWORD *)v4);
  -[VKMapView currentCanvas](self, "currentCanvas");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "cameraController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "regionChangeCount") == 0;

  if (!v12)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v13 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *((_DWORD *)v6 + 1) - 1;
      if (v14 > 0xA)
        v15 = CFSTR("VKMapTypeStandard");
      else
        v15 = off_1E42EB400[v14];
      if ((v4 - 1) > 0xA)
        v16 = CFSTR("VKMapTypeStandard");
      else
        v16 = off_1E42EB400[(v4 - 1)];
      objc_msgSend(v123, "cameraController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "regionChangeCount");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2048;
      v154 = v18;
      _os_log_impl(&dword_19F029000, v13, OS_LOG_TYPE_INFO, "OldMapType : %@, NewMapType: %@, regionCount number: %lu", buf, 0x20u);

    }
  }
  v125 = v123;
  v119 = -[VKMapView canShowFlyover](self, "canShowFlyover");
  v19 = -[VKMapView isShowingFlyover](self, "isShowingFlyover");
  v124 = -[VKMapView mapType](self, "mapType");
  v20 = *((_QWORD *)self + 48);
  v118 = v19;
  if (!*(_BYTE *)(v20 + 1241))
  {
    v120 = (v124 < 0xB) & (0x418u >> v124);
    if (v4 <= 0xA && ((1 << v4) & 0x418) != 0)
    {
      v121 = 1;
      if (((v124 < 0xB) & (0x418u >> v124)) != 0)
      {
        v21 = 1;
LABEL_58:
        v120 = v21;
        goto LABEL_59;
      }
    }
    else
    {
      v121 = 0;
      if (((v124 < 0xB) & (0x418u >> v124)) == 0)
      {
        v21 = 0;
        goto LABEL_58;
      }
    }
    v22 = *(_QWORD *)(v20 + 104);
    memset(buf, 0, sizeof(buf));
    std::mutex::lock((std::mutex *)(v22 + 40));
    v126 = (std::mutex *)(v22 + 40);
    v23 = *(uint64_t ***)(v22 + 120);
    for (i = 0; v23; v23 = (uint64_t **)*v23)
    {
      v33 = v23[3];
      v34 = objc_msgSend(v33, "runsForever");

      if ((v34 & 1) == 0)
      {
        if ((unint64_t)i >= *(_QWORD *)&buf[16])
        {
          i = std::vector<geo::_retain_ptr<VKAnimation * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__push_back_slow_path<geo::_retain_ptr<VKAnimation * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc> const&>((void **)buf, v23[3]);
        }
        else
        {
          *(_QWORD *)i = &off_1E42B49F0;
          *((_QWORD *)i + 1) = 0;
          v35 = v23[3];
          v36 = (void *)*((_QWORD *)i + 1);
          *((_QWORD *)i + 1) = v35;

          i += 24;
        }
        *(_QWORD *)&buf[8] = i;
      }
    }
    for (j = *(uint64_t ***)(v22 + 160); j; j = (uint64_t **)*j)
    {
      v39 = j[3];
      v40 = objc_msgSend(v39, "runsForever");

      if ((v40 & 1) == 0)
      {
        if ((unint64_t)i < *(_QWORD *)&buf[16])
        {
          *(_QWORD *)i = &off_1E42B49F0;
          *((_QWORD *)i + 1) = 0;
          v37 = j[3];
          v38 = (void *)*((_QWORD *)i + 1);
          *((_QWORD *)i + 1) = v37;

          i += 24;
        }
        else
        {
          i = std::vector<geo::_retain_ptr<VKAnimation * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__push_back_slow_path<geo::_retain_ptr<VKAnimation * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc> const&>((void **)buf, j[3]);
        }
        *(_QWORD *)&buf[8] = i;
      }
    }
    std::mutex::unlock(v126);
    v26 = *(char **)buf;
    if (*(char **)buf == i)
    {
      if (!*(_QWORD *)buf)
      {
LABEL_56:
        v20 = *((_QWORD *)self + 48);
        goto LABEL_59;
      }
    }
    else
    {
      v27 = *(_QWORD *)buf;
      do
      {
        v28 = *(id *)(v27 + 8);
        objc_msgSend(v28, "stop");

        v27 += 24;
      }
      while ((char *)v27 != i);
      if (!v26)
        goto LABEL_56;
      if (v26 != i)
      {
        v29 = i - 24;
        v30 = i - 24;
        do
        {
          v31 = *(void (***)(char *))v30;
          v30 -= 24;
          (*v31)(v29);
          v32 = v29 == v26;
          v29 = v30;
        }
        while (!v32);
        i = *(char **)buf;
      }
    }
    *(_QWORD *)&buf[8] = v26;
    operator delete(i);
    goto LABEL_56;
  }
  v121 = 0;
  v120 = 0;
LABEL_59:
  v41 = *(id *)(v20 + 1104);
  objc_msgSend(v41, "setIsChangingMapType:", 1);

  if (!*v6)
    *v6 = 1;
  *((_DWORD *)v6 + 1) = v4;
  v42 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v43 = v42[2];
  if (!*(_QWORD *)&v43)
    goto LABEL_81;
  v44 = (uint8x8_t)vcnt_s8(v43);
  v44.i16[0] = vaddlv_u8(v44);
  if (v44.u32[0] > 1uLL)
  {
    v45 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v43 <= 0x2FED70A4459DFCA1uLL)
      v45 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v43;
  }
  else
  {
    v45 = (*(_QWORD *)&v43 - 1) & 0x2FED70A4459DFCA1;
  }
  v46 = *(_QWORD **)(*(_QWORD *)&v42[1] + 8 * v45);
  if (!v46 || (v47 = (_QWORD *)*v46) == 0)
  {
LABEL_81:
    v51 = 0;
    goto LABEL_82;
  }
  if (v44.u32[0] < 2uLL)
  {
    v48 = *(_QWORD *)&v43 - 1;
    while (1)
    {
      v50 = v47[1];
      if (v50 == 0x2FED70A4459DFCA1)
      {
        if (v47[2] == 0x2FED70A4459DFCA1)
          goto LABEL_176;
      }
      else if ((v50 & v48) != v45)
      {
        goto LABEL_81;
      }
      v47 = (_QWORD *)*v47;
      if (!v47)
        goto LABEL_81;
    }
  }
  while (1)
  {
    v49 = v47[1];
    if (v49 == 0x2FED70A4459DFCA1)
      break;
    if (v49 >= *(_QWORD *)&v43)
      v49 %= *(_QWORD *)&v43;
    if (v49 != v45)
      goto LABEL_81;
LABEL_71:
    v47 = (_QWORD *)*v47;
    if (!v47)
      goto LABEL_81;
  }
  if (v47[2] != 0x2FED70A4459DFCA1)
    goto LABEL_71;
LABEL_176:
  v51 = (md::StyleLogic *)v47[5];
LABEL_82:
  md::StyleLogic::updateConfiguration(v51, v4);
  v52 = *((_QWORD *)self + 48);
  v53 = *(_QWORD *)(v52 + 1120);
  v54 = *(_QWORD *)(v53 + 16);
  if ((v54 & (v54 - 1)) != 0)
  {
    v56 = 0x20A1ED17D78F322BLL;
    if (v54 <= 0x20A1ED17D78F322BLL)
      v56 = 0x20A1ED17D78F322BLL % v54;
    v55 = *(_QWORD **)(*(_QWORD *)(v53 + 8) + 8 * v56);
    do
    {
      do
        v55 = (_QWORD *)*v55;
      while (v55[1] != 0x20A1ED17D78F322BLL);
    }
    while (v55[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    v55 = *(_QWORD **)(*(_QWORD *)(v53 + 8) + 8 * ((v54 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        v55 = (_QWORD *)*v55;
      while (v55[1] != 0x20A1ED17D78F322BLL);
    }
    while (v55[2] != 0x20A1ED17D78F322BLL);
  }
  *(_DWORD *)(v55[5] + 220) = *((_DWORD *)v6 + 1);
  if (v121)
  {
    md::MapEngine::createFlyoverRenderer(v52);
    -[VKMapView _createGlobe](self, "_createGlobe");
    if (v120)
    {
      v127 = v125;
    }
    else
    {
      objc_msgSend(*((id *)self + 5), "setCameraHorizontalOffset:duration:timingFunction:", 0, 0.0, 0.0);
      v127 = (std::mutex *)*((id *)self + 6);

      objc_msgSend(*((id *)self + 5), "edgeInsets");
      objc_msgSend(*((id *)self + 6), "setEdgeInsets:");
      v59 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(*((id *)self + 5), "overlays");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "arrayWithArray:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v149 = 0u;
      v150 = 0u;
      v147 = 0u;
      v148 = 0u;
      v62 = v61;
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v147, v152, 16);
      if (v63)
      {
        v64 = *(_QWORD *)v148;
        do
        {
          for (k = 0; k != v63; ++k)
          {
            if (*(_QWORD *)v148 != v64)
              objc_enumerationMutation(v62);
            v66 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * k);
            objc_msgSend(*((id *)self + 5), "removeOverlay:", v66);
            objc_msgSend(*((id *)self + 6), "addOverlay:", v66);
          }
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v147, v152, 16);
        }
        while (v63);
      }

    }
    objc_msgSend(*((id *)self + 6), "setMapType:", v4);
    objc_msgSend(*((id *)self + 5), "setMapType:", v4);
    goto LABEL_119;
  }
  if (*(_BYTE *)(v52 + 1241))
  {
    v57 = 1;
    v58 = v125;
    goto LABEL_135;
  }
  v67 = v120 ^ 1;
  if (*((_QWORD *)self + 6))
    v68 = v120 ^ 1;
  else
    v68 = 1;
  v127 = v125;
  if ((v68 & 1) == 0)
  {
    v127 = (std::mutex *)*((id *)self + 5);

    objc_msgSend(*((id *)self + 6), "edgeInsets");
    objc_msgSend(*((id *)self + 5), "setEdgeInsets:");
    v69 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(*((id *)self + 6), "overlays");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "arrayWithArray:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    v72 = v71;
    v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v143, v151, 16);
    if (v73)
    {
      v74 = *(_QWORD *)v144;
      do
      {
        for (m = 0; m != v73; ++m)
        {
          if (*(_QWORD *)v144 != v74)
            objc_enumerationMutation(v72);
          v76 = *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * m);
          objc_msgSend(*((id *)self + 6), "removeOverlay:", v76);
          objc_msgSend(*((id *)self + 5), "addOverlay:", v76);
        }
        v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v143, v151, 16);
      }
      while (v73);
    }

    v67 = v120 ^ 1;
  }
  objc_msgSend(*((id *)self + 5), "setMapType:animated:", v4, v67 & v122);
  objc_msgSend(*((id *)self + 6), "setMapType:", v4);
LABEL_119:
  if (v127 == v125)
  {
    v58 = v125;
    v57 = 1;
  }
  else
  {
    -[std::mutex transferStateFromCanvas:](v127, "transferStateFromCanvas:");
    -[std::mutex didBecomeActive](v127, "didBecomeActive");
    -[VKMapView performStylesheetDidChange](self, "performStylesheetDidChange");
    -[VKMapView didUpdateVerticalYawTo:](self, "didUpdateVerticalYawTo:", 0.0);
    -[std::mutex cameraController](v125, "cameraController");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[std::mutex cameraController](v125, "cameraController");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v79 = 0;
    }
    -[std::mutex cameraController](v127, "cameraController");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = objc_opt_isKindOfClass();

    if ((v81 & 1) != 0)
    {
      v82 = v127;
      -[std::mutex cameraController](v127, "cameraController");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v79)
        goto LABEL_129;
LABEL_128:
      objc_msgSend(v79, "centerCoordinateDistanceRange");
      v139 = v141;
      v140 = v142;
      objc_msgSend(v83, "setCenterCoordinateDistanceRange:", &v139);
      objc_msgSend(v79, "regionRestriction");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setRegionRestriction:", v84);

      v82 = v127;
    }
    else
    {
      v83 = 0;
      v82 = v127;
      if (v79)
        goto LABEL_128;
    }
LABEL_129:
    v85 = objc_msgSend(v79, "canEnter3DMode");
    v86 = objc_msgSend(v83, "canEnter3DMode");
    if (v85 != (_DWORD)v86)
    {
      v87 = *(id *)(*((_QWORD *)self + 48) + 1104);
      v88 = objc_opt_respondsToSelector();

      v82 = v127;
      if ((v88 & 1) != 0)
      {
        v89 = *(id *)(*((_QWORD *)self + 48) + 1104);
        objc_msgSend(v89, "mapLayerCanEnter3DModeDidChange:", v86);

        v82 = v127;
      }
    }
    v137[0] = MEMORY[0x1E0C809B0];
    v137[1] = 3221225472;
    v137[2] = __33__VKMapView_setMapType_animated___block_invoke;
    v137[3] = &unk_1E42FAFB0;
    v137[4] = self;
    v58 = v82;
    v138 = v58;
    -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v137);
    -[VKMapView layoutIfNeeded](self, "layoutIfNeeded");
    v90 = *((_QWORD *)self + 48);
    buf[0] = 1;
    md::MapEngine::setNeedsTick(v90, buf);
    -[std::mutex updateCameraForFrameResize](v58, "updateCameraForFrameResize");
    if (v58 == *((std::mutex **)self + 6))
      -[std::mutex waitForLoading](v58, "waitForLoading");
    -[std::mutex didBecomeInActive](v125, "didBecomeInActive");

    v57 = 0;
  }
LABEL_135:
  v128 = v58;
  v91 = -[VKMapView canShowFlyover](self, "canShowFlyover");
  v92 = -[VKMapView isShowingFlyover](self, "isShowingFlyover");
  if (v119 != v91)
  {
    v135[0] = MEMORY[0x1E0C809B0];
    v135[1] = 3221225472;
    v135[2] = __33__VKMapView_setMapType_animated___block_invoke_2;
    v135[3] = &unk_1E42EB220;
    v135[4] = self;
    v136 = v91;
    -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v135);
  }
  if (v118 != v92)
  {
    v133[0] = MEMORY[0x1E0C809B0];
    v133[1] = 3221225472;
    v133[2] = __33__VKMapView_setMapType_animated___block_invoke_3;
    v133[3] = &unk_1E42EB220;
    v133[4] = self;
    v134 = v92;
    -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v133);
  }
  v93 = *((_QWORD *)self + 48);
  if (*(_BYTE *)(v93 + 1241))
  {
    if (*((_DWORD *)self + 99) == -1)
    {
      v129[0] = MEMORY[0x1E0C809B0];
      v129[1] = 3221225472;
      v129[2] = __33__VKMapView_setMapType_animated___block_invoke_5;
      v129[3] = &unk_1E42EB220;
      v129[4] = self;
      v130 = v91;
      -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v129);
    }
    else
    {
      v131[0] = MEMORY[0x1E0C809B0];
      v131[1] = 3221225472;
      v131[2] = __33__VKMapView_setMapType_animated___block_invoke_4;
      v131[3] = &unk_1E42EB220;
      v131[4] = self;
      v132 = v92;
      -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v131);
    }
    v93 = *((_QWORD *)self + 48);
  }
  v94 = *(id *)(v93 + 1104);
  objc_msgSend(v94, "setIsChangingMapType:", 0);

  -[VKMapView setNeedsLayout](self, "setNeedsLayout");
  md::MapEngine::updateRunLoopStatus(*((md::MapEngine **)self + 48));
  v95 = v128;
  v96 = (uint64_t)-[VKMapView mapDisplayStyle](self, "mapDisplayStyle");
  v97 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v98 = *v97;
  v99 = v97[1];
  if (v98 != v99)
  {
    while (*(_BYTE *)v98 != 2)
    {
      v98 += 16;
      if (v98 == v99)
        goto LABEL_150;
    }
  }
  if (v98 == v99)
LABEL_150:
    v100 = 0;
  else
    v100 = *(_QWORD *)(v98 + 8);
  v101 = (v57 & v122) == 1
      && ((v124 < 0xB) & (0x49Eu >> v124)) == ((v4 < 0xB) & (0x49Eu >> v4));
  v102 = (unint64_t)(v100 != 0) << 8;
  if ((_DWORD)v4 == 8)
    v102 = 512;
  -[VKMapView setMapDisplayStyle:animated:duration:](self, "setMapDisplayStyle:animated:duration:", v96 & 0xFFFFFF00FFLL | ((unint64_t)((v4 & 0xFFFFFFFD) != 1) << 40) | v102, v101, 0.6);
  if (((v121 | v57) & 1) == 0)
  {
    v103 = *(id *)(*((_QWORD *)self + 48) + 1104);
    v104 = objc_opt_respondsToSelector();

    if ((v104 & 1) != 0)
    {
      v105 = *(id *)(*((_QWORD *)self + 48) + 1104);
      objc_msgSend(v105, "mapLayerWillChangeRegionAnimated:", 0);

    }
    v106 = *(id *)(*((_QWORD *)self + 48) + 1104);
    v107 = objc_opt_respondsToSelector();

    if ((v107 & 1) != 0)
    {
      v108 = *(id *)(*((_QWORD *)self + 48) + 1104);
      objc_msgSend(v108, "mapLayerDidChangeVisibleRegion");

    }
    v109 = *(id *)(*((_QWORD *)self + 48) + 1104);
    v110 = objc_opt_respondsToSelector();

    v95 = v128;
    if ((v110 & 1) != 0)
    {
      v111 = *(id *)(*((_QWORD *)self + 48) + 1104);
      objc_msgSend(v111, "mapLayerDidChangeRegionAnimated:", 0);

      v95 = v128;
    }
  }
  if ((_DWORD)v4 == 11)
  {
    -[VKMapView currentCanvas](self, "currentCanvas");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = *((id *)self + 35);
    objc_msgSend(v112, "setCameraController:", v113);

    v95 = v128;
LABEL_170:
    if (v124 == 9 && v95 == *((std::mutex **)self + 5))
    {
      -[VKMapView currentCanvas](self, "currentCanvas");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKMapView resolveMapCameraController](self, "resolveMapCameraController");
      v115 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "setCameraController:", v115);
      goto LABEL_173;
    }
  }
  else
  {
    if (v124 == 11 && v95 == *((std::mutex **)self + 5))
    {
      -[VKMapView currentCanvas](self, "currentCanvas");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKMapView resolveMapCameraController](self, "resolveMapCameraController");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "setCameraController:", v117);

      v95 = v128;
      if ((_DWORD)v4 != 9)
        goto LABEL_170;
    }
    else if ((_DWORD)v4 != 9)
    {
      goto LABEL_170;
    }
    -[VKMapView currentCanvas](self, "currentCanvas");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = *((id *)self + 38);
    objc_msgSend(v114, "setCameraController:", v115);
LABEL_173:

    v95 = v128;
  }
  -[VKMapView _updateBackgroundColor](self, "_updateBackgroundColor");

}

- (BOOL)canShowFlyover
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == *((void **)self + 6))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VKMapView currentCanvas](self, "currentCanvas");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cameraController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    if (objc_msgSend(*((id *)self + 6), "flyoverAvailable"))
      v4 = objc_msgSend(v6, "canEnter3DMode");
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isShowingFlyover
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == *((void **)self + 6) && objc_msgSend(v3, "flyoverAvailable"))
  {
    objc_msgSend(*((id *)self + 6), "cameraController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPitched");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setShowsHiking:(BOOL)a3
{
  -[VKMapView setShowsHiking:withTopographicFeatures:](self, "setShowsHiking:withTopographicFeatures:", a3, 1);
}

- (void)setShouldLoadFallbackTiles:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  VKMapView *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    v8 = 134218242;
    v9 = self;
    v10 = 2080;
    v11 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set should load fallback tiles display: %s", (uint8_t *)&v8, 0x16u);
  }
  v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  LOBYTE(v8) = 7;
  md::MapEngineSettings::set(v7, &v8, (_QWORD *)v3);
}

- (void)_configureDefaultSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20[5];
  id v21[5];
  id v22[5];
  id v23[5];
  id v24[5];
  id v25[5];
  id v26[5];
  id v27;
  id location[2];

  objc_initWeak(location, self);
  -[VKMapView setEnableGlobe:](self, "setEnableGlobe:", 0);
  v3 = (void *)*((_QWORD *)self + 73);
  v26[1] = (id)MEMORY[0x1E0C809B0];
  v26[2] = (id)3221225472;
  v26[3] = __38__VKMapView__configureDefaultSettings__block_invoke;
  v26[4] = &unk_1E42EB248;
  objc_copyWeak(&v27, location);
  MapsFeature_AddBlockListener();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[VKMapView setEnableRoundedBuildings:](self, "setEnableRoundedBuildings:", 1);
  v5 = (void *)*((_QWORD *)self + 73);
  v25[1] = (id)MEMORY[0x1E0C809B0];
  v25[2] = (id)3221225472;
  v25[3] = __38__VKMapView__configureDefaultSettings__block_invoke_2;
  v25[4] = &unk_1E42EB248;
  objc_copyWeak(v26, location);
  MapsFeature_AddBlockListener();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  -[VKMapView setEnableColorizedBuildings:](self, "setEnableColorizedBuildings:", 1);
  v7 = (void *)*((_QWORD *)self + 73);
  v24[1] = (id)MEMORY[0x1E0C809B0];
  v24[2] = (id)3221225472;
  v24[3] = __38__VKMapView__configureDefaultSettings__block_invoke_3;
  v24[4] = &unk_1E42EB248;
  objc_copyWeak(v25, location);
  MapsFeature_AddBlockListener();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  -[VKMapView setEnableBuildingHeights:](self, "setEnableBuildingHeights:", 1);
  v9 = (void *)*((_QWORD *)self + 73);
  v23[1] = (id)MEMORY[0x1E0C809B0];
  v23[2] = (id)3221225472;
  v23[3] = __38__VKMapView__configureDefaultSettings__block_invoke_4;
  v23[4] = &unk_1E42EB248;
  objc_copyWeak(v24, location);
  MapsFeature_AddBlockListener();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  -[VKMapView setEnableAdvancedWater:](self, "setEnableAdvancedWater:", 1);
  v11 = (void *)*((_QWORD *)self + 73);
  v22[1] = (id)MEMORY[0x1E0C809B0];
  v22[2] = (id)3221225472;
  v22[3] = __38__VKMapView__configureDefaultSettings__block_invoke_5;
  v22[4] = &unk_1E42EB248;
  objc_copyWeak(v23, location);
  MapsFeature_AddBlockListener();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  -[VKMapView setEnableAdvancedLighting:](self, "setEnableAdvancedLighting:", 1);
  v13 = (void *)*((_QWORD *)self + 73);
  v21[1] = (id)MEMORY[0x1E0C809B0];
  v21[2] = (id)3221225472;
  v21[3] = __38__VKMapView__configureDefaultSettings__block_invoke_6;
  v21[4] = &unk_1E42EB248;
  objc_copyWeak(v22, location);
  MapsFeature_AddBlockListener();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  -[VKMapView setTerrainMode:](self, "setTerrainMode:", 0);
  v15 = (void *)*((_QWORD *)self + 73);
  v20[1] = (id)MEMORY[0x1E0C809B0];
  v20[2] = (id)3221225472;
  v20[3] = __38__VKMapView__configureDefaultSettings__block_invoke_7;
  v20[4] = &unk_1E42EB248;
  objc_copyWeak(v21, location);
  MapsFeature_AddBlockListener();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  -[VKMapView setModernMapEnabled:](self, "setModernMapEnabled:", MapsFeature_IsEnabled_Maps298());
  v17 = (void *)*((_QWORD *)self + 73);
  objc_copyWeak(v20, location);
  MapsFeature_AddBlockListener();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView setCompressedBuildingsEnabled:](self, "setCompressedBuildingsEnabled:", objc_msgSend(v19, "compressedBuildingsDisabled") ^ 1);

  md::MapEngine::updateDaVinciPOILabelsAvailable(*((md::MapEngine **)self + 48));
  -[VKMapView setRenderOverlayPolygons:](self, "setRenderOverlayPolygons:", 1);
  objc_destroyWeak(v20);
  objc_destroyWeak(v21);
  objc_destroyWeak(v22);
  objc_destroyWeak(v23);
  objc_destroyWeak(v24);
  objc_destroyWeak(v25);
  objc_destroyWeak(v26);
  objc_destroyWeak(&v27);
  objc_destroyWeak(location);
}

- (void)setRenderOverlayPolygons:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v4 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v7 = 11;
  md::MapEngineSettings::set(v4, &v7, (_QWORD *)a3);
  v5 = *((_QWORD *)self + 48);
  v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
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

  if (*(_BYTE *)(*((_QWORD *)self + 63) + 3))
    a3 = 0;
  *((_QWORD *)self + 71) = a3;
  if (-[VKMapView _daVinciDataAvailable](self, "_daVinciDataAvailable")
    && +[VKMapView _elevatedGroundIsEnabled](VKMapView, "_elevatedGroundIsEnabled"))
  {
    v5 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
    v13 = 29;
    md::MapEngineSettings::set(v5, &v13, (_QWORD *)a3);
    v6 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
    v12 = 21;
    v7 = (unint64_t)(a3 - 1) < 3;
    v8 = &v12;
  }
  else
  {
    v9 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
    v11 = 29;
    md::MapEngineSettings::set(v9, &v11, 0);
    v6 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
    v10 = 21;
    v8 = &v10;
    v7 = 0;
  }
  md::MapEngineSettings::set(v6, v8, (_QWORD *)v7);
}

+ (BOOL)_elevatedGroundIsEnabled
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

- (void)setEnableGlobe:(BOOL)a3
{
  _BOOL8 v4;
  NSObject *v5;
  const char *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  int v14;
  VKMapView *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*((_QWORD *)self + 63) + 2))
    v4 = 0;
  else
    v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v4)
      v6 = "YES";
    v14 = 134218242;
    v15 = self;
    v16 = 2080;
    v17 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] setEnableGlobe:%s", (uint8_t *)&v14, 0x16u);
  }
  *((_BYTE *)self + 576) = v4;
  objc_msgSend(*((id *)self + 5), "setForceRasterizationForGlobe:", v4);
  if (-[VKMapView _daVinciDataAvailable](self, "_daVinciDataAvailable"))
    v7 = v4 & +[VKMapView _globeIsEnabled](VKMapView, "_globeIsEnabled");
  else
    v7 = 0;
  v8 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  LOBYTE(v14) = 22;
  md::MapEngineSettings::set(v8, &v14, (_QWORD *)v7);
  v9 = *(_QWORD *)(*((_QWORD *)self + 48) + 896);
  if (v9)
    md::World::setEnableGlobe(*(_QWORD *)(v9 + 32), *(_QWORD *)(v9 + 40), v7);
  objc_msgSend(*((id *)self + 5), "cameraController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == *((void **)self + 33);

  if (!v11)
  {
    v12 = (void *)*((_QWORD *)self + 5);
    if (*((_BYTE *)self + 32) && *((_DWORD *)self + 9) == 11)
    {
      objc_msgSend(*((id *)self + 5), "setCameraController:", *((_QWORD *)self + 35));
    }
    else
    {
      -[VKMapView resolveMapCameraController](self, "resolveMapCameraController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCameraController:", v13);

    }
  }
}

+ (BOOL)_globeIsEnabled
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

- (BOOL)_daVinciDataAvailable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)self + 48) + 896) + 24) + 56);
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

- (id)resolveMapCameraController
{
  void *v3;
  char v4;
  int *v5;

  if (-[VKMapView enableGlobe](self, "enableGlobe")
    && (+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "daVinciCameraController"),
        v3,
        (v4 & 1) != 0))
  {
    v5 = &OBJC_IVAR___VKMapView__davinciMapCameraController;
  }
  else
  {
    v5 = &OBJC_IVAR___VKMapView__mapCameraController;
  }
  return *(id *)((char *)self + *v5);
}

- (BOOL)enableGlobe
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *((_QWORD *)self + 48);
  if (!v2)
    return 0;
  v3 = *(uint64_t **)(v2 + 1128);
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

- (void)setModernMapEnabled:(BOOL)a3
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v4 = 25;
  md::MapEngineSettings::set(v3, &v4, (_QWORD *)a3);
}

- (void)setEnableRoundedBuildings:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  *((_BYTE *)self + 577) = a3;
  v5 = -[VKMapView _roundedBuildingsAllowed](self, "_roundedBuildingsAllowed");
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDaVinciRoundBuildings:", v5 & v3);

  v7 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v7 + 4536), "-[VKMapView setEnableRoundedBuildings:]");
  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 8);
  v11[0] = &off_1E42D49F0;
  v11[1] = v7;
  v12 = v11;
  geo::TaskQueue::barrierSync(v8, v11);
  v9 = v12;
  if (v12 == v11)
  {
    v10 = 4;
    v9 = v11;
  }
  else
  {
    if (!v12)
      return;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
}

- (void)setEnableColorizedBuildings:(BOOL)a3
{
  uint64_t v3;
  id v4;

  *((_BYTE *)self + 578) = a3;
  v3 = -[VKMapView _colorizedBuildingsAllowed](self, "_colorizedBuildingsAllowed") & a3;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDaVinciColorBuildings:", v3);

}

- (void)setEnableBuildingHeights:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  *((_BYTE *)self + 579) = a3;
  v5 = -[VKMapView _buildingHeightsAllowed](self, "_buildingHeightsAllowed");
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDaVinciBuildingHeights:", v5 & v3);

  v7 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v7 + 4536), "-[VKMapView setEnableBuildingHeights:]");
  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 8);
  v11[0] = &off_1E42D49F0;
  v11[1] = v7;
  v12 = v11;
  geo::TaskQueue::barrierSync(v8, v11);
  v9 = v12;
  if (v12 == v11)
  {
    v10 = 4;
    v9 = v11;
  }
  else
  {
    if (!v12)
      return;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
}

- (void)setEnableAdvancedWater:(BOOL)a3
{
  uint64_t v3;
  id v4;

  *((_BYTE *)self + 581) = a3;
  v3 = -[VKMapView _advancedWaterAllowed](self, "_advancedWaterAllowed") & a3;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDaVinciWaterEnabled:", v3);

}

- (void)setEnableAdvancedLighting:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;

  v3 = a3;
  *((_BYTE *)self + 580) = a3;
  if (-[VKMapView _daVinciDataAvailable](self, "_daVinciDataAvailable"))
    v5 = -[VKMapView _advancedLightingAllowed](self, "_advancedLightingAllowed") & v3;
  else
    v5 = 0;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDaVinciAdvancedLightingEnabled:", v5);

}

- (void)setCompressedBuildingsEnabled:(BOOL)a3
{
  *((_BYTE *)self + 416) = a3;
  -[VKMapView _updateBuildingCompressionSetting](self, "_updateBuildingCompressionSetting");
}

- (void)_updateBuildingCompressionSetting
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;

  v2 = *((_QWORD *)self + 48);
  v3 = *(_BYTE *)(v2 + 1240);
  v4 = *(_QWORD *)(v2 + 1128);
  v5 = 24;
  md::MapEngineSettings::set(v4, &v5, (_QWORD *)(*((_BYTE *)self + 416) & v3));
}

- (void)openLoaderConnection
{
  id v3;
  id v4;

  if (!*((_BYTE *)self + 128))
  {
    *((_BYTE *)self + 128) = 1;
    objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openForClient:", *((_QWORD *)self + 17));

    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openServerConnection");

  }
}

- (VKPuckAnimator)userLocationAnimator
{
  return (VKPuckAnimator *)*((_QWORD *)self + 28);
}

void __33__VKMapView_didFinishLoadingData__block_invoke(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayerDidFinishLoadingTiles:", *(_QWORD *)(a1 + 32));

  }
}

- (void)setMapDelegate:(id)a3
{
  objc_storeWeak((id *)self + 15, a3);
}

void __34__VKMapView_labelManagerDidLayout__block_invoke(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayerLabelsDidLayout:", *(_QWORD *)(a1 + 32));

  }
}

- (void)updateLightingLogic
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  char v12;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "thermalState");

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLowPowerModeEnabled");

  v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
  v8 = *(_QWORD *)(v7 + 16);
  if ((v8 & (v8 - 1)) != 0)
  {
    v10 = 0x91E65CD7F1A7A7FALL;
    if (v8 <= 0x91E65CD7F1A7A7FALL)
      v10 = 0x91E65CD7F1A7A7FALL % v8;
    v9 = *(_QWORD **)(*(_QWORD *)(v7 + 8) + 8 * v10);
    do
    {
      do
        v9 = (_QWORD *)*v9;
      while (v9[1] != 0x91E65CD7F1A7A7FALL);
    }
    while (v9[2] != 0x91E65CD7F1A7A7FALL);
  }
  else
  {
    v9 = *(_QWORD **)(*(_QWORD *)(v7 + 8) + 8 * ((v8 - 1) & 0x91E65CD7F1A7A7FALL));
    do
    {
      do
        v9 = (_QWORD *)*v9;
      while (v9[1] != 0x91E65CD7F1A7A7FALL);
    }
    while (v9[2] != 0x91E65CD7F1A7A7FALL);
  }
  v11 = v9[5];
  v12 = v6 ^ 1;
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    v12 = 0;
  *(_BYTE *)(v11 + 139) = v12;
}

- (void)addExternalAnchor:(id)a3
{
  uint64_t v4;
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
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint8x8_t v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  float v27;
  float v28;
  _BOOL8 v29;
  unint64_t v30;
  unint64_t v31;
  size_t prime;
  void *v33;
  void *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  size_t v38;
  size_t v39;
  size_t v40;
  _QWORD *i;
  size_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint8x8_t v46;
  uint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  uint8x8_t v50;
  uint64_t v51;
  size_t v52;
  uint64_t v53;
  _QWORD *v54;
  unint64_t v55;
  uint64_t *v56;
  int8x8_t v57;
  uint8x8_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;

  v76 = a3;
  v4 = *((_QWORD *)self + 48);
  v5 = *(int8x8_t **)(v4 + 1120);
  v6 = v5[2];
  if (!*(_QWORD *)&v6)
    goto LABEL_152;
  v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    v8 = 0x79FE0BD9535D5C4DLL;
    if (*(_QWORD *)&v6 <= 0x79FE0BD9535D5C4DuLL)
      v8 = 0x79FE0BD9535D5C4DuLL % *(_QWORD *)&v6;
  }
  else
  {
    v8 = (*(_QWORD *)&v6 - 1) & 0x79FE0BD9535D5C4DLL;
  }
  v9 = *(_QWORD **)(*(_QWORD *)&v5[1] + 8 * v8);
  if (!v9)
    goto LABEL_152;
  v10 = (_QWORD *)*v9;
  if (!v10)
    goto LABEL_152;
  if (v7.u32[0] < 2uLL)
  {
    v11 = *(_QWORD *)&v6 - 1;
    while (1)
    {
      v13 = v10[1];
      if (v13 == 0x79FE0BD9535D5C4DLL)
      {
        if (v10[2] == 0x79FE0BD9535D5C4DLL)
          goto LABEL_22;
      }
      else if ((v13 & v11) != v8)
      {
        goto LABEL_152;
      }
      v10 = (_QWORD *)*v10;
      if (!v10)
        goto LABEL_152;
    }
  }
  while (1)
  {
    v12 = v10[1];
    if (v12 == 0x79FE0BD9535D5C4DLL)
      break;
    if (v12 >= *(_QWORD *)&v6)
      v12 %= *(_QWORD *)&v6;
    if (v12 != v8)
      goto LABEL_152;
LABEL_11:
    v10 = (_QWORD *)*v10;
    if (!v10)
      goto LABEL_152;
  }
  if (v10[2] != 0x79FE0BD9535D5C4DLL)
    goto LABEL_11;
LABEL_22:
  v14 = v10[5];
  if (!v14)
    goto LABEL_152;
  v15 = v76;
  v16 = operator new(0x28uLL);
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  v17 = v15;
  *((_QWORD *)v16 + 2) = &off_1E42B4BB0;
  *((_QWORD *)v16 + 3) = v17;
  *((_QWORD *)v16 + 1) = objc_msgSend(v17, "hash");
  v18 = objc_msgSend(*((id *)v16 + 3), "hash");
  *((_QWORD *)v16 + 1) = v18;
  v19 = *(_QWORD *)(v14 + 184);
  if (!v19)
    goto LABEL_43;
  v20 = (uint8x8_t)vcnt_s8((int8x8_t)v19);
  v20.i16[0] = vaddlv_u8(v20);
  if (v20.u32[0] > 1uLL)
  {
    v21 = v18;
    if (v19 <= v18)
      v21 = v18 % v19;
  }
  else
  {
    v21 = (v19 - 1) & v18;
  }
  v22 = *(_QWORD **)(*(_QWORD *)(v14 + 176) + 8 * v21);
  if (!v22 || (v23 = (_QWORD *)*v22) == 0)
  {
LABEL_43:
    v27 = (float)(unint64_t)(*(_QWORD *)(v14 + 200) + 1);
    v28 = *(float *)(v14 + 208);
    if (!v19 || (float)(v28 * (float)v19) < v27)
    {
      v29 = 1;
      if (v19 >= 3)
        v29 = (v19 & (v19 - 1)) != 0;
      v30 = v29 | (2 * v19);
      v31 = vcvtps_u32_f32(v27 / v28);
      if (v30 <= v31)
        prime = v31;
      else
        prime = v30;
      if (prime == 1)
      {
        prime = 2;
      }
      else if ((prime & (prime - 1)) != 0)
      {
        prime = std::__next_prime(prime);
        v19 = *(_QWORD *)(v14 + 184);
      }
      if (prime > v19)
        goto LABEL_55;
      if (prime >= v19)
        goto LABEL_80;
      v45 = vcvtps_u32_f32((float)*(unint64_t *)(v14 + 200) / *(float *)(v14 + 208));
      if (v19 < 3 || (v46 = (uint8x8_t)vcnt_s8((int8x8_t)v19), v46.i16[0] = vaddlv_u8(v46), v46.u32[0] > 1uLL))
      {
        v45 = std::__next_prime(v45);
      }
      else
      {
        v47 = 1 << -(char)__clz(v45 - 1);
        if (v45 >= 2)
          v45 = v47;
      }
      if (prime <= v45)
        prime = v45;
      if (prime >= v19)
      {
        v19 = *(_QWORD *)(v14 + 184);
      }
      else
      {
        if (prime)
        {
LABEL_55:
          if (prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v33 = operator new(8 * prime);
          v34 = *(void **)(v14 + 176);
          *(_QWORD *)(v14 + 176) = v33;
          if (v34)
            operator delete(v34);
          v35 = 0;
          *(_QWORD *)(v14 + 184) = prime;
          do
            *(_QWORD *)(*(_QWORD *)(v14 + 176) + 8 * v35++) = 0;
          while (prime != v35);
          v37 = v14 + 192;
          v36 = *(_QWORD **)(v14 + 192);
          if (!v36)
            goto LABEL_79;
          v38 = v36[1];
          v39 = prime - 1;
          if ((prime & (prime - 1)) == 0)
          {
            v40 = v38 & v39;
            *(_QWORD *)(*(_QWORD *)(v14 + 176) + 8 * v40) = v37;
            for (i = (_QWORD *)*v36; *v36; i = (_QWORD *)*v36)
            {
              v42 = i[1] & v39;
              if (v42 == v40)
              {
                v36 = i;
              }
              else
              {
                v43 = *(_QWORD *)(v14 + 176);
                if (*(_QWORD *)(v43 + 8 * v42))
                {
                  *v36 = *i;
                  v44 = 8 * v42;
                  *i = **(_QWORD **)(*(_QWORD *)(v14 + 176) + v44);
                  **(_QWORD **)(*(_QWORD *)(v14 + 176) + v44) = i;
                }
                else
                {
                  *(_QWORD *)(v43 + 8 * v42) = v36;
                  v36 = i;
                  v40 = v42;
                }
              }
            }
LABEL_79:
            v19 = prime;
            goto LABEL_80;
          }
          if (v38 >= prime)
            v38 %= prime;
          *(_QWORD *)(*(_QWORD *)(v14 + 176) + 8 * v38) = v37;
          v48 = (_QWORD *)*v36;
          if (!*v36)
            goto LABEL_79;
          while (1)
          {
            v52 = v48[1];
            if (v52 >= prime)
              v52 %= prime;
            if (v52 != v38)
            {
              v53 = *(_QWORD *)(v14 + 176);
              if (!*(_QWORD *)(v53 + 8 * v52))
              {
                *(_QWORD *)(v53 + 8 * v52) = v36;
                goto LABEL_84;
              }
              *v36 = *v48;
              v51 = 8 * v52;
              *v48 = **(_QWORD **)(*(_QWORD *)(v14 + 176) + v51);
              **(_QWORD **)(*(_QWORD *)(v14 + 176) + v51) = v48;
              v48 = v36;
            }
            v52 = v38;
LABEL_84:
            v36 = v48;
            v48 = (_QWORD *)*v48;
            v38 = v52;
            if (!v48)
              goto LABEL_79;
          }
        }
        v75 = *(void **)(v14 + 176);
        *(_QWORD *)(v14 + 176) = 0;
        if (v75)
          operator delete(v75);
        v19 = 0;
        *(_QWORD *)(v14 + 184) = 0;
      }
    }
LABEL_80:
    v49 = *((_QWORD *)v16 + 1);
    v50 = (uint8x8_t)vcnt_s8((int8x8_t)v19);
    v50.i16[0] = vaddlv_u8(v50);
    if (v50.u32[0] > 1uLL)
    {
      if (v49 >= v19)
        v49 %= v19;
    }
    else
    {
      v49 &= v19 - 1;
    }
    v54 = *(_QWORD **)(*(_QWORD *)(v14 + 176) + 8 * v49);
    if (v54)
    {
      *(_QWORD *)v16 = *v54;
    }
    else
    {
      *(_QWORD *)v16 = *(_QWORD *)(v14 + 192);
      *(_QWORD *)(v14 + 192) = v16;
      *(_QWORD *)(*(_QWORD *)(v14 + 176) + 8 * v49) = v14 + 192;
      if (!*(_QWORD *)v16)
      {
LABEL_101:
        ++*(_QWORD *)(v14 + 200);
        goto LABEL_102;
      }
      v55 = *(_QWORD *)(*(_QWORD *)v16 + 8);
      if (v50.u32[0] > 1uLL)
      {
        if (v55 >= v19)
          v55 %= v19;
      }
      else
      {
        v55 &= v19 - 1;
      }
      v54 = (_QWORD *)(*(_QWORD *)(v14 + 176) + 8 * v55);
    }
    *v54 = v16;
    goto LABEL_101;
  }
  v24 = *((_QWORD *)v16 + 3);
  if (v20.u32[0] < 2uLL)
  {
    while (1)
    {
      v26 = v23[1];
      if (v26 == v18)
      {
        if (v23[3] == v24)
          goto LABEL_124;
      }
      else if ((v26 & (v19 - 1)) != v21)
      {
        goto LABEL_43;
      }
      v23 = (_QWORD *)*v23;
      if (!v23)
        goto LABEL_43;
    }
  }
  while (1)
  {
    v25 = v23[1];
    if (v25 == v18)
      break;
    if (v25 >= v19)
      v25 %= v19;
    if (v25 != v21)
      goto LABEL_43;
LABEL_33:
    v23 = (_QWORD *)*v23;
    if (!v23)
      goto LABEL_43;
  }
  if (v23[3] != v24)
    goto LABEL_33;
LABEL_124:
  (**((void (***)(uint64_t))v16 + 2))((uint64_t)v16 + 16);
  operator delete(v16);
LABEL_102:

  objc_msgSend(*(id *)(*((_QWORD *)self + 48) + 840), "size");
  v56 = *(uint64_t **)(*((_QWORD *)self + 48) + 920);
  v57 = (int8x8_t)v56[1];
  if (!*(_QWORD *)&v57)
  {
    v60 = 0;
    goto LABEL_150;
  }
  v58 = (uint8x8_t)vcnt_s8(v57);
  v58.i16[0] = vaddlv_u8(v58);
  if (v58.u32[0] > 1uLL)
  {
    v59 = 0x1AF456233693CD46;
    if (*(_QWORD *)&v57 <= 0x1AF456233693CD46uLL)
      v59 = 0x1AF456233693CD46uLL % *(_QWORD *)&v57;
  }
  else
  {
    v59 = (*(_QWORD *)&v57 - 1) & 0x1AF456233693CD46;
  }
  v61 = *v56;
  v62 = *(_QWORD **)(v61 + 8 * v59);
  if (!v62)
    goto LABEL_127;
  v63 = (_QWORD *)*v62;
  if (!v63)
    goto LABEL_127;
  if (v58.u32[0] < 2uLL)
  {
    while (1)
    {
      v65 = v63[1];
      if (v65 == 0x1AF456233693CD46)
      {
        if (v63[2] == 0x1AF456233693CD46)
          goto LABEL_125;
      }
      else if ((v65 & (*(_QWORD *)&v57 - 1)) != v59)
      {
        goto LABEL_127;
      }
      v63 = (_QWORD *)*v63;
      if (!v63)
        goto LABEL_127;
    }
  }
  while (2)
  {
    v64 = v63[1];
    if (v64 != 0x1AF456233693CD46)
    {
      if (v64 >= *(_QWORD *)&v57)
        v64 %= *(_QWORD *)&v57;
      if (v64 != v59)
        goto LABEL_127;
      goto LABEL_113;
    }
    if (v63[2] != 0x1AF456233693CD46)
    {
LABEL_113:
      v63 = (_QWORD *)*v63;
      if (!v63)
        goto LABEL_127;
      continue;
    }
    break;
  }
LABEL_125:
  v66 = v63[5];
  if (*(_QWORD *)(v66 + 8) == 0x1AF456233693CD46)
  {
    v60 = *(_QWORD *)(v66 + 32);
    goto LABEL_128;
  }
LABEL_127:
  v60 = 0;
LABEL_128:
  if (v58.u32[0] > 1uLL)
  {
    v67 = 0x63B6FE00C0848868;
    if (*(_QWORD *)&v57 <= 0x63B6FE00C0848868uLL)
      v67 = 0x63B6FE00C0848868uLL % *(_QWORD *)&v57;
  }
  else
  {
    v67 = (*(_QWORD *)&v57 - 1) & 0x63B6FE00C0848868;
  }
  v68 = *(_QWORD **)(v61 + 8 * v67);
  if (!v68)
    goto LABEL_150;
  v69 = (_QWORD *)*v68;
  if (!v69)
    goto LABEL_150;
  if (v58.u32[0] < 2uLL)
  {
    v70 = *(_QWORD *)&v57 - 1;
    while (1)
    {
      v72 = v69[1];
      if (v72 == 0x63B6FE00C0848868)
      {
        if (v69[2] == 0x63B6FE00C0848868)
          goto LABEL_148;
      }
      else if ((v72 & v70) != v67)
      {
        goto LABEL_150;
      }
      v69 = (_QWORD *)*v69;
      if (!v69)
        goto LABEL_150;
    }
  }
  while (2)
  {
    v71 = v69[1];
    if (v71 != 0x63B6FE00C0848868)
    {
      if (v71 >= *(_QWORD *)&v57)
        v71 %= *(_QWORD *)&v57;
      if (v71 != v67)
        goto LABEL_150;
      goto LABEL_137;
    }
    if (v69[2] != 0x63B6FE00C0848868)
    {
LABEL_137:
      v69 = (_QWORD *)*v69;
      if (!v69)
        goto LABEL_150;
      continue;
    }
    break;
  }
LABEL_148:
  v73 = v69[5];
  if (*(_QWORD *)(v73 + 8) == 0x63B6FE00C0848868)
  {
    v74 = *(_QWORD *)(v73 + 32);
    goto LABEL_151;
  }
LABEL_150:
  v74 = 0;
LABEL_151:
  objc_msgSend(v17, "prepare:cameraContext:anchorContext:", v60, v74);
  v4 = *((_QWORD *)self + 48);
LABEL_152:
  objc_msgSend(v76, "setDisplayLayer:", *(_QWORD *)(v4 + 840));

}

- (void)setIsPitchable:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  int v9;
  VKMapView *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    v9 = 134218242;
    v10 = self;
    v11 = 2080;
    v12 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set is pitchable: %s", (uint8_t *)&v9, 0x16u);
  }
  -[VKMapView currentCanvas](self, "currentCanvas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsPitchEnabled:", v3);

}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 timingCurve:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  VKMapView *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a7;
  v16 = (void (**)(id, _QWORD))a8;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v17 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v20 = 134219010;
    v21 = self;
    v22 = 2112;
    v23 = v14;
    v24 = 2048;
    v25 = a4;
    v26 = 2048;
    v27 = a5;
    v28 = 2048;
    v29 = a6;
    _os_log_impl(&dword_19F029000, v17, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set map region: %@, pitch: %f, yaw: %f, animation duration: %f", (uint8_t *)&v20, 0x34u);
  }
  -[VKMapView currentCanvas](self, "currentCanvas");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cameraController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "setMapRegion:pitch:yaw:duration:timingCurve:completion:", v14, v15, v16, a4, a5, a6);
  }
  else if (v16)
  {
    v16[2](v16, 0);
  }

}

- (GEOMapRegion)mapRegion
{
  void *v2;
  void *v3;
  void *v4;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapRegion *)v4;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  int v15;
  BOOL v17;
  int v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double *v28;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  long double v37;
  long double v38;
  double v39;
  unint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  double v47;
  unint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  double *v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  long double v60;
  long double v61;
  unint64_t *v62;
  unint64_t v63;
  uint64_t v64;
  void *v65;
  objc_super v66;
  uint8_t buf[4];
  VKMapView *v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  uint64_t v77;
  CGRect v78;
  CGRect v79;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v77 = *MEMORY[0x1E0C80C00];
  -[VKMapView bounds](self, "bounds");
  v79.origin.x = v8;
  v79.origin.y = v9;
  v79.size.width = v10;
  v79.size.height = v11;
  v78.origin.x = x;
  v78.origin.y = y;
  v78.size.width = width;
  v78.size.height = height;
  if (!CGRectEqualToRect(v78, v79))
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v12 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219008;
      v68 = self;
      v69 = 2048;
      v70 = width;
      v71 = 2048;
      v72 = height;
      v73 = 2048;
      v74 = x;
      v75 = 2048;
      v76 = y;
      _os_log_impl(&dword_19F029000, v12, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set bounds, size(%f, %f), origin: (%f, %f)", buf, 0x34u);
    }
    v66.receiver = self;
    v66.super_class = (Class)VKMapView;
    -[VKMapView setBounds:](&v66, sel_setBounds_, x, y, width, height);
    v13 = *((_QWORD *)self + 48);
    if (v13)
    {
      v14 = *(id *)(v13 + 840);
      -[VKMapView bounds](self, "bounds");
      objc_msgSend(v14, "setBounds:");
      v15 = *((_DWORD *)self + 9);
      v17 = v15 == 10 || (v15 - 3) < 2;
      if (*((_BYTE *)self + 32) && v17)
      {
        v18 = 0;
      }
      else
      {
        if (*((_BYTE *)self + 32))
          v19 = v15 == 11;
        else
          v19 = 0;
        v18 = !v19;
      }
      objc_msgSend(v14, "size");
      if (v20 > 0.0)
      {
        objc_msgSend(v14, "size");
        if (v21 > 0.0)
        {
          objc_msgSend(v14, "size");
          v23 = v22;
          objc_msgSend(v14, "size");
          v24 = trunc(v23);
          v26 = trunc(v25);
          objc_msgSend(*((id *)self + 57), "setAspectRatio:", v24 / v26);
          v27 = *((_QWORD *)self + 48);
          v28 = *(double **)(v27 + 1064);
          v29 = *(std::__shared_weak_count **)(v27 + 1072);
          if (v29)
          {
            p_shared_owners = (unint64_t *)&v29->__shared_owners_;
            do
              v31 = __ldxr(p_shared_owners);
            while (__stxr(v31 + 1, p_shared_owners));
          }
          v33 = v28[46];
          v32 = v28[47];
          if (v32 >= v33)
          {
            v39 = v28[57];
          }
          else
          {
            v34 = v32 * v33;
            v35 = v32 / v33;
            if (v34 <= 0.0)
              v36 = 1.0;
            else
              v36 = v35;
            v37 = tan(v28[57] * 0.5);
            v38 = atan(v36 * v37);
            v39 = v38 + v38;
          }
          if (v29)
          {
            v40 = (unint64_t *)&v29->__shared_owners_;
            do
              v41 = __ldaxr(v40);
            while (__stlxr(v41 - 1, v40));
            if (!v41)
            {
              ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
              std::__shared_weak_count::__release_weak(v29);
            }
          }
          v42 = *((_QWORD *)self + 48);
          v43 = *(_QWORD *)(v42 + 1064);
          v44 = *(std::__shared_weak_count **)(v42 + 1072);
          if (v44)
          {
            v45 = (unint64_t *)&v44->__shared_owners_;
            do
              v46 = __ldxr(v45);
            while (__stxr(v46 + 1, v45));
          }
          *(double *)(v43 + 368) = fmax(v24, 0.0);
          *(double *)(v43 + 376) = fmax(v26, 0.0);
          v47 = *(float *)(v43 + 448);
          *(double *)(v43 + 384) = fmax(v47 * v24, 0.0);
          *(double *)(v43 + 392) = fmax(v47 * v26, 0.0);
          if (v44)
          {
            v48 = (unint64_t *)&v44->__shared_owners_;
            do
              v49 = __ldaxr(v48);
            while (__stlxr(v49 - 1, v48));
            if (!v49)
            {
              ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
              std::__shared_weak_count::__release_weak(v44);
            }
          }
          if (v18)
          {
            v50 = *((_QWORD *)self + 48);
            v51 = *(double **)(v50 + 1064);
            v52 = *(std::__shared_weak_count **)(v50 + 1072);
            if (v52)
            {
              v53 = (unint64_t *)&v52->__shared_owners_;
              do
                v54 = __ldxr(v53);
              while (__stxr(v54 + 1, v53));
            }
            v56 = v51[46];
            v55 = v51[47];
            if (v55 < v56)
            {
              v57 = v55 * v56;
              v58 = v56 / v55;
              if (v57 <= 0.0)
                v59 = 1.0;
              else
                v59 = v58;
              v60 = tan(v39 * 0.5);
              v61 = atan(v59 * v60);
              v39 = v61 + v61;
            }
            v51[57] = v39;
            if (v52)
            {
              v62 = (unint64_t *)&v52->__shared_owners_;
              do
                v63 = __ldaxr(v62);
              while (__stlxr(v63 - 1, v62));
              if (!v63)
              {
                ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
                std::__shared_weak_count::__release_weak(v52);
              }
            }
          }
        }
      }
      v64 = *((_QWORD *)self + 48);
      buf[0] = 1;
      md::MapEngine::setNeedsTick(v64, buf);
      -[VKMapView currentCanvas](self, "currentCanvas");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "updateCameraForFrameResize");

    }
  }
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 timingCurve:(id)a8 completion:(id)a9
{
  double var1;
  double var0;
  id v17;
  void (**v18)(id, _QWORD);
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  VKMapView *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  var1 = a3.var1;
  var0 = a3.var0;
  v36 = *MEMORY[0x1E0C80C00];
  v17 = a8;
  v18 = (void (**)(id, _QWORD))a9;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v19 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v22 = 134219521;
    v23 = self;
    v24 = 2049;
    v25 = var0;
    v26 = 2049;
    v27 = var1;
    v28 = 2049;
    v29 = a4;
    v30 = 2048;
    v31 = a5;
    v32 = 2048;
    v33 = a6;
    v34 = 2048;
    v35 = a7;
    _os_log_impl(&dword_19F029000, v19, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set center coodinate: (%{private}f, %{private}f), altitude: %{private}f, yaw: %f, pitch: %f, duration: %f", (uint8_t *)&v22, 0x48u);
  }
  -[VKMapView currentCanvas](self, "currentCanvas");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cameraController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v21, "setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:", 0, v17, v18, var0, var1, a4, a5, a6, a7);
  }
  else if (v18)
  {
    v18[2](v18, 0);
  }

}

- (void)addCustomFeatureDataSource:(id)a3
{
  id v4;

  v4 = a3;
  md::LabelSettings::addCustomFeatureDataSource((uint64_t)-[VKMapView _labelSettings](self, "_labelSettings"), v4);

}

void __34__VKMapView_didUpdateSceneStatus___block_invoke_2(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayerDidChangeSceneState:withState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)setPointsOfInterestFilter:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  id v9;
  int8x8_t *v10;
  int8x8_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  std::__shared_weak_count *v28;
  std::__shared_weak_count *v29;
  char v30;

  v5 = a3;
  v6 = (id)*((_QWORD *)self + 51);
  if (v6 == v5)
    goto LABEL_47;
  objc_storeStrong((id *)self + 51, a3);
  v7 = *((_QWORD *)self + 51);
  if (v7)
  {
    v8 = (std::__shared_weak_count *)operator new(0x30uLL);
    v8->__shared_owners_ = 0;
    v8->__shared_weak_owners_ = 0;
    v8->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DC158;
    v9 = v5;
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B4E90;
    v8[1].__shared_owners_ = (uint64_t)v9;
    v28 = v8 + 1;
    v29 = v8;
  }
  else
  {
    v8 = 0;
    v28 = 0;
    v29 = 0;
  }
  md::LabelSettings_Presentation::setPointsOfInterestFilter((uint64_t)-[VKMapView _labelSettings](self, "_labelSettings"), (uint64_t *)&v28);
  if ((v6 == 0) != (v7 != 0))
    goto LABEL_42;
  v10 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v11 = v10[2];
  if (!*(_QWORD *)&v11)
    goto LABEL_26;
  v12 = (uint8x8_t)vcnt_s8(v11);
  v12.i16[0] = vaddlv_u8(v12);
  if (v12.u32[0] > 1uLL)
  {
    v13 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v11 <= 0x2FED70A4459DFCA1uLL)
      v13 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v11;
  }
  else
  {
    v13 = (*(_QWORD *)&v11 - 1) & 0x2FED70A4459DFCA1;
  }
  v14 = *(_QWORD **)(*(_QWORD *)&v10[1] + 8 * v13);
  if (!v14 || (v15 = (_QWORD *)*v14) == 0)
  {
LABEL_26:
    v19 = 0;
    goto LABEL_27;
  }
  if (v12.u32[0] < 2uLL)
  {
    v16 = *(_QWORD *)&v11 - 1;
    while (1)
    {
      v18 = v15[1];
      if (v18 == 0x2FED70A4459DFCA1)
      {
        if (v15[2] == 0x2FED70A4459DFCA1)
          goto LABEL_48;
      }
      else if ((v18 & v16) != v13)
      {
        goto LABEL_26;
      }
      v15 = (_QWORD *)*v15;
      if (!v15)
        goto LABEL_26;
    }
  }
  while (1)
  {
    v17 = v15[1];
    if (v17 == 0x2FED70A4459DFCA1)
      break;
    if (v17 >= *(_QWORD *)&v11)
      v17 %= *(_QWORD *)&v11;
    if (v17 != v13)
      goto LABEL_26;
LABEL_16:
    v15 = (_QWORD *)*v15;
    if (!v15)
      goto LABEL_26;
  }
  if (v15[2] != 0x2FED70A4459DFCA1)
    goto LABEL_16;
LABEL_48:
  v19 = v15[5];
LABEL_27:
  v20 = v7 != 0;
  if (*(unsigned __int8 *)(v19 + 165) != v20)
  {
    v21 = *(void **)(v19 + 1184);
    if (v21)
      objc_msgSend(v21, "stop");
    *(_BYTE *)(v19 + 165) = v20;
    gss::ClientStyleState<gss::PropertyID>::setTargetClientStyleAttribute(*(_QWORD *)(v19 + 208), 0x10073u, v7 != 0);
    gss::ClientStyleState<gss::ScenePropertyID>::setTargetClientStyleAttribute(*(_QWORD *)(v19 + 224), 0x10073u, *(unsigned __int8 *)(v19 + 165));
    if (*(_BYTE *)(v19 + 1116))
    {
      *(float *)(v19 + 1120) = fmaxf(*(float *)(v19 + 1120), 0.0);
    }
    else
    {
      *(_BYTE *)(v19 + 1116) = 1;
      *(_DWORD *)(v19 + 1120) = 0;
      v30 = 4;
      v22 = *(char **)(v19 + 1128);
      v23 = *(char **)(v19 + 1136);
      if (v22 != v23)
      {
        while (*v22 <= 3u)
        {
          if (++v22 == v23)
            goto LABEL_38;
        }
      }
      if (v22 == v23 || (v23 = v22, *v22 != 4))
LABEL_38:
        std::vector<md::StyleManagerEvent>::insert(v19 + 1128, v23, &v30);
      v24 = **(_QWORD **)(v19 + 1240);
      if (v24)
      {
        v30 = 12;
        md::MapEngine::setNeedsTick(v24, &v30);
      }
    }
  }
  v25 = *((_QWORD *)self + 48);
  v30 = 1;
  md::MapEngine::setNeedsTick(v25, &v30);
  v8 = v29;
LABEL_42:
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
LABEL_47:

}

- (void)didUpdateVerticalYawTo:(double)a3
{
  id v4;

  if (*((double *)self + 23) != a3)
  {
    *((double *)self + 23) = a3;
    -[VKMapView mapDelegate](self, "mapDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapLayer:didUpdateVerticalYawTo:", self, *((double *)self + 23));

  }
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
  uint64_t v16;
  int v17;
  VKMapView *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*((unsigned __int8 *)self + 212) != a3)
  {
    v3 = a3;
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v17 = 134218242;
      v18 = self;
      v19 = 2080;
      v20 = gss::to_string(v3);
      _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set mapKitClientMode: %s", (uint8_t *)&v17, 0x16u);
    }

    *((_BYTE *)self + 212) = v3;
    v6 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
    v7 = v6[2];
    if (v7)
    {
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
      if (v10)
      {
        v11 = (_QWORD *)*v10;
        if (v11)
        {
          if (v8.u32[0] < 2uLL)
          {
            v12 = *(_QWORD *)&v7 - 1;
            while (1)
            {
              v14 = v11[1];
              if (v14 == 0x2FED70A4459DFCA1)
              {
                if (v11[2] == 0x2FED70A4459DFCA1)
                  goto LABEL_30;
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
          do
          {
            v13 = v11[1];
            if (v13 == 0x2FED70A4459DFCA1)
            {
              if (v11[2] == 0x2FED70A4459DFCA1)
              {
LABEL_30:
                v15 = v11[5];
                goto LABEL_27;
              }
            }
            else
            {
              if (v13 >= *(_QWORD *)&v7)
                v13 %= *(_QWORD *)&v7;
              if (v13 != v9)
                break;
            }
            v11 = (_QWORD *)*v11;
          }
          while (v11);
        }
      }
    }
LABEL_26:
    v15 = 0;
LABEL_27:
    md::StyleLogic::setMapKitClientMode(v15, v3);
    if (*((_BYTE *)self + 211))
    {
      v16 = *((_QWORD *)self + 48);
      LOBYTE(v17) = 1;
      md::MapEngine::setNeedsTick(v16, &v17);
    }
  }
}

- (void)setShieldSize:(int64_t)a3
{
  NSObject *v5;
  uint64_t *v6;
  unsigned int v7;
  uint64_t v8;
  md::LabelManager *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  _BYTE v13[24];
  _BYTE *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[VKMapView shieldSize](self, "shieldSize") != a3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v5 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v13 = 134218240;
      *(_QWORD *)&v13[4] = self;
      *(_WORD *)&v13[12] = 2048;
      *(_QWORD *)&v13[14] = a3;
      _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shield size: %ld", v13, 0x16u);
    }
    v6 = -[VKMapView _labelSettings](self, "_labelSettings");
    v7 = +[VKInternalIconManager convertSizeGroup:](VKInternalIconManager, "convertSizeGroup:", a3);
    v8 = *v6;
    *(_BYTE *)(*(_QWORD *)(*v6 + 40) + 1) = v7;
    v9 = *(md::LabelManager **)(v8 + 24);
    *(_QWORD *)v13 = &off_1E42C95F0;
    *(_QWORD *)&v13[8] = v9;
    *(_QWORD *)&v13[16] = v7;
    v14 = v13;
    md::LabelManager::queueCommand(v9, 10, 1, v13);
    v10 = v14;
    if (v14 == v13)
    {
      v11 = 4;
      v10 = v13;
    }
    else
    {
      if (!v14)
      {
LABEL_11:
        v12 = (void *)*((_QWORD *)self + 67);
        *((_QWORD *)self + 67) = 0;

        return;
      }
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
    goto LABEL_11;
  }
}

- (int64_t)shieldSize
{
  return +[VKInternalIconManager convertGrlSizeGroup:](VKInternalIconManager, "convertGrlSizeGroup:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 1));
}

- (void)setMapKitUsage:(unsigned __int8)a3
{
  unsigned int v3;
  NSObject *v5;
  int v6;
  _BOOL4 v7;
  int8x8_t *v8;
  int8x8_t v9;
  uint8x8_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int v24;
  VKMapView *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*((unsigned __int8 *)self + 211) == a3)
    return;
  v3 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v24 = 134218242;
    v25 = self;
    v26 = 2080;
    v27 = gss::to_string(v3);
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set mapKitUsage: %s", (uint8_t *)&v24, 0x16u);
  }

  *((_BYTE *)self + 211) = v3;
  v6 = *((unsigned __int8 *)self + 209);
  v7 = v3 != 0;
  *((_BYTE *)self + 209) = v7;
  v8 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v9 = v8[2];
  if (!*(_QWORD *)&v9)
    goto LABEL_26;
  v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    v11 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v9 <= 0x2FED70A4459DFCA1uLL)
      v11 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v9;
  }
  else
  {
    v11 = (*(_QWORD *)&v9 - 1) & 0x2FED70A4459DFCA1;
  }
  v12 = *(_QWORD **)(*(_QWORD *)&v8[1] + 8 * v11);
  if (!v12 || (v13 = (_QWORD *)*v12) == 0)
  {
LABEL_26:
    v17 = 0;
    goto LABEL_27;
  }
  if (v10.u32[0] < 2uLL)
  {
    v14 = *(_QWORD *)&v9 - 1;
    while (1)
    {
      v16 = v13[1];
      if (v16 == 0x2FED70A4459DFCA1)
      {
        if (v13[2] == 0x2FED70A4459DFCA1)
          goto LABEL_40;
      }
      else if ((v16 & v14) != v11)
      {
        goto LABEL_26;
      }
      v13 = (_QWORD *)*v13;
      if (!v13)
        goto LABEL_26;
    }
  }
  while (1)
  {
    v15 = v13[1];
    if (v15 == 0x2FED70A4459DFCA1)
      break;
    if (v15 >= *(_QWORD *)&v9)
      v15 %= *(_QWORD *)&v9;
    if (v15 != v11)
      goto LABEL_26;
LABEL_16:
    v13 = (_QWORD *)*v13;
    if (!v13)
      goto LABEL_26;
  }
  if (v13[2] != 0x2FED70A4459DFCA1)
    goto LABEL_16;
LABEL_40:
  v17 = v13[5];
LABEL_27:
  md::StyleLogic::setUsage(v17, v7, v3);
  v18 = *((_BYTE *)self + 209) == 0;
  *((_BYTE *)self + 210) = v18;
  v19 = *((_QWORD *)self + 48);
  v20 = *(_QWORD *)(v19 + 1120);
  v21 = *(_QWORD *)(v20 + 16);
  if ((v21 & (v21 - 1)) != 0)
  {
    v23 = 0x20A1ED17D78F322BLL;
    if (v21 <= 0x20A1ED17D78F322BLL)
      v23 = 0x20A1ED17D78F322BLL % v21;
    v22 = *(_QWORD **)(*(_QWORD *)(v20 + 8) + 8 * v23);
    do
    {
      do
        v22 = (_QWORD *)*v22;
      while (v22[1] != 0x20A1ED17D78F322BLL);
    }
    while (v22[2] != 0x20A1ED17D78F322BLL);
  }
  else
  {
    v22 = *(_QWORD **)(*(_QWORD *)(v20 + 8) + 8 * ((v21 - 1) & 0x20A1ED17D78F322BLL));
    do
    {
      do
        v22 = (_QWORD *)*v22;
      while (v22[1] != 0x20A1ED17D78F322BLL);
    }
    while (v22[2] != 0x20A1ED17D78F322BLL);
  }
  *(_BYTE *)(v22[5] + 224) = v18;
  LOBYTE(v24) = 1;
  md::MapEngine::setNeedsTick(v19, &v24);
  if (v6 != *((unsigned __int8 *)self + 209))
    -[VKMapView _updateOnlyShowRoadClosures](self, "_updateOnlyShowRoadClosures");
}

- (BOOL)_createDisplayLayer
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t *v22;
  unint64_t v23;
  char v24;
  void *v25;
  uint64_t v27;
  std::__shared_weak_count *v28;

  v3 = *((_QWORD *)self + 48);
  objc_msgSend(*(id *)(v3 + 840), "setRenderSource:", *(_QWORD *)(v3 + 48));
  objc_msgSend(*(id *)(v3 + 840), "createRenderTarget");
  v4 = *((_QWORD *)self + 48);
  LOBYTE(v27) = 1;
  md::MapEngine::setNeedsTick(v4, &v27);
  v5 = *(id *)(*((_QWORD *)self + 48) + 840);
  -[VKMapView contentsScale](self, "contentsScale");
  objc_msgSend(v5, "setContentScale:");
  -[VKMapView bounds](self, "bounds");
  objc_msgSend(v5, "setBounds:");
  objc_msgSend(v5, "size");
  if (v6 > 0.0)
  {
    objc_msgSend(v5, "size");
    if (v7 > 0.0)
    {
      objc_msgSend(v5, "size");
      v9 = v8;
      objc_msgSend(v5, "size");
      objc_msgSend(*((id *)self + 57), "setAspectRatio:", v9 / v10);
      v11 = *((_QWORD *)self + 48);
      v12 = *(_QWORD *)(v11 + 1064);
      v13 = *(std::__shared_weak_count **)(v11 + 1072);
      v27 = v12;
      v28 = v13;
      if (v13)
      {
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          v15 = __ldxr(p_shared_owners);
        while (__stxr(v15 + 1, p_shared_owners));
      }
      objc_msgSend(v5, "size", v27, v28);
      v17 = v16;
      objc_msgSend(v5, "size");
      v18 = trunc(v17);
      v20 = trunc(v19);
      *(double *)(v12 + 368) = fmax(v18, 0.0);
      *(double *)(v12 + 376) = fmax(v20, 0.0);
      v21 = *(float *)(v12 + 448);
      *(double *)(v12 + 384) = fmax(v21 * v18, 0.0);
      *(double *)(v12 + 392) = fmax(v21 * v20, 0.0);
      if (v13)
      {
        v22 = (unint64_t *)&v13->__shared_owners_;
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
    }
  }
  v24 = objc_msgSend(*(id *)(*((_QWORD *)self + 48) + 824), "insertDisplayLayer:", self);
  -[VKMapView currentCanvas](self, "currentCanvas");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "updateCameraForFrameResize");

  return v24;
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
  void *v12;
  _BYTE v13[24];
  _BYTE *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[VKMapView labelScaleFactor](self, "labelScaleFactor") != a3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v5 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v13 = 134218240;
      *(_QWORD *)&v13[4] = self;
      *(_WORD *)&v13[12] = 2048;
      *(_QWORD *)&v13[14] = a3;
      _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set label scale factor: %ld", v13, 0x16u);
    }
    v6 = -[VKMapView _labelSettings](self, "_labelSettings");
    if ((unint64_t)a3 >= 6)
      v7 = 1;
    else
      v7 = a3;
    v8 = *v6;
    *(_BYTE *)(*(_QWORD *)(*v6 + 40) + 48) = v7;
    v9 = *(md::LabelManager **)(v8 + 24);
    *(_QWORD *)v13 = &off_1E42C9C68;
    *(_QWORD *)&v13[8] = v9;
    *(_QWORD *)&v13[16] = v7;
    v14 = v13;
    md::LabelManager::queueCommand(v9, 4, 1, v13);
    v10 = v14;
    if (v14 == v13)
    {
      v11 = 4;
      v10 = v13;
    }
    else
    {
      if (!v14)
      {
LABEL_14:
        v12 = (void *)*((_QWORD *)self + 67);
        *((_QWORD *)self + 67) = 0;

        return;
      }
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
    goto LABEL_14;
  }
}

- (int64_t)labelScaleFactor
{
  unsigned int v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 48);
  if (v2 >= 6)
    return 1;
  else
    return v2;
}

- (id)navigationPuck
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    return 0;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0xBEC1A12372CEEC00;
    if (*(_QWORD *)&v3 <= 0xBEC1A12372CEEC00)
      v5 = 0xBEC1A12372CEEC00 % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0xBEC1A12372CEEC00;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6)
    return 0;
  v7 = (_QWORD *)*v6;
  if (!v7)
    return 0;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0xBEC1A12372CEEC00)
      {
        if (v7[2] == 0xBEC1A12372CEEC00)
          goto LABEL_22;
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        return 0;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0xBEC1A12372CEEC00)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      return 0;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      return 0;
  }
  if (v7[2] != 0xBEC1A12372CEEC00)
    goto LABEL_11;
LABEL_22:
  v11 = v7[5];
  if (!v11)
    return 0;
  return *(id *)(v11 + 160);
}

void __43__VKMapView_locationInHikingToolTipRegion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v4 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 134218240;
      v9 = v5;
      v10 = 2048;
      v11 = v6;
      _os_log_impl(&dword_19F029000, v4, OS_LOG_TYPE_INFO, "[VKMapView:%p] locationInHikingToolTipRegion hikingToolTipRegionId:%llu", (uint8_t *)&v8, 0x16u);
    }
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v7, "mapLayer:locationInHikingToolTipRegion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)setRouteLineSplitAnnotation:(id)a3
{
  id v5;
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
  id v16;

  v5 = a3;
  v6 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  if (v6)
  {
    v7 = v6[2];
    if (v7)
    {
      v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        v9 = 0x5CBBA028798243FLL;
        if (*(_QWORD *)&v7 <= 0x5CBBA028798243FuLL)
          v9 = 0x5CBBA028798243FuLL % *(_QWORD *)&v7;
      }
      else
      {
        v9 = (*(_QWORD *)&v7 - 1) & 0x5CBBA028798243FLL;
      }
      v10 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
      if (v10)
      {
        v11 = (_QWORD *)*v10;
        if (v11)
        {
          if (v8.u32[0] < 2uLL)
          {
            v12 = *(_QWORD *)&v7 - 1;
            while (1)
            {
              v14 = v11[1];
              if (v14 == 0x5CBBA028798243FLL)
              {
                if (v11[2] == 0x5CBBA028798243FLL)
                  goto LABEL_23;
              }
              else if ((v14 & v12) != v9)
              {
                goto LABEL_25;
              }
              v11 = (_QWORD *)*v11;
              if (!v11)
                goto LABEL_25;
            }
          }
          do
          {
            v13 = v11[1];
            if (v13 == 0x5CBBA028798243FLL)
            {
              if (v11[2] == 0x5CBBA028798243FLL)
              {
LABEL_23:
                v15 = v11[5];
                if (v15)
                {
                  v16 = v5;
                  objc_storeStrong((id *)(v15 + 176), a3);
                  v5 = v16;
                }
                break;
              }
            }
            else
            {
              if (v13 >= *(_QWORD *)&v7)
                v13 %= *(_QWORD *)&v7;
              if (v13 != v9)
                break;
            }
            v11 = (_QWORD *)*v11;
          }
          while (v11);
        }
      }
    }
  }
LABEL_25:

}

- (void)setHostDisplay:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  VKMapView *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v16 = 134218240;
    v17 = self;
    v18 = 2048;
    v19 = v4;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set host display: %p", (uint8_t *)&v16, 0x16u);
  }
  v6 = *((_QWORD *)self + 48);
  v7 = v4;
  v8 = v7;
  v9 = *(_QWORD *)(v6 + 64);
  if (v9)
  {
    v10 = v7;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v10 != *(id *)(v9 + 88))
    {
      objc_storeStrong((id *)(v9 + 88), v10);
      objc_msgSend(*(id *)(v9 + 72), "invalidate");
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithDisplay:target:selector:", *(_QWORD *)(v9 + 88), *(_QWORD *)(v9 + 80), sel_displayLinkFired_);
      v11 = objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(v9 + 72);
      v12 = (uint64_t *)(v9 + 72);
      *v12 = v11;

      v14 = (void *)*v12;
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addToRunLoop:forMode:", v15, *MEMORY[0x1E0C99860]);

    }
  }

}

- (void)setRendersInBackground:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  md::MapEngine *v7;
  int v8;
  VKMapView *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    v8 = 134218242;
    v9 = self;
    v10 = 2080;
    v11 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set renders in background: %s", (uint8_t *)&v8, 0x16u);
  }
  v7 = (md::MapEngine *)*((_QWORD *)self + 48);
  *((_BYTE *)v7 + 1178) = v3;
  md::MapEngine::updateRunLoopStatus(v7);
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
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows points of interest: %s", v12, 0x16u);
  }
  v7 = -[VKMapView _labelSettings](self, "_labelSettings");
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

- (void)setLocalizeLabels:(BOOL)a3
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
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set localized labels: %s", v12, 0x16u);
  }
  v7 = -[VKMapView _labelSettings](self, "_labelSettings");
  v8 = *v7;
  *(_BYTE *)(*(_QWORD *)(*v7 + 40) + 24) = v3;
  v9 = *(md::LabelManager **)(v8 + 24);
  *(_QWORD *)v12 = &off_1E42C9950;
  *(_QWORD *)&v12[8] = v9;
  *(_QWORD *)&v12[16] = v3;
  v13 = v12;
  md::LabelManager::queueCommand(v9, 5, 1, v12);
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

- (void)setIsMKRenderingSelectionBalloon:(BOOL)a3
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
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set isMKRenderingSelectionBalloon: %s", v12, 0x16u);
  }
  v7 = -[VKMapView _labelSettings](self, "_labelSettings");
  v8 = *v7;
  *(_BYTE *)(*(_QWORD *)(*v7 + 40) + 27) = v3;
  v9 = *(md::LabelManager **)(v8 + 24);
  *(_QWORD *)v12 = &off_1E42CA4D8;
  *(_QWORD *)&v12[8] = v9;
  *(_QWORD *)&v12[16] = v3;
  v13 = v12;
  md::LabelManager::queueCommand(v9, 67, 1, v12);
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

- (void)setPreferredUnits:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  VKMapView *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v10 = 134218240;
    v11 = self;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set Contour Line Units: %lu", (uint8_t *)&v10, 0x16u);
  }
  v6 = a3 != 0;
  v7 = *((_QWORD *)self + 48);
  if (*(unsigned __int8 *)(*(_QWORD *)(v7 + 896) + 392) != v6)
  {
    md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v7 + 4536), "-[VKMapView setPreferredUnits:]");
    md::World::setPreferredUnits(*(_QWORD *)(v7 + 896), v6);
    v8 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
    LOBYTE(v10) = 35;
    md::MapEngineSettings::set(v8, &v10, (_QWORD *)(a3 != 0));
    v9 = *((_QWORD *)self + 48);
    LOBYTE(v10) = 1;
    md::MapEngine::setNeedsTick(v9, &v10);
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 32) = 0;
  *((_QWORD *)self + 7) = 850045863;
  *((_QWORD *)self + 14) = 0;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_QWORD *)self + 34) = &off_1E42B5010;
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 37) = &off_1E42B51F0;
  *((_QWORD *)self + 38) = 0;
  *((_BYTE *)self + 328) = 0;
  *((_BYTE *)self + 352) = 0;
  *((_BYTE *)self + 360) = 0;
  *((_BYTE *)self + 368) = 0;
  *((_QWORD *)self + 47) = 0xBF80000000000000;
  *((_QWORD *)self + 48) = 0;
  *((_QWORD *)self + 53) = &off_1E42B4F90;
  *((_QWORD *)self + 54) = 0;
  *((_QWORD *)self + 56) = &off_1E42B54B0;
  *((_QWORD *)self + 57) = 0;
  *((_QWORD *)self + 60) = &off_1E42B52F0;
  *((_QWORD *)self + 61) = 0;
  *((_QWORD *)self + 63) = 0;
  *((_QWORD *)self + 68) = &off_1E42B5270;
  *((_QWORD *)self + 69) = 0;
  return self;
}

- (void)setTargetDisplay:(int64_t)a3
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  void *v11;
  const __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int8x8_t *v22;
  int8x8_t v23;
  uint8x8_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  void *v31;
  md::LabelManager *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _BYTE v39[24];
  _BYTE *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = 0x2FED70A4459DFCA1;
  v6 = a3;
  v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
  v8 = *(_QWORD *)(v7 + 16);
  if ((v8 & (v8 - 1)) != 0)
  {
    v10 = 0x2FED70A4459DFCA1;
    if (v8 <= 0x2FED70A4459DFCA1)
      v10 = 0x2FED70A4459DFCA1 % v8;
    v9 = *(_QWORD **)(*(_QWORD *)(v7 + 8) + 8 * v10);
    do
    {
      do
        v9 = (_QWORD *)*v9;
      while (v9[1] != 0x2FED70A4459DFCA1);
    }
    while (v9[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    v9 = *(_QWORD **)(*(_QWORD *)(v7 + 8) + 8 * ((v8 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        v9 = (_QWORD *)*v9;
      while (v9[1] != 0x2FED70A4459DFCA1);
    }
    while (v9[2] != 0x2FED70A4459DFCA1);
  }
  if (*(unsigned __int8 *)(v9[5] + 161) == a3)
    return;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v11 = (void *)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 2)
      v12 = &stru_1E4315B30;
    else
      v12 = off_1E42EB3E8[a3];
    *(_DWORD *)v39 = 134218242;
    *(_QWORD *)&v39[4] = self;
    *(_WORD *)&v39[12] = 2112;
    *(_QWORD *)&v39[14] = v12;
    v13 = v11;
    _os_log_impl(&dword_19F029000, v13, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set target display: %@", v39, 0x16u);

  }
  v14 = *((_QWORD *)self + 48);
  v15 = *(_QWORD *)(v14 + 896);
  v16 = *(_QWORD *)(v15 + 32);
  v17 = *(_QWORD *)(v15 + 40);
  if (v16 != v17)
  {
    while (*(_WORD *)v16 != 27)
    {
      v16 += 16;
      if (v16 == v17)
        goto LABEL_29;
    }
  }
  if (v16 != v17)
  {
    v18 = *(_QWORD *)(v16 + 8);
    if (v18)
    {
      if (*(unsigned __int8 *)(v18 + 760) != v6)
      {
        v19 = *(_QWORD *)(v18 + 752);
        v20 = v19 & 0xFFFFFFFFFFFFFFF9 | 4;
        v21 = v19 | 6;
        if (v6 != 1)
          v21 = v20;
        *(_QWORD *)(v18 + 752) = v21;
        *(_BYTE *)(v18 + 760) = v6;
        gdc::LayerDataStore::clearAllData(*(gdc::LayerDataStore **)(v18 + 16));
        v14 = *((_QWORD *)self + 48);
      }
    }
  }
LABEL_29:
  v22 = *(int8x8_t **)(v14 + 1120);
  v23 = v22[2];
  if (!*(_QWORD *)&v23)
    goto LABEL_49;
  v24 = (uint8x8_t)vcnt_s8(v23);
  v24.i16[0] = vaddlv_u8(v24);
  if (v24.u32[0] > 1uLL)
  {
    if (*(_QWORD *)&v23 <= 0x2FED70A4459DFCA1uLL)
      v5 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v23;
  }
  else
  {
    v5 = (*(_QWORD *)&v23 - 1) & 0x2FED70A4459DFCA1;
  }
  v25 = *(_QWORD **)(*(_QWORD *)&v22[1] + 8 * v5);
  if (!v25 || (v26 = (_QWORD *)*v25) == 0)
  {
LABEL_49:
    v30 = 0;
    goto LABEL_50;
  }
  if (v24.u32[0] < 2uLL)
  {
    v27 = *(_QWORD *)&v23 - 1;
    while (1)
    {
      v29 = v26[1];
      if (v29 == 0x2FED70A4459DFCA1)
      {
        if (v26[2] == 0x2FED70A4459DFCA1)
          goto LABEL_63;
      }
      else if ((v29 & v27) != v5)
      {
        goto LABEL_49;
      }
      v26 = (_QWORD *)*v26;
      if (!v26)
        goto LABEL_49;
    }
  }
  while (1)
  {
    v28 = v26[1];
    if (v28 == 0x2FED70A4459DFCA1)
      break;
    if (v28 >= *(_QWORD *)&v23)
      v28 %= *(_QWORD *)&v23;
    if (v28 != v5)
      goto LABEL_49;
LABEL_39:
    v26 = (_QWORD *)*v26;
    if (!v26)
      goto LABEL_49;
  }
  if (v26[2] != 0x2FED70A4459DFCA1)
    goto LABEL_39;
LABEL_63:
  v30 = (_BYTE *)v26[5];
LABEL_50:
  if (v30[161] != v6)
  {
    v30[161] = v6;
    (*(void (**)(_BYTE *))(*(_QWORD *)v30 + 16))(v30);
  }
  v31 = -[VKMapView _labelSettings](self, "_labelSettings", *(_QWORD *)v39, *(_OWORD *)&v39[8]);
  **((_BYTE **)v31 + 5) = v6;
  v32 = (md::LabelManager *)*((_QWORD *)v31 + 3);
  *(_QWORD *)v39 = &off_1E42C9830;
  *(_QWORD *)&v39[8] = v32;
  *(_QWORD *)&v39[16] = a3;
  v40 = v39;
  md::LabelManager::queueCommand(v32, 13, 1, v39);
  v33 = v40;
  if (v40 == v39)
  {
    v34 = 4;
    v33 = v39;
LABEL_56:
    (*(void (**)(void))(*v33 + 8 * v34))();
  }
  else if (v40)
  {
    v34 = 5;
    goto LABEL_56;
  }
  v35 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v35 + 4536), "-[VKMapView setTargetDisplay:]");
  v36 = *(_QWORD *)(*(_QWORD *)(v35 + 8) + 8);
  *(_QWORD *)v39 = &off_1E42D49F0;
  *(_QWORD *)&v39[8] = v35;
  v40 = v39;
  geo::TaskQueue::barrierSync(v36, v39);
  v37 = v40;
  if (v40 == v39)
  {
    v38 = 4;
    v37 = v39;
LABEL_61:
    (*(void (**)(void))(*v37 + 8 * v38))();
  }
  else if (v40)
  {
    v38 = 5;
    goto LABEL_61;
  }
}

- (void)_updateCameraThermalOptions
{
  int *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  VKMapView *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)self + 192) == 2)
  {
    if ((*((_QWORD *)self + 75) | 2) == 3)
      v3 = (int *)(*((_QWORD *)self + 63) + 16 * *((unsigned __int8 *)self + 512) + 68);
    else
      v3 = (int *)(*((_QWORD *)self + 63) + 16 * *((unsigned __int8 *)self + 512) + 4);
  }
  else
  {
    v3 = (int *)(*((_QWORD *)self + 63) + 16 * *((unsigned __int8 *)self + 512) + 132);
  }
  v4 = *((unsigned __int8 *)v3 + 12);
  v5 = v3[2];
  if (*((_BYTE *)v3 + 4))
    v6 = *v3;
  else
    v6 = 0;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseDisplayRate:", v6);

  if (v4)
    v8 = v5;
  else
    v8 = 0;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaxDisplayRate:", v8);

  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v10 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    -[VKMapView currentCanvas](self, "currentCanvas");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "baseDisplayRate");
    -[VKMapView currentCanvas](self, "currentCanvas");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218496;
    v15 = self;
    v16 = 1024;
    v17 = v12;
    v18 = 1024;
    v19 = objc_msgSend(v13, "maxDisplayRate");
    _os_log_impl(&dword_19F029000, v10, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set Nav Thermal Options: targetFps=%i, maxFps:%i", (uint8_t *)&v14, 0x18u);

  }
}

- (void)_setThermalPressureLevel:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  VKMapView *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = 134218240;
    v7 = self;
    v8 = 1024;
    v9 = a3;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] set thermal pressure %i", (uint8_t *)&v6, 0x12u);
  }
  *((_QWORD *)self + 65) = a3;
  if (a3 < 0x1E)
  {
    if (a3 < 0x14)
      *((_BYTE *)self + 512) = a3 >= 0xA;
    else
      *((_BYTE *)self + 512) = 2;
  }
  else
  {
    *((_BYTE *)self + 512) = 3;
  }
}

- (id)buildingMarkerAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  void *v7;
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
  md::CameraContext *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  const CGPoint *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  VKMarker *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  VKMarker *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  _QWORD v44[3];

  y = a3.y;
  x = a3.x;
  v6 = *(id *)(*((_QWORD *)self + 48) + 840);
  v7 = v6;
  v8 = *(_QWORD **)(*((_QWORD *)self + 48) + 920);
  v9 = (int8x8_t)v8[1];
  if (!*(_QWORD *)&v9)
    goto LABEL_33;
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
    goto LABEL_33;
  v13 = (_QWORD *)*v12;
  if (!v13)
    goto LABEL_33;
  if (v10.u32[0] < 2uLL)
  {
    v14 = *(_QWORD *)&v9 - 1;
    while (1)
    {
      v16 = v13[1];
      if (v16 == 0x1AF456233693CD46)
      {
        if (v13[2] == 0x1AF456233693CD46)
          goto LABEL_22;
      }
      else if ((v16 & v14) != v11)
      {
        goto LABEL_33;
      }
      v13 = (_QWORD *)*v13;
      if (!v13)
        goto LABEL_33;
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
      goto LABEL_33;
LABEL_11:
    v13 = (_QWORD *)*v13;
    if (!v13)
      goto LABEL_33;
  }
  if (v13[2] != 0x1AF456233693CD46)
    goto LABEL_11;
LABEL_22:
  v17 = v13[5];
  if (*(_QWORD *)(v17 + 8) != 0x1AF456233693CD46 || (v18 = *(md::CameraContext **)(v17 + 32)) == 0)
  {
LABEL_33:
    v32 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v6, "size");
  v20 = v19;
  objc_msgSend(v7, "size");
  v22 = v21;
  objc_msgSend(v7, "size");
  v44[0] = md::CameraContext::groundPointFromScreenPoint(v18, v24, x / v20, (-1.0 - y + v22) / v23);
  v44[1] = v25;
  v44[2] = v26;
  v27 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v27 + 4536), "-[VKMapView(Tools) buildingMarkerAtPoint:]");
  v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v27 + 856) + 40) + 208);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, _QWORD *))(*(_QWORD *)v28 + 88))(&v42, v28, v44);
  if (v42)
  {
    v29 = [VKMarker alloc];
    v40 = v42;
    v41 = v43;
    if (v43)
    {
      p_shared_owners = (unint64_t *)&v43->__shared_owners_;
      do
        v31 = __ldxr(p_shared_owners);
      while (__stxr(v31 + 1, p_shared_owners));
    }
    v32 = -[VKMarker initWithFeatureMarkerPtr:markerType:](v29, "initWithFeatureMarkerPtr:markerType:", &v40, 0);
    v33 = v41;
    if (v41)
    {
      v34 = (unint64_t *)&v41->__shared_owners_;
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
  }
  else
  {
    v32 = 0;
  }
  v37 = v43;
  if (v43)
  {
    v38 = (unint64_t *)&v43->__shared_owners_;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
LABEL_34:

  return v32;
}

- (id)markerAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerAtScreenPoint:enableExtendedFeatureMarkers:", 1, x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unordered_map<unsigned)clientStyleAttributes
{
  unsigned __int16 *v3;
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
  unint64_t v15;
  geo::read_write_lock *v16;
  const char *v17;
  const char *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  unint64_t var0;
  unint64_t v23;
  unint64_t v24;
  uint8x8_t v25;
  unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> **v26;
  unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *v27;
  unint64_t v28;
  unint64_t v29;
  float v30;
  float v31;
  _BOOL8 v32;
  unint64_t v33;
  unint64_t v34;
  size_t v35;
  void **v36;
  uint64_t v37;
  _QWORD *v38;
  size_t v39;
  size_t v40;
  size_t v41;
  _QWORD *i;
  size_t v43;
  size_t v44;
  uint8x8_t v45;
  unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *v46;
  _QWORD *v47;
  size_t v48;
  size_t v49;
  void **v50;
  void **v51;
  unint64_t v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned int, unsigned long long>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned int, unsigned long long>, void *>>> *p_var1;
  _BYTE v57[15];
  char v58;
  unint64_t v59;

  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  v5 = *(int8x8_t **)(self[9].var0.var2.var0 + 1120);
  if (v5)
  {
    v6 = v5[2];
    if (v6)
    {
      v7 = (uint8x8_t)vcnt_s8(v6);
      v7.i16[0] = vaddlv_u8(v7);
      if (v7.u32[0] > 1uLL)
      {
        v8 = 0x2FED70A4459DFCA1;
        if (*(_QWORD *)&v6 <= 0x2FED70A4459DFCA1uLL)
          v8 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v6;
      }
      else
      {
        v8 = (*(_QWORD *)&v6 - 1) & 0x2FED70A4459DFCA1;
      }
      v9 = *(_QWORD **)(*(_QWORD *)&v5[1] + 8 * v8);
      if (v9)
      {
        v10 = (_QWORD *)*v9;
        if (v10)
        {
          if (v7.u32[0] < 2uLL)
          {
            v11 = *(_QWORD *)&v6 - 1;
            while (1)
            {
              v13 = v10[1];
              if (v13 == 0x2FED70A4459DFCA1)
              {
                if (v10[2] == 0x2FED70A4459DFCA1)
                  goto LABEL_23;
              }
              else if ((v13 & v11) != v8)
              {
                return self;
              }
              v10 = (_QWORD *)*v10;
              if (!v10)
                return self;
            }
          }
          while (1)
          {
            v12 = v10[1];
            if (v12 == 0x2FED70A4459DFCA1)
              break;
            if (v12 >= *(_QWORD *)&v6)
              v12 %= *(_QWORD *)&v6;
            if (v12 != v8)
              return self;
LABEL_12:
            v10 = (_QWORD *)*v10;
            if (!v10)
              return self;
          }
          if (v10[2] != 0x2FED70A4459DFCA1)
            goto LABEL_12;
LABEL_23:
          v14 = v10[5];
          if (v14)
          {
            v15 = *(_QWORD *)(v14 + 208);
            v59 = v15 + 16;
            v16 = (geo::read_write_lock *)pthread_rwlock_rdlock((pthread_rwlock_t *)(v15 + 16));
            if ((_DWORD)v16)
              geo::read_write_lock::logFailure(v16, (uint64_t)"read lock", v17);
            memset(v57, 0, sizeof(v57));
            v58 = 1;
            geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::copy(v57, v15 + 216);
            self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)pthread_rwlock_unlock((pthread_rwlock_t *)(v15 + 16));
            if ((_DWORD)self)
              geo::read_write_lock::logFailure((geo::read_write_lock *)self, (uint64_t)"unlock", v18);
            v19 = *(unsigned __int16 *)&v57[10];
            if (!*(_WORD *)&v57[10])
            {
LABEL_126:
              if (!v57[14])
              {
                v54 = *(_QWORD *)v57;
                if (*(_QWORD *)v57)
                {
                  v55 = gss::Allocator::instance((gss::Allocator *)self);
                  return (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)(*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v55 + 40))(v55, v54, *(unsigned __int16 *)&v57[12]);
                }
              }
              return self;
            }
            v20 = 0;
            v21 = 0;
            p_var1 = &retstr->var0.var1;
            var0 = retstr->var0.var0.var0.var1.var0.var0;
            while (1)
            {
              if (v21 < v19)
              {
                v20 = (unsigned int *)(*(_QWORD *)v57 + 4 * v21);
                v3 = (unsigned __int16 *)(*(_QWORD *)v57 + *(unsigned __int16 *)&v57[8] + 2 * v21);
              }
              v23 = *v3;
              v24 = *v20;
              if (var0)
              {
                v25 = (uint8x8_t)vcnt_s8((int8x8_t)var0);
                v25.i16[0] = vaddlv_u8(v25);
                if (v25.u32[0] > 1uLL)
                {
                  v15 = *v20;
                  if (var0 <= v24)
                    v15 = v24 % var0;
                }
                else
                {
                  v15 = ((_DWORD)var0 - 1) & v24;
                }
                v26 = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> **)retstr->var0.var0.var0.var0[v15];
                if (v26)
                {
                  v27 = *v26;
                  if (*v26)
                  {
                    if (v25.u32[0] < 2uLL)
                    {
                      while (1)
                      {
                        v29 = v27->var0.var0.var0.var1.var0.var0;
                        if (v29 == v24)
                        {
                          if (LODWORD(v27->var0.var1.var0.var0) == (_DWORD)v24)
                            goto LABEL_112;
                        }
                        else if ((v29 & (var0 - 1)) != v15)
                        {
                          goto LABEL_52;
                        }
                        v27 = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)v27->var0.var0.var0.var0;
                        if (!v27)
                          goto LABEL_52;
                      }
                    }
                    do
                    {
                      v28 = v27->var0.var0.var0.var1.var0.var0;
                      if (v28 == v24)
                      {
                        if (LODWORD(v27->var0.var1.var0.var0) == (_DWORD)v24)
                          goto LABEL_112;
                      }
                      else
                      {
                        if (v28 >= var0)
                          v28 %= var0;
                        if (v28 != v15)
                          break;
                      }
                      v27 = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)v27->var0.var0.var0.var0;
                    }
                    while (v27);
                  }
                }
              }
LABEL_52:
              self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)operator new(0x20uLL);
              v27 = self;
              self->var0.var0.var0.var0 = 0;
              self->var0.var0.var0.var1.var0.var0 = v24;
              LODWORD(self->var0.var1.var0.var0) = v24;
              self->var0.var2.var0 = 0;
              v30 = (float)(retstr->var0.var2.var0 + 1);
              v31 = retstr->var0.var3.var0;
              if (!var0 || (float)(v31 * (float)var0) < v30)
                break;
LABEL_102:
              v50 = retstr->var0.var0.var0.var0;
              v51 = (void **)retstr->var0.var0.var0.var0[v15];
              if (v51)
              {
                v27->var0.var0.var0.var0 = (void **)*v51;
              }
              else
              {
                v27->var0.var0.var0.var0 = (void **)p_var1->var0.var0;
                p_var1->var0.var0 = v27;
                v50[v15] = p_var1;
                if (!v27->var0.var0.var0.var0)
                  goto LABEL_111;
                v52 = *((_QWORD *)v27->var0.var0.var0.var0 + 1);
                if ((var0 & (var0 - 1)) != 0)
                {
                  if (v52 >= var0)
                    v52 %= var0;
                }
                else
                {
                  v52 &= var0 - 1;
                }
                v51 = &retstr->var0.var0.var0.var0[v52];
              }
              *v51 = v27;
LABEL_111:
              ++retstr->var0.var2.var0;
LABEL_112:
              v27->var0.var2.var0 = v23;
              v53 = v21 + 1;
              if (v21 + 1 < v19)
                ++v21;
              else
                v21 = v19;
              if (v53 >= v19)
                goto LABEL_126;
            }
            v32 = (var0 & (var0 - 1)) != 0;
            if (var0 < 3)
              v32 = 1;
            v33 = v32 | (2 * var0);
            v34 = vcvtps_u32_f32(v30 / v31);
            if (v33 <= v34)
              v35 = v34;
            else
              v35 = v33;
            if (v35 == 1)
            {
              v35 = 2;
            }
            else if ((v35 & (v35 - 1)) != 0)
            {
              self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)std::__next_prime(v35);
              v35 = (size_t)self;
              var0 = retstr->var0.var0.var0.var1.var0.var0;
            }
            if (v35 <= var0)
            {
              if (v35 >= var0)
                goto LABEL_89;
              self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)vcvtps_u32_f32((float)retstr->var0.var2.var0 / retstr->var0.var3.var0);
              if (var0 < 3
                || (v45 = (uint8x8_t)vcnt_s8((int8x8_t)var0), v45.i16[0] = vaddlv_u8(v45), v45.u32[0] > 1uLL))
              {
                self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)std::__next_prime((size_t)self);
              }
              else
              {
                v46 = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)(1 << -(char)__clz((unint64_t)&self[-1].var0.var3 + 7));
                if ((unint64_t)self >= 2)
                  self = v46;
              }
              if (v35 <= (unint64_t)self)
                v35 = (size_t)self;
              if (v35 >= var0)
              {
                var0 = retstr->var0.var0.var0.var1.var0.var0;
LABEL_89:
                if ((var0 & (var0 - 1)) != 0)
                {
                  if (var0 <= v24)
                    v15 = v24 % var0;
                  else
                    v15 = v24;
                }
                else
                {
                  v15 = ((_DWORD)var0 - 1) & v24;
                }
                goto LABEL_102;
              }
              if (!v35)
              {
                self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)retstr->var0.var0.var0.var0;
                retstr->var0.var0.var0.var0 = 0;
                if (self)
                  operator delete(self);
                var0 = 0;
                retstr->var0.var0.var0.var1.var0.var0 = 0;
                goto LABEL_89;
              }
            }
            if (v35 >> 61)
              std::__throw_bad_array_new_length[abi:nn180100]();
            v36 = (void **)operator new(8 * v35);
            self = (unordered_map<unsigned int, unsigned long long, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned long long>>> *)retstr->var0.var0.var0.var0;
            retstr->var0.var0.var0.var0 = v36;
            if (self)
              operator delete(self);
            v37 = 0;
            retstr->var0.var0.var0.var1.var0.var0 = v35;
            do
              retstr->var0.var0.var0.var0[v37++] = 0;
            while (v35 != v37);
            v38 = p_var1->var0.var0;
            if (!p_var1->var0.var0)
            {
LABEL_88:
              var0 = v35;
              goto LABEL_89;
            }
            v39 = v38[1];
            v40 = v35 - 1;
            if ((v35 & (v35 - 1)) == 0)
            {
              v41 = v39 & v40;
              retstr->var0.var0.var0.var0[v41] = p_var1;
              for (i = (_QWORD *)*v38; *v38; i = (_QWORD *)*v38)
              {
                v43 = i[1] & v40;
                if (v43 == v41)
                {
                  v38 = i;
                }
                else if (retstr->var0.var0.var0.var0[v43])
                {
                  *v38 = *i;
                  v44 = v43;
                  *i = *(_QWORD *)retstr->var0.var0.var0.var0[v44];
                  *(_QWORD *)retstr->var0.var0.var0.var0[v44] = i;
                }
                else
                {
                  retstr->var0.var0.var0.var0[v43] = v38;
                  v38 = i;
                  v41 = v43;
                }
              }
              goto LABEL_88;
            }
            if (v39 >= v35)
              v39 %= v35;
            retstr->var0.var0.var0.var0[v39] = p_var1;
            v47 = (_QWORD *)*v38;
            if (!*v38)
              goto LABEL_88;
            while (1)
            {
              v49 = v47[1];
              if (v49 >= v35)
                v49 %= v35;
              if (v49 != v39)
              {
                if (!retstr->var0.var0.var0.var0[v49])
                {
                  retstr->var0.var0.var0.var0[v49] = v38;
                  goto LABEL_93;
                }
                *v38 = *v47;
                v48 = v49;
                *v47 = *(_QWORD *)retstr->var0.var0.var0.var0[v48];
                *(_QWORD *)retstr->var0.var0.var0.var0[v48] = v47;
                v47 = v38;
              }
              v49 = v39;
LABEL_93:
              v38 = v47;
              v47 = (_QWORD *)*v47;
              v39 = v49;
              if (!v47)
                goto LABEL_88;
            }
          }
        }
      }
    }
  }
  return self;
}

- (float)currentZoomLevel
{
  void *v2;
  void *v3;
  double v4;
  float v5;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentZoomLevel");
  v5 = v4;

  return v5;
}

- (void)setApplicationState:(unsigned __int8)a3 displayedSearchResultsType:(unsigned __int8)a4
{
  unsigned int v4;
  unsigned int v5;
  int v7;
  int8x8_t *v8;
  int8x8_t v9;
  uint8x8_t v10;
  uint64_t v11;
  int8x8_t v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  md::NavigationLogic *v24;
  int v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  NSObject *v29;
  void *v30;
  unsigned int *v31;
  _BYTE v32[24];
  const __CFString *v33;
  uint64_t v34;

  v4 = a4;
  v5 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = *((unsigned __int8 *)self + 192);
  if (v7 == a3)
    goto LABEL_49;
  *((_BYTE *)self + 192) = a3;
  v8 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  if (!v8)
    goto LABEL_49;
  v9 = v8[2];
  if (!*(_QWORD *)&v9)
    goto LABEL_49;
  v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    v11 = 0x5CBBA028798243FLL;
    if (*(_QWORD *)&v9 <= 0x5CBBA028798243FuLL)
      v11 = 0x5CBBA028798243FuLL % *(_QWORD *)&v9;
  }
  else
  {
    v11 = (*(_QWORD *)&v9 - 1) & 0x5CBBA028798243FLL;
  }
  v12 = v8[1];
  v13 = *(_QWORD **)(*(_QWORD *)&v12 + 8 * v11);
  if (v13)
  {
    v14 = (_QWORD *)*v13;
    if (v14)
    {
      if (v10.u32[0] < 2uLL)
      {
        while (1)
        {
          v16 = v14[1];
          if (v16 == 0x5CBBA028798243FLL)
          {
            if (v14[2] == 0x5CBBA028798243FLL)
              goto LABEL_24;
          }
          else if ((v16 & (*(_QWORD *)&v9 - 1)) != v11)
          {
            goto LABEL_26;
          }
          v14 = (_QWORD *)*v14;
          if (!v14)
            goto LABEL_26;
        }
      }
      do
      {
        v15 = v14[1];
        if (v15 == 0x5CBBA028798243FLL)
        {
          if (v14[2] == 0x5CBBA028798243FLL)
          {
LABEL_24:
            v17 = v14[5];
            if (v17)
              *(_BYTE *)(v17 + 192) = a3;
            break;
          }
        }
        else
        {
          if (v15 >= *(_QWORD *)&v9)
            v15 %= *(_QWORD *)&v9;
          if (v15 != v11)
            break;
        }
        v14 = (_QWORD *)*v14;
      }
      while (v14);
    }
  }
LABEL_26:
  if (v10.u32[0] > 1uLL)
  {
    v18 = 0xBEC1A12372CEEC00;
    if (*(_QWORD *)&v9 <= 0xBEC1A12372CEEC00)
      v18 = 0xBEC1A12372CEEC00 % *(_QWORD *)&v9;
  }
  else
  {
    v18 = (*(_QWORD *)&v9 - 1) & 0xBEC1A12372CEEC00;
  }
  v19 = *(_QWORD **)(*(_QWORD *)&v12 + 8 * v18);
  if (v19)
  {
    v20 = (_QWORD *)*v19;
    if (v20)
    {
      if (v10.u32[0] < 2uLL)
      {
        v21 = *(_QWORD *)&v9 - 1;
        while (1)
        {
          v23 = v20[1];
          if (v23 == 0xBEC1A12372CEEC00)
          {
            if (v20[2] == 0xBEC1A12372CEEC00)
              goto LABEL_46;
          }
          else if ((v23 & v21) != v18)
          {
            goto LABEL_49;
          }
          v20 = (_QWORD *)*v20;
          if (!v20)
            goto LABEL_49;
        }
      }
      do
      {
        v22 = v20[1];
        if (v22 == 0xBEC1A12372CEEC00)
        {
          if (v20[2] == 0xBEC1A12372CEEC00)
          {
LABEL_46:
            v24 = (md::NavigationLogic *)v20[5];
            if (v24)
            {
              v25 = *((unsigned __int8 *)self + 192);
              if (*((unsigned __int8 *)v24 + 225) != v25)
              {
                *((_BYTE *)v24 + 225) = v25;
                md::NavigationLogic::_updatePolygonSelection(v24);
              }
            }
            break;
          }
        }
        else
        {
          if (v22 >= *(_QWORD *)&v9)
            v22 %= *(_QWORD *)&v9;
          if (v22 != v18)
            break;
        }
        v20 = (_QWORD *)*v20;
      }
      while (v20);
    }
  }
LABEL_49:
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v26 = (void *)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    if (v5 > 9)
    {
      v27 = &stru_1E4315B30;
      if (v4 > 4)
        goto LABEL_54;
    }
    else
    {
      v27 = off_1E42EB458[v5];
      if (v4 > 4)
      {
LABEL_54:
        v28 = &stru_1E4315B30;
LABEL_57:
        *(_DWORD *)v32 = 134218498;
        *(_QWORD *)&v32[4] = self;
        *(_WORD *)&v32[12] = 2112;
        *(_QWORD *)&v32[14] = v27;
        *(_WORD *)&v32[22] = 2112;
        v33 = v28;
        v29 = v26;
        _os_log_impl(&dword_19F029000, v29, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set application state: %@, displayed search results type: %@", v32, 0x20u);

        goto LABEL_58;
      }
    }
    v28 = off_1E42EB4A8[v4];
    goto LABEL_57;
  }
LABEL_58:
  if (*((unsigned __int8 *)self + 208) == v4)
  {
    if (v7 == v5)
      return;
  }
  else
  {
    *((_BYTE *)self + 208) = v4;
  }
  -[VKMapView _updateMapDisplayStyle](self, "_updateMapDisplayStyle", *(_OWORD *)v32, *(_QWORD *)&v32[16], v33);
  -[VKMapView _updateCameraThermalOptions](self, "_updateCameraThermalOptions");
  if (*((_BYTE *)self + 598))
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (unsigned int *)objc_msgSend(v30, "displayStyleOverride");

    if (v31)
      -[VKMapView enableMapDisplayStyleDebugOverride:](self, "enableMapDisplayStyleDebugOverride:", *v31 | ((unint64_t)*((unsigned __int16 *)v31 + 2) << 32));
  }
}

- (void)setApplicationState:(unsigned __int8)a3
{
  -[VKMapView setApplicationState:displayedSearchResultsType:](self, "setApplicationState:displayedSearchResultsType:", a3, *((unsigned __int8 *)self + 208));
}

- (void)setApplicationSubState:(unsigned __int8)a3
{
  int v3;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  int v8;
  VKMapView *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = (void *)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = &stru_1E4315B30;
    if (v3 == 1)
      v6 = CFSTR("Route Creation");
    if (!v3)
      v6 = CFSTR("Default");
    v8 = 134218242;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    v7 = v5;
    _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set application substate: %@", (uint8_t *)&v8, 0x16u);

  }
  if (*((unsigned __int8 *)self + 193) != v3)
  {
    *((_BYTE *)self + 193) = v3;
    -[VKMapView _updateMapDisplayStyle](self, "_updateMapDisplayStyle");
  }
}

- (void)setDisplayedSearchResultsType:(unsigned __int8)a3
{
  -[VKMapView setApplicationState:displayedSearchResultsType:](self, "setApplicationState:displayedSearchResultsType:", *((unsigned __int8 *)self + 192), a3);
}

- (VKMapViewCameraDelegate)cameraDelegate
{
  id v2;
  void *v3;

  v2 = *(id *)(*((_QWORD *)self + 48) + 1104);
  objc_msgSend(v2, "cameraDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VKMapViewCameraDelegate *)v3;
}

- (BOOL)isLabelMarkerSelectionEnabled
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(-[VKMapView _labelSettings](self, "_labelSettings") + 16) + 40) + 28);
}

- (BOOL)isOfflineRegionSelector
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;

  v2 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
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
  return *(_BYTE *)(v4[5] + 177) == 1;
}

- (void)setOfflineRegionSelector:(BOOL)a3
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  NSObject *v10;
  int8x8_t *v11;
  int8x8_t v12;
  uint8x8_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  VKMapView *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = 0x2FED70A4459DFCA1;
  v6 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
  v7 = *(_QWORD *)(v6 + 16);
  if ((v7 & (v7 - 1)) != 0)
  {
    v9 = 0x2FED70A4459DFCA1;
    if (v7 <= 0x2FED70A4459DFCA1)
      v9 = 0x2FED70A4459DFCA1 % v7;
    v8 = *(_QWORD **)(*(_QWORD *)(v6 + 8) + 8 * v9);
    do
    {
      do
        v8 = (_QWORD *)*v8;
      while (v8[1] != 0x2FED70A4459DFCA1);
    }
    while (v8[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    v8 = *(_QWORD **)(*(_QWORD *)(v6 + 8) + 8 * ((v7 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        v8 = (_QWORD *)*v8;
      while (v8[1] != 0x2FED70A4459DFCA1);
    }
    while (v8[2] != 0x2FED70A4459DFCA1);
  }
  if (*(_BYTE *)(v8[5] + 177) == a3)
    return;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v10 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v24 = 134218242;
    v25 = self;
    v26 = 2080;
    v27 = gss::to_string(v3);
    _os_log_impl(&dword_19F029000, v10, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set set offline region selector:%s", (uint8_t *)&v24, 0x16u);
  }

  v11 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v12 = v11[2];
  if (!*(_QWORD *)&v12)
    goto LABEL_36;
  v13 = (uint8x8_t)vcnt_s8(v12);
  v13.i16[0] = vaddlv_u8(v13);
  if (v13.u32[0] > 1uLL)
  {
    if (*(_QWORD *)&v12 <= 0x2FED70A4459DFCA1uLL)
      v5 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v12;
  }
  else
  {
    v5 = (*(_QWORD *)&v12 - 1) & 0x2FED70A4459DFCA1;
  }
  v14 = *(_QWORD **)(*(_QWORD *)&v11[1] + 8 * v5);
  if (!v14 || (v15 = (_QWORD *)*v14) == 0)
  {
LABEL_36:
    v19 = 0;
    goto LABEL_37;
  }
  if (v13.u32[0] < 2uLL)
  {
    v16 = *(_QWORD *)&v12 - 1;
    while (1)
    {
      v18 = v15[1];
      if (v18 == 0x2FED70A4459DFCA1)
      {
        if (v15[2] == 0x2FED70A4459DFCA1)
          goto LABEL_49;
      }
      else if ((v18 & v16) != v5)
      {
        goto LABEL_36;
      }
      v15 = (_QWORD *)*v15;
      if (!v15)
        goto LABEL_36;
    }
  }
  while (1)
  {
    v17 = v15[1];
    if (v17 == 0x2FED70A4459DFCA1)
      break;
    if (v17 >= *(_QWORD *)&v12)
      v17 %= *(_QWORD *)&v12;
    if (v17 != v5)
      goto LABEL_36;
LABEL_26:
    v15 = (_QWORD *)*v15;
    if (!v15)
      goto LABEL_36;
  }
  if (v15[2] != 0x2FED70A4459DFCA1)
    goto LABEL_26;
LABEL_49:
  v19 = v15[5];
LABEL_37:
  if (*(unsigned __int8 *)(v19 + 177) != v3)
  {
    *(_BYTE *)(v19 + 177) = v3;
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(*(_QWORD *)(v19 + 208), 0x10080u, v3);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute(*(_QWORD *)(v19 + 224), 0x10080u, *(unsigned __int8 *)(v19 + 177));
    LOBYTE(v24) = 4;
    v20 = *(char **)(v19 + 1128);
    v21 = *(char **)(v19 + 1136);
    if (v20 != v21)
    {
      while (*v20 <= 3u)
      {
        if (++v20 == v21)
          goto LABEL_44;
      }
    }
    if (v20 == v21 || (v21 = v20, *v20 != 4))
LABEL_44:
      std::vector<md::StyleManagerEvent>::insert(v19 + 1128, v21, (char *)&v24);
    v22 = **(_QWORD **)(v19 + 1240);
    if (v22)
    {
      LOBYTE(v24) = 12;
      md::MapEngine::setNeedsTick(v22, &v24);
    }
  }
  v23 = *((_QWORD *)self + 48);
  LOBYTE(v24) = 1;
  md::MapEngine::setNeedsTick(v23, &v24);
}

- (BOOL)isOfflineMode
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;

  v2 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
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
  return *(_BYTE *)(v4[5] + 178) == 1;
}

- (void)setOfflineMode:(BOOL)a3
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  NSObject *v10;
  int8x8_t *v11;
  int8x8_t v12;
  uint8x8_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  VKMapView *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = 0x2FED70A4459DFCA1;
  v6 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
  v7 = *(_QWORD *)(v6 + 16);
  if ((v7 & (v7 - 1)) != 0)
  {
    v9 = 0x2FED70A4459DFCA1;
    if (v7 <= 0x2FED70A4459DFCA1)
      v9 = 0x2FED70A4459DFCA1 % v7;
    v8 = *(_QWORD **)(*(_QWORD *)(v6 + 8) + 8 * v9);
    do
    {
      do
        v8 = (_QWORD *)*v8;
      while (v8[1] != 0x2FED70A4459DFCA1);
    }
    while (v8[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    v8 = *(_QWORD **)(*(_QWORD *)(v6 + 8) + 8 * ((v7 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        v8 = (_QWORD *)*v8;
      while (v8[1] != 0x2FED70A4459DFCA1);
    }
    while (v8[2] != 0x2FED70A4459DFCA1);
  }
  if (*(_BYTE *)(v8[5] + 178) == a3)
    return;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v10 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v24 = 134218242;
    v25 = self;
    v26 = 2080;
    v27 = gss::to_string(v3);
    _os_log_impl(&dword_19F029000, v10, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set set offline mode:%s", (uint8_t *)&v24, 0x16u);
  }

  v11 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v12 = v11[2];
  if (!*(_QWORD *)&v12)
    goto LABEL_36;
  v13 = (uint8x8_t)vcnt_s8(v12);
  v13.i16[0] = vaddlv_u8(v13);
  if (v13.u32[0] > 1uLL)
  {
    if (*(_QWORD *)&v12 <= 0x2FED70A4459DFCA1uLL)
      v5 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v12;
  }
  else
  {
    v5 = (*(_QWORD *)&v12 - 1) & 0x2FED70A4459DFCA1;
  }
  v14 = *(_QWORD **)(*(_QWORD *)&v11[1] + 8 * v5);
  if (!v14 || (v15 = (_QWORD *)*v14) == 0)
  {
LABEL_36:
    v19 = 0;
    goto LABEL_37;
  }
  if (v13.u32[0] < 2uLL)
  {
    v16 = *(_QWORD *)&v12 - 1;
    while (1)
    {
      v18 = v15[1];
      if (v18 == 0x2FED70A4459DFCA1)
      {
        if (v15[2] == 0x2FED70A4459DFCA1)
          goto LABEL_49;
      }
      else if ((v18 & v16) != v5)
      {
        goto LABEL_36;
      }
      v15 = (_QWORD *)*v15;
      if (!v15)
        goto LABEL_36;
    }
  }
  while (1)
  {
    v17 = v15[1];
    if (v17 == 0x2FED70A4459DFCA1)
      break;
    if (v17 >= *(_QWORD *)&v12)
      v17 %= *(_QWORD *)&v12;
    if (v17 != v5)
      goto LABEL_36;
LABEL_26:
    v15 = (_QWORD *)*v15;
    if (!v15)
      goto LABEL_36;
  }
  if (v15[2] != 0x2FED70A4459DFCA1)
    goto LABEL_26;
LABEL_49:
  v19 = v15[5];
LABEL_37:
  if (*(unsigned __int8 *)(v19 + 178) != v3)
  {
    *(_BYTE *)(v19 + 178) = v3;
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(*(_QWORD *)(v19 + 208), 0x10083u, v3);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute(*(_QWORD *)(v19 + 224), 0x10083u, *(unsigned __int8 *)(v19 + 178));
    LOBYTE(v24) = 4;
    v20 = *(char **)(v19 + 1128);
    v21 = *(char **)(v19 + 1136);
    if (v20 != v21)
    {
      while (*v20 <= 3u)
      {
        if (++v20 == v21)
          goto LABEL_44;
      }
    }
    if (v20 == v21 || (v21 = v20, *v20 != 4))
LABEL_44:
      std::vector<md::StyleManagerEvent>::insert(v19 + 1128, v21, (char *)&v24);
    v22 = **(_QWORD **)(v19 + 1240);
    if (v22)
    {
      LOBYTE(v24) = 12;
      md::MapEngine::setNeedsTick(v22, &v24);
    }
  }
  v23 = *((_QWORD *)self + 48);
  LOBYTE(v24) = 1;
  md::MapEngine::setNeedsTick(v23, &v24);
}

- (void)setLabelMarkerSelectionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  md::LabelManager *v8;
  _QWORD *v9;
  uint64_t v10;
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v11 = 134218242;
    *(_QWORD *)&v11[4] = self;
    *(_WORD *)&v11[12] = 2080;
    *(_QWORD *)&v11[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set label marker selection enabled: %s", v11, 0x16u);
  }
  v7 = *(_QWORD *)(-[VKMapView _labelSettings](self, "_labelSettings") + 16);
  *(_BYTE *)(*(_QWORD *)(v7 + 40) + 28) = v3;
  v8 = *(md::LabelManager **)(v7 + 24);
  *(_QWORD *)v11 = &off_1E42CA490;
  *(_QWORD *)&v11[8] = v8;
  *(_QWORD *)&v11[16] = v3;
  v12 = v11;
  md::LabelManager::queueCommand(v8, 16, 1, v11);
  v9 = v12;
  if (v12 == v11)
  {
    v10 = 4;
    v9 = v11;
  }
  else
  {
    if (!v12)
      return;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
}

- (void)closeLoaderConnection
{
  -[VKMapView _closeLoaderConnection:](self, "_closeLoaderConnection:", 0);
}

- (void)_closeLoaderConnection:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  if (*((_BYTE *)self + 128))
  {
    v3 = a3;
    *((_BYTE *)self + 128) = 0;
    objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "closeForClient:", *((_QWORD *)self + 17));

    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "closeServerConnection:", v3);

  }
}

- (id)secondaryCanvas
{
  void *v3;
  void *v4;
  id v5;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*((_QWORD *)self + 5);
  if (v3 == v4)
    v4 = (void *)*((_QWORD *)self + 6);
  v5 = v4;

  return v5;
}

- (void)_forceLayoutForSuspensionSnapShot
{
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CAProcessCanAccessGPU"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v4 = -[VKMapView rendersInBackground](self, "rendersInBackground");
    -[VKMapView setRendersInBackground:](self, "setRendersInBackground:", 1);
    v5 = *((_QWORD *)self + 48);
    objc_msgSend(*(id *)(v5 + 840), "setRenderSource:", 0);
    objc_msgSend(*(id *)(v5 + 840), "destroyRenderTarget");
    -[VKMapView _createDisplayLayer](self, "_createDisplayLayer");
    -[VKMapView forceLayout](self, "forceLayout");
    -[VKMapView setRendersInBackground:](self, "setRendersInBackground:", v4);
  }

}

- (void)forceLayout
{
  void *v3;
  uint64_t v4;
  md::HomeQueueScheduler **v5;
  double v6;
  char v7;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCameraForFrameResize");

  v4 = *((_QWORD *)self + 48);
  v7 = 1;
  md::MapEngine::setNeedsTick(v4, &v7);
  v5 = (md::HomeQueueScheduler **)*((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(v5[567], "-[VKMapView forceLayout]");
  v6 = CACurrentMediaTime();
  if (md::MapEngine::renderSceneSync((md::MapEngine *)v5, v6))
    -[VKMapView didPresent](self, "didPresent");
}

- (void)forceCameraUpdateForFrameResize
{
  id v2;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCameraForFrameResize");

}

- (NSArray)visibleTileSets
{
  void *v2;
  void *v3;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleTileSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)attributionsForCurrentRegion
{
  void *v2;
  void *v3;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributionsForCurrentRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)stylesheetIsDevResource
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  BOOL v16;
  unint64_t *v17;
  unint64_t v18;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    goto LABEL_21;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v3 <= 0x2FED70A4459DFCA1uLL)
      v5 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0x2FED70A4459DFCA1;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6 || (v7 = (_QWORD *)*v6) == 0)
  {
LABEL_21:
    v11 = 0;
    v12 = MEMORY[0x100];
    if (!MEMORY[0x100])
      goto LABEL_22;
    goto LABEL_23;
  }
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0x2FED70A4459DFCA1)
      {
        if (v7[2] == 0x2FED70A4459DFCA1)
          goto LABEL_35;
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_21;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        goto LABEL_21;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0x2FED70A4459DFCA1)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      goto LABEL_21;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      goto LABEL_21;
  }
  if (v7[2] != 0x2FED70A4459DFCA1)
    goto LABEL_11;
LABEL_35:
  v11 = v7[5];
  v12 = *(_QWORD *)(v11 + 256);
  if (!v12)
  {
LABEL_22:
    md::StyleLogic::updateConfiguration((md::StyleLogic *)v11, *(_DWORD *)(v11 + 1096));
    v12 = *(_QWORD *)(v11 + 256);
  }
LABEL_23:
  v13 = *(std::__shared_weak_count **)(v11 + 264);
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  if (v12)
  {
    v16 = *(_BYTE *)(*(_QWORD *)(v12 + 16) + 80) != 0;
    if (!v13)
      return v16;
LABEL_30:
    v17 = (unint64_t *)&v13->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *, SEL))v13->__on_zero_shared)(v13, a2);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  else
  {
    v16 = 0;
    if (v13)
      goto LABEL_30;
  }
  return v16;
}

- (void)reloadStylesheet
{
  uint64_t v2;
  unint64_t v3;
  uint64_t **v4;
  unint64_t v5;

  v2 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
  v3 = *(_QWORD *)(v2 + 16);
  if ((v3 & (v3 - 1)) != 0)
  {
    v5 = 0x2FED70A4459DFCA1;
    if (v3 <= 0x2FED70A4459DFCA1)
      v5 = 0x2FED70A4459DFCA1 % v3;
    v4 = *(uint64_t ***)(*(_QWORD *)(v2 + 8) + 8 * v5);
    do
    {
      do
        v4 = (uint64_t **)*v4;
      while (v4[1] != (uint64_t *)0x2FED70A4459DFCA1);
    }
    while (v4[2] != (uint64_t *)0x2FED70A4459DFCA1);
  }
  else
  {
    v4 = *(uint64_t ***)(*(_QWORD *)(v2 + 8) + 8 * ((v3 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        v4 = (uint64_t **)*v4;
      while (v4[1] != (uint64_t *)0x2FED70A4459DFCA1);
    }
    while (v4[2] != (uint64_t *)0x2FED70A4459DFCA1);
  }
  (*(void (**)(uint64_t *))(*v4[5] + 16))(v4[5]);
}

- (float)styleZOffsetScale
{
  int8x8_t *v2;
  int8x8_t v3;
  float result;
  uint8x8_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  result = 1.0;
  if (v3)
  {
    v5 = (uint8x8_t)vcnt_s8(v3);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      v6 = 0x2FED70A4459DFCA1;
      if (*(_QWORD *)&v3 <= 0x2FED70A4459DFCA1uLL)
        v6 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v3;
    }
    else
    {
      v6 = (*(_QWORD *)&v3 - 1) & 0x2FED70A4459DFCA1;
    }
    v7 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v6);
    if (v7)
    {
      v8 = (_QWORD *)*v7;
      if (v8)
      {
        if (v5.u32[0] < 2uLL)
        {
          v9 = *(_QWORD *)&v3 - 1;
          while (1)
          {
            v11 = v8[1];
            if (v11 == 0x2FED70A4459DFCA1)
            {
              if (v8[2] == 0x2FED70A4459DFCA1)
                goto LABEL_22;
            }
            else if ((v11 & v9) != v6)
            {
              return result;
            }
            v8 = (_QWORD *)*v8;
            if (!v8)
              return result;
          }
        }
        do
        {
          v10 = v8[1];
          if (v10 == 0x2FED70A4459DFCA1)
          {
            if (v8[2] == 0x2FED70A4459DFCA1)
            {
LABEL_22:
              v12 = v8[5];
              if (v12)
                return *(float *)(v12 + 124);
              return result;
            }
          }
          else
          {
            if (v10 >= *(_QWORD *)&v3)
              v10 %= *(_QWORD *)&v3;
            if (v10 != v6)
              return result;
          }
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
    }
  }
  return result;
}

- (void)setStyleZOffsetScale:(float)a3
{
  int8x8_t *v3;
  int8x8_t v4;
  uint8x8_t v5;
  uint64_t v6;
  int8x8_t v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v4 = v3[2];
  if (!*(_QWORD *)&v4)
    return;
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
  v7 = v3[1];
  v8 = *(_QWORD **)(*(_QWORD *)&v7 + 8 * v6);
  if (!v8)
    goto LABEL_24;
  v9 = (_QWORD *)*v8;
  if (!v9)
    goto LABEL_24;
  if (v5.u32[0] < 2uLL)
  {
    while (1)
    {
      v11 = v9[1];
      if (v11 == 0x2FED70A4459DFCA1)
      {
        if (v9[2] == 0x2FED70A4459DFCA1)
          goto LABEL_22;
      }
      else if ((v11 & (*(_QWORD *)&v4 - 1)) != v6)
      {
        goto LABEL_24;
      }
      v9 = (_QWORD *)*v9;
      if (!v9)
        goto LABEL_24;
    }
  }
  while (1)
  {
    v10 = v9[1];
    if (v10 == 0x2FED70A4459DFCA1)
      break;
    if (v10 >= *(_QWORD *)&v4)
      v10 %= *(_QWORD *)&v4;
    if (v10 != v6)
      goto LABEL_24;
LABEL_11:
    v9 = (_QWORD *)*v9;
    if (!v9)
      goto LABEL_24;
  }
  if (v9[2] != 0x2FED70A4459DFCA1)
    goto LABEL_11;
LABEL_22:
  v12 = v9[5];
  if (v12)
    *(float *)(v12 + 124) = a3;
LABEL_24:
  if (v5.u32[0] > 1uLL)
  {
    v13 = 0x8E629317B3523E63;
    if (*(_QWORD *)&v4 <= 0x8E629317B3523E63)
      v13 = 0x8E629317B3523E63 % *(_QWORD *)&v4;
  }
  else
  {
    v13 = (*(_QWORD *)&v4 - 1) & 0x8E629317B3523E63;
  }
  v14 = *(_QWORD **)(*(_QWORD *)&v7 + 8 * v13);
  if (v14)
  {
    v15 = (_QWORD *)*v14;
    if (v15)
    {
      if (v5.u32[0] < 2uLL)
      {
        v16 = *(_QWORD *)&v4 - 1;
        while (1)
        {
          v18 = v15[1];
          if (v18 == 0x8E629317B3523E63)
          {
            if (v15[2] == 0x8E629317B3523E63)
              goto LABEL_44;
          }
          else if ((v18 & v16) != v13)
          {
            return;
          }
          v15 = (_QWORD *)*v15;
          if (!v15)
            return;
        }
      }
      do
      {
        v17 = v15[1];
        if (v17 == 0x8E629317B3523E63)
        {
          if (v15[2] == 0x8E629317B3523E63)
          {
LABEL_44:
            v19 = v15[5];
            if (v19)
              *(float *)(v19 + 120) = a3;
            return;
          }
        }
        else
        {
          if (v17 >= *(_QWORD *)&v4)
            v17 %= *(_QWORD *)&v4;
          if (v17 != v13)
            return;
        }
        v15 = (_QWORD *)*v15;
      }
      while (v15);
    }
  }
}

- (int64_t)targetDisplay
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;

  v2 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
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
  return *(unsigned __int8 *)(v4[5] + 161);
}

- (int64_t)carDisplayConfig
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;

  v2 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
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
  return *(unsigned __int8 *)(v4[5] + 162);
}

- (void)setCarDisplayConfig:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  NSObject *v11;
  int8x8_t *v12;
  int8x8_t v13;
  uint8x8_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  int v30;
  VKMapView *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = 0x2FED70A4459DFCA1;
  v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
  v8 = *(_QWORD *)(v7 + 16);
  if ((v8 & (v8 - 1)) != 0)
  {
    v10 = 0x2FED70A4459DFCA1;
    if (v8 <= 0x2FED70A4459DFCA1)
      v10 = 0x2FED70A4459DFCA1 % v8;
    v9 = *(_QWORD **)(*(_QWORD *)(v7 + 8) + 8 * v10);
    do
    {
      do
        v9 = (_QWORD *)*v9;
      while (v9[1] != 0x2FED70A4459DFCA1);
    }
    while (v9[2] != 0x2FED70A4459DFCA1);
  }
  else
  {
    v9 = *(_QWORD **)(*(_QWORD *)(v7 + 8) + 8 * ((v8 - 1) & 0x2FED70A4459DFCA1));
    do
    {
      do
        v9 = (_QWORD *)*v9;
      while (v9[1] != 0x2FED70A4459DFCA1);
    }
    while (v9[2] != 0x2FED70A4459DFCA1);
  }
  if (*(unsigned __int8 *)(v9[5] + 162) == a3)
    return;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v11 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v30 = 134218242;
    v31 = self;
    v32 = 2080;
    v33 = gss::to_string(a3);
    _os_log_impl(&dword_19F029000, v11, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set car display config:%s", (uint8_t *)&v30, 0x16u);
  }

  v12 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v13 = v12[2];
  if (!*(_QWORD *)&v13)
    goto LABEL_36;
  v14 = (uint8x8_t)vcnt_s8(v13);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    if (*(_QWORD *)&v13 <= 0x2FED70A4459DFCA1uLL)
      v6 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v13;
  }
  else
  {
    v6 = (*(_QWORD *)&v13 - 1) & 0x2FED70A4459DFCA1;
  }
  v15 = *(_QWORD **)(*(_QWORD *)&v12[1] + 8 * v6);
  if (!v15 || (v16 = (_QWORD *)*v15) == 0)
  {
LABEL_36:
    v20 = 0;
    goto LABEL_37;
  }
  if (v14.u32[0] < 2uLL)
  {
    v17 = *(_QWORD *)&v13 - 1;
    while (1)
    {
      v19 = v16[1];
      if (v19 == 0x2FED70A4459DFCA1)
      {
        if (v16[2] == 0x2FED70A4459DFCA1)
          goto LABEL_57;
      }
      else if ((v19 & v17) != v6)
      {
        goto LABEL_36;
      }
      v16 = (_QWORD *)*v16;
      if (!v16)
        goto LABEL_36;
    }
  }
  while (1)
  {
    v18 = v16[1];
    if (v18 == 0x2FED70A4459DFCA1)
      break;
    if (v18 >= *(_QWORD *)&v13)
      v18 %= *(_QWORD *)&v13;
    if (v18 != v6)
      goto LABEL_36;
LABEL_26:
    v16 = (_QWORD *)*v16;
    if (!v16)
      goto LABEL_36;
  }
  if (v16[2] != 0x2FED70A4459DFCA1)
    goto LABEL_26;
LABEL_57:
  v20 = v16[5];
LABEL_37:
  if (*(unsigned __int8 *)(v20 + 162) != a3)
  {
    *(_BYTE *)(v20 + 162) = a3;
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(*(_QWORD *)(v20 + 208), 0x10078u, a3);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute(*(_QWORD *)(v20 + 224), 0x10078u, *(unsigned __int8 *)(v20 + 162));
    LOBYTE(v30) = 4;
    v21 = *(char **)(v20 + 1128);
    v22 = *(char **)(v20 + 1136);
    if (v21 != v22)
    {
      while (*v21 <= 3u)
      {
        if (++v21 == v22)
          goto LABEL_44;
      }
    }
    if (v21 == v22 || (v22 = v21, *v21 != 4))
LABEL_44:
      std::vector<md::StyleManagerEvent>::insert(v20 + 1128, v22, (char *)&v30);
    v23 = **(_QWORD **)(v20 + 1240);
    if (v23)
    {
      LOBYTE(v30) = 12;
      md::MapEngine::setNeedsTick(v23, &v30);
    }
  }
  v24 = *((_QWORD *)self + 48);
  LOBYTE(v30) = 1;
  md::MapEngine::setNeedsTick(v24, &v30);
  if (a3 == 2)
  {
    v25 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
    v27 = *v25;
    v26 = v25[1];
    if (v27 != v26)
    {
      v28 = v27 + 16;
      do
      {
        v29 = *(_BYTE *)(v28 - 16) == 31 || v28 == v26;
        v28 += 16;
      }
      while (!v29);
    }
  }
  -[VKMapView setNavCameraMode:](self, "setNavCameraMode:", 0);
}

- (void)setNavCameraMode:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  int v6;
  VKMapView *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)self + 75) != a3)
  {
    v3 = a3;
    *((_QWORD *)self + 75) = a3;
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v5 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v6 = 134218240;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set nav camera mode to:%d", (uint8_t *)&v6, 0x12u);
    }
    -[VKMapView _updateCameraThermalOptions](self, "_updateCameraThermalOptions");
  }
}

- (int64_t)carDisplayType
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;

  v2 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
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
  return *(unsigned __int8 *)(v4[5] + 163);
}

- ($E5C720D6BB068A42F0C2CD001350366C)vehicleState
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;

  v2 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
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
  return ($E5C720D6BB068A42F0C2CD001350366C)(*(_BYTE *)(v4[5] + 160) & 1);
}

- (void)setVehicleState:(id)a3
{
  NSObject *v5;
  const char *v6;
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
  int var0;
  char *v18;
  char *v19;
  uint64_t v20;
  int v21;
  VKMapView *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "YES";
    if (!a3.var0)
      v6 = "NO";
    v21 = 134218242;
    v22 = self;
    v23 = 2080;
    v24 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set vehicle state parked: %s", (uint8_t *)&v21, 0x16u);
  }
  v7 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v8 = v7[2];
  if (!*(_QWORD *)&v8)
    goto LABEL_27;
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
LABEL_27:
    v16 = 0;
    goto LABEL_28;
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
          goto LABEL_39;
      }
      else if ((v15 & v13) != v10)
      {
        goto LABEL_27;
      }
      v12 = (_QWORD *)*v12;
      if (!v12)
        goto LABEL_27;
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
      goto LABEL_27;
LABEL_17:
    v12 = (_QWORD *)*v12;
    if (!v12)
      goto LABEL_27;
  }
  if (v12[2] != 0x2FED70A4459DFCA1)
    goto LABEL_17;
LABEL_39:
  v16 = v12[5];
LABEL_28:
  var0 = a3.var0;
  if (*(unsigned __int8 *)(v16 + 160) != var0)
  {
    *(_BYTE *)(v16 + 160) = var0;
    gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(*(_QWORD *)(v16 + 208), 0x10019u, var0);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute(*(_QWORD *)(v16 + 224), 0x10019u, var0);
    LOBYTE(v21) = 4;
    v18 = *(char **)(v16 + 1128);
    v19 = *(char **)(v16 + 1136);
    if (v18 != v19)
    {
      while (*v18 <= 3u)
      {
        if (++v18 == v19)
          goto LABEL_35;
      }
    }
    if (v18 == v19 || (v19 = v18, *v18 != 4))
LABEL_35:
      std::vector<md::StyleManagerEvent>::insert(v16 + 1128, v19, (char *)&v21);
    v20 = **(_QWORD **)(v16 + 1240);
    if (v20)
    {
      LOBYTE(v21) = 12;
      md::MapEngine::setNeedsTick(v20, &v21);
    }
  }
}

- (int64_t)applicationUILayout
{
  return *((_QWORD *)self + 25);
}

- (void)setApplicationUILayout:(int64_t)a3
{
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
  void *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  VKMapView *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)self + 25) == a3)
    return;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v21 = 134218242;
    v22 = self;
    v23 = 2080;
    v24 = gss::to_string(a3);
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set applicationUILayout: %s", (uint8_t *)&v21, 0x16u);
  }

  *((_QWORD *)self + 25) = a3;
  v6 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
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
          goto LABEL_43;
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
LABEL_43:
  v15 = v11[5];
LABEL_27:
  if (*(unsigned __int8 *)(v15 + 166) != a3)
  {
    v16 = *(void **)(v15 + 1184);
    if (v16)
      objc_msgSend(v16, "stop");
    *(_BYTE *)(v15 + 166) = a3;
    gss::ClientStyleState<gss::PropertyID>::setTargetClientStyleAttribute(*(_QWORD *)(v15 + 208), 0x1003Du, a3);
    gss::ClientStyleState<gss::ScenePropertyID>::setTargetClientStyleAttribute(*(_QWORD *)(v15 + 224), 0x1003Du, a3);
    if (*(_BYTE *)(v15 + 1116))
    {
      *(float *)(v15 + 1120) = fmaxf(*(float *)(v15 + 1120), 0.25);
    }
    else
    {
      *(_BYTE *)(v15 + 1116) = 1;
      *(_DWORD *)(v15 + 1120) = 1048576000;
      LOBYTE(v21) = 4;
      v17 = *(char **)(v15 + 1128);
      v18 = *(char **)(v15 + 1136);
      if (v17 != v18)
      {
        while (*v17 <= 3u)
        {
          if (++v17 == v18)
            goto LABEL_38;
        }
      }
      if (v17 == v18 || (v18 = v17, *v17 != 4))
LABEL_38:
        std::vector<md::StyleManagerEvent>::insert(v15 + 1128, v18, (char *)&v21);
      v19 = **(_QWORD **)(v15 + 1240);
      if (v19)
      {
        LOBYTE(v21) = 12;
        md::MapEngine::setNeedsTick(v19, &v21);
      }
    }
  }
  v20 = *((_QWORD *)self + 48);
  LOBYTE(v21) = 1;
  md::MapEngine::setNeedsTick(v20, &v21);
}

- (BOOL)trafficEnabled
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
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

- (BOOL)hasTraffic
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 4)
    {
      v3 += 16;
      if (v3 == v4)
        return -[VKMapView trafficEnabled](self, "trafficEnabled");
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) || -[VKMapView trafficEnabled](self, "trafficEnabled");
}

- (BOOL)trafficIncidentsEnabled
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 3)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (void)setTrafficIncidentsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  md::LabelManager *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  md::LabelManager *v21;
  _QWORD *v22;
  uint64_t v23;
  _BYTE v24[24];
  _BYTE *v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v24 = 134218242;
    *(_QWORD *)&v24[4] = self;
    *(_WORD *)&v24[12] = 2080;
    *(_QWORD *)&v24[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set traffic incidents enabled: %s", v24, 0x16u);
  }
  v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v24[0] = 3;
  md::MapEngineSettings::set(v7, v24, (_QWORD *)v3);
  v8 = -[VKMapView _labelSettings](self, "_labelSettings");
  if (!v3)
    goto LABEL_14;
  v9 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v10 = *v9;
  v11 = v9[1];
  if (v10 != v11)
  {
    while (*(_BYTE *)v10 != 2)
    {
      v10 += 16;
      if (v10 == v11)
        goto LABEL_14;
    }
  }
  if (v10 == v11)
LABEL_14:
    v12 = 0;
  else
    v12 = *(_QWORD *)(v10 + 8) != 0;
  *(_BYTE *)(v8[5] + 25) = v12;
  v13 = (md::LabelManager *)v8[3];
  *((_BYTE *)v13 + 3568) = v12;
  *(_QWORD *)v24 = &off_1E42C9998;
  *(_QWORD *)&v24[8] = v13;
  *(_QWORD *)&v24[16] = v12;
  v25 = v24;
  md::LabelManager::queueCommand(v13, 14, 1, v24);
  v14 = v25;
  if (v25 == v24)
  {
    v15 = 4;
    v14 = v24;
    goto LABEL_19;
  }
  if (v25)
  {
    v15 = 5;
LABEL_19:
    (*(void (**)(void))(*v14 + 8 * v15))();
  }
  v16 = -[VKMapView _labelSettings](self, "_labelSettings");
  if (!v3)
    goto LABEL_27;
  v17 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v18 = *v17;
  v19 = v17[1];
  if (v18 != v19)
  {
    while (*(_BYTE *)v18 != 4)
    {
      v18 += 16;
      if (v18 == v19)
        goto LABEL_27;
    }
  }
  if (v18 == v19)
LABEL_27:
    v20 = 0;
  else
    v20 = *(_QWORD *)(v18 + 8) != 0;
  *(_BYTE *)(v16[5] + 26) = v20;
  v21 = (md::LabelManager *)v16[3];
  *((_BYTE *)v21 + 3569) = v20;
  *(_QWORD *)v24 = &off_1E42CA328;
  *(_QWORD *)&v24[8] = v21;
  *(_QWORD *)&v24[16] = v20;
  v25 = v24;
  md::LabelManager::queueCommand(v21, 15, 1, v24);
  v22 = v25;
  if (v25 == v24)
  {
    v23 = 4;
    v22 = v24;
  }
  else
  {
    if (!v25)
      return;
    v23 = 5;
  }
  (*(void (**)(void))(*v22 + 8 * v23))();
}

- (int64_t)displayRate
{
  return *(_QWORD *)(*(_QWORD *)(*((_QWORD *)self + 48) + 120) + 8);
}

- (int64_t)navigationDisplayRate
{
  return *((_QWORD *)self + 29);
}

- (void)willEnterForeground
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  _BOOL4 v7;
  md::MapEngine *v8;
  void *v9;
  void *v10;
  int v11;
  VKMapView *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v11 = 134217984;
    v12 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Will enter foreground", (uint8_t *)&v11, 0xCu);
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  }
  v4 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  v5 = v4;
  v6 = *(_QWORD *)(*((_QWORD *)self + 48) + 1216);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Foreground", (const char *)&unk_1A0189141, (uint8_t *)&v11, 2u);
  }

  *((_BYTE *)self + 392) = 0;
  v7 = -[VKMapView _createDisplayLayer](self, "_createDisplayLayer");
  v8 = (md::MapEngine *)*((_QWORD *)self + 48);
  if (*((_BYTE *)self + 240) && !*((_BYTE *)v8 + 1178))
  {
    -[VKMapView userLocationAnimator](self, "userLocationAnimator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resetCourse");

    -[VKMapView userLocationAnimator](self, "userLocationAnimator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processLocationUpdates");

    v8 = (md::MapEngine *)*((_QWORD *)self + 48);
  }
  *((_BYTE *)v8 + 97) = 1;
  *((_BYTE *)v8 + 1177) = 0;
  md::MapEngine::updateRunLoopStatus(v8);
  *((_BYTE *)self + 240) = 0;
  if (v7)
    -[VKMapView forceLayout](self, "forceLayout");
}

- (void)didEnterBackground
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  VKMapView *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v12 = 134217984;
    v13 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Did enter background", (uint8_t *)&v12, 0xCu);
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  }
  v4 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  v5 = v4;
  v6 = *(_QWORD *)(*((_QWORD *)self + 48) + 1216);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v5, OS_SIGNPOST_INTERVAL_END, v6, "Foreground", (const char *)&unk_1A0189141, (uint8_t *)&v12, 2u);
  }

  v7 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v7 + 4536), "-[VKMapView didEnterBackground]");
  v8 = -[VKMapView isEffectivelyHidden](self, "isEffectivelyHidden");
  objc_msgSend(*((id *)self + 5), "didReceiveMemoryWarning:beAggressive:", v8, 0);
  objc_msgSend(*((id *)self + 6), "didReceiveMemoryWarning:beAggressive:", v8, 0);
  md::MapEngine::prune(v7, !v8);
  if (!*((_BYTE *)self + 240))
    md::MapEngine::prune(v7, 0);
  +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "purgeDecompressSessionCachedBuffers");

  v10 = *((_QWORD *)self + 48);
  *(_BYTE *)(v10 + 1177) = 1;
  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(v10 + 24) + 8) + 40))(*(_QWORD *)(*(_QWORD *)(v10 + 24)
                                                                                                 + 8));
  objc_msgSend(*(id *)(v10 + 824), "didEnterBackground");
  md::MapEngine::updateRunLoopStatus((md::MapEngine *)v10);
  *((_BYTE *)self + 240) = 1;
  if (*((_BYTE *)self + 392))
  {
    if (!-[VKMapView rendersInBackground](self, "rendersInBackground"))
    {
      v11 = *((_QWORD *)self + 48);
      objc_msgSend(*(id *)(v11 + 840), "setRenderSource:", 0);
      objc_msgSend(*(id *)(v11 + 840), "destroyRenderTarget");
    }
  }
}

- (void)didFinishSnapshotting
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  VKMapView *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Did finish suspension snapshot", (uint8_t *)&v5, 0xCu);
  }
  if (*((_BYTE *)self + 240) && !-[VKMapView rendersInBackground](self, "rendersInBackground"))
  {
    v4 = *((_QWORD *)self + 48);
    objc_msgSend(*(id *)(v4 + 840), "setRenderSource:", 0);
    objc_msgSend(*(id *)(v4 + 840), "destroyRenderTarget");
  }
  *((_BYTE *)self + 392) = 1;
}

- (void)flushTileLoads
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  md::TaskContext *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;

  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(*((_QWORD *)self + 48) + 4536), "-[VKMapView flushTileLoads]");
  v3 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)self + 48) + 896) + 24);
  v4 = *(_QWORD *)(v3 + 8);
  for (i = *(_QWORD *)(v3 + 16); v4 != i; v4 += 24)
    gdc::LayerDataSource::cancelAllLayerDataRequests(*(gdc::LayerDataSource **)(v4 + 8));
  gdc::ResourceManager::cleanupResources(*(gdc::ResourceManager **)(v3 + 56));
  v6 = *((_QWORD *)self + 48);
  if (v6)
  {
    v7 = *(md::TaskContext **)(v6 + 8);
    v8 = *(std::__shared_weak_count **)(v6 + 16);
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    md::TaskContext::flushTileDecodeQueues(v7);
    if (v8)
    {
      v11 = (unint64_t *)&v8->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
}

- (void)setStaysCenteredDuringPinch:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  int v9;
  VKMapView *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    v9 = 134218242;
    v10 = self;
    v11 = 2080;
    v12 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set stays centered during pitch: %s", (uint8_t *)&v9, 0x16u);
  }
  -[VKMapView currentCanvas](self, "currentCanvas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStaysCenteredDuringPinch:", v3);

}

- (BOOL)localizeLabels
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 24);
}

- (VKMetrics)metrics
{
  void *v3;
  void *v4;
  int8x8_t *v5;
  int8x8_t v6;
  uint8x8_t v7;
  uint64_t v8;
  uint64_t ***v9;
  uint64_t **v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  VKMetrics *v22;
  void *v23;
  uint64_t v25;
  std::__shared_weak_count *v26;

  v3 = (void *)*((_QWORD *)self + 67);
  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setCarDisplayType:", -[VKMapView carDisplayType](self, "carDisplayType"));
    objc_msgSend(v4, "setLabelScaleFactor:", -[VKMapView labelScaleFactor](self, "labelScaleFactor"));
    objc_msgSend(v4, "setShieldSize:", -[VKMapView shieldSize](self, "shieldSize"));
    v5 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
    if (v5)
    {
      v6 = v5[2];
      if (v6)
      {
        v7 = (uint8x8_t)vcnt_s8(v6);
        v7.i16[0] = vaddlv_u8(v7);
        if (v7.u32[0] > 1uLL)
        {
          v8 = 0x2FED70A4459DFCA1;
          if (*(_QWORD *)&v6 <= 0x2FED70A4459DFCA1uLL)
            v8 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v6;
        }
        else
        {
          v8 = (*(_QWORD *)&v6 - 1) & 0x2FED70A4459DFCA1;
        }
        v9 = *(uint64_t ****)(*(_QWORD *)&v5[1] + 8 * v8);
        if (v9)
        {
          v10 = *v9;
          if (v10)
          {
            if (v7.u32[0] < 2uLL)
            {
              v11 = *(_QWORD *)&v6 - 1;
              while (1)
              {
                v13 = v10[1];
                if (v13 == (uint64_t *)0x2FED70A4459DFCA1)
                {
                  if (v10[2] == (uint64_t *)0x2FED70A4459DFCA1)
                    goto LABEL_24;
                }
                else if (((unint64_t)v13 & v11) != v8)
                {
                  goto LABEL_35;
                }
                v10 = (uint64_t **)*v10;
                if (!v10)
                  goto LABEL_35;
              }
            }
            do
            {
              v12 = (unint64_t)v10[1];
              if (v12 == 0x2FED70A4459DFCA1)
              {
                if (v10[2] == (uint64_t *)0x2FED70A4459DFCA1)
                {
LABEL_24:
                  v14 = v10[5];
                  if (v14)
                  {
                    v15 = v14[32];
                    if (!v15)
                    {
                      md::StyleLogic::updateConfiguration((md::StyleLogic *)v10[5], *((_DWORD *)v14 + 274));
                      v15 = v14[32];
                    }
                    v16 = (std::__shared_weak_count *)v14[33];
                    v25 = v15;
                    v26 = v16;
                    if (v16)
                    {
                      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
                      do
                        v18 = __ldxr(p_shared_owners);
                      while (__stxr(v18 + 1, p_shared_owners));
                    }
                    objc_msgSend(v4, "setStyleManager:", &v25);
                    v19 = v26;
                    if (v26)
                    {
                      v20 = (unint64_t *)&v26->__shared_owners_;
                      do
                        v21 = __ldaxr(v20);
                      while (__stlxr(v21 - 1, v20));
                      if (!v21)
                      {
                        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
                        std::__shared_weak_count::__release_weak(v19);
                      }
                    }
                  }
                  break;
                }
              }
              else
              {
                if (v12 >= *(_QWORD *)&v6)
                  v12 %= *(_QWORD *)&v6;
                if (v12 != v8)
                  break;
              }
              v10 = (uint64_t **)*v10;
            }
            while (v10);
          }
        }
      }
    }
LABEL_35:
    v22 = -[VKMetrics initWithDescriptor:]([VKMetrics alloc], "initWithDescriptor:", v4);
    v23 = (void *)*((_QWORD *)self + 67);
    *((_QWORD *)self + 67) = v22;

    v3 = (void *)*((_QWORD *)self + 67);
  }
  return (VKMetrics *)v3;
}

- (BOOL)staysCenteredDuringPinch
{
  void *v2;
  void *v3;
  char v4;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "staysCenteredDuringPinch");

  return v4;
}

- (void)setStaysCenteredDuringRotation:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  int v9;
  VKMapView *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    v9 = 134218242;
    v10 = self;
    v11 = 2080;
    v12 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set stays centered durning rotation: %s", (uint8_t *)&v9, 0x16u);
  }
  -[VKMapView currentCanvas](self, "currentCanvas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStaysCenteredDuringRotation:", v3);

}

- (BOOL)staysCenteredDuringRotation
{
  void *v2;
  void *v3;
  char v4;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "staysCenteredDuringRotation");

  return v4;
}

- (BOOL)debugLayoutContinuously
{
  void *v2;
  char v3;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutContinuously");

  return v3;
}

- (void)setDebugLayoutContinuously:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutContinuously:", v3);

  -[VKMapView setNeedsLayout](self, "setNeedsLayout");
}

- (void)clearScene
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[3];
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v3 + 4536), "-[VKMapView clearScene]");
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 8) + 8);
  v7[0] = &off_1E42D49F0;
  v7[1] = v3;
  v8 = v7;
  geo::TaskQueue::barrierSync(v4, v7);
  v5 = v8;
  if (v8 == v7)
  {
    v6 = 4;
    v5 = v7;
    goto LABEL_5;
  }
  if (v8)
  {
    v6 = 5;
LABEL_5:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  objc_msgSend(*((id *)self + 5), "clearScene");
}

- (void)didReceiveMemoryWarning
{
  _BOOL8 v3;
  uint64_t v4;
  id v5;

  v3 = -[VKMapView isEffectivelyHidden](self, "isEffectivelyHidden");
  objc_msgSend(*((id *)self + 5), "didReceiveMemoryWarning:beAggressive:", v3, 0);
  objc_msgSend(*((id *)self + 6), "didReceiveMemoryWarning:beAggressive:", v3, 0);
  v4 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v4 + 4536), "-[VKMapView didReceiveMemoryWarning]");
  md::MapEngine::prune(v4, !v3);
  +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prune:", 1);

}

- (void)didReceiveFlushTileCaches
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v2 + 4536), "-[VKMapView didReceiveFlushTileCaches]");
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 8);
  v6[0] = &off_1E42D49F0;
  v6[1] = v2;
  v7 = v6;
  geo::TaskQueue::barrierSync(v3, v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (void)didReceiveLocalChanged
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v2 + 4536), "-[VKMapView didReceiveLocalChanged]");
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 8);
  v6[0] = &off_1E42D49F0;
  v6[1] = v2;
  v7 = v6;
  geo::TaskQueue::barrierSync(v3, v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (BOOL)isEffectivelyHidden
{
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  v3 = -[VKMapView isHidden](self, "isHidden");
  -[VKMapView superlayer](self, "superlayer");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4 || (v3 & 1) != 0)
  {
    v6 = (void *)v4;
  }
  else
  {
    do
    {
      v3 = objc_msgSend(v5, "isHidden");
      objc_msgSend(v5, "superlayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        v7 = v3;
      else
        v7 = 1;
      v5 = v6;
    }
    while ((v7 & 1) == 0);
  }

  return v3;
}

- (CADisplay)hostDisplay
{
  uint64_t v2;

  v2 = *(_QWORD *)(*((_QWORD *)self + 48) + 64);
  if (v2)
    return (CADisplay *)*(id *)(v2 + 88);
  else
    return (CADisplay *)0;
}

- (BOOL)enableDebugLabelHighlighting
{
  void *v2;
  char v3;
  void *v4;
  void *v5;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "daVinciEntityDebugHighlighting") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "labelHighlighting") & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "transitHighlighting");

    }
  }

  return v3;
}

- (void)debugHighlightLabelAtPoint:(CGPoint)a3
{
  double y;
  double x;
  int v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  int v15;
  uint64_t v16;
  double v17;
  float v18;
  id v19;
  id v20;
  id v21;
  _DWORD v22[2];

  y = a3.y;
  x = a3.x;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v19, "daVinciEntityDebugHighlighting");

  if (v6)
  {
    v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
    v8 = *(_QWORD *)(v7 + 16);
    if ((v8 & (v8 - 1)) != 0)
    {
      v11 = 0x8D737D0C0FC52C0CLL;
      if (v8 <= 0x8D737D0C0FC52C0CLL)
        v11 = 0x8D737D0C0FC52C0CLL % v8;
      v9 = *(_QWORD **)(*(_QWORD *)(v7 + 8) + 8 * v11);
      do
      {
        do
          v9 = (_QWORD *)*v9;
        while (v9[1] != 0x8D737D0C0FC52C0CLL);
      }
      while (v9[2] != 0x8D737D0C0FC52C0CLL);
    }
    else
    {
      v9 = *(_QWORD **)(*(_QWORD *)(v7 + 8) + 8 * ((v8 - 1) & 0x8D737D0C0FC52C0CLL));
      do
      {
        do
          v9 = (_QWORD *)*v9;
        while (v9[1] != 0x8D737D0C0FC52C0CLL);
      }
      while (v9[2] != 0x8D737D0C0FC52C0CLL);
    }
    v12 = v9[5];
    v13 = x;
    v14 = y;
    v15 = *(unsigned __int8 *)(v12 + 144);
    *(float *)(v12 + 136) = v13;
    *(float *)(v12 + 140) = v14;
    if (!v15)
      *(_BYTE *)(v12 + 144) = 1;
    -[VKMapView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v20, "transitHighlighting");

    if (v10)
    {
      -[VKMapView currentCanvas](self, "currentCanvas");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "debugHighlightObjectAtPoint:highlightTarget:", 1, x, y);

    }
    else
    {
      v16 = *(_QWORD *)(-[VKMapView _labelSettings](self, "_labelSettings") + 24);
      v17 = *(float *)(v16 + 480);
      v18 = x * v17;
      *(float *)&v17 = *(float *)(v16 + 1508) - y * v17;
      *(float *)v22 = v18;
      v22[1] = LODWORD(v17);
      (*(void (**)(_QWORD, _DWORD *))(**(_QWORD **)(v16 + 240) + 256))(*(_QWORD *)(v16 + 240), v22);
    }
  }
}

- (id)debugLabelString:(BOOL)a3
{
  return md::LabelSettings::debugLabelString(*(md::LabelSettings **)(-[VKMapView _labelSettings](self, "_labelSettings") + 24), a3);
}

- (BOOL)shouldLoadFallbackTiles
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 7)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (void)setShouldLoadMapMargin:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  VKMapView *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    v8 = 134218242;
    v9 = self;
    v10 = 2080;
    v11 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set should load map margin: %s", (uint8_t *)&v8, 0x16u);
  }
  v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  LOBYTE(v8) = 6;
  md::MapEngineSettings::set(v7, &v8, (_QWORD *)v3);
}

- (BOOL)shouldLoadMapMargin
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 6)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (id)detailedDescription
{
  VKDebugTree *v3;
  void *v4;

  v3 = objc_alloc_init(VKDebugTree);
  -[VKDebugTree populateData:](v3, "populateData:", self);
  -[VKDebugTree logTree](v3, "logTree");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)detailedDescriptionDictionaryRepresentation
{
  return objc_alloc_init(MEMORY[0x1E0C99E08]);
}

- (void)enableMapDisplayStyleDebugOverride:(id)a3
{
  unint64_t v3;
  NSObject *v5;
  __CFString *v6;
  BOOL v7;
  uint64_t v11;
  $6EFE6C6748B912A6EAC8A8E593ED1344 v12;
  uint8_t buf[4];
  VKMapView *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *(_QWORD *)&a3.var0;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if ((_BYTE)v3)
      v6 = CFSTR("Night");
    else
      v6 = CFSTR("Day");
    *(_DWORD *)buf = 134218242;
    v14 = self;
    v15 = 2080;
    v16 = -[__CFString UTF8String](v6, "UTF8String");
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Map display style debug override enabled, setting time of day to: %s", buf, 0x16u);
  }

  *((_BYTE *)self + 598) = 1;
  if (!(*(_DWORD *)&v12.var0 | *(unsigned __int16 *)&v12.var4 ^ 0x100)
    || (*(_DWORD *)&v12.var0 == 1 ? (v7 = *(unsigned __int16 *)&v12.var4 == 256) : (v7 = 0), v7))
  {
    v12.var2 = *((_BYTE *)self + 594);
    v3 = *(unsigned int *)&v12.var0 | ((unint64_t)*(unsigned __int16 *)&v12.var4 << 32);
LABEL_28:
    v11 = 1;
    goto LABEL_29;
  }
  if (*(_DWORD *)&v12.var0 != 512 || *(unsigned __int16 *)&v12.var4 != 256)
  {
    if (*(_DWORD *)&v12.var0 == 0x10000 && *(unsigned __int16 *)&v12.var4 == 256)
      goto LABEL_28;
    if (*(_DWORD *)&v12.var0 != 66048 || *(unsigned __int16 *)&v12.var4 != 256)
      goto LABEL_28;
  }
  v11 = 0;
LABEL_29:
  -[VKMapView setEmphasis:animated:](self, "setEmphasis:animated:", v11, 1);
  -[VKMapView _applyMapDisplayStyle:animated:duration:](self, "_applyMapDisplayStyle:animated:duration:", v3 & 0xFFFFFFFFFFFFLL, 1, 1.0);
}

- (void)setGesturing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  void *v16;
  void *v17;
  int v18;
  VKMapView *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isGesturing");

  if (v7 != v3)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v8 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v9 = "NO";
      if (v3)
        v9 = "YES";
      v18 = 134218242;
      v19 = self;
      v20 = 2080;
      v21 = v9;
      _os_log_impl(&dword_19F029000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set gesturing: %s", (uint8_t *)&v18, 0x16u);
      if (v3)
      {
        if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
          dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
        goto LABEL_11;
      }
      if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    }
    else if (v3)
    {
LABEL_11:
      v10 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
      v11 = v10;
      v12 = *(_QWORD *)(*((_QWORD *)self + 48) + 1216);
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl(&dword_19F029000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Gesturing", (const char *)&unk_1A0189141, (uint8_t *)&v18, 2u);
      }

      md::AnimationManager::forceInstantAnimations(*(md::AnimationManager **)(*((_QWORD *)self + 48) + 104), 0);
LABEL_21:
      -[VKMapView currentCanvas](self, "currentCanvas");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cameraController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setGesturing:", v3);

      md::MapEngine::updateRunLoopStatus(*((md::MapEngine **)self + 48));
      return;
    }
    v13 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
    v14 = v13;
    v15 = *(_QWORD *)(*((_QWORD *)self + 48) + 1216);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_19F029000, v14, OS_SIGNPOST_INTERVAL_END, v15, "Gesturing", (const char *)&unk_1A0189141, (uint8_t *)&v18, 2u);
    }

    goto LABEL_21;
  }
}

- (BOOL)canZoomInForTileSize:(int64_t)a3
{
  void *v4;
  void *v5;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "canZoomInForTileSize:", a3);

  return a3;
}

- (BOOL)canZoomOutForTileSize:(int64_t)a3
{
  void *v4;
  void *v5;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "canZoomOutForTileSize:", a3);

  return a3;
}

- (double)minimumZoomLevelForTileSize:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumZoomLevelForTileSize:", a3);
  v7 = v6;

  return v7;
}

- (double)zoomLevelAdjustmentForTileSize:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoomLevelAdjustmentForTileSize:", a3);
  v7 = v6;

  return v7;
}

- (int64_t)navigationShieldSize
{
  return +[VKInternalIconManager convertGrlSizeGroup:](VKInternalIconManager, "convertGrlSizeGroup:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(-[VKMapView _labelSettings](self, "_labelSettings") + 8) + 40)+ 2));
}

- (void)setNavigationShieldSize:(int64_t)a3
{
  NSObject *v5;
  _QWORD *v6;
  unsigned int v7;
  uint64_t v8;
  md::LabelManager *v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v12[24];
  _BYTE *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v12 = 134218240;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2048;
    *(_QWORD *)&v12[14] = a3;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set navigation shield size: %ld", v12, 0x16u);
  }
  v6 = -[VKMapView _labelSettings](self, "_labelSettings");
  v7 = +[VKInternalIconManager convertSizeGroup:](VKInternalIconManager, "convertSizeGroup:", a3);
  v8 = v6[1];
  *(_BYTE *)(*(_QWORD *)(v8 + 40) + 2) = v7;
  v9 = *(md::LabelManager **)(v8 + 24);
  *(_QWORD *)v12 = &off_1E42CA058;
  *(_QWORD *)&v12[8] = v9;
  *(_QWORD *)&v12[16] = v7;
  v13 = v12;
  md::LabelManager::queueCommand(v9, 11, 1, v12);
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

- (int64_t)shieldIdiom
{
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 8);
}

- (void)setShieldIdiom:(int64_t)a3
{
  NSObject *v5;
  uint64_t *v6;
  uint64_t v7;
  md::LabelManager *v8;
  _QWORD *v9;
  uint64_t v10;
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v11 = 134218240;
    *(_QWORD *)&v11[4] = self;
    *(_WORD *)&v11[12] = 2048;
    *(_QWORD *)&v11[14] = a3;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shield idiom: %ld", v11, 0x16u);
  }
  v6 = -[VKMapView _labelSettings](self, "_labelSettings");
  v7 = *v6;
  *(_QWORD *)(*(_QWORD *)(*v6 + 40) + 8) = a3;
  v8 = *(md::LabelManager **)(v7 + 24);
  *(_QWORD *)v11 = &off_1E42C9680;
  *(_QWORD *)&v11[8] = v8;
  *(_QWORD *)&v11[16] = a3;
  v12 = v11;
  md::LabelManager::queueCommand(v8, 12, 1, v11);
  v9 = v12;
  if (v12 == v11)
  {
    v10 = 4;
    v9 = v11;
  }
  else
  {
    if (!v12)
      return;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
}

- (BOOL)showsRoadLabels
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 19);
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
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set show road labels: %s", v12, 0x16u);
  }
  v7 = -[VKMapView _labelSettings](self, "_labelSettings");
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

- (BOOL)showsRoadShields
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 20);
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
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set show road shields: %s", v12, 0x16u);
  }
  v7 = -[VKMapView _labelSettings](self, "_labelSettings");
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

- (BOOL)showsPointLabels
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 18);
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
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set show point labels: %s", v12, 0x16u);
  }
  v7 = -[VKMapView _labelSettings](self, "_labelSettings");
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

- (BOOL)showsContourLabels
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 21);
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
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set show contour labels: %s", v12, 0x16u);
  }
  v7 = -[VKMapView _labelSettings](self, "_labelSettings");
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
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 22);
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
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set show physical feature labels: %s", v12, 0x16u);
  }
  v7 = -[VKMapView _labelSettings](self, "_labelSettings");
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
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 23);
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
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set show labels: %s", v12, 0x16u);
  }
  v7 = -[VKMapView _labelSettings](self, "_labelSettings");
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

- (BOOL)showsPointsOfInterest
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 17);
}

- (BOOL)isMKRenderingSelectionBalloon
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)-[VKMapView _labelSettings](self, "_labelSettings") + 40) + 27);
}

- (BOOL)showsBuildings
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
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

- (BOOL)showsVenues
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
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

- (BOOL)showsHiking
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
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

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
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
  _QWORD *v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  VKMapView *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v4 = a4;
  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (GEOConfigGetBOOL())
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v7 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v14 = 134217984;
      v15 = self;
      _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows hiking is overridden", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (v5)
      v5 = -[VKMapView _hikingIsAvailable](self, "_hikingIsAvailable");
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v8 = (_QWORD *)(v5 & v4);
    v9 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v10 = "NO";
      if (v5)
        v11 = "YES";
      else
        v11 = "NO";
      v14 = 134218498;
      v15 = self;
      v17 = v11;
      v16 = 2080;
      if ((_DWORD)v8)
        v10 = "YES";
      v18 = 2080;
      v19 = v10;
      _os_log_impl(&dword_19F029000, v9, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows hiking: %s with topograpic features: %s", (uint8_t *)&v14, 0x20u);
    }
    v12 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
    LOBYTE(v14) = 33;
    md::MapEngineSettings::set(v12, &v14, (_QWORD *)v5);
    v13 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
    LOBYTE(v14) = 34;
    md::MapEngineSettings::set(v13, &v14, v8);
  }
}

- (BOOL)showsHillshade
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
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

- (void)setShowsHillshade:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE v9[12];
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v9 = 134218242;
    *(_QWORD *)&v9[4] = self;
    v10 = 2080;
    v11 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows hillshade: %s", v9, 0x16u);
  }
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
    v9[0] = 32;
    if (v3)
      v8 = -[VKMapView _hillshadeIsAvailable](self, "_hillshadeIsAvailable", *(_QWORD *)v9);
    else
      v8 = 0;
    md::MapEngineSettings::set(v7, v9, (_QWORD *)v8);
  }
}

- (BOOL)showsLiveEVData
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 36)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (void)setShowsLiveEVData:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE v10[12];
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    *(_DWORD *)v10 = 134218242;
    *(_QWORD *)&v10[4] = self;
    v11 = 2080;
    v12 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set shows liveData: %s", v10, 0x16u);
  }
  v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v10[0] = 36;
  if (v3)
    v8 = -[VKMapView _realTimeEVChargerIsEnabled](self, "_realTimeEVChargerIsEnabled", *(_QWORD *)v10);
  else
    v8 = 0;
  md::MapEngineSettings::set(v7, v10, (_QWORD *)v8);
  v9 = *((_QWORD *)self + 48);
  v10[0] = 1;
  md::MapEngine::setNeedsTick(v9, v10);
}

- (void)setSupportedEVConnectorTypes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  md::LabelManager *v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[3];
  _QWORD *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v5 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "integerValue", (_QWORD)v13);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v9 = -[VKMapView _labelSettings](self, "_labelSettings");
  *(_QWORD *)(v9[5] + 320) = v5;
  v10 = (md::LabelManager *)v9[3];
  if (*((_QWORD *)v10 + 432) != v5)
  {
    v18[0] = &off_1E42CA400;
    v18[1] = v10;
    v18[2] = v5;
    v19 = v18;
    md::LabelManager::queueCommand(v10, 70, 1, v18);
    v11 = v19;
    if (v19 == v18)
    {
      v12 = 4;
      v11 = v18;
      goto LABEL_13;
    }
    if (v19)
    {
      v12 = 5;
LABEL_13:
      (*(void (**)(void))(*v11 + 8 * v12))();
    }
  }

}

- (BOOL)isLoadingMuninMetadata
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 18)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (void)setLoadMuninMetadata:(BOOL)a3
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v4 = 18;
  md::MapEngineSettings::set(v3, &v4, (_QWORD *)a3);
}

- (BOOL)loadMuninAvailability
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 19)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (void)setLoadMuninAvailability:(BOOL)a3
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v4 = 19;
  md::MapEngineSettings::set(v3, &v4, (_QWORD *)a3);
}

- (int64_t)terrainMode
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *((_QWORD *)self + 48);
  if (!v2)
    return 0;
  v3 = *(uint64_t **)(v2 + 1128);
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

- (BOOL)_realTimeEVChargerIsEnabled
{
  if ((MapsFeature_IsEnabled_RealTimeEVCharger() & 1) != 0)
    return 1;
  else
    return GEOConfigGetBOOL();
}

- (BOOL)_hillshadeIsAvailable
{
  int v2;
  BOOL result;

  v2 = *(unsigned __int8 *)(*((_QWORD *)self + 48) + 4584);
  result = MapsFeature_IsEnabled_HikingiOS();
  if (!v2)
    return 0;
  return result;
}

- (BOOL)enableRoundedBuildings
{
  void *v2;
  char v3;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "daVinciRoundBuildings");

  return v3;
}

- (BOOL)enableColorizedBuildings
{
  void *v2;
  char v3;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "daVinciColorBuildings");

  return v3;
}

- (BOOL)enableBuildingHeights
{
  void *v2;
  char v3;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "daVinciBuildingHeights");

  return v3;
}

- (BOOL)enableAdvancedLighting
{
  void *v2;
  char v3;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "daVinciAdvancedLightingEnabled");

  return v3;
}

- (BOOL)enableAdvancedWater
{
  void *v2;
  char v3;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "daVinciWaterEnabled");

  return v3;
}

- (BOOL)isCameraInHikingBoundary
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    return 0;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0xC74495586E0C32F6;
    if (*(_QWORD *)&v3 <= 0xC74495586E0C32F6)
      v5 = 0xC74495586E0C32F6 % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0xC74495586E0C32F6;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6)
    return 0;
  v7 = (_QWORD *)*v6;
  if (!v7)
    return 0;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0xC74495586E0C32F6)
      {
        if (v7[2] == 0xC74495586E0C32F6)
          goto LABEL_22;
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        return 0;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0xC74495586E0C32F6)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      return 0;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      return 0;
  }
  if (v7[2] != 0xC74495586E0C32F6)
    goto LABEL_11;
LABEL_22:
  v11 = v7[5];
  if (v11 && *(_BYTE *)(v11 + 56))
    return *(_BYTE *)(v11 + 184) != 0;
  return 0;
}

- (BOOL)isCameraInHikingBufferRegion
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    return 0;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0xC74495586E0C32F6;
    if (*(_QWORD *)&v3 <= 0xC74495586E0C32F6)
      v5 = 0xC74495586E0C32F6 % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0xC74495586E0C32F6;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6)
    return 0;
  v7 = (_QWORD *)*v6;
  if (!v7)
    return 0;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0xC74495586E0C32F6)
      {
        if (v7[2] == 0xC74495586E0C32F6)
          goto LABEL_22;
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        return 0;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0xC74495586E0C32F6)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      return 0;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      return 0;
  }
  if (v7[2] != 0xC74495586E0C32F6)
    goto LABEL_11;
LABEL_22:
  v11 = v7[5];
  if (v11 && *(_BYTE *)(v11 + 56))
    return *(_BYTE *)(v11 + 200) != 0;
  return 0;
}

- (void)requestHikingToolTipRegionIDForLocation:(id)a3
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
  long double v13;
  long double v14;
  float64x2_t v15;
  int v21;
  double var1;

  v3 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v4 = v3[2];
  if (v4)
  {
    v5 = (uint8x8_t)vcnt_s8(v4);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      v6 = 0xC74495586E0C32F6;
      if (*(_QWORD *)&v4 <= 0xC74495586E0C32F6)
        v6 = 0xC74495586E0C32F6 % *(_QWORD *)&v4;
    }
    else
    {
      v6 = (*(_QWORD *)&v4 - 1) & 0xC74495586E0C32F6;
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
            if (v11 == 0xC74495586E0C32F6)
            {
              if (v8[2] == 0xC74495586E0C32F6)
                goto LABEL_22;
            }
            else if ((v11 & v9) != v6)
            {
              return;
            }
            v8 = (_QWORD *)*v8;
            if (!v8)
              return;
          }
        }
        do
        {
          v10 = v8[1];
          if (v10 == 0xC74495586E0C32F6)
          {
            if (v8[2] == 0xC74495586E0C32F6)
            {
LABEL_22:
              v12 = v8[5];
              if (v12 && *(_BYTE *)(v12 + 56))
              {
                var1 = a3.var1;
                v13 = tan(a3.var0 * 0.00872664626 + 0.785398163);
                v14 = log(v13);
                v15.f64[0] = var1;
                v15.f64[1] = v14;
                __asm { FMOV            V1.2D, #0.5 }
                v21 = *(unsigned __int8 *)(v12 + 224);
                *(float64x2_t *)(v12 + 208) = vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v15);
                if (!v21)
                  *(_BYTE *)(v12 + 224) = 1;
              }
              return;
            }
          }
          else
          {
            if (v10 >= *(_QWORD *)&v4)
              v10 %= *(_QWORD *)&v4;
            if (v10 != v6)
              return;
          }
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
    }
  }
}

- (void)requestHikingContextualRegionDoesIntersectForLocation:(id)a3
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
  long double v13;
  long double v14;
  float64x2_t v15;
  int v21;
  double var1;

  v3 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v4 = v3[2];
  if (v4)
  {
    v5 = (uint8x8_t)vcnt_s8(v4);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      v6 = 0xC74495586E0C32F6;
      if (*(_QWORD *)&v4 <= 0xC74495586E0C32F6)
        v6 = 0xC74495586E0C32F6 % *(_QWORD *)&v4;
    }
    else
    {
      v6 = (*(_QWORD *)&v4 - 1) & 0xC74495586E0C32F6;
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
            if (v11 == 0xC74495586E0C32F6)
            {
              if (v8[2] == 0xC74495586E0C32F6)
                goto LABEL_22;
            }
            else if ((v11 & v9) != v6)
            {
              return;
            }
            v8 = (_QWORD *)*v8;
            if (!v8)
              return;
          }
        }
        do
        {
          v10 = v8[1];
          if (v10 == 0xC74495586E0C32F6)
          {
            if (v8[2] == 0xC74495586E0C32F6)
            {
LABEL_22:
              v12 = v8[5];
              if (v12 && *(_BYTE *)(v12 + 56))
              {
                var1 = a3.var1;
                v13 = tan(a3.var0 * 0.00872664626 + 0.785398163);
                v14 = log(v13);
                v15.f64[0] = var1;
                v15.f64[1] = v14;
                __asm { FMOV            V1.2D, #0.5 }
                v21 = *(unsigned __int8 *)(v12 + 280);
                *(float64x2_t *)(v12 + 264) = vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v15);
                if (!v21)
                  *(_BYTE *)(v12 + 280) = 1;
              }
              return;
            }
          }
          else
          {
            if (v10 >= *(_QWORD *)&v4)
              v10 %= *(_QWORD *)&v4;
            if (v10 != v6)
              return;
          }
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
    }
  }
}

- (void)_reconfigurePermissions
{
  -[VKMapView setTerrainMode:](self, "setTerrainMode:", *((_QWORD *)self + 71));
  -[VKMapView setEnableGlobe:](self, "setEnableGlobe:", *((unsigned __int8 *)self + 576));
  -[VKMapView setEnableRoundedBuildings:](self, "setEnableRoundedBuildings:", *((unsigned __int8 *)self + 577));
  -[VKMapView setEnableColorizedBuildings:](self, "setEnableColorizedBuildings:", *((unsigned __int8 *)self + 578));
  -[VKMapView setEnableBuildingHeights:](self, "setEnableBuildingHeights:", *((unsigned __int8 *)self + 579));
  -[VKMapView setEnableAdvancedWater:](self, "setEnableAdvancedWater:", *((unsigned __int8 *)self + 581));
  -[VKMapView setEnableAdvancedLighting:](self, "setEnableAdvancedLighting:", *((unsigned __int8 *)self + 580));
}

- (void)tileGroupWillChange
{
  NSObject *v3;
  int v4;
  VKMapView *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] tileGroupWillChange", (uint8_t *)&v4, 0xCu);
  }
}

- (void)tileGroupDidChange
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  VKMapView *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] tileGroupDidChange", (uint8_t *)&v7, 0xCu);
  }
  +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prune:", 0);

  v5 = *((_QWORD *)self + 48);
  v6 = *(_BYTE *)(v5 + 1241) == 0;
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v5 + 4536), "-[VKMapView tileGroupDidChange]");
  md::MapEngineSyncAccessor::configurationDidChange((md::MapEngineSyncAccessor *)v5);
  if (!v6 && !*(_BYTE *)(*((_QWORD *)self + 48) + 1241))
    -[VKMapView reconfigureFlyoverIfNeeded](self, "reconfigureFlyoverIfNeeded");
  -[VKMapView _updateBuildingCompressionSetting](self, "_updateBuildingCompressionSetting");
  -[VKMapView _reconfigurePermissions](self, "_reconfigurePermissions");
}

- (float)worldSpaceWidthOfView
{
  id *v2;
  void *v3;
  double v4;
  float v5;

  v2 = (id *)((char *)self + 448);
  objc_msgSend(*((id *)self + 57), "footprint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minDepth");
  objc_msgSend(v2[1], "widthOfViewAtDepth:");
  v5 = v4;

  return v5;
}

- (void)reconfigureFlyoverIfNeeded
{
  -[VKMapView _createGlobe](self, "_createGlobe");
  if (*((_BYTE *)self + 32))
    -[VKMapView setMapType:](self, "setMapType:", *((unsigned int *)self + 9));
}

- (void)setDimmingBaseMap:(BOOL)a3
{
  -[VKMapView setDimmingBaseMap:animated:duration:](self, "setDimmingBaseMap:animated:duration:", a3, 1, 0.3);
}

- (void)setDimmingBaseMap:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v9;
  const char *v10;
  const char *v11;
  int8x8_t *v12;
  int8x8_t v13;
  uint8x8_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  int v26;
  uint64_t v27;
  unsigned __int8 v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  int8x8_t *v40;
  int8x8_t v41;
  uint8x8_t v42;
  unint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  int v50;
  VKTimedAnimation *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t *v61;
  unint64_t v62;
  uint64_t v63;
  std::__shared_weak_count *v64;
  _QWORD v65[5];
  int v66;
  id v67;
  _BYTE buf[24];
  const char *v69;
  _BYTE v70[12];
  int v71;
  uint64_t v72;

  v6 = a4;
  v7 = a3;
  v72 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v9 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v10 = "NO";
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = self;
    if (v7)
      v11 = "YES";
    else
      v11 = "NO";
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[12] = 2080;
    if (v6)
      v10 = "YES";
    *(_WORD *)&buf[22] = 2080;
    v69 = v10;
    *(_WORD *)v70 = 2048;
    *(double *)&v70[2] = a5;
    _os_log_impl(&dword_19F029000, v9, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set dimming base map: %s, animated: %s, duration: %f", buf, 0x2Au);
  }
  v12 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v13 = v12[2];
  if (!*(_QWORD *)&v13)
    goto LABEL_30;
  v14 = (uint8x8_t)vcnt_s8(v13);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    v15 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v13 <= 0x2FED70A4459DFCA1uLL)
      v15 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v13;
  }
  else
  {
    v15 = (*(_QWORD *)&v13 - 1) & 0x2FED70A4459DFCA1;
  }
  v16 = *(_QWORD **)(*(_QWORD *)&v12[1] + 8 * v15);
  if (!v16 || (v17 = (_QWORD *)*v16) == 0)
  {
LABEL_30:
    v21 = 0;
    v22 = MEMORY[0x100];
    if (!MEMORY[0x100])
      goto LABEL_31;
    goto LABEL_32;
  }
  if (v14.u32[0] < 2uLL)
  {
    v18 = *(_QWORD *)&v13 - 1;
    while (1)
    {
      v19 = v17[1];
      if (v19 == 0x2FED70A4459DFCA1)
      {
        if (v17[2] == 0x2FED70A4459DFCA1)
          goto LABEL_75;
      }
      else if ((v19 & v18) != v15)
      {
        goto LABEL_30;
      }
      v17 = (_QWORD *)*v17;
      if (!v17)
        goto LABEL_30;
    }
  }
  while (1)
  {
    v20 = v17[1];
    if (v20 == 0x2FED70A4459DFCA1)
      break;
    if (v20 >= *(_QWORD *)&v13)
      v20 %= *(_QWORD *)&v13;
    if (v20 != v15)
      goto LABEL_30;
LABEL_25:
    v17 = (_QWORD *)*v17;
    if (!v17)
      goto LABEL_30;
  }
  if (v17[2] != 0x2FED70A4459DFCA1)
    goto LABEL_25;
LABEL_75:
  v21 = v17[5];
  v22 = *(_QWORD *)(v21 + 256);
  if (!v22)
  {
LABEL_31:
    md::StyleLogic::updateConfiguration((md::StyleLogic *)v21, *(_DWORD *)(v21 + 1096));
    v22 = *(_QWORD *)(v21 + 256);
  }
LABEL_32:
  v23 = *(std::__shared_weak_count **)(v21 + 264);
  v63 = v22;
  v64 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v25 = __ldxr(p_shared_owners);
    while (__stxr(v25 + 1, p_shared_owners));
  }
  v26 = 0;
  if (v7)
  {
    v27 = *(_QWORD *)(v22 + 16);
    v28 = atomic_load((unsigned __int8 *)(v27 + 2784));
    if ((v28 & 1) == 0)
      std::__assoc_sub_state::wait(*(std::__assoc_sub_state **)(v27 + 2808));
    v29 = *(_QWORD *)(v27 + 120);
    v30 = *(std::__shared_weak_count **)(v27 + 128);
    if (v30)
    {
      v31 = (unint64_t *)&v30->__shared_owners_;
      do
        v32 = __ldxr(v31);
      while (__stxr(v32 + 1, v31));
      v26 = *(_DWORD *)(v29 + 316);
      do
        v33 = __ldaxr(v31);
      while (__stlxr(v33 - 1, v31));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    else
    {
      v26 = *(_DWORD *)(v29 + 316);
    }
  }
  v34 = *(_QWORD *)(v63 + 520);
  v35 = *(std::__shared_weak_count **)(v63 + 528);
  *(_QWORD *)buf = v34;
  *(_QWORD *)&buf[8] = v35;
  if (v35)
  {
    v36 = (unint64_t *)&v35->__shared_owners_;
    do
      v37 = __ldxr(v36);
    while (__stxr(v37 + 1, v36));
  }
  gss::ClientStyleState<gss::PropertyID>::setClientStyleAttribute(v34, 0x10049u, v7);
  if (v35)
  {
    v38 = (unint64_t *)&v35->__shared_owners_;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v40 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v41 = v40[2];
  if (!*(_QWORD *)&v41)
    goto LABEL_88;
  v42 = (uint8x8_t)vcnt_s8(v41);
  v42.i16[0] = vaddlv_u8(v42);
  if (v42.u32[0] > 1uLL)
  {
    v43 = 0xEC9B77B4222D22FFLL;
    if (*(_QWORD *)&v41 <= 0xEC9B77B4222D22FFLL)
      v43 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v41;
  }
  else
  {
    v43 = (*(_QWORD *)&v41 - 1) & 0xEC9B77B4222D22FFLL;
  }
  v44 = *(_QWORD **)(*(_QWORD *)&v40[1] + 8 * v43);
  if (!v44)
    goto LABEL_88;
  v45 = (_QWORD *)*v44;
  if (!v45)
    goto LABEL_88;
  if (v42.u32[0] < 2uLL)
  {
    v46 = *(_QWORD *)&v41 - 1;
    while (1)
    {
      v47 = v45[1];
      if (v47 == 0xEC9B77B4222D22FFLL)
      {
        if (v45[2] == 0xEC9B77B4222D22FFLL)
          goto LABEL_77;
      }
      else if ((v47 & v46) != v43)
      {
        goto LABEL_88;
      }
      v45 = (_QWORD *)*v45;
      if (!v45)
        goto LABEL_88;
    }
  }
  while (1)
  {
    v48 = v45[1];
    if (v48 == 0xEC9B77B4222D22FFLL)
      break;
    if (v48 >= *(_QWORD *)&v41)
      v48 %= *(_QWORD *)&v41;
    if (v48 != v43)
      goto LABEL_88;
LABEL_69:
    v45 = (_QWORD *)*v45;
    if (!v45)
      goto LABEL_88;
  }
  if (v45[2] != 0xEC9B77B4222D22FFLL)
    goto LABEL_69;
LABEL_77:
  v49 = v45[5];
  if (!v49)
  {
LABEL_88:
    if (v64)
    {
      v61 = (unint64_t *)&v64->__shared_owners_;
      do
        v62 = __ldaxr(v61);
      while (__stlxr(v62 - 1, v61));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
        std::__shared_weak_count::__release_weak(v64);
      }
    }
    return;
  }
  if (!v6)
  {
    *(_DWORD *)(v49 + 488) = v26;
    v58 = *(_QWORD *)(v49 + 848);
    if (v58)
      (*(void (**)(uint64_t))(*(_QWORD *)v58 + 48))(v58);
LABEL_84:
    v59 = *(_QWORD *)(v49 + 880);
    if (v59)
    {
      buf[0] = v7;
      (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v59 + 48))(v59, buf);
    }
    if (!v6)
    {
      v60 = *((_QWORD *)self + 48);
      buf[0] = 1;
      md::MapEngine::setNeedsTick(v60, buf);
    }
    goto LABEL_88;
  }
  v50 = *(_DWORD *)(v49 + 488);
  objc_msgSend(*(id *)(v49 + 648), "stop");
  v51 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a5);
  v52 = *(void **)(v49 + 648);
  *(_QWORD *)(v49 + 648) = v51;

  v53 = *(void **)(v49 + 648);
  v54 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___ZN2md10VenueLogic23setBaseMapDimmingFactorEfbd_block_invoke;
  v69 = (const char *)&__block_descriptor_48_e8_v12__0f8l;
  *(_QWORD *)v70 = v49;
  *(_DWORD *)&v70[8] = v50;
  v71 = v26;
  objc_msgSend(v53, "setStepHandler:", buf);
  v55 = *(void **)(v49 + 648);
  v65[0] = v54;
  v65[1] = 3221225472;
  v65[2] = ___ZN2md10VenueLogic23setBaseMapDimmingFactorEfbd_block_invoke_2;
  v65[3] = &__block_descriptor_44_e8_v12__0B8l;
  v65[4] = v49;
  v66 = v26;
  objc_msgSend(v55, "setCompletionHandler:", v65);
  if (!*(_QWORD *)(v49 + 816))
    goto LABEL_84;
  v56 = *(id *)(v49 + 648);
  v67 = v56;
  v57 = *(_QWORD *)(v49 + 816);
  if (v57)
  {
    (*(void (**)(uint64_t, id *))(*(_QWORD *)v57 + 48))(v57, &v67);

    goto LABEL_84;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (BOOL)isDimmingBaseMap
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    return 0;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0xEC9B77B4222D22FFLL;
    if (*(_QWORD *)&v3 <= 0xEC9B77B4222D22FFLL)
      v5 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0xEC9B77B4222D22FFLL;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6)
    return 0;
  v7 = (_QWORD *)*v6;
  if (!v7)
    return 0;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0xEC9B77B4222D22FFLL)
      {
        if (v7[2] == 0xEC9B77B4222D22FFLL)
          goto LABEL_22;
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        return 0;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0xEC9B77B4222D22FFLL)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      return 0;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      return 0;
  }
  if (v7[2] != 0xEC9B77B4222D22FFLL)
    goto LABEL_11;
LABEL_22:
  v11 = v7[5];
  if (v11)
    return *(float *)(v11 + 488) > 0.00000011921;
  return 0;
}

- (id)venueWithFocus
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  VKVenueFeatureMarker *v13;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    goto LABEL_26;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0xEC9B77B4222D22FFLL;
    if (*(_QWORD *)&v3 <= 0xEC9B77B4222D22FFLL)
      v5 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0xEC9B77B4222D22FFLL;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6)
    goto LABEL_26;
  v7 = (_QWORD *)*v6;
  if (!v7)
    goto LABEL_26;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0xEC9B77B4222D22FFLL)
      {
        if (v7[2] == 0xEC9B77B4222D22FFLL)
          goto LABEL_22;
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_26;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        goto LABEL_26;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0xEC9B77B4222D22FFLL)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      goto LABEL_26;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      goto LABEL_26;
  }
  if (v7[2] != 0xEC9B77B4222D22FFLL)
    goto LABEL_11;
LABEL_22:
  v11 = v7[5];
  if (!v11 || !*(_BYTE *)(v11 + 56) || (v12 = *(_QWORD *)(v11 + 568)) == 0)
  {
LABEL_26:
    v13 = 0;
    return v13;
  }
  v13 = -[VKVenueFeatureMarker initWithVenue:localize:]([VKVenueFeatureMarker alloc], "initWithVenue:localize:", v12, -[VKMapView localizeLabels](self, "localizeLabels"));
  return v13;
}

- (id)venueBuildingWithFocus
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  VKVenueBuildingFeatureMarker *v13;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    goto LABEL_26;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0xEC9B77B4222D22FFLL;
    if (*(_QWORD *)&v3 <= 0xEC9B77B4222D22FFLL)
      v5 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0xEC9B77B4222D22FFLL;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6)
    goto LABEL_26;
  v7 = (_QWORD *)*v6;
  if (!v7)
    goto LABEL_26;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0xEC9B77B4222D22FFLL)
      {
        if (v7[2] == 0xEC9B77B4222D22FFLL)
          goto LABEL_22;
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_26;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        goto LABEL_26;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0xEC9B77B4222D22FFLL)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      goto LABEL_26;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      goto LABEL_26;
  }
  if (v7[2] != 0xEC9B77B4222D22FFLL)
    goto LABEL_11;
LABEL_22:
  v11 = v7[5];
  if (!v11 || !*(_BYTE *)(v11 + 56) || (v12 = *(_QWORD *)(v11 + 576)) == 0)
  {
LABEL_26:
    v13 = 0;
    return v13;
  }
  v13 = -[VKVenueBuildingFeatureMarker initWithVenueBuilding:localize:]([VKVenueBuildingFeatureMarker alloc], "initWithVenueBuilding:localize:", v12, -[VKMapView localizeLabels](self, "localizeLabels"));
  return v13;
}

- (id)venueAtLocation:(id)a3
{
  return -[VKMapView venueAtLocation:withMarginForError:includeNonRevealedVenues:](self, "venueAtLocation:withMarginForError:includeNonRevealedVenues:", 1, 0, a3.var0, a3.var1);
}

- (id)venueAtLocation:(id)a3 withMarginForError:(BOOL)a4
{
  return -[VKMapView venueAtLocation:withMarginForError:includeNonRevealedVenues:](self, "venueAtLocation:withMarginForError:includeNonRevealedVenues:", a4, 0, a3.var0, a3.var1);
}

- (id)venueAtLocation:(id)a3 withMarginForError:(BOOL)a4 includeNonRevealedVenues:(BOOL)a5
{
  int8x8_t *v5;
  int8x8_t v6;
  _BOOL4 v7;
  uint8x8_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  long double v18;
  long double v19;
  float64x2_t v20;
  __n128 v21;
  float64x2_t v27;
  uint64_t v28;
  VKVenueFeatureMarker *v29;
  float64x2_t v31;
  _QWORD *v32;
  double var1;
  float64x2_t v34;

  v5 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v6 = v5[2];
  if (!*(_QWORD *)&v6)
    goto LABEL_27;
  v7 = a5;
  v10 = (uint8x8_t)vcnt_s8(v6);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    v11 = 0xEC9B77B4222D22FFLL;
    if (*(_QWORD *)&v6 <= 0xEC9B77B4222D22FFLL)
      v11 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v6;
  }
  else
  {
    v11 = (*(_QWORD *)&v6 - 1) & 0xEC9B77B4222D22FFLL;
  }
  v12 = *(_QWORD **)(*(_QWORD *)&v5[1] + 8 * v11);
  if (!v12 || (v13 = (_QWORD *)*v12) == 0)
  {
LABEL_27:
    v29 = 0;
    return v29;
  }
  if (v10.u32[0] < 2uLL)
  {
    v14 = *(_QWORD *)&v6 - 1;
    while (1)
    {
      v16 = v13[1];
      if (v16 == 0xEC9B77B4222D22FFLL)
      {
        if (v13[2] == 0xEC9B77B4222D22FFLL)
          goto LABEL_22;
      }
      else if ((v16 & v14) != v11)
      {
        goto LABEL_27;
      }
      v13 = (_QWORD *)*v13;
      if (!v13)
        goto LABEL_27;
    }
  }
  while (1)
  {
    v15 = v13[1];
    if (v15 == 0xEC9B77B4222D22FFLL)
      break;
    if (v15 >= *(_QWORD *)&v6)
      v15 %= *(_QWORD *)&v6;
    if (v15 != v11)
      goto LABEL_27;
LABEL_11:
    v13 = (_QWORD *)*v13;
    if (!v13)
      goto LABEL_27;
  }
  if (v13[2] != 0xEC9B77B4222D22FFLL)
    goto LABEL_11;
LABEL_22:
  v17 = v13[5];
  if (!v17)
    goto LABEL_27;
  var1 = a3.var1;
  v18 = tan(a3.var0 * 0.00872664626 + 0.785398163);
  v19 = log(v18);
  v20.f64[0] = var1;
  v20.f64[1] = v19;
  v21 = (__n128)xmmword_19FFB32D0;
  __asm { FMOV            V1.2D, #0.5 }
  v27 = vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v20);
  v34 = v27;
  if (!a4)
  {
    v31 = v27;
    v32 = (_QWORD *)(v17 + 224);
    while (1)
    {
      v32 = (_QWORD *)*v32;
      if (!v32)
        goto LABEL_27;
      v28 = v32[3];
      if ((geo::containsPoint<double>(*(_QWORD *)(v28 + 40), *(_QWORD *)(v28 + 48), v31.f64[0], v31.f64[1]) & 1) != 0)
        goto LABEL_32;
    }
  }
  v21.n128_u32[0] = -1.0;
  if (v7)
    v21.n128_f32[0] = 0.0;
  v28 = md::VenueLogic::venueInProximityToWorldPoint(v17, &v34, v21);
  if (!v28)
    goto LABEL_27;
LABEL_32:
  v29 = -[VKVenueFeatureMarker initWithVenue:localize:]([VKVenueFeatureMarker alloc], "initWithVenue:localize:", v28, -[VKMapView localizeLabels](self, "localizeLabels"));
  return v29;
}

- (id)venueWithID:(unint64_t)a3
{
  int8x8_t *v3;
  int8x8_t v4;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint8x8_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t v19;
  VKVenueFeatureMarker *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v4 = v3[2];
  if (!*(_QWORD *)&v4)
    goto LABEL_46;
  v6 = (uint8x8_t)vcnt_s8(v4);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = 0xEC9B77B4222D22FFLL;
    if (*(_QWORD *)&v4 <= 0xEC9B77B4222D22FFLL)
      v7 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v4;
  }
  else
  {
    v7 = (*(_QWORD *)&v4 - 1) & 0xEC9B77B4222D22FFLL;
  }
  v8 = *(_QWORD **)(*(_QWORD *)&v3[1] + 8 * v7);
  if (!v8)
    goto LABEL_46;
  v9 = (_QWORD *)*v8;
  if (!v9)
    goto LABEL_46;
  if (v6.u32[0] < 2uLL)
  {
    v10 = *(_QWORD *)&v4 - 1;
    while (1)
    {
      v12 = v9[1];
      if (v12 == 0xEC9B77B4222D22FFLL)
      {
        if (v9[2] == 0xEC9B77B4222D22FFLL)
          goto LABEL_22;
      }
      else if ((v12 & v10) != v7)
      {
        goto LABEL_46;
      }
      v9 = (_QWORD *)*v9;
      if (!v9)
        goto LABEL_46;
    }
  }
  while (1)
  {
    v11 = v9[1];
    if (v11 == 0xEC9B77B4222D22FFLL)
      break;
    if (v11 >= *(_QWORD *)&v4)
      v11 %= *(_QWORD *)&v4;
    if (v11 != v7)
      goto LABEL_46;
LABEL_11:
    v9 = (_QWORD *)*v9;
    if (!v9)
      goto LABEL_46;
  }
  if (v9[2] != 0xEC9B77B4222D22FFLL)
    goto LABEL_11;
LABEL_22:
  v13 = v9[5];
  if (!v13)
    goto LABEL_46;
  v14 = *(_QWORD *)(v13 + 216);
  if (!v14)
    goto LABEL_46;
  v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
  v15.i16[0] = vaddlv_u8(v15);
  if (v15.u32[0] > 1uLL)
  {
    v16 = a3;
    if (v14 <= a3)
      v16 = a3 % v14;
  }
  else
  {
    v16 = (v14 - 1) & a3;
  }
  v17 = *(_QWORD **)(*(_QWORD *)(v13 + 208) + 8 * v16);
  if (!v17)
    goto LABEL_46;
  v18 = (_QWORD *)*v17;
  if (!v18)
    goto LABEL_46;
  if (v15.u32[0] < 2uLL)
  {
    v19 = v14 - 1;
    while (1)
    {
      v22 = v18[1];
      if (v22 == a3)
      {
        if (v18[2] == a3)
          goto LABEL_44;
      }
      else if ((v22 & v19) != v16)
      {
        goto LABEL_46;
      }
      v20 = 0;
      v18 = (_QWORD *)*v18;
      if (!v18)
        return v20;
    }
  }
  while (1)
  {
    v21 = v18[1];
    if (v21 == a3)
      break;
    if (v21 >= v14)
      v21 %= v14;
    if (v21 != v16)
      goto LABEL_46;
LABEL_33:
    v20 = 0;
    v18 = (_QWORD *)*v18;
    if (!v18)
      return v20;
  }
  if (v18[2] != a3)
    goto LABEL_33;
LABEL_44:
  v23 = v18[3];
  if (!v23)
  {
LABEL_46:
    v20 = 0;
    return v20;
  }
  v20 = -[VKVenueFeatureMarker initWithVenue:localize:]([VKVenueFeatureMarker alloc], "initWithVenue:localize:", v23, -[VKMapView localizeLabels](self, "localizeLabels"));
  return v20;
}

- (BOOL)displayedFloorIsDefaultForVenueBuilding:(id)a3
{
  id v4;
  void *v5;
  int8x8_t *v6;
  int8x8_t v7;
  uint8x8_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int8x8_t *v15;
  BOOL IsDefaultForVenueBuilding;

  v4 = a3;
  v5 = v4;
  v6 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v7 = v6[2];
  if (!*(_QWORD *)&v7)
    goto LABEL_26;
  v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = 0xEC9B77B4222D22FFLL;
    if (*(_QWORD *)&v7 <= 0xEC9B77B4222D22FFLL)
      v9 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v7;
  }
  else
  {
    v9 = (*(_QWORD *)&v7 - 1) & 0xEC9B77B4222D22FFLL;
  }
  v10 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
  if (!v10)
    goto LABEL_26;
  v11 = (_QWORD *)*v10;
  if (!v11)
    goto LABEL_26;
  if (v8.u32[0] < 2uLL)
  {
    v12 = *(_QWORD *)&v7 - 1;
    while (1)
    {
      v14 = v11[1];
      if (v14 == 0xEC9B77B4222D22FFLL)
      {
        if (v11[2] == 0xEC9B77B4222D22FFLL)
          goto LABEL_22;
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
    if (v13 == 0xEC9B77B4222D22FFLL)
      break;
    if (v13 >= *(_QWORD *)&v7)
      v13 %= *(_QWORD *)&v7;
    if (v13 != v9)
      goto LABEL_26;
LABEL_11:
    v11 = (_QWORD *)*v11;
    if (!v11)
      goto LABEL_26;
  }
  if (v11[2] != 0xEC9B77B4222D22FFLL)
    goto LABEL_11;
LABEL_22:
  v15 = (int8x8_t *)v11[5];
  if (!v15)
  {
LABEL_26:
    IsDefaultForVenueBuilding = 0;
    goto LABEL_27;
  }
  IsDefaultForVenueBuilding = 0;
  if (v4 && v15[7].i8[0])
    IsDefaultForVenueBuilding = md::VenueLogic::displayedFloorIsDefaultForVenueBuilding(v15, *(_QWORD *)(*(_QWORD *)objc_msgSend(v4, "venueBuildingFeatureMarker") + 56));
LABEL_27:

  return IsDefaultForVenueBuilding;
}

- (signed)defaultFloorOrdinalForVenueBuilding:(id)a3
{
  id v4;
  void *v5;
  int8x8_t *v6;
  int8x8_t v7;
  uint8x8_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  signed __int16 v15;

  v4 = a3;
  v5 = v4;
  v6 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v7 = v6[2];
  if (!*(_QWORD *)&v7)
    goto LABEL_21;
  v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = 0xEC9B77B4222D22FFLL;
    if (*(_QWORD *)&v7 <= 0xEC9B77B4222D22FFLL)
      v9 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v7;
  }
  else
  {
    v9 = (*(_QWORD *)&v7 - 1) & 0xEC9B77B4222D22FFLL;
  }
  v10 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
  if (!v10 || (v11 = (_QWORD *)*v10) == 0)
  {
LABEL_21:
    v15 = 0x8000;
    goto LABEL_22;
  }
  if (v8.u32[0] < 2uLL)
  {
    v12 = *(_QWORD *)&v7 - 1;
    while (1)
    {
      v14 = v11[1];
      if (v14 == 0xEC9B77B4222D22FFLL)
      {
        if (v11[2] == 0xEC9B77B4222D22FFLL)
          goto LABEL_23;
      }
      else if ((v14 & v12) != v9)
      {
        goto LABEL_21;
      }
      v11 = (_QWORD *)*v11;
      if (!v11)
        goto LABEL_21;
    }
  }
  while (1)
  {
    v13 = v11[1];
    if (v13 == 0xEC9B77B4222D22FFLL)
      break;
    if (v13 >= *(_QWORD *)&v7)
      v13 %= *(_QWORD *)&v7;
    if (v13 != v9)
      goto LABEL_21;
LABEL_11:
    v11 = (_QWORD *)*v11;
    if (!v11)
      goto LABEL_21;
  }
  if (v11[2] != 0xEC9B77B4222D22FFLL)
    goto LABEL_11;
LABEL_23:
  v15 = 0x8000;
  if (v4 && v11[5])
    v15 = *(_WORD *)(*(_QWORD *)objc_msgSend(v4, "venueBuildingFeatureMarker") + 88);
LABEL_22:

  return v15;
}

- (signed)displayedFloorOrdinalForVenueBuilding:(id)a3
{
  id v4;
  void *v5;
  int8x8_t *v6;
  int8x8_t v7;
  uint8x8_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int8x8_t *v15;
  signed __int16 v16;
  uint64_t v17;

  v4 = a3;
  v5 = v4;
  v6 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v7 = v6[2];
  if (!*(_QWORD *)&v7)
    goto LABEL_26;
  v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = 0xEC9B77B4222D22FFLL;
    if (*(_QWORD *)&v7 <= 0xEC9B77B4222D22FFLL)
      v9 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v7;
  }
  else
  {
    v9 = (*(_QWORD *)&v7 - 1) & 0xEC9B77B4222D22FFLL;
  }
  v10 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
  if (!v10)
    goto LABEL_26;
  v11 = (_QWORD *)*v10;
  if (!v11)
    goto LABEL_26;
  if (v8.u32[0] < 2uLL)
  {
    v12 = *(_QWORD *)&v7 - 1;
    while (1)
    {
      v14 = v11[1];
      if (v14 == 0xEC9B77B4222D22FFLL)
      {
        if (v11[2] == 0xEC9B77B4222D22FFLL)
          goto LABEL_22;
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
    if (v13 == 0xEC9B77B4222D22FFLL)
      break;
    if (v13 >= *(_QWORD *)&v7)
      v13 %= *(_QWORD *)&v7;
    if (v13 != v9)
      goto LABEL_26;
LABEL_11:
    v11 = (_QWORD *)*v11;
    if (!v11)
      goto LABEL_26;
  }
  if (v11[2] != 0xEC9B77B4222D22FFLL)
    goto LABEL_11;
LABEL_22:
  v15 = (int8x8_t *)v11[5];
  if (!v15)
  {
LABEL_26:
    v16 = 0x8000;
    goto LABEL_27;
  }
  v16 = 0x8000;
  if (v4 && v15[7].i8[0])
  {
    v17 = objc_msgSend(v4, "venueBuildingFeatureMarker");
    v16 = md::VenueLogic::displayedFloorOrdinalForVenueBuilding(v15, *(_QWORD *)(*(_QWORD *)v17 + 56), *(_WORD *)(*(_QWORD *)v17 + 88));
  }
LABEL_27:

  return v16;
}

- (void)setDisplayedFloorOrdinal:(signed __int16)a3 forVenueBuilding:(id)a4
{
  int8x8_t *v6;
  int8x8_t v7;
  uint8x8_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = a4;
  v6 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v7 = v6[2];
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8(v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v9 = 0xEC9B77B4222D22FFLL;
      if (*(_QWORD *)&v7 <= 0xEC9B77B4222D22FFLL)
        v9 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v7;
    }
    else
    {
      v9 = (*(_QWORD *)&v7 - 1) & 0xEC9B77B4222D22FFLL;
    }
    v10 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
    if (v10)
    {
      v11 = (_QWORD *)*v10;
      if (v11)
      {
        if (v8.u32[0] < 2uLL)
        {
          v12 = *(_QWORD *)&v7 - 1;
          while (1)
          {
            v14 = v11[1];
            if (v14 == 0xEC9B77B4222D22FFLL)
            {
              if (v11[2] == 0xEC9B77B4222D22FFLL)
                goto LABEL_22;
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
        do
        {
          v13 = v11[1];
          if (v13 == 0xEC9B77B4222D22FFLL)
          {
            if (v11[2] == 0xEC9B77B4222D22FFLL)
            {
LABEL_22:
              v15 = v11[5];
              if (v15 && v17 && *(_BYTE *)(v15 + 56))
              {
                v16 = objc_msgSend(v17, "venueBuildingFeatureMarker");
                md::VenueLogic::setDisplayedFloorOrdinalForVenueBuilding((_QWORD *)v15, *(_QWORD *)(*(_QWORD *)v16 + 56), *(_WORD *)(*(_QWORD *)v16 + 88), a3);
              }
              break;
            }
          }
          else
          {
            if (v13 >= *(_QWORD *)&v7)
              v13 %= *(_QWORD *)&v7;
            if (v13 != v9)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
LABEL_26:
  -[VKMapView setNeedsLayout](self, "setNeedsLayout");

}

- (id)clearVenueBuildingFloorSelections
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  _QWORD *v19;
  _QWORD *v20;
  char *v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _BYTE *v30;
  char *v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD *v36;
  char *v37;
  uint64_t v38;
  __int128 v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  char *v45;
  VKVenueBuildingFeatureMarker *v46;
  uint64_t v47;
  _QWORD *v48;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    goto LABEL_28;
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = 0xEC9B77B4222D22FFLL;
    if (*(_QWORD *)&v3 <= 0xEC9B77B4222D22FFLL)
      v6 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v3;
  }
  else
  {
    v6 = (*(_QWORD *)&v3 - 1) & 0xEC9B77B4222D22FFLL;
  }
  v7 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v6);
  if (!v7)
    goto LABEL_28;
  v8 = (_QWORD *)*v7;
  if (!v8)
    goto LABEL_28;
  if (v5.u32[0] < 2uLL)
  {
    v9 = *(_QWORD *)&v3 - 1;
    v10 = (void *)MEMORY[0x1E0C9AA60];
    while (1)
    {
      v11 = v8[1];
      if (v11 == 0xEC9B77B4222D22FFLL)
      {
        if (v8[2] == 0xEC9B77B4222D22FFLL)
          goto LABEL_23;
      }
      else if ((v11 & v9) != v6)
      {
        return v10;
      }
      v8 = (_QWORD *)*v8;
      if (!v8)
        return v10;
    }
  }
  v10 = (void *)MEMORY[0x1E0C9AA60];
  while (1)
  {
    v12 = v8[1];
    if (v12 == 0xEC9B77B4222D22FFLL)
      break;
    if (v12 >= *(_QWORD *)&v3)
      v12 %= *(_QWORD *)&v3;
    if (v12 != v6)
      return v10;
LABEL_17:
    v8 = (_QWORD *)*v8;
    if (!v8)
      return v10;
  }
  if (v8[2] != 0xEC9B77B4222D22FFLL)
    goto LABEL_17;
LABEL_23:
  v13 = v8[5];
  if (!v13 || !*(_BYTE *)(v13 + 56))
  {
LABEL_28:
    v10 = (void *)MEMORY[0x1E0C9AA60];
    return v10;
  }
  v14 = *(_QWORD *)(v13 + 272);
  if (v14)
  {
    if (v14 >> 61)
      abort();
    v15 = (char *)operator new(8 * v14);
    v16 = &v15[8 * v14];
    v17 = v15;
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }
  v19 = *(_QWORD **)(v13 + 264);
  if (v19)
  {
    v20 = (_QWORD *)(v13 + 224);
    v21 = v17;
    v22 = v17;
    v47 = v13;
    v48 = (_QWORD *)(v13 + 224);
    do
    {
      v23 = v20;
      while (1)
      {
        v23 = (_QWORD *)*v23;
        if (!v23)
          break;
        v24 = v23[3];
        v26 = *(_QWORD *)(v24 + 16);
        v25 = *(_QWORD *)(v24 + 24);
        if (v26 != v25)
        {
          while (*(_QWORD *)(v26 + 24) != v19[2])
          {
            v26 += 120;
            if (v26 == v25)
            {
              v26 = v25;
              break;
            }
          }
        }
        if (v26 != v25)
        {
          if (!v26)
            break;
          if (v22 < v16)
          {
            *(_QWORD *)v22 = v26;
            v22 += 8;
            v21 = v22;
            break;
          }
          v27 = (v22 - v17) >> 3;
          v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 61)
            abort();
          if ((v16 - v17) >> 2 > v28)
            v28 = (v16 - v17) >> 2;
          if ((unint64_t)(v16 - v17) >= 0x7FFFFFFFFFFFFFF8)
            v29 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v29 = v28;
          if (v29)
          {
            if (v29 >> 61)
              std::__throw_bad_array_new_length[abi:nn180100]();
            v30 = operator new(8 * v29);
          }
          else
          {
            v30 = 0;
          }
          v31 = &v30[8 * v27];
          *(_QWORD *)v31 = v26;
          v21 = v31 + 8;
          if (v22 != v17)
          {
            v32 = v22 - 8 - v17;
            if (v32 < 0x168)
            {
              v33 = v22;
              goto LABEL_57;
            }
            if (&v30[v22 - v17 - 8 - (v32 & 0xFFFFFFFFFFFFFFF8)] > &v30[v22 - v17 - 8])
            {
              v33 = v22;
              goto LABEL_57;
            }
            if (&v22[-(v32 & 0xFFFFFFFFFFFFFFF8) - 8] > v22 - 8)
            {
              v33 = v22;
              goto LABEL_57;
            }
            if ((unint64_t)(v17 - v30) < 0x20)
            {
              v33 = v22;
              goto LABEL_57;
            }
            v35 = (v32 >> 3) + 1;
            v33 = &v22[-8 * (v35 & 0x3FFFFFFFFFFFFFFCLL)];
            v36 = &v30[8 * v27 - 16];
            v37 = v22 - 16;
            v38 = v35 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v39 = *(_OWORD *)v37;
              *(v36 - 1) = *((_OWORD *)v37 - 1);
              *v36 = v39;
              v36 -= 2;
              v37 -= 32;
              v38 -= 4;
            }
            while (v38);
            v31 -= 8 * (v35 & 0x3FFFFFFFFFFFFFFCLL);
            if (v35 != (v35 & 0x3FFFFFFFFFFFFFFCLL))
            {
              do
              {
LABEL_57:
                v34 = *((_QWORD *)v33 - 1);
                v33 -= 8;
                *((_QWORD *)v31 - 1) = v34;
                v31 -= 8;
              }
              while (v33 != v17);
            }
          }
          v16 = &v30[8 * v29];
          if (v17)
            operator delete(v17);
          v17 = v31;
          v22 = v21;
          v20 = v48;
          break;
        }
      }
      v19 = (_QWORD *)*v19;
    }
    while (v19);
    v13 = v47;
    v14 = *(_QWORD *)(v47 + 272);
  }
  else
  {
    v21 = v17;
  }
  if (v14)
  {
    v40 = *(_QWORD **)(v13 + 264);
    if (v40)
    {
      do
      {
        v41 = (_QWORD *)*v40;
        operator delete(v40);
        v40 = v41;
      }
      while (v41);
    }
    *(_QWORD *)(v13 + 264) = 0;
    v42 = *(_QWORD *)(v13 + 256);
    if (v42)
    {
      for (i = 0; i != v42; ++i)
        *(_QWORD *)(*(_QWORD *)(v13 + 248) + 8 * i) = 0;
    }
    *(_QWORD *)(v13 + 272) = 0;
  }
  v44 = *(_QWORD *)(v13 + 784);
  if (v44)
    (*(void (**)(uint64_t))(*(_QWORD *)v44 + 48))(v44);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (v21 - v17) >> 3, v47);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 != v21)
  {
    v45 = v17;
    do
    {
      v46 = -[VKVenueBuildingFeatureMarker initWithVenueBuilding:localize:]([VKVenueBuildingFeatureMarker alloc], "initWithVenueBuilding:localize:", *(_QWORD *)v45, -[VKMapView localizeLabels](self, "localizeLabels"));
      objc_msgSend(v10, "addObject:", v46);

      v45 += 8;
    }
    while (v45 != v21);
  }
  -[VKMapView setNeedsLayout](self, "setNeedsLayout");
  if (v17)
    operator delete(v17);
  return v10;
}

- (float)zoomToRevealVenueFloorplan:(id)a3
{
  return 16.0;
}

- (float)zoomToRevealVenueBuildingFloorplan:(id)a3
{
  return 16.0;
}

- (void)_setFloorSwitcherZoomPadding:(float)a3
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

  v3 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v4 = v3[2];
  if (v4)
  {
    v5 = (uint8x8_t)vcnt_s8(v4);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      v6 = 0xEC9B77B4222D22FFLL;
      if (*(_QWORD *)&v4 <= 0xEC9B77B4222D22FFLL)
        v6 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v4;
    }
    else
    {
      v6 = (*(_QWORD *)&v4 - 1) & 0xEC9B77B4222D22FFLL;
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
            if (v11 == 0xEC9B77B4222D22FFLL)
            {
              if (v8[2] == 0xEC9B77B4222D22FFLL)
                goto LABEL_22;
            }
            else if ((v11 & v9) != v6)
            {
              goto LABEL_16;
            }
            v8 = (_QWORD *)*v8;
            if (!v8)
              goto LABEL_16;
          }
        }
        do
        {
          v10 = v8[1];
          if (v10 == 0xEC9B77B4222D22FFLL)
          {
            if (v8[2] == 0xEC9B77B4222D22FFLL)
            {
LABEL_22:
              v12 = v8[5];
              if (v12)
                *(float *)(v12 + 692) = a3;
              break;
            }
          }
          else
          {
            if (v10 >= *(_QWORD *)&v4)
              v10 %= *(_QWORD *)&v4;
            if (v10 != v6)
              break;
          }
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
    }
  }
LABEL_16:
  -[VKMapView setNeedsLayout](self, "setNeedsLayout");
}

- (void)nearestVenueDidChange:(const void *)a3 building:(const void *)a4
{
  VKVenueFeatureMarker *v7;
  VKVenueBuildingFeatureMarker *v8;
  id v9;

  -[VKMapView mapDelegate](self, "mapDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v7 = -[VKVenueFeatureMarker initWithVenue:localize:]([VKVenueFeatureMarker alloc], "initWithVenue:localize:", a3, -[VKMapView localizeLabels](self, "localizeLabels"));
    if (a4)
    {
LABEL_3:
      v8 = -[VKVenueBuildingFeatureMarker initWithVenueBuilding:localize:]([VKVenueBuildingFeatureMarker alloc], "initWithVenueBuilding:localize:", a4, -[VKMapView localizeLabels](self, "localizeLabels"));
      goto LABEL_6;
    }
  }
  else
  {
    v7 = 0;
    if (a4)
      goto LABEL_3;
  }
  v8 = 0;
LABEL_6:
  objc_msgSend(v9, "mapLayer:venueWithFocusDidChange:building:", self, v7, v8);
  if (a4)

  if (a3)
}

- (void)location:(id)a3 isInHikingContextualRegion:(BOOL)a4
{
  _QWORD v4[5];
  $F24F406B2B787EFB06265DBA3D28CBD5 v5;
  BOOL v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__VKMapView_location_isInHikingContextualRegion___block_invoke;
  v4[3] = &unk_1E42EB1F8;
  v4[4] = self;
  v6 = a4;
  v5 = a3;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v4);
}

- (void)setClientLocalizedStrings:(id)a3
{
  VKClientLocalizedStrings *v4;

  v4 = (VKClientLocalizedStrings *)a3;
  md::LabelSettings::setClientLocalizedStrings((md::LabelSettings *)-[VKMapView _labelSettings](self, "_labelSettings"), v4);

}

- (void)setDesiredMapMode:(int64_t)a3
{
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  int8x8_t *v8;
  int8x8_t v9;
  uint8x8_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  BOOL v20;
  int v21;
  int v22;
  _BOOL4 v23;
  BOOL v24;
  BOOL v25;
  void *v26;
  float v27;
  float v28;
  float v29;
  uint64_t v30;
  _QWORD v31[6];
  uint8_t buf[4];
  VKMapView *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = (void *)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 + 1) > 5)
      v6 = &stru_1E4315B30;
    else
      v6 = off_1E42EB3A0[a3 + 1];
    *(_DWORD *)buf = 134218242;
    v33 = self;
    v34 = 2112;
    v35 = v6;
    v7 = v5;
    _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set desired map mode: %@", buf, 0x16u);

  }
  v8 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  if (v8)
  {
    v9 = v8[2];
    if (v9)
    {
      v10 = (uint8x8_t)vcnt_s8(v9);
      v10.i16[0] = vaddlv_u8(v10);
      if (v10.u32[0] > 1uLL)
      {
        v11 = 0x2FED70A4459DFCA1;
        if (*(_QWORD *)&v9 <= 0x2FED70A4459DFCA1uLL)
          v11 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v9;
      }
      else
      {
        v11 = (*(_QWORD *)&v9 - 1) & 0x2FED70A4459DFCA1;
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
              if (v16 == 0x2FED70A4459DFCA1)
              {
                if (v13[2] == 0x2FED70A4459DFCA1)
                  goto LABEL_30;
              }
              else if ((v16 & v14) != v11)
              {
                goto LABEL_45;
              }
              v13 = (_QWORD *)*v13;
              if (!v13)
                goto LABEL_45;
            }
          }
          do
          {
            v15 = v13[1];
            if (v15 == 0x2FED70A4459DFCA1)
            {
              if (v13[2] == 0x2FED70A4459DFCA1)
              {
LABEL_30:
                v17 = v13[5];
                if (v17)
                {
                  v18 = 3;
                  switch(a3)
                  {
                    case 1:
                      goto LABEL_39;
                    case 2:
                      v18 = 5;
                      goto LABEL_39;
                    case 3:
                      v22 = *(unsigned __int8 *)(v17 + 167);
                      v20 = v22 != 6;
                      if (!*(_BYTE *)(v17 + 167))
                      {
                        v21 = 6;
                        goto LABEL_44;
                      }
                      v23 = v22 != 6;
                      md::StyleLogic::setMapMode(v13[5], 6, 0.0);
                      if (v23)
                        goto LABEL_45;
                      return;
                    case 4:
                      v18 = 7;
LABEL_39:
                      v24 = v18 == *(unsigned __int8 *)(v17 + 167);
                      md::StyleLogic::setMapMode(v13[5], v18, 0.0);
                      if (v24)
                        return;
                      goto LABEL_45;
                    default:
                      v19 = *(unsigned __int8 *)(v17 + 167);
                      v20 = *(_BYTE *)(v17 + 167) != 0;
                      if (v19 != 6)
                      {
                        v25 = v19 != 0;
                        md::StyleLogic::setMapMode(v13[5], 0, 0.0);
                        if (v25)
                          goto LABEL_45;
                        return;
                      }
                      v21 = 0;
LABEL_44:
                      +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "transitionTimeMultiplier");
                      v28 = v27;

                      v29 = v28 * 0.6;
                      md::StyleLogic::setMapMode(v17, v21, v29);
                      if (!v20)
                        return;
                      break;
                  }
                }
                break;
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
  }
LABEL_45:
  -[VKMapView setLoadMuninMetadata:](self, "setLoadMuninMetadata:", a3 == 3);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __31__VKMapView_setDesiredMapMode___block_invoke;
  v31[3] = &unk_1E42EB1D0;
  v31[4] = self;
  v31[5] = a3;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v31);
  v30 = *((_QWORD *)self + 48);
  buf[0] = 1;
  md::MapEngine::setNeedsTick(v30, buf);
}

- (void)_createGlobe
{
  VKClassicGlobeCanvas *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t (**v17)();
  id v18;

  if (!*((_QWORD *)self + 6))
  {
    v3 = -[VKClassicGlobeCanvas initWithMapEngine:inBackground:]([VKClassicGlobeCanvas alloc], "initWithMapEngine:inBackground:", *((_QWORD *)self + 48), 0);
    v4 = (void *)*((_QWORD *)self + 6);
    *((_QWORD *)self + 6) = v3;

    objc_msgSend(*((id *)self + 6), "setDelegate:", self);
    objc_msgSend(*((id *)self + 6), "setMapDelegate:", self);
    v5 = (void *)*((_QWORD *)self + 6);
    v17 = &off_1E42B54B0;
    v18 = *((id *)self + 57);
    objc_msgSend(v5, "setVkCamera:", &v17);
    v17 = &off_1E42B54B0;

    v6 = (void *)*((_QWORD *)self + 6);
    v7 = *((_QWORD *)self + 48);
    v8 = *(_QWORD *)(v7 + 1064);
    v9 = *(std::__shared_weak_count **)(v7 + 1072);
    v15 = v8;
    v16 = v9;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    objc_msgSend(v6, "setCamera:", &v15);
    v12 = v16;
    if (v16)
    {
      v13 = (unint64_t *)&v16->__shared_owners_;
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
}

- (BOOL)supportsNightMode
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  BOOL v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v22;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    goto LABEL_21;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v3 <= 0x2FED70A4459DFCA1uLL)
      v5 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0x2FED70A4459DFCA1;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6 || (v7 = (_QWORD *)*v6) == 0)
  {
LABEL_21:
    v11 = 0;
    v12 = MEMORY[0x100];
    if (!MEMORY[0x100])
      goto LABEL_22;
    goto LABEL_23;
  }
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0x2FED70A4459DFCA1)
      {
        if (v7[2] == 0x2FED70A4459DFCA1)
          goto LABEL_37;
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_21;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        goto LABEL_21;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0x2FED70A4459DFCA1)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      goto LABEL_21;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      goto LABEL_21;
  }
  if (v7[2] != 0x2FED70A4459DFCA1)
    goto LABEL_11;
LABEL_37:
  v11 = v7[5];
  v12 = *(_QWORD *)(v11 + 256);
  if (!v12)
  {
LABEL_22:
    md::StyleLogic::updateConfiguration((md::StyleLogic *)v11, *(_DWORD *)(v11 + 1096));
    v12 = *(_QWORD *)(v11 + 256);
  }
LABEL_23:
  v13 = *(std::__shared_weak_count **)(v11 + 264);
  v22 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  if (!v12)
  {
    v18 = 0;
    if (!v13)
      return v18;
    goto LABEL_32;
  }
  v16 = *(_QWORD *)(v12 + 16);
  v17 = atomic_load((unsigned __int8 *)(v16 + 2784));
  if ((v17 & 1) == 0)
    std::__assoc_sub_state::wait(*(std::__assoc_sub_state **)(v16 + 2808));
  v18 = *(_BYTE *)(v16 + 136) != 0;
  v13 = v22;
  if (v22)
  {
LABEL_32:
    v19 = (unint64_t *)&v13->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *, SEL))v13->__on_zero_shared)(v13, a2);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return v18;
}

- (void)setMapType:(int)a3
{
  -[VKMapView setMapType:animated:](self, "setMapType:animated:", *(_QWORD *)&a3, 1);
}

- (void)setMapDisplayStyle:(id)a3 animated:(BOOL)a4
{
  -[VKMapView setMapDisplayStyle:animated:duration:](self, "setMapDisplayStyle:animated:duration:", *(_QWORD *)&a3.var0 & 0xFFFFFFFFFFFFLL, a4, 1.0);
}

- (GEOMapRegion)mapRegionIgnoringEdgeInsets
{
  void *v2;
  void *v3;
  void *v4;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapRegionIgnoringEdgeInsets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapRegion *)v4;
}

- (id)consoleString:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "consoleString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initShouldRasterize:(BOOL)a3 inBackground:(BOOL)a4 contentScale:(double)a5 auditToken:(id)a6 mapViewPurpose:(int64_t)a7
{
  return -[VKMapView initShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:](self, "initShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:", a3, a4, a6, a7, 1, a5);
}

- (id)initShouldRasterize:(BOOL)a3 inBackground:(BOOL)a4 contentScale:(double)a5 auditToken:(id)a6 mapViewPurpose:(int64_t)a7 allowsAntialiasing:(BOOL)a8
{
  void *v9;
  VKMapView *v10;

  +[VKMapViewDescriptor descriptorWithShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:](VKMapViewDescriptor, "descriptorWithShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:", a3, a4, a6, a7, a8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VKMapView initWithDescriptor:](self, "initWithDescriptor:", v9);

  return v10;
}

- (VKMapView)initWithLayer:(id)a3
{
  VKMapView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKMapView;
  result = -[VKMapView initWithLayer:](&v4, sel_initWithLayer_, a3);
  if (result)
    *((_BYTE *)result + 528) = 1;
  return result;
}

- (void)dealloc
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  VKMapView *v28;
  __int16 v29;
  VKMapView *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*((_QWORD *)self + 73);
  if (v3)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(v4);
          MapsFeature_RemoveBlockListener();
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v5);
    }

  }
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v8 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v28 = self;
    v29 = 2048;
    v30 = self;
    _os_log_impl(&dword_19F029000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Destroying map view(%p)", buf, 0x16u);
  }
  v9 = (void *)*((_QWORD *)self + 54);
  if (v9)
  {
    *((_QWORD *)self + 54) = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  -[VKMapView _shutdownThermalMonitor](self, "_shutdownThermalMonitor");
  -[VKMapView _closeLoaderConnection:](self, "_closeLoaderConnection:", 1);
  v11 = (void *)*((_QWORD *)self + 40);
  *((_QWORD *)self + 40) = 0;

  v12 = (void *)*((_QWORD *)self + 59);
  *((_QWORD *)self + 59) = 0;

  v13 = (void *)*((_QWORD *)self + 31);
  if (v13)
    objc_msgSend(v13, "setMapEngine:", 0);
  v14 = (void *)*((_QWORD *)self + 35);
  if (v14)
  {
    *((_QWORD *)self + 35) = 0;

  }
  objc_msgSend(*((id *)self + 6), "setDelegate:", 0);
  objc_msgSend(*((id *)self + 6), "setMapDelegate:", 0);
  objc_msgSend(*((id *)self + 6), "willDealloc");
  v15 = (void *)*((_QWORD *)self + 6);
  *((_QWORD *)self + 6) = 0;

  objc_msgSend(*((id *)self + 5), "setDelegate:", 0);
  objc_msgSend(*((id *)self + 5), "setMapDelegate:", 0);
  v16 = (void *)*((_QWORD *)self + 5);
  *((_QWORD *)self + 5) = 0;

  objc_msgSend(*((id *)self + 28), "setDelegate:", 0);
  objc_msgSend(*((id *)self + 28), "stop");
  v17 = (void *)*((_QWORD *)self + 33);
  *((_QWORD *)self + 33) = 0;

  v18 = (void *)*((_QWORD *)self + 19);
  if (v18)
  {
    objc_msgSend(v18, "stop");
    v19 = (void *)*((_QWORD *)self + 19);
    *((_QWORD *)self + 19) = 0;

  }
  v20 = (void *)*((_QWORD *)self + 51);
  *((_QWORD *)self + 51) = 0;

  objc_storeWeak((id *)self + 77, 0);
  v21 = *((_QWORD *)self + 48);
  *((_QWORD *)self + 48) = 0;
  if (v21)
    md::MapEngineDeleter::operator()(v21);
  v22.receiver = self;
  v22.super_class = (Class)VKMapView;
  -[VKMapView dealloc](&v22, sel_dealloc);
}

- (id)activeLogics
{
  void *v3;
  id result;

  v3 = *(void **)(a1 + 8);
  *a2 = &off_1E42C7598;
  result = v3;
  a2[1] = result;
  return result;
}

- (void)renderInContext:(CGContext *)a3
{
  md::HomeQueueScheduler **v4;
  double v5;
  objc_super v6;

  if (*((_BYTE *)self + 528))
  {
    v6.receiver = self;
    v6.super_class = (Class)VKMapView;
    -[VKMapView renderInContext:](&v6, sel_renderInContext_, a3);
  }
  else
  {
    v4 = (md::HomeQueueScheduler **)*((_QWORD *)self + 48);
    if (v4)
    {
      md::HomeQueueScheduler::waitForSynchronization(v4[567], "-[VKMapView renderInContext:]");
      v5 = CACurrentMediaTime();
      md::MapEngine::renderSceneInContextSync((md::MapEngine *)v4, a3, v5);
    }
  }
}

- (void)runAnimation:(id)a3
{
  md::MapEngine *v3;
  id v4;

  v3 = (md::MapEngine *)*((_QWORD *)self + 48);
  v4 = a3;
  (*(void (**)(_QWORD *))(**((_QWORD **)v3 + 13) + 24))(*((_QWORD **)v3 + 13));
  md::MapEngine::updateRunLoopStatus(v3);

}

- (void)setYaw:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  _BYTE v11[22];
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v7 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v8 = "NO";
    *(_DWORD *)v11 = 134218498;
    *(_QWORD *)&v11[4] = self;
    if (v4)
      v8 = "YES";
    *(_WORD *)&v11[12] = 2048;
    *(double *)&v11[14] = a3;
    v12 = 2080;
    v13 = v8;
    _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set yaw: %f, animated: %s", v11, 0x20u);
  }
  -[VKMapView currentCanvas](self, "currentCanvas", *(_OWORD *)v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cameraController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "setYaw:animated:", v4, a3);

}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  VKMapView *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v9 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v12 = 134218754;
    v13 = self;
    v14 = 2112;
    v15 = v8;
    v16 = 2048;
    v17 = a4;
    v18 = 2048;
    v19 = a5;
    _os_log_impl(&dword_19F029000, v9, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set map region: %@, pitch: %f, yaw: %f", (uint8_t *)&v12, 0x2Au);
  }
  -[VKMapView currentCanvas](self, "currentCanvas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cameraController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v11, "setMapRegion:pitch:yaw:duration:timingCurve:completion:", v8, 0, 0, a4, a5, 0.0);

}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 completion:(id)a7
{
  -[VKMapView setMapRegion:pitch:yaw:duration:timingCurve:completion:](self, "setMapRegion:pitch:yaw:duration:timingCurve:completion:", a3, 0, a7, a4, a5, a6);
}

- (double)durationToAnimateToMapRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v7 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "durationToAnimateToMapRegion:", v4);
    v7 = v8;
  }

  return v7;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPoint:(CGPoint)a3 toCoordinateFromLayer:(id)a4
{
  double y;
  double x;
  VKMapView *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  y = a3.y;
  x = a3.x;
  v7 = (VKMapView *)a4;
  if (v7 != self)
  {
    -[VKMapView convertPoint:fromLayer:](self, "convertPoint:fromLayer:", v7, x, y);
    x = v8;
    y = v9;
  }
  -[VKMapView currentCanvas](self, "currentCanvas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPointToCoordinate:", x, y);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)convertPoint:(CGPoint)a3 toMapPointFromLayer:(id)a4
{
  double y;
  double x;
  VKMapView *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  y = a3.y;
  x = a3.x;
  v7 = (VKMapView *)a4;
  if (v7 != self)
  {
    -[VKMapView convertPoint:fromLayer:](self, "convertPoint:fromLayer:", v7, x, y);
    x = v8;
    y = v9;
  }
  -[VKMapView currentCanvas](self, "currentCanvas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPointToMapPoint:", x, y);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (CGPoint)convertMapPoint:(id)a3 toPointToLayer:(id)a4
{
  double var1;
  double var0;
  id v7;
  void *v8;
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
  CGPoint result;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertMapPointToPoint:", var0, var1);
  v10 = v9;
  v12 = v11;

  -[VKMapView convertPoint:toLayer:](self, "convertPoint:toLayer:", v7, v10, v12);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)convertCoordinate:(id)a3 toPointToLayer:(id)a4
{
  double var1;
  double var0;
  id v7;
  void *v8;
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
  CGPoint result;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertCoordinateToPoint:", var0, var1);
  v10 = v9;
  v12 = v11;

  -[VKMapView convertPoint:toLayer:](self, "convertPoint:toLayer:", v7, v10, v12);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)convertCoordinate:(id)a3 toCameraModelPointToLayer:(id)a4
{
  double var1;
  double var0;
  id v7;
  void *v8;
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
  CGPoint result;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertCoordinateToCameraModelPoint:", var0, var1);
  v10 = v9;
  v12 = v11;

  -[VKMapView convertPoint:toLayer:](self, "convertPoint:toLayer:", v7, v10, v12);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (double)distanceFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 fromLayer:(id)a5 withPrecision:(int64_t)a6
{
  double y;
  double x;
  double v9;
  double v10;
  VKMapView *v12;
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
  double v25;
  double v26;

  y = a4.y;
  x = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  v12 = (VKMapView *)a5;
  if (-[VKMapView flyoverMode](self, "flyoverMode") == -1)
  {
    -[VKMapView convertPoint:toCoordinateFromLayer:](self, "convertPoint:toCoordinateFromLayer:", v12, v10, v9);
    v18 = v23;
    v20 = v24;
    -[VKMapView convertPoint:toCoordinateFromLayer:](self, "convertPoint:toCoordinateFromLayer:", v12, x, y);
  }
  else
  {
    if (v12 != self)
    {
      -[VKMapView convertPoint:fromLayer:](self, "convertPoint:fromLayer:", v12, v10, v9);
      v10 = v13;
      v9 = v14;
      -[VKMapView convertPoint:fromLayer:](self, "convertPoint:fromLayer:", v12, x, y);
      x = v15;
      y = v16;
    }
    objc_msgSend(*((id *)self + 6), "convertPointToCoordinateOnSphere:", v10, v9);
    v18 = v17;
    v20 = v19;
    objc_msgSend(*((id *)self + 6), "convertPointToCoordinateOnSphere:", x, y);
  }
  v25 = 0.0;
  if (v18 <= 90.0
    && v18 >= -90.0
    && v20 <= 180.0
    && v20 >= -180.0
    && v21 <= 90.0
    && v21 >= -90.0
    && v22 <= 180.0
    && v22 >= -180.0)
  {
    if (a6)
      GEOCalculateDistanceHighPrecision();
    else
      GEOCalculateDistance();
    v25 = v26;
  }

  return v25;
}

- (void)setFullyOccludedEdgeInsets:(VKEdgeInsets)a3
{
  float right;
  float bottom;
  float left;
  float top;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  VKMapView *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v24 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v8 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v14 = 134219008;
    v15 = self;
    v16 = 2048;
    v17 = top;
    v18 = 2048;
    v19 = bottom;
    v20 = 2048;
    v21 = left;
    v22 = 2048;
    v23 = right;
    _os_log_impl(&dword_19F029000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set fully occluded edge insets: top: %f, bottom: %f, left: %f, right: %f", (uint8_t *)&v14, 0x34u);
  }
  -[VKMapView currentCanvas](self, "currentCanvas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = top;
  *(float *)&v11 = left;
  *(float *)&v12 = bottom;
  *(float *)&v13 = right;
  objc_msgSend(v9, "setFullyOccludedEdgeInsets:", v10, v11, v12, v13);

}

- (VKEdgeInsets)fullyOccludedEdgeInsets
{
  void *v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  VKEdgeInsets result;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullyOccludedEdgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setLabelEdgeInsets:(VKEdgeInsets)a3
{
  float right;
  float bottom;
  float left;
  float top;
  NSObject *v8;
  float *v9;
  int v10;
  VKMapView *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v20 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v8 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v10 = 134219008;
    v11 = self;
    v12 = 2048;
    v13 = top;
    v14 = 2048;
    v15 = bottom;
    v16 = 2048;
    v17 = left;
    v18 = 2048;
    v19 = right;
    _os_log_impl(&dword_19F029000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set label edge insets: top: %f, bottom: %f, left: %f, right: %f", (uint8_t *)&v10, 0x34u);
  }
  v9 = (float *)*((_QWORD *)self + 48);
  v9[232] = top;
  v9[233] = left;
  v9[234] = bottom;
  v9[235] = right;
  LOBYTE(v10) = 1;
  md::MapEngine::setNeedsTick((uint64_t)v9, &v10);
}

- (VKEdgeInsets)labelEdgeInsets
{
  float *v2;
  float v3;
  float v4;
  float v5;
  float v6;
  VKEdgeInsets result;

  v2 = (float *)*((_QWORD *)self + 48);
  v3 = v2[232];
  v4 = v2[233];
  v5 = v2[234];
  v6 = v2[235];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setLabelEdgeWidths:(VKEdgeInsets)a3
{
  float right;
  float bottom;
  float left;
  float top;
  NSObject *v8;
  float *v9;
  int v10;
  VKMapView *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v20 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v8 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v10 = 134219008;
    v11 = self;
    v12 = 2048;
    v13 = top;
    v14 = 2048;
    v15 = bottom;
    v16 = 2048;
    v17 = left;
    v18 = 2048;
    v19 = right;
    _os_log_impl(&dword_19F029000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set label edge widths: top: %f, bottom: %f, left: %f, right: %f", (uint8_t *)&v10, 0x34u);
  }
  v9 = (float *)*((_QWORD *)self + 48);
  v9[236] = top;
  v9[237] = left;
  v9[238] = bottom;
  v9[239] = right;
  LOBYTE(v10) = 1;
  md::MapEngine::setNeedsTick((uint64_t)v9, &v10);
}

- (VKEdgeInsets)labelEdgeWidths
{
  float *v2;
  float v3;
  float v4;
  float v5;
  float v6;
  VKEdgeInsets result;

  v2 = (float *)*((_QWORD *)self + 48);
  v3 = v2[236];
  v4 = v2[237];
  v5 = v2[238];
  v6 = v2[239];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setCameraFramingInsets:(VKEdgeInsets)a3
{
  float right;
  float bottom;
  float left;
  float top;
  NSObject *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  VKMapView *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v23 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v8 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v13 = 134219008;
    v14 = self;
    v15 = 2048;
    v16 = top;
    v17 = 2048;
    v18 = bottom;
    v19 = 2048;
    v20 = left;
    v21 = 2048;
    v22 = right;
    _os_log_impl(&dword_19F029000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set camera framing edge insets: top: %f, bottom: %f, left: %f, right: %f", (uint8_t *)&v13, 0x34u);
  }
  *(float *)&v9 = top;
  *(float *)&v10 = left;
  *(float *)&v11 = bottom;
  *(float *)&v12 = right;
  objc_msgSend(*((id *)self + 33), "setClientFramingInsets:", v9, v10, v11, v12);
}

- (BOOL)isFlyoverUnificationEnabled
{
  return *(_BYTE *)(*((_QWORD *)self + 48) + 1241);
}

- (BOOL)canShowFlyoverAnimation
{
  return -[VKMapView mapType](self, "mapType") == 3
      || -[VKMapView mapType](self, "mapType") == 4
      || -[VKMapView mapType](self, "mapType") == 10;
}

- (void)prepareFlyoverAnimation:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  uint64_t v7;
  id v8;
  char v9;
  id v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19;

  v19 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = *((_QWORD *)self + 48);
  if (*(_BYTE *)(v7 + 1241))
  {
    v8 = *(id *)(v7 + 1104);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = *(id *)(*((_QWORD *)self + 48) + 1104);
      objc_msgSend(v10, "mapLayerWillChangeRegionAnimated:", 0);

    }
    objc_msgSend(*((id *)self + 31), "prepareFlyoverAnimation:completion:", v19, v6);
    v11 = *(id *)(*((_QWORD *)self + 48) + 1104);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
LABEL_10:
      v18 = *(id *)(*((_QWORD *)self + 48) + 1104);
      objc_msgSend(v18, "mapLayerDidChangeRegionAnimated:", 0);

    }
  }
  else
  {
    if (!-[VKMapView canShowFlyoverAnimation](self, "canShowFlyoverAnimation"))
    {
      v6[2](v6, 0);
      goto LABEL_12;
    }
    v13 = *(id *)(*((_QWORD *)self + 48) + 1104);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v15 = *(id *)(*((_QWORD *)self + 48) + 1104);
      objc_msgSend(v15, "mapLayerWillChangeRegionAnimated:", 0);

    }
    objc_msgSend(*((id *)self + 6), "prepareFlyoverAnimation:completion:", v19, v6);
    v16 = *(id *)(*((_QWORD *)self + 48) + 1104);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
      goto LABEL_10;
  }
LABEL_12:

}

- (void)_runFlyoverTourStateChange:(int)a3 completion:(id)a4
{
  void (**v6)(id, BOOL);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD);
  _QWORD v12[5];
  _QWORD v13[5];

  v6 = (void (**)(id, BOOL))a4;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke;
  v13[3] = &unk_1E42F6DA0;
  v13[4] = self;
  v8 = (void *)MEMORY[0x1A1AF5730](v13);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke_3;
  v12[3] = &unk_1E42F6DA0;
  v12[4] = self;
  v9 = (void *)MEMORY[0x1A1AF5730](v12);
  if ((a3 - 3) < 2)
    goto LABEL_4;
  v10 = v8;
  if (a3 == 5)
    goto LABEL_5;
  if (a3 == 6)
  {
LABEL_4:
    v10 = v9;
LABEL_5:
    v11 = (void (**)(_QWORD))MEMORY[0x1A1AF5730](v10);
    if (!v6)
      goto LABEL_10;
    goto LABEL_8;
  }
  v11 = 0;
  if (!v6)
    goto LABEL_10;
LABEL_8:
  if ((a3 - 3) <= 3)
  {
    v6[2](v6, a3 == 5);
    -[VKMapView _notifyDelegateFlyoverTourLabelChanged:](self, "_notifyDelegateFlyoverTourLabelChanged:", 0);
  }
LABEL_10:
  if (v11)
    v11[2](v11);

}

- (void)_notifyDelegateFlyoverTourLabelChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__VKMapView__notifyDelegateFlyoverTourLabelChanged___block_invoke;
  v6[3] = &unk_1E42FAFB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v6);

}

- (void)startFlyoverAnimation:(id)a3 animateToStart:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id WeakRetained;
  char v11;
  id v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[5];
  _QWORD v18[6];
  _QWORD v19[5];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)self + 15);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)self + 15);
    objc_msgSend(v12, "mapLayerWillStartFlyoverTour:", self);

  }
  if (*(_BYTE *)(*((_QWORD *)self + 48) + 1241))
  {
    v13 = (void *)*((_QWORD *)self + 31);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke;
    v19[3] = &unk_1E42EB298;
    v19[4] = self;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke_2;
    v18[3] = &unk_1E42EB2C0;
    v14 = v18;
    v18[4] = self;
    v18[5] = v9;
    objc_msgSend(v13, "flyoverTourAnimation:animateToStart:labelChanged:stateChange:", v8, v6, v19, v18);
LABEL_9:

    goto LABEL_10;
  }
  if (-[VKMapView canShowFlyoverAnimation](self, "canShowFlyoverAnimation"))
  {
    if (-[VKMapView mapType](self, "mapType") != 3)
      -[VKMapView setMapType:](self, "setMapType:", 3);
    v15 = (void *)*((_QWORD *)self + 6);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke_3;
    v17[3] = &unk_1E42EB298;
    v17[4] = self;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke_4;
    v16[3] = &unk_1E42EB2C0;
    v14 = v16;
    v16[4] = self;
    v16[5] = v9;
    objc_msgSend(v15, "startFlyoverAnimation:animateToStart:labelChanged:stateChange:", v8, v6, v17, v16);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)moveToFlyoverTourStartPosition:(id)a3 duration:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a5;
  v10 = *((_QWORD *)self + 48);
  if (*(_BYTE *)(v10 + 1241))
  {
    v11 = *(_QWORD *)(v10 + 1128);
    LOBYTE(v24) = 2;
    md::MapEngineSettings::set(v11, &v24, 0);
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__977;
    v28 = __Block_byref_object_dispose__978;
    objc_msgSend(*((id *)self + 31), "createFlyoverPreTourAnimation:duration:", v8, a4);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__VKMapView_moveToFlyoverTourStartPosition_duration_completion___block_invoke;
    v21[3] = &unk_1E42EB2E8;
    v23 = &v24;
    v22 = v9;
    v12 = (void *)MEMORY[0x1A1AF5730](v21);
    -[VKMapView startFlyoverAnimation:animateToStart:completion:](self, "startFlyoverAnimation:animateToStart:completion:", v25[5], 0, v12);

    v13 = v22;
  }
  else
  {
    if (-[VKMapView mapType](self, "mapType") != 3)
      -[VKMapView setMapType:](self, "setMapType:", 3);
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__977;
    v28 = __Block_byref_object_dispose__978;
    objc_msgSend(*((id *)self + 6), "createFlyoverPreTourAnimation:duration:", v8, a4);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __64__VKMapView_moveToFlyoverTourStartPosition_duration_completion___block_invoke_2;
    v18 = &unk_1E42EB2E8;
    v20 = &v24;
    v19 = v9;
    v14 = (void *)MEMORY[0x1A1AF5730](&v15);
    -[VKMapView startFlyoverAnimation:animateToStart:completion:](self, "startFlyoverAnimation:animateToStart:completion:", v25[5], 0, v14, v15, v16, v17, v18);

    v13 = v19;
  }

  _Block_object_dispose(&v24, 8);
}

- (void)startFlyoverTourAnimation:(unint64_t)a3 animateToStart:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  id WeakRetained;
  char v11;
  id v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[5];
  _QWORD v18[6];
  _QWORD v19[5];
  char v20;

  v5 = a4;
  v8 = a5;
  objc_msgSend(*((id *)self + 31), "endRegionChange");
  v9 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v20 = 2;
  md::MapEngineSettings::set(v9, &v20, 0);
  WeakRetained = objc_loadWeakRetained((id *)self + 15);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)self + 15);
    objc_msgSend(v12, "mapLayerWillStartFlyoverTour:", self);

  }
  if (*(_BYTE *)(*((_QWORD *)self + 48) + 1241))
  {
    v13 = (void *)*((_QWORD *)self + 31);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke;
    v19[3] = &unk_1E42EB298;
    v19[4] = self;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke_2;
    v18[3] = &unk_1E42EB2C0;
    v14 = v18;
    v18[4] = self;
    v18[5] = v8;
    objc_msgSend(v13, "startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:", a3, v5, v19, v18);
  }
  else
  {
    v15 = (void *)*((_QWORD *)self + 6);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke_3;
    v17[3] = &unk_1E42EB298;
    v17[4] = self;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke_4;
    v16[3] = &unk_1E42EB2C0;
    v14 = v16;
    v16[4] = self;
    v16[5] = v8;
    objc_msgSend(v15, "startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:", a3, v5, v17, v16);
  }

}

- (void)stopFlyoverAnimation
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v4 = 2;
  md::MapEngineSettings::set(v3, &v4, (_QWORD *)1);
  if (*(_BYTE *)(*((_QWORD *)self + 48) + 1241))
  {
    objc_msgSend(*((id *)self + 31), "stopFlyoverTourAnimation");
  }
  else if (-[VKMapView canShowFlyoverAnimation](self, "canShowFlyoverAnimation"))
  {
    objc_msgSend(*((id *)self + 6), "stopFlyoverAnimation");
  }
}

- (void)pauseFlyoverTourAnimation
{
  int *v3;

  if (*(_BYTE *)(*((_QWORD *)self + 48) + 1241))
  {
    v3 = &OBJC_IVAR___VKMapView__mapCameraController;
  }
  else
  {
    if (!-[VKMapView canShowFlyoverAnimation](self, "canShowFlyoverAnimation"))
      return;
    v3 = &OBJC_IVAR___VKMapView__globe;
  }
  objc_msgSend(*(id *)((char *)self + *v3), "pauseFlyoverTourAnimation");
}

- (void)resumeFlyoverTourAnimation
{
  int *v3;

  if (*(_BYTE *)(*((_QWORD *)self + 48) + 1241))
  {
    v3 = &OBJC_IVAR___VKMapView__mapCameraController;
  }
  else
  {
    if (!-[VKMapView canShowFlyoverAnimation](self, "canShowFlyoverAnimation"))
      return;
    v3 = &OBJC_IVAR___VKMapView__globe;
  }
  objc_msgSend(*(id *)((char *)self + *v3), "resumeFlyoverTourAnimation");
}

- (void)enableTestStatistics
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)*((_QWORD *)self + 6);
  if (v3)
    objc_msgSend(v3, "enableFlyoverStatistics");
  v4 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v4 + 4536), "-[VKMapView enableTestStatistics]");
  v5 = *(_QWORD *)(v4 + 1144);
  atomic_store(1u, (unsigned __int8 *)(v5 + 153));
  atomic_store(1u, (unsigned __int8 *)(v5 + 152));
}

- (void)disableTestStatistics
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)*((_QWORD *)self + 6);
  if (v3)
    objc_msgSend(v3, "disableFlyoverStatistics");
  v4 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v4 + 4536), "-[VKMapView disableTestStatistics]");
  v5 = *(_QWORD *)(v4 + 1144);
  atomic_store(0, (unsigned __int8 *)(v5 + 153));
  atomic_store(0, (unsigned __int8 *)(v5 + 152));
}

- (void)resetTestStatistics
{
  void *v3;
  uint64_t v4;

  v3 = (void *)*((_QWORD *)self + 6);
  if (v3)
    objc_msgSend(v3, "resetFlyoverStatistics");
  v4 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v4 + 4536), "-[VKMapView resetTestStatistics]");
  gdc::Statistics::reset(*(gdc::Statistics **)(v4 + 1144));
}

- (id)testStatistics
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  double v9;
  unint64_t v10;
  double v11;
  std::string::pointer data;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void **i;
  std::string *p_p;
  void *v21;
  void *v22;
  void *v23;
  kern_return_t v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void **v40;
  void *v41;
  void **v43;
  uint64_t v44;
  void *v45;
  _QWORD *v46;
  int v47;
  uint64_t v48;
  mach_msg_type_number_t task_info_outCnt;
  std::string __p;
  double v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void **v56;
  _QWORD *v57;
  _QWORD *v58;

  v3 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v3 + 4536), "-[VKMapView testStatistics]");
  v4 = *(_QWORD *)(v3 + 1144);
  v5 = (void *)*((_QWORD *)self + 6);
  if (v5)
  {
    objc_msgSend(v5, "flyoverStatistics");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  v7 = v6;
  v44 = v4;
  gdc::Statistics::getAllHistograms((gdc::Statistics *)&v57, v4);
  v45 = v57;
  v46 = v58;
  if (v57 != v58)
  {
    v8 = v57;
    while (1)
    {
      gdc::Histogram::getHistogramData((gdc::Histogram *)&__p, v8[1]);
      v9 = v51;
      if (v52 != *(void **)&v51)
        break;
      v9 = *(double *)&v52;
      if (v52)
        goto LABEL_7;
LABEL_8:
      v8 += 2;
      if (v8 == v46)
        goto LABEL_14;
    }
    v10 = 0;
    v11 = *(double *)&__p.__r_.__value_.__r.__words[2];
    data = __p.__r_.__value_.__l.__data_;
    v13 = ((uint64_t)v52 - *(_QWORD *)&v51) >> 3;
    do
    {
      v14 = v10 + 1;
      v15 = *(_QWORD *)(*(_QWORD *)&v9 + 8 * v10);
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s [%3.0f, %3.0f]ms"), *v8, *(double *)&data + v11 * (double)v10, *(double *)&data + v11 * (double)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setValue:forKey:", v17, v16);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Units"), v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setValue:forKey:", CFSTR("samples"), v18);

      }
      v10 = v14;
    }
    while (v14 < v13);
LABEL_7:
    operator delete(*(void **)&v9);
    goto LABEL_8;
  }
LABEL_14:
  gdc::Statistics::getAllSamplers((gdc::Statistics *)&__p, v44);
  gdc::Statistics::dumpSamplerValues((uint64_t)&v55, (uint64_t *)&__p);
  if (__p.__r_.__value_.__r.__words[0])
    operator delete(__p.__r_.__value_.__l.__data_);
  for (i = v56; i; i = (void **)*i)
  {
    if (*((char *)i + 39) < 0)
      std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)i[2], (std::string::size_type)i[3]);
    else
      __p = *(std::string *)(i + 2);
    v51 = *((double *)i + 5);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v51);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v22, v21);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Units"), v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", CFSTR("ms"), v23);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  task_info_outCnt = 372;
  v24 = task_info(*MEMORY[0x1E0C83DA0], 0x16u, (task_info_t)&__p, &task_info_outCnt);
  v25 = 0.0;
  v26 = 0.0;
  if (!v24)
  {
    v25 = (double)v53 * 0.000000953674316;
    v26 = (double)v54 * 0.000000953674316;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v27, CFSTR("MemoryUsage:Footprint"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v28, CFSTR("MemoryUsage:Footprint_Peak"));

  v48 = 0;
  v47 = 0;
  malloc_get_all_zones();
  +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)(objc_msgSend(v29, "device") + 8);

  if (v30)
  {
    v31 = *(_QWORD *)(v30 + 80);
    if (v31)
    {
      for (j = *(_QWORD **)(v31 + 168); j; j = (_QWORD *)*j)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", j[4]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ResourceStats::%s::Count"), j[2]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setValue:forKey:", v33, v34);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ResourceStats::%s::CountUnits"), j[2]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", CFSTR("items"), v35);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)((double)(unint64_t)j[5] * 0.000000953674316));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ResourceStats::%s::Size"), j[2]);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setValue:forKey:", v36, v37);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ResourceStats::%s::SizeUnits"), j[2]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", CFSTR("MB"), v38);

      }
    }
  }
  v39 = v7;
  v40 = v56;
  if (v56)
  {
    do
    {
      v43 = (void **)*v40;
      if (*((char *)v40 + 39) < 0)
        operator delete(v40[2]);
      operator delete(v40);
      v40 = v43;
    }
    while (v43);
  }
  v41 = v55;
  v55 = 0;
  if (v41)
    operator delete(v41);
  if (v45)
    operator delete(v45);

  return v39;
}

- (void)enableTileStatistics
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (v3)
  {
    v4 = (uint8x8_t)vcnt_s8(v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
    {
      v5 = 0x2B7C4502BD3C99C6;
      if (*(_QWORD *)&v3 <= 0x2B7C4502BD3C99C6uLL)
        v5 = 0x2B7C4502BD3C99C6uLL % *(_QWORD *)&v3;
    }
    else
    {
      v5 = (*(_QWORD *)&v3 - 1) & 0x2B7C4502BD3C99C6;
    }
    v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
    if (v6)
    {
      v7 = (_QWORD *)*v6;
      if (v7)
      {
        if (v4.u32[0] < 2uLL)
        {
          v8 = *(_QWORD *)&v3 - 1;
          while (1)
          {
            v10 = v7[1];
            if (v10 == 0x2B7C4502BD3C99C6)
            {
              if (v7[2] == 0x2B7C4502BD3C99C6)
                goto LABEL_22;
            }
            else if ((v10 & v8) != v5)
            {
              return;
            }
            v7 = (_QWORD *)*v7;
            if (!v7)
              return;
          }
        }
        do
        {
          v9 = v7[1];
          if (v9 == 0x2B7C4502BD3C99C6)
          {
            if (v7[2] == 0x2B7C4502BD3C99C6)
            {
LABEL_22:
              v11 = v7[5];
              if (v11)
                *(_BYTE *)(v11 + 128) = 1;
              return;
            }
          }
          else
          {
            if (v9 >= *(_QWORD *)&v3)
              v9 %= *(_QWORD *)&v3;
            if (v9 != v5)
              return;
          }
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
    }
  }
}

- (void)disableTileStatistics
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (v3)
  {
    v4 = (uint8x8_t)vcnt_s8(v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
    {
      v5 = 0x2B7C4502BD3C99C6;
      if (*(_QWORD *)&v3 <= 0x2B7C4502BD3C99C6uLL)
        v5 = 0x2B7C4502BD3C99C6uLL % *(_QWORD *)&v3;
    }
    else
    {
      v5 = (*(_QWORD *)&v3 - 1) & 0x2B7C4502BD3C99C6;
    }
    v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
    if (v6)
    {
      v7 = (_QWORD *)*v6;
      if (v7)
      {
        if (v4.u32[0] < 2uLL)
        {
          v8 = *(_QWORD *)&v3 - 1;
          while (1)
          {
            v10 = v7[1];
            if (v10 == 0x2B7C4502BD3C99C6)
            {
              if (v7[2] == 0x2B7C4502BD3C99C6)
                goto LABEL_22;
            }
            else if ((v10 & v8) != v5)
            {
              return;
            }
            v7 = (_QWORD *)*v7;
            if (!v7)
              return;
          }
        }
        do
        {
          v9 = v7[1];
          if (v9 == 0x2B7C4502BD3C99C6)
          {
            if (v7[2] == 0x2B7C4502BD3C99C6)
            {
LABEL_22:
              v11 = v7[5];
              if (v11)
                *(_BYTE *)(v11 + 128) = 0;
              return;
            }
          }
          else
          {
            if (v9 >= *(_QWORD *)&v3)
              v9 %= *(_QWORD *)&v3;
            if (v9 != v5)
              return;
          }
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
    }
  }
}

- (void)resetTileStatistics
{
  uint64_t v3;
  __int16 *v4;
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  uint64_t v7;
  int8x8_t *v8;
  int8x8_t v9;
  uint8x8_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t i;
  char *v22;
  uint64_t v23;
  unsigned __int16 *v24;
  unsigned __int16 *v25;
  uint64_t v26;

  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(*((_QWORD *)self + 48) + 4536), "-[VKMapView resetTileStatistics]");
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)self + 48) + 896) + 24) + 56);
  v4 = &md::MapResourceTypeList;
  do
  {
    v5 = *(unsigned __int16 **)(v3 + 32);
    v6 = *(unsigned __int16 **)(v3 + 40);
    if (v5 != v6)
    {
      while (*v5 != (unsigned __int16)*v4)
      {
        v5 += 8;
        if (v5 == v6)
          goto LABEL_2;
      }
    }
    if (v5 != v6)
    {
      v7 = *((_QWORD *)v5 + 1);
      if (v7)
      {
        std::mutex::lock((std::mutex *)(v7 + 112));
        *(_QWORD *)(v7 + 432) = 0;
        *(_OWORD *)(v7 + 400) = 0u;
        *(_OWORD *)(v7 + 416) = 0u;
        *(_OWORD *)(v7 + 176) = 0u;
        *(_OWORD *)(v7 + 192) = 0u;
        *(_OWORD *)(v7 + 208) = 0u;
        *(_OWORD *)(v7 + 224) = 0u;
        *(_OWORD *)(v7 + 240) = 0u;
        *(_OWORD *)(v7 + 256) = 0u;
        *(_OWORD *)(v7 + 272) = 0u;
        *(_OWORD *)(v7 + 288) = 0u;
        *(_OWORD *)(v7 + 304) = 0u;
        *(_OWORD *)(v7 + 320) = 0u;
        std::mutex::unlock((std::mutex *)(v7 + 112));
      }
    }
LABEL_2:
    ++v4;
  }
  while (v4 != &md::MapDataTypeList);
  v8 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v9 = v8[2];
  if (!*(_QWORD *)&v9)
    goto LABEL_39;
  v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    v11 = 0x2B7C4502BD3C99C6;
    if (*(_QWORD *)&v9 <= 0x2B7C4502BD3C99C6uLL)
      v11 = 0x2B7C4502BD3C99C6uLL % *(_QWORD *)&v9;
  }
  else
  {
    v11 = (*(_QWORD *)&v9 - 1) & 0x2B7C4502BD3C99C6;
  }
  v12 = *(_QWORD **)(*(_QWORD *)&v8[1] + 8 * v11);
  if (!v12)
    goto LABEL_39;
  v13 = (_QWORD *)*v12;
  if (!v13)
    goto LABEL_39;
  if (v10.u32[0] < 2uLL)
  {
    v14 = *(_QWORD *)&v9 - 1;
    while (1)
    {
      v16 = v13[1];
      if (v16 == 0x2B7C4502BD3C99C6)
      {
        if (v13[2] == 0x2B7C4502BD3C99C6)
          goto LABEL_31;
      }
      else if ((v16 & v14) != v11)
      {
        goto LABEL_39;
      }
      v13 = (_QWORD *)*v13;
      if (!v13)
        goto LABEL_39;
    }
  }
  while (1)
  {
    v15 = v13[1];
    if (v15 == 0x2B7C4502BD3C99C6)
      break;
    if (v15 >= *(_QWORD *)&v9)
      v15 %= *(_QWORD *)&v9;
    if (v15 != v11)
      goto LABEL_39;
LABEL_20:
    v13 = (_QWORD *)*v13;
    if (!v13)
      goto LABEL_39;
  }
  if (v13[2] != 0x2B7C4502BD3C99C6)
    goto LABEL_20;
LABEL_31:
  v17 = (_QWORD *)v13[5];
  if (v17 && v17[20])
  {
    v18 = (_QWORD *)v17[19];
    if (v18)
    {
      do
      {
        v19 = (_QWORD *)*v18;
        std::__destroy_at[abi:nn180100]<std::pair<gdc::LayerDataRequestKey const,gdc::DebugTreeNode>,0>((uint64_t)(v18 + 2));
        operator delete(v18);
        v18 = v19;
      }
      while (v19);
    }
    v17[19] = 0;
    v20 = v17[18];
    if (v20)
    {
      for (i = 0; i != v20; ++i)
        *(_QWORD *)(v17[17] + 8 * i) = 0;
    }
    v17[20] = 0;
  }
LABEL_39:
  v22 = (char *)&md::MapDataTypeList;
  do
  {
    v23 = *(_QWORD *)(*((_QWORD *)self + 48) + 896);
    v24 = *(unsigned __int16 **)(v23 + 32);
    v25 = *(unsigned __int16 **)(v23 + 40);
    if (v24 != v25)
    {
      while (*v24 != *(unsigned __int16 *)v22)
      {
        v24 += 8;
        if (v24 == v25)
          goto LABEL_40;
      }
    }
    if (v24 != v25)
    {
      v26 = *((_QWORD *)v24 + 1);
      if (v26)
      {
        std::mutex::lock((std::mutex *)(v26 + 480));
        *(_QWORD *)(v26 + 576) = 0;
        *(_OWORD *)(v26 + 544) = 0u;
        *(_OWORD *)(v26 + 560) = 0u;
        std::mutex::unlock((std::mutex *)(v26 + 480));
      }
    }
LABEL_40:
    v22 += 2;
  }
  while (v22 != &gdc::ResourceSourceList);
}

- (id)tileStatistics
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("DaVinci"), CFSTR("Pine"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("DAVINCI"), CFSTR("PINE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)stopTracking
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  VKMapView *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Stop tracking", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(*((id *)self + 33), "stop");
  v4 = (void *)*((_QWORD *)self + 5);
  -[VKMapView resolveMapCameraController](self, "resolveMapCameraController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCameraController:", v5);

  v6 = (void *)*((_QWORD *)self + 33);
  *((_QWORD *)self + 33) = 0;

}

- (void)pauseTracking
{
  NSObject *v3;
  int v4;
  VKMapView *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Pause tracking", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*((id *)self + 33), "stop");
}

- (void)navigationCameraReturnToPuck
{
  NSObject *v3;
  int v4;
  VKMapView *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Navigation return to puck", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*((id *)self + 33), "returnToPuck");
}

- (void)transitionToTracking:(BOOL)a3 mapMode:(int64_t)a4 startLocation:(id)a5 startCourse:(double)a6 pounceCompletionHandler:(id)a7
{
  double var1;
  double var0;
  uint64_t v11;
  id v13;
  NSObject *v17;
  void *v18;
  VKNavCameraController *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  id v42;
  double v43;
  uint8_t buf[8];
  double v45;
  uint64_t v46;
  uint64_t v47;
  std::__shared_weak_count *v48;

  var1 = a5.var1;
  var0 = a5.var0;
  v11 = a3;
  v13 = a7;
  if (var0 > 90.0 || var0 < -90.0 || var1 > 180.0 || var1 < -180.0)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v17 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v17, OS_LOG_TYPE_ERROR, "Transition to tracking passed invalid start location!", buf, 2u);
    }
  }
  -[VKMapView stopTrackingAnnotation](self, "stopTrackingAnnotation");
  -[VKMapView currentCanvas](self, "currentCanvas");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*((_QWORD *)self + 33))
  {
    v19 = [VKNavCameraController alloc];
    v20 = *((_QWORD *)self + 48);
    v21 = *(std::__shared_weak_count **)(v20 + 16);
    v47 = *(_QWORD *)(v20 + 8);
    v48 = v21;
    v42 = v13;
    v41 = v11;
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        v23 = __ldxr(p_shared_owners);
      while (__stxr(v23 + 1, p_shared_owners));
      v24 = a4;
      v20 = *((_QWORD *)self + 48);
    }
    else
    {
      v24 = a4;
    }
    v25 = *(_QWORD *)(v20 + 24);
    v26 = *(_QWORD *)(v20 + 904);
    v28 = *(_QWORD *)(v20 + 112);
    v27 = *(_QWORD *)(v20 + 120);
    v29 = *(id *)(v20 + 1104);
    v30 = -[VKNavCameraController initWithTaskContext:device:mapDataAccess:animationRunner:runLoopController:cameraDelegate:](v19, "initWithTaskContext:device:mapDataAccess:animationRunner:runLoopController:cameraDelegate:", &v47, v25, v26, v28, v27, v29);
    v31 = (void *)*((_QWORD *)self + 33);
    *((_QWORD *)self + 33) = v30;

    v32 = v48;
    a4 = v24;
    v13 = v42;
    v11 = v41;
    if (v48)
    {
      v33 = (unint64_t *)&v48->__shared_owners_;
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    -[VKMapView sceneConfiguration](self, "sceneConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)self + 33), "setSceneConfiguration:", v35);

    objc_msgSend(*((id *)self + 33), "setNavContext:", *((_QWORD *)self + 40));
    objc_msgSend(*((id *)self + 33), "setScreenCanvas:", v18);
  }
  if (*((_BYTE *)self + 352) && *((_BYTE *)self + 368))
  {
    objc_msgSend(*((id *)self + 33), "updateLocation:andCourse:");
  }
  else
  {
    *(double *)buf = var0 * 0.0174532925;
    v45 = var1 * 0.0174532925;
    v46 = 0;
    v36 = -[VKMapView puckAnimator:getElevationWithCoordinate:](self, "puckAnimator:getElevationWithCoordinate:", *((_QWORD *)self + 28), buf);
    if (v37)
      v38 = v36;
    else
      v38 = 0;
    v46 = v38;
    v39 = *((_QWORD *)self + 28);
    v43 = a6 * 0.0174532925;
    -[VKMapView puckAnimator:updatedPosition:course:polylineCoordinate:](self, "puckAnimator:updatedPosition:course:polylineCoordinate:", v39, buf, &v43, *((_QWORD *)self + 47));
    -[VKMapView navigationPuck](self, "navigationPuck");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setPresentationCourse:", a6);

  }
  objc_msgSend(*((id *)self + 28), "start");
  objc_msgSend(v18, "setCameraController:", *((_QWORD *)self + 33));
  objc_msgSend(v18, "transitionToTracking:mapMode:startLocation:startCourse:cameraController:pounceCompletionHandler:", v11, a4, *((_QWORD *)self + 33), v13, var0, var1, a6);

}

- (BOOL)trackingCameraShouldHandleGestures
{
  return 0;
}

- (void)setHiddenTrafficIncidentFeatures:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  VKMapView *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (v4)
      v6 = objc_msgSend(v4, "count");
    else
      v6 = 0;
    v7 = 134218240;
    v8 = self;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set hidden traffic incident features - count:%zu", (uint8_t *)&v7, 0x16u);
  }

  md::LabelSettings::setHiddenTrafficIncidentFeatures((uint64_t)-[VKMapView _labelSettings](self, "_labelSettings"), v4);
}

- (void)setExternalTrafficFeatures:(id)a3 areRouteTrafficFeaturesActive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  int8x8_t *v10;
  int8x8_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t *v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  id obj;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  VKMapView *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  const char *v57;
  uint64_t v58;

  v4 = a4;
  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v7 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  v47 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v6)
      v8 = objc_msgSend(v6, "count");
    else
      v8 = 0;
    v9 = "NO";
    *(_DWORD *)buf = 134218498;
    v53 = self;
    if (v4)
      v9 = "YES";
    v54 = 2048;
    v55 = v8;
    v56 = 2080;
    v57 = v9;
    _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set external traffic features - count:%zu, areRouteTrafficFeaturesActive:%s", buf, 0x20u);
  }

  md::LabelSettings::setExternalTrafficFeatures((uint64_t)-[VKMapView _labelSettings](self, "_labelSettings"), v6, v4);
  v10 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  if (v10)
  {
    v11 = v10[2];
    if (v11)
    {
      v12 = (uint8x8_t)vcnt_s8(v11);
      v12.i16[0] = vaddlv_u8(v12);
      if (v12.u32[0] > 1uLL)
      {
        v13 = 0x5CBBA028798243FLL;
        if (*(_QWORD *)&v11 <= 0x5CBBA028798243FuLL)
          v13 = 0x5CBBA028798243FuLL % *(_QWORD *)&v11;
      }
      else
      {
        v13 = (*(_QWORD *)&v11 - 1) & 0x5CBBA028798243FLL;
      }
      v14 = *(_QWORD **)(*(_QWORD *)&v10[1] + 8 * v13);
      if (v14)
      {
        v15 = (_QWORD *)*v14;
        if (v15)
        {
          if (v12.u32[0] < 2uLL)
          {
            v16 = *(_QWORD *)&v11 - 1;
            while (1)
            {
              v18 = v15[1];
              if (v18 == 0x5CBBA028798243FLL)
              {
                if (v15[2] == 0x5CBBA028798243FLL)
                  goto LABEL_32;
              }
              else if ((v18 & v16) != v13)
              {
                goto LABEL_65;
              }
              v15 = (_QWORD *)*v15;
              if (!v15)
                goto LABEL_65;
            }
          }
          do
          {
            v17 = v15[1];
            if (v17 == 0x5CBBA028798243FLL)
            {
              if (v15[2] == 0x5CBBA028798243FLL)
              {
LABEL_32:
                v19 = (_QWORD *)v15[5];
                if (v19)
                {
                  v20 = v6;
                  v19[26] = v19[25];
                  v48 = 0u;
                  v49 = 0u;
                  v50 = 0u;
                  v51 = 0u;
                  obj = v20;
                  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, buf, 16);
                  if (v21)
                  {
                    v22 = *(_QWORD *)v49;
                    v45 = *(_QWORD *)v49;
                    do
                    {
                      for (i = 0; i != v21; ++i)
                      {
                        if (*(_QWORD *)v49 != v22)
                          objc_enumerationMutation(obj);
                        v24 = *(id *)(*((_QWORD *)&v48 + 1) + 8 * i);
                        if ((objc_msgSend(v24, "isIncident") & 1) == 0)
                        {
                          v25 = objc_msgSend(v24, "routeOffset");
                          v26 = v25;
                          v28 = (uint64_t *)v19[26];
                          v27 = v19[27];
                          if ((unint64_t)v28 >= v27)
                          {
                            v30 = (char *)v19[25];
                            v31 = ((char *)v28 - v30) >> 3;
                            v32 = v31 + 1;
                            if ((unint64_t)(v31 + 1) >> 61)
                              abort();
                            v33 = v27 - (_QWORD)v30;
                            if (v33 >> 2 > v32)
                              v32 = v33 >> 2;
                            if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8)
                              v34 = 0x1FFFFFFFFFFFFFFFLL;
                            else
                              v34 = v32;
                            if (v34)
                            {
                              if (v34 >> 61)
                                std::__throw_bad_array_new_length[abi:nn180100]();
                              v35 = v34;
                              v36 = (char *)operator new(8 * v34);
                              v34 = v35;
                            }
                            else
                            {
                              v36 = 0;
                            }
                            v37 = (uint64_t *)&v36[8 * v31];
                            *v37 = v26;
                            v29 = v37 + 1;
                            if (v28 != (uint64_t *)v30)
                            {
                              v38 = (char *)(v28 - 1) - v30;
                              if (v38 < 0x58)
                                goto LABEL_70;
                              if ((unint64_t)(v30 - v36) < 0x20)
                                goto LABEL_70;
                              v39 = (v38 >> 3) + 1;
                              v40 = &v36[8 * v31 - 16];
                              v41 = v28 - 2;
                              v42 = v39 & 0x3FFFFFFFFFFFFFFCLL;
                              do
                              {
                                v43 = *(_OWORD *)v41;
                                *((_OWORD *)v40 - 1) = *((_OWORD *)v41 - 1);
                                *(_OWORD *)v40 = v43;
                                v40 -= 32;
                                v41 -= 4;
                                v42 -= 4;
                              }
                              while (v42);
                              v37 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
                              v28 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
                              if (v39 != (v39 & 0x3FFFFFFFFFFFFFFCLL))
                              {
LABEL_70:
                                do
                                {
                                  v44 = *--v28;
                                  *--v37 = v44;
                                }
                                while (v28 != (uint64_t *)v30);
                              }
                              v28 = (uint64_t *)v19[25];
                            }
                            v19[25] = v37;
                            v19[26] = v29;
                            v19[27] = &v36[8 * v34];
                            if (v28)
                              operator delete(v28);
                          }
                          else
                          {
                            *v28 = v25;
                            v29 = v28 + 1;
                          }
                          v19[26] = v29;
                          v6 = v47;
                          v22 = v45;
                        }

                      }
                      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, buf, 16);
                    }
                    while (v21);
                  }

                }
                break;
              }
            }
            else
            {
              if (v17 >= *(_QWORD *)&v11)
                v17 %= *(_QWORD *)&v11;
              if (v17 != v13)
                break;
            }
            v15 = (_QWORD *)*v15;
          }
          while (v15);
        }
      }
    }
  }
LABEL_65:

}

- (void)removeCustomFeatureDataSource:(id)a3
{
  id v4;

  v4 = a3;
  md::LabelSettings::removeCustomFeatureDataSource((uint64_t)-[VKMapView _labelSettings](self, "_labelSettings"), v4);

}

- (void)setLabelExclusionRegions:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[VKMapView _labelSettings](self, "_labelSettings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  md::LabelSettings::setLabelExclusionRegions((uint64_t)v4, v5);

}

- (void)setScreenLabelFeatures:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = -[VKMapView _labelSettings](self, "_labelSettings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*((_QWORD *)v4 + 5) + 128), v5);
  v6 = v5;
  md::LabelManager::setScreenLabelFeatures(*((md::LabelManager **)v4 + 3), v6);

}

- (id)labelMarkerForSelectionAtPoint:(CGPoint)a3 selectableLabelsOnly:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  uint64_t v7;
  double v8;
  float v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;
  _DWORD v17[2];

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v7 = *(_QWORD *)(*(_QWORD *)(-[VKMapView _labelSettings](self, "_labelSettings") + 16) + 24);
  std::recursive_mutex::lock((std::recursive_mutex *)(v7 + 24));
  v8 = *(float *)(v7 + 480);
  v9 = x * v8;
  *(float *)&v8 = *(float *)(v7 + 1508) - y * v8;
  *(float *)v17 = v9;
  v17[1] = LODWORD(v8);
  (*(void (**)(uint64_t *__return_ptr, _QWORD, _DWORD *, _BOOL8))(**(_QWORD **)(v7 + 240) + 160))(&v15, *(_QWORD *)(v7 + 240), v17, v4);
  std::recursive_mutex::unlock((std::recursive_mutex *)(v7 + 24));
  +[VKLabelMarker markerWithLabelMarker:](VKLabelMarker, "markerWithLabelMarker:", &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v10;
}

- (id)labelMarkerForCustomFeatureAnnotation:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    objc_msgSend(v6, "feature");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "feature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 != v8)
      {
        v9 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(v6, "feature");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDataSource:", v8);

    }
    md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(*((_QWORD *)self + 48) + 4536), "-[VKMapView labelMarkerForCustomFeatureAnnotation:dataSource:]");
    md::LabelManager::labelMarkerForCustomFeatureAnnotation(&v19, *(_QWORD *)(*(_QWORD *)(-[VKMapView _labelSettings](self, "_labelSettings") + 16) + 24), v6, v8);
    +[VKLabelMarker markerWithLabelMarker:](VKLabelMarker, "markerWithLabelMarker:", &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
LABEL_12:

  return v9;
}

- (id)labelMarkerForCustomFeatureAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "feature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapView labelMarkerForCustomFeatureAnnotation:dataSource:](self, "labelMarkerForCustomFeatureAnnotation:dataSource:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)rapMarkerAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markerAtScreenPoint:enableExtendedFeatureMarkers:", 0, x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)selectLabelMarker:(id)a3
{
  -[VKMapView selectLabelMarker:completion:](self, "selectLabelMarker:completion:", a3, 0);
}

- (void)selectLabelMarker:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  id v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (v18)
  {
    v7 = -[VKMapView _labelSettings](self, "_labelSettings");
    v8 = (uint64_t *)objc_msgSend(v18, "labelMarkerImpl");
    v9 = *(_QWORD *)(v7[2] + 40);
    v11 = *v8;
    v10 = v8[1];
    if (v10)
    {
      v12 = (unint64_t *)(v10 + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    v14 = *(std::__shared_weak_count **)(v9 + 40);
    *(_QWORD *)(v9 + 32) = v11;
    *(_QWORD *)(v9 + 40) = v10;
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    md::LabelManager::selectLabelMarker(*(md::LabelManager **)(v7[2] + 24), v8);
    -[VKMapView _updateMapDisplayStyle](self, "_updateMapDisplayStyle");
    if (*((_BYTE *)self + 32) && *((_DWORD *)self + 9) == 11)
    {
      v17 = *((id *)self + 35);
      objc_msgSend(v17, "selectLabelMarker:completion:", objc_msgSend(v18, "labelMarkerImpl"), v6);

    }
  }
  else
  {
    -[VKMapView deselectLabelMarker](self, "deselectLabelMarker");
  }

}

- (void)deselectLabelMarker
{
  _QWORD *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v3 = -[VKMapView _labelSettings](self, "_labelSettings");
  v11 = 0;
  v12 = 0;
  v4 = *(_QWORD *)(v3[2] + 40);
  v5 = *(std::__shared_weak_count **)(v4 + 40);
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 40) = 0;
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
  md::LabelManager::selectLabelMarker(*(md::LabelManager **)(v3[2] + 24), &v11);
  v8 = v12;
  if (v12)
  {
    v9 = (unint64_t *)&v12->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  -[VKMapView _updateMapDisplayStyle](self, "_updateMapDisplayStyle");
}

- (void)clearPreviouslySelectedLabelMarker
{
  NSObject *v3;
  md::LabelManager *v4;
  __int128 *v5;
  uint64_t v6;
  __int128 v7;
  __int128 *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    LODWORD(v7) = 134217984;
    *(_QWORD *)((char *)&v7 + 4) = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] clearPreviouslySelectedLabelMarker", (uint8_t *)&v7, 0xCu);
  }
  v4 = *(md::LabelManager **)(*(_QWORD *)(-[VKMapView _labelSettings](self, "_labelSettings") + 16) + 24);
  *(_QWORD *)&v7 = &off_1E42CA640;
  *((_QWORD *)&v7 + 1) = v4;
  v8 = &v7;
  md::LabelManager::queueCommand(v4, 61, 1, &v7);
  v5 = v8;
  if (v8 == &v7)
  {
    v6 = 4;
    v5 = &v7;
  }
  else
  {
    if (!v8)
      return;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
}

- (void)setPreviouslySelectedLabelMarker:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t *v7;
  md::LabelManager *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  int *v13;
  unint64_t *v14;
  unint64_t v15;
  int *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  int v20;
  VKMapView *v21;
  int *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v20 = 134217984;
    v21 = self;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] setPreviouslySelectedLabelMarker", (uint8_t *)&v20, 0xCu);
  }
  v6 = -[VKMapView _labelSettings](self, "_labelSettings");
  v7 = (uint64_t *)objc_msgSend(v4, "labelMarkerImpl");
  v8 = *(md::LabelManager **)(v6[2] + 24);
  v10 = *v7;
  v9 = (std::__shared_weak_count *)v7[1];
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  v22 = 0;
  v13 = (int *)operator new(0x20uLL);
  *(_QWORD *)v13 = &off_1E42798D0;
  *((_QWORD *)v13 + 1) = v8;
  *((_QWORD *)v13 + 2) = v10;
  *((_QWORD *)v13 + 3) = v9;
  if (v9)
  {
    v14 = (unint64_t *)&v9->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  v22 = v13;
  md::LabelManager::queueCommand(v8, 62, 1, &v20);
  v16 = v22;
  if (v22 == &v20)
  {
    v17 = 4;
    v16 = &v20;
    goto LABEL_15;
  }
  if (v22)
  {
    v17 = 5;
LABEL_15:
    (*(void (**)(void))(*(_QWORD *)v16 + 8 * v17))();
  }
  if (v9)
  {
    v18 = (unint64_t *)&v9->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

}

- (BOOL)transitLinesDisabled
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 16)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (void)setDisableTransitLines:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  VKMapView *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (v3)
      v6 = "YES";
    v9 = 134218242;
    v10 = self;
    v11 = 2080;
    v12 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set disable transit lines: %s", (uint8_t *)&v9, 0x16u);
  }
  v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  LOBYTE(v9) = 16;
  md::MapEngineSettings::set(v7, &v9, (_QWORD *)v3);
  v8 = *((_QWORD *)self + 48);
  LOBYTE(v9) = 1;
  md::MapEngine::setNeedsTick(v8, &v9);
}

- (id)transitLineMarkersInCurrentViewport
{
  unint64_t v2;
  int8x8_t *v3;
  int8x8_t v4;
  uint8x8_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  double *v12;
  uint64_t *v13;
  void *v14;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  float *v37;
  uint64_t v38;
  float v39;
  float v40;
  float *v41;
  float v42;
  float v43;
  BOOL v44;
  BOOL v45;
  BOOL v47;
  BOOL v48;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v60;
  float v62;
  float v64;
  float v66;
  float v67;
  float v68;
  float v70;
  unint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint8x8_t v79;
  _QWORD *v80;
  _QWORD *v81;
  unint64_t v83;
  uint64_t v85;
  _QWORD *v86;
  float v87;
  _BOOL8 v88;
  unint64_t v89;
  unint64_t v90;
  size_t prime;
  void *v92;
  void *v93;
  uint64_t v94;
  _QWORD **v95;
  size_t v96;
  size_t v97;
  size_t v98;
  _QWORD *j;
  size_t v100;
  uint64_t v101;
  unint64_t v102;
  uint8x8_t v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  size_t v107;
  _QWORD *v108;
  _QWORD *v109;
  unint64_t v110;
  void *v111;
  _QWORD *v112;
  void *v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t *v116;
  _QWORD *v117;
  _QWORD *v118;
  void *v119;
  uint64_t *v120;
  uint64_t *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  double *v125;
  uint64_t i;
  void *v127;
  uint64_t *v128;
  unint64_t v129;
  void *__p[2];
  void *v131[2];
  float v132;
  uint64_t v133[2];

  v3 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v4 = v3[2];
  if (!*(_QWORD *)&v4)
    goto LABEL_25;
  v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = 0x1BCA10CB9934FB1BLL;
    if (*(_QWORD *)&v4 <= 0x1BCA10CB9934FB1BuLL)
      v6 = 0x1BCA10CB9934FB1BuLL % *(_QWORD *)&v4;
  }
  else
  {
    v6 = (*(_QWORD *)&v4 - 1) & 0x1BCA10CB9934FB1BLL;
  }
  v7 = *(_QWORD **)(*(_QWORD *)&v3[1] + 8 * v6);
  if (!v7)
    goto LABEL_25;
  v8 = (_QWORD *)*v7;
  if (!v8)
    goto LABEL_25;
  if (v5.u32[0] < 2uLL)
  {
    v9 = *(_QWORD *)&v4 - 1;
    while (1)
    {
      v11 = v8[1];
      if (v11 == 0x1BCA10CB9934FB1BLL)
      {
        if (v8[2] == 0x1BCA10CB9934FB1BLL)
          goto LABEL_22;
      }
      else if ((v11 & v9) != v6)
      {
        goto LABEL_25;
      }
      v8 = (_QWORD *)*v8;
      if (!v8)
        goto LABEL_25;
    }
  }
  while (1)
  {
    v10 = v8[1];
    if (v10 == 0x1BCA10CB9934FB1BLL)
      break;
    if (v10 >= *(_QWORD *)&v4)
      v10 %= *(_QWORD *)&v4;
    if (v10 != v6)
      goto LABEL_25;
LABEL_11:
    v8 = (_QWORD *)*v8;
    if (!v8)
      goto LABEL_25;
  }
  if (v8[2] != 0x1BCA10CB9934FB1BLL)
    goto LABEL_11;
LABEL_22:
  v12 = (double *)v8[5];
  if (v12)
  {
    v128 = 0;
    v129 = 0;
    v127 = 0;
    *(_OWORD *)__p = 0u;
    *(_OWORD *)v131 = 0u;
    v132 = 1.0;
    v13 = (uint64_t *)*((_QWORD *)v12 + 21);
    v124 = *((_QWORD *)v12 + 22);
    if (v13 != (uint64_t *)v124)
    {
      v125 = v12;
      while (2)
      {
        v16 = *v13;
        v17 = v12[71];
        v18 = *(double *)(*v13 + 1296);
        if (v17 > v18)
        {
          v19 = v125[69];
          v20 = *(double *)(v16 + 1312);
          if (v19 < v20)
          {
            v21 = v125[72];
            v22 = *(double *)(v16 + 1304);
            if (v21 > v22)
            {
              v23 = v125[70];
              v24 = *(double *)(v16 + 1320);
              if (v23 < v24)
              {
                v25 = 0;
                v26 = v20 - v18;
                v27 = v24 - v22;
                v28 = (v19 - v18) / v26;
                v29 = (v21 - v22) / v27;
                v30 = (v17 - v18) / v26;
                v31 = (v23 - v22) / v27;
                v32 = v31 - v29;
                v33 = v28 - v30;
                for (i = *v13; ; v16 = i)
                {
                  if (v25 >= geo::codec::VectorTile::transitLinkCount(*(geo::codec::VectorTile **)(v16 + 720)))
                    goto LABEL_27;
                  v34 = geo::codec::VectorTile::transitLinks(*(geo::codec::VectorTile **)(v16 + 720));
                  v35 = v34 + 184 * v25;
                  if (*(_DWORD *)(v35 + 20))
                  {
                    v36 = 0;
                    while (1)
                    {
                      v133[0] = 0;
                      v37 = (float *)geo::codec::transitLinkPoints(v35, v36, v133);
                      v38 = v133[0] - 1;
                      if (v133[0] > 1uLL)
                        break;
LABEL_37:
                      if (++v36 >= (unint64_t)*(unsigned int *)(v35 + 20))
                        goto LABEL_33;
                    }
                    v39 = *v37;
                    v40 = v37[1];
                    v41 = v37 + 3;
                    while (1)
                    {
                      v47 = v39 >= v28 && v39 < v30;
                      v48 = !v47 || v40 < v31;
                      if (!v48 && v40 < v29)
                        break;
                      v50 = *(v41 - 1);
                      v51 = v50 - v39;
                      v52 = *v41;
                      v53 = *v41 - v40;
                      v54 = v50 - v28;
                      v55 = *v41 - v29;
                      if ((float)(v53 * v33) != 0.0)
                      {
                        v56 = 1.0 / (float)(v53 * v33);
                        v57 = (float)(v56 * v33) * v55;
                        v58 = v54 * v53;
                        if (v57 >= 0.0 && v57 <= 1.0)
                        {
                          v60 = (float)-(float)(v58 - (float)(v55 * v51)) * v56;
                          if (v60 >= 0.0 && v60 <= 1.0)
                            break;
                        }
                        v62 = (float)(v56 * v33) * (float)(v52 - v31);
                        if (v62 >= 0.0 && v62 <= 1.0)
                        {
                          v64 = (float)-(float)(v58 - (float)((float)(v52 - v31) * v51)) * v56;
                          if (v64 >= 0.0 && v64 <= 1.0)
                            break;
                        }
                      }
                      if ((float)(v51 * v32) != 0.0)
                      {
                        v66 = 1.0 / (float)(v51 * v32);
                        v67 = (float)(v66 * v32) * v54;
                        v68 = v55 * v51;
                        if (v67 >= 0.0 && v67 <= 1.0)
                        {
                          v70 = (float)(v68 - (float)(v54 * v53)) * v66;
                          if (v70 >= 0.0 && v70 <= 1.0)
                            break;
                        }
                        v42 = (float)(v66 * v32) * (float)(v50 - v30);
                        v43 = (float)(v68 - (float)((float)(v50 - v30) * v53)) * v66;
                        v44 = v43 > 1.0 || v43 < 0.0;
                        v45 = !v44 && v42 <= 1.0;
                        if (v45 && v42 >= 0.0)
                          break;
                      }
                      v41 += 2;
                      v40 = v52;
                      v39 = v50;
                      if (!--v38)
                        goto LABEL_37;
                    }
                    v72 = v34 + 184 * v25;
                    v74 = *(_QWORD *)(v72 + 32);
                    v73 = (_QWORD *)(v72 + 32);
                    if (v74)
                      break;
                  }
LABEL_33:
                  ++v25;
                }
                v75 = 0;
                while (1)
                {
                  v76 = geo::codec::vectorTransitLineAlongLink((_QWORD *)v35, v75);
                  v77 = v76;
                  v78 = (unint64_t)__p[1];
                  if (__p[1])
                  {
                    v79 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
                    v79.i16[0] = vaddlv_u8(v79);
                    if (v79.u32[0] > 1uLL)
                    {
                      v2 = v76;
                      if (__p[1] <= (void *)v76)
                        v2 = v76 % (unint64_t)__p[1];
                    }
                    else
                    {
                      v2 = ((unint64_t)__p[1] - 1) & v76;
                    }
                    v80 = (_QWORD *)*((_QWORD *)__p[0] + v2);
                    if (v80)
                    {
                      v81 = (_QWORD *)*v80;
                      if (v81)
                      {
                        if (v79.u32[0] < 2uLL)
                        {
                          while (1)
                          {
                            v85 = v81[1];
                            if (v85 == v76)
                            {
                              if (v76 == v81[2] && v35 == v81[3])
                                goto LABEL_180;
                            }
                            else if ((v85 & ((uint64_t)__p[1] - 1)) != v2)
                            {
                              goto LABEL_120;
                            }
                            v81 = (_QWORD *)*v81;
                            if (!v81)
                              goto LABEL_120;
                          }
                        }
                        do
                        {
                          v83 = v81[1];
                          if (v83 == v76)
                          {
                            if (v76 == v81[2] && v35 == v81[3])
                              goto LABEL_180;
                          }
                          else
                          {
                            if ((void *)v83 >= __p[1])
                              v83 %= (unint64_t)__p[1];
                            if (v83 != v2)
                              break;
                          }
                          v81 = (_QWORD *)*v81;
                        }
                        while (v81);
                      }
                    }
                  }
LABEL_120:
                  v86 = operator new(0x20uLL);
                  *v86 = 0;
                  v86[1] = v77;
                  v86[2] = v77;
                  v86[3] = v35;
                  v87 = (float)((unint64_t)v131[1] + 1);
                  if (!v78 || (float)(v132 * (float)v78) < v87)
                    break;
LABEL_170:
                  v108 = __p[0];
                  v109 = (_QWORD *)*((_QWORD *)__p[0] + v2);
                  if (v109)
                  {
                    *v86 = *v109;
                  }
                  else
                  {
                    *v86 = v131[0];
                    v131[0] = v86;
                    v108[v2] = v131;
                    if (!*v86)
                      goto LABEL_179;
                    v110 = *(_QWORD *)(*v86 + 8);
                    if ((v78 & (v78 - 1)) != 0)
                    {
                      if (v110 >= v78)
                        v110 %= v78;
                    }
                    else
                    {
                      v110 &= v78 - 1;
                    }
                    v109 = (char *)__p[0] + 8 * v110;
                  }
                  *v109 = v86;
LABEL_179:
                  ++v131[1];
LABEL_180:
                  if ((unint64_t)++v75 >= *v73)
                    goto LABEL_33;
                }
                v88 = (v78 & (v78 - 1)) != 0;
                if (v78 < 3)
                  v88 = 1;
                v89 = v88 | (2 * v78);
                v90 = vcvtps_u32_f32(v87 / v132);
                if (v89 <= v90)
                  prime = v90;
                else
                  prime = v89;
                if (prime == 1)
                {
                  prime = 2;
                }
                else if ((prime & (prime - 1)) != 0)
                {
                  prime = std::__next_prime(prime);
                  v78 = (unint64_t)__p[1];
                }
                if (prime <= v78)
                {
                  if (prime >= v78)
                    goto LABEL_157;
                  v102 = vcvtps_u32_f32((float)(unint64_t)v131[1] / v132);
                  if (v78 < 3
                    || (v103 = (uint8x8_t)vcnt_s8((int8x8_t)v78), v103.i16[0] = vaddlv_u8(v103), v103.u32[0] > 1uLL))
                  {
                    v102 = std::__next_prime(v102);
                  }
                  else
                  {
                    v104 = 1 << -(char)__clz(v102 - 1);
                    if (v102 >= 2)
                      v102 = v104;
                  }
                  if (prime <= v102)
                    prime = v102;
                  if (prime >= v78)
                  {
                    v78 = (unint64_t)__p[1];
LABEL_157:
                    if ((v78 & (v78 - 1)) != 0)
                    {
                      if (v78 <= v77)
                        v2 = v77 % v78;
                      else
                        v2 = v77;
                    }
                    else
                    {
                      v2 = (v78 - 1) & v77;
                    }
                    goto LABEL_170;
                  }
                  if (!prime)
                  {
                    v111 = __p[0];
                    __p[0] = 0;
                    if (v111)
                      operator delete(v111);
                    v78 = 0;
                    __p[1] = 0;
                    goto LABEL_157;
                  }
                }
                if (prime >> 61)
                  std::__throw_bad_array_new_length[abi:nn180100]();
                v92 = operator new(8 * prime);
                v93 = __p[0];
                __p[0] = v92;
                if (v93)
                  operator delete(v93);
                v94 = 0;
                __p[1] = (void *)prime;
                do
                  *((_QWORD *)__p[0] + v94++) = 0;
                while (prime != v94);
                v95 = (_QWORD **)v131[0];
                if (!v131[0])
                {
LABEL_156:
                  v78 = prime;
                  goto LABEL_157;
                }
                v96 = *((_QWORD *)v131[0] + 1);
                v97 = prime - 1;
                if ((prime & (prime - 1)) == 0)
                {
                  v98 = v96 & v97;
                  *((_QWORD *)__p[0] + v98) = v131;
                  for (j = *v95; *v95; j = *v95)
                  {
                    v100 = j[1] & v97;
                    if (v100 == v98)
                    {
                      v95 = (_QWORD **)j;
                    }
                    else if (*((_QWORD *)__p[0] + v100))
                    {
                      *v95 = (_QWORD *)*j;
                      v101 = 8 * v100;
                      *j = **(_QWORD **)((char *)__p[0] + v101);
                      **(_QWORD **)((char *)__p[0] + v101) = j;
                    }
                    else
                    {
                      *((_QWORD *)__p[0] + v100) = v95;
                      v95 = (_QWORD **)j;
                      v98 = v100;
                    }
                  }
                  goto LABEL_156;
                }
                if (v96 >= prime)
                  v96 %= prime;
                *((_QWORD *)__p[0] + v96) = v131;
                v105 = *v95;
                if (!*v95)
                  goto LABEL_156;
                while (1)
                {
                  v107 = v105[1];
                  if (v107 >= prime)
                    v107 %= prime;
                  if (v107 != v96)
                  {
                    if (!*((_QWORD *)__p[0] + v107))
                    {
                      *((_QWORD *)__p[0] + v107) = v95;
                      goto LABEL_161;
                    }
                    *v95 = (_QWORD *)*v105;
                    v106 = 8 * v107;
                    *v105 = **(_QWORD **)((char *)__p[0] + v106);
                    **(_QWORD **)((char *)__p[0] + v106) = v105;
                    v105 = v95;
                  }
                  v107 = v96;
LABEL_161:
                  v95 = (_QWORD **)v105;
                  v105 = (_QWORD *)*v105;
                  v96 = v107;
                  if (!v105)
                    goto LABEL_156;
                }
              }
            }
          }
        }
LABEL_27:
        ++v13;
        v12 = v125;
        if (v13 != (uint64_t *)v124)
          continue;
        break;
      }
      if (v131[1])
      {
        std::vector<VKTransitLineMarker * {__strong}>::reserve((uint64_t)&v127, (unint64_t)v131[1]);
        v112 = v131[0];
        if (v131[0])
        {
          do
          {
            +[VKTransitLineMarker markerWithFeature:transitLink:](VKTransitLineMarker, "markerWithFeature:transitLink:", v112[2], v112[3], v124);
            v115 = objc_claimAutoreleasedReturnValue();
            v133[0] = v115;
            v116 = v128;
            if ((unint64_t)v128 < v129)
            {
              v113 = 0;
              v133[0] = 0;
              *v128 = v115;
              v114 = v116 + 1;
            }
            else
            {
              v114 = std::vector<objc_object * {__strong}>::__emplace_back_slow_path<objc_object * {__strong}>(&v127, v133);
              v113 = (void *)v133[0];
            }
            v128 = v114;

            v112 = (_QWORD *)*v112;
          }
          while (v112);
        }
      }
    }
    v117 = v131[0];
    if (v131[0])
    {
      do
      {
        v118 = (_QWORD *)*v117;
        operator delete(v117);
        v117 = v118;
      }
      while (v118);
    }
    v119 = __p[0];
    __p[0] = 0;
    if (v119)
      operator delete(v119);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = (uint64_t *)v127;
    if (v127)
    {
      v121 = v128;
      v122 = v127;
      if (v128 != v127)
      {
        do
        {
          v123 = (void *)*--v121;

        }
        while (v121 != v120);
        v122 = v127;
      }
      v128 = v120;
      operator delete(v122);
    }
  }
  else
  {
LABEL_25:
    v14 = 0;
  }
  return v14;
}

- (id)transitLineMarkersForSelectionAtPoint:(CGPoint)a3
{
  int8x8_t *v3;
  int8x8_t v4;
  double y;
  double x;
  uint8x8_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  char *v27;
  char *v28;
  void *v29;
  void *v30;
  void *__p;
  char *v32;
  float64x2_t v33[2];

  v3 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v4 = v3[2];
  if (!*(_QWORD *)&v4)
    goto LABEL_27;
  y = a3.y;
  x = a3.x;
  v8 = (uint8x8_t)vcnt_s8(v4);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = 0x1BCA10CB9934FB1BLL;
    if (*(_QWORD *)&v4 <= 0x1BCA10CB9934FB1BuLL)
      v9 = 0x1BCA10CB9934FB1BuLL % *(_QWORD *)&v4;
  }
  else
  {
    v9 = (*(_QWORD *)&v4 - 1) & 0x1BCA10CB9934FB1BLL;
  }
  v10 = *(_QWORD **)(*(_QWORD *)&v3[1] + 8 * v9);
  if (!v10)
    goto LABEL_27;
  v11 = (_QWORD *)*v10;
  if (!v11)
    goto LABEL_27;
  if (v8.u32[0] < 2uLL)
  {
    v12 = *(_QWORD *)&v4 - 1;
    while (1)
    {
      v14 = v11[1];
      if (v14 == 0x1BCA10CB9934FB1BLL)
      {
        if (v11[2] == 0x1BCA10CB9934FB1BLL)
          goto LABEL_22;
      }
      else if ((v14 & v12) != v9)
      {
        goto LABEL_27;
      }
      v11 = (_QWORD *)*v11;
      if (!v11)
        goto LABEL_27;
    }
  }
  while (1)
  {
    v13 = v11[1];
    if (v13 == 0x1BCA10CB9934FB1BLL)
      break;
    if (v13 >= *(_QWORD *)&v4)
      v13 %= *(_QWORD *)&v4;
    if (v13 != v9)
      goto LABEL_27;
LABEL_11:
    v11 = (_QWORD *)*v11;
    if (!v11)
      goto LABEL_27;
  }
  if (v11[2] != 0x1BCA10CB9934FB1BLL)
    goto LABEL_11;
LABEL_22:
  v15 = v11[5];
  if (!v15)
  {
LABEL_27:
    v25 = 0;
    return v25;
  }
  -[VKMapView currentCanvas](self, "currentCanvas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cameraController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && (objc_msgSend(v17, "vkCamera"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, v18))
  {
    objc_msgSend(*(id *)(*((_QWORD *)self + 48) + 840), "size");
    v20 = v19;
    objc_msgSend(*(id *)(*((_QWORD *)self + 48) + 840), "size");
    v22 = v21;
    objc_msgSend(v17, "vkCamera");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
      objc_msgSend(v23, "groundPointFromScreenPoint:", x / v20, 1.0 - y / v22);
    else
      memset(v33, 0, sizeof(v33));

    md::TransitLogic::getTransitLineMarkersForSelectionAtGroundPoint(&__p, *(float64x2_t ***)(v15 + 168), *(float64x2_t ***)(v15 + 176), (float64x2_t *)&v33[0].f64[1]);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (char *)__p;
    if (__p)
    {
      v28 = v32;
      v29 = __p;
      if (v32 != __p)
      {
        do
        {
          v30 = (void *)*((_QWORD *)v28 - 1);
          v28 -= 8;

        }
        while (v28 != v27);
        v29 = __p;
      }
      v32 = v27;
      operator delete(v29);
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)selectedTransitLineIDs
{
  unint64_t v2;
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
  uint64_t v13;
  size_t prime;
  void *v15;
  int8x8_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  uint8x8_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  float v27;
  _BOOL8 v28;
  unint64_t v29;
  unint64_t v30;
  size_t v31;
  int8x8_t v32;
  unint64_t v33;
  uint8x8_t v34;
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  _QWORD *v38;
  void *v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  unint64_t v48;
  float v49;

  v3 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v4 = v3[2];
  if (!*(_QWORD *)&v4)
    goto LABEL_25;
  v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = 0x1BCA10CB9934FB1BLL;
    if (*(_QWORD *)&v4 <= 0x1BCA10CB9934FB1BuLL)
      v6 = 0x1BCA10CB9934FB1BuLL % *(_QWORD *)&v4;
  }
  else
  {
    v6 = (*(_QWORD *)&v4 - 1) & 0x1BCA10CB9934FB1BLL;
  }
  v7 = *(_QWORD **)(*(_QWORD *)&v3[1] + 8 * v6);
  if (!v7)
    goto LABEL_25;
  v8 = (_QWORD *)*v7;
  if (!v8)
    goto LABEL_25;
  if (v5.u32[0] < 2uLL)
  {
    v9 = *(_QWORD *)&v4 - 1;
    while (1)
    {
      v11 = v8[1];
      if (v11 == 0x1BCA10CB9934FB1BLL)
      {
        if (v8[2] == 0x1BCA10CB9934FB1BLL)
          goto LABEL_22;
      }
      else if ((v11 & v9) != v6)
      {
        goto LABEL_25;
      }
      v8 = (_QWORD *)*v8;
      if (!v8)
        goto LABEL_25;
    }
  }
  while (1)
  {
    v10 = v8[1];
    if (v10 == 0x1BCA10CB9934FB1BLL)
      break;
    if (v10 >= *(_QWORD *)&v4)
      v10 %= *(_QWORD *)&v4;
    if (v10 != v6)
      goto LABEL_25;
LABEL_11:
    v8 = (_QWORD *)*v8;
    if (!v8)
      goto LABEL_25;
  }
  if (v8[2] != 0x1BCA10CB9934FB1BLL)
    goto LABEL_11;
LABEL_22:
  v12 = v8[5];
  if (!v12)
  {
LABEL_25:
    v15 = 0;
    return v15;
  }
  v43 = 0;
  v44 = 0;
  v13 = *(_QWORD *)(v12 + 264);
  prime = *(_QWORD *)(v12 + 240);
  v45 = *(_QWORD *)(v12 + 248);
  v46 = 0;
  v47 = v13;
  v48 = 0;
  v49 = *(float *)(v12 + 280);
  if (prime == 1)
  {
    prime = 2;
    goto LABEL_31;
  }
  if ((prime & (prime - 1)) != 0)
  {
    prime = std::__next_prime(prime);
    v17 = (int8x8_t)v44;
  }
  else
  {
    v17 = 0;
  }
  if (prime > *(_QWORD *)&v17)
LABEL_31:
    std::__hash_table<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::__unordered_map_hasher<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,md::TrafficFeatureHash,std::equal_to<VKTrafficFeature * {__strong}>,true>,std::__unordered_map_equal<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::equal_to<VKTrafficFeature * {__strong}>,md::TrafficFeatureHash,true>,geo::StdAllocator<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,mdm::Allocator>>::__do_rehash<true>((uint64_t)&v43, prime);
  v18 = *(_QWORD **)(v12 + 256);
  if (v18)
  {
    while (2)
    {
      v19 = v18[2];
      v20 = v44;
      if (v44)
      {
        v21 = (uint8x8_t)vcnt_s8((int8x8_t)v44);
        v21.i16[0] = vaddlv_u8(v21);
        if (v21.u32[0] > 1uLL)
        {
          v2 = v18[2];
          if (v19 >= v44)
            v2 = v19 % v44;
        }
        else
        {
          v2 = (v44 - 1) & v19;
        }
        v22 = *(_QWORD **)(v43 + 8 * v2);
        if (v22)
        {
          v23 = (_QWORD *)*v22;
          if (v23)
          {
            if (v21.u32[0] < 2uLL)
            {
              while (1)
              {
                v25 = v23[1];
                if (v25 == v19)
                {
                  if (v23[2] == v19)
                    goto LABEL_91;
                }
                else if ((v25 & (v44 - 1)) != v2)
                {
                  goto LABEL_53;
                }
                v23 = (_QWORD *)*v23;
                if (!v23)
                  goto LABEL_53;
              }
            }
            do
            {
              v24 = v23[1];
              if (v24 == v19)
              {
                if (v23[2] == v19)
                  goto LABEL_91;
              }
              else
              {
                if (v24 >= v44)
                  v24 %= v44;
                if (v24 != v2)
                  break;
              }
              v23 = (_QWORD *)*v23;
            }
            while (v23);
          }
        }
      }
LABEL_53:
      v26 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v47 + 16))(v47, 24, 8);
      *v26 = 0;
      v26[1] = v19;
      v26[2] = v18[2];
      v27 = (float)(v48 + 1);
      if (!v20 || (float)(v49 * (float)v20) < v27)
      {
        v28 = (v20 & (v20 - 1)) != 0;
        if (v20 < 3)
          v28 = 1;
        v29 = v28 | (2 * v20);
        v30 = vcvtps_u32_f32(v27 / v49);
        if (v29 <= v30)
          v31 = v30;
        else
          v31 = v29;
        if (v31 == 1)
        {
          v31 = 2;
        }
        else if ((v31 & (v31 - 1)) != 0)
        {
          v31 = std::__next_prime(v31);
        }
        v32 = (int8x8_t)v44;
        if (v31 > v44)
          goto LABEL_65;
        if (v31 < v44)
        {
          v33 = vcvtps_u32_f32((float)v48 / v49);
          if (v44 < 3 || (v34 = (uint8x8_t)vcnt_s8((int8x8_t)v44), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
          {
            v33 = std::__next_prime(v33);
          }
          else
          {
            v35 = 1 << -(char)__clz(v33 - 1);
            if (v33 >= 2)
              v33 = v35;
          }
          if (v31 <= v33)
            v31 = v33;
          if (v31 < *(_QWORD *)&v32)
LABEL_65:
            std::__hash_table<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::__unordered_map_hasher<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,md::TrafficFeatureHash,std::equal_to<VKTrafficFeature * {__strong}>,true>,std::__unordered_map_equal<VKTrafficFeature * {__strong},std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,std::equal_to<VKTrafficFeature * {__strong}>,md::TrafficFeatureHash,true>,geo::StdAllocator<std::__hash_value_type<VKTrafficFeature * {__strong},md::RouteAnnotationLabelFeature *>,mdm::Allocator>>::__do_rehash<true>((uint64_t)&v43, v31);
        }
        v20 = v44;
        if ((v44 & (v44 - 1)) != 0)
        {
          if (v19 >= v44)
            v2 = v19 % v44;
          else
            v2 = v19;
        }
        else
        {
          v2 = (v44 - 1) & v19;
        }
      }
      v36 = *(_QWORD **)(v43 + 8 * v2);
      if (v36)
      {
        *v26 = *v36;
        goto LABEL_89;
      }
      *v26 = v46;
      v46 = v26;
      *(_QWORD *)(v43 + 8 * v2) = &v46;
      if (*v26)
      {
        v37 = *(_QWORD *)(*v26 + 8);
        if ((v20 & (v20 - 1)) != 0)
        {
          if (v37 >= v20)
            v37 %= v20;
        }
        else
        {
          v37 &= v20 - 1;
        }
        v36 = (_QWORD *)(v43 + 8 * v37);
LABEL_89:
        *v36 = v26;
      }
      ++v48;
LABEL_91:
      v18 = (_QWORD *)*v18;
      if (!v18)
        break;
      continue;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v48);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v46;
  if (v46)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v38[2]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v39);

      v38 = (_QWORD *)*v38;
    }
    while (v38);
    v40 = v46;
    if (v46)
    {
      do
      {
        v41 = (_QWORD *)*v40;
        (*(void (**)(uint64_t))(*(_QWORD *)v47 + 40))(v47);
        v40 = v41;
      }
      while (v41);
    }
  }
  v42 = v43;
  v43 = 0;
  if (v42)
    (*(void (**)(uint64_t, uint64_t, unint64_t))(*(_QWORD *)v45 + 40))(v45, v42, 8 * v44);
  return v15;
}

- (void)selectTransitLineMarker:(id)a3
{
  VKTransitLineMarker *v4;
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
  md::TransitLogic *v15;
  uint64_t v16;
  int v17;
  VKMapView *v18;
  __int16 v19;
  VKTransitLineMarker *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (VKTransitLineMarker *)a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v17 = 134218242;
    v18 = self;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Select transit line marker: %@", (uint8_t *)&v17, 0x16u);
  }
  v6 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v7 = v6[2];
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8(v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v9 = 0x1BCA10CB9934FB1BLL;
      if (*(_QWORD *)&v7 <= 0x1BCA10CB9934FB1BuLL)
        v9 = 0x1BCA10CB9934FB1BuLL % *(_QWORD *)&v7;
    }
    else
    {
      v9 = (*(_QWORD *)&v7 - 1) & 0x1BCA10CB9934FB1BLL;
    }
    v10 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
    if (v10)
    {
      v11 = (_QWORD *)*v10;
      if (v11)
      {
        if (v8.u32[0] < 2uLL)
        {
          v12 = *(_QWORD *)&v7 - 1;
          while (1)
          {
            v14 = v11[1];
            if (v14 == 0x1BCA10CB9934FB1BLL)
            {
              if (v11[2] == 0x1BCA10CB9934FB1BLL)
                goto LABEL_26;
            }
            else if ((v14 & v12) != v9)
            {
              goto LABEL_28;
            }
            v11 = (_QWORD *)*v11;
            if (!v11)
              goto LABEL_28;
          }
        }
        do
        {
          v13 = v11[1];
          if (v13 == 0x1BCA10CB9934FB1BLL)
          {
            if (v11[2] == 0x1BCA10CB9934FB1BLL)
            {
LABEL_26:
              v15 = (md::TransitLogic *)v11[5];
              if (v15)
              {
                md::TransitLogic::setSelectedLines(v15, v4);
                v16 = *((_QWORD *)self + 48);
                LOBYTE(v17) = 1;
                md::MapEngine::setNeedsTick(v16, &v17);
              }
              break;
            }
          }
          else
          {
            if (v13 >= *(_QWORD *)&v7)
              v13 %= *(_QWORD *)&v7;
            if (v13 != v9)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
LABEL_28:

}

- (void)deselectTransitLineMarker
{
  NSObject *v3;
  int8x8_t *v4;
  int8x8_t v5;
  uint8x8_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  md::TransitLogic *v13;
  uint64_t v14;
  int v15;
  VKMapView *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v15 = 134217984;
    v16 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Deselect transit line marker", (uint8_t *)&v15, 0xCu);
  }
  v4 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v5 = v4[2];
  if (v5)
  {
    v6 = (uint8x8_t)vcnt_s8(v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      v7 = 0x1BCA10CB9934FB1BLL;
      if (*(_QWORD *)&v5 <= 0x1BCA10CB9934FB1BuLL)
        v7 = 0x1BCA10CB9934FB1BuLL % *(_QWORD *)&v5;
    }
    else
    {
      v7 = (*(_QWORD *)&v5 - 1) & 0x1BCA10CB9934FB1BLL;
    }
    v8 = *(_QWORD **)(*(_QWORD *)&v4[1] + 8 * v7);
    if (v8)
    {
      v9 = (_QWORD *)*v8;
      if (v9)
      {
        if (v6.u32[0] < 2uLL)
        {
          v10 = *(_QWORD *)&v5 - 1;
          while (1)
          {
            v12 = v9[1];
            if (v12 == 0x1BCA10CB9934FB1BLL)
            {
              if (v9[2] == 0x1BCA10CB9934FB1BLL)
                goto LABEL_26;
            }
            else if ((v12 & v10) != v7)
            {
              return;
            }
            v9 = (_QWORD *)*v9;
            if (!v9)
              return;
          }
        }
        do
        {
          v11 = v9[1];
          if (v11 == 0x1BCA10CB9934FB1BLL)
          {
            if (v9[2] == 0x1BCA10CB9934FB1BLL)
            {
LABEL_26:
              v13 = (md::TransitLogic *)v9[5];
              if (v13)
              {
                md::TransitLogic::setSelectedLines(v13, 0);
                v14 = *((_QWORD *)self + 48);
                LOBYTE(v15) = 1;
                md::MapEngine::setNeedsTick(v14, &v15);
              }
              return;
            }
          }
          else
          {
            if (v11 >= *(_QWORD *)&v5)
              v11 %= *(_QWORD *)&v5;
            if (v11 != v7)
              return;
          }
          v9 = (_QWORD *)*v9;
        }
        while (v9);
      }
    }
  }
}

- (void)setSelectedTrailId:(unint64_t)a3
{
  -[VKMapView setSelectedTrailWithId:name:locale:](self, "setSelectedTrailWithId:name:locale:", a3, 0, 0);
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
  uint64_t v21;
  int v22;
  VKMapView *v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v10 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v22 = 134218240;
    v23 = self;
    v24 = 2048;
    v25 = a3;
    _os_log_impl(&dword_19F029000, v10, OS_LOG_TYPE_INFO, "[VKMapView:%p] Select trail ID: %llu", (uint8_t *)&v22, 0x16u);
  }
  v11 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
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
                v21 = *((_QWORD *)self + 48);
                LOBYTE(v22) = 1;
                md::MapEngine::setNeedsTick(v21, &v22);
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

- (void)deselectTrails
{
  NSObject *v3;
  int8x8_t *v4;
  int8x8_t v5;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  md::HikingLogic *v13;
  uint64_t v14;
  int v15;
  VKMapView *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v15 = 134217984;
    v16 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Deselect trails", (uint8_t *)&v15, 0xCu);
  }
  v4 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v5 = v4[2];
  if (v5)
  {
    v6 = (uint8x8_t)vcnt_s8(v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      v7 = 0xC74495586E0C32F6;
      if (*(_QWORD *)&v5 <= 0xC74495586E0C32F6)
        v7 = 0xC74495586E0C32F6 % *(_QWORD *)&v5;
    }
    else
    {
      v7 = (*(_QWORD *)&v5 - 1) & 0xC74495586E0C32F6;
    }
    v8 = *(_QWORD **)(*(_QWORD *)&v4[1] + 8 * v7);
    if (v8)
    {
      v9 = (_QWORD *)*v8;
      if (v9)
      {
        if (v6.u32[0] < 2uLL)
        {
          v10 = *(_QWORD *)&v5 - 1;
          while (1)
          {
            v12 = v9[1];
            if (v12 == 0xC74495586E0C32F6)
            {
              if (v9[2] == 0xC74495586E0C32F6)
                goto LABEL_26;
            }
            else if ((v12 & v10) != v7)
            {
              return;
            }
            v9 = (_QWORD *)*v9;
            if (!v9)
              return;
          }
        }
        do
        {
          v11 = v9[1];
          if (v11 == 0xC74495586E0C32F6)
          {
            if (v9[2] == 0xC74495586E0C32F6)
            {
LABEL_26:
              v13 = (md::HikingLogic *)v9[5];
              if (v13)
              {
                md::HikingLogic::deselectTrails(v13);
                v14 = *((_QWORD *)self + 48);
                LOBYTE(v15) = 1;
                md::MapEngine::setNeedsTick(v14, &v15);
              }
              return;
            }
          }
          else
          {
            if (v11 >= *(_QWORD *)&v5)
              v11 %= *(_QWORD *)&v5;
            if (v11 != v7)
              return;
          }
          v9 = (_QWORD *)*v9;
        }
        while (v9);
      }
    }
  }
}

- (void)setSelectedFeatureId:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int8x8_t *v9;
  int8x8_t v10;
  uint8x8_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8x8_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  VKMapView *v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v27 = 134218240;
    v28 = self;
    v29 = 2048;
    v30 = a3;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Select feature id: %llu", (uint8_t *)&v27, 0x16u);
  }
  v6 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v6 + 4536), "-[VKMapView setSelectedFeatureId:]");
  v7 = *(_QWORD *)(v6 + 896);
  for (i = *(_QWORD *)(v7 + 32); i != *(_QWORD *)(v7 + 40); i += 16)
    (*(void (**)(_QWORD, unint64_t))(**(_QWORD **)(i + 8) + 88))(*(_QWORD *)(i + 8), a3);
  v9 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v10 = v9[2];
  if (!*(_QWORD *)&v10)
    return;
  v11 = (uint8x8_t)vcnt_s8(v10);
  v11.i16[0] = vaddlv_u8(v11);
  v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    v13 = 0x3B36D43422893971;
    if (*(_QWORD *)&v10 <= 0x3B36D43422893971uLL)
      v13 = 0x3B36D43422893971uLL % *(_QWORD *)&v10;
  }
  else
  {
    v13 = (*(_QWORD *)&v10 - 1) & 0x3B36D43422893971;
  }
  v14 = *(_QWORD **)(*(_QWORD *)&v9[1] + 8 * v13);
  if (!v14)
    goto LABEL_33;
  v15 = (_QWORD *)*v14;
  if (!v15)
    goto LABEL_33;
  if (v11.u32[0] < 2uLL)
  {
    while (1)
    {
      v17 = v15[1];
      if (v17 == 0x3B36D43422893971)
      {
        if (v15[2] == 0x3B36D43422893971)
          goto LABEL_29;
      }
      else if ((v17 & (*(_QWORD *)&v10 - 1)) != v13)
      {
        goto LABEL_31;
      }
      v15 = (_QWORD *)*v15;
      if (!v15)
        goto LABEL_31;
    }
  }
  while (1)
  {
    v16 = v15[1];
    if (v16 == 0x3B36D43422893971)
      break;
    if (v16 >= *(_QWORD *)&v10)
      v16 %= *(_QWORD *)&v10;
    if (v16 != v13)
      goto LABEL_31;
LABEL_18:
    v15 = (_QWORD *)*v15;
    if (!v15)
      goto LABEL_31;
  }
  if (v15[2] != 0x3B36D43422893971)
    goto LABEL_18;
LABEL_29:
  v18 = v15[5];
  if (v18)
  {
    *(_QWORD *)(v18 + 216) = a3;
    *(_BYTE *)(v18 + 224) = 1;
    v10 = v9[2];
  }
LABEL_31:
  if (!*(_QWORD *)&v10)
    return;
  v19 = (uint8x8_t)vcnt_s8(v10);
  v19.i16[0] = vaddlv_u8(v19);
  v12 = v19.u32[0];
LABEL_33:
  if (v12 > 1)
  {
    v20 = 0x3C2657D301A7BCF4;
    if (*(_QWORD *)&v10 <= 0x3C2657D301A7BCF4uLL)
      v20 = 0x3C2657D301A7BCF4uLL % *(_QWORD *)&v10;
  }
  else
  {
    v20 = (*(_QWORD *)&v10 - 1) & 0x3C2657D301A7BCF4;
  }
  v21 = *(_QWORD **)(*(_QWORD *)&v9[1] + 8 * v20);
  if (v21)
  {
    v22 = (_QWORD *)*v21;
    if (v22)
    {
      if (v12 < 2)
      {
        v23 = *(_QWORD *)&v10 - 1;
        while (1)
        {
          v25 = v22[1];
          if (v25 == 0x3C2657D301A7BCF4)
          {
            if (v22[2] == 0x3C2657D301A7BCF4)
              goto LABEL_53;
          }
          else if ((v25 & v23) != v20)
          {
            return;
          }
          v22 = (_QWORD *)*v22;
          if (!v22)
            return;
        }
      }
      do
      {
        v24 = v22[1];
        if (v24 == 0x3C2657D301A7BCF4)
        {
          if (v22[2] == 0x3C2657D301A7BCF4)
          {
LABEL_53:
            v26 = v22[5];
            if (v26)
            {
              *(_QWORD *)(v26 + 120) = a3;
              *(_BYTE *)(v26 + 128) = 1;
            }
            return;
          }
        }
        else
        {
          if (v24 >= *(_QWORD *)&v10)
            v24 %= *(_QWORD *)&v10;
          if (v24 != v20)
            return;
        }
        v22 = (_QWORD *)*v22;
      }
      while (v22);
    }
  }
}

- (void)deselectFeatureId
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  int8x8_t *v7;
  int8x8_t v8;
  uint8x8_t v9;
  uint64_t v10;
  int8x8_t v11;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  VKMapView *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v24 = 134217984;
    v25 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Deselect feature id", (uint8_t *)&v24, 0xCu);
  }
  v4 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v4 + 4536), "-[VKMapView deselectFeatureId]");
  v5 = *(_QWORD *)(v4 + 896);
  for (i = *(_QWORD *)(v5 + 32); i != *(_QWORD *)(v5 + 40); i += 16)
    (*(void (**)(_QWORD))(**(_QWORD **)(i + 8) + 96))(*(_QWORD *)(i + 8));
  v7 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v8 = v7[2];
  if (!*(_QWORD *)&v8)
    return;
  v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    v10 = 0x3B36D43422893971;
    if (*(_QWORD *)&v8 <= 0x3B36D43422893971uLL)
      v10 = 0x3B36D43422893971uLL % *(_QWORD *)&v8;
  }
  else
  {
    v10 = (*(_QWORD *)&v8 - 1) & 0x3B36D43422893971;
  }
  v11 = v7[1];
  v12 = *(_QWORD **)(*(_QWORD *)&v11 + 8 * v10);
  if (!v12)
    goto LABEL_32;
  v13 = (_QWORD *)*v12;
  if (!v13)
    goto LABEL_32;
  if (v9.u32[0] < 2uLL)
  {
    while (1)
    {
      v15 = v13[1];
      if (v15 == 0x3B36D43422893971)
      {
        if (v13[2] == 0x3B36D43422893971)
          goto LABEL_29;
      }
      else if ((v15 & (*(_QWORD *)&v8 - 1)) != v10)
      {
        goto LABEL_32;
      }
      v13 = (_QWORD *)*v13;
      if (!v13)
        goto LABEL_32;
    }
  }
  while (1)
  {
    v14 = v13[1];
    if (v14 == 0x3B36D43422893971)
      break;
    if (v14 >= *(_QWORD *)&v8)
      v14 %= *(_QWORD *)&v8;
    if (v14 != v10)
      goto LABEL_32;
LABEL_18:
    v13 = (_QWORD *)*v13;
    if (!v13)
      goto LABEL_32;
  }
  if (v13[2] != 0x3B36D43422893971)
    goto LABEL_18;
LABEL_29:
  v16 = v13[5];
  if (v16 && *(_BYTE *)(v16 + 224))
    *(_BYTE *)(v16 + 224) = 0;
LABEL_32:
  if (v9.u32[0] > 1uLL)
  {
    v17 = 0x3C2657D301A7BCF4;
    if (*(_QWORD *)&v8 <= 0x3C2657D301A7BCF4uLL)
      v17 = 0x3C2657D301A7BCF4uLL % *(_QWORD *)&v8;
  }
  else
  {
    v17 = (*(_QWORD *)&v8 - 1) & 0x3C2657D301A7BCF4;
  }
  v18 = *(_QWORD **)(*(_QWORD *)&v11 + 8 * v17);
  if (v18)
  {
    v19 = (_QWORD *)*v18;
    if (v19)
    {
      if (v9.u32[0] < 2uLL)
      {
        v20 = *(_QWORD *)&v8 - 1;
        while (1)
        {
          v22 = v19[1];
          if (v22 == 0x3C2657D301A7BCF4)
          {
            if (v19[2] == 0x3C2657D301A7BCF4)
              goto LABEL_52;
          }
          else if ((v22 & v20) != v17)
          {
            return;
          }
          v19 = (_QWORD *)*v19;
          if (!v19)
            return;
        }
      }
      do
      {
        v21 = v19[1];
        if (v21 == 0x3C2657D301A7BCF4)
        {
          if (v19[2] == 0x3C2657D301A7BCF4)
          {
LABEL_52:
            v23 = v19[5];
            if (v23)
            {
              if (*(_BYTE *)(v23 + 128))
                *(_BYTE *)(v23 + 128) = 0;
            }
            return;
          }
        }
        else
        {
          if (v21 >= *(_QWORD *)&v8)
            v21 %= *(_QWORD *)&v8;
          if (v21 != v17)
            return;
        }
        v19 = (_QWORD *)*v19;
      }
      while (v19);
    }
  }
}

- (void)setSelectedVenuePoiFeatureId:(unint64_t)a3
{
  NSObject *v5;
  int8x8_t *v6;
  int8x8_t v7;
  uint8x8_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  VKMapView *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v16 = 134218240;
    v17 = self;
    v18 = 2048;
    v19 = a3;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Select venue poi feature id: %llu", (uint8_t *)&v16, 0x16u);
  }
  v6 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v7 = v6[2];
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8(v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v9 = 0xEC9B77B4222D22FFLL;
      if (*(_QWORD *)&v7 <= 0xEC9B77B4222D22FFLL)
        v9 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v7;
    }
    else
    {
      v9 = (*(_QWORD *)&v7 - 1) & 0xEC9B77B4222D22FFLL;
    }
    v10 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
    if (v10)
    {
      v11 = (_QWORD *)*v10;
      if (v11)
      {
        if (v8.u32[0] < 2uLL)
        {
          v12 = *(_QWORD *)&v7 - 1;
          while (1)
          {
            v14 = v11[1];
            if (v14 == 0xEC9B77B4222D22FFLL)
            {
              if (v11[2] == 0xEC9B77B4222D22FFLL)
                goto LABEL_26;
            }
            else if ((v14 & v12) != v9)
            {
              return;
            }
            v11 = (_QWORD *)*v11;
            if (!v11)
              return;
          }
        }
        do
        {
          v13 = v11[1];
          if (v13 == 0xEC9B77B4222D22FFLL)
          {
            if (v11[2] == 0xEC9B77B4222D22FFLL)
            {
LABEL_26:
              v15 = v11[5];
              if (v15)
                *(_QWORD *)(v15 + 592) = a3;
              return;
            }
          }
          else
          {
            if (v13 >= *(_QWORD *)&v7)
              v13 %= *(_QWORD *)&v7;
            if (v13 != v9)
              return;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
}

- (void)deselectVenuePoiFeatureId
{
  NSObject *v3;
  int8x8_t *v4;
  int8x8_t v5;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  VKMapView *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v14 = 134217984;
    v15 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Deselect venue poi feature", (uint8_t *)&v14, 0xCu);
  }
  v4 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v5 = v4[2];
  if (v5)
  {
    v6 = (uint8x8_t)vcnt_s8(v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      v7 = 0xEC9B77B4222D22FFLL;
      if (*(_QWORD *)&v5 <= 0xEC9B77B4222D22FFLL)
        v7 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v5;
    }
    else
    {
      v7 = (*(_QWORD *)&v5 - 1) & 0xEC9B77B4222D22FFLL;
    }
    v8 = *(_QWORD **)(*(_QWORD *)&v4[1] + 8 * v7);
    if (v8)
    {
      v9 = (_QWORD *)*v8;
      if (v9)
      {
        if (v6.u32[0] < 2uLL)
        {
          v10 = *(_QWORD *)&v5 - 1;
          while (1)
          {
            v12 = v9[1];
            if (v12 == 0xEC9B77B4222D22FFLL)
            {
              if (v9[2] == 0xEC9B77B4222D22FFLL)
                goto LABEL_26;
            }
            else if ((v12 & v10) != v7)
            {
              return;
            }
            v9 = (_QWORD *)*v9;
            if (!v9)
              return;
          }
        }
        do
        {
          v11 = v9[1];
          if (v11 == 0xEC9B77B4222D22FFLL)
          {
            if (v9[2] == 0xEC9B77B4222D22FFLL)
            {
LABEL_26:
              v13 = v9[5];
              if (v13)
                *(_QWORD *)(v13 + 592) = 0;
              return;
            }
          }
          else
          {
            if (v11 >= *(_QWORD *)&v5)
              v11 %= *(_QWORD *)&v5;
            if (v11 != v7)
              return;
          }
          v9 = (_QWORD *)*v9;
        }
        while (v9);
      }
    }
  }
}

- (void)setSelectedBuildingFeatureIds:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  unint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t **v18;
  uint64_t **v19;
  unint64_t v20;
  int8x8_t *v21;
  int8x8_t v22;
  uint8x8_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  BOOL v35;
  _QWORD *v36;
  _QWORD *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  _BYTE buf[24];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Select building feature ids %@", buf, 0x16u);
  }
  if ((objc_msgSend(v4, "isEqualToSet:", *((_QWORD *)self + 61)) & 1) != 0)
    goto LABEL_69;
  v6 = v4;
  v7 = v6;
  if (v6)
    v8 = v6;
  v9 = (void *)*((_QWORD *)self + 61);
  *((_QWORD *)self + 61) = v7;

  *(_QWORD *)&buf[8] = 0;
  *(_QWORD *)&buf[16] = 0;
  *(_QWORD *)buf = &buf[8];
  if (v7)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v10);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v38);
          v15 = (uint64_t *)operator new(0x28uLL);
          v16 = v15;
          v15[4] = v14;
          v17 = *(uint64_t **)&buf[8];
          v18 = (uint64_t **)&buf[8];
          v19 = (uint64_t **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            while (1)
            {
              while (1)
              {
                v19 = (uint64_t **)v17;
                v20 = v17[4];
                if (v14 >= v20)
                  break;
                v17 = (uint64_t *)*v17;
                v18 = v19;
                if (!*v19)
                  goto LABEL_23;
              }
              if (v20 >= v14)
                break;
              v17 = (uint64_t *)v17[1];
              if (!v17)
              {
                v18 = v19 + 1;
                goto LABEL_23;
              }
            }
            operator delete(v15);
          }
          else
          {
LABEL_23:
            *v15 = 0;
            v15[1] = 0;
            v15[2] = (uint64_t)v19;
            *v18 = v15;
            if (**(_QWORD **)buf)
            {
              *(_QWORD *)buf = **(_QWORD **)buf;
              v16 = *v18;
            }
            std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&buf[8], v16);
            ++*(_QWORD *)&buf[16];
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v11);
    }

  }
  v21 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v22 = v21[2];
  if (!*(_QWORD *)&v22)
    goto LABEL_48;
  v23 = (uint8x8_t)vcnt_s8(v22);
  v23.i16[0] = vaddlv_u8(v23);
  if (v23.u32[0] > 1uLL)
  {
    v24 = 0x1F3242C85D9F2F62;
    if (*(_QWORD *)&v22 <= 0x1F3242C85D9F2F62uLL)
      v24 = 0x1F3242C85D9F2F62uLL % *(_QWORD *)&v22;
  }
  else
  {
    v24 = (*(_QWORD *)&v22 - 1) & 0x1F3242C85D9F2F62;
  }
  v25 = *(_QWORD **)(*(_QWORD *)&v21[1] + 8 * v24);
  if (!v25 || (v26 = (_QWORD *)*v25) == 0)
  {
LABEL_48:
    v30 = 0;
    goto LABEL_49;
  }
  if (v23.u32[0] < 2uLL)
  {
    v27 = *(_QWORD *)&v22 - 1;
    while (1)
    {
      v29 = v26[1];
      if (v29 == 0x1F3242C85D9F2F62)
      {
        if (v26[2] == 0x1F3242C85D9F2F62)
          goto LABEL_70;
      }
      else if ((v29 & v27) != v24)
      {
        goto LABEL_48;
      }
      v26 = (_QWORD *)*v26;
      if (!v26)
        goto LABEL_48;
    }
  }
  while (1)
  {
    v28 = v26[1];
    if (v28 == 0x1F3242C85D9F2F62)
      break;
    if (v28 >= *(_QWORD *)&v22)
      v28 %= *(_QWORD *)&v22;
    if (v28 != v24)
      goto LABEL_48;
LABEL_38:
    v26 = (_QWORD *)*v26;
    if (!v26)
      goto LABEL_48;
  }
  if (v26[2] != 0x1F3242C85D9F2F62)
    goto LABEL_38;
LABEL_70:
  v30 = v26[5];
LABEL_49:
  if (*(_QWORD *)(v30 + 392) == *(_QWORD *)&buf[16])
  {
    v31 = *(_QWORD **)(v30 + 376);
    if (v31 != (_QWORD *)(v30 + 384))
    {
      v32 = *(_QWORD **)buf;
      while (v31[4] == v32[4])
      {
        v33 = (_QWORD *)v31[1];
        v34 = v31;
        if (v33)
        {
          do
          {
            v31 = v33;
            v33 = (_QWORD *)*v33;
          }
          while (v33);
        }
        else
        {
          do
          {
            v31 = (_QWORD *)v34[2];
            v35 = *v31 == (_QWORD)v34;
            v34 = v31;
          }
          while (!v35);
        }
        v36 = (_QWORD *)v32[1];
        if (v36)
        {
          do
          {
            v37 = v36;
            v36 = (_QWORD *)*v36;
          }
          while (v36);
        }
        else
        {
          do
          {
            v37 = (_QWORD *)v32[2];
            v35 = *v37 == (_QWORD)v32;
            v32 = v37;
          }
          while (!v35);
        }
        v32 = v37;
        if (v31 == (_QWORD *)(v30 + 384))
          goto LABEL_68;
      }
      goto LABEL_65;
    }
  }
  else
  {
LABEL_65:
    if ((_BYTE *)(v30 + 376) != buf)
      std::__tree<objc_object  {objcproto14VKRouteOverlay}*>::__assign_multi<std::__tree_const_iterator<objc_object  {objcproto14VKRouteOverlay}*,std::__tree_node<objc_object  {objcproto14VKRouteOverlay}*,void *> *,long>>((uint64_t **)(v30 + 376), *(_QWORD **)buf, &buf[8]);
    std::__tree<objc_object  {objcproto14VKRouteOverlay}*>::__assign_multi<std::__tree_const_iterator<objc_object  {objcproto14VKRouteOverlay}*,std::__tree_node<objc_object  {objcproto14VKRouteOverlay}*,void *> *,long>>((uint64_t **)(v30 + 400), *(_QWORD **)(v30 + 376), (_QWORD *)(v30 + 384));
    *(_BYTE *)(v30 + 448) = 1;
  }
LABEL_68:
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(*(_QWORD **)&buf[8]);
LABEL_69:

}

- (void)enter3DMode
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  VKMapView *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Enter 3d mode", (uint8_t *)&v6, 0xCu);
  }
  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "enter3DMode");

}

- (void)exit3DMode
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  VKMapView *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "[VKMapView:%p] Exit 3d mode", (uint8_t *)&v6, 0xCu);
  }
  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "exit3DMode");

}

- (BOOL)supportsGPUFrameCaptureToDestination
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)self + 48) + 24) + 8) + 19);
}

- (BOOL)canEnter3DModeFlyoverForTileSize:(int64_t)a3
{
  double v3;

  -[VKMapView currentZoomLevelForTileSize:](self, "currentZoomLevelForTileSize:", a3);
  return v3 > 7.5;
}

- (BOOL)isFullyPitched
{
  void *v2;
  void *v3;
  char v4;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFullyPitched");

  return v4;
}

- (double)minPitch
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minPitch");
  v5 = v4;

  return v5;
}

- (double)maxPitch
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maxPitch");
  v5 = v4;

  return v5;
}

- (void)setFlyoverMode:(int)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  VKMapView *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  int v32;
  _QWORD v33[5];
  int v34;
  char v35;

  if (*((_DWORD *)self + 99) == a3)
    return;
  v5 = +[MDARController isSupported](MDARController, "isSupported");
  v6 = v5;
  if (!*(_BYTE *)(*((_QWORD *)self + 48) + 1241))
  {
    -[VKMapView currentCanvas](self, "currentCanvas");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)self + 6);

    if (v8 != v9)
      return;
    switch(a3)
    {
      case -1:
        v10 = (void *)*((_QWORD *)self + 6);
        objc_msgSend(v10, "globeCameraController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setCameraController:", v11);

        **(_BYTE **)(*((_QWORD *)self + 48) + 1056) = 0;
        objc_msgSend(*((id *)self + 6), "globeCameraController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTourShouldResumeWhenDoneGesturing:", 1);

        v13 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
        v35 = 2;
        md::MapEngineSettings::set(v13, &v35, (_QWORD *)1);
        goto LABEL_25;
      case 0:
        v26 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
        v35 = 2;
        md::MapEngineSettings::set(v26, &v35, 0);
        if (v6)
        {
          **(_BYTE **)(*((_QWORD *)self + 48) + 1056) = 1;
          v27 = (void *)*((_QWORD *)self + 6);
          objc_msgSend(v27, "arCameraController");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setCameraController:", v28);

          if ((*((_DWORD *)self + 99) - 1) > 1)
          {
LABEL_23:
            v19 = self;
            v20 = 10;
            goto LABEL_24;
          }
          objc_msgSend(*((id *)self + 50), "run:", 1);
          objc_msgSend(*((id *)self + 6), "arCameraController");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)self + 6), "globeCameraController");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "trasitionToARModeFromCameraFrame:withDuration:completion:", *(_QWORD *)(objc_msgSend(v30, "globeView") + 72) + 8, 0, 0.5);

        }
        else
        {
          objc_msgSend(*((id *)self + 6), "globeCameraController");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setTourShouldResumeWhenDoneGesturing:", 0);
        }

        goto LABEL_23;
      case 1:
        if (!*((_DWORD *)self + 99))
        {
          objc_msgSend(*((id *)self + 6), "arCameraController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "updateCameraFrameFromARTransform");

          v15 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
          v35 = 2;
          md::MapEngineSettings::set(v15, &v35, 0);
        }
        v16 = (void *)*((_QWORD *)self + 6);
        objc_msgSend(v16, "globeCameraController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCameraController:", v17);

        **(_BYTE **)(*((_QWORD *)self + 48) + 1056) = 0;
        objc_msgSend(*((id *)self + 6), "globeCameraController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTourShouldResumeWhenDoneGesturing:", 1);

        v19 = self;
        v20 = 3;
LABEL_24:
        -[VKMapView setMapType:](v19, "setMapType:", v20);
        goto LABEL_25;
      case 2:
        if (!*((_DWORD *)self + 99))
        {
          objc_msgSend(*((id *)self + 6), "arCameraController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "updateCameraFrameFromARTransform");

          v22 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
          v35 = 2;
          md::MapEngineSettings::set(v22, &v35, (_QWORD *)1);
        }
        v23 = (void *)*((_QWORD *)self + 6);
        objc_msgSend(v23, "globeCameraController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCameraController:", v24);

        **(_BYTE **)(*((_QWORD *)self + 48) + 1056) = 0;
        objc_msgSend(*((id *)self + 6), "globeCameraController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTourShouldResumeWhenDoneGesturing:", 0);

        goto LABEL_25;
      default:
LABEL_25:
        *((_DWORD *)self + 99) = a3;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __28__VKMapView_setFlyoverMode___block_invoke_2;
        v31[3] = &unk_1E42EB310;
        v31[4] = self;
        v32 = a3;
        -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v31);
        return;
    }
  }
  objc_msgSend(*((id *)self + 31), "setTourShouldResumeWhenDoneGesturing:", !v5);
  if (a3 == -1)
  {
    -[VKMapView stopFlyoverAnimation](self, "stopFlyoverAnimation");
  }
  else
  {
    v7 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
    v35 = 2;
    md::MapEngineSettings::set(v7, &v35, 0);
    if (-[VKMapView mapType](self, "mapType") != 3)
      -[VKMapView setMapType:](self, "setMapType:", 3);
  }
  *((_DWORD *)self + 99) = a3;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __28__VKMapView_setFlyoverMode___block_invoke;
  v33[3] = &unk_1E42EB310;
  v33[4] = self;
  v34 = a3;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v33);
}

- (int)flyoverMode
{
  return *((_DWORD *)self + 99);
}

- (void)panWithOffset:(CGPoint)a3 relativeToScreenPoint:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  double y;
  double x;
  double v11;
  double v12;
  void *v14;
  void *v15;
  void (**v16)(void);

  v8 = a5;
  y = a4.y;
  x = a4.x;
  v11 = a3.y;
  v12 = a3.x;
  v16 = (void (**)(void))a7;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cameraController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "panWithOffset:relativeToScreenPoint:animated:duration:completionHandler:", v8, v16, v12, v11, x, y, a6);
  }
  else if (v16)
  {
    v16[2]();
  }

}

- (BOOL)shouldHideOffscreenSelectedAnnotation
{
  void *v2;
  char v3;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldHideOffscreenSelectedAnnotation");

  return v3;
}

- (VKLabelMarker)selectedLabelMarker
{
  return +[VKLabelMarker markerWithLabelMarker:](VKLabelMarker, "markerWithLabelMarker:", *(_QWORD *)(*(_QWORD *)(-[VKMapView _labelSettings](self, "_labelSettings") + 16) + 40) + 32);
}

- (NSArray)labelMarkers
{
  uint64_t v2;
  unsigned __int8 v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v17;
  geo::read_write_lock *v18;
  const char *v19;
  malloc_zone_t *zone;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v2 = *(_QWORD *)(*(_QWORD *)(-[VKMapView _labelSettings](self, "_labelSettings") + 16) + 24);
  v22 = 0;
  v23 = 0;
  v21 = 0;
  {
    v17 = operator new();
    *(_QWORD *)(v17 + 16) = 0x5ED09DD50000000FLL;
    *(_QWORD *)(v17 + 24) = "VectorKitLabels";
    *(_OWORD *)(v17 + 32) = xmmword_19FFB2E80;
    *(_QWORD *)v17 = &off_1E42B5668;
    *(_QWORD *)(v17 + 8) = "VectorKitLabels";
    *(_OWORD *)(v17 + 72) = 0u;
    *(_OWORD *)(v17 + 88) = 0u;
    *(_OWORD *)(v17 + 104) = 0u;
    *(_OWORD *)(v17 + 120) = 0u;
    *(_OWORD *)(v17 + 136) = 0u;
    *(_OWORD *)(v17 + 152) = 0u;
    *(_OWORD *)(v17 + 168) = 0u;
    *(_OWORD *)(v17 + 184) = 0u;
    *(_OWORD *)(v17 + 200) = 0u;
    *(_OWORD *)(v17 + 216) = 0u;
    *(_OWORD *)(v17 + 232) = 0u;
    *(_QWORD *)(v17 + 248) = 0;
    *(_OWORD *)(v17 + 56) = 0u;
    v18 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v17 + 56), 0);
    if ((_DWORD)v18)
      geo::read_write_lock::logFailure(v18, (uint64_t)"initialization", v19);
    zone = malloc_create_zone(0, 0);
    *(_QWORD *)(v17 + 48) = zone;
    malloc_set_zone_name(zone, "VectorKitLabels");
    *(_QWORD *)(v17 + 256) = os_log_create("com.apple.VectorKit", "Memory");
    mdm::Allocator::instance(void)::alloc = v17;
  }
  v24 = mdm::Allocator::instance(void)::alloc;
  std::recursive_mutex::lock((std::recursive_mutex *)(v2 + 24));
  (*(void (**)(_QWORD, uint64_t *))(**(_QWORD **)(v2 + 240) + 216))(*(_QWORD *)(v2 + 240), &v21);
  std::recursive_mutex::unlock((std::recursive_mutex *)(v2 + 24));
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend(v4, "initWithCapacity:", (v22 - v21) >> 4);
  v6 = v21;
  for (i = v22; v6 != i; v6 += 16)
  {
    +[VKLabelMarker markerWithLabelMarker:](VKLabelMarker, "markerWithLabelMarker:", v6, v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v5, "addObject:", v8);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v21;
  if (v21)
  {
    v11 = v22;
    v12 = v21;
    if (v22 != v21)
    {
      do
      {
        v13 = *(std::__shared_weak_count **)(v11 - 8);
        if (v13)
        {
          p_shared_owners = (unint64_t *)&v13->__shared_owners_;
          do
            v15 = __ldaxr(p_shared_owners);
          while (__stlxr(v15 - 1, p_shared_owners));
          if (!v15)
          {
            ((void (*)(std::__shared_weak_count *, uint64_t))v13->__on_zero_shared)(v13, v12);
            std::__shared_weak_count::__release_weak(v13);
          }
        }
        v11 -= 16;
      }
      while (v11 != v10);
      v12 = v21;
    }
    v22 = v10;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v24 + 40))(v24, v12, v23 - v12);
  }
  return (NSArray *)v9;
}

- (double)trackingZoomScale
{
  void *v2;
  double result;

  v2 = (void *)*((_QWORD *)self + 33);
  if (!v2)
    return 1.0;
  objc_msgSend(v2, "zoomScale");
  return result;
}

- (void)setTrackingZoomScale:(double)a3
{
  NSObject *v5;
  int v6;
  VKMapView *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = 134218240;
    v7 = self;
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set tracking zoom scale: %f", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(*((id *)self + 33), "setZoomScale:", a3);
}

- ($FF918C85BF8E73478720C66798E418D4)annotationTrackingBehavior
{
  void *v4;
  $FF918C85BF8E73478720C66798E418D4 *result;
  id v6;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v6)
    {
      objc_msgSend(v6, "annotationTrackingBehavior");
    }
    else
    {
      *(_QWORD *)&retstr->var0 = 0;
      retstr->var1 = 0.0;
      *(_QWORD *)&retstr->var2 = 0;
    }
  }
  else
  {
    *(_OWORD *)&retstr->var0 = VKAnnotationTrackingBehaviorDefault;
    *(_QWORD *)&retstr->var2 = 1;
  }

  return result;
}

- (void)setAnnotationTrackingBehavior:(id *)a3
{
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = *(_OWORD *)&a3->var0;
    v7 = *(_QWORD *)&a3->var2;
    objc_msgSend(v5, "setAnnotationTrackingBehavior:", &v6);
  }

}

- (void)setHasVehicleHeading:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setHasVehicleHeading:", v3);

}

- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v9 = a5;
  v10 = a4;
  v15 = a3;
  v12 = a7;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cameraController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "startTrackingAnnotation:trackHeading:animated:duration:timingFunction:", v15, v10, v9, v12, a6);

}

- (void)stopTrackingAnnotation
{
  void *v2;
  id v3;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stopTrackingAnnotation");

}

- (void)addRouteOverlay:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  VKMapView *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = -[VKMapView targetDisplay](self, "targetDisplay");
    if (v6 > 2)
      v7 = &stru_1E4315B30;
    else
      v7 = off_1E42EB3E8[v6];
    v9 = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Adding route overlay: %@, and the target display: %@", (uint8_t *)&v9, 0x20u);
  }

  v8 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v8 + 4536), "-[VKMapView addRouteOverlay:]");
  md::RouteOverlayContainer::addOverlay(*(_QWORD *)(*(_QWORD *)(v8 + 896) + 16), v4, 0);

}

- (void)removeRouteOverlay:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  VKMapView *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = -[VKMapView targetDisplay](self, "targetDisplay");
    if (v6 > 2)
      v7 = &stru_1E4315B30;
    else
      v7 = off_1E42EB3E8[v6];
    v9 = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Removing route overlay: %@, and the target display: %@", (uint8_t *)&v9, 0x20u);
  }

  v8 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v8 + 4536), "-[VKMapView removeRouteOverlay:]");
  md::RouteOverlayContainer::removeOverlay(*(_QWORD *)(*(_QWORD *)(v8 + 896) + 16), v4, 0);

}

- (void)addPersistentRouteOverlay:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  VKMapView *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = -[VKMapView targetDisplay](self, "targetDisplay");
    if (v6 > 2)
      v7 = &stru_1E4315B30;
    else
      v7 = off_1E42EB3E8[v6];
    v9 = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Adding persistent route overlay: %@, and the target display: %@", (uint8_t *)&v9, 0x20u);
  }

  v8 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v8 + 4536), "-[VKMapView addPersistentRouteOverlay:]");
  md::RouteOverlayContainer::addOverlay(*(_QWORD *)(*(_QWORD *)(v8 + 896) + 16), v4, 1);

}

- (void)removePersistentRouteOverlay:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  VKMapView *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = -[VKMapView targetDisplay](self, "targetDisplay");
    if (v6 > 2)
      v7 = &stru_1E4315B30;
    else
      v7 = off_1E42EB3E8[v6];
    v9 = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Removing persistent route overlay: %@, and the target display: %@", (uint8_t *)&v9, 0x20u);
  }

  v8 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v8 + 4536), "-[VKMapView removePersistentRouteOverlay:]");
  md::RouteOverlayContainer::removeOverlay(*(_QWORD *)(*(_QWORD *)(v8 + 896) + 16), v4, 1);

}

- (void)addOverlay:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOverlay:", v4);

  v6 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v9 = 5;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overlays");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  md::MapEngineSettings::set(v6, &v9, (_QWORD *)(objc_msgSend(v8, "count") != 0));

}

- (void)removeOverlay:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeOverlay:", v4);

  v6 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v9 = 5;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overlays");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  md::MapEngineSettings::set(v6, &v9, (_QWORD *)(objc_msgSend(v8, "count") != 0));

}

- (void)insertOverlay:(id)a3 aboveOverlay:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertOverlay:aboveOverlay:", v6, v7);

  v9 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v12 = 5;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "overlays");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  md::MapEngineSettings::set(v9, &v12, (_QWORD *)(objc_msgSend(v11, "count") != 0));

}

- (void)insertOverlay:(id)a3 belowOverlay:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertOverlay:belowOverlay:", v6, v7);

  v9 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v12 = 5;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "overlays");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  md::MapEngineSettings::set(v9, &v12, (_QWORD *)(objc_msgSend(v11, "count") != 0));

}

- (void)setRouteUserOffset:(PolylineCoordinate)a3
{
  NSObject *v5;
  _QWORD *v6;
  PolylineCoordinate *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  _BYTE v14[32];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v14 = 134218496;
    *(_QWORD *)&v14[4] = self;
    *(_WORD *)&v14[12] = 1024;
    *(_DWORD *)&v14[14] = a3.index;
    *(_WORD *)&v14[18] = 2048;
    *(double *)&v14[20] = a3.offset;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Setting route user offset: %d.%f", v14, 0x1Cu);
  }
  v6 = -[VKMapView _labelSettings](self, "_labelSettings");
  *(PolylineCoordinate *)(*(_QWORD *)(v6[1] + 40) + 184) = a3;
  v7 = *(PolylineCoordinate **)(v6[1] + 24);
  v7[445] = a3;
  *(_QWORD *)v14 = &off_1E42C9A70;
  *(_QWORD *)&v14[8] = v7;
  *(PolylineCoordinate *)&v14[16] = a3;
  *(_QWORD *)&v14[24] = v14;
  md::LabelManager::queueCommand((md::LabelManager *)v7, 25, 1, v14);
  v8 = *(_QWORD **)&v14[24];
  if (*(_BYTE **)&v14[24] == v14)
  {
    v9 = 4;
    v8 = v14;
  }
  else
  {
    if (!*(_QWORD *)&v14[24])
      goto LABEL_10;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_10:
  v10 = *(_QWORD *)(*((_QWORD *)self + 48) + 1120);
  v11 = *(_QWORD *)(v10 + 16);
  if ((v11 & (v11 - 1)) != 0)
  {
    v13 = 0xBEC1A12372CEEC00;
    if (v11 <= 0xBEC1A12372CEEC00)
      v13 = 0xBEC1A12372CEEC00 % v11;
    v12 = *(_QWORD **)(*(_QWORD *)(v10 + 8) + 8 * v13);
    do
    {
      do
        v12 = (_QWORD *)*v12;
      while (v12[1] != 0xBEC1A12372CEEC00);
    }
    while (v12[2] != 0xBEC1A12372CEEC00);
  }
  else
  {
    v12 = *(_QWORD **)(*(_QWORD *)(v10 + 8) + 8 * ((v11 - 1) & 0xBEC1A12372CEEC00));
    do
    {
      do
        v12 = (_QWORD *)*v12;
      while (v12[1] != 0xBEC1A12372CEEC00);
    }
    while (v12[2] != 0xBEC1A12372CEEC00);
  }
  *(PolylineCoordinate *)(v12[5] + 200) = a3;
}

- (void)setCurrentLocationText:(id)a3
{
  NSString *v4;
  NSObject *v5;
  int v6;
  VKMapView *v7;
  __int16 v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = 134218243;
    v7 = self;
    v8 = 2113;
    v9 = v4;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Setting current location text: %{private}@", (uint8_t *)&v6, 0x16u);
  }
  md::LabelSettings_Navigation::setCurrentLocationText((md::LabelSettings_Navigation *)(-[VKMapView _labelSettings](self, "_labelSettings") + 8), v4);

}

- (void)setRouteContext:(id)a3
{
  unsigned __int8 v3;
  VKRouteContext *v6;
  NSObject *v7;
  unsigned __int8 v8;
  int8x8_t *v9;
  int8x8_t v10;
  uint8x8_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  md::TransitLogic *v18;
  int8x8_t *v19;
  int8x8_t v20;
  uint8x8_t v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  md::NavigationLogic *v28;
  int8x8_t *v29;
  int8x8_t v30;
  uint8x8_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  BOOL v44;
  void *v45;
  void *v46;
  unint64_t v47;
  char v48;
  int v49;
  VKMapView *v50;
  __int16 v51;
  VKRouteContext *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = (VKRouteContext *)a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v7 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v49 = 134218242;
    v50 = self;
    v51 = 2112;
    v52 = v6;
    _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "[VKMapView:%p] Setting route context: %@", (uint8_t *)&v49, 0x16u);
  }
  v8 = 0x80;
  v9 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v10 = v9[2];
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8(v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v12 = 0x1BCA10CB9934FB1BLL;
      if (*(_QWORD *)&v10 <= 0x1BCA10CB9934FB1BuLL)
        v12 = 0x1BCA10CB9934FB1BuLL % *(_QWORD *)&v10;
    }
    else
    {
      v12 = (*(_QWORD *)&v10 - 1) & 0x1BCA10CB9934FB1BLL;
    }
    v13 = *(_QWORD **)(*(_QWORD *)&v9[1] + 8 * v12);
    if (v13)
    {
      v14 = (_QWORD *)*v13;
      if (v14)
      {
        if (v11.u32[0] < 2uLL)
        {
          v15 = *(_QWORD *)&v10 - 1;
          while (1)
          {
            v17 = v14[1];
            if (v17 == 0x1BCA10CB9934FB1BLL)
            {
              if (v14[2] == 0x1BCA10CB9934FB1BLL)
                goto LABEL_71;
            }
            else if ((v17 & v15) != v12)
            {
              goto LABEL_25;
            }
            v14 = (_QWORD *)*v14;
            if (!v14)
              goto LABEL_25;
          }
        }
        do
        {
          v16 = v14[1];
          if (v16 == 0x1BCA10CB9934FB1BLL)
          {
            if (v14[2] == 0x1BCA10CB9934FB1BLL)
            {
LABEL_71:
              v18 = (md::TransitLogic *)v14[5];
              goto LABEL_26;
            }
          }
          else
          {
            if (v16 >= *(_QWORD *)&v10)
              v16 %= *(_QWORD *)&v10;
            if (v16 != v12)
              break;
          }
          v14 = (_QWORD *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_25:
  v18 = 0;
LABEL_26:
  md::TransitLogic::setRouteContext(v18, v6);
  v19 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v20 = v19[2];
  if (!*(_QWORD *)&v20)
    goto LABEL_46;
  v21 = (uint8x8_t)vcnt_s8(v20);
  v21.i16[0] = vaddlv_u8(v21);
  if (v21.u32[0] > 1uLL)
  {
    v22 = 0xBEC1A12372CEEC00;
    if (*(_QWORD *)&v20 <= 0xBEC1A12372CEEC00)
      v22 = 0xBEC1A12372CEEC00 % *(_QWORD *)&v20;
  }
  else
  {
    v22 = (*(_QWORD *)&v20 - 1) & 0xBEC1A12372CEEC00;
  }
  v23 = *(_QWORD **)(*(_QWORD *)&v19[1] + 8 * v22);
  if (!v23 || (v24 = (_QWORD *)*v23) == 0)
  {
LABEL_46:
    v28 = 0;
    goto LABEL_47;
  }
  if (v21.u32[0] < 2uLL)
  {
    v25 = *(_QWORD *)&v20 - 1;
    while (1)
    {
      v27 = v24[1];
      if (v27 == 0xBEC1A12372CEEC00)
      {
        if (v24[2] == 0xBEC1A12372CEEC00)
          goto LABEL_72;
      }
      else if ((v27 & v25) != v22)
      {
        goto LABEL_46;
      }
      v24 = (_QWORD *)*v24;
      if (!v24)
        goto LABEL_46;
    }
  }
  while (1)
  {
    v26 = v24[1];
    if (v26 == 0xBEC1A12372CEEC00)
      break;
    if (v26 >= *(_QWORD *)&v20)
      v26 %= *(_QWORD *)&v20;
    if (v26 != v22)
      goto LABEL_46;
LABEL_36:
    v24 = (_QWORD *)*v24;
    if (!v24)
      goto LABEL_46;
  }
  if (v24[2] != 0xBEC1A12372CEEC00)
    goto LABEL_36;
LABEL_72:
  v28 = (md::NavigationLogic *)v24[5];
LABEL_47:
  md::NavigationLogic::setRouteContext(v28, v6);
  if (*((VKRouteContext **)self + 59) != v6)
    objc_storeStrong((id *)self + 59, a3);
  md::LabelSettings_Navigation::setRouteContext((md::LabelSettings_Navigation *)(-[VKMapView _labelSettings](self, "_labelSettings") + 8), v6);
  v29 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  if (v29)
  {
    v30 = v29[2];
    if (v30)
    {
      v31 = (uint8x8_t)vcnt_s8(v30);
      v31.i16[0] = vaddlv_u8(v31);
      if (v31.u32[0] > 1uLL)
      {
        v32 = 0x2FED70A4459DFCA1;
        if (*(_QWORD *)&v30 <= 0x2FED70A4459DFCA1uLL)
          v32 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v30;
      }
      else
      {
        v32 = (*(_QWORD *)&v30 - 1) & 0x2FED70A4459DFCA1;
      }
      v33 = *(_QWORD **)(*(_QWORD *)&v29[1] + 8 * v32);
      if (v33)
      {
        v34 = (_QWORD *)*v33;
        if (v34)
        {
          if (v31.u32[0] < 2uLL)
          {
            v35 = *(_QWORD *)&v30 - 1;
            while (1)
            {
              v37 = v34[1];
              if (v37 == 0x2FED70A4459DFCA1)
              {
                if (v34[2] == 0x2FED70A4459DFCA1)
                  goto LABEL_73;
              }
              else if ((v37 & v35) != v32)
              {
                goto LABEL_88;
              }
              v34 = (_QWORD *)*v34;
              if (!v34)
                goto LABEL_88;
            }
          }
          do
          {
            v36 = v34[1];
            if (v36 == 0x2FED70A4459DFCA1)
            {
              if (v34[2] == 0x2FED70A4459DFCA1)
              {
LABEL_73:
                v38 = v34[5];
                if (v38)
                {
                  if (v6)
                  {
                    -[VKRouteContext routeInfo](v6, "routeInfo");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "route");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    v41 = objc_msgSend(v40, "transportType");

                    if (v41 >= 7)
                      v8 = 4;
                    else
                      v8 = 0x50403020100uLL >> (8 * v41);
                    -[VKRouteContext routeInfo](v6, "routeInfo");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "route");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = v43 == 0;

                    if (v44)
                    {
                      if ((-[VKMapView mapDisplayStyle](self, "mapDisplayStyle") & 0xFF000000) == 0x1000000)
                        v3 = 3;
                      else
                        v3 = 0;
                    }
                    else
                    {
                      -[VKRouteContext routeInfo](v6, "routeInfo");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v45, "route");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      v47 = objc_msgSend(v46, "source");

                      if (v47 >= 6)
                        v3 = 0;
                      else
                        v3 = 0x40003020100uLL >> (8 * v47);
                    }
                    v48 = 1;
                  }
                  else
                  {
                    v48 = 0;
                  }
                  md::StyleLogic::setRouteTransportType(v38, v48, v8);
                  md::StyleLogic::setRouteSource(v38, v48, v3);
                }
                break;
              }
            }
            else
            {
              if (v36 >= *(_QWORD *)&v30)
                v36 %= *(_QWORD *)&v30;
              if (v36 != v32)
                break;
            }
            v34 = (_QWORD *)*v34;
          }
          while (v34);
        }
      }
    }
  }
LABEL_88:

}

- (id)routeContext
{
  return *((id *)self + 59);
}

- (void)setNavContext:(id)a3
{
  id *v5;
  id v6;
  id v7;

  v5 = (id *)((char *)self + 320);
  v6 = a3;
  v7 = v6;
  if (*v5 != v6)
  {
    objc_storeStrong((id *)self + 40, a3);
    v6 = *v5;
  }
  if (!v6)
    -[VKMapView setRouteUserOffset:](self, "setRouteUserOffset:", *MEMORY[0x1E0D26A38]);
  objc_msgSend(*((id *)self + 33), "setNavContext:", v7);

}

- (VKPolylineOverlay)focusedLabelsPolyline
{
  return (VKPolylineOverlay *)*(id *)(*(_QWORD *)(*(_QWORD *)(-[VKMapView _labelSettings](self, "_labelSettings")+ 8)+ 40)+ 200);
}

- (void)setFocusedLabelsPolyline:(id)a3
{
  VKPolylineOverlay *v4;
  NSObject *v5;
  int v6;
  VKMapView *v7;
  __int16 v8;
  VKPolylineOverlay *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (VKPolylineOverlay *)a3;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] Setting focused labels polyline: %@", (uint8_t *)&v6, 0x16u);
  }
  md::LabelSettings_Navigation::setFocusedPolyline((md::LabelSettings_Navigation *)(-[VKMapView _labelSettings](self, "_labelSettings") + 8), v4);

}

- (void)muninJunctionDidChange:(const void *)a3 currentRoad:(const void *)a4 localize:(BOOL)a5
{
  _BOOL8 v5;
  VKMuninJunction *v8;
  VKMuninRoad *v9;
  VKMuninJunction *v10;
  VKMuninRoad *v11;
  _QWORD v12[5];
  uint64_t (**v13)();
  VKMuninJunction *v14;
  uint64_t (**v15)();
  VKMuninRoad *v16;

  v5 = a5;
  if (!a3)
  {
    v8 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v8 = -[VKMuninJunction initWithMuninJunction:localize:]([VKMuninJunction alloc], "initWithMuninJunction:localize:", a3, a5);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v9 = -[VKMuninRoad initWithMuninRoadEdge:localize:]([VKMuninRoad alloc], "initWithMuninRoadEdge:localize:", a4, v5);
LABEL_6:
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3321888768;
  v12[2] = __57__VKMapView_muninJunctionDidChange_currentRoad_localize___block_invoke;
  v12[3] = &unk_1E42E9F88;
  v12[4] = self;
  v13 = &off_1E42B4BF0;
  v10 = v8;
  v14 = v10;
  v15 = &off_1E42B4A10;
  v11 = v9;
  v16 = v11;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v12);
  v15 = &off_1E42B4A10;

  v13 = &off_1E42B4BF0;
}

- (void)activeARWalkingFeatureDidUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__VKMapView_activeARWalkingFeatureDidUpdate___block_invoke;
  v6[3] = &unk_1E42FAFB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v6);

}

- (void)arWalkingFeatureSetStateDidUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__VKMapView_arWalkingFeatureSetStateDidUpdate___block_invoke;
  v6[3] = &unk_1E42FAFB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v6);

}

- (void)arWalkingElevationRequestFailure:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__VKMapView_arWalkingElevationRequestFailure___block_invoke;
  v6[3] = &unk_1E42FAFB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v6);

}

- (void)injectDebugARFeatures:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__VKMapView_injectDebugARFeatures___block_invoke;
  v6[3] = &unk_1E42FAFB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v6);

}

- (void)injectDebugARUserRouteCoordinate:(PolylineCoordinate)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__VKMapView_injectDebugARUserRouteCoordinate___block_invoke;
  v3[3] = &unk_1E42EB1D0;
  v3[4] = self;
  v3[5] = a3;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v3);
}

- (void)puckLocationTracingEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__VKMapView_puckLocationTracingEvent___block_invoke;
  v6[3] = &unk_1E42FAFB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v6);

}

- (void)didFinishLoadingDataWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__VKMapView_didFinishLoadingDataWithError___block_invoke;
  v6[3] = &unk_1E42FAFB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v6);

}

- (void)mapDidReloadStylesheet:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__VKMapView_mapDidReloadStylesheet___block_invoke;
  v3[3] = &unk_1E42F6DA0;
  v3[4] = self;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v3);
}

- (void)selectedLabelMarkerDidCompleteLayout:(const void *)a3
{
  NSObject *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[6];
  std::__shared_weak_count *v19;
  __int128 buf;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] selectedLabelMarkerDidCompleteLayout", (uint8_t *)&buf, 0xCu);
  }
  v7 = *(_QWORD *)a3;
  v6 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
  *(_QWORD *)&buf = *(_QWORD *)a3;
  *((_QWORD *)&buf + 1) = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3321888768;
  v18[2] = __50__VKMapView_selectedLabelMarkerDidCompleteLayout___block_invoke;
  v18[3] = &unk_1E42E9960;
  v18[4] = self;
  v18[5] = v7;
  v19 = v6;
  if (v6)
  {
    v10 = (unint64_t *)&v6->__shared_owners_;
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v18);
  v12 = v19;
  if (v19)
  {
    v13 = (unint64_t *)&v19->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v16 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
}

- (void)selectedLabelMarkerWillDisappear:(const void *)a3
{
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD v15[6];
  std::__shared_weak_count *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;

  v4 = *(_QWORD *)a3;
  v3 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
  v17 = *(_QWORD *)a3;
  v18 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3321888768;
  v15[2] = __46__VKMapView_selectedLabelMarkerWillDisappear___block_invoke;
  v15[3] = &unk_1E42E9960;
  v15[4] = self;
  v15[5] = v4;
  v16 = v3;
  if (v3)
  {
    v7 = (unint64_t *)&v3->__shared_owners_;
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v15);
  v9 = v16;
  if (v16)
  {
    v10 = (unint64_t *)&v16->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v12 = v18;
  if (v18)
  {
    v13 = (unint64_t *)&v18->__shared_owners_;
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

- (void)labelMarkerDidChangeState:(const void *)a3
{
  NSObject *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[6];
  std::__shared_weak_count *v19;
  __int128 buf;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v5 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[VKMapView:%p] labelMarkerDidChangeState", (uint8_t *)&buf, 0xCu);
  }
  v7 = *(_QWORD *)a3;
  v6 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
  *(_QWORD *)&buf = *(_QWORD *)a3;
  *((_QWORD *)&buf + 1) = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3321888768;
  v18[2] = __39__VKMapView_labelMarkerDidChangeState___block_invoke;
  v18[3] = &unk_1E42E9960;
  v18[4] = self;
  v18[5] = v7;
  v19 = v6;
  if (v6)
  {
    v10 = (unint64_t *)&v6->__shared_owners_;
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v18);
  v12 = v19;
  if (v19)
  {
    v13 = (unint64_t *)&v19->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v16 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
}

- (void)map:(id)a3 canShowFlyoverDidChange:(BOOL)a4
{
  _BOOL8 v4;
  id *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  id WeakRetained;
  id v15;
  id v16;
  id v17;
  id v18;

  v4 = a4;
  v6 = (id *)((char *)self + 120);
  WeakRetained = objc_loadWeakRetained((id *)self + 15);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v15 = objc_loadWeakRetained(v6);
    objc_msgSend(v15, "mapLayer:canShowFlyoverDidChange:", self, v4);

  }
  v16 = objc_loadWeakRetained(v6);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[VKMapView currentCanvas](self, "currentCanvas");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v9;
    if (v4)
    {
      objc_msgSend(v9, "cameraController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isPitched");

      if (!v11)
        return;
      v18 = objc_loadWeakRetained(v6);
      objc_msgSend(v18, "mapLayer:showingFlyoverDidChange:", self, 1);
    }
    else
    {
      objc_msgSend(v9, "cameraController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isPitched");

      if (!v13)
        return;
      v18 = objc_loadWeakRetained(v6);
      objc_msgSend(v18, "mapLayer:showingFlyoverDidChange:", self, 0);
    }

  }
}

- (void)mapDidFinishChangingMapDisplayStyle:(id)a3
{
  _QWORD v3[5];
  $6EFE6C6748B912A6EAC8A8E593ED1344 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__VKMapView_mapDidFinishChangingMapDisplayStyle___block_invoke;
  v3[3] = &unk_1E42EB338;
  v3[4] = self;
  v4 = a3;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v3);
}

- (void)_updateMapDisplayStyle
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (uint64_t)-[VKMapView mapDisplayStyle](self, "mapDisplayStyle");
  if ((BYTE2(v3) - 1) > 8u)
    v4 = 0;
  else
    v4 = byte_19FFB87F6[(BYTE2(v3) - 1)];
  v5 = *((unsigned __int8 *)self + 192);
  if ((v5 - 1) >= 8)
  {
    if ((_DWORD)v5 == 9)
    {
      v5 = 1;
      v6 = 1;
      goto LABEL_6;
    }
    v5 = 0;
  }
  v6 = *((unsigned __int8 *)self + 193) == 1;
LABEL_6:
  v7 = *((unsigned __int8 *)self + 208);
  if ((unint64_t)((unsigned __int16)v3 & 0xFF00) >> 8 != BYTE1(v3)
    || (_DWORD)v5 != v4
    || (_DWORD)v6 != (v3 & 0xFF000000) >> 24
    || (_DWORD)v7 != BYTE4(v3))
  {
    -[VKMapView setMapDisplayStyle:animated:duration:](self, "setMapDisplayStyle:animated:duration:", (((unint64_t)((v3 & 0xFF0000000000) == 0x10000000000) << 40) | (v7 << 32) | (v6 << 24) | (v5 << 16)) & 0xFFFFFFFFFFFFLL | (unsigned __int16)v3 & 0xFF00 | v3, 1, 0.25);
  }
}

- (void)mapController:(id)a3 requestsDisplayRate:(int64_t)a4
{
  NSObject *v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  VKMapView *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*((_QWORD *)self + 48) + 120) + 8) != a4)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v6 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v9 = 134218240;
      v10 = self;
      v11 = 2048;
      v12 = a4;
      _os_log_impl(&dword_19F029000, v6, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set requested display rate: %ld", (uint8_t *)&v9, 0x16u);
    }
    v7 = *(uint64_t **)(*((_QWORD *)self + 48) + 120);
    v7[1] = a4;
    v8 = *v7;
    if (*v7)
    {
      if (!**(_BYTE **)(v8 + 1056))
        md::MapEngine::setDisplayRate(v8, a4);
    }
  }
}

- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t v12;

  v8 = a5;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cameraController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = *(_OWORD *)&a3->var0;
    v12 = *(_QWORD *)&a3->var2;
    objc_msgSend(v10, "setCenterCoordinateDistanceRange:duration:timingFunction:", &v11, v8, a4);
  }

}

- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  VKCameraRegionRestriction *v11;
  VKCameraRegionRestriction *v12;

  v12 = (VKCameraRegionRestriction *)a3;
  v8 = a5;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cameraController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = v12;
    if (!v12)
      v11 = -[VKCameraRegionRestriction initWithMapRegion:]([VKCameraRegionRestriction alloc], "initWithMapRegion:", 0);
    v12 = v11;
    objc_msgSend(v10, "setRegionRestriction:duration:timingFunction:", a4);
  }

}

- (void)zoomToLevel:(double)a3 withFocusPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  id v8;

  y = a4.y;
  x = a4.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "zoomToLevel:withFocusPoint:", a3, x, y);

}

- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y;
  double x;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);

  y = a4.y;
  x = a4.x;
  v9 = (void (**)(_QWORD))a5;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cameraController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__VKMapView_zoom_withFocusPoint_completionHandler___block_invoke;
    v12[3] = &unk_1E42F4BE0;
    v13 = v9;
    objc_msgSend(v11, "zoom:withFocusPoint:completionHandler:", v12, a3, x, y);

  }
  else if (v9)
  {
    v9[2](v9);
  }

}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "startPinchingWithFocusPoint:", x, y);

}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double y;
  double x;
  void *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cameraController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "updatePinchWithFocusPoint:oldFactor:newFactor:", x, y, a4, a5);

}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "stopPinchingWithFocusPoint:", x, y);

}

- (void)startPanningAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "startPanningAtPoint:panAtStartPoint:", 0, x, y);

}

- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v7;
  id v8;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "startPanningAtPoint:panAtStartPoint:", v4, x, y);

}

- (void)updatePanWithTranslation:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "updatePanWithTranslation:", x, y);

}

- (void)willStopPanningAtPoint:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cameraController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "willStopPanningAtPoint:withVelocity:", v7, v6, x, y);

}

- (void)stopPanningAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "stopPanningAtPoint:", x, y);

}

- (void)startRotatingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "startRotatingWithFocusPoint:", x, y);

}

- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4
{
  double y;
  double x;
  void *v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "updateRotationWithFocusPoint:newValue:", x, y, a4);

}

- (void)stopRotatingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "stopRotatingWithFocusPoint:", x, y);

}

- (void)startPitchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "startPitchingWithFocusPoint:", x, y);

}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 translation:(double)a4
{
  double y;
  double x;
  void *v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "updatePitchWithFocusPoint:translation:", x, y, a4);

}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 degrees:(double)a4
{
  double y;
  double x;
  void *v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "updatePitchWithFocusPoint:degrees:", x, y, a4);

}

- (void)stopPitchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "stopPitchingWithFocusPoint:", x, y);

}

- (BOOL)isPointValidForGesturing:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPointValidForGesturing:", x, y);

  return v6;
}

- (void)stopSnappingAnimations
{
  void *v2;
  id v3;

  -[VKMapView currentCanvas](self, "currentCanvas");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "stopSnappingAnimations");

}

- (BOOL)tapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  char v7;

  y = a3.y;
  x = a3.x;
  -[VKMapView currentCanvas](self, "currentCanvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "tapAtPoint:", x, y);
  else
    v7 = 0;

  return v7;
}

- (void)setDisableRoads:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v4 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v7 = 8;
  md::MapEngineSettings::set(v4, &v7, (_QWORD *)a3);
  v5 = *((_QWORD *)self + 48);
  v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (void)setDisableLabels:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v4 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v7 = 9;
  md::MapEngineSettings::set(v4, &v7, (_QWORD *)a3);
  v5 = *((_QWORD *)self + 48);
  v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (void)setDisablePolygons:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v4 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v7 = 10;
  md::MapEngineSettings::set(v4, &v7, (_QWORD *)a3);
  v5 = *((_QWORD *)self + 48);
  v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (void)setRenderInverseFills:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v4 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v7 = 12;
  md::MapEngineSettings::set(v4, &v7, (_QWORD *)a3);
  v5 = *((_QWORD *)self + 48);
  v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (void)setDisableRasters:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v4 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v7 = 14;
  md::MapEngineSettings::set(v4, &v7, (_QWORD *)a3);
  v5 = *((_QWORD *)self + 48);
  v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (void)setDisableGrid:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v4 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v7 = 15;
  md::MapEngineSettings::set(v4, &v7, (_QWORD *)a3);
  v5 = *((_QWORD *)self + 48);
  v6 = 1;
  md::MapEngine::setNeedsTick(v5, &v6);
}

- (BOOL)isFullyDrawn
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(*((_QWORD *)self + 48) + 1136);
  if (*(_BYTE *)(v2 + 88))
    v3 = *(unsigned __int8 *)(v2 + 89);
  else
    v3 = 0;
  return v3 == 4 || (v3 & 0xFE) == 2;
}

- (unint64_t)getSceneState
{
  uint64_t v2;
  unsigned __int8 v3;

  v2 = *(_QWORD *)(*((_QWORD *)self + 48) + 1136);
  if (*(_BYTE *)(v2 + 88) && (v3 = *(_BYTE *)(v2 + 89) - 1, v3 <= 3u))
    return v3 + 1;
  else
    return 0;
}

- (BOOL)roadsDisabled
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 8)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (BOOL)labelsDisabled
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 9)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (BOOL)polygonsDisabled
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 10)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (BOOL)renderOverlayPolygons
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
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

- (BOOL)renderInverseFills
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 12)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (BOOL)buildingFootprintsDisabled
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 13)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (BOOL)rastersDisabled
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 14)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (BOOL)gridDisabled
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 15)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  return v3 != v4 && *(_QWORD *)(v3 + 8) != 0;
}

- (void)goToTileX:(int)a3 Y:(int)a4 Z:(int)a5 tileSize:(int)a6
{
  objc_msgSend(*((id *)self + 5), "goToTileX:Y:Z:tileSize:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
}

- (void)setSkippedRouteLineSplitAnnotation:(id)a3
{
  id v5;
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
  id v16;

  v5 = a3;
  v6 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  if (v6)
  {
    v7 = v6[2];
    if (v7)
    {
      v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        v9 = 0x5CBBA028798243FLL;
        if (*(_QWORD *)&v7 <= 0x5CBBA028798243FuLL)
          v9 = 0x5CBBA028798243FuLL % *(_QWORD *)&v7;
      }
      else
      {
        v9 = (*(_QWORD *)&v7 - 1) & 0x5CBBA028798243FLL;
      }
      v10 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
      if (v10)
      {
        v11 = (_QWORD *)*v10;
        if (v11)
        {
          if (v8.u32[0] < 2uLL)
          {
            v12 = *(_QWORD *)&v7 - 1;
            while (1)
            {
              v14 = v11[1];
              if (v14 == 0x5CBBA028798243FLL)
              {
                if (v11[2] == 0x5CBBA028798243FLL)
                  goto LABEL_23;
              }
              else if ((v14 & v12) != v9)
              {
                goto LABEL_25;
              }
              v11 = (_QWORD *)*v11;
              if (!v11)
                goto LABEL_25;
            }
          }
          do
          {
            v13 = v11[1];
            if (v13 == 0x5CBBA028798243FLL)
            {
              if (v11[2] == 0x5CBBA028798243FLL)
              {
LABEL_23:
                v15 = v11[5];
                if (v15)
                {
                  v16 = v5;
                  objc_storeStrong((id *)(v15 + 184), a3);
                  v5 = v16;
                }
                break;
              }
            }
            else
            {
              if (v13 >= *(_QWORD *)&v7)
                v13 %= *(_QWORD *)&v7;
              if (v13 != v9)
                break;
            }
            v11 = (_QWORD *)*v11;
          }
          while (v11);
        }
      }
    }
  }
LABEL_25:

}

- (id)pptTileStatisticsForMapType:(int)a3 latitude:(double)a4 longitude:(double)a5 zoom:(float)a6 width:(double)a7 height:(double)a8 rect:(id)a9
{
  return 0;
}

- (void)forceResolveCameraController
{
  void *v2;
  id v3;

  v2 = (void *)*((_QWORD *)self + 5);
  -[VKMapView resolveMapCameraController](self, "resolveMapCameraController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCameraController:");

}

- (void)setUseSmallCache:(BOOL)a3
{
  uint64_t v3;
  double v4;

  v3 = *(_QWORD *)(*((_QWORD *)self + 48) + 896);
  v4 = 1.0;
  if (a3)
    GEOConfigGetDouble();
  *(double *)(v3 + 384) = v4;
}

- (void)setCameraHorizontalOffset:(double)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8;
  NSObject *v9;
  int v10;
  VKMapView *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
  v9 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v10 = 134218496;
    v11 = self;
    v12 = 2048;
    v13 = a3;
    v14 = 2048;
    v15 = a4;
    _os_log_impl(&dword_19F029000, v9, OS_LOG_TYPE_INFO, "[VKMapView:%p] Set horizontal offset: %f, duration: %f", (uint8_t *)&v10, 0x20u);
  }
  objc_msgSend(*((id *)self + 5), "setCameraHorizontalOffset:duration:timingFunction:", v8, a3, a4);

}

- (void)removeExternalAnchor:(id)a3
{
  id v4;
  int8x8_t *v5;
  int8x8_t v6;
  uint8x8_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  unint64_t v16;
  int8x8_t v17;
  uint8x8_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD **v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;

  v4 = a3;
  v5 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v6 = v5[2];
  v32 = v4;
  if (!*(_QWORD *)&v6)
    goto LABEL_72;
  v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    v8 = 0x79FE0BD9535D5C4DLL;
    if (*(_QWORD *)&v6 <= 0x79FE0BD9535D5C4DuLL)
      v8 = 0x79FE0BD9535D5C4DuLL % *(_QWORD *)&v6;
  }
  else
  {
    v8 = (*(_QWORD *)&v6 - 1) & 0x79FE0BD9535D5C4DLL;
  }
  v9 = *(_QWORD **)(*(_QWORD *)&v5[1] + 8 * v8);
  if (!v9)
    goto LABEL_72;
  v10 = (_QWORD *)*v9;
  if (!v10)
    goto LABEL_72;
  if (v7.u32[0] < 2uLL)
  {
    v11 = *(_QWORD *)&v6 - 1;
    while (1)
    {
      v13 = v10[1];
      if (v13 == 0x79FE0BD9535D5C4DLL)
      {
        if (v10[2] == 0x79FE0BD9535D5C4DLL)
          goto LABEL_22;
      }
      else if ((v13 & v11) != v8)
      {
        goto LABEL_72;
      }
      v10 = (_QWORD *)*v10;
      if (!v10)
        goto LABEL_72;
    }
  }
  while (1)
  {
    v12 = v10[1];
    if (v12 == 0x79FE0BD9535D5C4DLL)
      break;
    if (v12 >= *(_QWORD *)&v6)
      v12 %= *(_QWORD *)&v6;
    if (v12 != v8)
      goto LABEL_72;
LABEL_11:
    v10 = (_QWORD *)*v10;
    if (!v10)
      goto LABEL_72;
  }
  if (v10[2] != 0x79FE0BD9535D5C4DLL)
    goto LABEL_11;
LABEL_22:
  v14 = (_QWORD *)v10[5];
  if (v14)
  {
    v15 = v4;
    v16 = objc_msgSend(v15, "hash");
    v17 = (int8x8_t)v14[23];
    if (v17)
    {
      v18 = (uint8x8_t)vcnt_s8(v17);
      v18.i16[0] = vaddlv_u8(v18);
      if (v18.u32[0] > 1uLL)
      {
        v19 = v16;
        if (v16 >= *(_QWORD *)&v17)
          v19 = v16 % *(_QWORD *)&v17;
      }
      else
      {
        v19 = (*(_QWORD *)&v17 - 1) & v16;
      }
      v20 = v14[22];
      v21 = *(_QWORD ***)(v20 + 8 * v19);
      if (v21)
      {
        v22 = *v21;
        if (*v21)
        {
          v23 = *(_QWORD *)&v17 - 1;
          if (v18.u32[0] < 2uLL)
          {
            while (1)
            {
              v24 = v22[1];
              if (v24 == v16)
              {
                if ((id)v22[3] == v15)
                  goto LABEL_44;
              }
              else if ((v24 & v23) != v19)
              {
                goto LABEL_71;
              }
              v22 = (_QWORD *)*v22;
              if (!v22)
                goto LABEL_71;
            }
          }
          do
          {
            v25 = v22[1];
            if (v25 == v16)
            {
              if ((id)v22[3] == v15)
              {
LABEL_44:
                if (v18.u32[0] > 1uLL)
                {
                  if (v16 >= *(_QWORD *)&v17)
                    v16 %= *(_QWORD *)&v17;
                }
                else
                {
                  v16 &= v23;
                }
                v26 = *(_QWORD **)(v20 + 8 * v16);
                do
                {
                  v27 = v26;
                  v26 = (_QWORD *)*v26;
                }
                while (v26 != v22);
                if (v27 == v14 + 24)
                  goto LABEL_61;
                v28 = v27[1];
                if (v18.u32[0] > 1uLL)
                {
                  if (v28 >= *(_QWORD *)&v17)
                    v28 %= *(_QWORD *)&v17;
                }
                else
                {
                  v28 &= v23;
                }
                if (v28 != v16)
                {
LABEL_61:
                  if (!*v22)
                    goto LABEL_62;
                  v29 = *(_QWORD *)(*v22 + 8);
                  if (v18.u32[0] > 1uLL)
                  {
                    if (v29 >= *(_QWORD *)&v17)
                      v29 %= *(_QWORD *)&v17;
                  }
                  else
                  {
                    v29 &= v23;
                  }
                  if (v29 != v16)
LABEL_62:
                    *(_QWORD *)(v20 + 8 * v16) = 0;
                }
                v30 = *v22;
                if (*v22)
                {
                  v31 = *(_QWORD *)(v30 + 8);
                  if (v18.u32[0] > 1uLL)
                  {
                    if (v31 >= *(_QWORD *)&v17)
                      v31 %= *(_QWORD *)&v17;
                  }
                  else
                  {
                    v31 &= v23;
                  }
                  if (v31 != v16)
                  {
                    *(_QWORD *)(v14[22] + 8 * v31) = v27;
                    v30 = *v22;
                  }
                }
                *v27 = v30;
                *v22 = 0;
                --v14[25];
                (*(void (**)(_QWORD *))v22[2])(v22 + 2);
                operator delete(v22);
                break;
              }
            }
            else
            {
              if (v25 >= *(_QWORD *)&v17)
                v25 %= *(_QWORD *)&v17;
              if (v25 != v19)
                break;
            }
            v22 = (_QWORD *)*v22;
          }
          while (v22);
        }
      }
    }
LABEL_71:

    v4 = v32;
  }
LABEL_72:
  objc_msgSend(v4, "setDisplayLayer:", 0);

}

- (void)puckAnimator:(id)a3 runAnimation:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[VKMapView navigationPuck](self, "navigationPuck");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKMapView updateUserLocationAnnotationStateForNavigationPuck:isPuckEnabled:synchronizedState:](VKMapView, "updateUserLocationAnnotationStateForNavigationPuck:isPuckEnabled:synchronizedState:", v8, objc_msgSend(v7, "enabled"), *((_QWORD *)self + 48) + 928);

  -[VKMapView runAnimation:](self, "runAnimation:", v6);
}

- (void)puckAnimator:(id)a3 updatedPosition:(const void *)a4 course:(const void *)a5 polylineCoordinate:(PolylineCoordinate)a6
{
  id v10;
  _OWORD *v11;
  __int128 v12;
  uint64_t v13;
  int8x8_t *v14;
  int8x8_t v15;
  uint8x8_t v16;
  unint64_t v17;
  uint64_t v18;
  int8x8_t v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  void *v27;
  unsigned __int8 *v28;
  char v29;
  uint64_t v30;
  __int128 v31;
  void *v32;
  char *v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;

  v10 = a3;
  v11 = (_OWORD *)((char *)self + 328);
  if (*((_BYTE *)self + 352))
  {
    v12 = *(_OWORD *)a4;
    *((_QWORD *)self + 43) = *((_QWORD *)a4 + 2);
    *v11 = v12;
  }
  else
  {
    *(_QWORD *)v11 = *(_QWORD *)a4;
    *((_OWORD *)self + 21) = *(_OWORD *)((char *)a4 + 8);
    *((_BYTE *)self + 352) = 1;
  }
  v13 = *(_QWORD *)a5;
  if (!*((_BYTE *)self + 368))
    *((_BYTE *)self + 368) = 1;
  *((_QWORD *)self + 45) = v13;
  *((PolylineCoordinate *)self + 47) = a6;
  v14 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v15 = v14[2];
  v16 = (uint8x8_t)vcnt_s8(v15);
  v16.i16[0] = vaddlv_u8(v16);
  v17 = v16.u32[0];
  if (v16.u32[0] >= 2uLL)
  {
    v21 = 0xBEC1A12372CEEC00;
    if (*(_QWORD *)&v15 <= 0xBEC1A12372CEEC00)
      v21 = 0xBEC1A12372CEEC00 % *(_QWORD *)&v15;
    v19 = v14[1];
    v20 = *(_QWORD **)(*(_QWORD *)&v19 + 8 * v21);
    do
    {
      do
        v20 = (_QWORD *)*v20;
      while (v20[1] != 0xBEC1A12372CEEC00);
    }
    while (v20[2] != 0xBEC1A12372CEEC00);
    v18 = *(_QWORD *)&v15 - 1;
  }
  else
  {
    v18 = *(_QWORD *)&v15 - 1;
    v19 = v14[1];
    v20 = *(_QWORD **)(*(_QWORD *)&v19 + 8 * ((*(_QWORD *)&v15 - 1) & 0xBEC1A12372CEEC00));
    do
    {
      do
        v20 = (_QWORD *)*v20;
      while (v20[1] != 0xBEC1A12372CEEC00);
    }
    while (v20[2] != 0xBEC1A12372CEEC00);
  }
  v22 = v20[5];
  if (*((_BYTE *)self + 352))
    v23 = (char *)self + 328;
  else
    v23 = (char *)a4;
  v24 = *((_QWORD *)v23 + 2);
  *(_OWORD *)(v22 + 128) = *(_OWORD *)v23;
  *(_QWORD *)(v22 + 144) = v24;
  if (v17 >= 2)
  {
    v26 = 0xBEC1A12372CEEC00;
    if (*(_QWORD *)&v15 <= 0xBEC1A12372CEEC00)
      v26 = 0xBEC1A12372CEEC00 % *(_QWORD *)&v15;
    v25 = *(_QWORD **)(*(_QWORD *)&v19 + 8 * v26);
    do
    {
      do
        v25 = (_QWORD *)*v25;
      while (v25[1] != 0xBEC1A12372CEEC00);
    }
    while (v25[2] != 0xBEC1A12372CEEC00);
  }
  else
  {
    v25 = *(_QWORD **)(*(_QWORD *)&v19 + 8 * (v18 & 0xBEC1A12372CEEC00));
    do
    {
      do
        v25 = (_QWORD *)*v25;
      while (v25[1] != 0xBEC1A12372CEEC00);
    }
    while (v25[2] != 0xBEC1A12372CEEC00);
  }
  *(PolylineCoordinate *)(v25[5] + 208) = a6;
  -[VKMapView navigationPuck](self, "navigationPuck");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKMapView updateUserLocationAnnotationStateForNavigationPuck:isPuckEnabled:synchronizedState:](VKMapView, "updateUserLocationAnnotationStateForNavigationPuck:isPuckEnabled:synchronizedState:", v10, objc_msgSend(v27, "enabled"), *((_QWORD *)self + 48) + 928);

  v28 = *(unsigned __int8 **)(*((_QWORD *)self + 48) + 904);
  if (v28)
  {
    md::MapDataAccess::heightAtCoordinate(v28, a4);
    if (v29)
    {
      v30 = *((_QWORD *)self + 48);
      v31 = *(_OWORD *)a4;
      *(_QWORD *)(v30 + 1000) = *((_QWORD *)a4 + 2);
      *(_OWORD *)(v30 + 984) = v31;
    }
  }
  v32 = (void *)*((_QWORD *)self + 33);
  if (*((_BYTE *)self + 352))
    v33 = (char *)self + 328;
  else
    v33 = (char *)a4;
  v34 = *((_QWORD *)v33 + 2);
  v35 = *(_OWORD *)v33;
  v36 = v34;
  objc_msgSend(v32, "puckAnimator:updatedPosition:course:polylineCoordinate:", v10, &v35, a5, *((_QWORD *)self + 47));

}

- (void)puckAnimatorDidStop:(id)a3
{
  *(_BYTE *)(*((_QWORD *)self + 48) + 1012) = 0;
  objc_msgSend(*((id *)self + 33), "puckAnimatorDidStop:", a3);
}

- (VKSceneConfiguration)sceneConfiguration
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    return (VKSceneConfiguration *)0;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v3 <= 0x2FED70A4459DFCA1uLL)
      v5 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0x2FED70A4459DFCA1;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6)
    return (VKSceneConfiguration *)0;
  v7 = (_QWORD *)*v6;
  if (!v7)
    return (VKSceneConfiguration *)0;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0x2FED70A4459DFCA1)
      {
        if (v7[2] == 0x2FED70A4459DFCA1)
          goto LABEL_22;
      }
      else if ((v10 & v8) != v5)
      {
        return (VKSceneConfiguration *)0;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        return (VKSceneConfiguration *)0;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0x2FED70A4459DFCA1)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      return (VKSceneConfiguration *)0;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      return (VKSceneConfiguration *)0;
  }
  if (v7[2] != 0x2FED70A4459DFCA1)
    goto LABEL_11;
LABEL_22:
  v11 = v7[5];
  if (!v11)
    return (VKSceneConfiguration *)0;
  return (VKSceneConfiguration *)*(id *)(v11 + 1160);
}

- (VKMapViewDelegate)mapDelegate
{
  return (VKMapViewDelegate *)objc_loadWeakRetained((id *)self + 15);
}

- (unsigned)applicationState
{
  return *((_BYTE *)self + 192);
}

- (unsigned)applicationSubState
{
  return *((_BYTE *)self + 193);
}

- (unsigned)displayedSearchResultsType
{
  return *((_BYTE *)self + 208);
}

- (GEOPOICategoryFilter)pointsOfInterestFilter
{
  return (GEOPOICategoryFilter *)*((_QWORD *)self + 51);
}

- (BOOL)compressedBuildingsEnabled
{
  return *((_BYTE *)self + 416);
}

- (unsigned)mapKitUsage
{
  return *((_BYTE *)self + 211);
}

- (unsigned)mapsUsage
{
  return *((_BYTE *)self + 210);
}

- (unsigned)mapKitClientMode
{
  return *((_BYTE *)self + 212);
}

- (unint64_t)navCameraMode
{
  return *((_QWORD *)self + 75);
}

- (VKLabelSelectionFilter)labelSelectionFilter
{
  return (VKLabelSelectionFilter *)objc_loadWeakRetained((id *)self + 77);
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  objc_destroyWeak((id *)self + 77);
  objc_storeStrong((id *)self + 73, 0);
  *((_QWORD *)self + 68) = &off_1E42B5270;

  objc_storeStrong((id *)self + 67, 0);
  v3 = *((_QWORD *)self + 63);
  *((_QWORD *)self + 63) = 0;
  if (v3)
    MEMORY[0x1A1AF4E00](v3, 0x1000C40E32A8BA7);
  *((_QWORD *)self + 60) = &off_1E42B52F0;

  objc_storeStrong((id *)self + 59, 0);
  *((_QWORD *)self + 56) = &off_1E42B54B0;

  *((_QWORD *)self + 53) = &off_1E42B4F90;
  objc_storeStrong((id *)self + 51, 0);
  objc_storeStrong((id *)self + 50, 0);
  v4 = *((_QWORD *)self + 48);
  *((_QWORD *)self + 48) = 0;
  if (v4)
    md::MapEngineDeleter::operator()(v4);
  objc_storeStrong((id *)self + 40, 0);
  *((_QWORD *)self + 37) = &off_1E42B51F0;

  *((_QWORD *)self + 34) = &off_1E42B5010;
  objc_storeStrong((id *)self + 33, 0);
  objc_storeStrong((id *)self + 32, 0);
  objc_storeStrong((id *)self + 31, 0);
  objc_storeStrong((id *)self + 28, 0);
  objc_storeStrong((id *)self + 27, 0);
  objc_storeStrong((id *)self + 19, 0);
  objc_storeStrong((id *)self + 17, 0);
  objc_destroyWeak((id *)self + 15);
  std::mutex::~mutex((std::mutex *)((char *)self + 56));
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  if (*((_BYTE *)self + 32))
    *((_BYTE *)self + 32) = 0;
}

uint64_t __51__VKMapView_zoom_withFocusPoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __49__VKMapView_mapDidFinishChangingMapDisplayStyle___block_invoke(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayer:didFinishChangingMapDisplayStyle:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40) | ((unint64_t)*(unsigned __int16 *)(a1 + 44) << 32));

  }
}

void __39__VKMapView_labelMarkerDidChangeState___block_invoke(uint64_t a1)
{
  char v2;
  id v3;
  char v4;
  id WeakRetained;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    +[VKLabelMarker markerWithLabelMarker:](VKLabelMarker, "markerWithLabelMarker:", a1 + 40);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v3, "mapLayer:labelMarkerDidChangeState:", *(_QWORD *)(a1 + 32), v6);
    goto LABEL_3;
  }
  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    +[VKLabelMarker markerWithLabelMarker:](VKLabelMarker, "markerWithLabelMarker:", a1 + 40);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isSelected"))
      goto LABEL_4;
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v3, "mapLayer:selectedLabelMarkerDidChangeState:", *(_QWORD *)(a1 + 32), v6);
LABEL_3:

LABEL_4:
  }
}

void __46__VKMapView_selectedLabelMarkerWillDisappear___block_invoke(uint64_t a1)
{
  char v2;
  id v3;
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    +[VKLabelMarker markerWithLabelMarker:](VKLabelMarker, "markerWithLabelMarker:", a1 + 40);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v3, "mapLayer:selectedLabelMarkerWillDisappear:", *(_QWORD *)(a1 + 32), v5);

  }
}

void __50__VKMapView_selectedLabelMarkerDidCompleteLayout___block_invoke(uint64_t a1)
{
  char v2;
  id v3;
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    +[VKLabelMarker markerWithLabelMarker:](VKLabelMarker, "markerWithLabelMarker:", a1 + 40);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v3, "mapLayer:selectedLabelMarkerDidCompleteLayout:", *(_QWORD *)(a1 + 32), v5);

  }
}

void __34__VKMapView_didUpdateSceneStatus___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("hasFailedTiles");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("VKMapViewDidBecomeFullyDrawnNotification"), v3, v5);

}

void __36__VKMapView_mapDidReloadStylesheet___block_invoke(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayerDidReloadStylesheet:", *(_QWORD *)(a1 + 32));

  }
}

void __43__VKMapView_didFinishLoadingDataWithError___block_invoke(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayerDidFailLoadingTiles:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __38__VKMapView_puckLocationTracingEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v4 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 134218242;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_19F029000, v4, OS_LOG_TYPE_INFO, "[VKMapView:%p] puckLocationTracingEvent VKNavigationPuckLocationTracingEvent:%@", (uint8_t *)&v8, 0x16u);
    }
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v7, "mapLayer:puckLocationTracingEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __46__VKMapView_injectDebugARUserRouteCoordinate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRouteUserOffset:", *(_QWORD *)(a1 + 40));
}

id __35__VKMapView_injectDebugARFeatures___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "setARWalkingFeatureSet:", *(_QWORD *)(a1 + 40));
}

void __46__VKMapView_arWalkingElevationRequestFailure___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v4 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 134218242;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_19F029000, v4, OS_LOG_TYPE_INFO, "[VKMapView:%p] ArWalkingElevationRequestFailure reason:%@", (uint8_t *)&v8, 0x16u);
    }
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v7, "mapLayer:arWalkingElevationRequestFailure:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __47__VKMapView_arWalkingFeatureSetStateDidUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v4 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 134218242;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_19F029000, v4, OS_LOG_TYPE_INFO, "[VKMapView:%p] ARWalkingFeatureSetStateDidUpdate featureSet:%@", (uint8_t *)&v8, 0x16u);
    }
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v7, "mapLayer:arWalkingFeatureSetStateDidUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __45__VKMapView_activeARWalkingFeatureDidUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v4 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 134218242;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_19F029000, v4, OS_LOG_TYPE_INFO, "[VKMapView:%p] ActiveARWalkingFeatureDidUpdate info:%@", (uint8_t *)&v8, 0x16u);
    }
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v7, "mapLayer:activeARWalkingFeatureDidUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __57__VKMapView_muninJunctionDidChange_currentRoad_localize___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v4 = (void *)GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(id *)(a1 + 48);
      v7 = *(id *)(a1 + 72);
      v14 = 134218498;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      v8 = v4;
      _os_log_impl(&dword_19F029000, v8, OS_LOG_TYPE_INFO, "[VKMapView:%p] Junction didChange:%@ currentRoad:%@", (uint8_t *)&v14, 0x20u);

    }
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 72);
    v13 = v11;
    objc_msgSend(v9, "mapLayer:nearestJunctionDidChange:currentRoad:", v10, v13, v12);

  }
}

void __28__VKMapView_setFlyoverMode___block_invoke(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayer:flyoverModeDidChange:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

  }
}

void __28__VKMapView_setFlyoverMode___block_invoke_2(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayer:flyoverModeDidChange:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

  }
}

- (void)tileStatistics
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*a1, "setValue:forKey:", v11, v7);
  v9 = *a1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Units"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v8, v10);

}

uint64_t __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateFlyoverTourLabelChanged:", a2);
}

uint64_t __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runFlyoverTourStateChange:completion:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateFlyoverTourLabelChanged:", a2);
}

uint64_t __65__VKMapView_startFlyoverTourAnimation_animateToStart_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runFlyoverTourStateChange:completion:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __64__VKMapView_moveToFlyoverTourStartPosition_duration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__VKMapView_moveToFlyoverTourStartPosition_duration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateFlyoverTourLabelChanged:", a2);
}

uint64_t __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runFlyoverTourStateChange:completion:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateFlyoverTourLabelChanged:", a2);
}

uint64_t __61__VKMapView_startFlyoverAnimation_animateToStart_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runFlyoverTourStateChange:completion:", a2, *(_QWORD *)(a1 + 40));
}

void __52__VKMapView__notifyDelegateFlyoverTourLabelChanged___block_invoke(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayer:flyoverTourLabelDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke_2;
  v3[3] = &unk_1E42F6DA0;
  v3[4] = v1;
  return objc_msgSend(v1, "_postDelegateCallbackBlock:", v3);
}

uint64_t __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke_4;
  v3[3] = &unk_1E42F6DA0;
  v3[4] = v1;
  return objc_msgSend(v1, "_postDelegateCallbackBlock:", v3);
}

void __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke_4(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayer:didStopFlyoverTourCompleted:", *(_QWORD *)(a1 + 32), 0);

  }
}

void __51__VKMapView__runFlyoverTourStateChange_completion___block_invoke_2(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayer:didStopFlyoverTourCompleted:", *(_QWORD *)(a1 + 32), 1);

  }
}

uint64_t __69__VKMapView_setEdgeInsets_duration_timingFunction_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_solveForInput:");
}

void __69__VKMapView_setEdgeInsets_duration_timingFunction_completionHandler___block_invoke_2(uint64_t a1, float a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  float32x4_t v6;
  float32x4_t *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t v11;
  float32x4_t v12;
  float32x4_t v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v12 = *(float32x4_t *)(a1 + 40);
    v13 = *(float32x4_t *)(a1 + 56);
    v14 = WeakRetained;
    objc_msgSend(WeakRetained, "currentCanvas");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEdgeInsets:");

    WeakRetained = v14;
    v5 = *((_QWORD *)v14 + 48);
    v6 = vmlaq_n_f32(vmulq_n_f32(v12, 1.0 - a2), v13, a2);
    *(float32x4_t *)(v5 + 960) = v6;
    v7 = *(float32x4_t **)(v5 + 1064);
    v8 = *(std::__shared_weak_count **)(v5 + 1072);
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
      v7[27] = v6;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
        WeakRetained = v14;
      }
    }
    else
    {
      v7[27] = v6;
    }
  }

}

void __69__VKMapView_setEdgeInsets_duration_timingFunction_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[19];
    WeakRetained[19] = 0;

    objc_msgSend(WeakRetained, "currentCanvas");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cameraController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEdgeInsetsAnimating:", 0);

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);

}

- (uint64_t)activeLogics
{

  return a1;
}

- (void)activeLogics
{
  uint64_t v2;
  size_t v3;
  const void *v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void **v11;
  uint64_t v12;
  void **v13;
  void *v14;
  VKLogicDebugInfo *v15;
  void *__dst[2];
  unint64_t v17;

  v2 = *a2;
  if (!*a2 || !*(_BYTE *)(v2 + 56))
    return;
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v5 = *(const void **)(v2 + 16);
  if (v3 >= 0x17)
  {
    v7 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17)
      v7 = v3 | 7;
    v8 = v7 + 1;
    v6 = (void **)operator new(v7 + 1);
    __dst[1] = (void *)v3;
    v17 = v8 | 0x8000000000000000;
    __dst[0] = v6;
  }
  else
  {
    HIBYTE(v17) = *(_QWORD *)(v2 + 24);
    v6 = __dst;
    if (!v3)
      goto LABEL_11;
  }
  memmove(v6, v5, v3);
LABEL_11:
  *((_BYTE *)v6 + v3) = 0;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = SHIBYTE(v17);
  v11 = (void **)__dst[0];
  v12 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
  if (v10 >= 0)
    v13 = __dst;
  else
    v13 = v11;
  objc_msgSend(v9, "stringWithCString:encoding:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VKLogicDebugInfo initWithName:identifier:]([VKLogicDebugInfo alloc], "initWithName:identifier:", v14, *(_QWORD *)(v2 + 8));
  objc_msgSend(*(id *)(a1 + 8), "addObject:", v15);

  if (SHIBYTE(v17) < 0)
    operator delete(__dst[0]);
}

- (_QWORD)activeLogics
{
  _QWORD *v2;
  void *v3;

  v2 = operator new(0x10uLL);
  v3 = *(void **)(a1 + 8);
  *v2 = &off_1E42C7598;
  v2[1] = v3;
  return v2;
}

void __38__VKMapView__configureDefaultSettings__block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setEnableGlobe:", WeakRetained[576]);

}

void __38__VKMapView__configureDefaultSettings__block_invoke_2(uint64_t a1)
{
  unsigned __int8 *WeakRetained;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setEnableRoundedBuildings:", WeakRetained[577]);

}

void __38__VKMapView__configureDefaultSettings__block_invoke_3(uint64_t a1)
{
  unsigned __int8 *WeakRetained;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setEnableColorizedBuildings:", WeakRetained[578]);

}

void __38__VKMapView__configureDefaultSettings__block_invoke_4(uint64_t a1)
{
  unsigned __int8 *WeakRetained;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setEnableBuildingHeights:", WeakRetained[579]);

}

void __38__VKMapView__configureDefaultSettings__block_invoke_5(uint64_t a1)
{
  unsigned __int8 *WeakRetained;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setEnableAdvancedWater:", WeakRetained[581]);

}

void __38__VKMapView__configureDefaultSettings__block_invoke_6(uint64_t a1)
{
  unsigned __int8 *WeakRetained;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setEnableAdvancedLighting:", WeakRetained[580]);

}

void __38__VKMapView__configureDefaultSettings__block_invoke_7(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setTerrainMode:", WeakRetained[71]);

}

void __38__VKMapView__configureDefaultSettings__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  id v6;
  int8x8_t *v7;
  int8x8_t v8;
  uint8x8_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  md::StyleLogic *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_28;
  objc_msgSend(WeakRetained, "setModernMapEnabled:", a4);
  v7 = *(int8x8_t **)(*((_QWORD *)v6 + 48) + 1120);
  v8 = v7[2];
  if (!*(_QWORD *)&v8)
    goto LABEL_22;
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
LABEL_22:
    v16 = 0;
    goto LABEL_23;
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
        goto LABEL_22;
      }
      v12 = (_QWORD *)*v12;
      if (!v12)
        goto LABEL_22;
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
      goto LABEL_22;
LABEL_12:
    v12 = (_QWORD *)*v12;
    if (!v12)
      goto LABEL_22;
  }
  if (v12[2] != 0x2FED70A4459DFCA1)
    goto LABEL_12;
LABEL_29:
  v16 = (md::StyleLogic *)v12[5];
LABEL_23:
  md::StyleLogic::updateConfiguration(v16, *((_DWORD *)v6 + 9));
  v17 = *((_QWORD *)v6 + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v17 + 4536), "-[VKMapView _configureDefaultSettings]_block_invoke_8");
  v18 = *(_QWORD *)(*(_QWORD *)(v17 + 8) + 8);
  v21[0] = &off_1E42D49F0;
  v21[1] = v17;
  v22 = v21;
  geo::TaskQueue::barrierSync(v18, v21);
  v19 = v22;
  if (v22 == v21)
  {
    v20 = 4;
    v19 = v21;
LABEL_27:
    (*(void (**)(void))(*v19 + 8 * v20))();
  }
  else if (v22)
  {
    v20 = 5;
    goto LABEL_27;
  }
LABEL_28:

}

- (id)initWithDescriptor:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E42C7700;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (__CFString)initWithDescriptor:
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "detailedDescription");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("Invalid VKMapView");
  }

  return v3;
}

- (_QWORD)initWithDescriptor:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E42C7670;
  result[1] = v3;
  return result;
}

void __33__VKMapView_setMapType_animated___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    if (v3 == *(void **)(v4 + 48))
      v5 = objc_msgSend(v3, "flyoverMode");
    else
      v5 = 0xFFFFFFFFLL;
    objc_msgSend(v7, "mapLayer:flyoverModeDidChange:", v4, v5);

  }
}

void __33__VKMapView_setMapType_animated___block_invoke_2(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayer:canShowFlyoverDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

void __33__VKMapView_setMapType_animated___block_invoke_3(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayer:showingFlyoverDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

void __33__VKMapView_setMapType_animated___block_invoke_4(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayer:showingFlyoverDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

void __33__VKMapView_setMapType_animated___block_invoke_5(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayer:canShowFlyoverDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

void __31__VKMapView_setDesiredMapMode___block_invoke(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayer:willTransitionTo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __49__VKMapView_location_isInHikingContextualRegion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_962);
    v4 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = "YES";
      if (!*(_BYTE *)(a1 + 56))
        v6 = "NO";
      v8 = 134218242;
      v9 = v5;
      v10 = 2080;
      v11 = v6;
      _os_log_impl(&dword_19F029000, v4, OS_LOG_TYPE_INFO, "[VKMapView:%p] location:isInHikingContextualRegion: %s", (uint8_t *)&v8, 0x16u);
    }
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v7, "mapLayer:location:isInHikingContextualRegion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));

  }
}

+ (BOOL)_elevatedGroundIsAvailable
{
  char v2;
  void *v3;

  if (!MapsFeature_IsAvailable_ShelbyvilleTerrain())
    return 0;
  if ((GEOConfigGetBOOL() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "supportsAdvancedMap");

  return v2;
}

+ (BOOL)_globeIsAvailable
{
  char v2;
  void *v3;

  if (!MapsFeature_IsAvailable_ShelbyvilleGlobe())
    return 0;
  if ((GEOConfigGetBOOL() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "supportsAdvancedMap");

  return v2;
}

+ (void)updateUserLocationAnnotationStateForNavigationPuck:(id)a3 isPuckEnabled:(BOOL)a4 synchronizedState:(void *)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  double v9;
  id v10;

  v6 = a4;
  v7 = a3;
  if (v6)
  {
    *((_BYTE *)a5 + 84) = 1;
  }
  else
  {
    *((_BYTE *)a5 + 84) = 2;
    v10 = v7;
    objc_msgSend(v7, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collisionSize");
    *(float *)&v9 = v9;
    *((_DWORD *)a5 + 20) = LODWORD(v9);

    v7 = v10;
  }

}

- (void)_shutdownThermalMonitor
{
  int v3;

  v3 = *((_DWORD *)self + 129);
  if (v3)
  {
    notify_cancel(v3);
    *((_DWORD *)self + 129) = 0;
  }
}

void __42__VKMapView_Thermal___setupThermalMonitor__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateThermalPressureLevel");

}

- (void)debugHighlightFeatureMarker:(const void *)a3
{
  _QWORD *v5;

  v5 = -[VKMapView _labelSettings](self, "_labelSettings");
  (*(void (**)(_QWORD, const void *))(**(_QWORD **)(v5[3] + 240) + 264))(*(_QWORD *)(v5[3] + 240), a3);
  -[VKMapView _updateMapDisplayStyle](self, "_updateMapDisplayStyle");
}

- (VKMapCanvas)mapCanvas
{
  return (VKMapCanvas *)*((id *)self + 5);
}

- (const)mapEngine
{
  return (const void *)*((_QWORD *)self + 48);
}

- (void)performStylesheetDidChange
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v5;
  uint64_t v6;
  uint64_t ***v7;
  uint64_t **v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  char v30;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  if (!v2)
    return;
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    return;
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v3 <= 0x2FED70A4459DFCA1uLL)
      v6 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v3;
  }
  else
  {
    v6 = (*(_QWORD *)&v3 - 1) & 0x2FED70A4459DFCA1;
  }
  v7 = *(uint64_t ****)(*(_QWORD *)&v2[1] + 8 * v6);
  if (!v7)
    return;
  v8 = *v7;
  if (!v8)
    return;
  if (v5.u32[0] < 2uLL)
  {
    v9 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v11 = v8[1];
      if (v11 == (uint64_t *)0x2FED70A4459DFCA1)
      {
        if (v8[2] == (uint64_t *)0x2FED70A4459DFCA1)
          goto LABEL_23;
      }
      else if (((unint64_t)v11 & v9) != v6)
      {
        return;
      }
      v8 = (uint64_t **)*v8;
      if (!v8)
        return;
    }
  }
  while (1)
  {
    v10 = (unint64_t)v8[1];
    if (v10 == 0x2FED70A4459DFCA1)
      break;
    if (v10 >= *(_QWORD *)&v3)
      v10 %= *(_QWORD *)&v3;
    if (v10 != v6)
      return;
LABEL_12:
    v8 = (uint64_t **)*v8;
    if (!v8)
      return;
  }
  if (v8[2] != (uint64_t *)0x2FED70A4459DFCA1)
    goto LABEL_12;
LABEL_23:
  v12 = v8[5];
  if (v12)
  {
    v13 = v12[32];
    if (!v13)
    {
      md::StyleLogic::updateConfiguration((md::StyleLogic *)v8[5], *((_DWORD *)v12 + 274));
      v13 = v12[32];
    }
    v14 = (std::__shared_weak_count *)v12[33];
    v29 = v14;
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
    }
    if (v13)
    {
      v17 = *(_QWORD *)(v13 + 520);
      v18 = *(std::__shared_weak_count **)(v13 + 528);
      if (v18)
      {
        v19 = (unint64_t *)&v18->__shared_owners_;
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      if (v17)
        atomic_store(*(_DWORD *)(v17 + 248) + 1, (unsigned int *)(v17 + 248));
      if (v18)
      {
        v21 = (unint64_t *)&v18->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *, SEL))v18->__on_zero_shared)(v18, a2);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
    }
    v30 = 4;
    v23 = (char *)v12[141];
    v24 = (char *)v12[142];
    if (v23 != v24)
    {
      while (*v23 <= 3u)
      {
        if (++v23 == v24)
          goto LABEL_46;
      }
    }
    if (v23 == v24 || (v24 = v23, *v23 != 4))
LABEL_46:
      std::vector<md::StyleManagerEvent>::insert((uint64_t)(v12 + 141), v24, &v30);
    v25 = *(_QWORD *)v12[155];
    if (v25)
    {
      v30 = 12;
      md::MapEngine::setNeedsTick(v25, &v30);
    }
    v26 = *((_QWORD *)self + 48);
    v30 = 1;
    md::MapEngine::setNeedsTick(v26, &v30);
    if (v29)
    {
      v27 = (unint64_t *)&v29->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
  }
}

- (int64_t)currentMapMode
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  if (!v2)
    return 0;
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    return 0;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v3 <= 0x2FED70A4459DFCA1uLL)
      v5 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0x2FED70A4459DFCA1;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6)
    return 0;
  v7 = (_QWORD *)*v6;
  if (!v7)
    return 0;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0x2FED70A4459DFCA1)
      {
        if (v7[2] == 0x2FED70A4459DFCA1)
          goto LABEL_23;
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        return 0;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0x2FED70A4459DFCA1)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      return 0;
LABEL_12:
    v7 = (_QWORD *)*v7;
    if (!v7)
      return 0;
  }
  if (v7[2] != 0x2FED70A4459DFCA1)
    goto LABEL_12;
LABEL_23:
  v11 = v7[5];
  if (v11)
  {
    v12 = *(unsigned __int8 *)(v11 + 167) - 1;
    if (v12 <= 6)
      return qword_19FFB8800[v12];
  }
  return 0;
}

- (void)populateDebugNode:(void *)a3 withOptions:(const void *)a4
{
  uint64_t v7;
  id v8;
  const std::string::value_type *v9;
  uint64_t v10;
  unsigned int v11;
  __CFString *v12;
  const std::string::value_type *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  __CFString *v22;
  const std::string::value_type *v23;
  char *ChildNode;
  unint64_t v25;
  char *v26;
  unint64_t v27;
  __CFString *v28;
  const std::string::value_type *v29;
  __CFString *v30;
  const std::string::value_type *v31;
  const __CFString *v32;
  __CFString *v33;
  const std::string::value_type *v34;
  __CFString *v35;
  const std::string::value_type *v36;
  __CFString *v37;
  const std::string::value_type *v38;
  char *v39;
  char *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  char *v46;
  id v47;
  const std::string::value_type *v48;
  char *v49;
  id v50;
  const std::string::value_type *v51;
  char *v52;
  id v53;
  _BYTE *v54;
  uint64_t v55;
  char *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  void *v63;
  const char *v64;
  size_t v65;
  size_t v66;
  _BYTE *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id obj;
  void *v73;
  _QWORD v74[7];
  int v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  char v80[32];
  std::string v81;
  int v82;
  char v83[32];
  std::string v84;
  int v85;
  _QWORD v86[7];
  int v87;
  char v88[32];
  std::string v89;
  int v90;
  char v91[32];
  std::string v92;
  int v93;
  char v94[32];
  std::string v95;
  int v96;
  char v97[32];
  std::string v98;
  int v99;
  char v100[32];
  std::string v101;
  int v102;
  char v103[32];
  std::string v104;
  int v105;
  _QWORD v106[7];
  int v107;
  _QWORD v108[7];
  int v109;
  _QWORD v110[7];
  int v111;
  _QWORD v112[7];
  int v113;
  _QWORD v114[7];
  int v115;
  _QWORD v116[7];
  int v117;
  char v118[32];
  std::string v119;
  int v120;
  _QWORD v121[7];
  int v122;
  char v123[32];
  std::string __p;
  int v125;
  id v126;
  _BYTE v127[128];
  _BYTE __dst[24];
  _BYTE *v129;
  char v130;
  void **v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v7 = *((_QWORD *)self + 48);
  md::HomeQueueScheduler::waitForSynchronization(*(md::HomeQueueScheduler **)(v7 + 4536), "-[VKMapView(Internal) populateDebugNode:withOptions:]");
  __dst[23] = 4;
  strcpy(__dst, "Self");
  -[VKMapView description](self, "description");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const std::string::value_type *)objc_msgSend(v8, "UTF8String");
  memset(&__p, 0, sizeof(__p));
  v125 = 4;
  if (v9)
  {
    std::string::__assign_external(&__p, v9);
  }
  else
  {
    *((_BYTE *)&__p.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&__p, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v123);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  __dst[23] = 16;
  strcpy(__dst, "Is in Background");
  v10 = *((unsigned __int8 *)self + 240);
  v122 = 0;
  memset(&v121[4], 0, 24);
  v121[0] = v10;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v121);
  __dst[23] = 8;
  strcpy(__dst, "Map Type");
  if (*((_BYTE *)self + 32))
  {
    v11 = *((_DWORD *)self + 9) - 1;
    if (v11 > 0xA)
      v12 = CFSTR("VKMapTypeStandard");
    else
      v12 = off_1E42EB400[v11];
    v13 = (const std::string::value_type *)-[__CFString UTF8String](v12, "UTF8String");
    memset(&v119, 0, sizeof(v119));
    v120 = 4;
    if (v13)
    {
      std::string::__assign_external(&v119, v13);
    }
    else
    {
      *((_BYTE *)&v119.__r_.__value_.__s + 23) = 6;
      qmemcpy(&v119, "<null>", 6);
    }
  }
  else
  {
    memset(&v119, 0, sizeof(v119));
    v120 = 4;
    std::string::__assign_external(&v119, "NONE");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v118);
  if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v119.__r_.__value_.__l.__data_);
  __dst[23] = 21;
  strcpy(__dst, "Renders In Background");
  v117 = 0;
  memset(&v116[4], 0, 24);
  v116[0] = -[VKMapView rendersInBackground](self, "rendersInBackground");
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v116);
  v14 = (char *)operator new(0x19uLL);
  *(_QWORD *)__dst = v14;
  *(_OWORD *)&__dst[8] = xmmword_19FFB3490;
  strcpy(v14, "Did Finish Snapshotting");
  v15 = *((unsigned __int8 *)self + 392);
  v115 = 0;
  memset(&v114[4], 0, 24);
  v114[0] = v15;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v114);
  operator delete(v14);
  __dst[23] = 6;
  strcpy(__dst, "Hidden");
  v113 = 0;
  memset(&v112[4], 0, 24);
  v112[0] = -[VKMapView isHidden](self, "isHidden");
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v112);
  v16 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)self + 48) + 120) + 8);
  __dst[23] = 12;
  strcpy(__dst, "Display Rate");
  v111 = 0;
  memset(&v110[4], 0, 24);
  v110[0] = v16;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v110);
  v17 = (char *)operator new(0x19uLL);
  *(_QWORD *)__dst = v17;
  *(_OWORD *)&__dst[8] = xmmword_19FFB3490;
  strcpy(v17, "Navigation Display Rate");
  -[VKMapView currentCanvas](self, "currentCanvas");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cameraController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = 0;
  memset(&v108[4], 0, 24);
  v108[0] = objc_msgSend(v19, "baseDisplayRate");
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v108);

  operator delete(v17);
  __dst[23] = 12;
  strcpy(__dst, "Display Rate");
  v20 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)self + 48) + 120) + 8);
  v107 = 0;
  memset(&v106[4], 0, 24);
  v106[0] = v20;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v106);
  __dst[23] = 17;
  strcpy(__dst, "Application State");
  v21 = *((unsigned __int8 *)self + 192);
  if (v21 > 9)
    v22 = &stru_1E4315B30;
  else
    v22 = off_1E42EB458[v21];
  v23 = (const std::string::value_type *)-[__CFString UTF8String](v22, "UTF8String");
  memset(&v104, 0, sizeof(v104));
  v105 = 4;
  if (v23)
  {
    std::string::__assign_external(&v104, v23);
  }
  else
  {
    *((_BYTE *)&v104.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v104, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)__dst, (uint64_t)v103);
  if (SHIBYTE(v104.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v104.__r_.__value_.__l.__data_);
  __dst[23] = 13;
  strcpy(__dst, "Display Style");
  ChildNode = gdc::DebugTreeNode::createChildNode((uint64_t)a3, (__int128 *)__dst);
  v25 = (unint64_t)-[VKMapView mapDisplayStyle](self, "mapDisplayStyle");
  v26 = (char *)operator new(0x20uLL);
  *(_QWORD *)__dst = v26;
  *(_OWORD *)&__dst[8] = xmmword_19FFB34A0;
  strcpy(v26, "Displayed Search Results Type");
  v27 = *((unsigned __int8 *)self + 208);
  if (v27 > 4)
    v28 = &stru_1E4315B30;
  else
    v28 = off_1E42EB4A8[v27];
  v29 = (const std::string::value_type *)-[__CFString UTF8String](v28, "UTF8String");
  memset(&v101, 0, sizeof(v101));
  v102 = 4;
  if (v29)
  {
    std::string::__assign_external(&v101, v29);
  }
  else
  {
    *((_BYTE *)&v101.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v101, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)ChildNode, (uint64_t)__dst, (uint64_t)v100);
  if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v101.__r_.__value_.__l.__data_);
  operator delete(v26);
  __dst[23] = 10;
  strcpy(__dst, "TimePeriod");
  if ((_BYTE)v25)
    v30 = CFSTR("Night");
  else
    v30 = CFSTR("Day");
  v31 = (const std::string::value_type *)-[__CFString UTF8String](v30, "UTF8String");
  memset(&v98, 0, sizeof(v98));
  v99 = 4;
  if (v31)
  {
    std::string::__assign_external(&v98, v31);
  }
  else
  {
    *((_BYTE *)&v98.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v98, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)ChildNode, (uint64_t)__dst, (uint64_t)v97);
  if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v98.__r_.__value_.__l.__data_);
  __dst[23] = 11;
  strcpy(__dst, "OverlayType");
  v32 = CFSTR("None");
  if (BYTE1(v25) == 1)
    v32 = CFSTR("Traffic");
  if (BYTE1(v25) == 2)
    v33 = CFSTR("Transit");
  else
    v33 = (__CFString *)v32;
  v34 = (const std::string::value_type *)-[__CFString UTF8String](v33, "UTF8String");
  memset(&v95, 0, sizeof(v95));
  v96 = 4;
  if (v34)
  {
    std::string::__assign_external(&v95, v34);
  }
  else
  {
    *((_BYTE *)&v95.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v95, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)ChildNode, (uint64_t)__dst, (uint64_t)v94);
  if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v95.__r_.__value_.__l.__data_);
  __dst[23] = 16;
  strcpy(__dst, "ApplicationState");
  if (BYTE2(v25) > 9u)
    v35 = &stru_1E4315B30;
  else
    v35 = off_1E42EB458[BYTE2(v25)];
  v36 = (const std::string::value_type *)-[__CFString UTF8String](v35, "UTF8String");
  memset(&v92, 0, sizeof(v92));
  v93 = 4;
  if (v36)
  {
    std::string::__assign_external(&v92, v36);
  }
  else
  {
    *((_BYTE *)&v92.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v92, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)ChildNode, (uint64_t)__dst, (uint64_t)v91);
  if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v92.__r_.__value_.__l.__data_);
  __dst[23] = 17;
  strcpy(__dst, "SearchResultsType");
  if (BYTE4(v25) > 4u)
    v37 = &stru_1E4315B30;
  else
    v37 = off_1E42EB4A8[BYTE4(v25)];
  v38 = (const std::string::value_type *)-[__CFString UTF8String](v37, "UTF8String");
  memset(&v89, 0, sizeof(v89));
  v90 = 4;
  if (v38)
  {
    std::string::__assign_external(&v89, v38);
  }
  else
  {
    *((_BYTE *)&v89.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v89, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)ChildNode, (uint64_t)__dst, (uint64_t)v88);
  if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v89.__r_.__value_.__l.__data_);
  __dst[23] = 12;
  strcpy(__dst, "MapHasLabels");
  v87 = 0;
  memset(&v86[4], 0, 24);
  v86[0] = (v25 >> 40) & 1;
  gdc::DebugTreeNode::addProperty((uint64_t)ChildNode, (uint64_t)__dst, (uint64_t)v86);
  __dst[23] = 10;
  strcpy(__dst, "Map Canvas");
  objc_msgSend(*((id *)self + 5), "populateDebugNode:withOptions:", gdc::DebugTreeNode::createChildNode((uint64_t)a3, (__int128 *)__dst), a4);
  v39 = (char *)operator new(0x20uLL);
  *(_QWORD *)__dst = v39;
  *(_OWORD *)&__dst[8] = xmmword_19FFB34B0;
  strcpy(v39, "Current Camera Controller");
  v40 = gdc::DebugTreeNode::createChildNode((uint64_t)a3, (__int128 *)__dst);
  operator delete(v39);
  -[VKMapView currentCanvas](self, "currentCanvas");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "cameraController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "populateDebugNode:withOptions:", v40, a4);

  md::MapEngine::createDebugNode((uint64_t)__dst, v7, (uint64_t)a4);
  gdc::DebugTreeNode::addChildNode(a3, (__int128 *)__dst);
  v43 = v132;
  if (v132)
  {
    v44 = v133;
    v45 = v132;
    if ((void *)v133 != v132)
    {
      do
      {
        v44 -= 80;
        std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v44);
      }
      while ((void *)v44 != v43);
      v45 = v132;
    }
    v133 = (uint64_t)v43;
    operator delete(v45);
  }
  std::vector<gdc::DebugTreeNode>::~vector[abi:nn180100](&v131);
  if (v130 < 0)
  {
    operator delete(v129);
    if ((__dst[23] & 0x80000000) == 0)
      goto LABEL_73;
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_73;
  }
  operator delete(*(void **)__dst);
LABEL_73:
  __dst[23] = 13;
  strcpy(__dst, "Puck Animator");
  v46 = gdc::DebugTreeNode::createChildNode((uint64_t)a3, (__int128 *)__dst);
  __dst[23] = 11;
  strcpy(__dst, "Description");
  objc_msgSend(*((id *)self + 28), "detailedDescription");
  v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v48 = (const std::string::value_type *)objc_msgSend(v47, "UTF8String");
  memset(&v84, 0, sizeof(v84));
  v85 = 4;
  if (v48)
  {
    std::string::__assign_external(&v84, v48);
  }
  else
  {
    *((_BYTE *)&v84.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v84, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)v46, (uint64_t)__dst, (uint64_t)v83);
  if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v84.__r_.__value_.__l.__data_);

  __dst[23] = 13;
  strcpy(__dst, "Route Context");
  v49 = gdc::DebugTreeNode::createChildNode((uint64_t)a3, (__int128 *)__dst);
  __dst[23] = 11;
  strcpy(__dst, "Description");
  objc_msgSend(*((id *)self + 59), "description");
  v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51 = (const std::string::value_type *)objc_msgSend(v50, "UTF8String");
  memset(&v81, 0, sizeof(v81));
  v82 = 4;
  if (v51)
  {
    std::string::__assign_external(&v81, v51);
  }
  else
  {
    *((_BYTE *)&v81.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v81, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)v49, (uint64_t)__dst, (uint64_t)v80);
  if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v81.__r_.__value_.__l.__data_);

  __dst[23] = 10;
  strcpy(__dst, "TileLoader");
  v52 = gdc::DebugTreeNode::createChildNode((uint64_t)a3, (__int128 *)__dst);
  objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v71)
    goto LABEL_92;
  *(_QWORD *)__dst = &off_1E42C7CA0;
  *(_QWORD *)&__dst[8] = __dst;
  v129 = __dst;
  objc_msgSend(v71, "descriptionDictionaryRepresentation");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v126 = v53;
  if (v129)
  {
    (*(void (**)(_BYTE *, id *, char *))(*(_QWORD *)v129 + 48))(v129, &v126, v52);

    v54 = v129;
    if (v129 == __dst)
    {
      v55 = 4;
      v54 = __dst;
    }
    else
    {
      if (!v129)
      {
LABEL_92:
        __dst[23] = 15;
        strcpy(__dst, "Tile Statistics");
        v56 = gdc::DebugTreeNode::createChildNode((uint64_t)a3, (__int128 *)__dst);
        -[VKMapView tileStatistics](self, "tileStatistics");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "allKeys");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        obj = v58;
        v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v127, 16);
        if (!v59)
          goto LABEL_109;
        v60 = *(_QWORD *)v77;
        while (1)
        {
          for (i = 0; i != v59; ++i)
          {
            if (*(_QWORD *)v77 != v60)
              objc_enumerationMutation(obj);
            v62 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
            objc_msgSend(v73, "valueForKey:", v62, v71);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = (const char *)objc_msgSend(objc_retainAutorelease(v62), "UTF8String");
            v65 = strlen(v64);
            if (v65 >= 0x7FFFFFFFFFFFFFF8)
              abort();
            v66 = v65;
            if (v65 >= 0x17)
            {
              v68 = (v65 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v65 | 7) != 0x17)
                v68 = v65 | 7;
              v69 = v68 + 1;
              v67 = operator new(v68 + 1);
              *(_QWORD *)&__dst[8] = v66;
              *(_QWORD *)&__dst[16] = v69 | 0x8000000000000000;
              *(_QWORD *)__dst = v67;
LABEL_104:
              memmove(v67, v64, v66);
              goto LABEL_105;
            }
            __dst[23] = v65;
            v67 = __dst;
            if (v65)
              goto LABEL_104;
LABEL_105:
            v67[v66] = 0;
            v70 = objc_msgSend(v63, "longLongValue");
            memset(&v74[4], 0, 24);
            v75 = 0;
            v74[0] = v70;
            gdc::DebugTreeNode::addProperty((uint64_t)v56, (uint64_t)__dst, (uint64_t)v74);
            if ((__dst[23] & 0x80000000) != 0)
              operator delete(*(void **)__dst);

          }
          v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v127, 16);
          if (!v59)
          {
LABEL_109:

            return;
          }
        }
      }
      v55 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v54 + 8 * v55))();
    goto LABEL_92;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (id)iconForStyleAttributes:(id)a3 contentScale:(double)a4 size:(int64_t)a5 transparent:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  int8x8_t *v11;
  int8x8_t v12;
  uint8x8_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  VKIconModifiers *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  unint64_t *v30;
  unint64_t v31;
  void *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  std::__shared_weak_count *v43;

  v6 = a6;
  v10 = a3;
  v11 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v12 = v11[2];
  if (!*(_QWORD *)&v12)
    goto LABEL_21;
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
LABEL_21:
    v20 = 0;
    v21 = MEMORY[0x100];
    if (!MEMORY[0x100])
      goto LABEL_22;
    goto LABEL_23;
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
          goto LABEL_40;
      }
      else if ((v19 & v17) != v14)
      {
        goto LABEL_21;
      }
      v16 = (_QWORD *)*v16;
      if (!v16)
        goto LABEL_21;
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
      goto LABEL_21;
LABEL_11:
    v16 = (_QWORD *)*v16;
    if (!v16)
      goto LABEL_21;
  }
  if (v16[2] != 0x2FED70A4459DFCA1)
    goto LABEL_11;
LABEL_40:
  v20 = v16[5];
  v21 = *(_QWORD *)(v20 + 256);
  if (!v21)
  {
LABEL_22:
    md::StyleLogic::updateConfiguration((md::StyleLogic *)v20, *(_DWORD *)(v20 + 1096));
    v21 = *(_QWORD *)(v20 + 256);
  }
LABEL_23:
  v22 = *(std::__shared_weak_count **)(v20 + 264);
  v42 = v21;
  v43 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldxr(p_shared_owners);
    while (__stxr(v24 + 1, p_shared_owners));
  }
  v25 = objc_alloc_init(VKIconModifiers);
  -[VKIconModifiers setGlyphOnly:](v25, "setGlyphOnly:", v6);
  +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "iconManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27;
  v40 = v21;
  v41 = v22;
  if (v22)
  {
    v30 = (unint64_t *)&v22->__shared_owners_;
    do
      v31 = __ldxr(v30);
    while (__stxr(v31 + 1, v30));
  }
  *(float *)&v28 = a4;
  objc_msgSend(v27, "imageForStyleAttributes:styleManager:contentScale:sizeGroup:modifiers:", v10, &v40, a5, v25, v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v41;
  if (v41)
  {
    v34 = (unint64_t *)&v41->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }

  v36 = v43;
  if (v43)
  {
    v37 = (unint64_t *)&v43->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

  return v32;
}

- (id)roadLabelTilesInScene
{
  id v3;
  int8x8_t *v4;
  int8x8_t v5;
  uint8x8_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  md::SceneContext *v14;
  uint64_t v15;
  unsigned __int8 v16;
  _WORD *v17;
  _WORD *v18;
  uint64_t *v19;
  _WORD *v20;
  NSObject *v21;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  std::__shared_weak_count *v26;
  uint64_t v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  id v30;
  uint64_t *v31;
  std::__shared_weak_count *v32;
  uint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  void *v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  BOOL v44;
  NSObject *v45;
  uint64_t v46;
  md::SceneContext *v47;
  int v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  _BYTE buf[22];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v5 = v4[2];
  if (!*(_QWORD *)&v5)
    goto LABEL_30;
  v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = 0x2B7C4502BD3C99C6;
    if (*(_QWORD *)&v5 <= 0x2B7C4502BD3C99C6uLL)
      v7 = 0x2B7C4502BD3C99C6uLL % *(_QWORD *)&v5;
  }
  else
  {
    v7 = (*(_QWORD *)&v5 - 1) & 0x2B7C4502BD3C99C6;
  }
  v8 = *(_QWORD **)(*(_QWORD *)&v4[1] + 8 * v7);
  if (!v8)
    goto LABEL_30;
  v9 = (_QWORD *)*v8;
  if (!v9)
    goto LABEL_30;
  if (v6.u32[0] < 2uLL)
  {
    v10 = *(_QWORD *)&v5 - 1;
    while (1)
    {
      v12 = v9[1];
      if (v12 == 0x2B7C4502BD3C99C6)
      {
        if (v9[2] == 0x2B7C4502BD3C99C6)
          goto LABEL_22;
      }
      else if ((v12 & v10) != v7)
      {
        goto LABEL_30;
      }
      v9 = (_QWORD *)*v9;
      if (!v9)
        goto LABEL_30;
    }
  }
  while (1)
  {
    v11 = v9[1];
    if (v11 == 0x2B7C4502BD3C99C6)
      break;
    if (v11 >= *(_QWORD *)&v5)
      v11 %= *(_QWORD *)&v5;
    if (v11 != v7)
      goto LABEL_30;
LABEL_11:
    v9 = (_QWORD *)*v9;
    if (!v9)
      goto LABEL_30;
  }
  if (v9[2] != 0x2B7C4502BD3C99C6)
    goto LABEL_11;
LABEL_22:
  v13 = v9[5];
  if (!v13 || (v14 = *(md::SceneContext **)(v13 + 120)) == 0)
  {
LABEL_30:
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1)
      dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_28690);
    v21 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_19F029000, v21, OS_LOG_TYPE_INFO, "[VKMapView:%p] roadLabelTilesInScene - no SceneContext", buf, 0xCu);
    }
    return v3;
  }
  v15 = *(_QWORD *)v14;
  if ((v16 & 1) == 0)
  {
    v47 = v14;
    v14 = v47;
    if (v48)
    {
      qword_1ECE2F300 = 0;
      qword_1ECE2F2F8 = 0;
      md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet = (uint64_t)&qword_1ECE2F2F8;
      __cxa_atexit((void (*)(void *))std::set<gdc::LayerDataWithWorld>::~set[abi:nn180100], &md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet, &dword_19F029000);
      v14 = v47;
    }
  }
  v17 = *(_WORD **)(v15 + 48);
  v18 = *(_WORD **)(v15 + 56);
  v19 = &md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet;
  if (v17 != v18)
  {
    v20 = v17;
    while (*v20 != 21)
    {
      v20 += 16;
      if (v20 == v18)
        goto LABEL_41;
    }
    if (v20 == v18)
    {
      v19 = &md::SceneStateManager::layerDataInView(unsigned short)const::kEmptySet;
    }
    else
    {
      while (*v17 != 21)
      {
        v17 += 16;
        if (v17 == v18)
        {
          v17 = v18;
          break;
        }
      }
      v19 = (uint64_t *)(v17 + 4);
    }
  }
LABEL_41:
  if (!v19[2])
    v19 = md::SceneContext::layerDataInView(v14, 18);
  v25 = (uint64_t *)*v19;
  v23 = v19 + 1;
  v24 = v25;
  if (v25 != v23)
  {
    while (2)
    {
      v27 = v24[4];
      v26 = (std::__shared_weak_count *)v24[5];
      *(_QWORD *)buf = v27;
      *(_QWORD *)&buf[8] = v26;
      if (v26)
      {
        p_shared_owners = (unint64_t *)&v26->__shared_owners_;
        do
          v29 = __ldxr(p_shared_owners);
        while (__stxr(v29 + 1, p_shared_owners));
      }
      if (v27 && *(_QWORD *)(v27 + 720))
      {
        v30 = objc_alloc(MEMORY[0x1E0D276A8]);
        v31 = *(uint64_t **)(*(_QWORD *)(v27 + 720) + 24);
        v33 = *v31;
        v32 = (std::__shared_weak_count *)v31[1];
        v49 = v33;
        v50 = v32;
        if (v32)
        {
          v34 = (unint64_t *)&v32->__shared_owners_;
          do
            v35 = __ldxr(v34);
          while (__stxr(v35 + 1, v34));
        }
        v36 = (void *)objc_msgSend(v30, "initWithVectorTile:", &v49);
        v37 = v50;
        if (v50)
        {
          v38 = (unint64_t *)&v50->__shared_owners_;
          do
            v39 = __ldaxr(v38);
          while (__stlxr(v39 - 1, v38));
          if (!v39)
          {
            ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
            std::__shared_weak_count::__release_weak(v37);
          }
        }
        objc_msgSend(v3, "addObject:", v36, v49);

        v26 = *(std::__shared_weak_count **)&buf[8];
      }
      if (!v26)
        goto LABEL_64;
      v40 = (unint64_t *)&v26->__shared_owners_;
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
        v42 = (uint64_t *)v24[1];
        if (v42)
          goto LABEL_65;
      }
      else
      {
LABEL_64:
        v42 = (uint64_t *)v24[1];
        if (v42)
        {
          do
          {
LABEL_65:
            v43 = v42;
            v42 = (uint64_t *)*v42;
          }
          while (v42);
          goto LABEL_45;
        }
      }
      do
      {
        v43 = (uint64_t *)v24[2];
        v44 = *v43 == (_QWORD)v24;
        v24 = v43;
      }
      while (!v44);
LABEL_45:
      v24 = v43;
      if (v43 == v23)
        break;
      continue;
    }
  }
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken[0] != -1)
    dispatch_once(GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_28690);
  v45 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    v46 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v46;
    _os_log_impl(&dword_19F029000, v45, OS_LOG_TYPE_INFO, "[VKMapView:%p] roadLabelTilesInScene:%zu", buf, 0x16u);
  }

  return v3;
}

- (void)setARSceneType:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v5 = 27;
  if (a3 == 2)
    v4 = 2;
  else
    v4 = a3 == 1;
  md::MapEngineSettings::set(v3, &v5, (_QWORD *)v4);
}

- (int)arSceneType
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 27)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  if (v3 == v4)
    return 0;
  v5 = *(_QWORD *)(v3 + 8);
  if (v5 == 2)
    return 2;
  else
    return v5 == 1;
}

- (int)arMode
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  v2 = *(uint64_t **)(*((_QWORD *)self + 48) + 1128);
  v3 = *v2;
  v4 = v2[1];
  if (v3 != v4)
  {
    while (*(_BYTE *)v3 != 26)
    {
      v3 += 16;
      if (v3 == v4)
        return 0;
    }
  }
  if (v3 == v4)
    return 0;
  v5 = (*(_QWORD *)(v3 + 8) - 1);
  if (v5 > 2)
    return 0;
  else
    return v5 + 1;
}

- (void)setARMode:(int)a3
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;

  v3 = (a3 - 1);
  if (v3 < 3)
    v4 = (_QWORD *)(v3 + 1);
  else
    v4 = 0;
  v5 = *(_QWORD *)(*((_QWORD *)self + 48) + 1128);
  v6 = 26;
  md::MapEngineSettings::set(v5, &v6, v4);
}

- (void)enterARWalking:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    -[VKMapView setARSession:](self, "setARSession:", v4);
  }
  else
  {
    v5 = +[MDARSession newGeoTrackingSession](MDARSession, "newGeoTrackingSession");
    -[VKMapView _setARSession:](self, "_setARSession:", v5);

  }
}

- (void)exitARWalking
{
  -[VKMapView setARSession:](self, "setARSession:", 0);
}

- (void)_setARSession:(id)a3
{
  ARSession *v4;
  NSObject *v5;
  int8x8_t *v6;
  int8x8_t v7;
  uint8x8_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id *v16;
  int v17;
  ARSession *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (ARSession *)a3;
  if (+[MDARSession isSupported](MDARSession, "isSupported"))
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_30680);
    v5 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "Set AR Session:%@", (uint8_t *)&v17, 0xCu);
    }
    v6 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
    v7 = v6[2];
    if (v7)
    {
      v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        v9 = 0x69AB09C896BF94A7;
        if (*(_QWORD *)&v7 <= 0x69AB09C896BF94A7uLL)
          v9 = 0x69AB09C896BF94A7uLL % *(_QWORD *)&v7;
      }
      else
      {
        v9 = (*(_QWORD *)&v7 - 1) & 0x69AB09C896BF94A7;
      }
      v11 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
      if (v11)
      {
        v12 = (_QWORD *)*v11;
        if (v12)
        {
          if (v8.u32[0] < 2uLL)
          {
            v13 = *(_QWORD *)&v7 - 1;
            while (1)
            {
              v15 = v12[1];
              if (v15 == 0x69AB09C896BF94A7)
              {
                if (v12[2] == 0x69AB09C896BF94A7)
                  goto LABEL_31;
              }
              else if ((v15 & v13) != v9)
              {
                goto LABEL_33;
              }
              v12 = (_QWORD *)*v12;
              if (!v12)
                goto LABEL_33;
            }
          }
          do
          {
            v14 = v12[1];
            if (v14 == 0x69AB09C896BF94A7)
            {
              if (v12[2] == 0x69AB09C896BF94A7)
              {
LABEL_31:
                v16 = (id *)v12[5];
                if (v16)
                  md::ARLogic::setARSession(v16, v4);
                break;
              }
            }
            else
            {
              if (v14 >= *(_QWORD *)&v7)
                v14 %= *(_QWORD *)&v7;
              if (v14 != v9)
                break;
            }
            v12 = (_QWORD *)*v12;
          }
          while (v12);
        }
      }
    }
  }
  else
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_30680);
    v10 = GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19F029000, v10, OS_LOG_TYPE_ERROR, "AR Walking is unsupported", (uint8_t *)&v17, 2u);
    }
  }
LABEL_33:

}

- (id)setARWalkingFeatureSet:(id)a3
{
  VKARWalkingFeatureSet *v4;
  int8x8_t *v5;
  int8x8_t v6;
  uint8x8_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  id v16;
  VKARWalkingFeatureSet *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  VKARWalkingFeatureSet *v23;
  NSObject *v24;
  VKARWalkingFeatureSet *v25;
  void *v26;
  VKARWalkingFeatureSet *v27;
  NSObject *v28;
  VKARWalkingFeatureSet *v29;
  NSObject *v30;
  NSObject *v31;
  VKARWalkingFeatureSet *v32;
  VKARWalkingFeatureSet *v33;
  void *v34;
  int v36;
  VKARWalkingFeatureSet *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (VKARWalkingFeatureSet *)a3;
  v5 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v6 = v5[2];
  if (!*(_QWORD *)&v6)
    goto LABEL_21;
  v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    v8 = 0xF4B920F5F640B882;
    if (*(_QWORD *)&v6 <= 0xF4B920F5F640B882)
      v8 = 0xF4B920F5F640B882 % *(_QWORD *)&v6;
  }
  else
  {
    v8 = (*(_QWORD *)&v6 - 1) & 0xF4B920F5F640B882;
  }
  v9 = *(_QWORD **)(*(_QWORD *)&v5[1] + 8 * v8);
  if (!v9 || (v10 = (_QWORD *)*v9) == 0)
  {
LABEL_21:
    v14 = 0;
    if (!MEMORY[0x78])
      goto LABEL_24;
    goto LABEL_22;
  }
  if (v7.u32[0] < 2uLL)
  {
    v11 = *(_QWORD *)&v6 - 1;
    while (1)
    {
      v13 = v10[1];
      if (v13 == 0xF4B920F5F640B882)
      {
        if (v10[2] == 0xF4B920F5F640B882)
          goto LABEL_23;
      }
      else if ((v13 & v11) != v8)
      {
        goto LABEL_21;
      }
      v10 = (_QWORD *)*v10;
      if (!v10)
        goto LABEL_21;
    }
  }
  while (1)
  {
    v12 = v10[1];
    if (v12 == 0xF4B920F5F640B882)
      break;
    if (v12 >= *(_QWORD *)&v6)
      v12 %= *(_QWORD *)&v6;
    if (v12 != v8)
      goto LABEL_21;
LABEL_11:
    v10 = (_QWORD *)*v10;
    if (!v10)
      goto LABEL_21;
  }
  if (v10[2] != 0xF4B920F5F640B882)
    goto LABEL_11;
LABEL_23:
  v14 = v10[5];
  if (*(_QWORD *)(v14 + 120))
  {
LABEL_22:
    v15 = (id *)(v14 + 168);
    goto LABEL_25;
  }
LABEL_24:
  v15 = (id *)(*(_QWORD *)(*(_QWORD *)(v14 + 128) + 40) + 144);
LABEL_25:
  v16 = *v15;
  objc_msgSend(v16, "features");
  v17 = (VKARWalkingFeatureSet *)objc_claimAutoreleasedReturnValue();

  if (v17 == v4)
  {
    if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_30680);
    v24 = (id)GEOGetVectorKitVKMapViewLog(void)::log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v16, "features");
      v25 = (VKARWalkingFeatureSet *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "features");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 134218240;
      v37 = v25;
      v38 = 2048;
      v39 = v26;
      _os_log_impl(&dword_19F029000, v24, OS_LOG_TYPE_INFO, "Set ARFeatures (unchanged) - current:%p incoming:%p", (uint8_t *)&v36, 0x16u);

    }
    v23 = (VKARWalkingFeatureSet *)v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v16, "features");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "isEqualToSet:", v21))
    {
      if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_30680);
      v22 = GEOGetVectorKitVKMapViewLog(void)::log;
      if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
      {
        v36 = 138412290;
        v37 = v4;
        _os_log_impl(&dword_19F029000, v22, OS_LOG_TYPE_INFO, "Set ARFeatures (unchanged) - %@", (uint8_t *)&v36, 0xCu);
      }
      v23 = (VKARWalkingFeatureSet *)v16;
    }
    else
    {
      v27 = -[VKARWalkingFeatureSet initWithFeatures:]([VKARWalkingFeatureSet alloc], "initWithFeatures:", v4);
      if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_30680);
      v28 = GEOGetVectorKitVKMapViewLog(void)::log;
      if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
      {
        v36 = 138412290;
        v37 = v27;
        _os_log_impl(&dword_19F029000, v28, OS_LOG_TYPE_INFO, "Set ARFeatures:%@", (uint8_t *)&v36, 0xCu);
      }
      v29 = v27;
      if (*(_QWORD *)(v14 + 120))
      {
        if (GEOGetVectorKitARFeatureInjectionLogicLog(void)::onceToken != -1)
          dispatch_once(&GEOGetVectorKitARFeatureInjectionLogicLog(void)::onceToken, &__block_literal_global_31028);
        v30 = GEOGetVectorKitARFeatureInjectionLogicLog(void)::log;
        if (os_log_type_enabled((os_log_t)GEOGetVectorKitARFeatureInjectionLogicLog(void)::log, OS_LOG_TYPE_INFO))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_19F029000, v30, OS_LOG_TYPE_INFO, "ARFeatureInjectionLogic intercepted features for ARDebugScene", (uint8_t *)&v36, 2u);
        }
      }
      else
      {
        if (GEOGetVectorKitARFeatureInjectionLogicLog(void)::onceToken != -1)
          dispatch_once(&GEOGetVectorKitARFeatureInjectionLogicLog(void)::onceToken, &__block_literal_global_31028);
        v31 = GEOGetVectorKitARFeatureInjectionLogicLog(void)::log;
        if (os_log_type_enabled((os_log_t)GEOGetVectorKitARFeatureInjectionLogicLog(void)::log, OS_LOG_TYPE_INFO))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_19F029000, v31, OS_LOG_TYPE_INFO, "ARFeatureInjectionLogic forwarding features to LabelSettings", (uint8_t *)&v36, 2u);
        }
        md::LabelSettings::setARWalkingFeatures(*(md::LabelSettings **)(v14 + 128), v29, 0);
      }
      v32 = v29;
      v23 = v32;
      if (v32)
        v33 = v32;
      v34 = *(void **)(v14 + 168);
      *(_QWORD *)(v14 + 168) = v23;

    }
  }

  return v23;
}

- (void)setARWalkingFeatures:(id)a3
{
  id v3;

  v3 = -[VKMapView setARWalkingFeatureSet:](self, "setARWalkingFeatureSet:", a3);
}

- (id)arWalkingDebugOutput
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void *v14;
  void *__p[2];
  char v17;

  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    goto LABEL_21;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0x20A1ED17D78F322BLL;
    if (*(_QWORD *)&v3 <= 0x20A1ED17D78F322BuLL)
      v5 = 0x20A1ED17D78F322BuLL % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0x20A1ED17D78F322BLL;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6 || (v7 = (_QWORD *)*v6) == 0)
  {
LABEL_21:
    v11 = 0;
    goto LABEL_22;
  }
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0x20A1ED17D78F322BLL)
      {
        if (v7[2] == 0x20A1ED17D78F322BLL)
          goto LABEL_30;
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_21;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        goto LABEL_21;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0x20A1ED17D78F322BLL)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      goto LABEL_21;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      goto LABEL_21;
  }
  if (v7[2] != 0x20A1ED17D78F322BLL)
    goto LABEL_11;
LABEL_30:
  v11 = v7[5];
LABEL_22:
  v12 = *(_QWORD *)md::LabelsLogic::labelManagerForWorldType(v11, 3u);
  if (v12)
  {
    md::LabelManager::debugString((md::LabelManager *)__p, v12, 0);
    if (v17 >= 0)
      v13 = __p;
    else
      v13 = (void **)__p[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)enterARModeAtCoordinate:(id)a3
{
  double var1;
  double var0;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  id v9;
  void *v10;
  MDARController *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id WeakRetained;
  char v17;
  id v18;
  uint64_t v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  id v27;

  var1 = a3.var1;
  var0 = a3.var0;
  -[VKMapView setMapType:animated:](self, "setMapType:animated:", 10, 0);
  if (+[MDARController isSupported](MDARController, "isSupported"))
  {
    v6 = *(_QWORD *)(*((_QWORD *)self + 48) + 1056);
    md::ARContext::ARContext((md::ARContext *)&v19);
    v7 = v19;
    *(_DWORD *)(v6 + 8) = v20;
    *(_QWORD *)v6 = v7;
    v8 = v23;
    *(_OWORD *)(v6 + 16) = v21;
    *(_OWORD *)(v6 + 32) = v22;
    *(_OWORD *)(v6 + 48) = v8;
    *(_OWORD *)(v6 + 64) = v24;
    *(_OWORD *)(v6 + 80) = v25;
    *(_QWORD *)(v6 + 96) = v26;
    v9 = v27;
    v27 = 0;
    v10 = *(void **)(v6 + 104);
    *(_QWORD *)(v6 + 104) = v9;

    v11 = objc_alloc_init(MDARController);
    v12 = (void *)*((_QWORD *)self + 50);
    *((_QWORD *)self + 50) = v11;

    objc_msgSend(*((id *)self + 50), "run:", 1);
    objc_msgSend(*((id *)self + 50), "setDelegate:", self);
    v13 = *(_QWORD *)(*((_QWORD *)self + 48) + 1056);
    objc_msgSend(*((id *)self + 50), "session");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(v13 + 104);
    *(_QWORD *)(v13 + 104) = v14;

    *(_BYTE *)v13 = 1;
  }
  WeakRetained = objc_loadWeakRetained((id *)self + 15);
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    v18 = objc_loadWeakRetained((id *)self + 15);
    objc_msgSend(v18, "mapLayerWillEnterAR:", self);

  }
  objc_msgSend(*((id *)self + 6), "enterARSessionAtCoordinate:", var0, var1);
  -[VKMapView setFlyoverMode:](self, "setFlyoverMode:", 0);
}

- (void)exitARMode
{
  uint64_t v3;
  int v4;
  char v5;
  char v6;
  int v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id WeakRetained;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v3 = *((_QWORD *)self + 48);
  v4 = *(unsigned __int8 *)(v3 + 1241);
  md::MapEngine::setDisplayRate(v3, -1);
  WeakRetained = objc_loadWeakRetained((id *)self + 15);
  if (v4)
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)self + 15);
      objc_msgSend(v13, "mapLayerWillExitAR:", self);

    }
    -[VKMapView setFlyoverMode:](self, "setFlyoverMode:", 0xFFFFFFFFLL);
    v14 = objc_loadWeakRetained((id *)self + 15);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v15 = objc_loadWeakRetained((id *)self + 15);
      objc_msgSend(v15, "mapLayerDidExitAR:", self);

    }
  }
  else
  {
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)self + 15);
      objc_msgSend(v16, "mapLayerWillExitAR:", self);

    }
    objc_msgSend(*((id *)self + 6), "exitARSession");
    objc_msgSend(*((id *)self + 6), "stopFlyoverAnimation");
    -[VKMapView setFlyoverMode:](self, "setFlyoverMode:", 0xFFFFFFFFLL);
    v17 = objc_loadWeakRetained((id *)self + 15);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)self + 15);
      objc_msgSend(v18, "mapLayerDidExitAR:", self);

    }
    objc_msgSend(*((id *)self + 50), "pause");
    v9 = *(_QWORD *)(*((_QWORD *)self + 48) + 1056);
    v10 = *(void **)(v9 + 104);
    *(_QWORD *)(v9 + 104) = 0;

    *(_BYTE *)v9 = 0;
    v11 = (void *)*((_QWORD *)self + 50);
    *((_QWORD *)self + 50) = 0;

  }
}

- (void)map:(id)a3 didEnterARMode:(BOOL)a4
{
  void *v5;
  char v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__VKMapView_AR__map_didEnterARMode___block_invoke;
  v7[3] = &unk_1E42F6DA0;
  v7[4] = self;
  -[VKMapView _postDelegateCallbackBlock:](self, "_postDelegateCallbackBlock:", v7, a4);
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "arRenderAtNativeRate");

  if ((v6 & 1) == 0)
    md::MapEngine::setDisplayRate(*((_QWORD *)self + 48), 60);
}

- (void)arController:(id)a3 didEncounterError:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)self + 15);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)self + 15);
    objc_msgSend(v7, "mapLayer:didEncounterARError:", self, v8);

  }
}

- (void)arController:(id)a3 arSessionWasInterrupted:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = (void *)*((_QWORD *)self + 6);
  if (v6)
  {
    objc_msgSend(v6, "arCameraController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*((id *)self + 6), "arCameraController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arSessionWasInterrupted:", a4);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)self + 15);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)self + 15);
    objc_msgSend(v11, "mapLayer:arSessionWasInterrupted:", self, a4);

  }
}

- (void)arControllerSessionInterruptionEnded:(id)a3
{
  id *v4;
  char v5;
  id WeakRetained;
  id v7;

  v4 = (id *)((char *)self + 120);
  WeakRetained = objc_loadWeakRetained((id *)self + 15);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "mapLayerARSessionInterruptionEnded:", self);

  }
}

- (void)arController:(id)a3 didChangeTrackingState:(unint64_t)a4 reason:(unint64_t)a5
{
  id *v8;
  char v9;
  id WeakRetained;
  id v11;

  v8 = (id *)((char *)self + 120);
  WeakRetained = objc_loadWeakRetained((id *)self + 15);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v11 = objc_loadWeakRetained(v8);
    objc_msgSend(v11, "mapLayer:arTrackingStateDidChange:reason:", self, a4, a5);

  }
}

- (void)setARInterfaceOrientation:(int64_t)a3
{
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  int8x8_t *v9;
  int8x8_t v10;
  uint8x8_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_30680);
  v5 = (void *)GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 3)
      v6 = CFSTR("Unknown");
    else
      v6 = off_1E42F6DE0[a3 - 1];
    v19 = 138412290;
    v20 = v6;
    v7 = v5;
    _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "Set AR interface orientation %@", (uint8_t *)&v19, 0xCu);

  }
  v8 = *((_QWORD *)self + 48);
  *(_QWORD *)(*(_QWORD *)(v8 + 1056) + 96) = a3;
  v9 = *(int8x8_t **)(v8 + 1120);
  v10 = v9[2];
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8(v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v12 = 0x69AB09C896BF94A7;
      if (*(_QWORD *)&v10 <= 0x69AB09C896BF94A7uLL)
        v12 = 0x69AB09C896BF94A7uLL % *(_QWORD *)&v10;
    }
    else
    {
      v12 = (*(_QWORD *)&v10 - 1) & 0x69AB09C896BF94A7;
    }
    v13 = *(_QWORD **)(*(_QWORD *)&v9[1] + 8 * v12);
    if (v13)
    {
      v14 = (_QWORD *)*v13;
      if (v14)
      {
        if (v11.u32[0] < 2uLL)
        {
          v15 = *(_QWORD *)&v10 - 1;
          while (1)
          {
            v17 = v14[1];
            if (v17 == 0x69AB09C896BF94A7)
            {
              if (v14[2] == 0x69AB09C896BF94A7)
                goto LABEL_29;
            }
            else if ((v17 & v15) != v12)
            {
              return;
            }
            v14 = (_QWORD *)*v14;
            if (!v14)
              return;
          }
        }
        do
        {
          v16 = v14[1];
          if (v16 == 0x69AB09C896BF94A7)
          {
            if (v14[2] == 0x69AB09C896BF94A7)
            {
LABEL_29:
              v18 = v14[5];
              if (v18)
                *(_QWORD *)(v18 + 176) = a3;
              return;
            }
          }
          else
          {
            if (v16 >= *(_QWORD *)&v10)
              v16 %= *(_QWORD *)&v10;
            if (v16 != v12)
              return;
          }
          v14 = (_QWORD *)*v14;
        }
        while (v14);
      }
    }
  }
}

- (int64_t)getCurrentSetARInterfaceOrientation
{
  NSObject *v3;
  uint64_t v4;
  uint8_t v6[16];

  if (GEOGetVectorKitVKMapViewLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewLog(void)::onceToken, &__block_literal_global_30680);
  v3 = GEOGetVectorKitVKMapViewLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "Get AR interface orientation", v6, 2u);
  }
  v4 = *(_QWORD *)(*((_QWORD *)self + 48) + 1056);
  if (v4)
    return *(_QWORD *)(v4 + 96);
  else
    return 0;
}

void __36__VKMapView_AR__map_didEnterARMode___block_invoke(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "mapLayerDidEnterAR:", *(_QWORD *)(a1 + 32));

  }
}

- (void)enterMuninForStorefrontView:(id)a3 secondaryStorefrontView:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  void *v30;
  _OWORD v31[3];
  uint64_t v32;
  _BYTE v33[88];
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _OWORD v37[3];
  uint64_t v38;
  uint8_t buf[88];
  void *v40;
  _QWORD *v41;
  _QWORD *v42;
  _BYTE v43[96];
  void *v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;

  v4 = MEMORY[0x1E0C80A78](self);
  v6 = v5;
  v7 = (id *)v4;
  v47 = *MEMORY[0x1E0C80C00];
  v9 = v8;
  v10 = v6;
  if (v9
    && (objc_msgSend(v9, "imageryInfo"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "dataFormatVersion"),
        v11,
        v12 < 3))
  {
    +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startDecompressionSession");

    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    v15 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v15, OS_LOG_TYPE_INFO, "Enter for storefront view", buf, 2u);
      if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    }
    v16 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F029000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EnterForStorefrontView", (const char *)&unk_1A0189141, buf, 2u);
    }
    objc_msgSend(v9, "imageryInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    md::mun::cameraFrameFromStorefront((uint64_t)v37, v9);
    objc_msgSend(v7, "setMapType:", 11);
    objc_msgSend(v7, "setShouldLoadFallbackTiles:", 0);
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "muninIgnorePlacesMetadata"))
    {
      if (v10)
      {
        objc_msgSend(v10, "imageryInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v7[35];
        geo::optional<md::mun::CollectionPoint>::optional((uint64_t)v43, (uint64_t)v33);
        objc_msgSend(v20, "setCurrentPoint:secondaryPoint:", buf, v43);
        if (v43[0])
        {
          v21 = v44;
          v22 = v45;
          if (v44 != v45)
          {
            do
            {
              v23 = (void *)v21[31];
              if (v23 != (void *)v21[33])
                free(v23);
              v21 += 36;
            }
            while (v21 != v22);
            v21 = v44;
          }
          if (v21 != v46)
            free(v21);
          v43[0] = 0;
        }

        v24 = v34;
        v25 = v35;
        if (v34 != v35)
        {
          do
          {
            v26 = (void *)v24[31];
            if (v26 != (void *)v24[33])
              free(v26);
            v24 += 36;
          }
          while (v24 != v25);
          v24 = v34;
        }
        if (v24 != v36)
          free(v24);
      }
      else
      {
        objc_msgSend(v7[35], "setCurrentPoint:", buf);
      }
    }
    v27 = v7[35];
    v31[0] = v37[0];
    v31[1] = v37[1];
    v31[2] = v37[2];
    v32 = v38;
    objc_msgSend(v27, "setCameraFrame:", v31);

    v28 = v40;
    v29 = v41;
    if (v40 != v41)
    {
      do
      {
        v30 = (void *)v28[31];
        if (v30 != (void *)v28[33])
          free(v30);
        v28 += 36;
      }
      while (v28 != v29);
      v28 = v40;
    }
    if (v28 != v42)
      free(v28);
  }
  else
  {
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    v13 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v13, OS_LOG_TYPE_ERROR, "Missing storefront info. Unable to enter munin.", buf, 2u);
    }
    objc_msgSend(v7, "setMapType:", 0);
  }

}

- (void)enterMuninForMarker:(id)a3 withHeading:(double)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char *v14;
  void *v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  double v19[7];
  uint8_t buf[16];

  v6 = a3;
  if (v6)
  {
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    v7 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "Enter for marker", buf, 2u);
      if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    }
    v8 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F029000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EnterForMarker", (const char *)&unk_1A0189141, buf, 2u);
    }
    +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDecompressionSession");

    -[VKMapView setMapType:](self, "setMapType:", 11);
    -[VKMapView setShouldLoadFallbackTiles:](self, "setShouldLoadFallbackTiles:", 0);
    objc_msgSend(v6, "coordinate");
    v11 = v10;
    objc_msgSend(v6, "coordinate");
    v13 = v12;
    objc_msgSend(v6, "coordinate");
    v14 = (char *)self + 272;
    v15 = (void *)*((_QWORD *)v14 + 1);
    v19[0] = v11 * 0.0174532925;
    v19[1] = v13 * 0.0174532925;
    v19[2] = v16;
    v19[3] = 0.0;
    v19[4] = 0.0;
    v19[5] = a4 * -0.0174532925;
    v19[6] = 0.0;
    objc_msgSend(v15, "setCameraFrame:", v19);
    v17 = objc_msgSend(v6, "collectionPoint");
    if (v17)
      objc_msgSend(*((id *)v14 + 1), "setCurrentPoint:", v17);
  }
  else
  {
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    v18 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v18, OS_LOG_TYPE_ERROR, "Missing storefront info. Unable to enter munin.", buf, 2u);
    }
    -[VKMapView setMapType:](self, "setMapType:", 0);
  }

}

- (double)heading
{
  double result;

  objc_msgSend(*((id *)self + 35), "heading");
  return result;
}

- (id)muninMarkerAtCoordinate:(id)a3 completeMarkerHandler:(id)a4
{
  double var1;
  double var0;
  void (**v7)(id, void *);
  void *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  int8x8_t *v16;
  int8x8_t v17;
  uint8x8_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v28;
  long double v30;
  double v31;
  uint64_t v32;
  unsigned __int8 *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  double *v37;
  double *v38;
  uint64_t v39;
  _BYTE *v40;
  void *v41;
  _QWORD *v42;
  _QWORD *v43;
  void *v44;
  _BYTE *v45;
  void *v46;
  double v47[2];
  void *v48;
  void *v49;
  char v50;
  void *__p[2];
  void *v52[2];
  int v53;
  void *v54;
  void *v55;
  _QWORD v56[3];
  double *v57;
  uint64_t v58;

  var1 = a3.var1;
  var0 = a3.var0;
  v58 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *))a4;
  -[VKMapView muninMarkerAtCoordinate:](self, "muninMarkerAtCoordinate:", var0, var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*((_QWORD *)self + 48) + 1216);
  if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
  v10 = (id)GEOGetVectorKitVKMapViewMuninLog(void)::log;
  v11 = v10;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v47[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MarkerAtPoint", (const char *)&unk_1A0189141, (uint8_t *)v47, 2u);
  }

  if (v8 && objc_msgSend(v8, "canMoveToMarker"))
  {
    v7[2](v7, v8);
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    v13 = (id)GEOGetVectorKitVKMapViewMuninLog(void)::log;
    v14 = v13;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v47[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_19F029000, v14, OS_SIGNPOST_INTERVAL_END, v9, "MarkerAtPoint", (const char *)&unk_1A0189141, (uint8_t *)v47, 2u);
    }
LABEL_45:

    goto LABEL_46;
  }
  v15 = *((_QWORD *)self + 48);
  v16 = *(int8x8_t **)(v15 + 1120);
  v17 = v16[2];
  if (!*(_QWORD *)&v17)
    goto LABEL_40;
  v18 = (uint8x8_t)vcnt_s8(v17);
  v18.i16[0] = vaddlv_u8(v18);
  if (v18.u32[0] > 1uLL)
  {
    v19 = 0x669A8EDAC04FCBF1;
    if (*(_QWORD *)&v17 <= 0x669A8EDAC04FCBF1uLL)
      v19 = 0x669A8EDAC04FCBF1uLL % *(_QWORD *)&v17;
  }
  else
  {
    v19 = (*(_QWORD *)&v17 - 1) & 0x669A8EDAC04FCBF1;
  }
  v20 = *(_QWORD **)(*(_QWORD *)&v16[1] + 8 * v19);
  if (!v20)
    goto LABEL_40;
  v21 = (_QWORD *)*v20;
  if (!v21)
    goto LABEL_40;
  if (v18.u32[0] < 2uLL)
  {
    v22 = *(_QWORD *)&v17 - 1;
    while (1)
    {
      v24 = v21[1];
      if (v24 == 0x669A8EDAC04FCBF1)
      {
        if (v21[2] == 0x669A8EDAC04FCBF1)
          goto LABEL_35;
      }
      else if ((v24 & v22) != v19)
      {
        goto LABEL_40;
      }
      v21 = (_QWORD *)*v21;
      if (!v21)
        goto LABEL_40;
    }
  }
  while (1)
  {
    v23 = v21[1];
    if (v23 == 0x669A8EDAC04FCBF1)
      break;
    if (v23 >= *(_QWORD *)&v17)
      v23 %= *(_QWORD *)&v17;
    if (v23 != v19)
      goto LABEL_40;
LABEL_24:
    v21 = (_QWORD *)*v21;
    if (!v21)
      goto LABEL_40;
  }
  if (v21[2] != 0x669A8EDAC04FCBF1)
    goto LABEL_24;
LABEL_35:
  v25 = v21[5];
  v26 = *(_QWORD *)(v15 + 896);
  if (!v25 || v26 == 0)
  {
LABEL_40:
    v7[2](v7, 0);
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    v28 = (id)GEOGetVectorKitVKMapViewMuninLog(void)::log;
    v14 = v28;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      LOWORD(v47[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_19F029000, v14, OS_SIGNPOST_INTERVAL_END, v9, "MarkerAtPoint", (const char *)&unk_1A0189141, (uint8_t *)v47, 2u);
    }
    goto LABEL_45;
  }
  v30 = tan(var0 * 0.00872664626 + 0.785398163);
  v31 = log(v30);
  v32 = *(_QWORD *)(v25 + 168);
  v47[0] = var0 * 0.0174532925;
  v47[1] = var1 * 0.0174532925;
  v48 = 0;
  md::mun::MuninMetadataContainer::nearestMetadataTiles((uint64_t)&v54, v32, v47, 250.0);
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v52 = 0u;
  v53 = 1065353216;
  v33 = (unsigned __int8 *)v55;
  if (v55)
  {
    do
    {
      gdc::Tiled::mapDataKeyFromTile((unsigned __int8 *)v47, 0, v33 + 16, 35, -4);
      std::__hash_table<gdc::LayerDataRequestKey,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>,std::allocator<gdc::LayerDataRequestKey>>::__emplace_unique_key_args<gdc::LayerDataRequestKey,gdc::LayerDataRequestKey const&>((uint64_t)__p, (unsigned __int8 *)v47, (uint64_t)v47);
      if (v50)
        v50 = 0;
      if (v48 != v49)
        free(v48);
      v33 = *(unsigned __int8 **)v33;
    }
    while (v33);
  }
  v34 = *(_QWORD *)(v26 + 24);
  v35 = (void *)MEMORY[0x1A1AF5730](v7);
  v36 = MEMORY[0x1A1AF5730]();
  v37 = (double *)operator new(0x28uLL);
  *(_QWORD *)v37 = &off_1E42C7E08;
  *((_QWORD *)v37 + 1) = v36;
  v37[2] = var1 * 0.00277777778 + 0.5;
  v37[3] = v31 * 0.159154943 + 0.5;
  *((_QWORD *)v37 + 4) = v9;
  v57 = v37;
  gdc::LayerDataManager::requestLayerDataKeys(v34, (uint64_t)__p, v56);
  v38 = v57;
  if (v57 == (double *)v56)
  {
    v39 = 4;
    v38 = (double *)v56;
LABEL_57:
    (*(void (**)(void))(*(_QWORD *)v38 + 8 * v39))();
  }
  else if (v57)
  {
    v39 = 5;
    goto LABEL_57;
  }

  v40 = v52[0];
  if (v52[0])
  {
    do
    {
      if (v40[112])
        v40[112] = 0;
      v45 = *(_BYTE **)v40;
      v46 = (void *)*((_QWORD *)v40 + 4);
      if (v46 != *((void **)v40 + 6))
        free(v46);
      operator delete(v40);
      v40 = v45;
    }
    while (v45);
  }
  v41 = __p[0];
  __p[0] = 0;
  if (v41)
    operator delete(v41);
  v42 = v55;
  if (v55)
  {
    do
    {
      v43 = (_QWORD *)*v42;
      operator delete(v42);
      v42 = v43;
    }
    while (v43);
  }
  v44 = v54;
  v54 = 0;
  if (v44)
    operator delete(v44);
LABEL_46:

  return v8;
}

- (id)muninMarkerAtCoordinate:(id)a3
{
  double v3;
  double v4;
  double var0;
  NSObject *v7;
  int8x8_t *v8;
  int8x8_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  long double v18;
  long double v19;
  float64x2_t v20;
  uint64_t v26;
  pthread_rwlock_t *v27;
  geo::read_write_lock *v28;
  const char *v29;
  VKMuninMarker *v30;
  VKMuninMarker *v31;
  VKMuninMarker *isa;
  VKMuninMarker *v33;
  geo::read_write_lock *v34;
  const char *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v48;
  uint8x8_t v49;
  unint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t *v58;
  long double v59;
  long double v60;
  char v61;
  int v62;
  float64x2_t v63;
  double v64;
  float64x2_t v66;
  double v67;
  double v68;
  NSObject *v69;
  long double v70;
  double v71;
  long double v72;
  NSObject *v73;
  double var1;
  double v76;
  uint8_t v77[8];
  _BYTE *v78;
  _BYTE *v79;
  uint64_t v80;
  float64x2_t v81;
  uint8_t buf[8];
  double v83;
  double v84;

  var1 = a3.var1;
  var0 = a3.var0;
  if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
  v7 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
  if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MarkerAtPointSync", (const char *)&unk_1A0189141, buf, 2u);
  }
  v8 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v9 = v8[2];
  if (!*(_QWORD *)&v9)
    goto LABEL_111;
  v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    v12 = 0x669A8EDAC04FCBF1;
    if (*(_QWORD *)&v9 <= 0x669A8EDAC04FCBF1uLL)
      v12 = 0x669A8EDAC04FCBF1uLL % *(_QWORD *)&v9;
  }
  else
  {
    v12 = (*(_QWORD *)&v9 - 1) & 0x669A8EDAC04FCBF1;
  }
  v13 = *(_QWORD **)(*(_QWORD *)&v8[1] + 8 * v12);
  if (!v13)
    goto LABEL_71;
  v14 = (_QWORD *)*v13;
  if (!v14)
    goto LABEL_71;
  if (v10.u32[0] < 2uLL)
  {
    while (1)
    {
      v16 = v14[1];
      if (v16 == 0x669A8EDAC04FCBF1)
      {
        if (v14[2] == 0x669A8EDAC04FCBF1)
          goto LABEL_26;
      }
      else if ((v16 & (*(_QWORD *)&v9 - 1)) != v12)
      {
        goto LABEL_69;
      }
      v14 = (_QWORD *)*v14;
      if (!v14)
        goto LABEL_69;
    }
  }
  while (1)
  {
    v15 = v14[1];
    if (v15 == 0x669A8EDAC04FCBF1)
      break;
    if (v15 >= *(_QWORD *)&v9)
      v15 %= *(_QWORD *)&v9;
    if (v15 != v12)
      goto LABEL_69;
LABEL_15:
    v14 = (_QWORD *)*v14;
    if (!v14)
      goto LABEL_69;
  }
  if (v14[2] != 0x669A8EDAC04FCBF1)
    goto LABEL_15;
LABEL_26:
  v17 = v14[5];
  if (!v17)
    goto LABEL_69;
  v18 = tan(var0 * 0.00872664626 + 0.785398163);
  v19 = log(v18);
  v20.f64[0] = var1;
  v20.f64[1] = v19;
  __asm { FMOV            V2.2D, #0.5 }
  v81 = vmlaq_f64(_Q2, (float64x2_t)xmmword_19FFB32D0, v20);
  *(_QWORD *)buf = 0;
  v83 = 0.0;
  v84 = 0.0;
  v78 = 0;
  v79 = 0;
  v80 = 0;
  v26 = *(_QWORD *)(v17 + 168);
  v27 = (pthread_rwlock_t *)(v26 + 96);
  v28 = (geo::read_write_lock *)pthread_rwlock_rdlock((pthread_rwlock_t *)(v26 + 96));
  if ((_DWORD)v28)
    geo::read_write_lock::logFailure(v28, (uint64_t)"read lock", v29);
  v30 = *(VKMuninMarker **)(v26 + 48);
  v31 = (VKMuninMarker *)(v26 + 56);
  if (v30 != v31)
  {
    do
    {
      md::mun::MuninMetadata::neighborsWithinRadius(*(_QWORD *)&v30->_anon_18[8], v81.f64, (uint64_t)&v78, (uint64_t)buf, 250.0);
      isa = *(VKMuninMarker **)&v30->_collectionPoint._hasValue;
      if (isa)
      {
        do
        {
          v33 = isa;
          isa = (VKMuninMarker *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          v33 = *(VKMuninMarker **)&v30->_collectionPoint._value.type;
          _ZF = v33->super.isa == (Class)v30;
          v30 = v33;
        }
        while (!_ZF);
      }
      v30 = v33;
    }
    while (v33 != v31);
  }
  v34 = (geo::read_write_lock *)pthread_rwlock_unlock(v27);
  if ((_DWORD)v34)
    geo::read_write_lock::logFailure(v34, (uint64_t)"unlock", v35);
  v36 = v78;
  v37 = *(void **)buf;
  v38 = v79 == v78;
  if (v79 == v78)
  {
    if (v78)
      goto LABEL_64;
  }
  else
  {
    v39 = 0;
    v40 = 0;
    v41 = (v79 - v78) >> 3;
    if (v41 <= 1)
      v41 = 1;
    do
    {
      if (*(double *)(*(_QWORD *)buf + 8 * v40) < *(double *)(*(_QWORD *)buf + 8 * v39))
        v39 = v40;
      ++v40;
    }
    while (v41 != v40);
    v42 = 0;
    v43 = fmax(sqrt(*(double *)(*(_QWORD *)buf + 8 * v39)) * 1.2, 1.0);
    v44 = v43 * v43;
    v45 = v39;
    do
    {
      if (*(double *)(*(_QWORD *)buf + 8 * v42) <= v44)
      {
        v46 = *(_QWORD *)(*(_QWORD *)&v78[8 * v42] + 80);
        if (v46 > *(_QWORD *)(*(_QWORD *)&v78[8 * v45] + 80)
          && (unint64_t)(v46 - *(_QWORD *)(*(_QWORD *)&v78[8 * v39] + 80)) > 0x240C8400)
        {
          v45 = v42;
        }
      }
      ++v42;
    }
    while (v41 != v42);
    v31 = *(VKMuninMarker **)&v78[8 * v45];
    if (v31)
    {
      if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
      v48 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
      if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v77 = 0;
        _os_log_impl(&dword_19F029000, v48, OS_LOG_TYPE_INFO, "Marker at point, got one from metadata", v77, 2u);
      }
      v31 = -[VKMuninMarker initWithCollectionPoint:]([VKMuninMarker alloc], "initWithCollectionPoint:", v31);
    }
    else
    {
      v38 = 1;
    }
LABEL_64:
    operator delete(v36);
    v37 = *(void **)buf;
  }
  if (*(double *)&v37 != 0.0)
  {
    v83 = *(double *)&v37;
    operator delete(v37);
  }
  if (v38)
  {
    v8 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
    v9 = v8[2];
LABEL_69:
    if (!*(_QWORD *)&v9)
      goto LABEL_111;
    v49 = (uint8x8_t)vcnt_s8(v9);
    v49.i16[0] = vaddlv_u8(v49);
    v11 = v49.u32[0];
LABEL_71:
    if (v11 > 1)
    {
      v50 = 0xEA624BC935BAF297;
      if (*(_QWORD *)&v9 <= 0xEA624BC935BAF297)
        v50 = 0xEA624BC935BAF297 % *(_QWORD *)&v9;
    }
    else
    {
      v50 = (*(_QWORD *)&v9 - 1) & 0xEA624BC935BAF297;
    }
    v51 = *(_QWORD **)(*(_QWORD *)&v8[1] + 8 * v50);
    if (!v51)
      goto LABEL_111;
    v52 = (_QWORD *)*v51;
    if (!v52)
      goto LABEL_111;
    if (v11 < 2)
    {
      v53 = *(_QWORD *)&v9 - 1;
      while (1)
      {
        v55 = v52[1];
        if (v55 == 0xEA624BC935BAF297)
        {
          if (v52[2] == 0xEA624BC935BAF297)
            goto LABEL_91;
        }
        else if ((v55 & v53) != v50)
        {
          goto LABEL_111;
        }
        v52 = (_QWORD *)*v52;
        if (!v52)
          goto LABEL_111;
      }
    }
    while (1)
    {
      v54 = v52[1];
      if (v54 == 0xEA624BC935BAF297)
      {
        if (v52[2] == 0xEA624BC935BAF297)
        {
LABEL_91:
          v56 = v52[5];
          if (v56)
          {
            v57 = *(uint64_t **)(v56 + 160);
            v58 = *(uint64_t **)(v56 + 168);
            if (v57 != v58)
            {
              v59 = tan(var0 * 0.00872664626 + 0.785398163);
              v60 = log(v59);
              v61 = 0;
              v62 = 0;
              v63.f64[0] = var1;
              v63.f64[1] = v60;
              v64 = 1.79769313e308;
              __asm { FMOV            V0.2D, #0.5 }
              v66 = vmlaq_f64(_Q0, (float64x2_t)xmmword_19FFB32D0, v63);
              v67 = v66.f64[1];
              v76 = v66.f64[0];
              do
              {
                md::MuninAvailabilityData::nearestAvailableRoadPoint((uint64_t)buf, *v57, v66.f64[0], v67);
                if (buf[0])
                {
                  if ((v76 - v83) * (v76 - v83) + (v67 - v84) * (v67 - v84) >= v64)
                    v68 = 0.0;
                  else
                    v68 = 1.0;
                  v66.f64[0] = v76;
                  if (v64 <= v68)
                  {
                    v68 = v64;
                  }
                  else
                  {
                    if (!v62)
                      v61 = 1;
                    v62 = 1;
                    v3 = v83;
                    v4 = v84;
                  }
                }
                else
                {
                  v68 = v64;
                  v66.f64[0] = v76;
                }
                v57 += 2;
                v64 = v68;
              }
              while (v57 != v58);
              if (v61)
              {
                if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
                  dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
                v69 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
                if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19F029000, v69, OS_LOG_TYPE_INFO, "Marker at point, got one from the road network", buf, 2u);
                }
                v70 = exp(v4 * 6.28318531 + -3.14159265);
                v71 = atan(v70);
                v72 = fmod(v3 * 6.28318531, 6.28318531);
                v31 = -[VKMuninMarker initWithCoordinate:]([VKMuninMarker alloc], "initWithCoordinate:", v71 * 114.591559 + -90.0, (double)(fmod(v72 + 6.28318531, 6.28318531) * 57.2957795 + -180.0), 0.0);
                return v31;
              }
            }
          }
LABEL_111:
          if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
            dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
          v73 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
          if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F029000, v73, OS_LOG_TYPE_INFO, "Marker at point, failed to find a munin marker", buf, 2u);
          }
          v31 = 0;
          return v31;
        }
      }
      else
      {
        if (v54 >= *(_QWORD *)&v9)
          v54 %= *(_QWORD *)&v9;
        if (v54 != v50)
          goto LABEL_111;
      }
      v52 = (_QWORD *)*v52;
      if (!v52)
        goto LABEL_111;
    }
  }
  return v31;
}

- (BOOL)moveToStorefrontView:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id *v13;
  id v14;
  char v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id buf;
  char v27[32];
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[88];
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v8, "imageryInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    md::mun::cameraFrameFromStorefront((uint64_t)v27, v8);
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    v11 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19F029000, v11, OS_LOG_TYPE_INFO, "Move to storefront view", (uint8_t *)&buf, 2u);
      if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    }
    v12 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_19F029000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MoveToStorefrontView", (const char *)&unk_1A0189141, (uint8_t *)&buf, 2u);
    }
    v13 = (id *)((char *)self + 272);
    objc_initWeak(&buf, v13[1]);
    v14 = v13[1];
    v24 = v28;
    v25 = v29;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68__VKMapView_Munin__moveToStorefrontView_animated_completionHandler___block_invoke;
    v21[3] = &unk_1E42F9D20;
    v22 = v9;
    objc_copyWeak(&v23, &buf);
    v15 = objc_msgSend(v14, "moveToPoint:withHeading:withPitch:animated:completionHandler:", v30, &v25, &v24, v6, v21);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&buf);
    v16 = v31;
    v17 = v32;
    if (v31 != v32)
    {
      do
      {
        v18 = (void *)v16[31];
        if (v18 != (void *)v16[33])
          free(v18);
        v16 += 36;
      }
      while (v16 != v17);
      v16 = v31;
    }
    if (v16 != v33)
      free(v16);
  }
  else
  {
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    v19 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_19F029000, v19, OS_LOG_TYPE_ERROR, "Move to storefront view - missing storefront info", v30, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)moveToMarker:(id)a3 withHeading:(double)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  char v15;
  NSObject *v16;
  uint64_t v18;
  double v19;
  uint8_t buf[16];

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if (objc_msgSend(v10, "collectionPoint"))
  {
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    v12 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v12, OS_LOG_TYPE_INFO, "Move to marker", buf, 2u);
      if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    }
    v13 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_signpost_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F029000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MoveToMarker", (const char *)&unk_1A0189141, buf, 2u);
    }
    v14 = *((id *)self + 35);
    v19 = a4 * -0.0174532925;
    v18 = 0;
    v15 = objc_msgSend(v14, "moveToPoint:withHeading:withPitch:animated:completionHandler:", objc_msgSend(v10, "collectionPoint"), &v19, &v18, v7, v11);

  }
  else
  {
    if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
    v16 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
    if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v16, OS_LOG_TYPE_ERROR, "Move to marker - missing collection point", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)cancelPendingMove
{
  NSObject *v3;
  uint8_t v5[16];

  if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
  v3 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "Cancel pending move", v5, 2u);
  }
  return objc_msgSend(*((id *)self + 35), "cancelPendingMove");
}

- (void)enableViewDataLoading:(BOOL)a3
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
  uint64_t v13;
  char v14;

  v3 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v4 = v3[2];
  if (!*(_QWORD *)&v4)
    goto LABEL_21;
  v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = 0x669A8EDAC04FCBF1;
    if (*(_QWORD *)&v4 <= 0x669A8EDAC04FCBF1uLL)
      v6 = 0x669A8EDAC04FCBF1uLL % *(_QWORD *)&v4;
  }
  else
  {
    v6 = (*(_QWORD *)&v4 - 1) & 0x669A8EDAC04FCBF1;
  }
  v7 = *(_QWORD **)(*(_QWORD *)&v3[1] + 8 * v6);
  if (!v7 || (v8 = (_QWORD *)*v7) == 0)
  {
LABEL_21:
    v12 = 0;
    MEMORY[0x341] = a3;
    if (a3)
      goto LABEL_22;
    return;
  }
  if (v5.u32[0] < 2uLL)
  {
    v9 = *(_QWORD *)&v4 - 1;
    while (1)
    {
      v11 = v8[1];
      if (v11 == 0x669A8EDAC04FCBF1)
      {
        if (v8[2] == 0x669A8EDAC04FCBF1)
          goto LABEL_25;
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
    if (v10 == 0x669A8EDAC04FCBF1)
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
  if (v8[2] != 0x669A8EDAC04FCBF1)
    goto LABEL_11;
LABEL_25:
  v12 = v8[5];
  *(_BYTE *)(v12 + 833) = a3;
  if (!a3)
    return;
LABEL_22:
  v13 = **(_QWORD **)(v12 + 160);
  if (v13)
  {
    v14 = 8;
    md::MapEngine::setNeedsTick(v13, &v14);
  }
}

- (id)currentMarker
{
  VKMuninMarker *v2;

  v2 = (VKMuninMarker *)objc_msgSend(*((id *)self + 35), "currentPoint");
  if (v2)
    v2 = -[VKMuninMarker initWithCollectionPoint:]([VKMuninMarker alloc], "initWithCollectionPoint:", v2);
  return v2;
}

- (id)onscreenImageResources
{
  int8x8_t *v2;
  int8x8_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  geo::read_write_lock *v15;
  const char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  unint64_t v23;
  unsigned __int8 *v24;
  unint64_t v25;
  unint64_t v26;
  unsigned int v27;
  void *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  geo::read_write_lock *v40;
  const char *v41;
  gdc::LayerDataRequestKey *v43;
  id v44;
  uint64_t v45;
  unsigned __int8 v46[16];
  void *v47;
  void *v48;
  char v49;
  pthread_rwlock_t *v50;
  void *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char v55[32];
  unint64_t v56;
  unint64_t v57;
  char v58[96];
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  unsigned int v62;
  unsigned __int16 v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v2 = *(int8x8_t **)(*((_QWORD *)self + 48) + 1120);
  v3 = v2[2];
  if (!*(_QWORD *)&v3)
    goto LABEL_21;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = 0x669A8EDAC04FCBF1;
    if (*(_QWORD *)&v3 <= 0x669A8EDAC04FCBF1uLL)
      v5 = 0x669A8EDAC04FCBF1uLL % *(_QWORD *)&v3;
  }
  else
  {
    v5 = (*(_QWORD *)&v3 - 1) & 0x669A8EDAC04FCBF1;
  }
  v6 = *(_QWORD **)(*(_QWORD *)&v2[1] + 8 * v5);
  if (!v6 || (v7 = (_QWORD *)*v6) == 0)
  {
LABEL_21:
    v11 = 0;
    goto LABEL_22;
  }
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v3 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == 0x669A8EDAC04FCBF1)
      {
        if (v7[2] == 0x669A8EDAC04FCBF1)
          goto LABEL_76;
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_21;
      }
      v7 = (_QWORD *)*v7;
      if (!v7)
        goto LABEL_21;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == 0x669A8EDAC04FCBF1)
      break;
    if (v9 >= *(_QWORD *)&v3)
      v9 %= *(_QWORD *)&v3;
    if (v9 != v5)
      goto LABEL_21;
LABEL_11:
    v7 = (_QWORD *)*v7;
    if (!v7)
      goto LABEL_21;
  }
  if (v7[2] != 0x669A8EDAC04FCBF1)
    goto LABEL_11;
LABEL_76:
  v11 = v7[5];
LABEL_22:
  v12 = *(_QWORD *)(v11 + 144);
  v13 = *(_QWORD *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 88);
  if (v13 != v14)
  {
    while (*(_WORD *)v13 != 36)
    {
      v13 += 16;
      if (v13 == v14)
        goto LABEL_28;
    }
  }
  if (v13 == v14)
LABEL_28:
    v43 = 0;
  else
    v43 = *(gdc::LayerDataRequestKey **)(v13 + 8);
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = (pthread_rwlock_t *)(v11 + 208);
  v15 = (geo::read_write_lock *)pthread_rwlock_rdlock((pthread_rwlock_t *)(v11 + 208));
  if ((_DWORD)v15)
    geo::read_write_lock::logFailure(v15, (uint64_t)"read lock", v16);
  v17 = *(_QWORD *)(v11 + 184);
  v45 = *(_QWORD *)(v11 + 192);
  if (v17 != v45)
  {
    while (2)
    {
      v18 = *(_QWORD *)v17;
      v19 = *(unsigned __int8 *)(v17 + 8);
      v20 = *(unsigned __int8 *)(v17 + 9);
      v21 = *(unsigned __int8 *)(v17 + 10);
      md::mun::MuninMetadataContainer::activePoint((md::mun::MuninMetadataContainer *)v58, *(_QWORD *)(v11 + 168), *(_QWORD *)v17);
      if (v58[0])
      {
        v22 = objc_alloc_init(MEMORY[0x1E0D273C0]);
        objc_msgSend(v22, "setLoadStatus:", 0);
        objc_msgSend(v22, "setCameraNumber:", v19);
        objc_msgSend(v22, "setLod:", v20);
        v51 = v55;
        v52 = v55;
        v53 = v55;
        v54 = 32;
        v56 = 0;
        v57 = v63;
        v23 = v20 | (v19 << 16) | ((unint64_t)v62 << 32);
        geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v51, v55, (char *)&v57, v58);
        v57 = v18;
        geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v51, v52, (char *)&v57, v58);
        v57 = v23;
        geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v51, v52, (char *)&v57, v58);
        v57 = v21;
        geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v51, v52, (char *)&v57, v58);
        v24 = (unsigned __int8 *)v51;
        v25 = v52 - (_BYTE *)v51;
        if (v52 == v51)
        {
          v26 = 0;
        }
        else
        {
          v26 = 0;
          if (v25 <= 1)
            v25 = 1;
          do
          {
            v27 = *v24++;
            v26 ^= (v26 << 6) + (v26 >> 2) - 0x61C8864680B583EBLL + v27;
            --v25;
          }
          while (v25);
        }
        v56 = v26;
        gdc::LayerDataRequestKey::LayerDataRequestKey(v46, 0, 0x24u, (uint64_t)&v51, 2147483646);
        if (v51 != v53)
          free(v51);
        gdc::LayerDataStore::get((gdc::LayerDataStore *)&v51, v43, v46);
        v28 = v51;
        v29 = (std::__shared_weak_count *)v52;
        if (!v52)
          goto LABEL_47;
        v30 = (unint64_t *)(v52 + 8);
        do
          v31 = __ldaxr(v30);
        while (__stlxr(v31 - 1, v30));
        if (!v31)
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
          if (!v28)
            goto LABEL_50;
LABEL_48:
          objc_msgSend(v22, "setLoadStatus:", 1, v43);
        }
        else
        {
LABEL_47:
          if (v28)
            goto LABEL_48;
LABEL_50:
          v32 = *(_QWORD *)(v11 + 144);
          v33 = *(_QWORD *)(v32 + 32);
          v34 = *(_QWORD *)(v32 + 40);
          if (v33 != v34)
          {
            while (*(_WORD *)v33 != 36)
            {
              v33 += 16;
              if (v33 == v34)
                goto LABEL_56;
            }
          }
          if (v33 == v34)
LABEL_56:
            v35 = 0;
          else
            v35 = *(_QWORD *)(v33 + 8);
          if (std::__hash_table<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::__unordered_map_hasher<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>,true>,std::__unordered_map_equal<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::equal_to<gdc::LayerDataRequestKey>,gdc::LayerDataRequestKeyHash,true>,std::allocator<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>>>::find<gdc::LayerDataRequestKey>((_QWORD *)(v35 + 80), v46)|| std::__hash_table<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::__unordered_map_hasher<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>,true>,std::__unordered_map_equal<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::equal_to<gdc::LayerDataRequestKey>,gdc::LayerDataRequestKeyHash,true>,std::allocator<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>>>::find<gdc::LayerDataRequestKey>((_QWORD *)(v35 + 120), v46))
          {
            objc_msgSend(v22, "setLoadStatus:", 2, v43);
          }
        }
        objc_msgSend(v44, "addObject:", v22, v43);
        if (v49)
          v49 = 0;
        if (v47 != v48)
          free(v47);

        if (v58[0])
        {
          v37 = v59;
          v36 = v60;
          if (v59 != v60)
          {
            do
            {
              v38 = (void *)v37[31];
              if (v38 != (void *)v37[33])
                free(v38);
              v37 += 36;
            }
            while (v37 != v36);
            v37 = v59;
          }
          if (v37 != v61)
            free(v37);
        }
      }
      v17 += 16;
      if (v17 == v45)
        break;
      continue;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v44, v43);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (geo::read_write_lock *)pthread_rwlock_unlock(v50);
  if ((_DWORD)v40)
    geo::read_write_lock::logFailure(v40, (uint64_t)"unlock", v41);

  return v39;
}

- (BOOL)virtualParallaxEnabled
{
  return objc_msgSend(*((id *)self + 35), "virtualParallaxEnabled");
}

- (void)setVirtualParallaxEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKMapViewMuninLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMapViewMuninLog(void)::onceToken, &__block_literal_global_37931);
  v5 = GEOGetVectorKitVKMapViewMuninLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKMapViewMuninLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v6 = "false";
    if (v3)
      v6 = "true";
    v7 = 136315138;
    v8 = v6;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "Set virtual parallax enabled: %s", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(*((id *)self + 35), "setVirtualParallaxEnabled:", v3);
}

void __68__VKMapView_Munin__moveToStorefrontView_animated_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "resetPathAnimation");

}

@end
