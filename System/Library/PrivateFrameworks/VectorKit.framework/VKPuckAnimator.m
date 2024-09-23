@implementation VKPuckAnimator

- (void)processLocationUpdates
{
  if (self->_lastLocationUpdate.__engaged_)
  {
    -[VKPuckAnimator _updateLocation:routeMatch:locationUpdateUUID:](self, "_updateLocation:routeMatch:locationUpdateUUID:", self->_lastLocationUpdate.var0.__val_.location, self->_lastLocationUpdate.var0.__val_.routeMatch, self->_lastLocationUpdate.var0.__val_.locationUpdateUUID);
    if (self->_lastLocationUpdate.__engaged_)
    {

      self->_lastLocationUpdate.__engaged_ = 0;
    }
  }
}

- (void)setRouteOverlayCache:(const RouteOverlayCache *)a3
{
  self->_routeOverlayCache = a3;
}

- (optional<std::pair<geo::Mercator3<double>,)currentSnappedSegment
{
  optional<std::pair<geo::Mercator3<double>, geo::Mercator3<double>>> *result;

  result = (optional<std::pair<geo::Mercator3<double>, geo::Mercator3<double>>> *)self->_locationProjector;
  if (result)
    return (optional<std::pair<geo::Mercator3<double>, geo::Mercator3<double>>> *)unk_1EE5BF400(result, "currentSnappedSegment");
  *(_QWORD *)&retstr->__engaged_ = 0;
  *(_OWORD *)&retstr->var0.__val_.first._e[2] = 0u;
  *(_OWORD *)&retstr->var0.__val_.second._e[1] = 0u;
  *(_OWORD *)&retstr->var0.__null_state_ = 0u;
  return result;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_queueLocationUpdate:(id)a3 routeMatch:(id)a4 locationUpdateUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CLLocation *v15;
  GEORouteMatch *v16;
  NSUUID *v17;
  NSUUID *v18;
  CLLocation *location;
  GEORouteMatch *routeMatch;
  NSUUID *locationUpdateUUID;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v11 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "coordinate");
    v13 = v12;
    objc_msgSend(v8, "coordinate");
    v22 = 134283777;
    v23 = v13;
    v24 = 2049;
    v25 = v14;
    _os_log_impl(&dword_19F029000, v11, OS_LOG_TYPE_INFO, "VKPuckAnimator queued location %{private}f, %{private}f", (uint8_t *)&v22, 0x16u);
  }

  v15 = (CLLocation *)v8;
  v16 = (GEORouteMatch *)v9;
  v17 = (NSUUID *)v10;
  v18 = v17;
  if (self->_lastLocationUpdate.__engaged_)
  {
    location = self->_lastLocationUpdate.var0.__val_.location;
    self->_lastLocationUpdate.var0.__val_.location = v15;

    routeMatch = self->_lastLocationUpdate.var0.__val_.routeMatch;
    self->_lastLocationUpdate.var0.__val_.routeMatch = v16;

    locationUpdateUUID = self->_lastLocationUpdate.var0.__val_.locationUpdateUUID;
    self->_lastLocationUpdate.var0.__val_.locationUpdateUUID = v18;

    if (!v16)
      goto LABEL_10;
  }
  else
  {
    self->_lastLocationUpdate.var0.__val_.location = v15;
    self->_lastLocationUpdate.var0.__val_.routeMatch = v16;
    self->_lastLocationUpdate.var0.__val_.locationUpdateUUID = v17;
    self->_lastLocationUpdate.__engaged_ = 1;
    if (!v16)
    {
LABEL_10:
      -[VKPuckAnimator processLocationUpdates](self, "processLocationUpdates");
      goto LABEL_11;
    }
  }
  if ((-[GEORouteMatch shouldProjectLocationAlongRoute](v16, "shouldProjectLocationAlongRoute") & 1) == 0)
    goto LABEL_10;
LABEL_11:

}

- (void)_updateLocation:(id)a3 routeMatch:(id)a4 locationUpdateUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const RouteOverlayCache *routeOverlayCache;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  long double v22;
  double v23;
  long double v24;
  double v25;
  long double v26;
  double v27;
  id WeakRetained;
  id v29;
  float64x2_t v30;
  double v31;
  double v32;
  double value;
  double v34;
  double v35;
  double v36;
  char v37;
  id v38;
  double v39;
  char v40;
  char v41;
  BOOL v42;
  VKRunningCurve *curve;
  _BOOL8 v44;
  NSObject *v45;
  CFTimeInterval v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint8_t v51[8];
  _QWORD v52[2];
  double v53;
  float64x2_t v54;
  float64x2_t v55;
  _BYTE buf[24];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v11 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "coordinate");
    v13 = v12;
    objc_msgSend(v8, "coordinate");
    *(_DWORD *)buf = 134283777;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2049;
    *(_QWORD *)&buf[14] = v14;
    _os_log_impl(&dword_19F029000, v11, OS_LOG_TYPE_INFO, "VKPuckAnimator processing location %{private}f, %{private}f", buf, 0x16u);
  }

  v46 = CACurrentMediaTime();
  routeOverlayCache = self->_routeOverlayCache;
  if (routeOverlayCache)
  {
    objc_msgSend(v9, "route");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(const RouteOverlayCache *, void *))routeOverlayCache->var0 + 7))(routeOverlayCache, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "routeRibbon");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  -[VKPuckAnimatorLocationProjector projectFromLocation:routeMatch:speedMultiplier:routeLine:](self->_locationProjector, "projectFromLocation:routeMatch:speedMultiplier:routeLine:", v8, v9, v18, self->_tracePlaybackSpeedMultiplier, *(_QWORD *)&v46);
  -[VKPuckAnimatorLocationProjector projectedPosition](self->_locationProjector, "projectedPosition");
  v20 = v19;
  v50 = v21;
  v22 = v21 * 6.28318531;
  v49 = v23;
  v24 = exp(v23 * 6.28318531 + -3.14159265);
  v25 = atan(v24);
  v26 = fmod(v22, 6.28318531);
  v27 = fmod(v26 + 6.28318531, 6.28318531);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "projectCoordinate:toPoint:", &v55, v25 * 114.591559 + -90.0, v27 * 57.2957795 + -180.0);

  v29 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v29, "projectCoordinate:toPoint:", &v54, self->_lastProjectedCoordinate.latitude, self->_lastProjectedCoordinate.longitude);

  if (fabs(self->_lastProjectedCoordinate.longitude + 180.0) >= 0.00000001
    || fabs(self->_lastProjectedCoordinate.latitude + 180.0) >= 0.00000001)
  {
    v30 = vsubq_f64(v54, v55);
    v48 = sqrt(vaddvq_f64(vmulq_f64(v30, v30)));
  }
  else
  {
    v48 = 1.79769313e308;
  }
  GEOCalculateDistance();
  v32 = v31;
  value = self->_puckUpdateDistanceDeltaThreshold._value;
  if (v31 <= value && self->_hasElevation)
    goto LABEL_38;
  self->_lastProjectedPosition._e[0] = v50;
  self->_lastProjectedPosition._e[1] = v49;
  self->_lastProjectedPosition._e[2] = v20;
  self->_lastProjectedCoordinate.latitude = v25 * 114.591559 + -90.0;
  self->_lastProjectedCoordinate.longitude = v27 * 57.2957795 + -180.0;
  v34 = v25 * 2.0 + -1.57079633;
  v35 = v49;
  v36 = v50;
  *(double *)buf = v34;
  *(double *)&buf[8] = v27 + -3.14159265;
  *(double *)&buf[16] = v20;
  *(double *)v52 = v50;
  *(double *)&v52[1] = v49;
  v53 = v20;
  self->_hasElevation = 0;
  -[VKPuckAnimatorLocationProjector elevationInProjectedPostion](self->_locationProjector, "elevationInProjectedPostion");
  if (v37)
  {
    self->_hasElevation = 1;
    goto LABEL_26;
  }
  v38 = objc_loadWeakRetained((id *)&self->_delegate);
  v39 = COERCE_DOUBLE(objc_msgSend(v38, "puckAnimator:getElevationWithCoordinate:", self, buf));
  v41 = v40;

  v20 = v41 ? v39 : 0.0;
  v53 = v20;
  self->_hasElevation = v41 != 0;
  v42 = v41 || v32 > value;
  v35 = v49;
  v36 = v50;
  if (!v42)
  {
LABEL_38:
    -[VKPuckAnimator _publishLocationUpdate:routeMatch:uuid:](self, "_publishLocationUpdate:routeMatch:uuid:", v8, v9, v10);
    goto LABEL_39;
  }
LABEL_26:
  if (v48 <= self->_puckUpdatePointDeltaForAnimation._value)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v45 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_19F029000, v45, OS_LOG_TYPE_INFO, "Move puck without animation", v51, 2u);
    }

    -[VKPuckAnimator updatedPosition:](self, "updatedPosition:", v52);
    -[VKPuckAnimator _publishLocationUpdate:routeMatch:uuid:](self, "_publishLocationUpdate:routeMatch:uuid:", v8, v9, v10);
  }
  else
  {
    curve = self->_curve;
    v44 = !-[VKPuckAnimatorLocationProjector isProjectedPositionBehind](self->_locationProjector, "isProjectedPositionBehind")&& !self->_resetCourse&& !self->_suspended;
    -[VKRunningCurve setCourseValid:](curve, "setCourseValid:", v44);
    -[VKRunningCurve appendPosition:coordinate:atTime:](self->_curve, "appendPosition:coordinate:atTime:", -[VKPuckAnimatorLocationProjector projectedCoordinate](self->_locationProjector, "projectedCoordinate"), v36, v35, v20, v47);
    -[VKPuckAnimator _publishLocationUpdate:routeMatch:uuid:](self, "_publishLocationUpdate:routeMatch:uuid:", v8, v9, v10);
    if (self->_suspended)
    {
      self->_suspended = 0;
      -[VKPuckAnimator resume](self, "resume");
    }
    self->_resetCourse = 0;
  }
LABEL_39:

}

- (void)_publishLocationUpdate:(id)a3 routeMatch:(id)a4 uuid:(id)a5
{
  id v8;
  id v9;
  _QWORD *begin;
  _QWORD *end;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  VKPuckAnimator *v17;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  begin = self->_locationUpdateSubscriptions._backing.__begin_;
  end = self->_locationUpdateSubscriptions._backing.__end_;
  while (1)
  {
    if (begin == end)
    {

      return;
    }
    if (begin[4])
      break;
LABEL_2:
    begin += 5;
  }
  v17 = self;
  v16 = v13;
  v15 = v8;
  v14 = v9;
  v12 = begin[4];
  if (v12)
  {
    (*(void (**)(uint64_t, VKPuckAnimator **, id *, id *, id *))(*(_QWORD *)v12 + 48))(v12, &v17, &v16, &v15, &v14);

    goto LABEL_2;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (VKPuckAnimator)initWithCallbackQueue:(id)a3
{
  id v4;
  VKPuckAnimator *v5;
  uint64_t v6;
  VKPuckAnimatorLocationProjector *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t (***v11)();
  uint64_t v12;
  uint64_t v13;
  uint64_t (***v14)();
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id from;
  id to;
  id location;
  objc_super v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t (**v36)();
  id v37;
  uint64_t (***v38)();
  uint64_t (**v39)();
  id v40;
  uint64_t (***v41)();
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)VKPuckAnimator;
  v5 = -[VKPuckAnimator init](&v31, sel_init);
  v6 = (uint64_t)v5;
  if (!v5)
    goto LABEL_25;
  v5->_lastProjectedPosition._e[0] = 0.0;
  v5->_lastProjectedPosition._e[1] = 0.0;
  v5->_lastProjectedPosition._e[2] = 0.0;
  v7 = objc_alloc_init(VKPuckAnimatorLocationProjector);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  *(_QWORD *)(v6 + 72) = 0x3FF0000000000000;
  *(_QWORD *)(v6 + 80) = 3;
  objc_initWeak(&location, (id)v6);
  *(_OWORD *)(v6 + 240) = VectorKitConfig_PuckUpdateDistanceDeltaThreshold;
  if (*(_QWORD *)(v6 + 240))
    v9 = *(_QWORD *)(v6 + 248) == 0;
  else
    v9 = 1;
  if (!v9)
  {
    GEOConfigGetDouble();
    *(_QWORD *)(v6 + 256) = v10;
  }
  objc_copyWeak(&to, &location);
  v41 = 0;
  v39 = &off_1E42C7988;
  objc_moveWeak(&v40, &to);
  v41 = &v39;
  objc_destroyWeak(&to);
  md::Monitorable<md::ConfigValue<GEOConfigKeyDouble,double>>::setCallbackQueue((_QWORD *)(v6 + 240), v4, &v39);
  v11 = v41;
  if (v41 == &v39)
  {
    v12 = 4;
    v11 = &v39;
    goto LABEL_11;
  }
  if (v41)
  {
    v12 = 5;
LABEL_11:
    (*v11)[v12]();
  }
  *(_OWORD *)(v6 + 160) = VectorKitConfig_PuckUpdatePointDeltaForAnimation;
  if (*(_QWORD *)(v6 + 160) && *(_QWORD *)(v6 + 168))
  {
    GEOConfigGetDouble();
    *(_QWORD *)(v6 + 176) = v13;
  }
  objc_copyWeak(&from, &location);
  v38 = 0;
  v36 = &off_1E42C79D0;
  objc_moveWeak(&v37, &from);
  v38 = &v36;
  objc_destroyWeak(&from);
  md::Monitorable<md::ConfigValue<GEOConfigKeyDouble,double>>::setCallbackQueue((_QWORD *)(v6 + 160), v4, &v36);
  v14 = v38;
  if (v38 == &v36)
  {
    v15 = 4;
    v14 = &v36;
    goto LABEL_19;
  }
  if (v38)
  {
    v15 = 5;
LABEL_19:
    (*v14)[v15]();
  }
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v16 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = *(_QWORD *)(v6 + 256);
    v18 = *(_QWORD *)(v6 + 176);
    *(_DWORD *)buf = 134218240;
    v33 = v17;
    v34 = 2048;
    v35 = v18;
    _os_log_impl(&dword_19F029000, v16, OS_LOG_TYPE_INFO, "PuckUpdateDistanceDeltaThreshold:%f PuckUpdatePointDeltaForAnimation:%f", buf, 0x16u);
  }

  VKLockScreenLog(CFSTR("Creating VKPuckAnimator %p"), v19, v20, v21, v22, v23, v24, v25, v6);
  v26 = (id)v6;
  objc_destroyWeak(&location);
LABEL_25:

  return (VKPuckAnimator *)v6;
}

- (void)initWithCallbackQueue:
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v2 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = WeakRetained[32];
      v4 = 134217984;
      v5 = v3;
      _os_log_impl(&dword_19F029000, v2, OS_LOG_TYPE_INFO, "PuckUpdateDistanceDeltaThreshold updated to %f", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (id).cxx_construct
{
  $BCDCA1B5D5EA5D1B5DA28C57EC36D08E *v3;
  _QWORD *v4;
  _QWORD *v5;

  self->_locationUpdateSubscriptions._backing.__begin_ = 0;
  self->_locationUpdateSubscriptions._backing.__end_ = 0;
  self->_locationUpdateSubscriptions._backing.__end_cap_.__value_ = 0;
  v3 = ($BCDCA1B5D5EA5D1B5DA28C57EC36D08E *)MEMORY[0x1E0D264E0];
  self->_puckUpdatePointDeltaForAnimation._key = ($BCDCA1B5D5EA5D1B5DA28C57EC36D08E)*MEMORY[0x1E0D264E0];
  self->_puckUpdatePointDeltaForAnimation._listener = 0;
  v4 = operator new(0x20uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_1E428A338;
  *((_BYTE *)v4 + 24) = 1;
  self->_puckUpdatePointDeltaForAnimation.var0.__ptr_ = v4 + 3;
  self->_puckUpdatePointDeltaForAnimation.var0.__cntrl_ = (__shared_weak_count *)v4;
  self->_puckUpdatePointDeltaForAnimation._delegate.__f_.__f_ = 0;
  self->_puckUpdateDistanceDeltaThreshold._key = *v3;
  self->_puckUpdateDistanceDeltaThreshold._listener = 0;
  v5 = operator new(0x20uLL);
  v5[1] = 0;
  v5[2] = 0;
  *v5 = &off_1E428A338;
  *((_BYTE *)v5 + 24) = 1;
  self->_puckUpdateDistanceDeltaThreshold.var0.__ptr_ = v5 + 3;
  self->_puckUpdateDistanceDeltaThreshold.var0.__cntrl_ = (__shared_weak_count *)v5;
  self->_puckUpdateDistanceDeltaThreshold._delegate.__f_.__f_ = 0;
  self->_lastLocationUpdate.var0.__null_state_ = 0;
  self->_lastLocationUpdate.__engaged_ = 0;
  return self;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  VKLockScreenLog(CFSTR("Destroying VKPuckAnimator %p"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self);
  -[VKPuckAnimator stop](self, "stop");
  v9.receiver = self;
  v9.super_class = (Class)VKPuckAnimator;
  -[VKPuckAnimator dealloc](&v9, sel_dealloc);
}

- (void)setAlwaysUseGoodRouteMatch:(BOOL)a3
{
  -[VKPuckAnimatorLocationProjector setAlwaysUseGoodRouteMatch:](self->_locationProjector, "setAlwaysUseGoodRouteMatch:", a3);
}

- (BOOL)alwaysUseGoodRouteMatch
{
  return -[VKPuckAnimatorLocationProjector alwaysUseGoodRouteMatch](self->_locationProjector, "alwaysUseGoodRouteMatch");
}

- (unint64_t)subscribeToLocationUpdates:(function<void (VKPuckAnimator *)
{
  unint64_t v5;
  char *begin;
  char *end;
  char *v8;
  char *value;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  function<void (VKPuckAnimator *, CLLocation *, GEORouteMatch *, NSUUID *)> *var1;
  _QWORD *v29;
  unint64_t *v30;
  _QWORD *v31;
  unint64_t *v32;
  uint64_t v33;
  _QWORD v35[3];
  _QWORD *v36;
  unint64_t v37;
  _BYTE v38[16];
  unint64_t *v39;
  _BYTE *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = -[VKPuckAnimator subscribeToLocationUpdates:]::subscriptionKey++;
  begin = (char *)self->_locationUpdateSubscriptions._backing.__begin_;
  end = (char *)self->_locationUpdateSubscriptions._backing.__end_;
  v8 = begin;
  if (begin != end)
  {
    v8 = (char *)self->_locationUpdateSubscriptions._backing.__begin_;
    while (v5 != *(_QWORD *)v8)
    {
      v8 += 40;
      if (v8 == end)
        goto LABEL_7;
    }
  }
  if (v8 != end)
    goto LABEL_51;
LABEL_7:
  v36 = 0;
  v37 = v5;
  v8 = begin;
  v40 = 0;
  if (begin != end)
  {
    v8 = begin;
    while (v5 != *(_QWORD *)v8)
    {
      v8 += 40;
      if (v8 == end)
        goto LABEL_13;
    }
  }
  if (v8 == end)
  {
LABEL_13:
    value = (char *)self->_locationUpdateSubscriptions._backing.__end_cap_.__value_;
    if (end < value)
    {
      *(_QWORD *)end = v5;
      *((_QWORD *)end + 4) = 0;
      self->_locationUpdateSubscriptions._backing.__end_ = end + 40;
      v8 = end;
      goto LABEL_46;
    }
    v10 = v38;
    v11 = 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 3) + 1;
    if (v11 > 0x666666666666666)
      abort();
    v12 = 0xCCCCCCCCCCCCCCCDLL * ((value - begin) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x333333333333333)
      v13 = 0x666666666666666;
    else
      v13 = v11;
    if (v13 > 0x666666666666666)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v14 = (char *)operator new(40 * v13);
    v8 = &v14[8 * ((end - begin) >> 3)];
    v15 = &v14[40 * v13];
    *(_QWORD *)v8 = v5;
    *((_QWORD *)v8 + 4) = 0;
    v16 = v8 + 40;
    if (begin == end)
    {
      self->_locationUpdateSubscriptions._backing.__begin_ = v8;
      self->_locationUpdateSubscriptions._backing.__end_ = v16;
      self->_locationUpdateSubscriptions._backing.__end_cap_.__value_ = v15;
LABEL_39:
      if (begin)
        operator delete(begin);
      v24 = v40;
      self->_locationUpdateSubscriptions._backing.__end_ = v16;
      if (v24 == v38)
      {
        v25 = 4;
      }
      else
      {
        if (!v24)
          goto LABEL_46;
        v25 = 5;
        v10 = v24;
      }
      (*(void (**)(_QWORD *))(*v10 + 8 * v25))(v10);
      goto LABEL_46;
    }
    v17 = 0;
    do
    {
      v18 = &v8[v17];
      v19 = &end[v17];
      *(_QWORD *)&v8[v17 - 40] = *(_QWORD *)&end[v17 - 40];
      v20 = *(char **)&end[v17 - 8];
      if (v20)
      {
        if (v19 - 32 == v20)
        {
          *((_QWORD *)v18 - 1) = v18 - 32;
          (*(void (**)(char *))(*(_QWORD *)v20 + 24))(v20);
        }
        else
        {
          *((_QWORD *)v18 - 1) = v20;
          *((_QWORD *)v19 - 1) = 0;
        }
      }
      else
      {
        *((_QWORD *)v18 - 1) = 0;
      }
      v17 -= 40;
    }
    while (&end[v17] != begin);
    begin = (char *)self->_locationUpdateSubscriptions._backing.__begin_;
    v21 = (char *)self->_locationUpdateSubscriptions._backing.__end_;
    self->_locationUpdateSubscriptions._backing.__begin_ = &v8[v17];
    self->_locationUpdateSubscriptions._backing.__end_ = v16;
    self->_locationUpdateSubscriptions._backing.__end_cap_.__value_ = v15;
    while (1)
    {
      if (v21 == begin)
        goto LABEL_39;
      v22 = (char *)*((_QWORD *)v21 - 1);
      if (v21 - 32 == v22)
        break;
      if (v22)
      {
        v23 = 5;
        goto LABEL_32;
      }
LABEL_33:
      v21 -= 40;
    }
    v22 = v21 - 32;
    v23 = 4;
LABEL_32:
    (*(void (**)(void))(*(_QWORD *)v22 + 8 * v23))();
    goto LABEL_33;
  }
LABEL_46:
  v26 = v36;
  if (v36 == v35)
  {
    v27 = 4;
    v26 = v35;
  }
  else
  {
    if (!v36)
      goto LABEL_51;
    v27 = 5;
  }
  (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_51:
  var1 = (function<void (VKPuckAnimator *, CLLocation *, GEORouteMatch *, NSUUID *)> *)a3->var0.var1;
  if (var1)
  {
    if (var1 == a3)
    {
      v39 = &v37;
      (*(void (**)(function<void (VKPuckAnimator *, CLLocation *, GEORouteMatch *, NSUUID *)> *, unint64_t *))(*(_QWORD *)a3->var0.var0.__lx + 24))(a3, &v37);
    }
    else
    {
      v39 = (unint64_t *)(*(uint64_t (**)(function<void (VKPuckAnimator *, CLLocation *, GEORouteMatch *, NSUUID *)> *, SEL))(*(_QWORD *)var1->var0.var0.__lx + 16))(var1, a2);
    }
  }
  else
  {
    v39 = 0;
  }
  v29 = v8 + 8;
  if (v8 + 8 != (char *)&v37)
  {
    v30 = v39;
    v31 = (_QWORD *)*((_QWORD *)v8 + 4);
    if (v39 == &v37)
    {
      if (v31 == v29)
      {
        (*(void (**)(unint64_t *, _QWORD *))(v37 + 24))(&v37, v35);
        (*(void (**)(unint64_t *))(*v39 + 32))(v39);
        v39 = 0;
        (*(void (**)(_QWORD, unint64_t *))(**((_QWORD **)v8 + 4) + 24))(*((_QWORD *)v8 + 4), &v37);
        (*(void (**)(_QWORD))(**((_QWORD **)v8 + 4) + 32))(*((_QWORD *)v8 + 4));
        *((_QWORD *)v8 + 4) = 0;
        v39 = &v37;
        (*(void (**)(_QWORD *, _QWORD *))(v35[0] + 24))(v35, (_QWORD *)v8 + 1);
        (*(void (**)(_QWORD *))(v35[0] + 32))(v35);
      }
      else
      {
        (*(void (**)(unint64_t *, _QWORD *))(v37 + 24))(&v37, (_QWORD *)v8 + 1);
        (*(void (**)(unint64_t *))(*v39 + 32))(v39);
        v39 = (unint64_t *)*((_QWORD *)v8 + 4);
      }
      *((_QWORD *)v8 + 4) = v29;
    }
    else if (v31 == v29)
    {
      (*(void (**)(_QWORD *, unint64_t *))(*((_QWORD *)v8 + 1) + 24))((_QWORD *)v8 + 1, &v37);
      (*(void (**)(_QWORD))(**((_QWORD **)v8 + 4) + 32))(*((_QWORD *)v8 + 4));
      *((_QWORD *)v8 + 4) = v39;
      v39 = &v37;
    }
    else
    {
      v39 = (unint64_t *)*((_QWORD *)v8 + 4);
      *((_QWORD *)v8 + 4) = v30;
    }
  }
  v32 = v39;
  if (v39 == &v37)
  {
    v33 = 4;
    v32 = &v37;
    goto LABEL_69;
  }
  if (v39)
  {
    v33 = 5;
LABEL_69:
    (*(void (**)(void))(*v32 + 8 * v33))();
  }
  return v5;
}

- (void)unsubscribeFromLocationUpdates:(unint64_t)a3
{
  _QWORD *begin;
  _QWORD *end;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  begin = self->_locationUpdateSubscriptions._backing.__begin_;
  end = self->_locationUpdateSubscriptions._backing.__end_;
  if (begin == end)
  {
LABEL_5:
    if (begin == end)
      return;
    if (begin + 5 == end)
    {
      while (1)
      {
LABEL_23:
        if (end == begin)
        {
          self->_locationUpdateSubscriptions._backing.__end_ = begin;
          return;
        }
        v11 = (_QWORD *)*(end - 1);
        if (end - 4 == v11)
          break;
        if (v11)
        {
          v12 = 5;
          goto LABEL_21;
        }
LABEL_22:
        end -= 5;
      }
      v11 = end - 4;
      v12 = 4;
LABEL_21:
      (*(void (**)(void))(*v11 + 8 * v12))();
      goto LABEL_22;
    }
    while (1)
    {
      v6 = begin;
      v7 = (_QWORD *)begin[4];
      *begin = begin[5];
      v8 = begin + 1;
      v6[4] = 0;
      if (v8 == v7)
        break;
      if (v7)
      {
        v9 = 5;
LABEL_14:
        (*(void (**)(void))(*v7 + 8 * v9))();
      }
      v10 = (_QWORD *)v6[9];
      if (v10)
      {
        if (v6 + 6 == v10)
        {
          v6[4] = v8;
          (*(void (**)(_QWORD *, _QWORD *, unint64_t))(v6[6] + 24))(v6 + 6, v8, a3);
        }
        else
        {
          v6[4] = v10;
          v6[9] = 0;
        }
      }
      else
      {
        v6[4] = 0;
      }
      begin = v6 + 5;
      if (v6 + 10 == end)
      {
        end = self->_locationUpdateSubscriptions._backing.__end_;
        goto LABEL_23;
      }
    }
    v7 = v8;
    v9 = 4;
    goto LABEL_14;
  }
  do
  {
    if (*begin == a3)
      goto LABEL_5;
    begin += 5;
  }
  while (begin != end);
}

- (void)updatedPosition:(const void *)a3
{
  long double v5;
  long double v6;
  double v7;
  long double v8;
  double v9;
  double v10;
  uint64_t v11;
  long double v12;
  long double v13;
  long double v14;
  long double v15;
  id WeakRetained;
  double v17;
  uint64_t v18;
  long double v19;
  double v20;
  uint64_t v21;

  if ((self->_behavior & 1) != 0)
  {
    v5 = *(double *)a3 * 6.28318531;
    v6 = exp(*((double *)a3 + 1) * 6.28318531 + -3.14159265);
    v7 = atan(v6);
    v8 = fmod(v5, 6.28318531);
    -[VKPuckAnimatorTarget setPresentationCoordinate:](self->_target, "setPresentationCoordinate:", v7 * 114.591559 + -90.0, (double)(fmod(v8 + 6.28318531, 6.28318531) * 57.2957795 + -180.0));
  }
  -[VKPuckAnimatorLocationProjector projectedCourse](self->_locationProjector, "projectedCourse");
  -[VKPuckAnimatorTarget setPresentationCourse:](self->_target, "setPresentationCourse:");
  v9 = *(double *)a3;
  v10 = *((double *)a3 + 1);
  v11 = *((_QWORD *)a3 + 2);
  v12 = v9 * 6.28318531;
  v13 = exp(v10 * 6.28318531 + -3.14159265);
  v14 = atan(v13) * 2.0 + -1.57079633;
  v15 = fmod(v12, 6.28318531);
  v19 = v14;
  v20 = fmod(v15 + 6.28318531, 6.28318531) + -3.14159265;
  v21 = v11;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[VKPuckAnimatorLocationProjector projectedCourse](self->_locationProjector, "projectedCourse");
  objc_msgSend(WeakRetained, "puckAnimator:updatedPosition:course:polylineCoordinate:", self, &v19, &v18, -[VKPuckAnimatorLocationProjector projectedCoordinate](self->_locationProjector, "projectedCoordinate", v17 * 0.0174532925, *(_QWORD *)&v14, *(_QWORD *)&v20, v21));

}

- (void)setTarget:(id)a3
{
  VKPuckAnimatorTarget *v5;
  VKPuckAnimatorTarget *target;
  VKPuckAnimatorTarget *v7;

  v5 = (VKPuckAnimatorTarget *)a3;
  target = self->_target;
  v7 = v5;
  if (target != v5)
  {
    -[VKPuckAnimatorTarget setAnimatingToCoordinate:](target, "setAnimatingToCoordinate:", 0);
    objc_storeStrong((id *)&self->_target, a3);
    -[VKPuckAnimatorTarget setAnimatingToCoordinate:](self->_target, "setAnimatingToCoordinate:", self->_animation != 0);
  }

}

- (void)start
{
  NSObject *v3;
  VKTimedAnimation *v4;
  VKTimedAnimation *animation;
  VKRunningCurve *v6;
  VKRunningCurve *curve;
  VKPuckAnimator *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  VKPuckAnimator *v18;

  if (!self->_animation)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v3 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "Starting VKPuckAnimator", buf, 2u);
    }

    v4 = -[VKAnimation initWithPriority:]([VKTimedAnimation alloc], "initWithPriority:", 1);
    animation = self->_animation;
    self->_animation = v4;

    -[VKAnimation setRunsForever:](self->_animation, "setRunsForever:", 1);
    -[VKPuckAnimatorTarget setAnimatingToCoordinate:](self->_target, "setAnimatingToCoordinate:", 1);
    v6 = objc_alloc_init(VKRunningCurve);
    curve = self->_curve;
    self->_curve = v6;

    if (self->_lastLocationUpdate.__engaged_)
    {

      self->_lastLocationUpdate.__engaged_ = 0;
    }
    self->_lastProjectedPosition._e[0] = 0.0;
    self->_lastProjectedPosition._e[1] = 0.0;
    self->_lastProjectedPosition._e[2] = 0.0;
    self->_lastProjectedCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid;
    -[VKPuckAnimatorLocationProjector reset](self->_locationProjector, "reset");
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__9547;
    v17 = __Block_byref_object_dispose__9548;
    v8 = self;
    v18 = v8;
    v9 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __23__VKPuckAnimator_start__block_invoke;
    v12[3] = &unk_1E42EF878;
    v12[4] = buf;
    -[VKTimedAnimation setStepHandler:](self->_animation, "setStepHandler:", v12);
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __23__VKPuckAnimator_start__block_invoke_2;
    v11[3] = &unk_1E42EF8A0;
    v11[4] = buf;
    -[VKAnimation setCompletionHandler:](self->_animation, "setCompletionHandler:", v11);
    -[VKPuckAnimator delegate](v8, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "puckAnimator:runAnimation:", v8, self->_animation);

    _Block_object_dispose(buf, 8);
  }
}

- (void)stop
{
  NSObject *v3;
  VKTimedAnimation *animation;
  VKRunningCurve *curve;
  id WeakRetained;
  uint8_t v7[16];

  if (self->_animation)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v3 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "Stopping VKPuckAnimator", v7, 2u);
    }

    -[VKPuckAnimatorTarget setAnimatingToCoordinate:](self->_target, "setAnimatingToCoordinate:", 0);
    -[VKAnimation stop](self->_animation, "stop");
    animation = self->_animation;
    self->_animation = 0;

    curve = self->_curve;
    self->_curve = 0;

    if (self->_lastLocationUpdate.__engaged_)
    {

      self->_lastLocationUpdate.__engaged_ = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "puckAnimatorDidStop:", self);

  }
}

- (void)pause
{
  int64_t pausedCount;
  NSObject *v4;
  uint8_t v5[16];

  pausedCount = self->_pausedCount;
  if (!pausedCount)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v4 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19F029000, v4, OS_LOG_TYPE_INFO, "Pausing VKPuckAnimator", v5, 2u);
    }

    -[VKTimedAnimation pause](self->_animation, "pause");
    pausedCount = self->_pausedCount;
  }
  self->_pausedCount = pausedCount + 1;
}

- (void)resume
{
  int64_t pausedCount;
  int64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  pausedCount = self->_pausedCount;
  if (pausedCount)
  {
    v4 = pausedCount - 1;
    self->_pausedCount = v4;
    if (!v4)
    {
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
      v5 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "Resuming VKPuckAnimator", v6, 2u);
      }

      -[VKTimedAnimation resume](self->_animation, "resume");
    }
  }
}

- (void)_step
{
  double v3;
  VKRunningCurve *curve;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  long double v9;
  long double v10;
  double v11;
  double vehicleHeading;
  long double v13;
  double v14;
  long double v15;
  long double v16;
  long double v17;
  long double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id WeakRetained;
  double v23;
  double v24;
  _QWORD v25[3];
  char v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  long double v32;
  long double v33;
  char v34;

  v3 = CACurrentMediaTime();
  curve = self->_curve;
  if (!curve)
    return;
  v5 = v3 + -2.0 / self->_tracePlaybackSpeedMultiplier;
  -[VKRunningCurve stateAtTime:](curve, "stateAtTime:", v5);
  if (!v26)
    return;
  if ((self->_behavior & 2) != 0)
  {
    -[VKPuckAnimatorLocationProjector projectedCourse](self->_locationProjector, "projectedCourse");
    v7 = v6;
    if (v34
      && -[VKPuckAnimatorLocationProjector projectedLocationOnRoute](self->_locationProjector, "projectedLocationOnRoute"))
    {
      v8 = -[VKRunningCurve courseValid](self->_curve, "courseValid");
      v9 = atan2(v33, v32);
      v10 = fmod(1.57079633 - v9, 6.28318531);
      v11 = fmod(v10 + 6.28318531, 6.28318531);
      if (v8)
        vehicleHeading = v11 * 57.2957795;
      else
        -[VKPuckAnimatorLocationProjector projectedCourse](self->_locationProjector, "projectedCourse", v11);
    }
    else
    {
      vehicleHeading = self->_vehicleHeading;
      if (vehicleHeading == -1.0)
      {
        vehicleHeading = v7;
        if (v7 < 0.0)
          goto LABEL_13;
      }
    }
    -[VKPuckAnimatorTarget setPresentationCourse:](self->_target, "setPresentationCourse:", vehicleHeading);
  }
LABEL_13:
  if ((self->_behavior & 1) != 0)
  {
    v13 = exp(v28 * 6.28318531 + -3.14159265);
    v14 = atan(v13);
    v15 = fmod(v27 * 6.28318531, 6.28318531);
    -[VKPuckAnimatorTarget setPresentationCoordinate:](self->_target, "setPresentationCoordinate:", v14 * 114.591559 + -90.0, (double)(fmod(v15 + 6.28318531, 6.28318531) * 57.2957795 + -180.0));
  }
  v16 = exp(v28 * 6.28318531 + -3.14159265);
  v17 = atan(v16) * 2.0 + -1.57079633;
  v18 = fmod(v27 * 6.28318531, 6.28318531);
  *(long double *)v25 = v17;
  *(double *)&v25[1] = fmod(v18 + 6.28318531, 6.28318531) + -3.14159265;
  v25[2] = v29;
  if ((_DWORD)v30 != *MEMORY[0x1E0D26A38]
    || (v19 = *MEMORY[0x1E0D26A38],
        vabds_f32(*((float *)&v30 + 1), COERCE_FLOAT(HIDWORD(*MEMORY[0x1E0D26A38]))) >= 0.00000011921))
  {
    -[VKPuckAnimatorLocationProjector projectedRouteMatch](self->_locationProjector, "projectedRouteMatch");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "route");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v21, "routeCoordinateForDistance:beforeRouteCoordinate:", v30, v31 * 40075017.0);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[VKPuckAnimatorTarget presentationCourse](self->_target, "presentationCourse");
  v24 = v23 * 0.0174532925;
  objc_msgSend(WeakRetained, "puckAnimator:updatedPosition:course:polylineCoordinate:", self, v25, &v24, v19);

  if (!-[VKRunningCurve hasStateAtTime:](self->_curve, "hasStateAtTime:", v5))
  {
    -[VKPuckAnimator pause](self, "pause");
    self->_suspended = 1;
  }
}

- (void)resetCourse
{
  self->_resetCourse = 1;
}

- (void)updateLocation:(id)a3 routeMatch:(id)a4
{
  -[VKPuckAnimator updateLocation:routeMatch:locationUpdateUUID:](self, "updateLocation:routeMatch:locationUpdateUUID:", a3, a4, 0);
}

- (void)updateVehicleHeading:(double)a3
{
  if (vabdd_f64(a3, self->_vehicleHeading) >= 0.000001)
  {
    self->_vehicleHeading = a3;
    if (self->_suspended)
    {
      self->_suspended = 0;
      -[VKPuckAnimator resume](self, "resume");
    }
  }
}

- (id)detailedDescription
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id WeakRetained;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[VKPuckAnimator description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n"), v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("_vehicleHeading: %f\n"), *(_QWORD *)&self->_vehicleHeading);
  objc_msgSend(v5, "appendFormat:", CFSTR("_pausedCount: %ld\n"), self->_pausedCount);
  if (self->_suspended)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("_suspended: %@\n"), v6);
  objc_msgSend(v5, "appendFormat:", CFSTR("_lastProjectedPosition: %f, %f, %f\n"), *(_QWORD *)&self->_lastProjectedPosition._e[0], *(_QWORD *)&self->_lastProjectedPosition._e[1], *(_QWORD *)&self->_lastProjectedPosition._e[2]);
  objc_msgSend(v5, "appendFormat:", CFSTR("_behavior: %lu\n"), self->_behavior);
  -[VKPuckAnimatorLocationProjector detailedDescription](self->_locationProjector, "detailedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("_locationProjector:\n%@\n"), v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v5, "appendFormat:", CFSTR("_delegate: %@\n"), WeakRetained);

  objc_msgSend(v5, "appendFormat:", CFSTR("_target: %@\n"), self->_target);
  return v5;
}

- (BOOL)hasElevation
{
  return self->_hasElevation;
}

- (VKPuckAnimatorTarget)target
{
  return self->_target;
}

- (VKPuckAnimatorDelegate)delegate
{
  return (VKPuckAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (Matrix<double,)lastProjectedPosition
{
  double v2;
  double v3;
  double v4;
  Matrix<double, 3, 1> result;

  v2 = self->_lastProjectedPosition._e[0];
  v3 = self->_lastProjectedPosition._e[1];
  v4 = self->_lastProjectedPosition._e[2];
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (void)setLastProjectedPosition:()Matrix<double
{
  self->_lastProjectedPosition = a3;
}

- (double)tracePlaybackSpeedMultiplier
{
  return self->_tracePlaybackSpeedMultiplier;
}

- (void)setTracePlaybackSpeedMultiplier:(double)a3
{
  self->_tracePlaybackSpeedMultiplier = a3;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(unint64_t)a3
{
  self->_behavior = a3;
}

- (void).cxx_destruct
{
  char *begin;
  char *end;
  void *v5;
  char *v6;
  uint64_t v7;

  if (self->_lastLocationUpdate.__engaged_)
  {

  }
  md::Monitorable<md::ConfigValue<GEOConfigKeyDouble,double>>::~Monitorable((uint64_t)&self->_puckUpdateDistanceDeltaThreshold);
  md::Monitorable<md::ConfigValue<GEOConfigKeyDouble,double>>::~Monitorable((uint64_t)&self->_puckUpdatePointDeltaForAnimation);
  begin = (char *)self->_locationUpdateSubscriptions._backing.__begin_;
  if (begin)
  {
    end = (char *)self->_locationUpdateSubscriptions._backing.__end_;
    v5 = self->_locationUpdateSubscriptions._backing.__begin_;
    if (end == begin)
    {
LABEL_13:
      self->_locationUpdateSubscriptions._backing.__end_ = begin;
      operator delete(v5);
      goto LABEL_14;
    }
    while (1)
    {
      v6 = (char *)*((_QWORD *)end - 1);
      if (end - 32 == v6)
      {
        v6 = end - 32;
        v7 = 4;
      }
      else
      {
        if (!v6)
          goto LABEL_8;
        v7 = 5;
      }
      (*(void (**)(void))(*(_QWORD *)v6 + 8 * v7))();
LABEL_8:
      end -= 40;
      if (end == begin)
      {
        v5 = self->_locationUpdateSubscriptions._backing.__begin_;
        goto LABEL_13;
      }
    }
  }
LABEL_14:
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locationProjector, 0);
  objc_storeStrong((id *)&self->_curve, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

uint64_t __23__VKPuckAnimator_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_step");
}

uint64_t __23__VKPuckAnimator_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stop");
}

- (uint64_t)initWithCallbackQueue:
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (id)initWithCallbackQueue:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E42C7988;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end
