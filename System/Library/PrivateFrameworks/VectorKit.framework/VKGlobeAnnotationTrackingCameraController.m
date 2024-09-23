@implementation VKGlobeAnnotationTrackingCameraController

- (VKGlobeAnnotationTrackingCameraController)init
{
  VKGlobeAnnotationTrackingCameraController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKGlobeAnnotationTrackingCameraController;
  result = -[VKGlobeAnnotationTrackingCameraController init](&v3, sel_init);
  result->super._elevationLogic = 0;
  result->_globeView = 0;
  return result;
}

- (void)dealloc
{
  altitude::Anchor *globeView;
  objc_super v4;

  globeView = (altitude::Anchor *)self->_globeView;
  if (globeView)
    altitude::Anchor::destroy(globeView);
  v4.receiver = self;
  v4.super_class = (Class)VKGlobeAnnotationTrackingCameraController;
  -[VKAnnotationTrackingCameraController dealloc](&v4, sel_dealloc);
}

- (Matrix<int,)_nonOffsetCenterCursor
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  uint64_t v14;

  -[VKCameraController canvas](self, "canvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
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
  objc_msgSend(v12, "contentScale");
  v14 = (int)(v11 * 0.5 * v13);

  return (Matrix<int, 2, 1>)((int)(v5 * 0.5 * v8) | (unint64_t)(v14 << 32));
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

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKGlobeAnnotationTrackingCameraController;
  -[VKCameraController setEdgeInsets:](&v4, sel_setEdgeInsets_, *(double *)&a3.top, *(double *)&a3.left, *(double *)&a3.bottom, *(double *)&a3.right);
  -[VKGlobeAnnotationTrackingCameraController _goToAnnotationAnimated:duration:timingFunction:isInitial:](self, "_goToAnnotationAnimated:duration:timingFunction:isInitial:", 0, 0, 0, 0.0);
}

- (Matrix<int,)_centerCursor
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  uint64_t v22;

  -[VKGlobeAnnotationTrackingCameraController _effectiveEdgeInsets](self, "_effectiveEdgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKCameraController canvas](self, "canvas");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  v13 = v12;
  -[VKCameraController canvas](self, "canvas");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentScale");
  v16 = v15;

  -[VKCameraController canvas](self, "canvas");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  v19 = v18;
  -[VKCameraController canvas](self, "canvas");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentScale");
  v22 = (int)(v21 * (v4 + (v19 - (v8 + v4)) * 0.5));

  return (Matrix<int, 2, 1>)((int)(v16 * (v6 + (v13 - (v6 + v10)) * 0.5)) | (unint64_t)(v22 << 32));
}

- (void)_goToAnnotationAnimated:(BOOL)a3 duration:(double)a4 timingFunction:(id)a5 isInitial:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  id v10;
  VKTrackableAnnotation *annotation;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _DWORD *globeView;
  __double2 v18;
  double v19;
  __double2 v20;
  VKTimedAnimation *currentAnimation;
  __int16 v22;
  VKTimedAnimation *v24;
  __int16 v25;
  _BOOL4 v26;
  void *v27;
  int v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  _QWORD *elevationLogic;
  uint64_t v35;
  Matrix<int, 2, 1> v36;
  unint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double idealCenterCoordinateDistance;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _BOOL4 v49;
  double v50;
  _BOOL4 shouldPreserveUserSpecifiedZoomLevel;
  _BOOL4 v52;
  double v53;
  double v54;
  float64_t v55;
  double v56;
  double v57;
  double v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  void *v65;
  double v66;
  double v67;
  uint64_t v68;
  float v69;
  _BOOL4 v70;
  double v71;
  double v72;
  double v73;
  long double v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  double v79;
  _BOOL4 LatLongAtViewPosition;
  double v81;
  double v82;
  long double v83;
  double v84;
  double v85;
  int64x2_t v86;
  BOOL v88;
  BOOL v89;
  long double v91;
  long double v92;
  long double v93;
  long double v94;
  long double v95;
  long double v96;
  long double v97;
  double v98;
  long double v99;
  double v100;
  BOOL v101;
  char v102;
  int v103;
  _QWORD *v104;
  uint64_t v105;
  float64x2_t v106;
  uint64_t v107;
  void (**v108)(_QWORD, _QWORD);
  VKTimedAnimation *v109;
  VKTimedAnimation *v110;
  uint64_t *v111;
  uint64_t v112;
  id v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double latitude;
  double v119;
  BOOL v120;
  double v121;
  _BYTE *v122;
  uint64_t v123;
  double v124;
  uint64_t v125;
  double *v126;
  double v127;
  double v128;
  int v129;
  uint64_t v130;
  _BYTE *v135;
  uint64_t v136;
  float64x2_t v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  double v141;
  double v142;
  double v143;
  double v144;
  _BOOL4 v145;
  double v146;
  double v147;
  double v148;
  VKTrackableAnnotationPresentation *annotationPresentation;
  double v150;
  double v151;
  double v152;
  double v153;
  _BOOL4 v154;
  id v155;
  double v156;
  double v157;
  _QWORD v158[5];
  void (**v159)(_QWORD, _QWORD);
  id v160[2];
  char v161;
  BOOL v162;
  BOOL v163;
  _QWORD v164[4];
  id v165[4];
  char v166;
  char v167;
  BOOL v168;
  _QWORD v169[5];
  char v170;
  double v171;
  double v172;
  double v173;
  float64x2_t v174;
  double v175;
  float64x2_t location;
  double v177;
  int v178;
  int v179;
  Matrix<int, 2, 1> v180;
  uint64_t v181;
  double v182[2];
  float64x2_t v183;
  double v184;
  CGRect v185;

  v6 = a6;
  v8 = a3;
  v10 = a5;
  annotation = self->super._annotation;
  if (!annotation)
    goto LABEL_110;
  v154 = v8;
  v155 = v10;
  -[VKTrackableAnnotation coordinate](annotation, "coordinate");
  v13 = v12;
  v151 = v14;
  v15 = v14 * 0.0174532925;
  v16 = v12 * 0.0174532925;
  v182[0] = v14 * 0.0174532925;
  v182[1] = v12 * 0.0174532925;
  globeView = self->_globeView;
  if (!globeView)
  {
    globeView = altitude::GlobeView::createAnchor((uint64_t)self->super._elevationLogic, v182);
    self->_globeView = globeView;
  }
  v157 = v13;
  if (v15 != *((double *)globeView + 1) || v16 != *((double *)globeView + 2) || *((double *)globeView + 3) != 0.0)
  {
    *((double *)globeView + 1) = v15;
    *((double *)globeView + 2) = v16;
    *((_QWORD *)globeView + 3) = 0;
    *((_WORD *)globeView + 32) = 255;
    globeView[17] = 0;
    globeView[18] = 0;
    *((_BYTE *)globeView + 96) = 1;
    if (*globeView == 2)
    {
      altitude::Anchor::update((altitude::Anchor *)globeView);
    }
    else
    {
      v18 = __sincos_stret(v15);
      v19 = 6378137.0 / sqrt(v18.__sinval * v18.__sinval * -0.00669437999 + 1.0);
      v20 = __sincos_stret(v16);
      *((double *)globeView + 4) = v19 * v18.__cosval * v20.__cosval;
      *((double *)globeView + 5) = v19 * v18.__cosval * v20.__sinval;
      *((double *)globeView + 6) = v19 * (0.99330562 * v18.__sinval);
    }
  }
  currentAnimation = self->super._currentAnimation;
  v22 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
  if (currentAnimation)
    _ZF = 0;
  else
    _ZF = (v22 & 2) == 0;
  if (!_ZF)
  {
    if ((v22 & 0x12) != 0)
    {
      *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v22 | 1;
      self->super._pendingChangeDuration = a4;
      goto LABEL_110;
    }
    -[VKAnimation stop](currentAnimation, "stop");
    v24 = self->super._currentAnimation;
    self->super._currentAnimation = 0;

    v22 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
  }
  annotationPresentation = self->super._annotationPresentation;
  if (v6)
    v25 = 16;
  else
    v25 = 0;
  *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v22 & 0xFFEF | v25;
  v26 = -[VKAnnotationTrackingCameraController shouldForceZoomToFit](self, "shouldForceZoomToFit");
  -[VKGlobeAnnotationTrackingCameraController regionRestriction](self, "regionRestriction");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKTrackableAnnotation coordinate](self->super._annotation, "coordinate");
  v28 = objc_msgSend(v27, "containsCoordinate:");

  if ((v28 & 1) != 0)
  {
    v29 = *((double *)self->_globeView + 7);
    v30 = v151;
  }
  else
  {
    -[VKGlobeAnnotationTrackingCameraController regionRestriction](self, "regionRestriction");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKTrackableAnnotation coordinate](self->super._annotation, "coordinate");
    objc_msgSend(v31, "clampedCoordinate:");
    v30 = v32;
    v13 = v33;

    v15 = v30 * 0.0174532925;
    v16 = v13 * 0.0174532925;
    v29 = 0.0;
  }
  v147 = v30;
  v181 = 0;
  elevationLogic = self->super._elevationLogic;
  v183.f64[0] = v15;
  v183.f64[1] = v16;
  v152 = v29;
  v153 = v16;
  v184 = v29;
  altitude::GlobeView::getViewPositionAtLatLongHeight(elevationLogic, v183.f64, &v181);
  v35 = v181;
  v146 = v13;
  if (v28)
    v36 = -[VKGlobeAnnotationTrackingCameraController _centerCursor](self, "_centerCursor");
  else
    v36 = -[VKGlobeAnnotationTrackingCameraController _nonOffsetCenterCursor](self, "_nonOffsetCenterCursor");
  v38 = (double)(int)v35;
  v39 = (double)SHIDWORD(v35);
  v180 = v36;
  v150 = sqrt(((double)v36._e[0] - v38) * ((double)v36._e[0] - v38) + ((double)v36._e[1] - v39)
                                                                    * ((double)v36._e[1] - v39));
  v40 = fmax(fmin(v150 * 0.00156250002, 1.0), 0.200000003);
  v41 = fmax(a4, 0.200000003);
  v42 = self->super._elevationLogic;
  if (a4 != -1.0)
    v40 = v41;
  v148 = v40;
  v156 = *(double *)(*((_QWORD *)v42 + 9) + 32);
  idealCenterCoordinateDistance = self->super._behavior.idealCenterCoordinateDistance;
  if (idealCenterCoordinateDistance >= 0.0)
    v44 = self->super._behavior.idealCenterCoordinateDistance;
  else
    v44 = 5500.0;
  v45 = *((double *)v42 + 49);
  v46 = *((double *)v42 + 50);
  LODWORD(idealCenterCoordinateDistance) = *((_DWORD *)v42 + 161);
  v47 = (double)*(unint64_t *)&idealCenterCoordinateDistance;
  v185.origin.x = (double)*(unint64_t *)&idealCenterCoordinateDistance * -16.0;
  LODWORD(v37) = *((_DWORD *)v42 + 162);
  v48 = (double)v37;
  v185.origin.y = v48 * -16.0;
  v185.size.width = v47 * 33.0;
  v185.size.height = v48 * 33.0;
  v49 = CGRectContainsPoint(v185, *(CGPoint *)&v38);
  v50 = fmin(fmax(v44, v45), v46);
  shouldPreserveUserSpecifiedZoomLevel = self->super._behavior.shouldPreserveUserSpecifiedZoomLevel;
  if (self->super._behavior.shouldPreserveUserSpecifiedZoomLevel)
  {
    v52 = self->super._hasUserSpecifiedZoomLevel && v49;
    v53 = fmin(v156, v50);
    if (v52)
      v50 = v53;
  }
  v54 = v157;
  v56 = v152;
  v55 = v16;
  if ((*(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) & 0x80) != 0)
  {
    -[VKTrackableAnnotation accuracy](self->super._annotation, "accuracy");
    v58 = v57;
    -[VKGlobeAnnotationTrackingCameraController _effectiveEdgeInsets](self, "_effectiveEdgeInsets");
    v60 = v59;
    v62 = v61;
    v64 = v63;
    -[VKCameraController canvas](self, "canvas");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "contentScale");
    v67 = v66;

    v178 = (int)(v67 * v60);
    -[VKCameraController canvas](self, "canvas");
    v68 = objc_claimAutoreleasedReturnValue();
    v145 = v6;
    objc_msgSend((id)v68, "size");
    v69 = v64;
    v141 = v58;
    v70 = v26;
    v144 = v50;
    v179 = (int)((v71 - v62) * v67);

    location = 0uLL;
    v177 = 0.0;
    LOBYTE(v68) = altitude::GlobeView::getLatLongAtViewPosition((uint64_t)self->super._elevationLogic, &v178, (__int128 *)&location);
    v72 = location.f64[1];
    v73 = v177;
    v74 = tan(location.f64[0] * 0.5 + 0.785398163);
    v143 = v72 * 0.159154943;
    v75 = v72 * 0.159154943 + 0.5;
    v142 = log(v74) * 0.159154943;
    v174.f64[0] = v75;
    v174.f64[1] = v142 + 0.5;
    v175 = v73;
    -[VKCameraController canvas](self, "canvas");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "size");
    v178 = (int)((v77 - v69) * v67);

    -[VKCameraController canvas](self, "canvas");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "size");
    v179 = (int)((v79 - v62) * v67);

    if ((v68 & 1) != 0)
    {
      LatLongAtViewPosition = altitude::GlobeView::getLatLongAtViewPosition((uint64_t)self->super._elevationLogic, &v178, (__int128 *)&location);
      v81 = location.f64[1];
      v82 = v177;
      v83 = tan(location.f64[0] * 0.5 + 0.785398163);
      v84 = v81 * 0.159154943;
      v85 = log(v83) * 0.159154943;
      v171 = v81 * 0.159154943 + 0.5;
      v172 = v85 + 0.5;
      v173 = v82;
      v26 = v70;
      if (!LatLongAtViewPosition)
      {
        v54 = v157;
        v56 = v152;
        v55 = v153;
        v50 = v144;
        v6 = v145;
        goto LABEL_60;
      }
      v86 = vdupq_n_s64(0x7FF8000000000000uLL);
      v183 = (float64x2_t)v86;
      v88 = *(_QWORD *)&v174.f64[0] == v86.i64[0]
         && *(_QWORD *)&v174.f64[1] == v86.i64[1]
         && *(_QWORD *)&v175 == 0x7FF8000000000000;
      v54 = v157;
      v56 = v152;
      v55 = v153;
      v6 = v145;
      if (!v88)
      {
        v183 = (float64x2_t)v86;
        v89 = *(_QWORD *)&v171 == v86.i64[0] && *(_QWORD *)&v172 == v86.i64[1];
        if (!v89 || *(_QWORD *)&v173 != 0x7FF8000000000000)
        {
          v91 = exp((v142 + 0.5) * 6.28318531 + -3.14159265);
          v92 = atan(v91) * 114.591559 + -90.0;
          v93 = cos(v92 * 0.034906585) * -559.82 + 111132.92;
          v94 = v93 + cos(v92 * 0.0698131701) * 1.175;
          v95 = v94 + cos(v92 * 0.104719755) * -0.0023;
          v96 = v92 * 0.00872664626;
          v97 = tan(v96 + 0.78103484);
          v98 = log(v97);
          v99 = tan(v96 + 0.789761487);
          v100 = v95
               * sqrt((v84 - v143) * (v84 - v143) + (v85 - v142) * (v85 - v142))
               / fabs((log(v99) - v98) * 0.159154943);
          if (v100 > 0.0)
          {
            v50 = fmax(v156 + (v141 * 2.1 / v100 + -1.0) * v156, v144);
            v56 = v152;
            v55 = v153;
LABEL_60:
            shouldPreserveUserSpecifiedZoomLevel = self->super._behavior.shouldPreserveUserSpecifiedZoomLevel;
            goto LABEL_61;
          }
          v56 = v152;
          v55 = v153;
        }
      }
      v50 = v144;
      goto LABEL_60;
    }
    v171 = v75;
    v172 = v142 + 0.5;
    v173 = v73;
    v54 = v157;
    v56 = v152;
    v55 = v153;
    v26 = v70;
    v6 = v145;
    goto LABEL_60;
  }
LABEL_61:
  if (!shouldPreserveUserSpecifiedZoomLevel || !self->super._hasUserSpecifiedZoomLevel)
  {
    if (!v26)
      goto LABEL_75;
    goto LABEL_71;
  }
  v101 = v50 / v156 > 1.0;
  if (!v6)
    v101 = 0;
  v102 = v26 || v101;
  if (v50 <= v156)
    v102 = v26;
  if (!v6)
  {
    if ((v102 & 1) == 0)
      goto LABEL_75;
LABEL_71:
    v103 = 1;
    if (vabdd_f64(v50, v156) >= 0.000000001 || v150 >= 1.5)
      goto LABEL_77;
    goto LABEL_76;
  }
  if (v102 & 1 | (fmax(v156, v50) / fmin(v156, v50) > 22.627417))
    goto LABEL_71;
LABEL_75:
  v103 = 0;
  v50 = v156;
  if (v150 < 1.5)
LABEL_76:
    v154 = 0;
LABEL_77:
  v104 = self->super._elevationLogic;
  v184 = 0.0;
  v183 = 0uLL;
  v105 = v104[9];
  if (v105)
  {
    v106 = *(float64x2_t *)(v105 + 8);
    v184 = *(double *)(v105 + 24);
    v183 = v106;
  }
  altitude::GlobeView::getCoordAtScreenPosition((uint64_t)v104, (int *)&v180, v183.f64, (uint64_t)&v183, 0);
  if (vabdd_f64(v184, v56) > 0.000000001)
    -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self, "setHasUserSpecifiedZoomLevel:", 0);
  v107 = MEMORY[0x1E0C809B0];
  v169[0] = MEMORY[0x1E0C809B0];
  v169[1] = 3221225472;
  v169[2] = __103__VKGlobeAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke;
  v169[3] = &unk_1E42F6D00;
  v169[4] = self;
  v170 = v28;
  v108 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AF5730](v169);
  if (v154)
  {
    v109 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", v148);
    v110 = self->super._currentAnimation;
    self->super._currentAnimation = v109;

    v111 = (uint64_t *)&VKAnimationCurveEaseInOut;
    if (!v6)
      v111 = &VKAnimationCurveLinear;
    v112 = *v111;
    if (v155)
      v113 = v155;
    else
      v113 = (id)v112;
    -[VKTimedAnimation setTimingFunction:](self->super._currentAnimation, "setTimingFunction:", v113);
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
    v114 = v184;
    *(float64x2_t *)&self->_anchor = vmulq_f64(v183, (float64x2_t)vdupq_n_s64(0x404CA5DC1A63C1F8uLL));
    self->_currentAnimationStartCoordinate.longitude = v114;
    -[VKTrackableAnnotationPresentation presentationCoordinate](self->super._annotationPresentation, "presentationCoordinate");
    v116 = v115;
    -[VKTrackableAnnotationPresentation presentationCoordinate](self->super._annotationPresentation, "presentationCoordinate");
    self->_currentAnimationStartCoordinate.altitude = v116;
    self->_currentAnimationPresentationStartCoordinate.latitude = v117;
    self->_currentAnimationPresentationStartCoordinate.longitude = v151;
    self->_currentAnimationPresentationEndCoordinate.latitude = v54;
    self->_currentAnimationPresentationEndCoordinate.longitude = v147;
    self->_currentAnimationEndCoordinate.latitude = v146;
    latitude = self->_currentAnimationStartCoordinate.latitude;
    v119 = v146 - latitude;
    if (v146 - latitude >= -180.0)
    {
      v120 = annotationPresentation != 0;
      v121 = v156;
      if (v119 > 180.0)
        v119 = v119 + -360.0;
    }
    else
    {
      v119 = v119 + 360.0;
      v120 = annotationPresentation != 0;
      v121 = v156;
    }
    self->_currentAnimationEndCoordinate.latitude = v119 + latitude;
    objc_initWeak((id *)&location, self);
    v164[0] = v107;
    v164[1] = 3221225472;
    v164[2] = __103__VKGlobeAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_2;
    v164[3] = &unk_1E42F6D28;
    objc_copyWeak(v165, (id *)&location);
    v166 = v103;
    v165[1] = *(id *)&v56;
    v165[2] = *(id *)&v121;
    v165[3] = *(id *)&v50;
    v167 = v28;
    v168 = v120;
    -[VKTimedAnimation setStepHandler:](self->super._currentAnimation, "setStepHandler:", v164);
    v158[0] = v107;
    v158[1] = 3221225472;
    v158[2] = __103__VKGlobeAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_3;
    v158[3] = &unk_1E42F6D50;
    objc_copyWeak(v160, (id *)&location);
    v160[1] = *(id *)&v56;
    v161 = v28;
    v162 = v120;
    v163 = v6;
    v158[4] = self;
    v159 = v108;
    -[VKAnimation setCompletionHandler:](self->super._currentAnimation, "setCompletionHandler:", v158);
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._currentAnimation->super);

    objc_destroyWeak(v160);
    objc_destroyWeak(v165);
    objc_destroyWeak((id *)&location);
  }
  else
  {
    *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) |= 0x20u;
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
    location.f64[0] = v15;
    location.f64[1] = v55;
    v177 = v56;
    v122 = self->super._elevationLogic;
    v122[160] = 0;
    v123 = *((_QWORD *)v122 + 9);
    v124 = v177;
    *(float64x2_t *)(v123 + 8) = location;
    *(double *)(v123 + 24) = v124;
    ++*((_DWORD *)v122 + 94);
    v125 = **(_QWORD **)(*((_QWORD *)v122 + 107) + 88);
    if (v125)
    {
      LOBYTE(v174.f64[0]) = 7;
      md::MapEngine::setNeedsTick(v125, &v174);
    }
    if (v103)
    {
      v126 = (double *)self->super._elevationLogic;
      if (*((_BYTE *)v126 + 184))
      {
        v127 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)self->super._elevationLogic);
        v128 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v126);
        v129 = *((unsigned __int8 *)v126 + 184);
        v130 = *((_QWORD *)v126 + 9);
        *(double *)(v130 + 32) = fmin(fmax(v127, v50), fmax(fmin(v126[50], 60592301.5), v128));
        if (v129)
          *(double *)(v130 + 40) = fmax(*(double *)(v130 + 40), 0.0);
      }
      else
      {
        *(double *)(*((_QWORD *)v126 + 9) + 32) = v50;
      }
      ++*((_DWORD *)v126 + 94);
    }
    if (v28)
    {
      v171 = COERCE_DOUBLE(-[VKGlobeAnnotationTrackingCameraController _centerCursor](self, "_centerCursor"));
      v174 = 0uLL;
      v175 = 0.0;
      altitude::GlobeView::getCoordAtScreenPosition((uint64_t)self->super._elevationLogic, (int *)&v171, location.f64, (uint64_t)&v174, 0);
      __asm { FMOV            V2.2D, #-2.0 }
      location = vnegq_f64(vmlaq_f64(v174, _Q2, location));
      v135 = self->super._elevationLogic;
      v135[160] = 0;
      v136 = *((_QWORD *)v135 + 9);
      v137 = location;
      *(double *)(v136 + 24) = v177;
      *(float64x2_t *)(v136 + 8) = v137;
      ++*((_DWORD *)v135 + 94);
      v138 = **(_QWORD **)(*((_QWORD *)v135 + 107) + 88);
      if (v138)
      {
        LOBYTE(v178) = 7;
        md::MapEngine::setNeedsTick(v138, &v178);
      }
    }
    *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x10u;
    if (annotationPresentation)
    {
      -[VKTrackableAnnotation coordinate](self->super._annotation, "coordinate");
      -[VKTrackableAnnotationPresentation setPresentationCoordinate:](self->super._annotationPresentation, "setPresentationCoordinate:");
    }
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "mapLayerDidChangeVisibleRegion");

    v140 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
    if (v140)
    {
      LOBYTE(v174.f64[0]) = 4;
      md::MapEngine::setNeedsTick(v140, &v174);
    }
    *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x20u;
    -[VKCameraController endRegionChange](self, "endRegionChange");
    if (!self->super._annotationPresentation)
      v108[2](v108, 0);
  }
  -[VKAnnotationTrackingCameraController updateFramerate](self, "updateFramerate");

  v10 = v155;
LABEL_110:

}

- (void)_rotateToHeadingAnimated:(BOOL)a3 duration:(double)a4
{
  VKTrackableAnnotation *annotation;
  __int16 v6;
  double v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  VKTimedAnimation *currentHeadingAnimation;
  VKTimedAnimation *v13;
  double v14;
  long double v15;
  uint64_t v16;
  void (**v17)(_QWORD, double);
  VKTimedAnimation *v18;
  VKTimedAnimation *v19;
  void (**v20)(_QWORD, double);
  void *v21;
  uint64_t v22;
  _QWORD v23[4];
  void (**v24)(_QWORD, double);
  id v25[2];
  _QWORD v26[4];
  id v27;
  id v28[3];
  id location;
  _QWORD v30[5];

  annotation = self->super._annotation;
  if (annotation)
  {
    v6 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
    if ((v6 & 0x200) != 0)
    {
      v7 = a4;
      if ((v6 & 2) != 0)
      {
        *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v6 | 8;
        self->super._pendingHeadingChangeDuration = a4;
      }
      else
      {
        v8 = a3;
        v9 = *(double *)(*((_QWORD *)self->super._elevationLogic + 9) + 48);
        -[VKTrackableAnnotation headingDegrees](annotation, "headingDegrees");
        v11 = v10;
        currentHeadingAnimation = self->super._currentHeadingAnimation;
        if (currentHeadingAnimation)
        {
          -[VKAnimation stop](currentHeadingAnimation, "stop");
          v13 = self->super._currentHeadingAnimation;
          self->super._currentHeadingAnimation = 0;

        }
        if ((*(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) & 0x100) == 0
          || -[VKTrackableAnnotation hasValidHeading](self->super._annotation, "hasValidHeading"))
        {
          v14 = v11 * -0.0174532925 + 6.28318531;
          if (v8 && v7 == 0.4)
          {
            v15 = fmod(3.14159265 - v9 + v14, 6.28318531);
            v7 = fabs(fmod(v15 + 6.28318531, 6.28318531) + -3.14159265) * 0.0636619772;
            v8 = v7 >= 0.05;
          }
          v16 = MEMORY[0x1E0C809B0];
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __79__VKGlobeAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke;
          v30[3] = &unk_1E42F9F78;
          v30[4] = self;
          v17 = (void (**)(_QWORD, double))MEMORY[0x1A1AF5730](v30);
          if (v8)
          {
            self->super._headingAnimationCompletedAngle = 0.0;
            v18 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", fmax(v7, 0.200000003));
            v19 = self->super._currentHeadingAnimation;
            self->super._currentHeadingAnimation = v18;

            -[VKTimedAnimation setTimingFunction:](self->super._currentHeadingAnimation, "setTimingFunction:", VKAnimationCurveLinear);
            -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
            objc_initWeak(&location, self);
            v26[0] = v16;
            v26[1] = 3221225472;
            v26[2] = __79__VKGlobeAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_2;
            v26[3] = &unk_1E42F6D78;
            objc_copyWeak(v28, &location);
            v28[1] = *(id *)&v9;
            v28[2] = *(id *)&v14;
            v20 = v17;
            v27 = v20;
            -[VKTimedAnimation setStepHandler:](self->super._currentHeadingAnimation, "setStepHandler:", v26);
            v23[0] = v16;
            v23[1] = 3221225472;
            v23[2] = __79__VKGlobeAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_3;
            v23[3] = &unk_1E42F9FC8;
            objc_copyWeak(v25, &location);
            v24 = v20;
            v25[1] = *(id *)&v14;
            -[VKAnimation setCompletionHandler:](self->super._currentHeadingAnimation, "setCompletionHandler:", v23);
            md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._currentHeadingAnimation->super);

            objc_destroyWeak(v25);
            objc_destroyWeak(v28);
            objc_destroyWeak(&location);
          }
          else
          {
            -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
            v17[2](v17, v14);
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
          -[VKAnnotationTrackingCameraController updateFramerate](self, "updateFramerate");

        }
      }
    }
  }
}

- (void)setGlobeView:(void *)a3
{
  altitude::Anchor *globeView;

  if (self->super._elevationLogic)
  {
    globeView = (altitude::Anchor *)self->_globeView;
    if (globeView)
    {
      altitude::Anchor::destroy(globeView);
      self->_globeView = 0;
    }
  }
  self->super._elevationLogic = a3;
}

- (void)globeView
{
  return self->super._elevationLogic;
}

- (VKCameraRegionRestriction)regionRestriction
{
  return *(VKCameraRegionRestriction **)&self->_currentAnimationEndCoordinate.longitude;
}

- (void)setRegionRestriction:(id)a3
{
  objc_storeStrong((id *)&self->_currentAnimationEndCoordinate.longitude, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAnimationEndCoordinate.longitude, 0);
}

void __79__VKGlobeAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke(uint64_t a1, double a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  long double v6;
  __int128 v7;
  uint64_t v8;
  double v9;
  double v10;
  __double2 v11;
  double v12;
  double v13;
  __double2 v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  __double2 v19;
  double v20;
  double v21;
  __double2 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __double2 v28;
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
  long double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  long double v44;
  double v45;
  __double2 v46;
  __double2 v47;
  double v48;
  double v49;
  long double v50;
  double v51;
  double *v52;
  __double2 v53;
  double v54;
  long double v55;
  double v56;
  double v57;
  long double v58;
  double v59;
  long double v60;
  long double v61;
  double v62;
  long double v63;
  double v64;
  __double2 v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double *v74;
  double v75;
  __double2 v76;
  double v77;
  __double2 v78;
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
  long double v91;
  long double v92;
  long double v93;
  double v94;
  double v95;
  __double2 v96;
  double v97;
  long double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  __double2 v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  long double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  long double v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  __int128 v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  long double v143;
  double v144;
  double v145;
  long double v146;
  double v147;
  double v148;
  long double v149;
  long double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  __int128 v157;
  uint64_t v158;
  double v159[3];
  __int128 v160;
  __int128 v161;
  double v162[3];
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  __int128 v170;
  __int128 v171;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[42];
  if (v3)
  {
    v5 = *(_QWORD *)(v3 + 72);
    v6 = fmod(a2 + 3.14159265 - *(double *)(v5 + 48), 6.28318531);
    v139 = fmod(v6 + 6.28318531, 6.28318531);
    v7 = *(_OWORD *)(v5 + 8);
    v158 = *(_QWORD *)(v5 + 24);
    v157 = v7;
    v154 = 0.0;
    v155 = 0.0;
    v156 = 0.0;
    v167 = COERCE_DOUBLE(objc_msgSend(v2, "_centerCursor"));
    altitude::GlobeView::getCoordAtScreenPosition(v3, (int *)&v167, (double *)&v157, (uint64_t)&v154, 0);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336);
    v9 = v155;
    v10 = v156;
    v11 = __sincos_stret(v154);
    v12 = 6378137.0 / sqrt(1.0 - v11.__sinval * v11.__sinval * 0.00669437999);
    v13 = (v12 + v10) * v11.__cosval;
    v14 = __sincos_stret(v9);
    v133 = v13 * v14.__sinval;
    v135 = v13 * v14.__cosval;
    v15 = (v10 + v12 * 0.99330562) * v11.__sinval;
    v16 = *(double **)(v8 + 72);
    gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(&v167, v16 + 1);
    v17 = v16[2];
    v18 = v16[3];
    v19 = __sincos_stret(v16[1]);
    v20 = 6378137.0 / sqrt(1.0 - v19.__sinval * v19.__sinval * 0.00669437999);
    v21 = (v20 + v18) * v19.__cosval;
    v22 = __sincos_stret(v17);
    v23 = v21 * v22.__cosval;
    v24 = v21 * v22.__sinval;
    v25 = (v18 + v20 * 0.99330562) * v19.__sinval;
    v141 = v167;
    v144 = v168;
    v147 = v169;
    v26 = *(double *)&v170;
    v27 = (v26 + v26) * *((double *)&v170 + 1) + *((double *)&v171 + 1) * (*(double *)&v171 * -2.0);
    v125 = -(*(double *)&v171 * -2.0 * *((double *)&v170 + 1) - (v26 + v26) * *((double *)&v171 + 1));
    v128 = *(double *)&v171 * -2.0 * *(double *)&v171 + 1.0 - (v26 + v26) * v26;
    v28 = __sincos_stret(v139 * 0.5 + -1.57079633);
    v29 = v28.__sinval / sqrt(v135 * v135 + v133 * v133 + v15 * v15);
    v30 = v29 * v135;
    v31 = v29 * v133;
    v32 = v29 * v15;
    v33 = -(v32 * v144 - v29 * v133 * v147);
    v131 = v33 + v33;
    v134 = -(v30 * v147 - v32 * v141) - (v30 * v147 - v32 * v141);
    v129 = -(v31 * v141 - v30 * v144) - (v31 * v141 - v30 * v144);
    v34 = -(v24 * v32 - v25 * v31) - (v24 * v32 - v25 * v31);
    v35 = -(v30 * v25 - v23 * v32) - (v30 * v25 - v23 * v32);
    v36 = -(v23 * v31 - v30 * v24) - (v23 * v31 - v30 * v24);
    v37 = v23 + v34 * v28.__cosval + v36 * v31 - v35 * v32;
    v38 = v24 + v34 * v32 + v35 * v28.__cosval - v36 * v30;
    v39 = v25 + v35 * v30 + v36 * v28.__cosval - v34 * v31;
    v40 = -(v128 * v32 - v125 * v31) - (v128 * v32 - v125 * v31);
    v41 = -(v125 * v30 - v27 * v32) - (v125 * v30 - v27 * v32);
    v42 = -(v27 * v31 - v128 * v30) - (v27 * v31 - v128 * v30);
    v122 = v128 + v40 * v32 + v41 * v28.__cosval - v42 * v30;
    v123 = v27 + v40 * v28.__cosval + v42 * v31 - v41 * v32;
    v121 = v125 + v41 * v30 + v42 * v28.__cosval - v40 * v31;
    v43 = v37;
    v44 = v38;
    v119 = v38;
    v126 = sqrt(v37 * v37 + v38 * v38);
    v45 = atan2(v39, v126 * 0.996647189);
    v124 = atan2(v44, v43);
    v46 = __sincos_stret(v45);
    v120 = atan2(v39 + v46.__sinval * v46.__sinval * 42841.3115 * v46.__sinval, v126 + v46.__cosval * v46.__cosval * -42697.6727 * v46.__cosval);
    v47 = __sincos_stret(v120);
    v136 = 6378137.0 / sqrt(1.0 - v47.__sinval * v47.__sinval * 0.00669437999);
    v127 = v126 / v47.__cosval;
    v48 = v43 + v134 * v32 - (v141 + v131 * v28.__cosval + v129 * v31);
    v49 = v119 + v129 * v30 - (v144 + v131 * v32 + v134 * v28.__cosval);
    v50 = v39 + v131 * v31 - (v147 + v134 * v30 + v129 * v28.__cosval);
    v51 = sqrt(v48 * v48 + v49 * v49 + v50 * v50);
    v52 = *(double **)(v8 + 72);
    v53 = __sincos_stret(v52[5]);
    v54 = v53.__cosval / sqrt(v123 * v123 + v122 * v122 + v121 * v121);
    v55 = v53.__sinval / v51 * v50;
    v56 = v53.__sinval / v51 * v48 + v54 * v123;
    v57 = v53.__sinval / v51 * v49 + v54 * v122;
    v161 = 0u;
    v160 = 0u;
    v58 = v55 + v54 * v121;
    v159[0] = v120;
    v159[1] = v124;
    v159[2] = v127 - v136;
    gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(&v167, v159);
    v59 = *(double *)&v171;
    v60 = -(*((double *)&v170 + 1) * v58 - v59 * v57) - (*((double *)&v170 + 1) * v58 - v59 * v57);
    v61 = -(v59 * v56 - *(double *)&v170 * v58) - (v59 * v56 - *(double *)&v170 * v58);
    v62 = -(*(double *)&v170 * v57 - *((double *)&v170 + 1) * v56)
        - (*(double *)&v170 * v57
         - *((double *)&v170 + 1) * v56);
    v63 = atan2(-(v61 * *(double *)&v171 - (-(v56 - v62 * *((double *)&v170 + 1)) - v60 * *((double *)&v171 + 1))), v57 + v62 * *(double *)&v170 + v61 * *((double *)&v171 + 1) - v60 * *(double *)&v171);
    v52[1] = v120;
    ++v52;
    v64 = v52[2];
    v52[2] = v127 - v136;
    v52[3] = v51;
    v52[5] = v63;
    v52[1] = v124;
    gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(&v167, v52);
    v65 = __sincos_stret(v124);
    v66 = v127 - v136 + v136 * 0.99330562;
    v67 = v167;
    v68 = v168;
    v69 = v169;
    v130 = *(double *)&v170;
    v132 = v171;
    v137 = *((double *)&v170 + 1);
    v70 = -(v167 - v127 * v47.__cosval * v65.__cosval);
    v71 = -(v168 - v127 * v47.__cosval * v65.__sinval);
    v72 = -(v169 - v66 * v47.__sinval);
    v73 = 1.0 / sqrt(v70 * v70 + v71 * v71 + v72 * v72);
    v145 = v73 * v71;
    v148 = v73 * v70;
    v142 = v73 * v72;
    v74 = *(double **)(v8 + 72);
    v74[3] = v64;
    v75 = v74[2];
    v76 = __sincos_stret(v74[1]);
    v77 = 6378137.0 / sqrt(1.0 - v76.__sinval * v76.__sinval * 0.00669437999);
    v78 = __sincos_stret(v75);
    v153 = v64;
    v79 = v148 * v148 + v145 * v145 + v142 * v142;
    v80 = v148 * v67 + v145 * v68 + v142 * v69;
    v81 = v80 + v80;
    v82 = (v68 * v68
         - ((v77 + v64) * v76.__cosval * v78.__cosval * ((v77 + v64) * v76.__cosval * v78.__cosval)
          + (v77 + v64) * v76.__cosval * v78.__sinval * ((v77 + v64) * v76.__cosval * v78.__sinval)
          + (v64 + v77 * 0.99330562) * v76.__sinval * ((v64 + v77 * 0.99330562) * v76.__sinval)
          - v67 * v67)
         + v69 * v69)
        * -4.0
        * v79
        + v81 * v81;
    if (v82 >= 0.0)
    {
      v83 = (sqrt(v82) + v81) * -0.5 / v79;
      if (v83 >= 0.0)
      {
        v84 = v69;
        v85 = v130;
        v86 = *(double *)&v132 * -2.0;
        v87 = (v85 + v85) * v137 + *((double *)&v132 + 1) * (*(double *)&v132 * -2.0);
        *(double *)&v132 = *(double *)&v132 * -2.0 * *(double *)&v132 + 1.0 - (v85 + v85) * v85;
        v138 = -(v86 * v137 - (v85 + v85) * *((double *)&v132 + 1));
        v140 = v87;
        v88 = v83 * v148;
        v89 = v83 * v145;
        v90 = v83 * v142;
        v91 = v83 * v148 + v67;
        v92 = v83 * v145 + v68;
        v93 = v83 * v142 + v84;
        v151 = v91 * v91 + v92 * v92;
        v94 = sqrt(v151);
        v95 = atan2(v93, v94 * 0.996647189);
        v150 = atan2(v92, v91);
        v96 = __sincos_stret(v95);
        v149 = atan2(v93 + v96.__sinval * v96.__sinval * 42841.3115 * v96.__sinval, v94 + v96.__cosval * v96.__cosval * -42697.6727 * v96.__cosval);
        v97 = 1.0 / sqrt(v151 + v93 * v93);
        v143 = v97 * v92;
        v146 = v97 * v91;
        v98 = v97 * v93;
        v152 = sqrt(v88 * v88 + v89 * v89 + v90 * v90);
        v99 = 1.0 / v152 * v88;
        v100 = 1.0 / v152 * v89;
        v101 = 1.0 / v152 * v90;
        v102 = 1.0 / sqrt(v140 * v140 + *(double *)&v132 * *(double *)&v132 + v138 * v138);
        v103 = __sincos_stret(v74[5]);
        v104 = v102 * (*(double *)&v132 * v103.__cosval);
        v105 = v102 * (v138 * v103.__cosval);
        v106 = v102 * (v140 * v103.__cosval) + v103.__sinval * v99;
        v107 = v104 + v103.__sinval * v100;
        v108 = v105 + v103.__sinval * v101;
        v109 = acos(fmax(fmin(-(v101 * v98 + v100 * v143 + v99 * v146)/ sqrt((v99 * v99 + v100 * v100 + v101 * v101) * (v146 * v146 + v143 * v143 + v98 * v98)), 1.0), -1.0));
        v171 = 0u;
        v170 = 0u;
        v167 = v149;
        v168 = v150;
        v169 = v153;
        gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v162, &v167);
        v111 = v163;
        v110 = v164;
        v112 = v165;
        v113 = -(v110 * v108 - v112 * v107) - (v110 * v108 - v112 * v107);
        v114 = -(v112 * v106 - v111 * v108) - (v112 * v106 - v111 * v108);
        v115 = -(v111 * v107 - v110 * v106) - (v111 * v107 - v110 * v106);
        v116 = atan2(-(v114 * v165 - (-(v106 - v115 * v164) - v113 * v166)), v107 + v115 * v163 + v114 * v166 - v113 * v165);
        v117 = *(_QWORD *)(v8 + 72);
        *(long double *)(v117 + 8) = v149;
        *(long double *)(v117 + 16) = v150;
        *(double *)(v117 + 24) = v153;
        *(double *)(v117 + 32) = v152;
        *(long double *)(v117 + 40) = v109;
        *(long double *)(v117 + 48) = v116;
        ++*(_DWORD *)(v8 + 376);
      }
    }
    v118 = **(_QWORD **)(*(_QWORD *)(v8 + 856) + 88);
    if (v118)
    {
      LOBYTE(v167) = 7;
      md::MapEngine::setNeedsTick(v118, &v167);
    }
  }
}

void __79__VKGlobeAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_2(uint64_t a1, float a2)
{
  id WeakRetained;
  double v5;
  long double v6;
  long double v7;
  long double v8;
  long double v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v5 = *(double *)(a1 + 48);
    v6 = fmod(3.14159265 - v5 + *(double *)(a1 + 56), 6.28318531);
    v7 = fmod(v6 + 6.28318531, 6.28318531);
    v8 = fmod(v5 + 3.14159265 + (v7 + -3.14159265) * a2, 6.28318531);
    v9 = fmod(v8 + 6.28318531, 6.28318531);
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v9 + -3.14159265);
    objc_msgSend(v11, "cameraDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mapLayerDidChangeVisibleRegion");

    WeakRetained = v11;
  }

}

void __79__VKGlobeAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_3(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    if (a2)
    {
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48));
      objc_msgSend(v7, "cameraDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mapLayerDidChangeVisibleRegion");

      v6 = (void *)v7[33];
      v7[33] = 0;

    }
    objc_msgSend(v7, "endRegionChange");
    objc_msgSend(v7, "updateFramerate");
    WeakRetained = v7;
  }

}

_QWORD *__103__VKGlobeAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke(uint64_t a1, char a2)
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

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setTracking:", *(unsigned __int8 *)(a1 + 40));
    result = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setPresentationCoordinate:", *(double *)(*(_QWORD *)(a1 + 32) + 392), *(double *)(*(_QWORD *)(a1 + 32) + 400));
    if ((a2 & 1) == 0)
    {
      result = *(_QWORD **)(a1 + 32);
      if (result[18])
        return (_QWORD *)objc_msgSend(result, "_goToAnnotationAnimated:duration:timingFunction:isInitial:", 1, 0, 0, -1.0);
    }
  }
  return result;
}

void __103__VKGlobeAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_2(uint64_t a1, float a2)
{
  double *WeakRetained;
  __int128 v5;
  double *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v26;
  uint64_t v27;
  float64x2_t v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  float64x2_t v32;
  uint64_t v33;
  uint64_t v34;
  float64x2_t v35;
  double v36;
  char v37;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_22;
  v7 = *((_QWORD *)WeakRetained + 42);
  if (!v7)
    goto LABEL_22;
  *(double *)&v5 = a2;
  v8 = WeakRetained[45] + (WeakRetained[52] - WeakRetained[45]) * a2;
  v31 = v5;
  v9 = WeakRetained[46] + (*(double *)(a1 + 40) - WeakRetained[46]) * a2;
  if (v8 > 180.0)
  {
    v10 = -360.0;
LABEL_7:
    v8 = v8 + v10;
    goto LABEL_8;
  }
  if (v8 < -180.0)
  {
    v10 = 360.0;
    goto LABEL_7;
  }
LABEL_8:
  v35.f64[0] = (WeakRetained[44] + (WeakRetained[51] - WeakRetained[44]) * a2) * 0.0174532925;
  v35.f64[1] = v8 * 0.0174532925;
  v36 = v9;
  *(_BYTE *)(v7 + 160) = 0;
  v11 = *(_QWORD *)(v7 + 72);
  v12 = v36;
  *(float64x2_t *)(v11 + 8) = v35;
  *(double *)(v11 + 24) = v12;
  ++*(_DWORD *)(v7 + 376);
  v13 = **(_QWORD **)(*(_QWORD *)(v7 + 856) + 88);
  if (v13)
  {
    LOBYTE(v32.f64[0]) = 7;
    md::MapEngine::setNeedsTick(v13, &v32);
  }
  if (*(_BYTE *)(a1 + 64))
  {
    v14 = *(double *)(a1 + 48) + (*(double *)(a1 + 56) - *(double *)(a1 + 48)) * *(double *)&v31;
    v15 = *((_QWORD *)v6 + 42);
    if (*(_BYTE *)(v15 + 184))
    {
      v16 = altitude::GlobeView::calculateMinZoomDistance(*((altitude::GlobeView **)v6 + 42));
      v17 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v15);
      v18 = *(unsigned __int8 *)(v15 + 184);
      v19 = *(_QWORD *)(v15 + 72);
      *(double *)(v19 + 32) = fmin(fmax(v16, v14), fmax(fmin(*(double *)(v15 + 400), 60592301.5), v17));
      if (v18)
        *(double *)(v19 + 40) = fmax(*(double *)(v19 + 40), 0.0);
    }
    else
    {
      *(double *)(*(_QWORD *)(v15 + 72) + 32) = v14;
    }
    ++*(_DWORD *)(v15 + 376);
  }
  if (*(_BYTE *)(a1 + 65))
  {
    v20 = objc_msgSend(v6, "_centerCursor");
    v33 = 0;
    v34 = v20;
    v32 = 0uLL;
    altitude::GlobeView::getCoordAtScreenPosition(*((_QWORD *)v6 + 42), (int *)&v34, v35.f64, (uint64_t)&v32, 0);
    __asm { FMOV            V2.2D, #-2.0 }
    v35 = vnegq_f64(vmlaq_f64(v32, _Q2, v35));
    v26 = *((_QWORD *)v6 + 42);
    *(_BYTE *)(v26 + 160) = 0;
    v27 = *(_QWORD *)(v26 + 72);
    v28 = v35;
    *(double *)(v27 + 24) = v36;
    *(float64x2_t *)(v27 + 8) = v28;
    ++*(_DWORD *)(v26 + 376);
    v29 = **(_QWORD **)(*(_QWORD *)(v26 + 856) + 88);
    if (v29)
    {
      v37 = 7;
      md::MapEngine::setNeedsTick(v29, &v37);
    }
  }
  if (*(_BYTE *)(a1 + 66))
    objc_msgSend(*((id *)v6 + 18), "setPresentationCoordinate:", vmlaq_n_f64(*(float64x2_t *)(v6 + 47), vsubq_f64(*(float64x2_t *)(v6 + 49), *(float64x2_t *)(v6 + 47)), *(double *)&v31));
  objc_msgSend(v6, "cameraDelegate", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "mapLayerDidChangeVisibleRegion");

LABEL_22:
}

void __103__VKGlobeAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_3(uint64_t a1, char a2)
{
  char *WeakRetained;
  char *v5;
  uint64_t v6;
  double v7;
  double v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v21;
  uint64_t v22;
  float64x2_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_super v27;
  float64x2_t v28;
  uint64_t v29;
  uint64_t v30;
  float64x2_t v31;
  uint64_t v32;
  char v33;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_25;
  if ((a2 & 1) != 0)
  {
    v6 = *((_QWORD *)WeakRetained + 42);
    if (!v6)
    {
LABEL_17:
      v25 = (void *)*((_QWORD *)v5 + 19);
      *((_QWORD *)v5 + 19) = 0;

      v10 = *(_WORD *)(v5 + 321);
      v9 = v10 & 1;
      goto LABEL_18;
    }
    v7 = *((double *)WeakRetained + 52);
    if (v7 <= 180.0)
    {
      if (v7 >= -180.0)
      {
LABEL_10:
        v11 = *(_QWORD *)(a1 + 56);
        v31.f64[0] = *((double *)WeakRetained + 51) * 0.0174532925;
        v31.f64[1] = v7 * 0.0174532925;
        v32 = v11;
        *(_BYTE *)(v6 + 160) = 0;
        v12 = *(_QWORD *)(v6 + 72);
        v13 = v32;
        *(float64x2_t *)(v12 + 8) = v31;
        *(_QWORD *)(v12 + 24) = v13;
        ++*(_DWORD *)(v6 + 376);
        v14 = **(_QWORD **)(*(_QWORD *)(v6 + 856) + 88);
        if (v14)
        {
          LOBYTE(v28.f64[0]) = 7;
          md::MapEngine::setNeedsTick(v14, &v28);
        }
        if (*(_BYTE *)(a1 + 64))
        {
          v15 = objc_msgSend(v5, "_centerCursor");
          v29 = 0;
          v30 = v15;
          v28 = 0uLL;
          altitude::GlobeView::getCoordAtScreenPosition(*((_QWORD *)v5 + 42), (int *)&v30, v31.f64, (uint64_t)&v28, 0);
          __asm { FMOV            V2.2D, #-2.0 }
          v31 = vnegq_f64(vmlaq_f64(v28, _Q2, v31));
          v21 = *((_QWORD *)v5 + 42);
          *(_BYTE *)(v21 + 160) = 0;
          v22 = *(_QWORD *)(v21 + 72);
          v23 = v31;
          *(_QWORD *)(v22 + 24) = v32;
          *(float64x2_t *)(v22 + 8) = v23;
          ++*(_DWORD *)(v21 + 376);
          v24 = **(_QWORD **)(*(_QWORD *)(v21 + 856) + 88);
          if (v24)
          {
            v33 = 7;
            md::MapEngine::setNeedsTick(v24, &v33);
          }
        }
        if (*(_BYTE *)(a1 + 65))
          objc_msgSend(*((id *)v5 + 18), "setPresentationCoordinate:", *((double *)v5 + 49), *((double *)v5 + 50));
        goto LABEL_17;
      }
      v8 = 360.0;
    }
    else
    {
      v8 = -360.0;
    }
    v7 = v7 + v8;
    *((double *)WeakRetained + 52) = v7;
    goto LABEL_10;
  }
  v9 = 0;
  v10 = *(_WORD *)(WeakRetained + 321);
LABEL_18:
  *(_WORD *)(v5 + 321) = v10 & 0xFFEE;
  objc_msgSend(v5, "endRegionChange");
  if (*(_BYTE *)(a1 + 66))
  {
    objc_msgSend(v5, "cameraDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mapLayerDidFinishInitialTrackingAnimation");

  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v9)
    objc_msgSend(v5, "_goToAnnotationAnimated:duration:timingFunction:isInitial:", 1, 0, 0, *((double *)v5 + 32));
  v27.receiver = *(id *)(a1 + 32);
  v27.super_class = (Class)VKGlobeAnnotationTrackingCameraController;
  objc_msgSendSuper2(&v27, sel_updateFramerate);
LABEL_25:

}

@end
