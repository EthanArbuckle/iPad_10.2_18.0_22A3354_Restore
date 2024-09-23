@implementation VKARCameraController

- (VKARCameraController)initWithTaskContext:(shared_ptr<md:(MapDataAccess *)a4 :(AnimationRunner *)a5 TaskContext>)a3 mapDataAccess:(RunLoopController *)a6 animationRunner:(id)a7 runLoopController:cameraDelegate:
{
  __shared_weak_count *cntrl;
  TaskContext *ptr;
  RunLoopController *v12;
  VKARCameraController *v13;
  VKARCameraController *v14;
  VKARCameraController *v15;
  uint64_t v16;
  TaskContext *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  VKARGestureCameraBehavior *v23;
  VKGestureCameraBehavior *gestureCameraControllerBehavior;
  objc_super v26;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)VKARCameraController;
  v13 = -[VKScreenCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](&v26, sel_initWithMapDataAccess_animationRunner_runLoopController_cameraDelegate_, cntrl, a4, a5, v12);
  v14 = v13;
  v15 = v13;
  if (v13)
  {
    v17 = *(TaskContext **)ptr;
    v16 = *((_QWORD *)ptr + 1);
    if (v16)
    {
      v18 = (unint64_t *)(v16 + 8);
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
    v20 = (std::__shared_weak_count *)v13->_taskContext.__cntrl_;
    v13->_taskContext.__ptr_ = v17;
    v13->_taskContext.__cntrl_ = (__shared_weak_count *)v16;
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v15->_globeView = 0;
    -[VKCameraController setIsPitchEnabled:](v15, "setIsPitchEnabled:", 0);
    v15->_height = 0.0;
    v15->_currentZoomLevel = 15.0;
    v15->_maxZoomLevel = 21.0;
    v15->_altitudeOffset = 0.0;
    v23 = -[VKARGestureCameraBehavior initWithARCameraController:]([VKARGestureCameraBehavior alloc], "initWithARCameraController:", v15);
    gestureCameraControllerBehavior = v15->super._gestureCameraControllerBehavior;
    v15->super._gestureCameraControllerBehavior = &v23->super;

    v15->_overrideARFieldOfView = 0;
    v15->_interfaceOrientation = 0;
    v14->_interfaceOrientationRotation._imaginary._e[0] = 0.0;
    v14->_interfaceOrientationRotation._imaginary._e[1] = 0.0;
    v14->_interfaceOrientationRotation._imaginary._e[2] = 0.0;
    v14->_interfaceOrientationRotation._scalar = 1.0;
  }

  return v15;
}

- (void)dealloc
{
  VKGestureCameraBehavior *gestureCameraControllerBehavior;
  VKTimedAnimation *transitionAnimation;
  objc_super v5;

  gestureCameraControllerBehavior = self->super._gestureCameraControllerBehavior;
  self->super._gestureCameraControllerBehavior = 0;

  -[VKAnimation stop](self->_transitionAnimation, "stop");
  transitionAnimation = self->_transitionAnimation;
  self->_transitionAnimation = 0;

  v5.receiver = self;
  v5.super_class = (Class)VKARCameraController;
  -[VKScreenCameraController dealloc](&v5, sel_dealloc);
}

- (int64_t)tileSize
{
  return 256;
}

- (void)updateGlobeFromCamera
{
  uint64_t v3;
  uint64_t v4;
  CameraFrame<geo::Radians, double> *p_cameraFrame;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  long double v15;
  long double v16;
  double v17;
  __int128 v18;
  _OWORD v19[3];
  uint64_t v20;

  v3 = *((_QWORD *)self->_mapEngine + 132);
  v4 = *((_QWORD *)self->_globeView + 9);
  p_cameraFrame = &self->_cameraFrame;
  v6 = *(_OWORD *)(v4 + 24);
  v7 = *(_OWORD *)(v4 + 40);
  v8 = *(_OWORD *)(v4 + 8);
  self->_cameraFrame._roll._value = *(double *)(v4 + 56);
  *(_OWORD *)&self->_cameraFrame._target.altitude._value = v6;
  *(_OWORD *)&self->_cameraFrame._pitch._value = v7;
  *(_OWORD *)&self->_cameraFrame._target.latitude._value = v8;
  v9 = (double *)*((_QWORD *)self->_globeView + 9);
  v11 = v9[46];
  v10 = v9[47];
  if (v10 >= v11)
  {
    v17 = v9[57];
  }
  else
  {
    v12 = v10 * v11;
    v13 = v10 / v11;
    if (v12 <= 0.0)
      v14 = 1.0;
    else
      v14 = v13;
    v15 = tan(v9[57] * 0.5);
    v16 = atan(v14 * v15);
    v17 = v16 + v16;
  }
  self->_fovy._value = v17;
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric((double *)v19, &p_cameraFrame->_target.latitude._value);
  v18 = v19[2];
  *(_OWORD *)(v3 + 32) = v19[1];
  *(_OWORD *)(v3 + 48) = v18;
  *(_QWORD *)(v3 + 64) = v20;
  *(_OWORD *)(v3 + 16) = v19[0];
  -[VKARCameraController _updateBaseTransform](self, "_updateBaseTransform");
}

- (Geocentric<double>)cameraPosition
{
  double v2;
  double v3;
  double v4;
  double v5[7];
  Geocentric<double> result;

  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v5, (double *)(*((_QWORD *)self->_globeView + 9) + 8));
  v2 = v5[0];
  v3 = v5[1];
  v4 = v5[2];
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (BOOL)isPitched
{
  return 0;
}

- (BOOL)isFullyPitched
{
  return 0;
}

- (double)minPitch
{
  return 0.0;
}

- (double)maxPitch
{
  return 0.0;
}

- (Matrix<double,)_intersectAndResolveWorldCollision:(const void *)a3
{
  _QWORD *globeView;
  uint64_t v6;
  double v7;
  double v8;
  long double v9;
  double v10;
  double v11;
  __double2 v12;
  double v13;
  __double2 v14;
  double sinval;
  double cosval;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  long double v27;
  __double2 v28;
  long double v29;
  double v30;
  double v31;
  long double v32;
  __double2 v33;
  long double v34;
  long double v35;
  double v36;
  double v37;
  long double v38;
  __double2 v39;
  long double v40;
  long double v41;
  double v42;
  double v43;
  long double v44;
  __double2 v45;
  long double v46;
  long double v47;
  long double v48;
  double v49;
  double v50;
  long double v51;
  __double2 v52;
  int v53;
  int v54;
  double v56;
  int v57;
  int v58;
  int v60;
  int v61;
  int v63;
  int v64;
  int v66;
  int v67;
  double v69;
  double v70;
  double v71;
  __double2 v72;
  double v73;
  __double2 v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  float64x2_t v96;
  double v97[2];
  double v98[2];
  double v99[2];
  double v100[4];
  Matrix<double, 3, 1> result;

  v100[2] = *(double *)MEMORY[0x1E0C80C00];
  globeView = (_QWORD *)self->_globeView;
  v6 = globeView[9];
  v7 = *(double *)(v6 + 32);
  v8 = 0.0;
  if (cos(*(long double *)(v6 + 40)) * v7 >= 500.0)
    goto LABEL_41;
  v9 = *((double *)a3 + 2);
  v94 = *(double *)a3;
  v93 = *((double *)a3 + 1);
  v10 = sqrt(v94 * v94 + v93 * v93);
  v11 = atan2(v9, v10 * 0.996647189);
  v12 = __sincos_stret(v11);
  v92 = v9;
  v13 = atan2(v9 + v12.__sinval * v12.__sinval * 42841.3115 * v12.__sinval, v10 + v12.__cosval * v12.__cosval * -42697.6727 * v12.__cosval);
  v14 = __sincos_stret(v13);
  sinval = v14.__sinval;
  cosval = v14.__cosval;
  v17 = globeView[89];
  if (!v17)
  {
    v95 = *(double *)&globeView;
    if (!altitude::Intersector::intersectAtPosition((uint64_t)&v95, (float64x2_t *)a3, &v96))
    {
LABEL_41:
      v80 = 0.0;
      v81 = 0.0;
      goto LABEL_42;
    }
    v56 = -1.79769313e308;
    goto LABEL_33;
  }
  v88 = v10;
  v18 = *((double *)a3 + 3);
  v19 = *((double *)a3 + 4);
  v20 = *((double *)a3 + 5);
  v21 = *((double *)a3 + 6);
  v22 = (v19 + v19) * v19;
  v23 = v20 * (v18 + v18);
  v89 = -(v21 * (v18 + v18) - (v19 + v19) * v20);
  v90 = v21 * (v19 + v19) + v23;
  v91 = 1.0 - (v22 + (v18 + v18) * v18);
  v95 = -1.79769313e308;
  v84 = v94 + v90 * 5.0;
  v85 = v93 + v89 * 5.0;
  v83 = 5.0 - (v22 + (v20 + v20) * v20) * 5.0;
  v24 = ((v18 + v18) * v19 + (v20 + v20) * v21) * 5.0;
  v86 = v92 + v91 * 5.0;
  v87 = (v23 - v21 * (v19 + v19)) * 5.0;
  v25 = sqrt((v83 + v84) * (v83 + v84) + (v85 + v24) * (v85 + v24));
  v26 = atan2(v87 + v86, v25 * 0.996647189);
  v27 = atan2(v85 + v24, v83 + v84);
  v28 = __sincos_stret(v26);
  v96.f64[0] = atan2(v87 + v86 + v28.__sinval * v28.__sinval * 42841.3115 * v28.__sinval, v25 - v28.__cosval * v28.__cosval * 42697.6727 * v28.__cosval);
  v96.f64[1] = v27;
  v29 = v85 - v24;
  v30 = sqrt((v84 - v83) * (v84 - v83) + v29 * v29);
  v31 = atan2(v86 - v87, v30 * 0.996647189);
  v32 = atan2(v29, v84 - v83);
  v33 = __sincos_stret(v31);
  v97[0] = atan2(v86 - v87 + v33.__sinval * v33.__sinval * 42841.3115 * v33.__sinval, v30 - v33.__cosval * v33.__cosval * 42697.6727 * v33.__cosval);
  v97[1] = v32;
  v34 = v94 - v90 * 2.5;
  v35 = v93 - v89 * 2.5;
  v36 = sqrt(v34 * v34 + v35 * v35);
  v37 = atan2(v92 - v91 * 2.5, v36 * 0.996647189);
  v38 = atan2(v35, v34);
  v39 = __sincos_stret(v37);
  v98[0] = atan2(v92 - v91 * 2.5 + v39.__sinval * v39.__sinval * 42841.3115 * v39.__sinval, v36 - v39.__cosval * v39.__cosval * 42697.6727 * v39.__cosval);
  v98[1] = v38;
  v40 = v94 + v90 * 15.0;
  v41 = v93 + v89 * 15.0;
  v42 = sqrt(v40 * v40 + v41 * v41);
  v43 = atan2(v92 + v91 * 15.0, v42 * 0.996647189);
  v44 = atan2(v41, v40);
  v45 = __sincos_stret(v43);
  v99[0] = atan2(v92 + v91 * 15.0 + v45.__sinval * v45.__sinval * 42841.3115 * v45.__sinval, v42 - v45.__cosval * v45.__cosval * 42697.6727 * v45.__cosval);
  v99[1] = v44;
  v46 = v94 + v90 * 30.0;
  v47 = v93 + v89 * 30.0;
  v48 = v92 + v91 * 30.0;
  v49 = sqrt(v46 * v46 + v47 * v47);
  v50 = atan2(v48, v49 * 0.996647189);
  v51 = atan2(v47, v46);
  v52 = __sincos_stret(v50);
  v100[0] = atan2(v48 + v52.__sinval * v52.__sinval * 42841.3115 * v52.__sinval, v49 - v52.__cosval * v52.__cosval * 42697.6727 * v52.__cosval);
  v100[1] = v51;
  v53 = altitude::IntersectorHeight::heightAtLatLon(v17, v96.f64, &v95, 0xEu);
  v54 = v53;
  if (v95 > -1.79769313e308 && v53 == 0)
    v56 = v95;
  else
    v56 = -1.79769313e308;
  v57 = altitude::IntersectorHeight::heightAtLatLon(v17, v97, &v95, 0xEu);
  v58 = v57;
  if (v56 < v95 && v57 == 0)
    v56 = v95;
  v60 = altitude::IntersectorHeight::heightAtLatLon(v17, v98, &v95, 0xEu);
  v61 = v60;
  if (v56 < v95 && v60 == 0)
    v56 = v95;
  v63 = altitude::IntersectorHeight::heightAtLatLon(v17, v99, &v95, 0xEu);
  v64 = v63;
  if (v56 < v95 && v63 == 0)
    v56 = v95;
  v66 = altitude::IntersectorHeight::heightAtLatLon(v17, v100, &v95, 0xEu);
  v67 = v66;
  if (v56 < v95 && v66 == 0)
    v56 = v95;
  v95 = *(double *)&self->_globeView;
  v8 = 0.0;
  if (altitude::Intersector::intersectAtPosition((uint64_t)&v95, (float64x2_t *)a3, &v96))
  {
    cosval = v14.__cosval;
    v10 = v88;
    sinval = v14.__sinval;
LABEL_33:
    v69 = v97[0];
    v70 = sqrt(v96.f64[0] * v96.f64[0] + v96.f64[1] * v96.f64[1]);
    v71 = atan2(v97[0], v70 * 0.996647189);
    v72 = __sincos_stret(v71);
    v73 = atan2(v69 + v72.__sinval * v72.__sinval * 42841.3115 * v72.__sinval, v70 + v72.__cosval * v72.__cosval * -42697.6727 * v72.__cosval);
    v74 = __sincos_stret(v73);
    v56 = fmax(v56, v70 / v74.__cosval + -6378137.0 / sqrt(v74.__sinval * v74.__sinval * -0.00669437999 + 1.0));
    v75 = 1.0;
    goto LABEL_34;
  }
  cosval = v14.__cosval;
  v10 = v88;
  sinval = v14.__sinval;
  v75 = 1.0;
  if (v67 || v64 || v61 || v58 || v54)
    goto LABEL_41;
LABEL_34:
  v76 = v10 / cosval + -6378137.0 / sqrt(v75 + sinval * sinval * -0.00669437999);
  if (v76 >= v56 + 35.0)
    goto LABEL_41;
  v77 = *((double *)a3 + 1);
  v78 = *((double *)a3 + 2);
  v79 = (v56 + 35.0 - v76) / sqrt(*(double *)a3 * *(double *)a3 + v77 * v77 + v78 * v78);
  v8 = v79 * *(double *)a3;
  v80 = v79 * v77;
  v81 = v79 * v78;
LABEL_42:
  v82 = v8;
  result._e[2] = v81;
  result._e[1] = v80;
  result._e[0] = v82;
  return result;
}

- (id)mapRegion
{
  id v3;
  void *globeView;
  double v5;
  double *v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double *v13;
  double v14;
  double v15;
  float64x2_t v16;
  const double *v17;
  uint64_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  const double *v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float64x2_t v32;
  float64x2_t v33;
  const double *v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  const double *v38;
  unsigned __int128 v39;
  unsigned __int128 v40;
  float64x2_t v41;
  float64x2_t v42;
  double v43;
  void *__p;
  _BYTE *v46;
  uint64_t v47;
  float64x2x2_t v48;
  float64x2x2_t v49;

  v3 = objc_alloc_init(MEMORY[0x1E0D27208]);
  __p = 0;
  v46 = 0;
  v47 = 0;
  globeView = self->_globeView;
  if (!globeView || (altitude::GlobeView::getVisibleArea((uint64_t)globeView, (long double **)&__p) & 1) == 0)
  {
    objc_msgSend(v3, "setEastLng:", -180.0);
    objc_msgSend(v3, "setWestLng:", -180.0);
    v14 = -180.0;
    objc_msgSend(v3, "setNorthLat:", -180.0);
    goto LABEL_26;
  }
  v6 = (double *)__p;
  if (__p != v46)
  {
    v7 = v46 - (_BYTE *)__p - 16;
    v8 = (v7 >> 4) + 1;
    if (v7 > 0x2F)
    {
      v16 = (float64x2_t)vdupq_n_s64(0x47EFFFFFE0000000uLL);
      v17 = (const double *)((char *)__p + 32);
      v18 = v8 & 0x1FFFFFFFFFFFFFFCLL;
      v19 = v16;
      v20 = v16;
      v21 = (float64x2_t)vdupq_n_s64(0xC7EFFFFFE0000000);
      v22 = v16;
      v23 = v21;
      v24 = v21;
      v25 = v21;
      do
      {
        v26 = v17 - 4;
        v48 = vld2q_f64(v26);
        v49 = vld2q_f64(v17);
        v20 = vminnmq_f64(v20, v48.val[1]);
        v22 = vminnmq_f64(v22, v49.val[1]);
        v16 = vminnmq_f64(v16, v48.val[0]);
        v19 = vminnmq_f64(v19, v49.val[0]);
        v24 = vmaxnmq_f64(v24, v48.val[1]);
        v25 = vmaxnmq_f64(v25, v49.val[1]);
        v21 = vmaxnmq_f64(v21, v48.val[0]);
        v23 = vmaxnmq_f64(v23, v49.val[0]);
        v17 += 8;
        v18 -= 4;
      }
      while (v18);
      v12 = vmaxnmvq_f64(vmaxnmq_f64(v24, v25));
      v9 = vmaxnmvq_f64(vmaxnmq_f64(v21, v23));
      v11 = vminnmvq_f64(vminnmq_f64(v20, v22));
      v10 = vminnmvq_f64(vminnmq_f64(v16, v19));
      if (v8 == (v8 & 0x1FFFFFFFFFFFFFFCLL))
      {
LABEL_13:
        v15 = v9 * 57.2957795;
        v14 = v10 * 57.2957795;
        v5 = v12 - v11;
        if (v12 - v11 > 3.14159265)
        {
          if (v7 > 0x3F)
          {
            v29 = v8 & 3;
            if ((v8 & 3) == 0)
              v29 = 4;
            v30 = v8 - v29;
            v31 = 16 * v30;
            v32 = (float64x2_t)vdupq_n_s64(0xC7EFFFFFE0000000);
            v33 = (float64x2_t)vdupq_n_s64(0x47EFFFFFE0000000uLL);
            v34 = (const double *)((char *)__p + 40);
            v35 = (float64x2_t)vdupq_n_s64(0xC01921FB54442D18);
            v36 = v33;
            v37 = v32;
            do
            {
              v38 = v34 - 4;
              v39 = (unsigned __int128)vld2q_f64(v38);
              v40 = (unsigned __int128)vld2q_f64(v34);
              v41 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v39), (int8x16_t)vaddq_f64((float64x2_t)v39, v35), (int8x16_t)v39);
              v42 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v40), (int8x16_t)vaddq_f64((float64x2_t)v40, v35), (int8x16_t)v40);
              v33 = vminnmq_f64(v33, v41);
              v36 = vminnmq_f64(v36, v42);
              v32 = vmaxnmq_f64(v32, v41);
              v37 = vmaxnmq_f64(v37, v42);
              v34 += 8;
              v30 -= 4;
            }
            while (v30);
            v6 = (double *)((char *)__p + v31);
            v12 = vmaxnmvq_f64(vmaxnmq_f64(v32, v37));
            v5 = vminnmvq_f64(vminnmq_f64(v33, v36));
          }
          else
          {
            v12 = -3.40282347e38;
            v5 = 3.40282347e38;
          }
          do
          {
            v43 = v6[1];
            if (v43 > 0.0)
              v43 = v43 + -6.28318531;
            v5 = fmin(v5, v43);
            v12 = fmax(v12, v43);
            v6 += 2;
          }
          while (v6 != (double *)v46);
          v11 = v5 + 6.28318531;
        }
        goto LABEL_25;
      }
      v13 = (double *)((char *)__p + 16 * (v8 & 0x1FFFFFFFFFFFFFFCLL));
    }
    else
    {
      v9 = -3.40282347e38;
      v10 = 3.40282347e38;
      v11 = 3.40282347e38;
      v12 = -3.40282347e38;
      v13 = (double *)__p;
    }
    do
    {
      v28 = *v13;
      v27 = v13[1];
      v13 += 2;
      v11 = fmin(v11, v27);
      v10 = fmin(v10, v28);
      v12 = fmax(v12, v27);
      v9 = fmax(v9, v28);
    }
    while (v13 != (double *)v46);
    goto LABEL_13;
  }
  v11 = 3.40282347e38;
  v12 = -3.40282347e38;
  v15 = -1.94967423e40;
  v14 = 1.94967423e40;
LABEL_25:
  objc_msgSend(v3, "setEastLng:", v12 * 57.2957795, v5);
  objc_msgSend(v3, "setWestLng:", v11 * 57.2957795);
  objc_msgSend(v3, "setNorthLat:", v15);
LABEL_26:
  objc_msgSend(v3, "setSouthLat:", v14);
  if (__p)
    operator delete(__p);
  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = self->_currentCoordinate.latitude._value * 57.2957795;
  v3 = self->_currentCoordinate.longitude._value * 57.2957795;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (double)distanceFromCenterCoordinate
{
  return *(double *)(*((_QWORD *)self->_globeView + 9) + 32);
}

- (double)altitude
{
  double scalar;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  long double v27;
  long double v28;
  long double v29;
  double v30;
  double v31;
  long double v32;
  __double2 v33;
  double v34;
  __double2 v35;
  double v37;
  double v38[2];

  v4 = self->_offsetTransform._rotation._imaginary._e[2];
  scalar = self->_offsetTransform._rotation._scalar;
  v6 = self->_baseTransform._translation._e[2];
  v5 = self->_baseTransform._rotation._imaginary._e[0];
  v7 = self->_baseTransform._rotation._imaginary._e[1];
  v8 = self->_baseTransform._rotation._imaginary._e[2];
  v9 = self->_baseTransform._rotation._scalar;
  v11 = self->_offsetTransform._rotation._imaginary._e[0];
  v10 = self->_offsetTransform._rotation._imaginary._e[1];
  v12 = v5 * scalar + v11 * v9 + v10 * v8 - v4 * v7;
  v13 = v10 * v9 - (v11 * v8 - v7 * scalar) + v4 * v5;
  v14 = v8 * scalar + v11 * v7 - v10 * v5 + v4 * v9;
  v15 = -(v11 * v5 + v10 * v7 + v4 * v8 - v9 * scalar);
  v17 = self->_baseTransform._translation._e[0];
  v16 = self->_baseTransform._translation._e[1];
  v18 = -(v16 * v4 - v6 * v10) - (v16 * v4 - v6 * v10);
  v19 = -(v6 * v11 - v17 * v4) - (v6 * v11 - v17 * v4);
  v20 = -(v17 * v10 - v16 * v11) - (v17 * v10 - v16 * v11);
  v22 = self->_arTransform._translation._e[1];
  v21 = self->_arTransform._translation._e[2];
  v23 = self->_arTransform._translation._e[0];
  v24 = -(v22 * v14 - v21 * v13) - (v22 * v14 - v21 * v13);
  v25 = -(v21 * v12 - v23 * v14) - (v21 * v12 - v23 * v14);
  v26 = -(v23 * v13 - v22 * v12) - (v23 * v13 - v22 * v12);
  v27 = self->_offsetTransform._translation._e[0]
      + v17
      + v18 * scalar
      + v20 * v10
      + v23
      + v24 * v15
      + v26 * v13
      - (v19 * v4
       + v25 * v14);
  v28 = self->_offsetTransform._translation._e[1]
      + v16
      + v18 * v4
      + v19 * scalar
      + v22
      + v24 * v14
      + v25 * v15
      - (v20 * v11
       + v26 * v12);
  v29 = self->_offsetTransform._translation._e[2]
      + v6
      + v19 * v11
      + v20 * scalar
      + v21
      + v25 * v12
      + v26 * v15
      - (v18 * v10
       + v24 * v13);
  v30 = sqrt(v27 * v27 + v28 * v28);
  v31 = atan2(v29, v30 * 0.996647189);
  v32 = atan2(v28, v27);
  v33 = __sincos_stret(v31);
  v34 = atan2(v29 + v33.__sinval * v33.__sinval * 42841.3115 * v33.__sinval, v30 + v33.__cosval * v33.__cosval * -42697.6727 * v33.__cosval);
  v35 = __sincos_stret(v34);
  v38[0] = v34;
  v38[1] = v32;
  v37 = 0.0;
  altitude::IntersectorHeight::heightAtLatLon(*((_QWORD *)self->_globeView + 89), v38, &v37, 0xEu);
  return v30 / v35.__cosval + -6378137.0 / sqrt(v35.__sinval * v35.__sinval * -0.00669437999 + 1.0) - v37;
}

- (double)heading
{
  float v2;
  float v3;

  v2 = *(double *)(*((_QWORD *)self->_globeView + 9) + 48);
  if (v2 > 3.14159265)
  {
    v3 = v2 + -6.28318531;
    v2 = v3;
  }
  return v2 * -57.2957795;
}

- (double)pitch
{
  return *(double *)(*((_QWORD *)self->_globeView + 9) + 40) * 57.2957795;
}

- (double)_fovAdjustment
{
  double value;
  unsigned __int8 v3;
  int v5;
  double v6;

  value = self->_fovy._value;
  if ((v3 & 1) == 0)
  {
    v6 = self->_fovy._value;
    value = v6;
    if (v5)
    {
      -[VKARCameraController _fovAdjustment]::tanHalfStandardFovY = 0x3FD12612A0540B8FLL;
      value = v6;
    }
  }
  return tan(value * 0.5) / *(double *)&-[VKARCameraController _fovAdjustment]::tanHalfStandardFovY;
}

- (double)minimumZoomLevel
{
  return 1.0;
}

- (double)maximumZoomLevel
{
  return self->_maxZoomLevel;
}

- (double)currentZoomLevel
{
  return self->_currentZoomLevel;
}

- (void)setCurrentZoomLevel:(double)a3
{
  self->_currentZoomLevel = a3;
}

- (void)setMaxZoomLevel:(double)a3
{
  self->_maxZoomLevel = a3;
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  objc_super v10;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v4 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v11 = *(_QWORD *)a3.__ptr_;
  v12 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v10.receiver = self;
  v10.super_class = (Class)VKARCameraController;
  -[VKScreenCameraController setCamera:](&v10, sel_setCamera_, &v11, a3.__cntrl_);
  v7 = v12;
  if (v12)
  {
    v8 = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  -[VKARCameraController updateGlobeFromCamera](self, "updateGlobeFromCamera");
}

- (void)updateWithARSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  float v11;
  long double v12;
  long double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "currentFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[VKARCameraController _transformFromARCamera:](self, "_transformFromARCamera:", v5);
      *(_OWORD *)&self->_currentARTransform._translation._e[2] = v15;
      *(_OWORD *)&self->_currentARTransform._rotation._imaginary._e[1] = v16;
      self->_currentARTransform._rotation._scalar = v17;
      *(_OWORD *)self->_currentARTransform._translation._e = v14;
      objc_msgSend(v5, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "videoFormat");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deviceFormat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = softLinkCMVideoFormatDescriptionGetDimensions[0]((const opaqueCMFormatDescription *)objc_msgSend(v9, "formatDescription"));
      objc_msgSend(v9, "videoFieldOfView");
      v12 = tan(v11 * 0.00872664626);
      *(float *)&v12 = (double)(int)v10 / (v12 + v12);
      v13 = atan((double)SHIDWORD(v10) / (*(float *)&v12 + *(float *)&v12));
      self->_fovy._value = v13 + v13;
      -[VKARCameraController _updateARContext](self, "_updateARContext");

    }
  }

}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  _QWORD *mapEngine;
  int8x8_t *v6;
  int8x8_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  VKTimedAnimation *transitionAnimation;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  RunLoopController *v23;
  uint64_t var0;
  uint64_t v25;
  char v26;

  mapEngine = self->_mapEngine;
  v6 = (int8x8_t *)mapEngine[140];
  v7 = v6[2];
  if (v7)
  {
    a3 = COERCE_DOUBLE(vcnt_s8(v7));
    LOWORD(a3) = vaddlv_u8(*(uint8x8_t *)&a3);
    if (LODWORD(a3) > 1uLL)
    {
      v8 = 0x17767EADC5B287BLL;
      if (*(_QWORD *)&v7 <= 0x17767EADC5B287BuLL)
        v8 = 0x17767EADC5B287BuLL % *(_QWORD *)&v7;
    }
    else
    {
      v8 = (*(_QWORD *)&v7 - 1) & 0x17767EADC5B287BLL;
    }
    v9 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v8);
    if (v9)
    {
      v10 = (_QWORD *)*v9;
      if (v10)
      {
        if (LODWORD(a3) < 2uLL)
        {
          v11 = *(_QWORD *)&v7 - 1;
          while (1)
          {
            v13 = v10[1];
            if (v13 == 0x17767EADC5B287BLL)
            {
              if (v10[2] == 0x17767EADC5B287BLL)
                goto LABEL_22;
            }
            else if ((v13 & v11) != v8)
            {
              goto LABEL_24;
            }
            v10 = (_QWORD *)*v10;
            if (!v10)
              goto LABEL_24;
          }
        }
        do
        {
          v12 = v10[1];
          if (v12 == 0x17767EADC5B287BLL)
          {
            if (v10[2] == 0x17767EADC5B287BLL)
            {
LABEL_22:
              v14 = v10[5];
              if (v14)
                *(_DWORD *)(v14 + 288) = 0;
              break;
            }
          }
          else
          {
            if (v12 >= *(_QWORD *)&v7)
              v12 %= *(_QWORD *)&v7;
            if (v12 != v8)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
LABEL_24:
  v15 = mapEngine[132];
  -[VKARCameraController updateWithARSession:](self, "updateWithARSession:", *(_QWORD *)(v15 + 104), a3);
  transitionAnimation = self->_transitionAnimation;
  if (transitionAnimation)
  {
    if (!-[VKAnimation running](transitionAnimation, "running"))
    {
      v17 = *(id *)(v15 + 104);
      if (v17)
      {
        v18 = v17;
        objc_msgSend(*(id *)(v15 + 104), "currentFrame");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->_transitionAnimation->super);
          +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "arRenderAtNativeRate");

          v22 = v21 ? -1 : 60;
          v23 = -[VKCameraController runLoopController](self, "runLoopController");
          v23->var1 = v22;
          var0 = (uint64_t)v23->var0;
          if (var0)
          {
            if (!**(_BYTE **)(var0 + 1056))
              md::MapEngine::setDisplayRate(var0, v22);
          }
        }
      }
    }
  }
  v25 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
  if (v25)
  {
    v26 = 4;
    md::MapEngine::setNeedsTick(v25, &v26);
  }
}

- (void)_updateARContext
{
  uint64_t v2;
  double v4;
  double v5;
  double v6;
  double v7;
  RigidTransform<double, double> *p_offsetTransform;
  double scalar;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
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
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  long double v65;
  double v66;
  double v67;
  double v68;
  __int128 v69;
  __int128 v70;

  v2 = *((_QWORD *)self->_mapEngine + 132);
  if (v2 && !self->_transitionAnimation)
  {
    -[VKARCameraController _updateBaseTransform](self, "_updateBaseTransform");
    -[VKARCameraController altitude](self, "altitude");
    v5 = -v4 / md::ARContext::planeHeight((md::ARContext *)v2);
    v6 = self->_currentARTransform._rotation._imaginary._e[0];
    self->_arTransform._rotation._imaginary._e[0] = v6;
    self->_arTransform._rotation._imaginary._e[1] = self->_currentARTransform._rotation._imaginary._e[1];
    self->_arTransform._rotation._imaginary._e[2] = self->_currentARTransform._rotation._imaginary._e[2];
    self->_arTransform._rotation._scalar = self->_currentARTransform._rotation._scalar;
    v7 = self->_arTransform._translation._e[2]
       + (self->_currentARTransform._translation._e[2] - self->_lastARTransform._translation._e[2]) * v5;
    _Q3 = vmlaq_n_f64(*(float64x2_t *)self->_arTransform._translation._e, vsubq_f64(*(float64x2_t *)self->_currentARTransform._translation._e, *(float64x2_t *)self->_lastARTransform._translation._e), v5);
    *(float64x2_t *)self->_arTransform._translation._e = _Q3;
    self->_arTransform._translation._e[2] = v7;
    p_offsetTransform = &self->_offsetTransform;
    v11 = self->_offsetTransform._rotation._imaginary._e[2];
    scalar = self->_offsetTransform._rotation._scalar;
    v12 = self->_baseTransform._translation._e[2];
    v13 = self->_baseTransform._rotation._imaginary._e[0];
    v14 = self->_baseTransform._rotation._imaginary._e[1];
    v15 = self->_baseTransform._rotation._imaginary._e[2];
    v16 = self->_baseTransform._rotation._scalar;
    v17 = self->_offsetTransform._rotation._imaginary._e[0];
    v18 = self->_offsetTransform._rotation._imaginary._e[1];
    _D7 = v13 * scalar + v17 * v16 + v18 * v15 - v11 * v14;
    v20 = v18 * v16 - (v17 * v15 - v14 * scalar) + v11 * v13;
    v21 = v15 * scalar + v17 * v14 - v18 * v13 + v11 * v16;
    v22 = -(v17 * v13 + v18 * v14 + v11 * v15 - v16 * scalar);
    v24 = self->_baseTransform._translation._e[0];
    v23 = self->_baseTransform._translation._e[1];
    v25 = -(v23 * v11 - v12 * v18) - (v23 * v11 - v12 * v18);
    v26 = -(v12 * v17 - v24 * v11) - (v12 * v17 - v24 * v11);
    v27 = -(v24 * v18 - v23 * v17) - (v24 * v18 - v23 * v17);
    v28 = self->_arTransform._rotation._imaginary._e[1];
    v29 = self->_arTransform._rotation._imaginary._e[2];
    v30 = self->_arTransform._rotation._scalar;
    v31 = v29 * v20 - (v28 * v21 - v22 * v6) + v30 * _D7;
    v32 = v21 * v6 + v28 * v22 - v29 * _D7 + v30 * v20;
    v33 = v29 * v22 - (v20 * v6 - v28 * _D7) + v30 * v21;
    v34 = _D7 * v6 + v28 * v20 + v29 * v21;
    v35 = vmuld_lane_f64(v21, _Q3, 1);
    v36 = vmlad_n_f64(-(_D7 * v7), v21, _Q3.f64[0]);
    __asm { FMLA            D12, D7, V3.D[1] }
    v42 = -(v35 - v20 * v7) - (v35 - v20 * v7);
    v43 = v36 + v36;
    v44 = _D12 + _D12;
    v45 = v23
        + self->_offsetTransform._translation._e[1]
        + _Q3.f64[1]
        + v25 * v11
        + v42 * v21
        + v43 * v22
        + v26 * scalar
        - (v44 * _D7
         + v27 * v17);
    v46 = v12 + self->_offsetTransform._translation._e[2];
    v66 = v24
        + self->_offsetTransform._translation._e[0]
        + _Q3.f64[0]
        + v25 * scalar
        + v42 * v22
        + v44 * v20
        + v27 * v18
        - (v43 * v21
         + v26 * v11);
    v67 = v45;
    v68 = v46 + v7 + v43 * _D7 + v44 * v22 + v26 * v17 + v27 * scalar - (v25 * v18 + v42 * v20);
    *(double *)&v69 = v31;
    *((double *)&v69 + 1) = v32;
    *(double *)&v70 = v33;
    *((double *)&v70 + 1) = -(v34 - v30 * v22);
    -[VKARCameraController _intersectAndResolveWorldCollision:](self, "_intersectAndResolveWorldCollision:", &v66);
    v48 = v47;
    v50 = v49;
    v52 = v51;
    v53 = 1.0 / sqrt(v66 * v66 + v67 * v67 + v68 * v68);
    v54 = v53 * v66;
    v55 = v53 * v67;
    v56 = v53 * v68;
    -[VKARCameraController altitude](self, "altitude");
    if (v57 >= 50.0)
    {
      if (v57 > 3000.0)
      {
        v59 = v57 + -3000.0;
        v48 = v48 - v54 * v59;
        v50 = v50 - v55 * v59;
        v52 = v52 - v56 * v59;
      }
    }
    else
    {
      v58 = 50.0 - v57;
      v48 = v48 + v54 * v58;
      v50 = v50 + v55 * v58;
      v52 = v52 + v56 * v58;
    }
    v66 = v66 + v48;
    v60 = v66;
    v67 = v67 + v50;
    v61 = v67;
    v62 = self->_offsetTransform._translation._e[1];
    v63 = p_offsetTransform->_translation._e[0] + v48;
    v68 = v68 + v52;
    v64 = v68;
    p_offsetTransform->_translation._e[0] = v63;
    self->_offsetTransform._translation._e[1] = v62 + v50;
    self->_offsetTransform._translation._e[2] = self->_offsetTransform._translation._e[2] + v52;
    v65 = sqrt(v60 * v60 + v61 * v61 + v64 * v64)
        - cos(self->_cameraFrame._pitch._value) * self->_cameraFrame._distanceFromTarget._value;
    *(long double *)(v2 + 72) = v65 * v54;
    *(long double *)(v2 + 80) = v65 * v55;
    *(long double *)(v2 + 88) = v65 * v56;
    *(_OWORD *)(v2 + 40) = v69;
    *(_OWORD *)(v2 + 56) = v70;
    *(double *)(v2 + 16) = v60;
    *(double *)(v2 + 24) = v61;
    *(double *)(v2 + 32) = v64;
    altitude::GlobeView::setPerspective((uint64_t)self->_globeView, &self->_fovy._value);
    self->_lastARTransform._rotation._imaginary._e[0] = self->_currentARTransform._rotation._imaginary._e[0];
    self->_lastARTransform._rotation._imaginary._e[1] = self->_currentARTransform._rotation._imaginary._e[1];
    self->_lastARTransform._rotation._imaginary._e[2] = self->_currentARTransform._rotation._imaginary._e[2];
    self->_lastARTransform._rotation._scalar = self->_currentARTransform._rotation._scalar;
    self->_lastARTransform._translation._e[0] = self->_currentARTransform._translation._e[0];
    self->_lastARTransform._translation._e[1] = self->_currentARTransform._translation._e[1];
    self->_lastARTransform._translation._e[2] = self->_currentARTransform._translation._e[2];
  }
}

- (void)_updateBaseTransform
{
  uint64_t v3;
  long double v4;
  long double v5;
  long double v6;
  double v7;
  double v8;
  double v9;
  __double2 v10;
  CameraFrame<geo::Radians, double> *p_cameraFrame;
  void *v12;
  int v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  double height;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double value;
  long double v25;
  RigidTransform<double, double> *p_baseTransform;
  __int128 v27;
  double v28[3];
  __int128 v29;
  __int128 v30;
  _OWORD v31[2];
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35[7];
  Coordinate2D<geo::Radians, double> v36;

  v3 = *((_QWORD *)self->_mapEngine + 132);
  v4 = *(double *)(v3 + 16);
  v5 = *(double *)(v3 + 24);
  v6 = *(double *)(v3 + 32);
  v7 = sqrt(v4 * v4 + v5 * v5);
  v8 = atan2(v6, v7 * 0.996647189);
  v9 = atan2(v5, v4);
  v10 = __sincos_stret(v8);
  v36.latitude._value = atan2(v6 + v10.__sinval * v10.__sinval * 42841.3115 * v10.__sinval, v7 + v10.__cosval * v10.__cosval * -42697.6727 * v10.__cosval);
  v36.longitude._value = v9;
  if (v36.latitude._value != self->_currentCoordinate.latitude._value
    || v9 != self->_currentCoordinate.longitude._value)
  {
    v35[0] = 0.0;
    if (!altitude::IntersectorHeight::heightAtLatLon(*((_QWORD *)self->_globeView + 89), &v36.latitude._value, v35, 0xEu)&& v35[0] > self->_altitudeOffset)
    {
      self->_altitudeOffset = v35[0];
    }
    self->_currentCoordinate = v36;
  }
  p_cameraFrame = &self->_cameraFrame;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings", gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v35, &self->_cameraFrame._target.latitude._value));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "arOverrideDefaults");

  if (v13)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arDefaultHeight");
    v16 = v15;

  }
  else
  {
    v16 = *(float *)(v3 + 4);
  }
  v17 = self->_altitudeOffset + v16;
  height = self->_height;
  v19 = v17;
  if (height != v19)
  {
    self->_height = v19;
    height = v19;
  }
  v20 = v35[0];
  v21 = v35[1];
  v22 = v35[2];
  v23 = sqrt(v20 * v20 + v21 * v21 + v22 * v22);
  value = self->_cameraFrame._distanceFromTarget._value;
  v25 = (v23 - cos(self->_cameraFrame._pitch._value) * value + height) / v23;
  p_baseTransform = &self->_baseTransform;
  p_baseTransform->_translation._e[0] = v25 * v20;
  p_baseTransform->_translation._e[1] = v25 * v21;
  p_baseTransform->_translation._e[2] = v25 * v22;
  v27 = *(_OWORD *)&p_cameraFrame->_target.altitude._value;
  v31[0] = *(_OWORD *)&p_cameraFrame->_target.latitude._value;
  v31[1] = v27;
  v33 = p_cameraFrame->_heading._value;
  v32 = 0;
  v34 = 0;
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v28, (double *)v31);
  *(_OWORD *)p_baseTransform->_rotation._imaginary._e = v29;
  *(_OWORD *)&p_baseTransform->_rotation._imaginary._e[2] = v30;
}

- (void)_setupPounceAnimation:(const void *)a3 duration:(double)a4 completion:(id)a5
{
  id v8;
  VKTimedAnimation *transitionAnimation;
  VKTimedAnimation *v10;
  VKTimedAnimation *v11;
  double value;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD *globeView;
  void *v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  long double v27;
  long double v28;
  double v29;
  uint64_t v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD *v34;
  id v35;
  _QWORD v36[6];
  id v37[2];
  __int128 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  id location;
  _QWORD v51[6];
  __int128 v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  double v56;
  uint64_t v57;

  v8 = a5;
  -[VKAnimation stop](self->_transitionAnimation, "stop");
  transitionAnimation = self->_transitionAnimation;
  self->_transitionAnimation = 0;

  -[VKARCameraController _updateBaseTransform](self, "_updateBaseTransform");
  v10 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a4);
  v11 = self->_transitionAnimation;
  self->_transitionAnimation = v10;

  -[VKTimedAnimation setTimingFunction:](self->_transitionAnimation, "setTimingFunction:", VKAnimationCurveEaseInOut);
  value = self->_cameraFrame._target.latitude._value;
  v13 = self->_cameraFrame._target.longitude._value;
  v14 = self->_cameraFrame._target.altitude._value;
  v15 = self->_cameraFrame._distanceFromTarget._value;
  v16 = self->_cameraFrame._pitch._value;
  v17 = self->_cameraFrame._heading._value;
  v18 = self->_cameraFrame._roll._value;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x6812000000;
  v51[3] = __Block_byref_object_copy__3860;
  v51[4] = __Block_byref_object_dispose__3861;
  v51[5] = "";
  v56 = v17;
  v55 = 0x3FE921FB54442D18;
  v57 = 0;
  v54 = self->_height * 1.41421356;
  v52 = *(_OWORD *)a3;
  v53 = *((_QWORD *)a3 + 2);
  location = 0;
  globeView = self->_globeView;
  v47 = v52;
  if (!altitude::IntersectorHeight::heightAtLatLon(globeView[89], (double *)&v47, (double *)&location, 0xEu))*(_QWORD *)&self->_altitudeOffset = location;
  v20 = (void *)*((_QWORD *)self->_mapEngine + 132);
  objc_initWeak(&location, self);
  v21 = (double *)*((_QWORD *)self->_globeView + 9);
  v23 = v21[46];
  v22 = v21[47];
  if (v22 >= v23)
  {
    v29 = v21[57];
  }
  else
  {
    v24 = v22 * v23;
    v25 = v22 / v23;
    if (v24 <= 0.0)
      v26 = 1.0;
    else
      v26 = v25;
    v27 = tan(v21[57] * 0.5);
    v28 = atan(v26 * v27);
    v29 = v28 + v28;
  }
  *(_QWORD *)&v47 = 0;
  *((_QWORD *)&v47 + 1) = &v47;
  v48 = 0x2020000000;
  v49 = 0;
  v30 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3321888768;
  v36[2] = __66__VKARCameraController__setupPounceAnimation_duration_completion___block_invoke;
  v36[3] = &unk_1E42E92A0;
  objc_copyWeak(v37, &location);
  v37[1] = v20;
  v36[4] = &v47;
  v36[5] = v51;
  v38 = xmmword_19FFB3BB0;
  v39 = value;
  v40 = v13;
  v41 = v14;
  v42 = v15;
  v43 = v16;
  v44 = v17;
  v45 = v18;
  v46 = v29;
  -[VKTimedAnimation setStepHandler:](self->_transitionAnimation, "setStepHandler:", v36);
  v32[0] = v30;
  v32[1] = 3221225472;
  v32[2] = __66__VKARCameraController__setupPounceAnimation_duration_completion___block_invoke_13;
  v32[3] = &unk_1E42F4CF8;
  objc_copyWeak(&v35, &location);
  v34 = v51;
  v31 = v8;
  v33 = v31;
  -[VKAnimation setCompletionHandler:](self->_transitionAnimation, "setCompletionHandler:", v32);

  objc_destroyWeak(&v35);
  objc_destroyWeak(v37);
  _Block_object_dispose(&v47, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(v51, 8);

}

- (void)trasitionToARModeAtCoordinate:(id)a3 withDuration:(double)a4 completion:(id)a5
{
  double var1;
  double var0;
  void (**v9)(id, _QWORD);
  VKTimedAnimation *transitionAnimation;
  double v11[3];

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = (void (**)(id, _QWORD))a5;
  transitionAnimation = self->_transitionAnimation;
  if (transitionAnimation && -[VKAnimation running](transitionAnimation, "running"))
  {
    if (v9)
      v9[2](v9, 0);
  }
  else
  {
    v11[0] = var0 * 0.0174532925;
    v11[1] = var1 * 0.0174532925;
    v11[2] = 0.0;
    -[VKARCameraController _setupPounceAnimation:duration:completion:](self, "_setupPounceAnimation:duration:completion:", v11, v9, a4);
  }

}

- (CameraFrame<geo::Radians,)cameraFrame
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7]._distanceFromTarget._value;
  *(_OWORD *)&retstr->_target.latitude._value = *(_OWORD *)&self[7]._target.longitude._value;
  *(_OWORD *)&retstr->_target.altitude._value = v3;
  *(_OWORD *)&retstr->_pitch._value = *(_OWORD *)&self[7]._heading._value;
  retstr->_roll._value = self[8]._target.latitude._value;
  return self;
}

- (void)trasitionToARModeFromCameraFrame:(const void *)a3 withDuration:(double)a4 completion:(id)a5
{
  VKTimedAnimation *transitionAnimation;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD *globeView;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD *v16;
  double altitudeOffset;
  float *v18;
  double value;
  float v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  long double v27;
  long double v28;
  double v29;
  VKTimedAnimation *v30;
  VKTimedAnimation *v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36[2];
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  id location;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  double v49;

  -[VKAnimation stop](self->_transitionAnimation, "stop", a3, a5, a4);
  transitionAnimation = self->_transitionAnimation;
  self->_transitionAnimation = 0;

  v9 = *((_OWORD *)a3 + 1);
  v8 = *((_OWORD *)a3 + 2);
  v10 = *(_OWORD *)a3;
  self->_cameraFrame._roll._value = *((double *)a3 + 6);
  *(_OWORD *)&self->_cameraFrame._target.altitude._value = v9;
  *(_OWORD *)&self->_cameraFrame._pitch._value = v8;
  *(_OWORD *)&self->_cameraFrame._target.latitude._value = v10;
  globeView = self->_globeView;
  v12 = globeView[9];
  v14 = *((_OWORD *)a3 + 1);
  v13 = *((_OWORD *)a3 + 2);
  v15 = *(_OWORD *)a3;
  *(_QWORD *)(v12 + 56) = *((_QWORD *)a3 + 6);
  *(_OWORD *)(v12 + 8) = v15;
  *(_OWORD *)(v12 + 40) = v13;
  *(_OWORD *)(v12 + 24) = v14;
  ++*((_DWORD *)globeView + 94);
  v49 = 0.0;
  v16 = self->_globeView;
  v44 = *(_OWORD *)&self->_cameraFrame._target.latitude._value;
  if (altitude::IntersectorHeight::heightAtLatLon(v16[89], (double *)&v44, &v49, 0xEu))
  {
    altitudeOffset = self->_altitudeOffset;
  }
  else
  {
    altitudeOffset = v49;
    self->_altitudeOffset = v49;
  }
  v18 = (float *)*((_QWORD *)self->_mapEngine + 132);
  value = self->_cameraFrame._distanceFromTarget._value;
  v20 = -(altitudeOffset - cos(self->_cameraFrame._pitch._value) * value);
  v18[1] = v20;
  self->_arTransform._rotation._imaginary._e[1] = 0.0;
  self->_arTransform._rotation._imaginary._e[2] = 0.0;
  self->_arTransform._rotation._scalar = 1.0;
  self->_arTransform._translation._e[2] = 0.0;
  self->_arTransform._rotation._imaginary._e[0] = 0.0;
  self->_arTransform._translation._e[0] = 0.0;
  self->_arTransform._translation._e[1] = 0.0;
  self->_currentARTransform._rotation._imaginary._e[1] = 0.0;
  self->_currentARTransform._rotation._imaginary._e[2] = 0.0;
  self->_currentARTransform._rotation._scalar = 1.0;
  self->_currentARTransform._translation._e[2] = 0.0;
  self->_currentARTransform._rotation._imaginary._e[0] = 0.0;
  self->_currentARTransform._translation._e[0] = 0.0;
  self->_currentARTransform._translation._e[1] = 0.0;
  self->_lastARTransform._rotation._imaginary._e[1] = 0.0;
  self->_lastARTransform._rotation._imaginary._e[2] = 0.0;
  self->_lastARTransform._rotation._scalar = 1.0;
  self->_lastARTransform._translation._e[2] = 0.0;
  self->_lastARTransform._rotation._imaginary._e[0] = 0.0;
  self->_lastARTransform._translation._e[0] = 0.0;
  self->_lastARTransform._translation._e[1] = 0.0;
  self->_arOrientation._imaginary._e[0] = 0.0;
  self->_arOrientation._imaginary._e[1] = 0.0;
  self->_arOrientation._imaginary._e[2] = 0.0;
  self->_arOrientation._scalar = 1.0;
  self->_offsetTransform._rotation._imaginary._e[1] = 0.0;
  self->_offsetTransform._rotation._imaginary._e[2] = 0.0;
  self->_offsetTransform._rotation._scalar = 1.0;
  self->_offsetTransform._translation._e[2] = 0.0;
  self->_offsetTransform._rotation._imaginary._e[0] = 0.0;
  self->_offsetTransform._translation._e[0] = 0.0;
  self->_offsetTransform._translation._e[1] = 0.0;
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric((double *)&v44, &self->_cameraFrame._target.latitude._value);
  v21 = (double *)*((_QWORD *)self->_globeView + 9);
  v23 = v21[46];
  v22 = v21[47];
  if (v22 >= v23)
  {
    v29 = v21[57];
  }
  else
  {
    v24 = v22 * v23;
    v25 = v22 / v23;
    if (v24 <= 0.0)
      v26 = 1.0;
    else
      v26 = v25;
    v27 = tan(v21[57] * 0.5);
    v28 = atan(v26 * v27);
    v29 = v28 + v28;
  }
  objc_initWeak(&location, self);
  v30 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.5);
  v31 = self->_transitionAnimation;
  self->_transitionAnimation = v30;

  -[VKTimedAnimation setTimingFunction:](self->_transitionAnimation, "setTimingFunction:", VKAnimationCurveEaseInOut);
  v32 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3321888768;
  v35[2] = __81__VKARCameraController_trasitionToARModeFromCameraFrame_withDuration_completion___block_invoke;
  v35[3] = &unk_1E42E90B8;
  objc_copyWeak(v36, &location);
  v36[1] = v18;
  v37 = v44;
  v38 = v45;
  v39 = v46;
  v40 = v47;
  v41 = v48;
  v42 = v29;
  -[VKTimedAnimation setStepHandler:](self->_transitionAnimation, "setStepHandler:", v35);
  v33[0] = v32;
  v33[1] = 3221225472;
  v33[2] = __81__VKARCameraController_trasitionToARModeFromCameraFrame_withDuration_completion___block_invoke_15;
  v33[3] = &unk_1E42F7A38;
  objc_copyWeak(&v34, &location);
  -[VKAnimation setCompletionHandler:](self->_transitionAnimation, "setCompletionHandler:", v33);
  objc_destroyWeak(&v34);
  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
}

- (RigidTransform<double,)arCameraTransform
{
  *retstr = *(RigidTransform<double, double> *)(*(_QWORD *)(*(_QWORD *)&self[5]._translation._e[2] + 1056) + 16);
  return self;
}

- (float)heightScale
{
  return self->_height;
}

- (RigidTransform<double,)_transformFromARCamera:(VKARCameraController *)self
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t (*v11)(OpaqueCMClock *);
  uint64_t HostTimeClock;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  float v19;
  int8x16_t v20;
  double v21;
  float v22;
  float v23;
  double v24;
  double v25;
  int64_t v26;
  unint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  BOOL v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double scalar;
  double v67;
  double v68;
  double v69;
  double v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  __int128 v74;
  RigidTransform<double, double> *result;
  CMTime v76;
  CMTime v77;

  v6 = a4;
  v7 = v6;
  if (!v6)
    goto LABEL_7;
  objc_msgSend(v6, "currentFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_7;
  objc_msgSend(v7, "currentFrame");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "camera");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    memset(&v77, 0, sizeof(v77));
    v11 = softLinkCMClockGetTime;
    HostTimeClock = softLinkCMClockGetHostTimeClock();
    ((void (*)(CMTime *__return_ptr, uint64_t))v11)(&v77, HostTimeClock);
    v76 = v77;
    softLinkCMTimeGetSeconds(&v76);
    objc_msgSend(v7, "predictedDeviceTransformAtTimestamp:");
    v21 = v13;
    v23 = v22;
    v24 = v22;
    v25 = v19;
    v26 = *(_QWORD *)(*((_QWORD *)self->_mapEngine + 132) + 96);
    if (v26 != self->_interfaceOrientation)
    {
      self->_interfaceOrientation = v26;
      v27 = v26 - 1;
      if (v27 > 2)
      {
        v30 = 1.0;
        v29 = 0.0;
        v31 = 0.0;
      }
      else
      {
        v28 = 8 * v27;
        v29 = *(double *)((char *)&unk_19FFB8C20 + v28);
        v30 = *(double *)((char *)&unk_19FFB8C38 + v28);
        v31 = *(double *)((char *)&unk_19FFB8C50 + v28);
      }
      self->_interfaceOrientationRotation._imaginary._e[0] = v31;
      self->_interfaceOrientationRotation._imaginary._e[1] = v31;
      self->_interfaceOrientationRotation._imaginary._e[2] = v29;
      self->_interfaceOrientationRotation._scalar = v30;
    }
    v32 = v14;
    v33 = v15;
    v34 = v16;
    v35 = v17;
    v36 = *(float *)&v18;
    v37 = *((float *)&v18 + 1);
    v38 = v24 + v21 + v25;
    if (v38 <= 0.0)
    {
      if (v13 <= v23 || v13 <= v19)
      {
        v47 = v23 <= v19;
        v48 = sqrt(v25 + 1.0 - (v24 + v21));
        v49 = 1.0 / (v48 + v48);
        v50 = (v33 + v36) * v49;
        v51 = v35 + v37;
        v52 = v51 * v49;
        v53 = v48 * 0.5;
        v54 = (v32 - v34) * v49;
        v55 = sqrt(v24 + 1.0 - (v25 + v21));
        v56 = 1.0 / (v55 + v55);
        v41 = v55 * 0.5;
        v57 = v51 * v56;
        v58 = (v36 - v33) * v56;
        if (v47)
          v40 = v50;
        else
          v40 = (v32 + v34) * v56;
        if (v47)
        {
          v41 = v52;
          v42 = v53;
        }
        else
        {
          v42 = v57;
        }
        if (v47)
          v43 = v54;
        else
          v43 = v58;
      }
      else
      {
        v44 = sqrt(v21 + 1.0 - (v25 + v24));
        v45 = v44 + v44;
        v40 = v44 * 0.5;
        v46 = 1.0 / v45;
        v41 = (v32 + v34) * v46;
        v42 = (v33 + v36) * v46;
        v43 = (v35 - v37) * v46;
      }
    }
    else
    {
      v39 = 0.5 / sqrt(v38 + 1.0);
      v40 = v39 * (v35 - v37);
      v41 = v39 * (v36 - v33);
      v42 = v39 * (v32 - v34);
      v43 = 0.25 / v39;
    }
    self->_arOrientation._imaginary._e[0] = v40;
    self->_arOrientation._imaginary._e[1] = v41;
    self->_arOrientation._imaginary._e[2] = v42;
    self->_arOrientation._scalar = v43;
    v59 = v41 * 0.707106781;
    v60 = v40 * 0.707106781 + v43 * 0.707106781;
    v61 = -(v42 * 0.707106781 - v41 * 0.707106781);
    v62 = v59 + v42 * 0.707106781;
    v63 = -(v40 * 0.707106781 - v43 * 0.707106781);
    v64 = self->_interfaceOrientationRotation._imaginary._e[1];
    v65 = self->_interfaceOrientationRotation._imaginary._e[2];
    scalar = self->_interfaceOrientationRotation._scalar;
    v67 = v65 * v61 - (v64 * v62 - self->_interfaceOrientationRotation._imaginary._e[0] * v63) + scalar * v60;
    v68 = self->_interfaceOrientationRotation._imaginary._e[0] * v62 + v64 * v63 - v65 * v60 + scalar * v61;
    v69 = v65 * v63 - (self->_interfaceOrientationRotation._imaginary._e[0] * v61 - v64 * v60) + scalar * v62;
    v70 = self->_interfaceOrientationRotation._imaginary._e[0] * v60 + v64 * v61 + v65 * v62;
    retstr->_translation._e[0] = *(float *)v20.i32;
    v71 = vcvtq_f64_f32((float32x2_t)*(_OWORD *)&vextq_s8(v20, v20, 4uLL));
    v72 = vmulq_f64(v71, (float64x2_t)vdupq_n_s64(0x3CB0000000000000uLL));
    v73 = (float64x2_t)vextq_s8((int8x16_t)v71, (int8x16_t)v71, 8uLL);
    *(_QWORD *)&v74 = *(_OWORD *)&vsubq_f64(v72, v73);
    *((_QWORD *)&v74 + 1) = *(_QWORD *)&vaddq_f64(v72, v73).f64[1];
    *(_OWORD *)&retstr->_translation._e[1] = v74;
    retstr->_rotation._imaginary._e[0] = v67;
    retstr->_rotation._imaginary._e[1] = v68;
    retstr->_rotation._imaginary._e[2] = v69;
    retstr->_rotation._scalar = -(v70 - scalar * v63);
  }
  else
  {
LABEL_7:
    *(_OWORD *)&retstr->_translation._e[2] = 0u;
    *(_OWORD *)&retstr->_rotation._imaginary._e[1] = 0u;
    *(_OWORD *)retstr->_translation._e = 0u;
    retstr->_rotation._scalar = 1.0;
  }

  return result;
}

- (void)updateCameraFrameFromARTransform
{
  VKTimedAnimation *transitionAnimation;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double scalar;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  int8x16_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  __double2 v50;
  long double v51;
  __double2 v52;
  double v53;
  _QWORD *globeView;
  uint64_t v55;
  double value;
  __int128 v57;
  __int128 v58;
  long double __x;
  float64x2_t v60;
  float64x2_t v61;

  transitionAnimation = self->_transitionAnimation;
  if (!transitionAnimation || !-[VKAnimation running](transitionAnimation, "running"))
  {
    v4 = (double *)*((_QWORD *)self->_mapEngine + 132);
    v6 = v4[6];
    v5 = v4[7];
    v7 = v4[5];
    v8 = v4[8];
    v9 = v4[2] + -((v7 + v7) * v5 - v8 * (v6 * -2.0)) * 10.0;
    v10 = v4[3] + (v6 * -2.0 * v5 + (v7 + v7) * v8) * 10.0;
    v11 = v4[4] + -(v6 * -2.0 * v6 + 1.0 - (v7 + v7) * v7) * 10.0;
    v12 = self->_interfaceOrientationRotation._imaginary._e[2];
    scalar = self->_interfaceOrientationRotation._scalar;
    v14 = *(float64x2_t *)&self->_arOrientation._imaginary._e[2];
    v15 = (float64x2_t)vextq_s8(*(int8x16_t *)self->_arOrientation._imaginary._e, *(int8x16_t *)self->_arOrientation._imaginary._e, 8uLL);
    v16 = (float64x2_t)vdupq_n_s64(0x3FE6A09E667F3BCDuLL);
    v17 = (float64x2_t)vdupq_n_s64(0x3FE6A09E667F3BCCuLL);
    v18 = vmulq_f64(v15, v16);
    v19 = vmulq_f64(v14, v17);
    *(_QWORD *)&v20.f64[0] = *(_OWORD *)&vsubq_f64(v18, v19);
    v20.f64[1] = vaddq_f64(v18, v19).f64[1];
    v21 = vmulq_f64(v14, v16);
    v22 = vmulq_f64(v15, v17);
    *(_QWORD *)&v16.f64[0] = *(_OWORD *)&vaddq_f64(v21, v22);
    v23 = vsubq_f64(v21, v22);
    v24 = *(float64x2_t *)self->_interfaceOrientationRotation._imaginary._e;
    v25 = (int8x16_t)vmulq_n_f64(v24, v16.f64[0]);
    v16.f64[1] = v23.f64[1];
    v26 = vmulq_laneq_f64(v24, v23, 1);
    v27 = (float64x2_t)vextq_s8(v25, v25, 8uLL);
    v28 = vsubq_f64(v26, v27);
    v29 = vaddq_f64(v26, v27);
    v30 = vmulq_n_f64(v20, v12);
    *(_QWORD *)&v26.f64[0] = *(_OWORD *)&vaddq_f64(v28, v30);
    v26.f64[1] = vsubq_f64(v29, v30).f64[1];
    v31 = (float64x2_t)vextq_s8((int8x16_t)v20, (int8x16_t)v20, 8uLL);
    v32 = vmlaq_n_f64(v26, v31, scalar);
    v33 = vmulq_n_f64(v16, scalar);
    v34 = vmulq_n_f64(v20, v24.f64[0]);
    v35 = vmulq_laneq_f64(v31, v24, 1);
    *(_QWORD *)&v31.f64[0] = *(_OWORD *)&vsubq_f64(v35, v34);
    v31.f64[1] = vaddq_f64(v35, v34).f64[1];
    v36 = vmlaq_n_f64(v31, (float64x2_t)vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL), v12);
    *(_QWORD *)&v37.f64[0] = *(_OWORD *)&vaddq_f64(v33, v36);
    v37.f64[1] = vsubq_f64(v33, v36).f64[1];
    v38 = (float64x2_t)vzip2q_s64((int64x2_t)v37, (int64x2_t)v32);
    v39 = vmulq_f64(v38, v38);
    v40 = (float64x2_t)vzip1q_s64((int64x2_t)v37, (int64x2_t)v32);
    v41 = vmulq_f64(v40, v40);
    v42 = vaddq_f64(v39, v41);
    v43 = vsubq_f64(v42, (float64x2_t)vdupq_laneq_s64((int64x2_t)v42, 1)).f64[0];
    if (v43 >= 1.0)
    {
      v46 = acos(vmlad_n_f64(1.0, -2.0, vaddq_f64(v41, (float64x2_t)vdupq_laneq_s64((int64x2_t)v39, 1)).f64[0]));
      v44 = 0.0;
      v45 = 0.0;
    }
    else
    {
      v60 = vmulq_f64((float64x2_t)vextq_s8((int8x16_t)v37, (int8x16_t)v37, 8uLL), v32);
      v61 = vmulq_f64(v32, v37);
      __x = v43;
      v44 = atan2(v61.f64[0] - v61.f64[1], vaddvq_f64(v60));
      v45 = acos(__x);
      v46 = atan2(vaddvq_f64(v61), v60.f64[0] - v60.f64[1]);
    }
    v47 = sqrt(v9 * v9 + v10 * v10);
    v48 = atan2(v11, v47 * 0.996647189);
    v49 = atan2(v10, v9);
    v50 = __sincos_stret(v48);
    v51 = atan2(v11 + v50.__sinval * v50.__sinval * 42841.3115 * v50.__sinval, v47 + v50.__cosval * v50.__cosval * -42697.6727 * v50.__cosval);
    v52 = __sincos_stret(v51);
    v53 = self->_cameraFrame._heading._value + v44;
    self->_cameraFrame._target.latitude._value = v51;
    self->_cameraFrame._target.longitude._value = v49;
    self->_cameraFrame._target.altitude._value = v47 / v52.__cosval
                                               + -6378137.0 / sqrt(v52.__sinval * v52.__sinval * -0.00669437999 + 1.0);
    self->_cameraFrame._distanceFromTarget._value = 10.0;
    self->_cameraFrame._pitch._value = v45;
    self->_cameraFrame._heading._value = v53;
    self->_cameraFrame._roll._value = v46;
    globeView = self->_globeView;
    v55 = globeView[9];
    value = self->_cameraFrame._roll._value;
    v57 = *(_OWORD *)&self->_cameraFrame._target.latitude._value;
    v58 = *(_OWORD *)&self->_cameraFrame._target.altitude._value;
    *(_OWORD *)(v55 + 40) = *(_OWORD *)&self->_cameraFrame._pitch._value;
    *(_OWORD *)(v55 + 24) = v58;
    *(double *)(v55 + 56) = value;
    *(_OWORD *)(v55 + 8) = v57;
    ++*((_DWORD *)globeView + 94);
  }
}

- (void)arSessionWasInterrupted:(unint64_t)a3
{
  VKTimedAnimation *transitionAnimation;
  void *v5;
  int v6;
  uint64_t v7;
  RunLoopController *v8;
  uint64_t var0;

  transitionAnimation = self->_transitionAnimation;
  if (transitionAnimation && !-[VKAnimation running](transitionAnimation, "running", a3))
  {
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->_transitionAnimation->super);
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "arRenderAtNativeRate");

    if (v6)
      v7 = -1;
    else
      v7 = 60;
    v8 = -[VKCameraController runLoopController](self, "runLoopController");
    v8->var1 = v7;
    var0 = (uint64_t)v8->var0;
    if (var0)
    {
      if (!**(_BYTE **)(var0 + 1056))
        md::MapEngine::setDisplayRate(var0, v7);
    }
  }
}

- (void)globeView
{
  return self->_globeView;
}

- (void)setGlobeView:(void *)a3
{
  self->_globeView = a3;
}

- (void)mapEngine
{
  return self->_mapEngine;
}

- (void)setMapEngine:(void *)a3
{
  self->_mapEngine = a3;
}

- (BOOL)overrideARFieldOfView
{
  return self->_overrideARFieldOfView;
}

- (void)setOverrideARFieldOfView:(BOOL)a3
{
  self->_overrideARFieldOfView = a3;
}

- (RigidTransform<double,)offsetTransform
{
  *retstr = *(RigidTransform<double, double> *)((char *)self + 344);
  return self;
}

- (void)setOffsetTransform:()RigidTransform<double
{
  self->_offsetTransform = *a3;
}

- (Unit<geo::DegreeUnitDescription,)fieldOfView
{
  _QWORD *v2;
  Unit<geo::DegreeUnitDescription, double> v3;

  v3._value = self->_fieldOfView._value;
  *v2 = *(Unit<geo::DegreeUnitDescription, double> *)&v3._value;
  return v3;
}

- (void)setFieldOfView:()Unit<geo:(double>)a3 :DegreeUnitDescription
{
  double *v3;

  self->_fieldOfView._value = *v3;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_transitionAnimation, 0);
  cntrl = self->_taskContext.__cntrl_;
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
}

- (id).cxx_construct
{
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *((_QWORD *)self + 49) = 0x3FF0000000000000;
  *((int64x2_t *)self + 25) = vdupq_n_s64(0xC00921FB54442D18);
  *((_OWORD *)self + 26) = 0u;
  *((_OWORD *)self + 27) = 0u;
  *((_QWORD *)self + 56) = 0;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 472) = 0u;
  *(_OWORD *)((char *)self + 488) = 0u;
  *((_QWORD *)self + 63) = 0x3FF0000000000000;
  *((_OWORD *)self + 32) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *((_OWORD *)self + 34) = 0u;
  *((_QWORD *)self + 70) = 0x3FF0000000000000;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *(_OWORD *)((char *)self + 600) = 0u;
  *((_QWORD *)self + 77) = 0x3FF0000000000000;
  *((_OWORD *)self + 39) = 0u;
  *((_OWORD *)self + 40) = 0u;
  *((_OWORD *)self + 41) = 0u;
  *((_QWORD *)self + 84) = 0x3FF0000000000000;
  *((_QWORD *)self + 85) = 0;
  *((_QWORD *)self + 86) = 0;
  *((_QWORD *)self + 87) = 0;
  *((_QWORD *)self + 88) = 0x3FF0000000000000;
  *((_QWORD *)self + 91) = 0;
  *((_QWORD *)self + 92) = 0;
  *((_QWORD *)self + 93) = 0;
  *((_QWORD *)self + 94) = 0x3FF0000000000000;
  *((_QWORD *)self + 95) = 0;
  *((_QWORD *)self + 96) = 0;
  return self;
}

void __81__VKARCameraController_trasitionToARModeFromCameraFrame_withDuration_completion___block_invoke(uint64_t a1, float a2)
{
  char *WeakRetained;
  id v5;
  double v6;
  double v7;
  double v8;
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
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float64x2_t v45;
  __int128 v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  double v50;
  double *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  long double v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  float64x2_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = *(id *)(*(_QWORD *)(a1 + 40) + 104);
    objc_msgSend(WeakRetained, "_transformFromARCamera:", v5);
    *((double *)WeakRetained + 74) = v62;
    *((double *)WeakRetained + 75) = v63;
    *((double *)WeakRetained + 76) = v64;
    *((double *)WeakRetained + 77) = v65;
    *(float64x2_t *)(WeakRetained + 568) = v60;
    *((double *)WeakRetained + 73) = v61;

    objc_msgSend(WeakRetained, "_updateBaseTransform");
    objc_msgSend(WeakRetained, "altitude");
    v7 = -v6 / md::ARContext::planeHeight(*(md::ARContext **)(a1 + 40));
    *((_QWORD *)WeakRetained + 67) = *((_QWORD *)WeakRetained + 74);
    *((_QWORD *)WeakRetained + 68) = *((_QWORD *)WeakRetained + 75);
    *((_QWORD *)WeakRetained + 69) = *((_QWORD *)WeakRetained + 76);
    *((_QWORD *)WeakRetained + 70) = *((_QWORD *)WeakRetained + 77);
    v8 = *((double *)WeakRetained + 67);
    v9 = *((double *)WeakRetained + 66) + (*((double *)WeakRetained + 73) - *((double *)WeakRetained + 80)) * v7;
    *((float64x2_t *)WeakRetained + 32) = vmlaq_n_f64(*((float64x2_t *)WeakRetained + 32), vsubq_f64(*(float64x2_t *)(WeakRetained + 568), *((float64x2_t *)WeakRetained + 39)), v7);
    *((double *)WeakRetained + 66) = v9;
    v11 = *((double *)WeakRetained + 48);
    v10 = *((double *)WeakRetained + 49);
    v13 = *((double *)WeakRetained + 59);
    v12 = *((double *)WeakRetained + 60);
    v14 = *((double *)WeakRetained + 61);
    v15 = *((double *)WeakRetained + 62);
    v16 = *((double *)WeakRetained + 63);
    v18 = *((double *)WeakRetained + 46);
    v17 = *((double *)WeakRetained + 47);
    v19 = v12 * v10 + v18 * v16 + v17 * v15 - v11 * v14;
    v20 = v17 * v16 - (v18 * v15 - v14 * v10) + v11 * v12;
    v21 = v15 * v10 + v18 * v14 - v17 * v12 + v11 * v16;
    v22 = -(v18 * v12 + v17 * v14 + v11 * v15 - v16 * v10);
    v24 = *((double *)WeakRetained + 57);
    v23 = *((double *)WeakRetained + 58);
    v25 = -(v23 * v11 - v13 * v17) - (v23 * v11 - v13 * v17);
    v26 = -(v13 * v18 - v24 * v11) - (v13 * v18 - v24 * v11);
    v27 = -(v24 * v17 - v23 * v18) - (v24 * v17 - v23 * v18);
    v28 = *((double *)WeakRetained + 68);
    v29 = *((double *)WeakRetained + 69);
    v30 = *((double *)WeakRetained + 70);
    v31 = v29 * v20 - (v28 * v21 - v8 * v22) + v30 * v19;
    v32 = v8 * v21 + v28 * v22 - v29 * v19 + v30 * v20;
    v33 = v29 * v22 - (v8 * v20 - v28 * v19) + v30 * v21;
    v34 = -(v8 * v19 + v28 * v20 + v29 * v21 - v30 * v22);
    v36 = *((double *)WeakRetained + 65);
    v35 = *((double *)WeakRetained + 66);
    v37 = *((double *)WeakRetained + 64);
    v38 = -(v36 * v21 - v35 * v20) - (v36 * v21 - v35 * v20);
    v39 = -(v35 * v19 - v37 * v21) - (v35 * v19 - v37 * v21);
    v40 = -(v37 * v20 - v36 * v19) - (v37 * v20 - v36 * v19);
    v41 = *((double *)WeakRetained + 44)
        + v23
        + v25 * v11
        + v26 * v10
        + v36
        + v38 * v21
        + v39 * v22
        - (v27 * v18
         + v40 * v19);
    v42 = *((double *)WeakRetained + 45) + v13 + v26 * v18;
    v60.f64[0] = *((double *)WeakRetained + 43)
               + v24
               + v25 * v10
               + v27 * v17
               + v37
               + v38 * v22
               + v40 * v20
               - (v26 * v11
                + v39 * v21);
    v60.f64[1] = v41;
    v43 = v42 + v27 * v10 + v35 + v39 * v19 + v40 * v22 - (v25 * v17 + v38 * v20);
    v61 = v43;
    v62 = v31;
    v63 = v32;
    v64 = v33;
    v65 = v34;
    v58 = *(_OWORD *)(a1 + 72);
    v59 = *(_OWORD *)(a1 + 88);
    gm::Quaternion<double>::slerp((double *)&v58, &v62, a2);
    v44 = *(double *)(a1 + 64) + (v43 - *(double *)(a1 + 64)) * a2;
    v45 = vmlaq_n_f64(*(float64x2_t *)(a1 + 48), vsubq_f64(v60, *(float64x2_t *)(a1 + 48)), a2);
    v46 = v59;
    v47 = *(_QWORD *)(a1 + 40);
    *(_OWORD *)(v47 + 40) = v58;
    *(_OWORD *)(v47 + 56) = v46;
    *(float64x2_t *)(v47 + 16) = v45;
    *(double *)(v47 + 32) = v44;
    v48 = *(double *)(a1 + 104) + (*((double *)WeakRetained + 42) - *(double *)(a1 + 104)) * a2;
    v49 = *((_QWORD *)WeakRetained + 36);
    *(double *)(v49 + 280) = v48;
    v50 = tan(v48 * 0.5);
    *(double *)(v49 + 288) = v50;
    v51 = *(double **)(v49 + 72);
    v53 = v51[46];
    v52 = v51[47];
    if (v52 < v53)
    {
      v54 = v52 * v53;
      v55 = v53 / v52;
      if (v54 <= 0.0)
        v55 = 1.0;
      v56 = atan(v55 * v50);
      v48 = v56 + v56;
    }
    v51[57] = v48;
    v57 = **(_QWORD **)(*(_QWORD *)(v49 + 856) + 88);
    if (v57)
    {
      LOBYTE(v58) = 7;
      md::MapEngine::setNeedsTick(v57, &v58);
    }
    *((_QWORD *)WeakRetained + 81) = *((_QWORD *)WeakRetained + 74);
    *((_QWORD *)WeakRetained + 82) = *((_QWORD *)WeakRetained + 75);
    *((_QWORD *)WeakRetained + 83) = *((_QWORD *)WeakRetained + 76);
    *((_QWORD *)WeakRetained + 84) = *((_QWORD *)WeakRetained + 77);
    *((_QWORD *)WeakRetained + 78) = *((_QWORD *)WeakRetained + 71);
    *((_QWORD *)WeakRetained + 79) = *((_QWORD *)WeakRetained + 72);
    *((_QWORD *)WeakRetained + 80) = *((_QWORD *)WeakRetained + 73);
  }

}

void __81__VKARCameraController_trasitionToARModeFromCameraFrame_withDuration_completion___block_invoke_15(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateBaseTransform");
    objc_msgSend(v5, "_updateARContext");
    WeakRetained = v5;
    if (a2)
    {
      v4 = (void *)v5[89];
      v5[89] = 0;

      WeakRetained = v5;
    }
  }

}

void __66__VKARCameraController__setupPounceAnimation_duration_completion___block_invoke(uint64_t a1, float a2)
{
  char *WeakRetained;
  double v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  float v13;
  void *v14;
  float v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  float64x2_t *v19;
  float v20;
  double v21;
  double v22;
  long double v23;
  long double v24;
  long double v25;
  long double v26;
  double v27;
  float64x2_t v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  float64x2_t v69;
  __int128 v70;
  uint64_t v71;
  double v72;
  uint64_t v73;
  double v74;
  double *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  long double v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  float64x2_t *v87;
  float v88;
  double v89;
  double v90;
  long double v91;
  long double v92;
  long double v93;
  long double v94;
  double v95;
  float64x2_t v96;
  uint64_t v97;
  float64x2_t v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  double v104;
  double v105;
  double v106;
  __int128 v107;
  __int128 v108;
  float64x2_t v109;
  double v110;
  double v111[5];
  float64x2_t v112;
  _BYTE v113[40];
  uint64_t v114;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (vabdd_f64(1.0, v5) > 0.00001)
    {
      v6 = *(id *)(*(_QWORD *)(a1 + 56) + 104);
      objc_msgSend(v6, "currentFrame");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = a2;
      v8 = (a2 - v5) / (1.0 - v5);

      if (v7)
      {
        objc_msgSend(v7, "camera");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "eulerAngles");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 80) = fmin(fmax(v10 + 1.57079633, *(double *)(a1 + 64)), *(double *)(a1 + 72));

        v11 = *(double *)(a1 + 120);
        objc_msgSend(v7, "camera");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "eulerAngles");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 88) = v11 + v13;

        objc_msgSend(v7, "camera");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "eulerAngles");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 96) = v15;

        v16 = *((double *)WeakRetained + 40);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        *(long double *)(v17 + 72) = v16 / cos(*(long double *)(v17 + 80));
        v18 = *((_QWORD *)WeakRetained + 36);
        v114 = 0;
        v112 = *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
        if (!altitude::IntersectorHeight::heightAtLatLon(*(_QWORD *)(v18 + 712), v112.f64, (double *)&v114, 0xEu))*((_QWORD *)WeakRetained + 41) = v114;
        v19 = *(float64x2_t **)(*(_QWORD *)(a1 + 40) + 8);
        v20 = v8;
        v21 = *((double *)WeakRetained + 54);
        v22 = *((double *)WeakRetained + 55);
        v104 = v20;
        v23 = fmod(3.14159265 - v22 + v19[5].f64[1], 6.28318531);
        v24 = fmod(v23 + 6.28318531, 6.28318531);
        v25 = fmod(v22 + (v24 + -3.14159265) * v104, 6.28318531);
        v26 = fmod(v25 + 6.28318531, 6.28318531);
        v27 = v21 + (v19[5].f64[0] - v21) * v104;
        v28 = vmlaq_n_f64(*((float64x2_t *)WeakRetained + 26), vsubq_f64(v19[4], *((float64x2_t *)WeakRetained + 26)), v104);
        *((float64x2_t *)WeakRetained + 25) = vmlaq_n_f64(*((float64x2_t *)WeakRetained + 25), vsubq_f64(v19[3], *((float64x2_t *)WeakRetained + 25)), v104);
        *((float64x2_t *)WeakRetained + 26) = v28;
        *((double *)WeakRetained + 54) = v27;
        *((long double *)WeakRetained + 55) = v26;
        v29 = *(id *)(*(_QWORD *)(a1 + 56) + 104);
        objc_msgSend(WeakRetained, "_transformFromARCamera:", v29);
        *((_QWORD *)WeakRetained + 74) = *(_QWORD *)&v113[8];
        *((_QWORD *)WeakRetained + 75) = *(_QWORD *)&v113[16];
        *((_OWORD *)WeakRetained + 38) = *(_OWORD *)&v113[24];
        *(float64x2_t *)(WeakRetained + 568) = v112;
        *((_QWORD *)WeakRetained + 73) = *(_QWORD *)v113;

        objc_msgSend(WeakRetained, "_updateBaseTransform");
        objc_msgSend(WeakRetained, "altitude", gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v112.f64, (double *)WeakRetained + 50));
        v31 = -v30 / md::ARContext::planeHeight(*(md::ARContext **)(a1 + 56));
        *((_QWORD *)WeakRetained + 67) = *((_QWORD *)WeakRetained + 74);
        *((_QWORD *)WeakRetained + 68) = *((_QWORD *)WeakRetained + 75);
        *((_QWORD *)WeakRetained + 69) = *((_QWORD *)WeakRetained + 76);
        *((_QWORD *)WeakRetained + 70) = *((_QWORD *)WeakRetained + 77);
        v32 = *((double *)WeakRetained + 67);
        v33 = *((double *)WeakRetained + 66) + (*((double *)WeakRetained + 73) - *((double *)WeakRetained + 80)) * v31;
        *((float64x2_t *)WeakRetained + 32) = vmlaq_n_f64(*((float64x2_t *)WeakRetained + 32), vsubq_f64(*(float64x2_t *)(WeakRetained + 568), *((float64x2_t *)WeakRetained + 39)), v31);
        *((double *)WeakRetained + 66) = v33;
        v35 = *((double *)WeakRetained + 48);
        v34 = *((double *)WeakRetained + 49);
        v37 = *((double *)WeakRetained + 59);
        v36 = *((double *)WeakRetained + 60);
        v38 = *((double *)WeakRetained + 61);
        v39 = *((double *)WeakRetained + 62);
        v40 = *((double *)WeakRetained + 63);
        v42 = *((double *)WeakRetained + 46);
        v41 = *((double *)WeakRetained + 47);
        v43 = v36 * v34 + v42 * v40 + v41 * v39 - v35 * v38;
        v44 = v41 * v40 - (v42 * v39 - v38 * v34) + v35 * v36;
        v45 = v39 * v34 + v42 * v38 - v41 * v36 + v35 * v40;
        v46 = -(v42 * v36 + v41 * v38 + v35 * v39 - v40 * v34);
        v48 = *((double *)WeakRetained + 57);
        v47 = *((double *)WeakRetained + 58);
        v49 = -(v47 * v35 - v37 * v41) - (v47 * v35 - v37 * v41);
        v50 = -(v37 * v42 - v48 * v35) - (v37 * v42 - v48 * v35);
        v51 = -(v48 * v41 - v47 * v42) - (v48 * v41 - v47 * v42);
        v52 = *((double *)WeakRetained + 68);
        v53 = *((double *)WeakRetained + 69);
        v54 = *((double *)WeakRetained + 70);
        v55 = v53 * v44 - (v52 * v45 - v32 * v46) + v54 * v43;
        v56 = v32 * v45 + v52 * v46 - v53 * v43 + v54 * v44;
        v57 = v53 * v46 - (v32 * v44 - v52 * v43) + v54 * v45;
        v58 = -(v32 * v43 + v52 * v44 + v53 * v45 - v54 * v46);
        v60 = *((double *)WeakRetained + 65);
        v59 = *((double *)WeakRetained + 66);
        v61 = *((double *)WeakRetained + 64);
        v62 = -(v60 * v45 - v59 * v44) - (v60 * v45 - v59 * v44);
        v63 = -(v59 * v43 - v61 * v45) - (v59 * v43 - v61 * v45);
        v64 = -(v61 * v44 - v60 * v43) - (v61 * v44 - v60 * v43);
        v65 = *((double *)WeakRetained + 44)
            + v47
            + v49 * v35
            + v50 * v34
            + v60
            + v62 * v45
            + v63 * v46
            - (v51 * v42
             + v64 * v43);
        v66 = *((double *)WeakRetained + 45) + v37 + v50 * v42;
        v109.f64[0] = *((double *)WeakRetained + 43)
                    + v48
                    + v49 * v34
                    + v51 * v41
                    + v61
                    + v62 * v46
                    + v64 * v44
                    - (v50 * v35
                     + v63 * v45);
        v109.f64[1] = v65;
        v67 = v66 + v51 * v34 + v59 + v63 * v43 + v64 * v46 - (v49 * v41 + v62 * v44);
        v110 = v67;
        v111[0] = v55;
        v111[1] = v56;
        v111[2] = v57;
        v111[3] = v58;
        v107 = *(_OWORD *)&v113[8];
        v108 = *(_OWORD *)&v113[24];
        gm::Quaternion<double>::slerp((double *)&v107, v111, v106);
        v68 = *(double *)v113 + (v67 - *(double *)v113) * v106;
        v69 = vmlaq_n_f64(v112, vsubq_f64(v109, v112), v106);
        v70 = v108;
        v71 = *(_QWORD *)(a1 + 56);
        *(_OWORD *)(v71 + 40) = v107;
        *(_OWORD *)(v71 + 56) = v70;
        *(float64x2_t *)(v71 + 16) = v69;
        *(double *)(v71 + 32) = v68;
        v72 = *(double *)(a1 + 136) + (*((double *)WeakRetained + 42) - *(double *)(a1 + 136)) * v106;
        v73 = *((_QWORD *)WeakRetained + 36);
        *(double *)(v73 + 280) = v72;
        v74 = tan(v72 * 0.5);
        *(double *)(v73 + 288) = v74;
        v75 = *(double **)(v73 + 72);
        v77 = v75[46];
        v76 = v75[47];
        if (v76 < v77)
        {
          v78 = v76 * v77;
          v79 = v77 / v76;
          if (v78 <= 0.0)
            v79 = 1.0;
          v80 = atan(v79 * v74);
          v72 = v80 + v80;
        }
        v75[57] = v72;
        v81 = **(_QWORD **)(*(_QWORD *)(v73 + 856) + 88);
        if (v81)
        {
          LOBYTE(v107) = 7;
          md::MapEngine::setNeedsTick(v81, &v107);
        }
        v82 = *((_QWORD *)WeakRetained + 36);
        v83 = *(_QWORD *)(v82 + 72);
        v84 = *((_OWORD *)WeakRetained + 25);
        v85 = *((_OWORD *)WeakRetained + 26);
        v86 = *((_OWORD *)WeakRetained + 27);
        *(_QWORD *)(v83 + 56) = *((_QWORD *)WeakRetained + 56);
        *(_OWORD *)(v83 + 40) = v86;
        *(_OWORD *)(v83 + 24) = v85;
        *(_OWORD *)(v83 + 8) = v84;
        ++*(_DWORD *)(v82 + 376);
        *((_QWORD *)WeakRetained + 81) = *((_QWORD *)WeakRetained + 74);
        *((_QWORD *)WeakRetained + 82) = *((_QWORD *)WeakRetained + 75);
        *((_QWORD *)WeakRetained + 83) = *((_QWORD *)WeakRetained + 76);
        *((_QWORD *)WeakRetained + 84) = *((_QWORD *)WeakRetained + 77);
        *((_QWORD *)WeakRetained + 78) = *((_QWORD *)WeakRetained + 71);
        *((_QWORD *)WeakRetained + 79) = *((_QWORD *)WeakRetained + 72);
        *((_QWORD *)WeakRetained + 80) = *((_QWORD *)WeakRetained + 73);
      }
      else
      {
        v87 = *(float64x2_t **)(*(_QWORD *)(a1 + 40) + 8);
        v88 = v8;
        v89 = *((double *)WeakRetained + 54);
        v90 = *((double *)WeakRetained + 55);
        v105 = v88;
        v91 = fmod(3.14159265 - v90 + v87[5].f64[1], 6.28318531);
        v92 = fmod(v91 + 6.28318531, 6.28318531);
        v93 = fmod(v90 + (v92 + -3.14159265) * v105, 6.28318531);
        v94 = fmod(v93 + 6.28318531, 6.28318531);
        v95 = v89 + (v87[5].f64[0] - v89) * v105;
        v96 = vmlaq_n_f64(*((float64x2_t *)WeakRetained + 26), vsubq_f64(v87[4], *((float64x2_t *)WeakRetained + 26)), v105);
        *((float64x2_t *)WeakRetained + 25) = vmlaq_n_f64(*((float64x2_t *)WeakRetained + 25), vsubq_f64(v87[3], *((float64x2_t *)WeakRetained + 25)), v105);
        *((float64x2_t *)WeakRetained + 26) = v96;
        *((double *)WeakRetained + 54) = v95;
        *((long double *)WeakRetained + 55) = v94;
        v97 = *(_QWORD *)(a1 + 56);
        gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v112.f64, (double *)WeakRetained + 50);
        v98 = v112;
        *(_OWORD *)(v97 + 48) = *(_OWORD *)&v113[16];
        *(_QWORD *)(v97 + 64) = *(_QWORD *)&v113[32];
        *(float64x2_t *)(v97 + 16) = v98;
        *(_OWORD *)(v97 + 32) = *(_OWORD *)v113;
        v99 = *((_QWORD *)WeakRetained + 36);
        v100 = *(_QWORD *)(v99 + 72);
        v102 = *((_OWORD *)WeakRetained + 26);
        v101 = *((_OWORD *)WeakRetained + 27);
        v103 = *((_QWORD *)WeakRetained + 56);
        *(_OWORD *)(v100 + 8) = *((_OWORD *)WeakRetained + 25);
        *(_QWORD *)(v100 + 56) = v103;
        *(_OWORD *)(v100 + 40) = v101;
        *(_OWORD *)(v100 + 24) = v102;
        ++*(_DWORD *)(v99 + 376);
      }
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v106;

    }
  }

}

void __66__VKARCameraController__setupPounceAnimation_duration_completion___block_invoke_13(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_OWORD *)(v4 + 64);
    v5 = *(_OWORD *)(v4 + 80);
    v7 = *(_OWORD *)(v4 + 48);
    *((_QWORD *)WeakRetained + 56) = *(_QWORD *)(v4 + 96);
    *((_OWORD *)WeakRetained + 26) = v6;
    *((_OWORD *)WeakRetained + 27) = v5;
    *((_OWORD *)WeakRetained + 25) = v7;
    v8 = *((_QWORD *)WeakRetained + 36);
    v9 = *(_QWORD *)(v8 + 72);
    v11 = *(_OWORD *)(v4 + 64);
    v10 = *(_OWORD *)(v4 + 80);
    v12 = *(_QWORD *)(v4 + 96);
    *(_OWORD *)(v9 + 8) = *(_OWORD *)(v4 + 48);
    *(_QWORD *)(v9 + 56) = v12;
    *(_OWORD *)(v9 + 40) = v10;
    *(_OWORD *)(v9 + 24) = v11;
    ++*(_DWORD *)(v8 + 376);
    altitude::GlobeView::setPerspective(*((_QWORD *)WeakRetained + 36), (double *)WeakRetained + 42);
    objc_msgSend(WeakRetained, "_updateBaseTransform");
    objc_msgSend(WeakRetained, "_updateARContext");
    if ((_DWORD)a2)
    {
      v13 = (void *)*((_QWORD *)WeakRetained + 89);
      *((_QWORD *)WeakRetained + 89) = 0;

    }
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, a2);
  }

}

@end
