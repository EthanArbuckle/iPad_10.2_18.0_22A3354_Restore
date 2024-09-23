@implementation VKDaVinciAnnotationTrackingCameraController

- (double)_zoomLevelForDistance:()Unit<geo:(double>)a3 :MeterUnitDescription
{
  double *v3;
  double *v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  long double v11;
  long double v12;
  double v13;
  double v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  void *v17;
  double v18;
  double v19;
  long double v20;
  float v21;
  float v22;
  float v23;
  double *v25;
  std::__shared_weak_count *v26;

  v4 = v3;
  -[VKCameraController camera](self, "camera", a3._value);
  v6 = v25[46];
  v7 = v25[47];
  if (v6 >= v7)
  {
    v13 = v25[57];
  }
  else
  {
    v8 = v7 * v6;
    v9 = v6 / v7;
    if (v8 <= 0.0)
      v10 = 1.0;
    else
      v10 = v9;
    v11 = tan(v25[57] * 0.5);
    v12 = atan(v10 * v11);
    v13 = v12 + v12;
  }
  v14 = *v4;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)())v26->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  -[VKCameraController canvas](self, "canvas");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  v19 = v18;
  v20 = tan(v13 * 0.5);
  v21 = log2(v20 * (0.0000000499064043 * v14));
  v22 = fminf(fmaxf(-v21, 1.0), 25.0);
  v23 = 512.0 / v19;
  LODWORD(v19) = log2f(v23);

  return (float)(v22 + *(float *)&v19);
}

- (double)_minTrackingCameraDistance:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  float v7;
  double idealCenterCoordinateDistance;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  long double v14;
  long double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  int v22;
  unint64_t *v23;
  unint64_t v24;
  double v25;
  unint64_t *v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  long double v33;
  long double v34;
  double v35;
  double v36;
  long double v37;
  double v38;
  double v39;
  unint64_t *v40;
  unint64_t v41;
  double v42;
  unint64_t *v43;
  unint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  double v47;
  double v49;
  unint64_t *v50;
  unint64_t v51;
  uint64_t v53;
  std::__shared_weak_count *v54;
  uint64_t v55;
  std::__shared_weak_count *v56;

  v3 = a3;
  -[VKCameraController canvas](self, "canvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  *(float *)&v6 = 512.0 / v6;
  v7 = log2f(*(float *)&v6);

  idealCenterCoordinateDistance = self->super._behavior.idealCenterCoordinateDistance;
  if (idealCenterCoordinateDistance < 0.0)
  {
    -[VKCameraController camera](self, "camera");
    v9 = *(double *)(v55 + 368);
    v10 = *(double *)(v55 + 376);
    if (v9 >= v10)
    {
      v16 = *(double *)(v55 + 456);
    }
    else
    {
      v11 = v10 * v9;
      v12 = v9 / v10;
      if (v11 <= 0.0)
        v13 = 1.0;
      else
        v13 = v12;
      v14 = tan(*(double *)(v55 + 456) * 0.5);
      v15 = atan(v13 * v14);
      v16 = v15 + v15;
    }
    v17 = tan(v16 * 0.5);
    v18 = v17 + v17;
    v19 = exp2((float)(-14.0 - v7)) * 40075017.0;
    if (v56)
    {
      p_shared_owners = (unint64_t *)&v56->__shared_owners_;
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
      {
        ((void (*)())v56->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v56);
      }
    }
    idealCenterCoordinateDistance = v19 / v18;
  }
  -[VKCameraController camera](self, "camera");
  v22 = *(unsigned __int8 *)(v55 + 336);
  if (v56)
  {
    v23 = (unint64_t *)&v56->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)())v56->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  if (v22)
  {
    -[VKCameraController camera](self, "camera");
    v25 = *(double *)(v55 + 344);
    if (v56)
    {
      v26 = (unint64_t *)&v56->__shared_owners_;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)())v56->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v56);
      }
    }
  }
  else
  {
    -[VKCameraController camera](self, "camera");
    v28 = *(double *)(v55 + 368);
    v29 = *(double *)(v55 + 376);
    if (v28 >= v29)
    {
      v35 = *(double *)(v55 + 456);
    }
    else
    {
      v30 = v29 * v28;
      v31 = v28 / v29;
      if (v30 <= 0.0)
        v32 = 1.0;
      else
        v32 = v31;
      v33 = tan(*(double *)(v55 + 456) * 0.5);
      v34 = atan(v32 * v33);
      v35 = v34 + v34;
    }
    v36 = tan(v35 * 0.5);
    v37 = exp2((float)(-20.0 - v7));
    v38 = v36 + v36;
    v39 = v37 * 40075017.0;
    if (v56)
    {
      v40 = (unint64_t *)&v56->__shared_owners_;
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
      {
        ((void (*)())v56->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v56);
      }
    }
    v25 = v39 / v38;
  }
  -[VKCameraController camera](self, "camera");
  v42 = v25;
  if (*(double *)(v55 + 104) > v25)
  {
    -[VKCameraController camera](self, "camera");
    v42 = *(double *)(v53 + 104);
    if (v54)
    {
      v43 = (unint64_t *)&v54->__shared_owners_;
      do
        v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        ((void (*)())v54->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v54);
      }
    }
  }
  if (v56)
  {
    v45 = (unint64_t *)&v56->__shared_owners_;
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)())v56->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v56);
    }
  }
  v47 = fmin(fmax(idealCenterCoordinateDistance, v25), v42);
  if (self->super._behavior.shouldPreserveUserSpecifiedZoomLevel && self->super._hasUserSpecifiedZoomLevel && v3)
  {
    -[VKCameraController camera](self, "camera");
    v49 = *(double *)(v55 + 32);
    if (v56)
    {
      v50 = (unint64_t *)&v56->__shared_owners_;
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)())v56->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v56);
      }
    }
    return fmin(v49, v47);
  }
  return v47;
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  float right;
  float bottom;
  float left;
  float top;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  void *v58;
  float64x2_t v59;
  double v60;
  double v61;
  uint64_t *p_shared_owners;
  unint64_t v63;
  void *v64;
  float64x2_t v65;
  unint64_t *v66;
  unint64_t v67;
  double v68;
  double v69;
  __double2 v70;
  double v71;
  double v72;
  __double2 v73;
  std::__shared_weak_count *v74;
  double v75;
  __double2 v76;
  double v77;
  double v78;
  __double2 v79;
  double v80;
  double v81;
  double v82;
  float64x2_t v83;
  float64x2_t v84;
  uint64_t v85;
  std::__shared_weak_count *v86;
  double v87;
  std::__shared_weak_count *v88;
  double v89;
  double v90[3];
  objc_super v91;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[VKDaVinciAnnotationTrackingCameraController _effectiveEdgeInsets](self, "_effectiveEdgeInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v91.receiver = self;
  v91.super_class = (Class)VKDaVinciAnnotationTrackingCameraController;
  *(float *)&v16 = top;
  *(float *)&v17 = left;
  *(float *)&v18 = bottom;
  *(float *)&v19 = right;
  -[VKCameraController setEdgeInsets:](&v91, sel_setEdgeInsets_, v16, v17, v18, v19);
  if (self->super._currentAnimation)
  {
    -[VKDaVinciAnnotationTrackingCameraController _effectiveEdgeInsets](self, "_effectiveEdgeInsets");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[VKCameraController canvas](self, "canvas");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "size");
    v30 = v29;
    v32 = v31;
    LODWORD(v29) = v9;
    LODWORD(v31) = v11;
    LODWORD(v33) = v13;
    LODWORD(v34) = v15;
    -[VKDaVinciAnnotationTrackingCameraController _scaledEdgeInsets:withCanvasSize:](self, "_scaledEdgeInsets:withCanvasSize:", v29, v31, v33, v34, v30, v32);
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;

    -[VKCameraController canvas](self, "canvas");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "size");
    v45 = v44;
    v47 = v46;
    LODWORD(v44) = v21;
    LODWORD(v46) = v23;
    LODWORD(v48) = v25;
    LODWORD(v49) = v27;
    -[VKDaVinciAnnotationTrackingCameraController _scaledEdgeInsets:withCanvasSize:](self, "_scaledEdgeInsets:withCanvasSize:", v44, v46, v48, v49, v45, v47);
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;

    v58 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
    v59.f64[0] = (float)(v38 - v42) + 0.5;
    v59.f64[1] = (float)(v40 - v36) + 0.5;
    v83 = v59;
    -[VKCameraController camera](self, "camera");
    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)v90, (uint64_t)v58, *(_QWORD *)&v87 + 8, 0, v83);
    v60 = (float)(v53 - v57);
    v61 = (float)(v55 - v51);
    if (v88)
    {
      p_shared_owners = &v88->__shared_owners_;
      do
        v63 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v63 - 1, (unint64_t *)p_shared_owners));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
        std::__shared_weak_count::__release_weak(v88);
      }
    }
    v64 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
    v65.f64[0] = v60 + 0.5;
    v65.f64[1] = v61 + 0.5;
    v84 = v65;
    -[VKCameraController camera](self, "camera");
    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v87, (uint64_t)v64, v85 + 8, 0, v84);
    if (v86)
    {
      v66 = (unint64_t *)&v86->__shared_owners_;
      do
        v67 = __ldaxr(v66);
      while (__stlxr(v67 - 1, v66));
      if (!v67)
      {
        ((void (*)())v86->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v86);
      }
    }
    v68 = v90[1];
    v69 = v90[2];
    v70 = __sincos_stret(v90[0]);
    v71 = 6378137.0 / sqrt(1.0 - v70.__sinval * v70.__sinval * 0.00669437999);
    v72 = (v71 + v69) * v70.__cosval;
    v73 = __sincos_stret(v68);
    v82 = v69 + v71 * 0.99330562;
    v74 = v88;
    v75 = v89;
    v76 = __sincos_stret(v87);
    v77 = 6378137.0 / sqrt(1.0 - v76.__sinval * v76.__sinval * 0.00669437999);
    v78 = (v77 + v75) * v76.__cosval;
    v79 = __sincos_stret(*(double *)&v74);
    v80 = self->super._currentAnimationEndCameraPosition._e[1] + v72 * v73.__sinval - v78 * v79.__sinval;
    v81 = self->super._currentAnimationEndCameraPosition._e[2]
        + v82 * v70.__sinval
        - (v75 + v77 * 0.99330562) * v76.__sinval;
    self->super._currentAnimationEndCameraPosition._e[0] = self->super._currentAnimationEndCameraPosition._e[0]
                                                         + v72 * v73.__cosval
                                                         - v78 * v79.__cosval;
    self->super._currentAnimationEndCameraPosition._e[1] = v80;
    self->super._currentAnimationEndCameraPosition._e[2] = v81;
  }
  else
  {
    -[VKDaVinciAnnotationTrackingCameraController _goToAnnotationAnimated:duration:timingFunction:isInitial:](self, "_goToAnnotationAnimated:duration:timingFunction:isInitial:", 0, 0, 0, 0.0);
  }
}

- (Coordinate3D<geo::Radians,)_centerCoordinate:()Coordinate3D<geo:(double>)a3 :(VKEdgeInsets)a4 Radians forEdgeInsets:
{
  double *v4;
  double *v5;
  float top;
  int value_low;
  int v8;
  int v9;
  double *v10;
  double *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  double v28;
  double v29;
  __int128 v30;
  uint64_t *p_shared_owners;
  unint64_t v32;
  void *v33;
  float64x2_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  std::__shared_weak_count *v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  Coordinate3D<geo::Radians, double> result;

  top = a4.top;
  value_low = LODWORD(a3.altitude._value);
  v8 = LODWORD(a3.longitude._value);
  v9 = LODWORD(a3.latitude._value);
  v10 = v4;
  v12 = v5;
  -[VKCameraController canvas](self, "canvas", a3.latitude._value, a3.longitude._value, a3.altitude._value, *(double *)&a4.top, *(double *)&a4.left, *(double *)&a4.bottom, *(double *)&a4.right);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  v15 = v14;
  v17 = v16;
  LODWORD(v14) = v9;
  LODWORD(v16) = v8;
  LODWORD(v18) = value_low;
  *(float *)&v19 = top;
  -[VKDaVinciAnnotationTrackingCameraController _scaledEdgeInsets:withCanvasSize:](self, "_scaledEdgeInsets:withCanvasSize:", v14, v16, v18, v19, v15, v17);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = (float)(v23 - v27);
  v29 = (float)(v25 - v21);
  -[VKCameraController camera](self, "camera");
  v30 = *(_OWORD *)(*(_QWORD *)&v38 + 24);
  v41 = *(_OWORD *)(*(_QWORD *)&v38 + 8);
  v42 = v30;
  v43 = *(_OWORD *)(*(_QWORD *)&v38 + 40);
  v44 = *(_QWORD *)(*(_QWORD *)&v38 + 56);
  if (*(double *)&v39 != 0.0)
  {
    p_shared_owners = &v39->__shared_owners_;
    do
      v32 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v32 - 1, (unint64_t *)p_shared_owners));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  v41 = *(_OWORD *)v10;
  *(double *)&v42 = v10[2];
  v33 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
  v34.f64[0] = v28 + 0.5;
  v34.f64[1] = v29 + 0.5;
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v38, (uint64_t)v33, (uint64_t)&v41, 0, v34);
  v35 = v40;
  v36 = *v10;
  if (v38 == -3.14159265 && *(double *)&v39 == -3.14159265 && v40 == 0.0)
  {
    v37 = v10[1];
    v35 = v10[2];
  }
  else
  {
    v36 = -(v38 + v36 * -2.0);
    v37 = v10[1] - *(double *)&v39 + v10[1];
  }
  *v12 = v36;
  v12[1] = v37;
  v12[2] = v35;
  result.altitude = *(Unit<geo::MeterUnitDescription, double> *)&v37;
  result.longitude = *(Unit<geo::RadianUnitDescription, double> *)&v36;
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)&v35;
  return result;
}

- (VKEdgeInsets)_scaledEdgeInsets:(VKEdgeInsets)a3 withCanvasSize:(CGSize)a4
{
  CGFloat v4;
  CGFloat v5;
  float v6;
  float v7;
  float v8;
  float v9;
  VKEdgeInsets result;

  v4 = a4.height + a4.height;
  v5 = a4.width + a4.width;
  v6 = a3.top / v4;
  v7 = a3.left / v5;
  v8 = a3.bottom / v4;
  v9 = a3.right / v5;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (VKEdgeInsets)_effectiveEdgeInsets
{
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
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  VKEdgeInsets result;

  -[VKCameraController edgeInsets](self, "edgeInsets");
  v4 = v3;
  -[VKTrackableAnnotationPresentation annotationTrackingEdgeInsets](self->super._annotationPresentation, "annotationTrackingEdgeInsets");
  v6 = v5 + v4;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v8 = v7;
  -[VKTrackableAnnotationPresentation annotationTrackingEdgeInsets](self->super._annotationPresentation, "annotationTrackingEdgeInsets");
  v10 = v9 + v8;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v12 = v11;
  -[VKTrackableAnnotationPresentation annotationTrackingEdgeInsets](self->super._annotationPresentation, "annotationTrackingEdgeInsets");
  v14 = v13 + v12;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v16 = v15;
  -[VKTrackableAnnotationPresentation annotationTrackingEdgeInsets](self->super._annotationPresentation, "annotationTrackingEdgeInsets");
  v18 = v17 + v16;
  v19 = v6;
  v20 = v10;
  v21 = v14;
  result.right = v18;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (void)updateFramerate
{
  RunLoopController *v3;
  uint64_t v4;
  uint64_t var0;
  objc_super v6;

  if (LOBYTE(self->_currentAnimationCompletedFraction))
  {
    v3 = -[VKCameraController runLoopController](self, "runLoopController");
    v4 = -[VKCameraController maxDisplayRate](self, "maxDisplayRate");
    v3->var1 = v4;
    var0 = (uint64_t)v3->var0;
    if (v3->var0)
    {
      if (!**(_BYTE **)(var0 + 1056))
        md::MapEngine::setDisplayRate(var0, v4);
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VKDaVinciAnnotationTrackingCameraController;
    -[VKAnnotationTrackingCameraController updateFramerate](&v6, sel_updateFramerate);
  }
}

- (void)_goToAnnotationAnimated:(BOOL)a3 duration:(double)a4 timingFunction:(id)a5 isInitial:(BOOL)a6
{
  _BOOL4 v6;
  int v8;
  id v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  VKTimedAnimation *currentAnimation;
  __int16 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  float v43;
  VKTimedAnimation *v44;
  __int16 v45;
  _BOOL4 v46;
  double v47;
  double v48;
  _BOOL8 v49;
  _BOOL4 v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  std::__shared_weak_count *v61;
  uint64_t *v62;
  unint64_t v63;
  double v64;
  BOOL v65;
  char v66;
  BOOL v67;
  int v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  int v80;
  void (**v81)(_QWORD, _QWORD);
  double v82;
  double v83;
  double v84;
  double *v85;
  std::__shared_weak_count *v86;
  uint64_t *v87;
  unint64_t v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  void *v92;
  uint64_t v93;
  double v94;
  VKTrackableAnnotationPresentation *v95;
  VKTrackableAnnotationPresentation *v96;
  double v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  double v104;
  double *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  long double v112;
  long double v113;
  double v114;
  long double v115;
  float v116;
  double v117;
  double v118;
  std::__shared_weak_count *v119;
  uint64_t *v120;
  unint64_t v121;
  VKTimedAnimation *v122;
  VKTimedAnimation *v123;
  uint64_t *v124;
  uint64_t v125;
  id v126;
  double v127;
  double v128;
  double v129;
  uint64_t v130;
  uint64_t v131;
  double v132;
  VKTrackableAnnotationPresentation *v133;
  VKTrackableAnnotationPresentation *v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  long double v145;
  long double v146;
  double v147;
  long double v148;
  uint64_t *p_shared_owners;
  unint64_t v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  long double v156;
  long double v157;
  double v158;
  uint64_t *v159;
  unint64_t v160;
  double v161;
  double v162;
  void *v163;
  double v164;
  double v165;
  void *v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  long double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  VKTrackableAnnotationPresentation *annotationPresentation;
  double v185;
  int v186;
  float v187;
  double v188;
  double v189;
  double v190;
  uint64_t *v191;
  float v192;
  float v193;
  float v194;
  float v195;
  __int128 v196;
  id v197;
  _QWORD v198[5];
  VKTrackableAnnotationPresentation *v199;
  void (**v200)(_QWORD, _QWORD);
  id v201;
  __int128 v202;
  double v203;
  double v204;
  BOOL v205;
  BOOL v206;
  _QWORD v207[4];
  VKTrackableAnnotationPresentation *v208;
  id v209[2];
  __int128 v210;
  double v211;
  uint64_t v212;
  double v213;
  uint64_t v214;
  double v215;
  char v216;
  BOOL v217;
  char v218;
  double v219;
  uint64_t v220;
  _QWORD v221[5];
  char v222;
  double v223;
  uint64_t v224;
  id location;
  std::__shared_weak_count *v226;
  __int128 v227;
  uint64_t v228;
  __int128 v229;
  double v230;

  v6 = a6;
  v8 = a3;
  v10 = a5;
  if (self->super._annotation)
  {
    v197 = v10;
    -[VKCameraController camera](self, "camera");
    v11 = v229;
    if (*((_QWORD *)&v229 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v229 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v229 + 1) + 16))(*((_QWORD *)&v229 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v229 + 1));
      }
    }
    v14 = *(double *)(v229 + 32);
    -[VKCameraController canvas](self, "canvas");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v16;
    v19 = v18;

    -[VKDaVinciAnnotationTrackingCameraController _effectiveEdgeInsets](self, "_effectiveEdgeInsets");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[VKDaVinciAnnotationTrackingCameraController _scaledEdgeInsets:withCanvasSize:](self, "_scaledEdgeInsets:withCanvasSize:");
    v187 = v21;
    v190 = v14;
    v192 = v29;
    v193 = v28;
    v194 = v31;
    v195 = v30;
    -[VKTrackableAnnotation coordinate](self->super._annotation, "coordinate");
    v188 = v33;
    v189 = v32;
    -[VKTrackableAnnotation coordinate](self->super._annotation, "coordinate");
    v35 = v34;
    -[VKTrackableAnnotation coordinate](self->super._annotation, "coordinate");
    *(double *)&v227 = v35 * 0.0174532925;
    *((double *)&v227 + 1) = v36 * 0.0174532925;
    v228 = 0;
    v230 = 0.0;
    v229 = v227;
    currentAnimation = self->super._currentAnimation;
    v38 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
    if (!currentAnimation && (v38 & 2) == 0)
    {
      v39 = 0.0;
      goto LABEL_13;
    }
    if ((v38 & 0x12) == 0)
    {
      v40 = a4;
      -[VKTimedAnimation duration](currentAnimation, "duration");
      v42 = v41;
      v43 = *((float *)&self->super._elevationLogic + 1);
      -[VKAnimation stop](self->super._currentAnimation, "stop");
      v39 = v42 * (float)(1.0 - v43);
      v44 = self->super._currentAnimation;
      self->super._currentAnimation = 0;

      v38 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
      a4 = v40;
LABEL_13:
      annotationPresentation = self->super._annotationPresentation;
      if (v6)
        v45 = 16;
      else
        v45 = 0;
      *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v38 & 0xFFEF | v45;
      v46 = -[VKAnnotationTrackingCameraController shouldForceZoomToFit](self, "shouldForceZoomToFit");
      v191 = (uint64_t *)(v11 + 8);
      gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16), (double *)&v227, (uint64_t *)(v11 + 8));
      if (v47 >= v17 * -16.0)
      {
        v50 = v47 < v17 * 33.0;
        if (v48 < v19 * -16.0)
          v50 = 0;
        v49 = v48 < v19 * 33.0 && v50;
      }
      else
      {
        v49 = 0;
      }
      -[VKDaVinciAnnotationTrackingCameraController _minTrackingCameraDistance:](self, "_minTrackingCameraDistance:", v49);
      v52 = v51;
      v185 = 0.0;
      if ((*(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) & 0x80) != 0)
      {
        -[VKCameraController canvas](self, "canvas");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "size");
        if (v54 <= 0.0)
        {

        }
        else
        {
          -[VKCameraController canvas](self, "canvas");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "size");
          v57 = v56;

          if (v57 > 0.0)
          {
            -[VKTrackableAnnotation accuracy](self->super._annotation, "accuracy");
            v186 = 0;
            v185 = 0.0;
            if (v8 && !v6)
            {
              if (self->super._annotationPresentation)
              {
                -[VKTrackableAnnotation accuracy](self->super._annotation, "accuracy");
                v185 = v58;
                v186 = 1;
              }
              else
              {
                v186 = 0;
              }
            }
            -[VKTrackableAnnotation coordinate](self->super._annotation, "coordinate");
            GEOMapRectMakeWithRadialDistance();
            v136 = v135;
            v138 = v137;
            -[VKCameraController camera](self, "camera");
            v183 = v136;
            v139 = *((double *)location + 46);
            v140 = *((double *)location + 47);
            v141 = v138;
            if (v139 >= v140)
            {
              v147 = *((double *)location + 57);
            }
            else
            {
              v142 = v140 * v139;
              v143 = v139 / v140;
              if (v142 <= 0.0)
                v144 = 1.0;
              else
                v144 = v143;
              v145 = tan(*((double *)location + 57) * 0.5);
              v146 = atan(v144 * v145);
              v147 = v146 + v146;
            }
            v148 = tan(v147 * 0.5);
            if (v226)
            {
              p_shared_owners = &v226->__shared_owners_;
              do
                v150 = __ldaxr((unint64_t *)p_shared_owners);
              while (__stlxr(v150 - 1, (unint64_t *)p_shared_owners));
              if (!v150)
              {
                ((void (*)(std::__shared_weak_count *))v226->__on_zero_shared)(v226);
                std::__shared_weak_count::__release_weak(v226);
              }
            }
            -[VKCameraController camera](self, "camera");
            v152 = *((double *)location + 46);
            v151 = *((double *)location + 47);
            v180 = v148;
            if (v151 >= v152)
            {
              v158 = *((double *)location + 57);
            }
            else
            {
              v153 = v151 * v152;
              v154 = v151 / v152;
              if (v153 <= 0.0)
                v155 = 1.0;
              else
                v155 = v154;
              v156 = tan(*((double *)location + 57) * 0.5);
              v157 = atan(v155 * v156);
              v158 = v157 + v157;
            }
            v178 = tan(v158 * 0.5);
            if (v226)
            {
              v159 = &v226->__shared_owners_;
              do
                v160 = __ldaxr((unint64_t *)v159);
              while (__stlxr(v160 - 1, (unint64_t *)v159));
              if (!v160)
              {
                ((void (*)(std::__shared_weak_count *))v226->__on_zero_shared)(v226);
                std::__shared_weak_count::__release_weak(v226);
              }
            }
            v181 = a4;
            v182 = v39;
            v162 = *MEMORY[0x1E0D266F8];
            v161 = *(double *)(MEMORY[0x1E0D266F8] + 8);
            -[VKCameraController canvas](self, "canvas", *(_QWORD *)&v178);
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "size");
            v165 = v164;

            -[VKCameraController canvas](self, "canvas");
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v166, "size");
            v167 = v183 / v162;
            v168 = v141 / v161;
            v169 = v183 / v162 * 0.5;
            v170 = v168 * 0.5;
            v171 = v167 - v167 * (float)(v23 + v27) / v165;
            v173 = v168 - v168 * (float)(v187 + v25) / v172;

            v174 = v180 * 0.5 * v171 / v169;
            v175 = v179 * 0.5 * v173 / v170;
            v176 = v169 / v174;
            if (v174 <= 0.0)
              v176 = 0.0;
            if (v175 <= 0.0)
              v177 = 0.0;
            else
              v177 = v170 / v175;
            v52 = fmax(fmax(v176, v177) * 40075017.0, v52);
            a4 = v181;
            v39 = v182;
LABEL_32:
            -[VKCameraController camera](self, "camera");
            v224 = *((_QWORD *)location + 4);
            -[VKDaVinciAnnotationTrackingCameraController _zoomLevelForDistance:](self, "_zoomLevelForDistance:", &v224);
            v60 = v59;
            v61 = v226;
            if (v226)
            {
              v62 = &v226->__shared_owners_;
              do
                v63 = __ldaxr((unint64_t *)v62);
              while (__stlxr(v63 - 1, (unint64_t *)v62));
              if (!v63)
              {
                ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
                std::__shared_weak_count::__release_weak(v61);
              }
            }
            v223 = v52;
            -[VKDaVinciAnnotationTrackingCameraController _zoomLevelForDistance:](self, "_zoomLevelForDistance:", &v223);
            if (self->super._behavior.shouldPreserveUserSpecifiedZoomLevel && self->super._hasUserSpecifiedZoomLevel)
            {
              v65 = v60 - v64 > 0.0 && v6;
              v66 = v46 || v65;
              if (v64 >= v60)
                v66 = v46;
              v67 = fabs(v60 - v64) > 4.5 && v6;
              if (!v67 && (v66 & 1) == 0)
                goto LABEL_49;
            }
            else if (!v46)
            {
LABEL_49:
              v68 = 0;
              v52 = v190;
LABEL_52:
              -[VKCameraController canvas](self, "canvas");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "size");
              v71 = v70;
              -[VKCameraController canvas](self, "canvas");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "size");
              v74 = v73;
              v75 = a4;

              gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16), (double *)&v229, v191);
              v78 = sqrt((v76 - v71 * ((float)(v194 - v192) + 0.5)) * (v76 - v71 * ((float)(v194 - v192) + 0.5))+ (v77 - v74 * (0.5 - (float)(v193 - v195))) * (v77 - v74 * (0.5 - (float)(v193 - v195))));
              v79 = vabdd_f64(*(double *)(v11 + 32), v52);
              v10 = v197;
              if (v78 < 0.000001 && v79 <= 0.000000001)
              {
                *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x10u;
                goto LABEL_113;
              }
              if ((!v68 || v79 <= 0.000000001) && v78 < 1.5)
                v8 = 0;
              if (v6)
              {
                v80 = v8 ^ 1;
                if (v78 <= 10000.0)
                  v80 = 1;
                v8 &= v80;
              }
              if (v79 > 0.000000001)
                -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self, "setHasUserSpecifiedZoomLevel:", 0);
              v221[0] = MEMORY[0x1E0C809B0];
              v221[1] = 3221225472;
              v221[2] = __105__VKDaVinciAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke;
              v221[3] = &unk_1E42F6D00;
              v221[4] = self;
              v222 = v8;
              v81 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AF5730](v221);
              if (v8)
              {
                if (v75 == -1.0)
                {
                  v220 = *(_QWORD *)(v11 + 32);
                  -[VKDaVinciAnnotationTrackingCameraController _zoomLevelForDistance:](self, "_zoomLevelForDistance:", &v220);
                  v83 = v82;
                  v219 = v52;
                  -[VKDaVinciAnnotationTrackingCameraController _zoomLevelForDistance:](self, "_zoomLevelForDistance:", &v219);
                  v39 = fmax(fmin(fmax(vabdd_f64(v83, v84) * 0.166666672, v78 * 0.00156250002), 1.0), 0.200000003);
                }
                else if (v39 <= 0.200000003)
                {
                  v39 = fmax(v75, 0.200000003);
                }
                v94 = *(double *)v191;
                if (*(double *)v191 == *(double *)&v229)
                {
                  v94 = *(double *)(v11 + 16);
                  if (v94 == *((double *)&v229 + 1))
                  {
                    v94 = *(double *)(v11 + 24);
                    if (v94 == v230)
                    {
                      v94 = *(double *)(v11 + 32);
                      if (v94 == v52)
                        goto LABEL_112;
                    }
                  }
                }
                -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v94);
                v95 = self->super._annotationPresentation;
                v96 = v95;
                v97 = 0.0;
                if (v186)
                {
                  -[VKTrackableAnnotationPresentation setAnimatingAccuracy:](v95, "setAnimatingAccuracy:", 1);
                  -[VKTrackableAnnotationPresentation presentationAccuracy](self->super._annotationPresentation, "presentationAccuracy");
                  v99 = v98;
                  -[VKTrackableAnnotationPresentation minimumAccuracy](self->super._annotationPresentation, "minimumAccuracy");
                  v100 = v185;
                  if (v185 >= v101)
                  {
                    -[VKCameraController camera](self, "camera");
                    -[VKCameraController canvas](self, "canvas");
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v102, "size");
                    v104 = v103;
                    v105 = (double *)location;
                    v106 = cos(*((long double *)location + 5)) * v52;
                    v107 = v105[46];
                    v108 = v105[47];
                    if (v107 >= v108)
                    {
                      v114 = v105[57];
                    }
                    else
                    {
                      v109 = v108 * v107;
                      v110 = v107 / v108;
                      if (v109 <= 0.0)
                        v111 = 1.0;
                      else
                        v111 = v110;
                      v112 = v111 * tan(v105[57] * 0.5);
                      v100 = v185;
                      v113 = atan(v112);
                      v114 = v113 + v113;
                    }
                    v115 = tan(v114 * 0.5);
                    v116 = log2(v115 * 0.0000000499064043 * v106);
                    v117 = exp2((float)-fminf(fmaxf(-v116, 1.0), 25.0)) * 40075017.0;
                    v118 = v104 * v100;

                    v119 = v226;
                    if (v226)
                    {
                      v120 = &v226->__shared_owners_;
                      do
                        v121 = __ldaxr((unint64_t *)v120);
                      while (__stlxr(v121 - 1, (unint64_t *)v120));
                      if (!v121)
                      {
                        ((void (*)(std::__shared_weak_count *))v119->__on_zero_shared)(v119);
                        std::__shared_weak_count::__release_weak(v119);
                      }
                    }
                    v97 = v118 / v117;
                  }
                }
                else
                {
                  v99 = 0;
                }
                LOBYTE(self->_currentAnimationCompletedFraction) = v68;
                v122 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", v39);
                v123 = self->super._currentAnimation;
                self->super._currentAnimation = v122;

                v124 = (uint64_t *)&VKAnimationCurveEaseInOut;
                if (!v6)
                  v124 = &VKAnimationCurveLinear;
                v125 = *v124;
                if (v197)
                  v126 = v197;
                else
                  v126 = (id)v125;
                -[VKTimedAnimation setTimingFunction:](self->super._currentAnimation, "setTimingFunction:", v126);
                HIDWORD(self->super._elevationLogic) = 0;
                -[VKTrackableAnnotationPresentation presentationCoordinate](self->super._annotationPresentation, "presentationCoordinate");
                v128 = v127;
                -[VKTrackableAnnotationPresentation presentationCoordinate](self->super._annotationPresentation, "presentationCoordinate");
                self->_currentAnimationPresentationStartCoordinate.latitude = v128;
                self->_currentAnimationPresentationStartCoordinate.longitude = v129;
                self->_currentAnimationPresentationEndCoordinate.latitude = v189;
                self->_currentAnimationPresentationEndCoordinate.longitude = v188;
                v130 = *(_QWORD *)(v11 + 32);
                objc_initWeak(&location, self);
                v131 = MEMORY[0x1E0C809B0];
                v207[0] = MEMORY[0x1E0C809B0];
                v207[1] = 3321888768;
                v207[2] = __105__VKDaVinciAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_2;
                v207[3] = &unk_1E42E90F0;
                objc_copyWeak(v209, &location);
                v209[1] = (id)(v11 + 8);
                v196 = v229;
                v210 = v229;
                v132 = v230;
                v216 = v68;
                v211 = v230;
                v212 = v130;
                v217 = annotationPresentation != 0;
                v218 = v186;
                v213 = v52;
                v214 = v99;
                v215 = v97;
                v133 = v96;
                v208 = v133;
                -[VKTimedAnimation setStepHandler:](self->super._currentAnimation, "setStepHandler:", v207);
                v198[0] = v131;
                v198[1] = 3321888768;
                v198[2] = __105__VKDaVinciAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_4;
                v198[3] = &unk_1E42EA0D8;
                objc_copyWeak(&v201, &location);
                v202 = v196;
                v203 = v132;
                v204 = v52;
                v205 = annotationPresentation != 0;
                v198[4] = self;
                v134 = v133;
                v199 = v134;
                v206 = v6;
                v200 = v81;
                -[VKAnimation setCompletionHandler:](self->super._currentAnimation, "setCompletionHandler:", v198);
                md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._currentAnimation->super);

                objc_destroyWeak(&v201);
                objc_destroyWeak(v209);
                objc_destroyWeak(&location);

              }
              else
              {
                *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) |= 0x20u;
                -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
                -[VKCameraController camera](self, "camera");
                v85 = (double *)location;
                *(_OWORD *)((char *)location + 8) = v229;
                v85[3] = v230;
                v86 = v226;
                if (v226)
                {
                  v87 = &v226->__shared_owners_;
                  do
                    v88 = __ldaxr((unint64_t *)v87);
                  while (__stlxr(v88 - 1, (unint64_t *)v87));
                  if (!v88)
                  {
                    ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
                    std::__shared_weak_count::__release_weak(v86);
                  }
                }
                -[VKCameraController camera](self, "camera");
                v89 = v226;
                *((double *)location + 4) = v52;
                if (v89)
                {
                  v90 = (unint64_t *)&v89->__shared_owners_;
                  do
                    v91 = __ldaxr(v90);
                  while (__stlxr(v91 - 1, v90));
                  if (!v91)
                  {
                    ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
                    std::__shared_weak_count::__release_weak(v89);
                  }
                }
                *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x10u;
                if (annotationPresentation)
                {
                  -[VKTrackableAnnotation coordinate](self->super._annotation, "coordinate");
                  -[VKTrackableAnnotationPresentation setPresentationCoordinate:](self->super._annotationPresentation, "setPresentationCoordinate:");
                }
                -[VKCameraController cameraDelegate](self, "cameraDelegate");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "mapLayerDidChangeVisibleRegion");

                v93 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
                if (v93)
                {
                  LOBYTE(location) = 4;
                  md::MapEngine::setNeedsTick(v93, &location);
                }
                *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x20u;
                -[VKCameraController endRegionChange](self, "endRegionChange");
                if (!self->super._annotationPresentation)
                  v81[2](v81, 0);
              }
              -[VKDaVinciAnnotationTrackingCameraController updateFramerate](self, "updateFramerate");
LABEL_112:

              v10 = v197;
              goto LABEL_113;
            }
            v68 = 1;
            goto LABEL_52;
          }
        }
      }
      v186 = 0;
      goto LABEL_32;
    }
    *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v38 | 1;
    self->super._pendingChangeDuration = a4;
  }
LABEL_113:

}

- (void)_rotateToHeadingAnimated:(BOOL)a3 duration:(double)a4
{
  __int16 v5;
  _BOOL4 v7;
  VKTimedAnimation *currentHeadingAnimation;
  VKTimedAnimation *v9;
  void *v10;
  uint64_t *p_shared_owners;
  unint64_t v12;
  double v13;
  double v14;
  VKTimedAnimation *v15;
  VKTimedAnimation *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, int);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29[3];
  id location;
  std::__shared_weak_count *v31;

  if (self->super._annotation)
  {
    v5 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
    if ((v5 & 0x200) != 0)
    {
      if ((v5 & 2) != 0)
      {
        *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v5 | 8;
        self->super._pendingHeadingChangeDuration = a4;
      }
      else
      {
        v7 = a3;
        currentHeadingAnimation = self->super._currentHeadingAnimation;
        if (currentHeadingAnimation)
        {
          -[VKAnimation stop](currentHeadingAnimation, "stop");
          v9 = self->super._currentHeadingAnimation;
          self->super._currentHeadingAnimation = 0;

          v5 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
        }
        if ((v5 & 0x100) == 0
          || -[VKTrackableAnnotation hasValidHeading](self->super._annotation, "hasValidHeading"))
        {
          -[VKCameraController camera](self, "camera");
          v10 = (void *)*((_QWORD *)location + 6);
          if (v31)
          {
            p_shared_owners = &v31->__shared_owners_;
            do
              v12 = __ldaxr((unint64_t *)p_shared_owners);
            while (__stlxr(v12 - 1, (unint64_t *)p_shared_owners));
            if (!v12)
            {
              ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
              std::__shared_weak_count::__release_weak(v31);
            }
          }
          -[VKTrackableAnnotation headingDegrees](self->super._annotation, "headingDegrees");
          v14 = v13 * -0.0174532925 + 6.28318531;
          if (v7)
          {
            self->super._headingAnimationCompletedAngle = 0.0;
            v15 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", fmax(a4, 0.200000003));
            v16 = self->super._currentHeadingAnimation;
            self->super._currentHeadingAnimation = v15;

            -[VKTimedAnimation setTimingFunction:](self->super._currentHeadingAnimation, "setTimingFunction:", VKAnimationCurveLinear);
            -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
            objc_initWeak(&location, self);
            v17 = MEMORY[0x1E0C809B0];
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3321888768;
            v28[2] = __81__VKDaVinciAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke;
            v28[3] = &unk_1E42E9998;
            objc_copyWeak(v29, &location);
            v29[1] = v10;
            v29[2] = *(id *)&v14;
            -[VKTimedAnimation setStepHandler:](self->super._currentHeadingAnimation, "setStepHandler:", v28);
            v23 = v17;
            v24 = 3221225472;
            v25 = __81__VKDaVinciAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_5;
            v26 = &unk_1E42F7A38;
            objc_copyWeak(&v27, &location);
            -[VKAnimation setCompletionHandler:](self->super._currentHeadingAnimation, "setCompletionHandler:", &v23);
            md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner", v23, v24, v25, v26), &self->super._currentHeadingAnimation->super);
            objc_destroyWeak(&v27);
            objc_destroyWeak(v29);
            objc_destroyWeak(&location);
          }
          else
          {
            -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
            -[VKCameraController camera](self, "camera");
            v18 = v31;
            *((double *)location + 6) = v14;
            if (v18)
            {
              v19 = (unint64_t *)&v18->__shared_owners_;
              do
                v20 = __ldaxr(v19);
              while (__stlxr(v20 - 1, v19));
              if (!v20)
              {
                ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
                std::__shared_weak_count::__release_weak(v18);
              }
            }
            -[VKCameraController cameraDelegate](self, "cameraDelegate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "mapLayerDidChangeVisibleRegion");

            v22 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
            if (v22)
            {
              LOBYTE(location) = 4;
              md::MapEngine::setNeedsTick(v22, &location);
            }
            -[VKCameraController endRegionChange](self, "endRegionChange");
          }
          -[VKDaVinciAnnotationTrackingCameraController updateFramerate](self, "updateFramerate");
        }
      }
    }
  }
}

void __81__VKDaVinciAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke(uint64_t a1, float a2)
{
  float *WeakRetained;
  double v5;
  long double v6;
  long double v7;
  long double v8;
  long double v9;
  float v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  WeakRetained = (float *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = *(double *)(a1 + 40);
    v6 = fmod(3.14159265 - v5 + *(double *)(a1 + 48), 6.28318531);
    v7 = fmod(v6 + 6.28318531, 6.28318531);
    v8 = fmod(v5 + 3.14159265 + (v7 + -3.14159265) * a2, 6.28318531);
    v9 = fmod(v8 + 6.28318531, 6.28318531) + -3.14159265;
    v10 = v9;
    WeakRetained[70] = v10;
    objc_msgSend(WeakRetained, "camera");
    *(long double *)(v14 + 48) = v9;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)())v15->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    objc_msgSend(WeakRetained, "cameraDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mapLayerDidChangeVisibleRegion");

  }
}

void __81__VKDaVinciAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_5(uint64_t a1, int a2)
{
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2)
    {
      v3 = (void *)WeakRetained[33];
      WeakRetained[33] = 0;

    }
    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(WeakRetained, "updateFramerate");
  }

}

_QWORD *__105__VKDaVinciAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke(uint64_t a1, char a2)
{
  _QWORD *result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  result = *(_QWORD **)(a1 + 32);
  if (!result[18])
  {
    objc_msgSend(result, "cameraDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapLayerPresentationForAnnotation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 144);
    *(_QWORD *)(v7 + 144) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setTracking:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "coordinate");
    result = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setPresentationCoordinate:");
    if ((a2 & 1) == 0)
    {
      result = *(_QWORD **)(a1 + 32);
      if (result[18])
        return (_QWORD *)objc_msgSend(result, "_goToAnnotationAnimated:duration:timingFunction:isInitial:", *(unsigned __int8 *)(a1 + 40), 0, 0, -1.0);
    }
  }
  return result;
}

void __105__VKDaVinciAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_2(uint64_t a1, float a2)
{
  float *WeakRetained;
  float *v5;
  float64x2_t *v6;
  double v7;
  float64x2_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  double v11;
  double v12;
  unint64_t *v13;
  unint64_t v14;
  void *v15;
  float64x2_t v16;
  float64x2_t v17;
  double v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  WeakRetained = (float *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_18;
  WeakRetained[85] = a2;
  v6 = *(float64x2_t **)(a1 + 48);
  v16 = *v6;
  v17 = *(float64x2_t *)(a1 + 56);
  v7 = v6[1].f64[0];
  objc_msgSend(WeakRetained, "camera");
  v8 = vsubq_f64(v17, v16);
  v18 = a2;
  *(float64x2_t *)(v19 + 8) = vmlaq_n_f64(v16, v8, a2);
  *(double *)(v19 + 24) = v7 - v7 * a2;
  if (!v20)
    goto LABEL_21;
  p_shared_owners = (unint64_t *)&v20->__shared_owners_;
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (!v10)
  {
    ((void (*)())v20->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v20);
    if (*(_BYTE *)(a1 + 112))
      goto LABEL_7;
  }
  else
  {
LABEL_21:
    if (*(_BYTE *)(a1 + 112))
    {
LABEL_7:
      v11 = *(double *)(a1 + 80);
      v12 = *(double *)(a1 + 88);
      objc_msgSend(v5, "camera");
      *(double *)(v19 + 32) = v11 + (v12 - v11) * v18;
      if (v20)
      {
        v13 = (unint64_t *)&v20->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)())v20->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v20);
        }
      }
    }
  }
  if (*(_BYTE *)(a1 + 113))
    objc_msgSend(*((id *)v5 + 18), "setPresentationCoordinate:", vmlaq_n_f64(*(float64x2_t *)(v5 + 88), vsubq_f64(*(float64x2_t *)(v5 + 92), *(float64x2_t *)(v5 + 88)), v18));
  if (*(_BYTE *)(a1 + 114))
    objc_msgSend(*(id *)(a1 + 32), "setPresentationAccuracy:", *(double *)(a1 + 96) + (*(double *)(a1 + 104) - *(double *)(a1 + 96)) * v18);
  objc_msgSend(v5, "cameraDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mapLayerDidChangeVisibleRegion");

LABEL_18:
}

void __105__VKDaVinciAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_4(uint64_t a1, char a2)
{
  char *WeakRetained;
  char *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_23;
  if ((a2 & 1) == 0)
  {
    v12 = 0;
    goto LABEL_16;
  }
  objc_msgSend(WeakRetained, "camera");
  v6 = *(_QWORD *)(a1 + 80);
  *(_OWORD *)(v14 + 8) = *(_OWORD *)(a1 + 64);
  *(_QWORD *)(v14 + 24) = v6;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  objc_msgSend(v5, "camera");
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(a1 + 88);
  if (v15)
  {
    v9 = (unint64_t *)&v15->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
      if (!*(_BYTE *)(a1 + 96))
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  if (*(_BYTE *)(a1 + 96))
  {
LABEL_13:
    objc_msgSend(*((id *)v5 + 17), "coordinate");
    objc_msgSend(*((id *)v5 + 18), "setPresentationCoordinate:");
  }
LABEL_14:
  v11 = (void *)*((_QWORD *)v5 + 19);
  *((_QWORD *)v5 + 19) = 0;

  v12 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 321) & 1;
LABEL_16:
  *(_WORD *)(v5 + 321) &= 0xFFEEu;
  v5[344] = 0;
  objc_msgSend(*(id *)(a1 + 40), "setAnimatingAccuracy:", 0);
  objc_msgSend(v5, "endRegionChange");
  if (*(_BYTE *)(a1 + 97))
  {
    objc_msgSend(v5, "cameraDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mapLayerDidFinishInitialTrackingAnimation");

  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (v12)
    objc_msgSend(v5, "_goToAnnotationAnimated:duration:timingFunction:isInitial:", 1, 0, 0, *((double *)v5 + 32));
  objc_msgSend(v5, "updateFramerate");
LABEL_23:

}

@end
