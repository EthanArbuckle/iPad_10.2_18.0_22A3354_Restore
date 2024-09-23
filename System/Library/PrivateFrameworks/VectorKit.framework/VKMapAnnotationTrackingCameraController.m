@implementation VKMapAnnotationTrackingCameraController

- (double)_zoomLevelForCameraPosition:()Matrix<double
{
  double v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  long double v19;
  void *v20;
  double v21;

  v3 = a3._e[2];
  -[VKCameraController vkCamera](self, "vkCamera", a3._e[0], a3._e[1]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minHeight");
  v7 = v6;
  -[VKCameraController vkCamera](self, "vkCamera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maxHeight");
  v10 = v9;
  -[VKCameraController vkCamera](self, "vkCamera");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(double *)(objc_msgSend(v11, "position") + 16);

  -[VKCameraController vkCamera](self, "vkCamera");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "footprint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "maxDepth");
  v16 = v15 * fmin(fmax(v3, v7), v10) / v12;

  -[VKCameraController vkCamera](self, "vkCamera");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widthOfViewAtDepth:", v16);
  v19 = v18;

  -[VKCameraController canvas](self, "canvas");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "size");
  *(float *)&v21 = 512.0 / v21;
  LODWORD(v7) = log2f(*(float *)&v21);

  return *(float *)&v7 - log2(v19);
}

- (double)_minTrackingCameraDistance:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  float v10;
  double idealCenterCoordinateDistance;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  void *v23;
  float64x2_t v24;
  float64x2_t v25;
  double v31;
  double v32;
  long double v33;
  long double v34;
  long double v35;
  double v36;
  long double v37;
  double v38;
  long double v39;
  double v40;
  void *v41;
  double *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  double v55;
  double v56;
  float64x2_t v57;
  float64x2_t v58;
  void *v59;
  void *v60;
  VKCamera *v61;
  VKCamera *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  uint64_t v76;
  float64x2_t v77;
  float64x2_t v78;
  double v79;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  float64x2_t v84;
  unsigned int v85;
  float64_t v86;
  double v87;
  float64_t v88;
  float v89;
  double v90;
  char v91;
  double v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  float64x2_t v96;

  v4 = a3;
  -[VKCameraController vkCamera](self, "vkCamera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "groundPointFromScreenPoint:", 0.5, 0.5);
  }
  else
  {
    v95 = 0u;
    v96 = 0u;
  }

  -[VKCameraController canvas](self, "canvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  *(float *)&v9 = 512.0 / v9;
  v10 = log2f(*(float *)&v9);

  idealCenterCoordinateDistance = self->super._behavior.idealCenterCoordinateDistance;
  if (idealCenterCoordinateDistance >= 0.0)
  {
    -[VKTrackableAnnotation coordinate](self->super._annotation, "coordinate");
    v32 = v31;
    v33 = cos(v31 + v31) * -559.82 + 111132.92;
    v34 = v33 + cos(v32 * 4.0) * 1.175;
    v35 = v34 + cos(v32 * 6.0) * -0.0023;
    v36 = v32 * 0.5;
    v37 = tan(v32 * 0.5 + 0.78103484);
    v38 = log(v37);
    v39 = tan(v36 + 0.789761487);
    v40 = fabs((log(v39) - v38) * 0.159154943) * idealCenterCoordinateDistance / v35;
  }
  else
  {
    -[VKCameraController vkCamera](self, "vkCamera");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "depthForViewWidth:", (double)exp2((float)(-14.0 - v10)));
    v14 = v13;

    -[VKCameraController canvas](self, "canvas");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v86 = v17;
    v88 = v16;

    -[VKMapAnnotationTrackingCameraController _effectiveEdgeInsets](self, "_effectiveEdgeInsets");
    v85 = v18;
    v82 = v19;
    v81 = v20;
    v83 = v21;
    -[VKCameraController vkCamera](self, "vkCamera");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24.f64[0] = v88;
      v24.f64[1] = v86;
      v25 = vaddq_f64(v24, v24);
      __asm { FMOV            V2.2D, #0.5 }
      objc_msgSend(v22, "groundPointFromScreenPoint:", vsubq_f64(vaddq_f64(vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v81, v82)), v25))), _Q2), vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v85, v83)), v25)))));
    }
    else
    {
      v93 = 0u;
      v94 = 0u;
    }

    -[VKCameraController vkCamera](self, "vkCamera");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (double *)objc_msgSend(v41, "position");
    v44 = *v42;
    v43 = v42[1];
    v45 = v42[2];

    -[VKCameraController vkCamera](self, "vkCamera");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v10;
    objc_msgSend(v46, "forwardVector");
    v48 = v47;
    v50 = v49;
    v52 = v51;

    -[VKCameraController vkCamera](self, "vkCamera");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "position");
    v55 = v14
        / ((v44 - *((double *)&v93 + 1)) * v48 + (v43 - *(double *)&v94) * v50 + (v45 - *((double *)&v94 + 1)) * v52)
        + 1.0;
    v56 = *(double *)v54 + (*((double *)&v95 + 1) - *(double *)v54) * v55;
    v84 = *(float64x2_t *)(v54 + 8);
    v87 = v55;

    v57 = vsubq_f64(v96, vmlaq_n_f64(v84, vsubq_f64(v96, v84), v87));
    v58 = vmulq_f64(v57, v57);
    v40 = sqrt(v58.f64[0] + (*((double *)&v95 + 1) - v56) * (*((double *)&v95 + 1) - v56) + v58.f64[1]);
    v10 = v89;
  }
  -[VKCameraController vkCamera](self, "vkCamera");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (!v59)
    goto LABEL_15;
  objc_msgSend(v59, "minDistanceToGroundRestriction");
  if (!(_BYTE)v93)
  {

LABEL_15:
    -[VKCameraController vkCamera](self, "vkCamera");
    v62 = (VKCamera *)objc_claimAutoreleasedReturnValue();
    v63 = VKCameraDistanceForDisplayZoomLevel(v10 + 20.0, v62);
    goto LABEL_16;
  }
  LOBYTE(v93) = 0;

  -[VKCameraController vkCamera](self, "vkCamera");
  v61 = (VKCamera *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61)
  {
    -[VKCamera minDistanceToGroundRestriction](v61, "minDistanceToGroundRestriction");
    v63 = *((double *)&v93 + 1);
  }
  else
  {
    v93 = 0uLL;
    v63 = 0.0;
  }
LABEL_16:

  -[VKCameraController vkCamera](self, "vkCamera");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (!v64)
  {
    v67 = 0;
LABEL_22:
    v68 = 1.0;
    goto LABEL_23;
  }
  objc_msgSend(v64, "maxDistanceToGroundRestriction");
  if (!(_BYTE)v93)
  {
    v67 = 0;
    goto LABEL_22;
  }
  -[VKCameraController vkCamera](self, "vkCamera");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v66;
  if (v66)
  {
    objc_msgSend(v66, "maxDistanceToGroundRestriction");
    v67 = 1;
    v68 = v92;
  }
  else
  {
    v68 = 0.0;
    v67 = 1;
  }
LABEL_23:
  v69 = v63;
  if (v68 > v63)
  {
    -[VKCameraController vkCamera](self, "vkCamera");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (v70 && (objc_msgSend(v70, "maxDistanceToGroundRestriction"), v91))
    {
      -[VKCameraController vkCamera](self, "vkCamera");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v72;
      if (v72)
      {
        objc_msgSend(v72, "maxDistanceToGroundRestriction");
        v69 = v90;
      }
      else
      {
        v69 = 0.0;
      }

    }
    else
    {
      v69 = 1.0;
    }

  }
  if (v67)

  v74 = fmin(fmax(v40, v63), v69);
  if (self->super._behavior.shouldPreserveUserSpecifiedZoomLevel && self->super._hasUserSpecifiedZoomLevel && v4)
  {
    -[VKCameraController vkCamera](self, "vkCamera");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "position");
    v77 = vsubq_f64(v96, *(float64x2_t *)(v76 + 8));
    v78 = vmulq_f64(v77, v77);
    v79 = sqrt(v78.f64[0]+ (*((double *)&v95 + 1) - *(double *)v76) * (*((double *)&v95 + 1) - *(double *)v76)+ v78.f64[1]);

    return fmin(v79, v74);
  }
  return v74;
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  float right;
  float bottom;
  float left;
  float top;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
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
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  float v35;
  float v36;
  double v37;
  float v38;
  float v39;
  void *v40;
  void *v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float64_t v46;
  float v47;
  float v48;
  float64x2_t v49[4];
  objc_super v50;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[VKMapAnnotationTrackingCameraController _effectiveEdgeInsets](self, "_effectiveEdgeInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v50.receiver = self;
  v50.super_class = (Class)VKMapAnnotationTrackingCameraController;
  *(float *)&v16 = top;
  *(float *)&v17 = left;
  *(float *)&v18 = bottom;
  *(float *)&v19 = right;
  -[VKCameraController setEdgeInsets:](&v50, sel_setEdgeInsets_, v16, v17, v18, v19);
  if (self->super._currentAnimation)
  {
    -[VKMapAnnotationTrackingCameraController _effectiveEdgeInsets](self, "_effectiveEdgeInsets");
    v21 = v20;
    v23 = v22;
    v47 = v24;
    v48 = v25;
    -[VKCameraController canvas](self, "canvas");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "size");
    v28 = v27;
    v30 = v29;

    v31 = v30 + v30;
    v32 = v28 + v28;
    -[VKCameraController vkCamera](self, "vkCamera");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v35 = v13 / v31;
      v36 = v9 / v31;
      v37 = (float)(v35 - v36) + 0.5;
      v38 = v11 / v32;
      v39 = v15 / v32;
      objc_msgSend(v33, "groundPointFromScreenPoint:", (float)(v38 - v39) + 0.5, v37);
    }
    else
    {
      memset(&v49[2], 0, 32);
    }

    -[VKCameraController vkCamera](self, "vkCamera");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v40)
    {
      v42 = v21 / v31;
      v43 = v23 / v32;
      v44 = v47 / v31;
      v45 = v48 / v32;
      objc_msgSend(v40, "groundPointFromScreenPoint:", (float)(v43 - v45) + 0.5, (float)(v44 - v42) + 0.5);
    }
    else
    {
      memset(v49, 0, 32);
    }

    v46 = v49[3].f64[1] - v49[1].f64[1] + self->super._currentAnimationEndCameraPosition._e[2];
    *(float64x2_t *)self->super._currentAnimationEndCameraPosition._e = vaddq_f64(vsubq_f64(*(float64x2_t *)((char *)&v49[2] + 8), *(float64x2_t *)((char *)v49 + 8)), *(float64x2_t *)self->super._currentAnimationEndCameraPosition._e);
    self->super._currentAnimationEndCameraPosition._e[2] = v46;
  }
  else
  {
    -[VKMapAnnotationTrackingCameraController _goToAnnotationAnimated:duration:timingFunction:isInitial:](self, "_goToAnnotationAnimated:duration:timingFunction:isInitial:", 0, 0, 0, 0.0);
  }
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

  if (BYTE4(self->super._elevationLogic))
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
    v6.super_class = (Class)VKMapAnnotationTrackingCameraController;
    -[VKAnnotationTrackingCameraController updateFramerate](&v6, sel_updateFramerate);
  }
}

- (void)_goToAnnotationAnimated:(BOOL)a3 duration:(double)a4 timingFunction:(id)a5 isInitial:(BOOL)a6
{
  _BOOL4 v6;
  int v8;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  void *v23;
  double v24;
  double v25;
  long double v26;
  long double v27;
  float64x2_t v28;
  void *v33;
  void *v34;
  float v35;
  float v36;
  float v37;
  float v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  int8x16_t v48;
  int8x16_t v49;
  float64x2_t v50;
  double v51;
  double v52;
  double v53;
  VKTimedAnimation *currentAnimation;
  __int16 v55;
  double v56;
  double v57;
  double v58;
  float v59;
  VKTimedAnimation *v60;
  __int16 v61;
  _BOOL4 v62;
  void *v63;
  double *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
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
  BOOL v89;
  char v90;
  BOOL v91;
  int v92;
  void *v93;
  double *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  BOOL v116;
  double v117;
  int v118;
  BOOL v119;
  int v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  uint64_t v127;
  double v128;
  double v129;
  double v130;
  long double v131;
  long double v132;
  float64x2_t v133;
  VKTrackableAnnotationPresentation *v136;
  VKTrackableAnnotationPresentation *v137;
  void *v138;
  long double v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  double v144;
  void *v145;
  void *v146;
  double v147;
  double v148;
  void *v149;
  VKTimedAnimation *v150;
  VKTimedAnimation *v151;
  VKTimedAnimation *v152;
  VKTimedAnimation *v153;
  uint64_t *v154;
  uint64_t v155;
  id v156;
  uint64_t v157;
  VKTrackableAnnotationPresentation *v158;
  VKTrackableAnnotationPresentation *v159;
  double v160;
  double v161;
  double v162;
  double v163;
  void *v164;
  double v165;
  double v166;
  void *v167;
  double v168;
  double v169;
  double v170;
  void *v171;
  double v172;
  double v173;
  void *v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  VKTrackableAnnotationPresentation *annotationPresentation;
  double v189;
  int v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  float v199;
  double v200;
  float v201;
  double v202;
  float v203;
  double v204;
  float64x2_t v205;
  double v206;
  double v207;
  float64_t v208;
  float v209;
  double v210;
  void (**v211)(_QWORD, _QWORD);
  void *v212;
  _QWORD v213[5];
  VKTrackableAnnotationPresentation *v214;
  void (**v215)(_QWORD, _QWORD);
  id v216;
  id v217[3];
  BOOL v218;
  BOOL v219;
  _QWORD v220[4];
  VKTrackableAnnotationPresentation *v221;
  id v222[3];
  BOOL v223;
  char v224;
  id from;
  __int128 v226;
  uint64_t v227;
  __int128 v228;
  uint64_t v229;
  __int128 v230;
  __int128 v231;
  id location[2];
  _OWORD v233[2];
  __int128 v234;
  __int128 v235;
  _QWORD v236[7];
  char v237;
  __int128 v238;
  double v239;
  __int128 v240;
  __int128 v241;
  float64x2_t v242;
  double v243;
  CGPoint v244;
  CGRect v245;

  v6 = a6;
  v8 = a3;
  v10 = a5;
  if (self->super._annotation)
  {
    -[VKCameraController canvas](self, "canvas");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "size");
    v13 = v12;
    v15 = v14;

    -[VKMapAnnotationTrackingCameraController _effectiveEdgeInsets](self, "_effectiveEdgeInsets");
    v209 = v16;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[VKTrackableAnnotation coordinate](self->super._annotation, "coordinate");
    v212 = v23;
    v25 = v24;
    v26 = tan(v24 * 0.00872664626 + 0.785398163);
    v27 = log(v26);
    *(_QWORD *)&v28.f64[0] = v212;
    v28.f64[1] = v27;
    __asm { FMOV            V0.2D, #0.5 }
    v205 = _Q0;
    v242 = vmlaq_f64(_Q0, (float64x2_t)xmmword_19FFB32D0, v28);
    v243 = 0.0;
    -[VKCameraController vkCamera](self, "vkCamera");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    v201 = v18;
    v199 = v20;
    v35 = v18 / (v15 + v15);
    v36 = v20 / (v13 + v13);
    v37 = v22 / (v15 + v15);
    v38 = v209 / (v13 + v13);
    v39 = (float)(v36 - v38);
    v40 = (float)(v37 - v35);
    v41 = v39 + 0.5;
    if (v33)
    {
      objc_msgSend(v33, "groundPointFromScreenPoint:", v39 + 0.5, v40 + 0.5);
    }
    else
    {
      v240 = 0u;
      v241 = 0u;
    }

    if ((_BYTE)v240)
    {
      -[VKCameraController vkCamera](self, "vkCamera");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v203 = v22;
      objc_msgSend(v42, "regionRestriction");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "clampedPosition:", *(_OWORD *)&v242);
      v45 = v44;
      v47 = v46;

      *(double *)v48.i64 = *((double *)&v240 + 1) - v45;
      v49.i64[0] = 1.0;
      v50.f64[0] = NAN;
      v50.f64[1] = NAN;
      *(_QWORD *)&v51 = vbslq_s8((int8x16_t)vnegq_f64(v50), v49, v48).u64[0];
      if (*((double *)&v240 + 1) - v45 != 0.0)
        *(double *)v48.i64 = v51;
      v52 = v45 + *(double *)v48.i64;
      if (*((double *)&v241 + 1) * *((double *)&v241 + 1)
         + (v47 - *(double *)&v241) * (v47 - *(double *)&v241)
         + (v52 - *((double *)&v240 + 1)) * (v52 - *((double *)&v240 + 1)) >= (v47 - *(double *)&v241)
                                                                            * (v47 - *(double *)&v241)
                                                                            + (v45 - *((double *)&v240 + 1))
                                                                            * (v45 - *((double *)&v240 + 1))
                                                                            + *((double *)&v241 + 1)
                                                                            * *((double *)&v241 + 1))
        v53 = v45;
      else
        v53 = v52;
      v207 = v53;
      currentAnimation = self->super._currentAnimation;
      v55 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
      if (!currentAnimation && (v55 & 2) == 0)
      {
        v189 = a4;
        v56 = 0.0;
        goto LABEL_17;
      }
      if ((v55 & 0x12) == 0)
      {
        v189 = a4;
        -[VKTimedAnimation duration](currentAnimation, "duration");
        v58 = v57;
        v59 = *(float *)&self->super._elevationLogic;
        -[VKAnimation stop](self->super._currentAnimation, "stop");
        v56 = v58 * (float)(1.0 - v59);
        v60 = self->super._currentAnimation;
        self->super._currentAnimation = 0;

        v55 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
LABEL_17:
        v186 = v56;
        v193 = v25;
        annotationPresentation = self->super._annotationPresentation;
        if (v6)
          v61 = 16;
        else
          v61 = 0;
        *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v55 & 0xFFEF | v61;
        v62 = -[VKAnnotationTrackingCameraController shouldForceZoomToFit](self, "shouldForceZoomToFit");
        -[VKCameraController vkCamera](self, "vkCamera");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v197 = v41;
        v198 = v40;
        v64 = (double *)objc_msgSend(v63, "position");
        v206 = v47;
        v65 = v47 - *(double *)&v241;
        v66 = *v64;
        v67 = v64[1];
        v68 = v64[2];

        v191 = v67;
        v192 = v66;
        v196 = v68;
        *(double *)&v238 = v207 - *((double *)&v240 + 1) + v66;
        *((double *)&v238 + 1) = v65 + v67;
        v239 = v68 - *((double *)&v241 + 1);
        -[VKCameraController vkCamera](self, "vkCamera");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "screenPointFromGroundPoint:", &v242);
        v71 = (v70 * 0.5 + 0.5) * v13;
        v73 = (0.5 - v72 * 0.5) * v15;

        v245.origin.x = v13 * -16.0;
        v245.origin.y = v15 * -16.0;
        v245.size.width = v13 * 33.0;
        v245.size.height = v15 * 33.0;
        v244.x = v71;
        v244.y = v73;
        -[VKMapAnnotationTrackingCameraController _minTrackingCameraDistance:](self, "_minTrackingCameraDistance:", CGRectContainsPoint(v245, v244));
        v75 = v74;
        v187 = 0.0;
        if ((*(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) & 0x80) != 0)
        {
          -[VKCameraController canvas](self, "canvas");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "size");
          if (v77 <= 0.0)
          {

          }
          else
          {
            -[VKCameraController canvas](self, "canvas");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "size");
            v80 = v79;

            if (v80 > 0.0)
            {
              -[VKTrackableAnnotation accuracy](self->super._annotation, "accuracy");
              v190 = 0;
              v187 = 0.0;
              if (v8 && !v6)
              {
                if (self->super._annotationPresentation)
                {
                  -[VKTrackableAnnotation accuracy](self->super._annotation, "accuracy");
                  v187 = v81;
                  v190 = 1;
                }
                else
                {
                  v190 = 0;
                }
              }
              GEOMapRectMakeWithRadialDistance();
              v161 = v160;
              v163 = v162;
              -[VKCameraController vkCamera](self, "vkCamera");
              v164 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v164, "tanHalfHorizFOV");
              v166 = v165;

              -[VKCameraController vkCamera](self, "vkCamera");
              v167 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v167, "tanHalfVerticalFOV");
              v195 = v168;

              v169 = *MEMORY[0x1E0D266F8];
              v170 = *(double *)(MEMORY[0x1E0D266F8] + 8);
              -[VKCameraController canvas](self, "canvas");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "size");
              v173 = v172;

              -[VKCameraController canvas](self, "canvas");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v174, "size");
              v175 = v161 / v169;
              v176 = v163 / v170;
              v177 = v161 / v169 * 0.5;
              v178 = v163 / v170 * 0.5;
              v179 = v175 - v175 * (float)(v199 + v209) / v173;
              v181 = v176 - v176 * (float)(v201 + v203) / v180;

              v182 = v166 * 0.5 * v179 / v177;
              v183 = v195 * 0.5 * v181 / v178;
              v184 = v177 / v182;
              if (v182 <= 0.0)
                v184 = 0.0;
              if (v183 <= 0.0)
                v185 = 0.0;
              else
                v185 = v178 / v183;
              v75 = fmax(fmax(v184, v185), v75);
LABEL_29:
              -[VKMapAnnotationTrackingCameraController _zoomLevelForCameraPosition:](self, "_zoomLevelForCameraPosition:", v238, v239);
              v83 = v82;
              v84 = v75
                  / sqrt((*(double *)&v238 - v207) * (*(double *)&v238 - v207)+ (*((double *)&v238 + 1) - v206) * (*((double *)&v238 + 1) - v206)+ v239 * v239);
              v85 = v84 * v239;
              v86 = v207 + v84 * (*(double *)&v238 - v207);
              v87 = v206 + v84 * (*((double *)&v238 + 1) - v206);
              -[VKMapAnnotationTrackingCameraController _zoomLevelForCameraPosition:](self, "_zoomLevelForCameraPosition:", v86, v87, v84 * v239);
              if (self->super._behavior.shouldPreserveUserSpecifiedZoomLevel && self->super._hasUserSpecifiedZoomLevel)
              {
                v89 = v83 - v88 > 0.0 && v6;
                v90 = v62 || v89;
                if (v88 >= v83)
                  v90 = v62;
                v91 = fabs(v83 - v88) > 4.5 && v6;
                if (!v91 && (v90 & 1) == 0)
                  goto LABEL_41;
              }
              else if (!v62)
              {
LABEL_41:
                v92 = 0;
LABEL_44:
                -[VKCameraController vkCamera](self, "vkCamera");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = (double *)objc_msgSend(v93, "scaledViewProjectionMatrix");
                v210 = *v94;
                v95 = v94[4];
                v202 = v94[5];
                v204 = v94[1];
                v96 = v94[12];
                v97 = v94[13];
                v200 = v94[3];
                v194 = v94[7];
                v98 = v94[15];

                -[VKCameraController canvas](self, "canvas");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "size");
                v101 = v100;

                -[VKCameraController canvas](self, "canvas");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v102, "size");
                v104 = v103;

                -[VKCameraController canvas](self, "canvas");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v105, "size");
                v107 = v106;
                -[VKCameraController canvas](self, "canvas");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "size");
                v110 = v109;
                v111 = 0.5 / (v98 + v200 * v207 + v194 * v206);
                v112 = v101 * (v111 * (v96 + v210 * v207 + v95 * v206) + 0.5);
                v113 = v104 * -(v111 * (v97 + v204 * v207 + v202 * v206) + -0.5);

                v114 = sqrt((v107 * v197 - v112) * (v107 * v197 - v112)+ -(v113 - v110 * (0.5 - v198)) * -(v113 - v110 * (0.5 - v198)));
                v115 = vabdd_f64(v239, v196);
                v116 = v115 > 0.000000001;
                if (v114 < 0.000001 && v115 <= 0.000000001)
                {
                  *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x10u;
                  goto LABEL_94;
                }
                if (v92)
                {
                  v117 = v193;
                  if (v115 > 0.000000001 || v114 >= 1.5)
                  {
LABEL_53:
                    if (v6)
                    {
                      v118 = v8 ^ 1;
                      if (v114 <= 10000.0)
                        v118 = 1;
                      v8 &= v118;
                    }
                    if (v115 > 0.000000001)
                      -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self, "setHasUserSpecifiedZoomLevel:", 0);
                    v236[0] = MEMORY[0x1E0C809B0];
                    v236[1] = 3221225472;
                    v236[2] = __101__VKMapAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke;
                    v236[3] = &unk_1E42F9F00;
                    v236[4] = self;
                    *(double *)&v236[5] = v117;
                    v236[6] = v212;
                    v237 = v8;
                    v211 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AF5730](v236);
                    if (v8)
                    {
                      if (v189 == -1.0)
                      {
                        -[VKMapAnnotationTrackingCameraController _zoomLevelForCameraPosition:](self, "_zoomLevelForCameraPosition:", v192, v191, v196);
                        v119 = annotationPresentation != 0;
                        v120 = v190;
                        v122 = v121;
                        -[VKMapAnnotationTrackingCameraController _zoomLevelForCameraPosition:](self, "_zoomLevelForCameraPosition:", v238, v239);
                        v124 = fmax(fmin(fmax(vabdd_f64(v122, v123) * 0.166666672, v114 * 0.00156250002), 1.0), 0.200000003);
                      }
                      else
                      {
                        v124 = v186;
                        v119 = annotationPresentation != 0;
                        v120 = v190;
                        if (v186 <= 0.200000003)
                          v124 = fmax(v189, 0.200000003);
                      }
                      -[VKTrackableAnnotationPresentation presentationCoordinate](self->super._annotationPresentation, "presentationCoordinate");
                      v129 = v128;
                      -[VKTrackableAnnotationPresentation presentationCoordinate](self->super._annotationPresentation, "presentationCoordinate");
                      v208 = v130;
                      v131 = tan(v129 * 0.00872664626 + 0.785398163);
                      v132 = log(v131);
                      v133.f64[0] = v208;
                      v133.f64[1] = v132;
                      *(float64x2_t *)self->super._currentAnimationStartPoint._e = vmlaq_f64(v205, (float64x2_t)xmmword_19FFB32D0, v133);
                      self->super._currentAnimationStartPoint._e[2] = 0.0;
                      *(float64x2_t *)self->super._currentAnimationEndPoint._e = v242;
                      self->super._currentAnimationEndPoint._e[2] = v243;
                      self->super._currentAnimationStartCameraPosition._e[0] = v192;
                      self->super._currentAnimationStartCameraPosition._e[1] = v191;
                      self->super._currentAnimationStartCameraPosition._e[2] = v196;
                      *(_OWORD *)self->super._currentAnimationEndCameraPosition._e = v238;
                      self->super._currentAnimationEndCameraPosition._e[2] = v239;
                      if (*(_QWORD *)&self->super._currentAnimationStartCameraPosition._e[0] == *(_QWORD *)&self->super._currentAnimationEndCameraPosition._e[0]
                        && *(_QWORD *)&self->super._currentAnimationStartCameraPosition._e[1] == *(_QWORD *)&self->super._currentAnimationEndCameraPosition._e[1]
                        && *(_QWORD *)&self->super._currentAnimationStartCameraPosition._e[2] == *(_QWORD *)&self->super._currentAnimationEndCameraPosition._e[2])
                      {
                        goto LABEL_93;
                      }
                      -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
                      v136 = self->super._annotationPresentation;
                      v137 = v136;
                      v138 = 0;
                      v139 = 0.0;
                      if (v120)
                      {
                        -[VKTrackableAnnotationPresentation setAnimatingAccuracy:](v136, "setAnimatingAccuracy:", 1);
                        -[VKTrackableAnnotationPresentation presentationAccuracy](self->super._annotationPresentation, "presentationAccuracy");
                        v138 = v140;
                        -[VKCameraController vkCamera](self, "vkCamera");
                        v141 = (void *)objc_claimAutoreleasedReturnValue();
                        v142 = v141;
                        if (v141)
                        {
                          objc_msgSend(v141, "cameraState");
                        }
                        else
                        {
                          v234 = 0u;
                          v235 = 0u;
                          memset(v233, 0, sizeof(v233));
                          *(_OWORD *)location = 0u;
                        }

                        -[VKCameraController vkCamera](self, "vkCamera");
                        v143 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v143, "setPosition:", &v238);

                        -[VKTrackableAnnotationPresentation minimumAccuracy](self->super._annotationPresentation, "minimumAccuracy");
                        if (v187 >= v144)
                        {
                          -[VKCameraController vkCamera](self, "vkCamera");
                          v145 = (void *)objc_claimAutoreleasedReturnValue();
                          -[VKCameraController canvas](self, "canvas");
                          v146 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v146, "size");
                          v139 = _screenPointsForDistance(v145, v147, v148, v187);

                        }
                        -[VKCameraController vkCamera](self, "vkCamera");
                        v149 = (void *)objc_claimAutoreleasedReturnValue();
                        v226 = *(_OWORD *)location;
                        v228 = *(_OWORD *)((char *)v233 + 8);
                        v227 = *(_QWORD *)&v233[0];
                        v229 = *((_QWORD *)&v233[1] + 1);
                        v230 = v234;
                        v231 = v235;
                        objc_msgSend(v149, "setCameraState:", &v226);

                      }
                      BYTE4(self->super._elevationLogic) = v116;
                      v150 = self->super._currentAnimation;
                      if (v150)
                      {
                        -[VKAnimation stop](v150, "stop");
                        v151 = self->super._currentAnimation;
                        self->super._currentAnimation = 0;

                      }
                      v152 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", v124);
                      v153 = self->super._currentAnimation;
                      self->super._currentAnimation = v152;

                      v154 = (uint64_t *)&VKAnimationCurveEaseInOut;
                      if (!v6)
                        v154 = &VKAnimationCurveLinear;
                      v155 = *v154;
                      if (v10)
                        v156 = v10;
                      else
                        v156 = (id)v155;
                      -[VKTimedAnimation setTimingFunction:](self->super._currentAnimation, "setTimingFunction:", v156);
                      objc_initWeak(location, self->super._currentAnimation);
                      objc_initWeak(&from, self);
                      LODWORD(self->super._elevationLogic) = 0;
                      v157 = MEMORY[0x1E0C809B0];
                      v220[0] = MEMORY[0x1E0C809B0];
                      v220[1] = 3221225472;
                      v220[2] = __101__VKMapAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_2;
                      v220[3] = &unk_1E42F9F28;
                      objc_copyWeak(v222, &from);
                      v223 = v119;
                      v224 = v120;
                      v222[1] = v138;
                      v222[2] = *(id *)&v139;
                      v158 = v137;
                      v221 = v158;
                      -[VKTimedAnimation setStepHandler:](self->super._currentAnimation, "setStepHandler:", v220);
                      v213[0] = v157;
                      v213[1] = 3221225472;
                      v213[2] = __101__VKMapAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_3;
                      v213[3] = &unk_1E42F9F50;
                      objc_copyWeak(&v216, &from);
                      v218 = v119;
                      v217[1] = *(id *)&v117;
                      v217[2] = v212;
                      objc_copyWeak(v217, location);
                      v213[4] = self;
                      v159 = v158;
                      v214 = v159;
                      v219 = v6;
                      v215 = v211;
                      -[VKAnimation setCompletionHandler:](self->super._currentAnimation, "setCompletionHandler:", v213);
                      md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._currentAnimation->super);

                      objc_destroyWeak(v217);
                      objc_destroyWeak(&v216);

                      objc_destroyWeak(v222);
                      objc_destroyWeak(&from);
                      objc_destroyWeak(location);

                    }
                    else
                    {
                      *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) |= 0x20u;
                      -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
                      -[VKCameraController vkCamera](self, "vkCamera");
                      v125 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v125, "setPosition:", &v238);

                      *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x10u;
                      if (annotationPresentation)
                      {
                        -[VKTrackableAnnotation coordinate](self->super._annotation, "coordinate");
                        -[VKTrackableAnnotationPresentation setPresentationCoordinate:](self->super._annotationPresentation, "setPresentationCoordinate:");
                      }
                      -[VKCameraController cameraDelegate](self, "cameraDelegate");
                      v126 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v126, "mapLayerDidChangeVisibleRegion");

                      v127 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
                      if (v127)
                      {
                        LOBYTE(location[0]) = 4;
                        md::MapEngine::setNeedsTick(v127, location);
                      }
                      *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x20u;
                      -[VKCameraController endRegionChange](self, "endRegionChange");
                      if (!self->super._annotationPresentation)
                        v211[2](v211, 0);
                    }
                    -[VKMapAnnotationTrackingCameraController updateFramerate](self, "updateFramerate");
LABEL_93:

                    goto LABEL_94;
                  }
                }
                else
                {
                  v117 = v193;
                  if (v114 >= 1.5)
                    goto LABEL_53;
                }
                v8 = 0;
                goto LABEL_53;
              }
              *(double *)&v238 = v86;
              *((double *)&v238 + 1) = v87;
              v92 = 1;
              v239 = v85;
              goto LABEL_44;
            }
          }
        }
        v190 = 0;
        goto LABEL_29;
      }
      *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v55 | 1;
      self->super._pendingChangeDuration = a4;
    }
  }
LABEL_94:

}

- (void)_rotateToHeadingAnimated:(BOOL)a3 duration:(double)a4
{
  __int16 v5;
  VKTimedAnimation *currentHeadingAnimation;
  VKTimedAnimation *v9;
  void *v10;
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
  long double v23;
  long double v24;
  uint64_t v25;
  double v26;
  void (**v27)(_QWORD, double);
  VKTimedAnimation *v28;
  VKTimedAnimation *v29;
  void (**v30)(_QWORD, double);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, int);
  void *v35;
  void (**v36)(_QWORD, double);
  id v37[2];
  _QWORD v38[4];
  id v39;
  id v40[2];
  id location;
  _QWORD v42[5];

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
          -[VKCameraController vkCamera](self, "vkCamera");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "upVector");
          v12 = v11;
          v14 = v13;
          v16 = v15;

          v17 = -1.0;
          v18 = sqrt(-(v16 * v16 + -1.0));
          v19 = -v14 / v18;
          if (v19 > -1.0)
          {
            v17 = 1.0;
            if (v19 < 1.0)
              v17 = -v14 / v18;
          }
          v20 = acos(v17);
          -[VKTrackableAnnotation headingDegrees](self->super._annotation, "headingDegrees");
          v22 = -v20;
          if (v12 <= 0.0)
            v22 = v20;
          v23 = fmod(v22 + 6.28318531 + v21 * -0.0174532925, 6.28318531);
          v24 = fmod(v23 + 6.28318531, 6.28318531);
          v25 = MEMORY[0x1E0C809B0];
          v26 = v24 + -3.14159265;
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __77__VKMapAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke;
          v42[3] = &unk_1E42F9F78;
          v42[4] = self;
          v27 = (void (**)(_QWORD, double))MEMORY[0x1A1AF5730](v42);
          if (a3)
          {
            self->super._headingAnimationCompletedAngle = 0.0;
            v28 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", fmax(a4, 0.200000003));
            v29 = self->super._currentHeadingAnimation;
            self->super._currentHeadingAnimation = v28;

            -[VKTimedAnimation setTimingFunction:](self->super._currentHeadingAnimation, "setTimingFunction:", VKAnimationCurveLinear);
            -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
            objc_initWeak(&location, self);
            v38[0] = v25;
            v38[1] = 3221225472;
            v38[2] = __77__VKMapAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_2;
            v38[3] = &unk_1E42F9FA0;
            objc_copyWeak(v40, &location);
            v40[1] = *(id *)&v26;
            v30 = v27;
            v39 = v30;
            -[VKTimedAnimation setStepHandler:](self->super._currentHeadingAnimation, "setStepHandler:", v38);
            v32 = v25;
            v33 = 3221225472;
            v34 = __77__VKMapAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_3;
            v35 = &unk_1E42F9FC8;
            objc_copyWeak(v37, &location);
            v37[1] = *(id *)&v26;
            v36 = v30;
            -[VKAnimation setCompletionHandler:](self->super._currentHeadingAnimation, "setCompletionHandler:", &v32);
            md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner", v32, v33, v34, v35), &self->super._currentHeadingAnimation->super);

            objc_destroyWeak(v37);
            objc_destroyWeak(v40);
            objc_destroyWeak(&location);
          }
          else
          {
            -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
            v27[2](v27, v26);
            v31 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
            if (v31)
            {
              LOBYTE(location) = 4;
              md::MapEngine::setNeedsTick(v31, &location);
            }
            -[VKCameraController endRegionChange](self, "endRegionChange");
          }
          -[VKMapAnnotationTrackingCameraController updateFramerate](self, "updateFramerate");

        }
      }
    }
  }
}

void __77__VKMapAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke(uint64_t a1, double a2)
{
  void *v4;
  double v5;
  double v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  void *v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  __double2 v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  float64x2_t v32;
  float64x2_t v33;
  int8x16_t v34;
  float64x2_t v35;
  __int128 v36;
  float64x2_t v37;
  int8x16_t v38;
  float64x2_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double *v47;
  double *v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  float64_t v57;
  float64_t v58;
  _OWORD v59[2];
  double v60[3];
  __int128 v61;
  __int128 v62;

  objc_msgSend(*(id *)(a1 + 32), "canvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v57 = v6;
  v58 = v5;

  objc_msgSend(*(id *)(a1 + 32), "_effectiveEdgeInsets");
  v56 = v7;
  v54 = v8;
  v53 = v9;
  v55 = v10;
  objc_msgSend(*(id *)(a1 + 32), "vkCamera");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13.f64[0] = v58;
    v13.f64[1] = v57;
    v14 = vaddq_f64(v13, v13);
    v15 = vcvtq_f64_f32(vsub_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v53, v54)), v14)), vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v56, v55)), v14))));
    __asm { FMOV            V1.2D, #0.5 }
    objc_msgSend(v11, "groundPointFromScreenPoint:", vaddq_f64(v15, _Q1));
  }
  else
  {
    v61 = 0u;
    v62 = 0u;
  }

  if ((_BYTE)v61)
  {
    v21 = __sincos_stret(a2 * 0.5);
    objc_msgSend(*(id *)(a1 + 32), "vkCamera");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "position");
    v24 = *(double *)(v23 + 8);
    v25 = *(double *)(v23 + 16);
    v26 = v21.__sinval * -2.0;
    v27 = v21.__sinval * -2.0 * (v24 - *(double *)&v62);
    v28 = v21.__sinval + v21.__sinval;
    v29 = (v21.__sinval + v21.__sinval) * (*(double *)v23 - *((double *)&v61 + 1));
    v60[0] = *(double *)v23 - v29 * v21.__sinval + v27 * v21.__cosval;
    v60[1] = v24 + v29 * v21.__cosval + v27 * v21.__sinval;
    v60[2] = v25;

    objc_msgSend(*(id *)(a1 + 32), "vkCamera");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "orientation");
    v32 = *(float64x2_t *)(v31 + 16);
    v33 = vmulq_n_f64(*(float64x2_t *)v31, v21.__cosval);
    v34 = (int8x16_t)vmulq_n_f64(*(float64x2_t *)v31, v21.__sinval);
    v35 = (float64x2_t)vextq_s8(v34, v34, 8uLL);
    *(_QWORD *)&v36 = *(_OWORD *)&vsubq_f64(v33, v35);
    *((_QWORD *)&v36 + 1) = *(_QWORD *)&vaddq_f64(v33, v35).f64[1];
    v37 = vmulq_n_f64(v32, v21.__cosval);
    v38 = (int8x16_t)vmulq_n_f64(v32, v21.__sinval);
    v39 = (float64x2_t)vextq_s8(v38, v38, 8uLL);
    *(_QWORD *)&v33.f64[0] = *(_OWORD *)&vaddq_f64(v37, v39);
    v33.f64[1] = vsubq_f64(v37, v39).f64[1];
    v59[0] = v36;
    v59[1] = v33;

    objc_msgSend(*(id *)(a1 + 32), "vkCamera");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setPosition:", v60);

    objc_msgSend(*(id *)(a1 + 32), "vkCamera");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setOrientation:", v59);

    v42 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v42 + 152))
    {
      v43 = *(double *)(v42 + 184);
      v44 = *(double *)(v42 + 192);
      v45 = v26 * (v44 - *(double *)(v42 + 168));
      v46 = v28 * (v43 - *(double *)(v42 + 160));
      *(double *)(v42 + 184) = v43 - v46 * v21.__sinval + v45 * v21.__cosval;
      *(double *)(v42 + 192) = v44 + v46 * v21.__cosval + v45 * v21.__sinval;
      v47 = *(double **)(a1 + 32);
      v48 = v47 + 29;
      v47 += 26;
      v49 = v48[1];
      v50 = v26 * (v49 - v47[1]);
      v51 = v28 * (*v48 - *v47);
      *v48 = *v48 - v51 * v21.__sinval + v50 * v21.__cosval;
      v48[1] = v49 + v51 * v21.__cosval + v50 * v21.__sinval;
      v42 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v42, "cameraDelegate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "mapLayerDidChangeVisibleRegion");

  }
}

void __77__VKMapAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_2(uint64_t a1, float a2)
{
  double v4;
  double v5;
  float *WeakRetained;

  WeakRetained = (float *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(double *)(a1 + 48) * a2;
    v5 = v4 - WeakRetained[70];
    *(float *)&v4 = v4;
    WeakRetained[70] = *(float *)&v4;
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v5);
  }

}

void __77__VKMapAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_3(uint64_t a1, int a2)
{
  float *WeakRetained;
  float v5;
  void *v6;
  float *v7;

  WeakRetained = (float *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    if (a2)
    {
      v5 = *(double *)(a1 + 48) - WeakRetained[70];
      if (v5 > 0.0)
        (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v5);
      v6 = (void *)*((_QWORD *)v7 + 33);
      *((_QWORD *)v7 + 33) = 0;

    }
    objc_msgSend(v7, "endRegionChange");
    objc_msgSend(v7, "updateFramerate");
    WeakRetained = v7;
  }

}

_QWORD *__101__VKMapAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke(uint64_t a1, char a2)
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
    result = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setPresentationCoordinate:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    if ((a2 & 1) == 0)
    {
      result = *(_QWORD **)(a1 + 32);
      if (result[18])
        return (_QWORD *)objc_msgSend(result, "_goToAnnotationAnimated:duration:timingFunction:isInitial:", *(unsigned __int8 *)(a1 + 56), 0, 0, -1.0);
    }
  }
  return result;
}

void __101__VKMapAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_2(uint64_t a1, float a2)
{
  char *WeakRetained;
  id v5;
  double v6;
  void *v7;
  long double v8;
  long double v9;
  long double v10;
  void *v11;
  double v12;
  float64x2_t v13;
  double v14;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    *((float *)WeakRetained + 84) = a2;
    v6 = *((double *)WeakRetained + 25) + (*((double *)WeakRetained + 31) - *((double *)WeakRetained + 25)) * a2;
    v12 = a2;
    v13 = vmlaq_n_f64(*(float64x2_t *)(WeakRetained + 184), vsubq_f64(*(float64x2_t *)(WeakRetained + 232), *(float64x2_t *)(WeakRetained + 184)), a2);
    v14 = v6;
    objc_msgSend(WeakRetained, "vkCamera");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPosition:", &v13);

    if (*(_BYTE *)(a1 + 64))
    {
      v8 = exp((*((double *)v5 + 21) + (*((double *)v5 + 27) - *((double *)v5 + 21)) * v12) * 6.28318531 + -3.14159265);
      v9 = atan(v8) * 114.591559 + -90.0;
      v10 = fmod((*((double *)v5 + 20) + (*((double *)v5 + 26) - *((double *)v5 + 20)) * v12) * 6.28318531, 6.28318531);
      objc_msgSend(*((id *)v5 + 18), "setPresentationCoordinate:", (double)v9, (double)(fmod(v10 + 6.28318531, 6.28318531) * 57.2957795 + -180.0));
    }
    if (*(_BYTE *)(a1 + 65))
      objc_msgSend(*(id *)(a1 + 32), "setPresentationAccuracy:", *(double *)(a1 + 48) + (*(double *)(a1 + 56) - *(double *)(a1 + 48)) * v12);
    objc_msgSend(v5, "cameraDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mapLayerDidChangeVisibleRegion");

  }
}

void __101__VKMapAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_3(uint64_t a1, char a2)
{
  char *WeakRetained;
  void *v5;
  id v6;
  id v7;
  BOOL v8;
  int v9;
  void *v10;
  double *v11;
  char *v12;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v12 = WeakRetained;
    if ((a2 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "vkCamera");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPosition:", v12 + 232);

      if (*(_BYTE *)(a1 + 88))
        objc_msgSend(*((id *)v12 + 18), "setPresentationCoordinate:", *(double *)(a1 + 72), *(double *)(a1 + 80));
      v6 = objc_loadWeakRetained((id *)(a1 + 64));
      v7 = (id)*((_QWORD *)v12 + 19);
      if (!v6 || (v8 = v7 == v6, v7 = v6, v8))
      {
        *((_QWORD *)v12 + 19) = 0;

      }
      v9 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 321) & 1;
    }
    else
    {
      v9 = 0;
    }
    *(_WORD *)(v12 + 321) &= 0xFFEEu;
    v12[340] = 0;
    objc_msgSend(*(id *)(a1 + 40), "setAnimatingAccuracy:", 0);
    objc_msgSend(v12, "endRegionChange");
    if (*(_BYTE *)(a1 + 89))
    {
      objc_msgSend(v12, "cameraDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mapLayerDidFinishInitialTrackingAnimation");

    }
    v11 = (double *)v12;
    if (!*((_QWORD *)v12 + 18))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v11 = (double *)v12;
    }
    if (v9)
      objc_msgSend(v12, "_goToAnnotationAnimated:duration:timingFunction:isInitial:", 1, 0, 0, v11[32]);
    objc_msgSend(v12, "updateFramerate");
    WeakRetained = v12;
  }

}

@end
