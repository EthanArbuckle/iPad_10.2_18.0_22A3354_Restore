@implementation VKARWalkingCameraController

- (VKARWalkingCameraController)initWithTaskContext:(shared_ptr<md:(void *)a4 :(AnimationRunner *)a5 TaskContext>)a3 mapDataAccess:(RunLoopController *)a6 animationRunner:(id)a7 runLoopController:(void *)a8 cameraDelegate:(void *)a9 arLogic:elevationLogic:
{
  __shared_weak_count *cntrl;
  id **ptr;
  RunLoopController *v15;
  VKARWalkingCameraController *v16;
  VKARWalkingCameraController *v17;
  VKARWalkingDebugGestureCameraBehavior *v18;
  VKGestureCameraBehavior *gestureCameraControllerBehavior;
  double v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  VKARWalkingCameraController *v24;
  objc_super v26;
  _QWORD v27[3];
  _QWORD *v28;
  uint64_t v29;

  cntrl = a3.__cntrl_;
  ptr = (id **)a3.__ptr_;
  v29 = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)VKARWalkingCameraController;
  v16 = -[VKScreenCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](&v26, sel_initWithMapDataAccess_animationRunner_runLoopController_cameraDelegate_, cntrl, a4, a5, v15);
  v17 = v16;
  if (v16)
  {
    v16->_arLogic = a7;
    v16->_elevationLogic = a8;
    v16->_rotationCorrectionQuaternion._imaginary._e[0] = 0.707106781;
    v16->_rotationCorrectionQuaternion._imaginary._e[1] = 0.0;
    v16->_rotationCorrectionQuaternion._imaginary._e[2] = 0.0;
    v16->_rotationCorrectionQuaternion._scalar = 0.707106781;
    v16->_heading._value = 0.0;
    v18 = -[VKARWalkingDebugGestureCameraBehavior initWithCameraController:]([VKARWalkingDebugGestureCameraBehavior alloc], "initWithCameraController:", v16);
    gestureCameraControllerBehavior = v17->super._gestureCameraControllerBehavior;
    v17->super._gestureCameraControllerBehavior = &v18->super;

    v17->_maxClipDistance._key = ($BCDCA1B5D5EA5D1B5DA28C57EC36D08E)VectorKitConfig_ARLabelMaxClipDistance;
    if (*(_QWORD *)&v17->_maxClipDistance._key.key.identifier && v17->_maxClipDistance._key.key.metadata)
    {
      GEOConfigGetDouble();
      v17->_maxClipDistance._value = v20;
    }
    v21 = **ptr;
    v28 = 0;
    md::Monitorable<md::ConfigValue<GEOConfigKeyDouble,double>>::setCallbackQueue(&v17->_maxClipDistance._key.key.identifier, v21, v27);
    v22 = v28;
    if (v28 == v27)
    {
      v23 = 4;
      v22 = v27;
    }
    else
    {
      if (!v28)
      {
LABEL_10:

        v24 = v17;
        goto LABEL_11;
      }
      v23 = 5;
    }
    (*(void (**)(void))(*v22 + 8 * v23))();
    goto LABEL_10;
  }
LABEL_11:

  return v17;
}

- (id).cxx_construct
{
  Monitorable<md::ConfigValue<GEOConfigKeyDouble, double>> *p_maxClipDistance;
  _QWORD *v4;

  self->_rotationCorrectionQuaternion._imaginary._e[0] = 0.0;
  self->_rotationCorrectionQuaternion._imaginary._e[1] = 0.0;
  self->_rotationCorrectionQuaternion._imaginary._e[2] = 0.0;
  self->_rotationCorrectionQuaternion._scalar = 1.0;
  self->_coordinate.longitude._value = 0.0;
  self->_coordinate.altitude._value = 0.0;
  self->_coordinate.latitude._value = 0.0;
  self->_eulerAngles.yaw._value = 0.0;
  self->_eulerAngles.roll._value = 0.0;
  self->_eulerAngles.pitch._value = 0.0;
  self->_gestures.__end_ = 0;
  self->_gestures.__end_cap_.__value_ = 0;
  self->_gestures.__begin_ = 0;
  p_maxClipDistance = &self->_maxClipDistance;
  self->_maxClipDistance._key = ($BCDCA1B5D5EA5D1B5DA28C57EC36D08E)*MEMORY[0x1E0D264E0];
  self->_maxClipDistance._listener = 0;
  v4 = operator new(0x20uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_1E428A338;
  p_maxClipDistance->var0.__cntrl_ = (__shared_weak_count *)v4;
  *((_BYTE *)v4 + 24) = 1;
  p_maxClipDistance->var0.__ptr_ = v4 + 3;
  p_maxClipDistance->_delegate.__f_.__f_ = 0;
  return self;
}

- (void)pushGesture:(void *)a3
{
  vector<std::variant<md::ARCameraPanEvent, md::ARCameraRotateEvent>, std::allocator<std::variant<md::ARCameraPanEvent, md::ARCameraRotateEvent>>> *p_gestures;
  char *value;
  char *end;
  uint64_t v7;
  char *v8;
  char *begin;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char v20;
  char v21;
  char v22;

  p_gestures = &self->_gestures;
  end = (char *)self->_gestures.__end_;
  value = (char *)self->_gestures.__end_cap_.__value_;
  if (end >= value)
  {
    begin = (char *)p_gestures->__begin_;
    v10 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)p_gestures->__begin_) >> 3);
    v11 = v10 + 1;
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v12 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x555555555555555)
      v13 = 0xAAAAAAAAAAAAAAALL;
    else
      v13 = v11;
    if (v13)
    {
      if (v13 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v14 = (char *)operator new(24 * v13);
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[24 * v10];
    *v15 = 0;
    *((_DWORD *)v15 + 4) = -1;
    v16 = *((unsigned int *)a3 + 4);
    if ((_DWORD)v16 != -1)
    {
      ((void (*)(char *, char *, void *))off_1E42F9298[v16])(&v21, v15, a3);
      *((_DWORD *)v15 + 4) = v16;
      begin = (char *)p_gestures->__begin_;
      end = (char *)p_gestures->__end_;
    }
    if (end == begin)
    {
      v19 = v15;
    }
    else
    {
      v17 = 0;
      do
      {
        v15[v17 - 24] = 0;
        *(_DWORD *)&v15[v17 - 8] = -1;
        v18 = *(unsigned int *)&end[v17 - 8];
        if ((_DWORD)v18 != -1)
        {
          ((void (*)(char *, char *, char *))off_1E42F9298[v18])(&v22, &v15[v17 - 24], &end[v17 - 24]);
          *(_DWORD *)&v15[v17 - 8] = v18;
        }
        v17 -= 24;
      }
      while (&end[v17] != begin);
      v19 = &v15[v17];
      begin = (char *)p_gestures->__begin_;
    }
    v8 = v15 + 24;
    p_gestures->__begin_ = v19;
    p_gestures->__end_ = v15 + 24;
    p_gestures->__end_cap_.__value_ = &v14[24 * v13];
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = 0;
    *((_DWORD *)end + 4) = -1;
    v7 = *((unsigned int *)a3 + 4);
    if ((_DWORD)v7 != -1)
    {
      ((void (*)(char *, char *, void *))off_1E42F9298[v7])(&v20, end, a3);
      *((_DWORD *)end + 4) = v7;
    }
    v8 = end + 24;
    p_gestures->__end_ = v8;
  }
  p_gestures->__end_ = v8;
}

- (void)_locationProvider
{
  return (void *)*((_QWORD *)self->_arLogic + 33);
}

- (void)_updateClipPlanes
{
  double v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[VKCameraController camera](self, "camera");
  v3 = self->_maxClipDistance._value + 10.0;
  *(_QWORD *)(v6 + 464) = 0x3FB999999999999ALL;
  *(double *)(v6 + 472) = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  _DWORD *elevationLogic;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t v19;
  double v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  double v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  uint64_t v29;
  double v30;
  double value;
  double v32;
  void *v33;
  void *v34;
  float v35;
  float v36;
  double v37;
  double v38;
  __double2 v39;
  double v40;
  double v41;
  __double2 v42;
  long double v43;
  long double v44;
  double v45;
  long double v46;
  double v47;
  __double2 v48;
  double v49;
  __double2 v50;
  long double v51;
  uint64_t (**v52)();
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  double v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  __int128 v61;
  double v62[2];
  std::__shared_weak_count *v63;
  uint64_t (**v64)();
  std::__shared_weak_count *v65;

  elevationLogic = self->_elevationLogic;
  if (elevationLogic)
    elevationLogic[72] = 0;
  v7 = *((id *)self->_arLogic + 20);
  v8 = v7;
  if (v7)
    v9 = 0;
  else
    v9 = *((_BYTE *)self->_arLogic + 257) == 0;
  if (v9)
    goto LABEL_32;
  if (v7)
  {
    objc_msgSend(v7, "currentFrame");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "camera");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  v13 = -[VKARWalkingCameraController _locationProvider](self, "_locationProvider");
  v14 = v13;
  if (v13)
  {
    (*(void (**)(void *, void *, void *, Quaternion<double> *, vector<std::variant<md::ARCameraPanEvent, md::ARCameraRotateEvent>, std::allocator<std::variant<md::ARCameraPanEvent, md::ARCameraRotateEvent>>> *))(*(_QWORD *)v13 + 16))(v13, a4, v11, &self->_rotationCorrectionQuaternion, &self->_gestures);
    v15 = (*(uint64_t (**)(void *))(*(_QWORD *)v14 + 24))(v14);
    v16 = *(double *)(v15 + 16);
    *(_OWORD *)&self->_coordinate.latitude._value = *(_OWORD *)v15;
    self->_coordinate.altitude._value = v16;
    if (v12)
    {
LABEL_14:
      v17 = v11;
      objc_msgSend(v11, "camera");
      v18 = (std::__shared_weak_count *)(id)objc_claimAutoreleasedReturnValue();
      v64 = &off_1E42B5450;
      v65 = v18;

      v19 = *((_QWORD *)self->_arLogic + 22) - 1;
      v20 = 0.0;
      if (v19 <= 2)
        v20 = dbl_1A007ECA0[v19];
      v21 = v12;
      -[std::__shared_weak_count eulerAngles](v18, "eulerAngles");
      self->_eulerAngles.roll._value = v20 + v22;
      -[std::__shared_weak_count eulerAngles](v18, "eulerAngles");
      self->_eulerAngles.pitch._value = v23 + 1.57079633;
      -[std::__shared_weak_count eulerAngles](v18, "eulerAngles");
      self->_eulerAngles.yaw._value = v24;
      -[VKCameraController camera](self, "camera");
      v25 = v62[1];
      md::MDARCamera::widestFieldOfView((md::MDARCamera *)v62, (uint64_t)&v64);
      *(double *)(*(_QWORD *)&v25 + 456) = v62[0] * 0.0174532925;
      v26 = v63;
      v12 = v21;
      if (v63)
      {
        p_shared_owners = (unint64_t *)&v63->__shared_owners_;
        do
          v28 = __ldaxr(p_shared_owners);
        while (__stlxr(v28 - 1, p_shared_owners));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      v64 = &off_1E42B5450;

      v11 = v17;
      goto LABEL_22;
    }
  }
  else
  {
    md::LayoutContext::frameState((md::LayoutContext *)a4);
    v57 = *(double *)(v56 + 72);
    *(float64x2_t *)&self->_coordinate.latitude._value = vmulq_f64(*(float64x2_t *)(v56 + 56), (float64x2_t)vdupq_n_s64(0x404CA5DC1A63C1F8uLL));
    self->_coordinate.altitude._value = v57;
    if (v12)
      goto LABEL_14;
  }
  self->_eulerAngles.yaw._value = 0.0;
  self->_eulerAngles.roll._value = 0.0;
  self->_eulerAngles.pitch._value = 0.0;
  -[VKCameraController camera](self, "camera");
  v58 = v65;
  v64[57] = (uint64_t (*)())0x3FF0C152382D7365;
  if (v58)
  {
    v59 = (unint64_t *)&v58->__shared_owners_;
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }
LABEL_22:
  if (!v14 || !*(_BYTE *)((*(uint64_t (**)(void *))(*(_QWORD *)v14 + 32))(v14) + 8))
    goto LABEL_26;
  v29 = (*(uint64_t (**)(void *))(*(_QWORD *)v14 + 32))(v14);
  if (*(_BYTE *)(v29 + 8))
  {
    self->_eulerAngles.yaw._value = *(double *)v29 * 0.0174532925;
LABEL_26:
    value = self->_coordinate.latitude._value;
    v30 = self->_coordinate.longitude._value;
    v32 = self->_coordinate.altitude._value;
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = a4;
    objc_msgSend(v33, "arCameraElevationOffset");
    v36 = v35;

    v37 = self->_eulerAngles.roll._value;
    v61 = *(_OWORD *)&self->_eulerAngles.pitch._value;
    -[VKCameraController camera](self, "camera");
    v38 = v32 + v36;
    v39 = __sincos_stret(value * 0.0174532925);
    v40 = 6378137.0 / sqrt(1.0 - v39.__sinval * v39.__sinval * 0.00669437999);
    v41 = (v38 + v40) * v39.__cosval;
    v42 = __sincos_stret(v30 * 0.0174532925);
    v43 = v41 * v42.__sinval;
    v44 = v41 * v42.__cosval;
    v45 = sqrt(v44 * v44 + v43 * v43);
    v46 = (v38 + v40 * 0.99330562) * v39.__sinval;
    v47 = atan2(v46, v45 * 0.996647189);
    v48 = __sincos_stret(v47);
    v49 = atan2(v46 + v48.__sinval * v48.__sinval * 42841.3115 * v48.__sinval, v45 + v48.__cosval * v48.__cosval * -42697.6727 * v48.__cosval);
    v50 = __sincos_stret(v49);
    v51 = atan2(v43, v44);
    v52 = v64;
    *((double *)v64 + 1) = v49;
    *((long double *)v52 + 2) = v51;
    *((double *)v52 + 3) = v45 / v50.__cosval - 6378137.0 / sqrt(1.0 - v50.__sinval * v50.__sinval * 0.00669437999);
    v52[4] = 0;
    *(_OWORD *)(v52 + 5) = v61;
    *((double *)v52 + 7) = v37;
    v53 = v65;
    if (v65)
    {
      v54 = (unint64_t *)&v65->__shared_owners_;
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }
    -[VKARWalkingCameraController _updateClipPlanes](self, "_updateClipPlanes");
    -[VKARWalkingCameraController _updateDebugOverlay:](self, "_updateDebugOverlay:", v34);
    self->_gestures.__end_ = self->_gestures.__begin_;

LABEL_32:
    return;
  }
  std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
}

- (id)_buildDebugString:(void *)a3
{
  id v4;
  id v5;
  void *v6;
  char *__ptr32 *v7;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  float v32;
  float v33;
  float v34;
  void *v35;
  float v36;
  float v38;
  VKARWalkingCameraController *v39;
  void *v40;
  float v41;
  id v42;
  uint64_t v43;
  uint64_t (**v44)();
  id v45;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = *((id *)self->_arLogic + 20);
  v6 = v5;
  v7 = &off_19FFB1000;
  if (v5)
  {
    objc_msgSend(v5, "currentFrame");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = self;
    objc_msgSend(v8, "camera");
    v44 = &off_1E42B5450;
    v45 = (id)objc_claimAutoreleasedReturnValue();
    v42 = v45;

    objc_msgSend(v6, "currentFrame");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "camera");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MDARSession stringWithARTrackingState:](MDARSession, "stringWithARTrackingState:", objc_msgSend(v10, "trackingState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentFrame");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "camera");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MDARSession stringWithARTrackingStateReason:](MDARSession, "stringWithARTrackingStateReason:", objc_msgSend(v13, "trackingStateReason"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("tracking_state:\n\tstate:%@\n\treason:%@\n"), v11, v14);

    objc_msgSend(v6, "currentFrame");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "geoTrackingStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MDARSession stringWithARGeoTrackingState:](MDARSession, "stringWithARGeoTrackingState:", objc_msgSend(v15, "state"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentFrame");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "geoTrackingStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MDARSession stringWithARGeoTrackingStateReason:](MDARSession, "stringWithARGeoTrackingStateReason:", objc_msgSend(v18, "stateReason"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentFrame");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "geoTrackingStatus");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MDARSession stringWithARGeoTrackingAccuracy:](MDARSession, "stringWithARGeoTrackingAccuracy:", objc_msgSend(v21, "accuracy"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("geo_tracking_status:\n\tstate:%@\n\treason:%@\n\taccuracy:%@\n"), v16, v19, v22);

    objc_msgSend(v6, "currentFrame");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "heading");
    objc_msgSend(v4, "appendFormat:", CFSTR("heading: %.2f\n"), v24);

    objc_msgSend(v6, "currentFrame");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "rawHeading");
    objc_msgSend(v4, "appendFormat:", CFSTR("raw_heading: %.2f\n"), v26);

    objc_msgSend(v6, "currentFrame");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "location");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentFrame");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_msgSend(v29, "location");
    else
      objc_msgSend(v29, "rawLocation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "altitude");
    objc_msgSend(v4, "appendFormat:", CFSTR("cl_altitude: %.2f\n"), v31);
    objc_msgSend(v45, "eulerAngles");
    v41 = v32;
    objc_msgSend(v45, "eulerAngles");
    v38 = v33;
    objc_msgSend(v45, "eulerAngles");
    objc_msgSend(v4, "appendFormat:", CFSTR("arCamera:\n\tpitch(x):%.2f\n\troll(y):%.f\n\tyaw(z):%.2f\n"), v41 * 57.2957795, v38 * 57.2957795, v34 * 57.2957795);
    md::MDARCamera::widestFieldOfView((md::MDARCamera *)&v43, (uint64_t)&v44);
    objc_msgSend(v4, "appendFormat:", CFSTR("widestFieldOfView:%f\n"), v43);

    self = v39;
    v7 = &off_19FFB1000;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("ar_coordinate: %.8f,%.8f,%.8f\n"), *(_QWORD *)&self->_coordinate.latitude._value, *(_QWORD *)&self->_coordinate.longitude._value, *(_QWORD *)&self->_coordinate.altitude._value);
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "arCameraElevationOffset");
  objc_msgSend(v4, "appendFormat:", CFSTR("debug_altitude_offset: %.8f\n"), v36);

  objc_msgSend(v4, "appendFormat:", CFSTR("pitch:%.2f\nroll:%.f\nyaw:%.2f\n"), self->_eulerAngles.pitch._value * *((double *)v7 + 374), self->_eulerAngles.roll._value * *((double *)v7 + 374), self->_eulerAngles.yaw._value * *((double *)v7 + 374));
  return v4;
}

- (void)_updateDebugOverlay:(void *)a3
{
  ggl::DebugConsole *v5;
  float32x2_t *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  float v13;
  double v14;
  float v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  double v22;
  unint64_t *v23;
  unint64_t v24;
  char v25;
  float v26;
  int v27;
  float v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  float32_t v44;
  unsigned int v45;
  double v46;
  void *v47;
  double v48;
  float32_t v49;
  int8x16_t *v50;
  size_t v51;
  double v52;
  int32x2_t v53;
  uint64_t v54;
  unint64_t v55;
  float v56;
  uint64_t v57;
  uint64_t v58;
  float v59;
  uint64_t v60;
  uint64_t v61;
  float v62;
  int v63;
  float v64;
  int v65;
  float v66;
  int v67;

  if (*(_QWORD *)a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = (ggl::DebugConsole *)objc_msgSend(*(id *)a3, "debugConsoleForId:", 7);
      if (v5)
      {
        v6 = (float32x2_t *)v5;
        ggl::DebugConsole::begin(v5);
        v6[10] = 0;
        +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "enableARCameraDebugOverlay");

        if (v8)
        {
          -[VKCameraController canvas](self, "canvas");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "size");
          v11 = v10;
          -[VKCameraController canvas](self, "canvas");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "size");
          v13 = v11;
          v15 = v14;
          v16 = *((_QWORD *)a3 + 4);
          v17 = (std::__shared_weak_count *)*((_QWORD *)a3 + 5);
          if (v17)
          {
            p_shared_owners = (unint64_t *)&v17->__shared_owners_;
            do
              v19 = __ldxr(p_shared_owners);
            while (__stxr(v19 + 1, p_shared_owners));
            v20 = *((_QWORD *)a3 + 4);
            v21 = (std::__shared_weak_count *)*((_QWORD *)a3 + 5);
            v22 = *(double *)(v16 + 64);
            if (v21)
            {
              v23 = (unint64_t *)&v21->__shared_owners_;
              do
                v24 = __ldxr(v23);
              while (__stxr(v24 + 1, v23));
              v25 = 0;
            }
            else
            {
              v25 = 1;
            }
            v16 = v20;
          }
          else
          {
            v21 = 0;
            v22 = *(double *)(v16 + 64);
            v25 = 1;
          }
          v26 = v22;
          v27 = *(unsigned __int8 *)(v16 + 72);
          v56 = 2.0 / v13;
          v58 = 0;
          v57 = 0;
          v59 = -2.0 / v15;
          v28 = v26 + -1.0;
          if (!v27)
            v28 = 1.0 - v26;
          v60 = 0;
          v61 = 0;
          v62 = v28;
          v63 = 0;
          v64 = (float)-v13 / v13;
          v65 = 1065353216;
          v66 = v26;
          v67 = 1065353216;
          if ((v25 & 1) == 0)
          {
            v29 = (unint64_t *)&v21->__shared_owners_;
            do
              v30 = __ldaxr(v29);
            while (__stlxr(v30 - 1, v29));
            if (!v30)
            {
              ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
              std::__shared_weak_count::__release_weak(v21);
            }
          }
          if (v17)
          {
            v31 = (unint64_t *)&v17->__shared_owners_;
            do
              v32 = __ldaxr(v31);
            while (__stlxr(v32 - 1, v31));
            if (!v32)
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v17);
            }
          }

          ggl::DebugConsole::setProjection((uint64_t)v6, &v56);
          -[VKARWalkingCameraController _buildDebugString:](self, "_buildDebugString:", a3);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33)
          {
            objc_msgSend(v33, "componentsSeparatedByString:", CFSTR("\n"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "count");

            if (v36 >= 2)
            {
              v6[12].i32[0] = 0x80000000;
              -[VKCameraController canvas](self, "canvas");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "size");
              v39 = v38;
              -[VKCameraController canvas](self, "canvas");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "size");
              v42 = v41;
              -[VKCameraController canvas](self, "canvas");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "size");
              v44 = v39 * 0.333333333;
              *(float *)&v45 = v42;
              LODWORD(v54) = 0;
              *(float *)&v46 = (float)(v6[3].f32[1] * (float)(v36 - 1)) + v46 * 0.333333333;
              *((float32_t *)&v54 + 1) = v44;
              v55 = __PAIR64__(LODWORD(v46), v45);
              v6[1].i32[0] = 0;
              v6[1].f32[1] = v44;
              ggl::DebugConsole::drawRectangleWithFill(v6, (float32x2_t *)&v55, v44);

              v6[12].i32[0] = -1;
              -[VKCameraController canvas](self, "canvas", v54);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "size");
              v49 = v48 * 0.333333333;
              v6[1].i32[0] = 1084227584;
              v6[1].f32[1] = v49;

              v50 = (int8x16_t *)objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
              v51 = strlen(v50->i8);
              ggl::DebugConsole::drawString((uint64_t)v6, v50, v51, v52, v53);
            }
          }

        }
        ggl::DebugConsole::end((uint64_t)v6);
      }
    }
  }
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  -[VKARWalkingCameraController setCenterCoordinate:](self, "setCenterCoordinate:", a8, a9, a10, a3.var0, a3.var1, a4, a5, a6, a7);
  -[VKARWalkingCameraController setAltitude:](self, "setAltitude:", a4);
  -[VKARWalkingCameraController setHeading:](self, "setHeading:", a5);
  -[VKARWalkingCameraController setPitch:](self, "setPitch:", a6);
}

- (void)setVkCamera:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKARWalkingCameraController;
  -[VKScreenCameraController setVkCamera:](&v3, sel_setVkCamera_, a3);
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  objc_super v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v3 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v10 = *(_QWORD *)a3.__ptr_;
  v11 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  v9.receiver = self;
  v9.super_class = (Class)VKARWalkingCameraController;
  -[VKScreenCameraController setCamera:](&v9, sel_setCamera_, &v10, a3.__cntrl_);
  v6 = v11;
  if (v11)
  {
    v7 = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (void)setCenterCoordinate:(id)a3
{
  double v3;
  double v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;

  v3 = a3.var0 * 0.0174532925;
  v4 = a3.var1 * 0.0174532925;
  -[VKCameraController camera](self, "camera");
  *(double *)(v7 + 8) = v3;
  *(double *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = 0;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double v3;
  double v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[VKCameraController camera](self, "camera");
  v3 = *(double *)(v13 + 8);
  -[VKCameraController camera](self, "camera");
  v4 = *(double *)(v11 + 16);
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (v14)
  {
    v7 = (unint64_t *)&v14->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v9 = v3 * 57.2957795;
  v10 = v4 * 57.2957795;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (void)setDistanceFromCenterCoordinate:(double)a3
{
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[VKCameraController camera](self, "camera");
  *(double *)(v6 + 32) = a3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (double)distanceFromCenterCoordinate
{
  double v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[VKCameraController camera](self, "camera");
  v2 = *(double *)(v6 + 32);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v2;
}

- (double)altitude
{
  return 0.0;
}

- (void)setAltitude:(double)a3
{
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;

  -[VKCameraController camera](self, "camera");
  -[VKCameraController camera](self, "camera");
  *(long double *)(v11 + 32) = cos(*(long double *)(v9 + 40)) * a3;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if (v12)
  {
    v7 = (unint64_t *)&v12->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

- (void)setHeading:(double)a3
{
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[VKCameraController camera](self, "camera");
  *(double *)(v6 + 48) = a3 * 0.0174532925;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (double)heading
{
  double v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[VKCameraController camera](self, "camera");
  v2 = *(double *)(v6 + 48);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v2 * 57.2957795;
}

- (void)setPitch:(double)a3
{
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[VKCameraController camera](self, "camera");
  *(double *)(v6 + 40) = a3 * 0.0174532925;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (double)pitch
{
  double v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[VKCameraController camera](self, "camera");
  v2 = *(double *)(v6 + 40);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v2 * 57.2957795;
}

- (BOOL)usesVKCamera
{
  return 0;
}

- (double)minimumZoomLevel
{
  return 1.0;
}

- (double)maximumZoomLevel
{
  return 21.0;
}

- (double)currentZoomLevel
{
  return 21.0;
}

- (double)topDownMinimumZoomLevel
{
  return 21.0;
}

- (double)minPitch
{
  return 0.0;
}

- (double)maxPitch
{
  return 0.0;
}

- (void).cxx_destruct
{
  void *begin;

  md::Monitorable<md::ConfigValue<GEOConfigKeyDouble,double>>::~Monitorable((uint64_t)&self->_maxClipDistance);
  begin = self->_gestures.__begin_;
  if (begin)
  {
    self->_gestures.__end_ = begin;
    operator delete(begin);
  }
}

@end
